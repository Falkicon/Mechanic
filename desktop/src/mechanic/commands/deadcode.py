"""
Dead code detection for WoW addon development.

Comprehensive analysis to find:
- Unused functions (local and global)
- Unused local variables
- Orphaned files (not in TOC/embeds.xml)
- Dead exports (namespace members never accessed externally)
- Unused libraries
- Stale event handlers
- Unused locale strings
- Dead SavedVariables fields
- Unreachable code
- Commented-out code blocks
"""

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pathlib import Path
from pydantic import BaseModel, Field
from typing import Any, Dict, List, Optional, Set, Tuple
from enum import Enum
import re
import time
import xml.etree.ElementTree as ET

from ..config import find_addon_path
from ..lua_analyzer import (
    LuaAnalyzer, TokenScanner, Confidence, FunctionDef, VariableDef,
    WOW_SAFE_PATTERNS
)
from .development import parse_toc_file


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════

class DeadCodeCategory(str, Enum):
    UNUSED_FUNCTION = "unused_function"
    UNUSED_LOCAL = "unused_local"
    ORPHANED_FILE = "orphaned_file"
    DEAD_EXPORT = "dead_export"
    UNUSED_LIBRARY = "unused_library"
    STALE_EVENT = "stale_event"
    UNUSED_LOCALE = "unused_locale"
    DEAD_SV_FIELD = "dead_sv_field"
    UNREACHABLE_CODE = "unreachable_code"
    COMMENTED_CODE = "commented_code"


class DeadCodeIssue(BaseModel):
    category: str = Field(..., description="Category of dead code")
    confidence: str = Field(..., description="Confidence level: definite, likely, suspicious")
    file: str = Field(..., description="File path relative to addon")
    line: int = Field(0, description="Line number (0 if not applicable)")
    name: str = Field(..., description="Name of dead symbol/file")
    message: str = Field(..., description="Human-readable description")
    suggestion: Optional[str] = Field(None, description="Suggested fix")


class DeadCodeSummary(BaseModel):
    total: int = 0
    by_category: Dict[str, int] = Field(default_factory=dict)
    by_confidence: Dict[str, int] = Field(default_factory=dict)


class DeadCodeInput(BaseModel):
    addon: str = Field(..., description="Name of the addon to analyze")
    path: Optional[str] = Field(None, description="Override path to addon folder")
    categories: Optional[List[str]] = Field(
        None, description="Specific categories to check (default: all)"
    )
    include_suspicious: bool = Field(
        True, description="Include lower-confidence findings"
    )


class DeadCodeResult(BaseModel):
    addon: str
    files_analyzed: int = 0
    issues: List[DeadCodeIssue] = []
    summary: DeadCodeSummary = Field(default_factory=DeadCodeSummary)
    analysis_time_ms: float = 0.0


# ═══════════════════════════════════════════════════════════════════════════════
# FILE LOADING
# ═══════════════════════════════════════════════════════════════════════════════

def get_loaded_files(addon_path: Path, addon_name: str) -> Set[Path]:
    """Get all files loaded by the addon via TOC and embeds.xml."""
    loaded = set()

    # Find and parse TOC file
    toc_files = list(addon_path.glob("*.toc"))
    main_toc = None
    for toc in toc_files:
        if toc.stem == addon_name or toc.stem == addon_name.lstrip('!'):
            main_toc = toc
            break
    if not main_toc and toc_files:
        main_toc = toc_files[0]

    if not main_toc:
        return loaded

    parsed = parse_toc_file(main_toc)

    # Add files from TOC
    for file_info in parsed.get('files', []):
        file_path = addon_path / file_info['path']
        loaded.add(file_path.resolve())

        # If it's an XML file, parse it for includes
        if file_path.suffix.lower() == '.xml' and file_path.exists():
            loaded.update(parse_xml_includes(file_path, addon_path))

    return loaded


def parse_xml_includes(xml_path: Path, addon_path: Path) -> Set[Path]:
    """Parse an XML file for Script and Include tags."""
    included = set()

    try:
        tree = ET.parse(xml_path)
        root = tree.getroot()

        # Handle namespace
        ns = {'ui': 'http://www.blizzard.com/wow/ui/'}

        # Find Script tags
        for script in root.iter():
            if script.tag.endswith('Script') or script.tag.endswith('Include'):
                file_attr = script.get('file')
                if file_attr:
                    # Resolve relative to the XML file's directory
                    script_path = xml_path.parent / file_attr
                    if script_path.exists():
                        included.add(script_path.resolve())

                        # Recursively parse included XML files
                        if script_path.suffix.lower() == '.xml':
                            included.update(parse_xml_includes(script_path, addon_path))

    except Exception:
        pass  # Skip unparseable XML

    return included


def is_library_under_development(addon_path: Path, addon_name: str) -> bool:
    """Check if this addon is a library under active development.

    Returns True only if the addon is listed as "local" in another addon's libs.json.
    This distinguishes libraries we're developing (like FenCore) from regular addons
    (like Flightsim) that happen to be in the same _dev_ directory.

    For libraries under development, we want to analyze ALL their code including
    any test harnesses in their own Libs folder. For regular addons, we skip the
    embedded Libs folder (third-party dependencies).
    """
    addon_parent = addon_path.parent

    # Check all sibling addons for libs.json that references this as "local"
    for sibling in addon_parent.iterdir():
        if not sibling.is_dir() or sibling == addon_path:
            continue

        # Check libs.json in Libs folder first, then root
        libs_json_paths = [
            sibling / "Libs" / "libs.json",
            sibling / "libs.json"
        ]

        for libs_json in libs_json_paths:
            if not libs_json.exists():
                continue
            try:
                import json
                with open(libs_json) as f:
                    config = json.load(f)
                    include = config.get('include', {})
                    if isinstance(include, dict):
                        for lib_name, lib_config in include.items():
                            if isinstance(lib_config, dict) and lib_config.get('source') == 'local':
                                # Check if this lib name matches our addon
                                if lib_name == addon_name or lib_name.lower() == addon_name.lower():
                                    return True
            except Exception:
                pass

    return False


def get_all_lua_files(addon_path: Path, addon_name: str = "") -> Set[Path]:
    """Get all Lua files in the addon, excluding embedded Libs folder.

    If the addon itself is a library under development, analyze all files.
    Otherwise, skip files in Libs/ subdirectories (embedded dependencies).
    """
    lua_files = set()

    # Check if this addon is a library under development
    is_dev_library = is_library_under_development(addon_path, addon_name)

    for lua_file in addon_path.rglob("*.lua"):
        rel_path = lua_file.relative_to(addon_path)
        parts = rel_path.parts

        # If this is a dev library, analyze everything
        if is_dev_library:
            lua_files.add(lua_file.resolve())
            continue

        # Otherwise, skip embedded Libs folders
        if 'Libs' in parts or 'libs' in parts:
            continue
        lua_files.add(lua_file.resolve())

    return lua_files


# ═══════════════════════════════════════════════════════════════════════════════
# DETECTION FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════

def find_orphaned_files(
    addon_path: Path,
    addon_name: str
) -> List[DeadCodeIssue]:
    """Find Lua files not loaded by TOC or embeds.xml."""
    issues = []

    loaded_files = get_loaded_files(addon_path, addon_name)
    all_files = get_all_lua_files(addon_path, addon_name)

    for lua_file in all_files:
        if lua_file not in loaded_files:
            rel_path = lua_file.relative_to(addon_path)

            # Skip test files
            if '_spec.lua' in str(rel_path) or 'test' in str(rel_path).lower():
                continue

            issues.append(DeadCodeIssue(
                category=DeadCodeCategory.ORPHANED_FILE.value,
                confidence=Confidence.DEFINITE.value,
                file=str(rel_path),
                line=0,
                name=str(rel_path),
                message=f"File '{rel_path}' is not loaded by TOC or embeds.xml",
                suggestion="Add to .toc file or remove if unused"
            ))

    return issues


def find_unused_functions(
    analyzer: LuaAnalyzer,
    addon_path: Path
) -> List[DeadCodeIssue]:
    """Find functions that are defined but never called."""
    issues = []

    for func, confidence in analyzer.get_unused_functions():
        rel_path = Path(func.file).relative_to(addon_path)

        # Determine if this is a local or exported function
        if func.is_local:
            message = f"Local function '{func.name}' is never called"
            suggestion = "Remove the function or add a call to it"
        elif func.namespace:
            message = f"Method '{func.name}' appears to be unused"
            suggestion = "Verify it's not called dynamically"
        else:
            message = f"Global function '{func.name}' is never called"
            suggestion = "Make local or remove if unused"

        issues.append(DeadCodeIssue(
            category=DeadCodeCategory.UNUSED_FUNCTION.value,
            confidence=confidence.value,
            file=str(rel_path),
            line=func.line,
            name=func.name,
            message=message,
            suggestion=suggestion
        ))

    return issues


def find_unused_locals(
    analyzer: LuaAnalyzer,
    addon_path: Path
) -> List[DeadCodeIssue]:
    """Find local variables that are never read."""
    issues = []

    for var, confidence in analyzer.get_unused_variables():
        rel_path = Path(var.file).relative_to(addon_path)

        # Skip common patterns
        if var.name.startswith('_'):
            continue  # Convention for intentionally unused

        issues.append(DeadCodeIssue(
            category=DeadCodeCategory.UNUSED_LOCAL.value,
            confidence=confidence.value,
            file=str(rel_path),
            line=var.line,
            name=var.name,
            message=f"Local variable '{var.name}' is assigned but never read",
            suggestion="Remove assignment or use the variable"
        ))

    return issues


def find_unused_libraries(
    addon_path: Path,
    addon_name: str,
    analyzer: LuaAnalyzer
) -> List[DeadCodeIssue]:
    """Find libraries loaded in TOC/embeds.xml but never used."""
    issues = []

    # Get libraries declared in the addon
    libs_path = addon_path / "Libs"
    if not libs_path.exists():
        return issues

    # Find libraries by looking at folder names or XML files
    declared_libs = set()

    # Check for libs.json
    libs_json = addon_path / "libs.json"
    if libs_json.exists():
        try:
            import json
            with open(libs_json) as f:
                config = json.load(f)
                if 'include' in config:
                    declared_libs.update(config['include'])
                elif 'exclude' in config:
                    # Exclude mode - all libs except these
                    for lib_folder in libs_path.iterdir():
                        if lib_folder.is_dir() and lib_folder.name not in config['exclude']:
                            declared_libs.add(lib_folder.name)
        except Exception:
            pass

    # Also check embeds.xml for library references
    embeds_xml = addon_path / "embeds.xml"
    if embeds_xml.exists():
        try:
            tree = ET.parse(embeds_xml)
            root = tree.getroot()
            for script in root.iter():
                if script.tag.endswith('Script') or script.tag.endswith('Include'):
                    file_attr = script.get('file', '')
                    if 'Libs' in file_attr or 'libs' in file_attr:
                        # Extract library name from path
                        parts = file_attr.split('/')
                        for i, part in enumerate(parts):
                            if part.lower() == 'libs' and i + 1 < len(parts):
                                declared_libs.add(parts[i + 1])
                                break
        except Exception:
            pass

    # Check which libraries are actually used
    used_libs = analyzer.symbols.library_usages

    # Find unused libraries
    for lib_name in declared_libs:
        # Normalize library name for comparison
        lib_base = lib_name.split('-')[0]  # e.g., "AceAddon-3.0" -> "AceAddon"

        is_used = any(
            lib_base.lower() in used_lib.lower() or
            lib_name.lower() in used_lib.lower()
            for used_lib in used_libs
        )

        if not is_used:
            issues.append(DeadCodeIssue(
                category=DeadCodeCategory.UNUSED_LIBRARY.value,
                confidence=Confidence.LIKELY.value,
                file="Libs/" + lib_name,
                line=0,
                name=lib_name,
                message=f"Library '{lib_name}' is loaded but never referenced via LibStub",
                suggestion="Remove from libs.json/embeds.xml if not needed"
            ))

    return issues


def find_unused_locale_strings(
    addon_path: Path,
    analyzer: LuaAnalyzer
) -> List[DeadCodeIssue]:
    """Find locale strings defined but never used."""
    issues = []

    # Get all definitions from Locales folder
    locales_path = addon_path / "Locales"
    if not locales_path.exists():
        return issues

    # Parse enUS.lua as the baseline
    enus_path = locales_path / "enUS.lua"
    if not enus_path.exists():
        return issues

    try:
        content = enus_path.read_text(encoding='utf-8', errors='replace')
        scanner = TokenScanner()
        definitions, _ = scanner.scan_locales(content)
    except Exception:
        return issues

    # Find unused definitions
    for key in definitions:
        if key not in analyzer.symbols.locale_usages:
            issues.append(DeadCodeIssue(
                category=DeadCodeCategory.UNUSED_LOCALE.value,
                confidence=Confidence.DEFINITE.value,
                file="Locales/enUS.lua",
                line=0,
                name=f'L["{key}"]',
                message=f"Locale string '{key}' is defined but never used in code",
                suggestion="Remove from locale files if not needed"
            ))

    return issues


def find_unreachable_code(
    addon_path: Path,
    files_to_analyze: List[Path]
) -> List[DeadCodeIssue]:
    """Find code after return statements within same scope."""
    issues = []

    for lua_file in files_to_analyze:
        try:
            content = lua_file.read_text(encoding='utf-8', errors='replace')
            lines = content.splitlines()
            rel_path = lua_file.relative_to(addon_path)

            in_function = 0
            last_return_line = None

            for line_num, line in enumerate(lines, 1):
                stripped = line.strip()

                # Skip comments
                if stripped.startswith('--'):
                    continue

                # Track function scope
                if re.search(r'\bfunction\b', stripped):
                    in_function += 1
                    last_return_line = None

                if re.search(r'\bend\b', stripped):
                    in_function = max(0, in_function - 1)
                    last_return_line = None

                # Check for return statement
                if re.search(r'\breturn\b', stripped) and in_function > 0:
                    # Check if return is the last thing before end
                    last_return_line = line_num

                # If we have code after return (before end)
                if last_return_line and stripped and not stripped.startswith('end'):
                    # This line is after return and not an end
                    if not re.search(r'\breturn\b', stripped):
                        issues.append(DeadCodeIssue(
                            category=DeadCodeCategory.UNREACHABLE_CODE.value,
                            confidence=Confidence.DEFINITE.value,
                            file=str(rel_path),
                            line=line_num,
                            name=f"Line {line_num}",
                            message=f"Code after return statement is unreachable",
                            suggestion="Remove unreachable code"
                        ))
                        last_return_line = None

        except Exception:
            continue

    return issues


def find_commented_code_blocks(
    addon_path: Path,
    files_to_analyze: List[Path]
) -> List[DeadCodeIssue]:
    """Find large blocks of commented-out code."""
    issues = []

    # Patterns that indicate commented code vs documentation
    code_patterns = [
        r'\bfunction\b',
        r'\blocal\b',
        r'\bif\b.*\bthen\b',
        r'\bfor\b.*\bdo\b',
        r'\bwhile\b.*\bdo\b',
        r'\breturn\b',
        r'\bend\b',
        r'=\s*function',
        r':(\w+)\(',
        r'\belse\b',
        r'\belseif\b',
    ]

    for lua_file in files_to_analyze:
        try:
            content = lua_file.read_text(encoding='utf-8', errors='replace')
            lines = content.splitlines()
            rel_path = lua_file.relative_to(addon_path)

            consecutive_code_comments = 0
            block_start = 0

            for line_num, line in enumerate(lines, 1):
                stripped = line.strip()

                if stripped.startswith('--') and not stripped.startswith('--[['):
                    # Check if comment contains code patterns
                    comment_content = stripped[2:].strip()
                    has_code = any(re.search(p, comment_content) for p in code_patterns)

                    if has_code:
                        if consecutive_code_comments == 0:
                            block_start = line_num
                        consecutive_code_comments += 1
                else:
                    # End of comment block
                    if consecutive_code_comments >= 5:
                        issues.append(DeadCodeIssue(
                            category=DeadCodeCategory.COMMENTED_CODE.value,
                            confidence=Confidence.SUSPICIOUS.value,
                            file=str(rel_path),
                            line=block_start,
                            name=f"Lines {block_start}-{block_start + consecutive_code_comments - 1}",
                            message=f"Block of {consecutive_code_comments} commented-out code lines",
                            suggestion="Delete if no longer needed"
                        ))
                    consecutive_code_comments = 0

            # Check for block at end of file
            if consecutive_code_comments >= 5:
                issues.append(DeadCodeIssue(
                    category=DeadCodeCategory.COMMENTED_CODE.value,
                    confidence=Confidence.SUSPICIOUS.value,
                    file=str(rel_path),
                    line=block_start,
                    name=f"Lines {block_start}-{block_start + consecutive_code_comments - 1}",
                    message=f"Block of {consecutive_code_comments} commented-out code lines at end of file",
                    suggestion="Delete if no longer needed"
                ))

        except Exception:
            continue

    return issues


def find_dead_exports(
    analyzer: LuaAnalyzer,
    addon_path: Path,
    addon_name: str
) -> List[DeadCodeIssue]:
    """Find exports to addon namespace that are never accessed externally."""
    issues = []

    # Build a map of namespace.member definitions
    namespace_exports: Dict[str, Tuple[str, int]] = {}  # member -> (file, line)

    for key, func in analyzer.symbols.functions.items():
        if func.namespace and func.namespace == addon_name:
            # This is an export to the addon namespace
            if ':' in func.name:
                _, member = func.name.split(':', 1)
            else:
                _, member = func.name.rsplit('.', 1)
            namespace_exports[member] = (func.file, func.line)

    # Check which exports are used
    for member, (file_path, line) in namespace_exports.items():
        # Skip safe patterns
        if member in WOW_SAFE_PATTERNS:
            continue

        # Check if member is accessed
        is_accessed = member in analyzer.symbols.member_accesses

        if not is_accessed:
            rel_path = Path(file_path).relative_to(addon_path)
            issues.append(DeadCodeIssue(
                category=DeadCodeCategory.DEAD_EXPORT.value,
                confidence=Confidence.LIKELY.value,
                file=str(rel_path),
                line=line,
                name=f"{addon_name}.{member}",
                message=f"Export '{addon_name}.{member}' appears to be unused externally",
                suggestion="Make local if only used internally"
            ))

    return issues


def find_stale_event_handlers(
    addon_path: Path,
    analyzer: LuaAnalyzer,
    files_content: Dict[Path, str]
) -> List[DeadCodeIssue]:
    """Find event registrations with empty/trivial handlers."""
    issues = []

    for event_reg in analyzer.symbols.registered_events:
        # Look for the OnEvent handler in the same file
        file_path = Path(event_reg.file)
        if file_path not in files_content:
            continue

        content = files_content[file_path]

        # Check for empty handler pattern
        # Pattern: function ... OnEvent ... end with only comments/whitespace
        onevent_pattern = re.compile(
            r'function\s+\w+[:.]\s*OnEvent\s*\([^)]*\)\s*(--[^\n]*)?\s*end',
            re.MULTILINE
        )

        if onevent_pattern.search(content):
            rel_path = file_path.relative_to(addon_path)
            issues.append(DeadCodeIssue(
                category=DeadCodeCategory.STALE_EVENT.value,
                confidence=Confidence.LIKELY.value,
                file=str(rel_path),
                line=event_reg.line,
                name=event_reg.event,
                message=f"Event '{event_reg.event}' is registered but OnEvent handler appears empty",
                suggestion="Remove event registration or implement handler"
            ))

    return issues


# ═══════════════════════════════════════════════════════════════════════════════
# MAIN ANALYSIS FUNCTION
# ═══════════════════════════════════════════════════════════════════════════════

def analyze_addon(addon_path: Path, addon_name: str, input: DeadCodeInput) -> DeadCodeResult:
    """Run comprehensive dead code analysis on an addon."""
    start_time = time.time()

    # Get files to analyze
    all_lua_files = list(get_all_lua_files(addon_path, addon_name))
    loaded_files = get_loaded_files(addon_path, addon_name)

    # Create analyzer and scan all files
    analyzer = LuaAnalyzer(addon_name)
    files_content: Dict[Path, str] = {}

    for lua_file in all_lua_files:
        try:
            content = lua_file.read_text(encoding='utf-8', errors='replace')
            files_content[lua_file] = content
            analyzer.analyze_file(lua_file, content)
        except Exception:
            continue

    # Collect issues from all detectors
    all_issues: List[DeadCodeIssue] = []
    categories = input.categories or [c.value for c in DeadCodeCategory]

    # Run each detector based on requested categories
    if DeadCodeCategory.ORPHANED_FILE.value in categories:
        all_issues.extend(find_orphaned_files(addon_path, addon_name))

    if DeadCodeCategory.UNUSED_FUNCTION.value in categories:
        all_issues.extend(find_unused_functions(analyzer, addon_path))

    if DeadCodeCategory.UNUSED_LOCAL.value in categories:
        all_issues.extend(find_unused_locals(analyzer, addon_path))

    if DeadCodeCategory.UNUSED_LIBRARY.value in categories:
        all_issues.extend(find_unused_libraries(addon_path, addon_name, analyzer))

    if DeadCodeCategory.UNUSED_LOCALE.value in categories:
        all_issues.extend(find_unused_locale_strings(addon_path, analyzer))

    if DeadCodeCategory.UNREACHABLE_CODE.value in categories:
        all_issues.extend(find_unreachable_code(addon_path, all_lua_files))

    if DeadCodeCategory.COMMENTED_CODE.value in categories:
        all_issues.extend(find_commented_code_blocks(addon_path, all_lua_files))

    if DeadCodeCategory.DEAD_EXPORT.value in categories:
        all_issues.extend(find_dead_exports(analyzer, addon_path, addon_name))

    if DeadCodeCategory.STALE_EVENT.value in categories:
        all_issues.extend(find_stale_event_handlers(addon_path, analyzer, files_content))

    # Filter by confidence if requested
    if not input.include_suspicious:
        all_issues = [i for i in all_issues if i.confidence != Confidence.SUSPICIOUS.value]

    # Build summary
    summary = DeadCodeSummary(total=len(all_issues))
    for issue in all_issues:
        summary.by_category[issue.category] = summary.by_category.get(issue.category, 0) + 1
        summary.by_confidence[issue.confidence] = summary.by_confidence.get(issue.confidence, 0) + 1

    analysis_time = (time.time() - start_time) * 1000

    return DeadCodeResult(
        addon=addon_name,
        files_analyzed=len(all_lua_files),
        issues=all_issues[:100],  # Limit to 100 issues
        summary=summary,
        analysis_time_ms=round(analysis_time, 2)
    )


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND REGISTRATION
# ═══════════════════════════════════════════════════════════════════════════════

def register_commands(server):
    """Register dead code detection commands with the AFD server."""

    @server.command(
        name="addon.deadcode",
        description="Detect dead code in a WoW addon (unused functions, orphaned files, etc.)",
        input_schema=DeadCodeInput,
        output_schema=DeadCodeResult,
    )
    async def detect_deadcode(input: DeadCodeInput, context: Any = None) -> CommandResult[DeadCodeResult]:
        addon_path = find_addon_path(input.addon, input.path)

        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found in development directories",
                suggestion="Check the addon name or provide an explicit path with the 'path' parameter"
            )

        result = analyze_addon(addon_path, input.addon, input)

        src = create_source(
            type="analysis",
            id=f"deadcode-{input.addon}",
            title=f"Dead Code Analysis: {input.addon}",
            location=str(addon_path)
        )

        # Build reasoning summary
        if result.summary.total == 0:
            reasoning = f"No dead code found in {input.addon} ({result.files_analyzed} files analyzed)"
        else:
            parts = []
            for cat, count in sorted(result.summary.by_category.items(), key=lambda x: -x[1]):
                parts.append(f"{count} {cat.replace('_', ' ')}")
            reasoning = f"Found {result.summary.total} issues in {input.addon}: {', '.join(parts[:3])}"
            if len(parts) > 3:
                reasoning += f" (+{len(parts) - 3} more categories)"

        return success(
            data=result,
            reasoning=reasoning,
            sources=[src],
            confidence=0.9
        )

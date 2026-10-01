"""
Dead code detection for WoW addon development.

Built on the Lua tokenizer and identifier-reference analysis. Finds:
- Unused functions (local, global and methods)
- Unused local variables
- Orphaned files (not loaded by any TOC or XML include)
- Dead exports (namespace members only referenced in their own file)
- Unused libraries
- Stale event handlers
- Unused locale strings
- Unreachable code (statements after return/break in the same block)
- Commented-out code blocks
"""

import asyncio
import json
import re
import time
import xml.etree.ElementTree as ET
from enum import Enum
from pathlib import Path
from typing import Any, Dict, List, Optional, Set

from afd import CommandResult, error, success
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

from ..analysis_common import (
    DEFAULT_ISSUE_LIMIT,
    MAX_ISSUE_LIMIT,
    SourceCache,
    count_by,
    describe_findings,
    find_main_toc,
    finalize_issues,
    iter_files,
    iter_lua_files,
    relative_display,
    unknown_categories,
)
from ..config import find_addon_path
from ..lua_analyzer import Confidence, LuaAnalyzer, WOW_SAFE_PATTERNS
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
    UNREACHABLE_CODE = "unreachable_code"
    COMMENTED_CODE = "commented_code"


# Order used to rank issues of equal confidence
CATEGORY_PRIORITY = [
    "orphaned_file",
    "unreachable_code",
    "unused_function",
    "unused_library",
    "unused_locale",
    "stale_event",
    "dead_export",
    "unused_local",
    "commented_code",
]


class DeadCodeIssue(BaseModel):
    category: str = Field(..., description="Category of dead code")
    confidence: str = Field(
        ..., description="Confidence level: definite, likely, suspicious"
    )
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
    limit: int = Field(
        DEFAULT_ISSUE_LIMIT,
        ge=1,
        le=MAX_ISSUE_LIMIT,
        description="Maximum issues returned, most severe first (counts cover all issues)",
    )


class DeadCodeResult(BaseModel):
    addon: str
    files_analyzed: int = 0
    issues: List[DeadCodeIssue] = []
    summary: DeadCodeSummary = Field(default_factory=DeadCodeSummary)
    analysis_time_ms: float = 0.0
    truncated: bool = False
    total_issues: int = 0
    read_errors: List[str] = []


# ═══════════════════════════════════════════════════════════════════════════════
# FILE LOADING
# ═══════════════════════════════════════════════════════════════════════════════


def _normalize(path_text: str) -> str:
    """TOC and XML paths use backslashes; make them valid on any platform."""
    return path_text.strip().replace("\\", "/")


def get_loaded_files(addon_path: Path, addon_name: str) -> Set[Path]:
    """All files loaded by the addon through any of its TOC files and XML includes.

    Every ``*.toc`` is read (for example ``Addon_Mainline.toc`` and
    ``Addon_Vanilla.toc``), so a file loaded by only one client flavor is not
    reported as orphaned.
    """
    loaded: Set[Path] = set()

    main_toc = find_main_toc(addon_path, addon_name)
    toc_files = sorted(addon_path.glob("*.toc"))
    if main_toc is not None and main_toc not in toc_files:
        toc_files.append(main_toc)

    for toc in toc_files:
        parsed = parse_toc_file(toc)
        for file_info in parsed.get("files", []):
            file_path = addon_path / _normalize(file_info["path"])
            loaded.add(file_path.resolve())
            if file_path.suffix.lower() == ".xml" and file_path.exists():
                loaded.update(parse_xml_includes(file_path, addon_path))

    return loaded


def parse_xml_includes(
    xml_path: Path, addon_path: Path, _seen: Optional[Set[Path]] = None
) -> Set[Path]:
    """Parse an XML file for Script and Include tags (recursively)."""
    included: Set[Path] = set()
    seen = _seen if _seen is not None else set()
    if xml_path.resolve() in seen:
        return included
    seen.add(xml_path.resolve())

    try:
        root = ET.parse(xml_path).getroot()
    except (ET.ParseError, OSError):
        return included  # Skip unparseable XML

    for node in root.iter():
        if not (node.tag.endswith("Script") or node.tag.endswith("Include")):
            continue
        file_attr = node.get("file")
        if not file_attr:
            continue
        script_path = xml_path.parent / _normalize(file_attr)
        if script_path.exists():
            included.add(script_path.resolve())
            if script_path.suffix.lower() == ".xml":
                included.update(parse_xml_includes(script_path, addon_path, seen))

    return included


def is_library_under_development(addon_path: Path, addon_name: str) -> bool:
    """Check if this addon is a library under active development.

    Returns True only if the addon is listed as "local" in another addon's libs.json.
    This distinguishes libraries we're developing (like FenCore) from regular addons
    that happen to be in the same _dev_ directory.

    For libraries under development, we want to analyze ALL their code including
    any test harnesses in their own Libs folder. For regular addons, we skip the
    embedded Libs folder (third-party dependencies).
    """
    addon_parent = addon_path.parent

    try:
        siblings = list(addon_parent.iterdir())
    except OSError:
        return False

    for sibling in siblings:
        if not sibling.is_dir() or sibling == addon_path:
            continue

        for libs_json in (sibling / "Libs" / "libs.json", sibling / "libs.json"):
            if not libs_json.exists():
                continue
            try:
                config = json.loads(libs_json.read_text(encoding="utf-8"))
            except (OSError, ValueError):
                continue
            include = config.get("include", {}) if isinstance(config, dict) else {}
            if not isinstance(include, dict):
                continue
            for lib_name, lib_config in include.items():
                if (
                    isinstance(lib_config, dict)
                    and lib_config.get("source") == "local"
                    and lib_name.lower() == addon_name.lower()
                ):
                    return True

    return False


def get_all_lua_files(addon_path: Path, addon_name: str = "") -> Set[Path]:
    """Get all Lua files in the addon, excluding embedded Libs folders.

    If the addon itself is a library under development, analyze all files.
    Otherwise, skip files in Libs/Lib subdirectories (embedded dependencies).
    """
    include_libs = is_library_under_development(addon_path, addon_name)
    return {f.resolve() for f in iter_lua_files(addon_path, include_libs)}


# ═══════════════════════════════════════════════════════════════════════════════
# DETECTION FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════

_TEST_DIRS = {"test", "tests", "spec", "specs", "__tests__"}
_TEST_FILE = re.compile(r"(?:_|\.)(?:spec|test)\.lua$", re.IGNORECASE)


def _is_test_file(rel_path: Path) -> bool:
    if any(part.lower() in _TEST_DIRS for part in rel_path.parts[:-1]):
        return True
    return bool(_TEST_FILE.search(rel_path.name))


def find_orphaned_files(addon_path: Path, addon_name: str) -> List[DeadCodeIssue]:
    """Find Lua files not loaded by any TOC or XML include."""
    issues = []

    loaded_files = get_loaded_files(addon_path, addon_name)
    include_libs = is_library_under_development(addon_path, addon_name)

    for lua_file in iter_lua_files(addon_path, include_libs):
        if lua_file.resolve() in loaded_files:
            continue
        rel_path = lua_file.relative_to(addon_path)
        if _is_test_file(rel_path):
            continue

        issues.append(
            DeadCodeIssue(
                category=DeadCodeCategory.ORPHANED_FILE.value,
                confidence=Confidence.DEFINITE.value,
                file=str(rel_path),
                line=0,
                name=str(rel_path),
                message=f"File '{rel_path}' is not loaded by any TOC or XML include",
                suggestion="Add to .toc file or remove if unused",
            )
        )

    return issues


def find_unused_functions(
    analyzer: LuaAnalyzer, addon_path: Path
) -> List[DeadCodeIssue]:
    """Find functions that are defined but never referenced."""
    issues = []

    for func, confidence in analyzer.get_unused_functions():
        rel_path = relative_display(Path(func.file), addon_path)

        if func.is_local:
            message = f"Local function '{func.name}' is never referenced"
            suggestion = "Remove the function or add a call to it"
        elif func.namespace:
            message = f"Method '{func.name}' appears to be unused"
            suggestion = "Verify it's not called dynamically"
        else:
            message = f"Global function '{func.name}' is never referenced"
            suggestion = "Make local or remove if unused"

        issues.append(
            DeadCodeIssue(
                category=DeadCodeCategory.UNUSED_FUNCTION.value,
                confidence=confidence.value,
                file=rel_path,
                line=func.line,
                name=func.name,
                message=message,
                suggestion=suggestion,
            )
        )

    return issues


def find_unused_locals(analyzer: LuaAnalyzer, addon_path: Path) -> List[DeadCodeIssue]:
    """Find local variables that are never read."""
    issues = []

    for var, confidence in analyzer.get_unused_variables():
        issues.append(
            DeadCodeIssue(
                category=DeadCodeCategory.UNUSED_LOCAL.value,
                confidence=confidence.value,
                file=relative_display(Path(var.file), addon_path),
                line=var.line,
                name=var.name,
                message=f"Local variable '{var.name}' is assigned but never read",
                suggestion="Remove assignment or use the variable",
            )
        )

    return issues


_LIB_NAME = re.compile(r"LibStub\s*[(:]\s*(?:\w+\s*\(\s*)?[\"']([^\"']+)[\"']")


def _declared_libraries(addon_path: Path) -> Set[str]:
    declared: Set[str] = set()
    libs_path = addon_path / "Libs"
    if not libs_path.exists():
        return declared

    for libs_json in (addon_path / "libs.json", libs_path / "libs.json"):
        if not libs_json.exists():
            continue
        try:
            config = json.loads(libs_json.read_text(encoding="utf-8"))
        except (OSError, ValueError):
            continue
        if not isinstance(config, dict):
            continue
        if "include" in config:
            declared.update(config["include"])
        elif "exclude" in config:
            excluded = config["exclude"]
            for lib_folder in libs_path.iterdir():
                if lib_folder.is_dir() and lib_folder.name not in excluded:
                    declared.add(lib_folder.name)

    xml_files = [addon_path / "embeds.xml"] + sorted(libs_path.glob("*.xml"))
    for xml_file in xml_files:
        if not xml_file.exists():
            continue
        try:
            root = ET.parse(xml_file).getroot()
        except (ET.ParseError, OSError):
            continue
        for node in root.iter():
            if node.tag.endswith("Script") or node.tag.endswith("Include"):
                parts = _normalize(node.get("file", "")).split("/")
                lowered = [p.lower() for p in parts]
                if "libs" in lowered and lowered.index("libs") + 1 < len(parts):
                    declared.add(parts[lowered.index("libs") + 1])
                elif xml_file.parent == libs_path and len(parts) > 1:
                    declared.add(parts[0])
    return {name for name in declared if name and name != "LibStub"}


def _library_dependencies(addon_path: Path, lib_name: str) -> Set[str]:
    """Libraries referenced by the embedded source of ``lib_name``."""
    deps: Set[str] = set()
    folder = addon_path / "Libs" / lib_name
    if not folder.is_dir():
        return deps
    for lua_file in folder.rglob("*.lua"):
        try:
            text = lua_file.read_text(encoding="utf-8", errors="replace")
        except OSError:
            continue
        deps.update(_LIB_NAME.findall(text))
    return deps


def find_unused_libraries(
    addon_path: Path, addon_name: str, analyzer: LuaAnalyzer
) -> List[DeadCodeIssue]:
    """Find libraries loaded in libs.json/embeds.xml but never used."""
    issues = []

    declared_libs = _declared_libraries(addon_path)
    if not declared_libs:
        return issues

    def normalize(name: str) -> str:
        return name.lower()

    def base(name: str) -> str:
        return name.split("-")[0].lower()

    used: Set[str] = set(analyzer.symbols.library_usages)
    # Libraries a used library pulls in (for example CallbackHandler via AceEvent)
    queue = list(used)
    while queue:
        current = queue.pop()
        for lib in declared_libs:
            if normalize(lib) == normalize(current) or base(lib) == base(current):
                for dep in _library_dependencies(addon_path, lib):
                    if dep not in used:
                        used.add(dep)
                        queue.append(dep)

    used_exact = {normalize(u) for u in used}
    used_bases = {base(u) for u in used}

    for lib_name in sorted(declared_libs):
        if normalize(lib_name) in used_exact or base(lib_name) in used_bases:
            continue
        if analyzer.is_name_read(lib_name) or analyzer.is_name_read(
            lib_name.split("-")[0]
        ):
            continue  # used through the library's global table
        issues.append(
            DeadCodeIssue(
                category=DeadCodeCategory.UNUSED_LIBRARY.value,
                confidence=Confidence.LIKELY.value,
                file="Libs/" + lib_name,
                line=0,
                name=lib_name,
                message=f"Library '{lib_name}' is loaded but never referenced via LibStub or as a mixin",
                suggestion="Remove from libs.json/embeds.xml if not needed",
            )
        )

    return issues


def find_unused_locale_strings(
    addon_path: Path, analyzer: LuaAnalyzer, cache: Optional[SourceCache] = None
) -> List[DeadCodeIssue]:
    """Find locale strings defined in enUS.lua but never used in code."""
    issues = []

    enus_path = addon_path / "Locales" / "enUS.lua"
    if not enus_path.exists():
        return issues

    cache = cache or SourceCache(addon_path)
    parsed = cache.parse(enus_path)
    if parsed is None:
        return issues

    symbols = analyzer.symbols
    for key, line in parsed.locale_defs.items():
        if key in symbols.locale_usages:
            continue
        if any(key.startswith(prefix) for prefix in symbols.locale_prefixes):
            continue  # L["PREFIX_" .. name] may use it
        confidence = (
            Confidence.SUSPICIOUS if symbols.locale_dynamic else Confidence.DEFINITE
        )
        issues.append(
            DeadCodeIssue(
                category=DeadCodeCategory.UNUSED_LOCALE.value,
                confidence=confidence.value,
                file="Locales/enUS.lua",
                line=line,
                name=f'L["{key}"]',
                message=f"Locale string '{key}' is defined but never used in code"
                + (" (dynamic L[...] lookups exist)" if symbols.locale_dynamic else ""),
                suggestion="Remove from locale files if not needed",
            )
        )

    return issues


def find_unreachable_code(
    addon_path: Path,
    files_to_analyze: List[Path],
    cache: Optional[SourceCache] = None,
) -> List[DeadCodeIssue]:
    """Find statements that follow a return/break in the same block."""
    issues = []
    cache = cache or SourceCache(addon_path)

    for lua_file in files_to_analyze:
        parsed = cache.parse(lua_file)
        if parsed is None:
            continue
        rel_path = relative_display(lua_file, addon_path)
        for item in parsed.unreachable:
            issues.append(
                DeadCodeIssue(
                    category=DeadCodeCategory.UNREACHABLE_CODE.value,
                    confidence=Confidence.DEFINITE.value,
                    file=rel_path,
                    line=item.line,
                    name=f"Line {item.line}",
                    message=f"Code after {item.terminator} statement (line {item.terminator_line}) is unreachable",
                    suggestion="Remove unreachable code",
                )
            )

    return issues


_COMMENTED_CODE = re.compile(
    r"^(?:local\s+\w|function\b|if\b.+\bthen\b|elseif\b|else\s*$|for\b.+\bdo\b"
    r"|while\b.+\bdo\b|repeat\s*$|until\b|return\b|end\b|break\s*$"
    r"|[A-Za-z_][\w.:\[\]\"']*\s*=[^=]|[A-Za-z_][\w.:]*\s*\()"
)
_MIN_COMMENTED_LINES = 5


def _looks_like_code(text: str) -> bool:
    return bool(_COMMENTED_CODE.match(text.strip()))


def find_commented_code_blocks(
    addon_path: Path,
    files_to_analyze: List[Path],
    cache: Optional[SourceCache] = None,
) -> List[DeadCodeIssue]:
    """Find large blocks of commented-out code (line comments and block comments)."""
    issues = []
    cache = cache or SourceCache(addon_path)

    def report(rel_path: str, first: int, last: int, count: int) -> None:
        issues.append(
            DeadCodeIssue(
                category=DeadCodeCategory.COMMENTED_CODE.value,
                confidence=Confidence.SUSPICIOUS.value,
                file=rel_path,
                line=first,
                name=f"Lines {first}-{last}",
                message=f"Block of {count} commented-out code lines",
                suggestion="Delete if no longer needed",
            )
        )

    for lua_file in files_to_analyze:
        parsed = cache.parse(lua_file)
        if parsed is None:
            continue
        rel_path = relative_display(lua_file, addon_path)

        # A run is consecutive line comments holding code; prose or a gap ends it.
        run = {"first": 0, "last": 0, "count": 0, "prev": 0}

        def flush() -> None:
            if run["count"] >= _MIN_COMMENTED_LINES:
                report(rel_path, run["first"], run["last"], run["count"])
            run.update(first=0, last=0, count=0)

        for comment in parsed.comments:
            if comment.is_block:
                count = sum(1 for t in comment.text.splitlines() if _looks_like_code(t))
                if count >= _MIN_COMMENTED_LINES:
                    report(rel_path, comment.line, comment.end_line, count)
                continue
            if comment.trailing:
                continue
            if run["prev"] and comment.line != run["prev"] + 1:
                flush()
            run["prev"] = comment.line
            text = comment.text.strip()
            if _looks_like_code(text):
                run["first"] = run["first"] or comment.line
                run["last"] = comment.line
                run["count"] += 1
            elif text:
                flush()  # prose ends the run
        flush()

    return issues


_LIFECYCLE_SUFFIXES = ("Callback", "Handler", "Hook")


def find_dead_exports(
    analyzer: LuaAnalyzer, addon_path: Path, addon_name: str
) -> List[DeadCodeIssue]:
    """Find addon-namespace members that are only referenced in their own file.

    Members that are never referenced at all are reported as unused functions, so
    they are not repeated here.
    """
    issues = []
    namespaces = {addon_name, addon_name.lstrip("!"), "ns"}

    for func in analyzer.symbols.functions.values():
        if func.namespace not in namespaces:
            continue
        member = func.name.replace(":", ".").rsplit(".", 1)[-1]
        if member in WOW_SAFE_PATTERNS or member.endswith(_LIFECYCLE_SUFFIXES):
            continue
        if analyzer.is_dispatched(member):
            continue
        files = analyzer.member_reference_files(member)
        if not files or files - {func.file}:
            continue  # unreferenced (reported elsewhere) or used from another file

        confidence = Confidence.SUSPICIOUS if func.is_method else Confidence.LIKELY
        issues.append(
            DeadCodeIssue(
                category=DeadCodeCategory.DEAD_EXPORT.value,
                confidence=confidence.value,
                file=relative_display(Path(func.file), addon_path),
                line=func.line,
                name=f"{func.namespace}.{member}",
                message=f"Export '{func.namespace}.{member}' is only referenced in its own file",
                suggestion="Make local if only used internally",
            )
        )

    return issues


def find_stale_event_handlers(
    addon_path: Path, analyzer: LuaAnalyzer, cache: Optional[SourceCache] = None
) -> List[DeadCodeIssue]:
    """Find event registrations in files whose OnEvent handler body is empty."""
    issues = []
    cache = cache or SourceCache(addon_path)
    empty_by_file: Dict[str, bool] = {}

    for event_reg in analyzer.symbols.registered_events:
        if event_reg.file not in empty_by_file:
            parsed = cache.parse(Path(event_reg.file))
            empty_by_file[event_reg.file] = bool(
                parsed
                and any(
                    f.named
                    and f.body_empty
                    and f.name.replace(":", ".").rsplit(".", 1)[-1] == "OnEvent"
                    for f in parsed.functions
                )
            )
        if not empty_by_file[event_reg.file]:
            continue
        issues.append(
            DeadCodeIssue(
                category=DeadCodeCategory.STALE_EVENT.value,
                confidence=Confidence.LIKELY.value,
                file=relative_display(Path(event_reg.file), addon_path),
                line=event_reg.line,
                name=event_reg.event,
                message=f"Event '{event_reg.event}' is registered but OnEvent handler is empty",
                suggestion="Remove event registration or implement handler",
            )
        )

    return issues


_XML_FUNCTION_ATTR = re.compile(r"\b(?:function|mixin|secureMixin)\s*=\s*\"([^\"]+)\"")
_XML_SCRIPT_BODY = re.compile(r"<(Script|On\w+)\b[^>]*>(.*?)</\1>", re.DOTALL)


def _add_xml_references(
    analyzer: LuaAnalyzer, addon_path: Path, cache: SourceCache, include_libs: bool
) -> None:
    """XML handlers (``<OnLoad function="Name"/>``, inline scripts) reference Lua code."""
    names: Set[str] = set()
    for xml_file in iter_files(addon_path, (".xml",), include_libs):
        text = cache.read(xml_file)
        if not text:
            continue
        for value in _XML_FUNCTION_ATTR.findall(text):
            for part in value.split(","):
                part = part.strip()
                if part:
                    names.add(part)
                    names.add(re.split(r"[.:]", part)[-1])
        for _tag, body in _XML_SCRIPT_BODY.findall(text):
            if body.strip():
                analyzer.analyze_file(xml_file, body)
    analyzer.add_external_references(names)


# ═══════════════════════════════════════════════════════════════════════════════
# MAIN ANALYSIS FUNCTION
# ═══════════════════════════════════════════════════════════════════════════════


def analyze_addon(
    addon_path: Path, addon_name: str, input: DeadCodeInput
) -> DeadCodeResult:
    """Run comprehensive dead code analysis on an addon."""
    start_time = time.time()
    addon_path = Path(addon_path).resolve()

    cache = SourceCache(addon_path)
    include_libs = is_library_under_development(addon_path, addon_name)
    all_lua_files = cache.readable(iter_lua_files(addon_path, include_libs))

    analyzer = LuaAnalyzer(addon_name)
    for lua_file in all_lua_files:
        analyzer.analyze_file(
            lua_file, cache.read(lua_file) or "", cache.parse(lua_file)
        )
    _add_xml_references(analyzer, addon_path, cache, include_libs)

    all_issues: List[DeadCodeIssue] = []
    categories = input.categories or [c.value for c in DeadCodeCategory]

    if DeadCodeCategory.ORPHANED_FILE.value in categories:
        all_issues.extend(find_orphaned_files(addon_path, addon_name))

    if DeadCodeCategory.UNUSED_FUNCTION.value in categories:
        all_issues.extend(find_unused_functions(analyzer, addon_path))

    if DeadCodeCategory.UNUSED_LOCAL.value in categories:
        all_issues.extend(find_unused_locals(analyzer, addon_path))

    if DeadCodeCategory.UNUSED_LIBRARY.value in categories:
        all_issues.extend(find_unused_libraries(addon_path, addon_name, analyzer))

    if DeadCodeCategory.UNUSED_LOCALE.value in categories:
        all_issues.extend(find_unused_locale_strings(addon_path, analyzer, cache))

    if DeadCodeCategory.UNREACHABLE_CODE.value in categories:
        all_issues.extend(find_unreachable_code(addon_path, all_lua_files, cache))

    if DeadCodeCategory.COMMENTED_CODE.value in categories:
        all_issues.extend(find_commented_code_blocks(addon_path, all_lua_files, cache))

    if DeadCodeCategory.DEAD_EXPORT.value in categories:
        all_issues.extend(find_dead_exports(analyzer, addon_path, addon_name))

    if DeadCodeCategory.STALE_EVENT.value in categories:
        all_issues.extend(find_stale_event_handlers(addon_path, analyzer, cache))

    if not input.include_suspicious:
        all_issues = [
            i for i in all_issues if i.confidence != Confidence.SUSPICIOUS.value
        ]

    by_category, by_confidence = count_by(all_issues)
    summary = DeadCodeSummary(
        total=len(all_issues), by_category=by_category, by_confidence=by_confidence
    )
    kept, truncated, total = finalize_issues(all_issues, input.limit, CATEGORY_PRIORITY)

    return DeadCodeResult(
        addon=addon_name,
        files_analyzed=len(all_lua_files),
        issues=kept,
        summary=summary,
        analysis_time_ms=round((time.time() - start_time) * 1000, 2),
        truncated=truncated,
        total_issues=total,
        read_errors=cache.errors,
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
    async def detect_deadcode(
        input: DeadCodeInput, context: Any = None
    ) -> CommandResult[DeadCodeResult]:
        bad = unknown_categories(input.categories, DeadCodeCategory)
        if bad:
            return error(
                code="INVALID_CATEGORY",
                message=f"Unknown dead code categories: {', '.join(bad)}",
                suggestion="Valid categories: "
                + ", ".join(c.value for c in DeadCodeCategory),
            )

        addon_path = find_addon_path(input.addon, input.path)

        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found in development directories",
                suggestion="Check the addon name or provide an explicit path with the 'path' parameter",
            )

        result = await asyncio.to_thread(analyze_addon, addon_path, input.addon, input)

        src = create_source(
            type="analysis",
            id=f"deadcode-{input.addon}",
            title=f"Dead Code Analysis: {input.addon}",
            location=str(addon_path),
        )

        extra = ""
        if result.truncated:
            extra = f". Showing the {len(result.issues)} most severe of {result.total_issues}"
        reasoning = describe_findings(
            "issues",
            input.addon,
            result.summary.total,
            result.summary.by_category,
            result.files_analyzed,
            extra=extra,
        )
        if result.summary.total == 0:
            reasoning = f"No dead code found in {input.addon} ({result.files_analyzed} files analyzed)"

        return success(data=result, reasoning=reasoning, sources=[src], confidence=0.9)

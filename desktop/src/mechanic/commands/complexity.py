"""
Code complexity analysis for WoW addon development.

Detects maintainability issues:
- Deep nesting (excessive if/for/while nesting)
- Long functions (functions too long to understand)
- Long files (files that should be split)
- Magic numbers (unexplained numeric literals)
- Duplicate code (near-identical code blocks)
"""

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pathlib import Path
from pydantic import BaseModel, Field
from typing import Any, Dict, List, Optional, Tuple
from enum import Enum
from collections import defaultdict
import re
import time
import hashlib

from ..config import find_addon_path
from ..lua_analyzer import Confidence


# ═══════════════════════════════════════════════════════════════════════════════
# THRESHOLDS
# ═══════════════════════════════════════════════════════════════════════════════

class Thresholds:
    """Configurable thresholds for complexity detection."""
    MAX_NESTING_DEPTH = 5       # Maximum if/for/while nesting
    MAX_FUNCTION_LINES = 100    # Maximum lines per function
    MAX_FILE_LINES = 500        # Maximum lines per file (excluding libs)
    MAGIC_NUMBER_MIN = 10       # Ignore small numbers (0-9 are often OK)
    DUPLICATE_MIN_LINES = 10    # Minimum lines for duplicate detection
    DUPLICATE_SIMILARITY = 0.9  # 90% similarity for duplicate detection


# Magic numbers that are commonly acceptable
ACCEPTABLE_MAGIC_NUMBERS = {
    # Common mathematical/logical values
    0, 1, 2, -1, 100, 1000, 0.5,
    # WoW-specific common values
    64, 128, 256, 512, 1024,  # Power of 2
    360, 180, 90, 45,  # Degrees
    255,  # Color component max
    # Time values
    60, 3600, 86400,  # Seconds
}


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════

class ComplexityCategory(str, Enum):
    DEEP_NESTING = "deep_nesting"
    LONG_FUNCTION = "long_function"
    LONG_FILE = "long_file"
    MAGIC_NUMBER = "magic_number"
    DUPLICATE_CODE = "duplicate_code"


class ComplexityIssue(BaseModel):
    category: str = Field(..., description="Category of complexity issue")
    confidence: str = Field(..., description="Confidence level")
    file: str = Field(..., description="File path relative to addon")
    line: int = Field(..., description="Line number")
    name: str = Field(..., description="Function/file name or description")
    value: int = Field(..., description="Measured complexity value")
    threshold: int = Field(..., description="Threshold that was exceeded")
    message: str = Field(..., description="Human-readable description")
    suggestion: str = Field(..., description="Suggested fix")


class ComplexitySummary(BaseModel):
    total: int = 0
    by_category: Dict[str, int] = Field(default_factory=dict)
    worst_nesting: int = 0
    longest_function: int = 0
    longest_file: int = 0


class ComplexityInput(BaseModel):
    addon: str = Field(..., description="Name of the addon to analyze")
    path: Optional[str] = Field(None, description="Override path to addon folder")
    categories: Optional[List[str]] = Field(
        None, description="Specific categories to check (default: all)"
    )
    max_nesting: int = Field(
        Thresholds.MAX_NESTING_DEPTH,
        description="Maximum allowed nesting depth"
    )
    max_function_lines: int = Field(
        Thresholds.MAX_FUNCTION_LINES,
        description="Maximum lines per function"
    )
    max_file_lines: int = Field(
        Thresholds.MAX_FILE_LINES,
        description="Maximum lines per file"
    )


class ComplexityResult(BaseModel):
    addon: str
    files_analyzed: int = 0
    issues: List[ComplexityIssue] = []
    summary: ComplexitySummary = Field(default_factory=ComplexitySummary)
    analysis_time_ms: float = 0.0


# ═══════════════════════════════════════════════════════════════════════════════
# DETECTION FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════

def analyze_nesting_depth(content: str) -> List[Tuple[int, int, int]]:
    """
    Analyze nesting depth in Lua code.
    Returns list of (line_number, depth, max_depth_in_block).
    """
    lines = content.splitlines()
    depth_info = []

    current_depth = 0
    max_depth = 0

    # Keywords that increase nesting
    increase_patterns = [
        r'\bif\b.*\bthen\b',
        r'\bfor\b.*\bdo\b',
        r'\bwhile\b.*\bdo\b',
        r'\brepeat\b',
        r'\bfunction\b.*\)',
    ]

    # Keywords that decrease nesting
    decrease_patterns = [
        r'^\s*end\b',
        r'^\s*until\b',
    ]

    # elseif doesn't change depth, else doesn't change depth
    neutral_patterns = [
        r'\belseif\b',
        r'\belse\b',
    ]

    for line_num, line in enumerate(lines, 1):
        stripped = line.strip()

        # Skip comments
        if stripped.startswith('--'):
            depth_info.append((line_num, current_depth, max_depth))
            continue

        # Check for depth changes
        increases = 0
        decreases = 0

        for pattern in increase_patterns:
            if re.search(pattern, line):
                increases += 1

        for pattern in decrease_patterns:
            if re.search(pattern, line):
                decreases += 1

        # Apply changes
        current_depth += increases
        max_depth = max(max_depth, current_depth)
        current_depth -= decreases
        current_depth = max(0, current_depth)  # Don't go negative

        depth_info.append((line_num, current_depth, max_depth))

    return depth_info


def find_deep_nesting(
    addon_path: Path,
    lua_files: List[Path],
    max_depth: int
) -> List[ComplexityIssue]:
    """Find code with excessive nesting depth."""
    issues = []

    for lua_file in lua_files:
        try:
            content = lua_file.read_text(encoding='utf-8', errors='replace')
            rel_path = lua_file.relative_to(addon_path)

            depth_info = analyze_nesting_depth(content)

            # Find lines that exceed threshold
            reported_blocks = set()  # Track block start lines to avoid duplicates

            for line_num, depth, _ in depth_info:
                if depth > max_depth:
                    # Find the block start (look backwards for function)
                    lines = content.splitlines()
                    block_start = line_num
                    for i in range(line_num - 1, max(0, line_num - 50), -1):
                        if 'function' in lines[i - 1]:
                            block_start = i
                            break

                    if block_start not in reported_blocks:
                        reported_blocks.add(block_start)

                        issues.append(ComplexityIssue(
                            category=ComplexityCategory.DEEP_NESTING.value,
                            confidence=Confidence.DEFINITE.value,
                            file=str(rel_path),
                            line=line_num,
                            name=f"Block at line {block_start}",
                            value=depth,
                            threshold=max_depth,
                            message=f"Nesting depth of {depth} exceeds maximum of {max_depth}",
                            suggestion="Extract nested logic into separate functions"
                        ))

        except Exception:
            continue

    return issues


def find_long_functions(
    addon_path: Path,
    lua_files: List[Path],
    max_lines: int
) -> List[ComplexityIssue]:
    """Find functions that are too long."""
    issues = []

    for lua_file in lua_files:
        try:
            content = lua_file.read_text(encoding='utf-8', errors='replace')
            lines = content.splitlines()
            rel_path = lua_file.relative_to(addon_path)

            # Track function boundaries
            func_stack = []  # Stack of (name, start_line)

            for line_num, line in enumerate(lines, 1):
                stripped = line.strip()

                # Skip comments
                if stripped.startswith('--'):
                    continue

                # Detect function start
                func_match = re.search(r'function\s+([\w.:]+)\s*\(', line)
                if func_match:
                    func_name = func_match.group(1)
                    func_stack.append((func_name, line_num))
                elif re.search(r'function\s*\(', line):
                    # Anonymous function
                    func_stack.append(('anonymous', line_num))
                elif re.search(r'(\w+)\s*=\s*function\s*\(', line):
                    # Variable assignment
                    var_match = re.search(r'(\w+)\s*=\s*function', line)
                    if var_match:
                        func_stack.append((var_match.group(1), line_num))

                # Detect function end
                if stripped == 'end' or stripped.startswith('end,') or stripped.startswith('end)'):
                    if func_stack:
                        func_name, start_line = func_stack.pop()
                        func_length = line_num - start_line

                        if func_length > max_lines:
                            issues.append(ComplexityIssue(
                                category=ComplexityCategory.LONG_FUNCTION.value,
                                confidence=Confidence.DEFINITE.value,
                                file=str(rel_path),
                                line=start_line,
                                name=func_name,
                                value=func_length,
                                threshold=max_lines,
                                message=f"Function '{func_name}' is {func_length} lines (max {max_lines})",
                                suggestion="Break into smaller functions with clear responsibilities"
                            ))

        except Exception:
            continue

    return issues


def find_long_files(
    addon_path: Path,
    lua_files: List[Path],
    max_lines: int
) -> List[ComplexityIssue]:
    """Find files that are too long."""
    issues = []

    for lua_file in lua_files:
        try:
            content = lua_file.read_text(encoding='utf-8', errors='replace')
            line_count = len(content.splitlines())
            rel_path = lua_file.relative_to(addon_path)

            if line_count > max_lines:
                issues.append(ComplexityIssue(
                    category=ComplexityCategory.LONG_FILE.value,
                    confidence=Confidence.DEFINITE.value,
                    file=str(rel_path),
                    line=1,
                    name=str(rel_path),
                    value=line_count,
                    threshold=max_lines,
                    message=f"File has {line_count} lines (max {max_lines})",
                    suggestion="Split into multiple files by logical component"
                ))

        except Exception:
            continue

    return issues


def find_magic_numbers(
    addon_path: Path,
    lua_files: List[Path]
) -> List[ComplexityIssue]:
    """Find unexplained magic numbers in code."""
    issues = []

    # Pattern for numbers (including decimals and negatives)
    number_pattern = re.compile(r'(?<!["\'\w])(-?\d+\.?\d*)(?!["\'\w])')

    for lua_file in lua_files:
        try:
            content = lua_file.read_text(encoding='utf-8', errors='replace')
            lines = content.splitlines()
            rel_path = lua_file.relative_to(addon_path)

            for line_num, line in enumerate(lines, 1):
                stripped = line.strip()

                # Skip comments
                if stripped.startswith('--'):
                    continue

                # Skip constant definitions (these are explaining the number)
                if re.match(r'^(local\s+)?[A-Z_]+\s*=', stripped):
                    continue

                # Skip table index patterns like [1], [2]
                if re.search(r'\[\d+\]', line):
                    continue

                # Find numbers
                for match in number_pattern.finditer(line):
                    try:
                        num_str = match.group(1)
                        num = float(num_str)

                        # Skip acceptable numbers
                        if num in ACCEPTABLE_MAGIC_NUMBERS:
                            continue

                        # Skip small numbers
                        if abs(num) < Thresholds.MAGIC_NUMBER_MIN:
                            continue

                        # Skip if it looks like a color hex (0xFFFFFF pattern nearby)
                        if '0x' in line:
                            continue

                        # Skip version numbers
                        if re.search(r'\d+\.\d+\.\d+', line):
                            continue

                        issues.append(ComplexityIssue(
                            category=ComplexityCategory.MAGIC_NUMBER.value,
                            confidence=Confidence.SUSPICIOUS.value,
                            file=str(rel_path),
                            line=line_num,
                            name=f"Number {num_str}",
                            value=int(abs(num)),
                            threshold=Thresholds.MAGIC_NUMBER_MIN,
                            message=f"Magic number {num_str} should be a named constant",
                            suggestion=f"Define as: local DESCRIPTIVE_NAME = {num_str}"
                        ))

                    except ValueError:
                        continue

        except Exception:
            continue

    # Limit magic number issues (they can be noisy)
    return issues[:20]


def find_duplicate_code(
    addon_path: Path,
    lua_files: List[Path]
) -> List[ComplexityIssue]:
    """Find duplicate code blocks across files."""
    issues = []

    # Build fingerprints of code blocks
    block_hashes: Dict[str, List[Tuple[Path, int, str]]] = defaultdict(list)

    for lua_file in lua_files:
        try:
            content = lua_file.read_text(encoding='utf-8', errors='replace')
            lines = content.splitlines()

            # Slide a window of MIN_LINES across the file
            for start in range(len(lines) - Thresholds.DUPLICATE_MIN_LINES):
                block = lines[start:start + Thresholds.DUPLICATE_MIN_LINES]

                # Normalize: strip whitespace, remove comments
                normalized = []
                for line in block:
                    stripped = line.strip()
                    if stripped and not stripped.startswith('--'):
                        normalized.append(stripped)

                if len(normalized) < Thresholds.DUPLICATE_MIN_LINES // 2:
                    continue  # Too many comments/blanks

                # Create hash
                block_text = '\n'.join(normalized)
                block_hash = hashlib.md5(block_text.encode()).hexdigest()

                block_hashes[block_hash].append((lua_file, start + 1, normalized[0][:40]))

        except Exception:
            continue

    # Find duplicates
    reported = set()  # Avoid duplicate reports

    for block_hash, locations in block_hashes.items():
        if len(locations) > 1:
            # Group by file to report cross-file duplicates
            by_file = defaultdict(list)
            for path, line, preview in locations:
                by_file[path].append((line, preview))

            if len(by_file) > 1:
                # Cross-file duplicate
                files = list(by_file.keys())
                first_file = files[0]
                first_line = by_file[first_file][0][0]
                preview = by_file[first_file][0][1]

                report_key = f"{first_file}:{first_line}"
                if report_key not in reported:
                    reported.add(report_key)

                    other_files = [str(f.relative_to(addon_path)) for f in files[1:]]

                    issues.append(ComplexityIssue(
                        category=ComplexityCategory.DUPLICATE_CODE.value,
                        confidence=Confidence.LIKELY.value,
                        file=str(first_file.relative_to(addon_path)),
                        line=first_line,
                        name=f"Code block: {preview}...",
                        value=len(locations),
                        threshold=1,
                        message=f"Code block duplicated in {len(locations)} locations: {', '.join(other_files[:2])}",
                        suggestion="Extract into a shared function"
                    ))

    return issues[:10]  # Limit duplicate reports


# ═══════════════════════════════════════════════════════════════════════════════
# MAIN ANALYSIS
# ═══════════════════════════════════════════════════════════════════════════════

def analyze_addon(addon_path: Path, addon_name: str, input: ComplexityInput) -> ComplexityResult:
    """Run comprehensive complexity analysis on an addon."""
    start_time = time.time()

    # Get all Lua files (excluding Libs)
    lua_files = []
    for lua_file in addon_path.rglob("*.lua"):
        rel_path = lua_file.relative_to(addon_path)
        parts = rel_path.parts
        if 'Libs' not in parts and 'libs' not in parts:
            lua_files.append(lua_file)

    # Collect issues from all detectors
    all_issues: List[ComplexityIssue] = []
    categories = input.categories or [c.value for c in ComplexityCategory]

    summary = ComplexitySummary()

    if ComplexityCategory.DEEP_NESTING.value in categories:
        nesting_issues = find_deep_nesting(addon_path, lua_files, input.max_nesting)
        all_issues.extend(nesting_issues)
        if nesting_issues:
            summary.worst_nesting = max(i.value for i in nesting_issues)

    if ComplexityCategory.LONG_FUNCTION.value in categories:
        function_issues = find_long_functions(addon_path, lua_files, input.max_function_lines)
        all_issues.extend(function_issues)
        if function_issues:
            summary.longest_function = max(i.value for i in function_issues)

    if ComplexityCategory.LONG_FILE.value in categories:
        file_issues = find_long_files(addon_path, lua_files, input.max_file_lines)
        all_issues.extend(file_issues)
        if file_issues:
            summary.longest_file = max(i.value for i in file_issues)

    if ComplexityCategory.MAGIC_NUMBER.value in categories:
        all_issues.extend(find_magic_numbers(addon_path, lua_files))

    if ComplexityCategory.DUPLICATE_CODE.value in categories:
        all_issues.extend(find_duplicate_code(addon_path, lua_files))

    # Build summary
    summary.total = len(all_issues)
    for issue in all_issues:
        summary.by_category[issue.category] = summary.by_category.get(issue.category, 0) + 1

    analysis_time = (time.time() - start_time) * 1000

    return ComplexityResult(
        addon=addon_name,
        files_analyzed=len(lua_files),
        issues=all_issues[:100],  # Limit to 100 issues
        summary=summary,
        analysis_time_ms=round(analysis_time, 2)
    )


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND REGISTRATION
# ═══════════════════════════════════════════════════════════════════════════════

def register_commands(server):
    """Register complexity analysis commands with the AFD server."""

    @server.command(
        name="addon.complexity",
        description="Detect code complexity issues in a WoW addon (nesting, long functions, magic numbers)",
        input_schema=ComplexityInput,
        output_schema=ComplexityResult,
    )
    async def analyze_complexity(input: ComplexityInput, context: Any = None) -> CommandResult[ComplexityResult]:
        addon_path = find_addon_path(input.addon, input.path)

        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found in development directories",
                suggestion="Check the addon name or provide an explicit path"
            )

        result = analyze_addon(addon_path, input.addon, input)

        src = create_source(
            type="analysis",
            id=f"complexity-{input.addon}",
            title=f"Complexity Analysis: {input.addon}",
            location=str(addon_path)
        )

        # Build reasoning summary
        if result.summary.total == 0:
            reasoning = f"No complexity issues found in {input.addon} ({result.files_analyzed} files analyzed)"
        else:
            parts = []
            for cat, count in sorted(result.summary.by_category.items(), key=lambda x: -x[1]):
                parts.append(f"{count} {cat.replace('_', ' ')}")
            reasoning = f"Found {result.summary.total} complexity issues in {input.addon}: {', '.join(parts[:3])}"

            # Add worst case info
            if result.summary.worst_nesting > 0:
                reasoning += f". Worst nesting: {result.summary.worst_nesting} levels"
            if result.summary.longest_function > 0:
                reasoning += f". Longest function: {result.summary.longest_function} lines"

        return success(
            data=result,
            reasoning=reasoning,
            sources=[src],
            confidence=0.9
        )

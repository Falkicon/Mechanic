"""
Code complexity analysis for WoW addon development.

Detects maintainability issues using the Lua tokenizer and block structure:
- Deep nesting (true block depth; ``if x then return end`` does not accumulate)
- Long functions (measured from the ``function`` keyword to its matching ``end``)
- Long files (files that should be split)
- Magic numbers (unexplained numeric literals)
- Duplicate code (identical code blocks across files, comments ignored)
"""

import asyncio
import hashlib
import time
from collections import defaultdict
from enum import Enum
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

from afd import CommandResult, error, success
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

from ..analysis_common import (
    DEFAULT_ISSUE_LIMIT,
    MAX_ISSUE_LIMIT,
    SourceCache,
    count_by,
    describe_findings,
    finalize_issues,
    iter_lua_files,
    relative_display,
    unknown_categories,
)
from ..config import find_addon_path
from ..lua_analyzer import Confidence
from ..lua_structure import parse_lua
from ..lua_tokenizer import KEYWORD, NAME, NUMBER, OP

# ═══════════════════════════════════════════════════════════════════════════════
# THRESHOLDS
# ═══════════════════════════════════════════════════════════════════════════════


class Thresholds:
    """Configurable thresholds for complexity detection."""

    MAX_NESTING_DEPTH = 5  # Maximum nested blocks inside a function
    MAX_FUNCTION_LINES = 100  # Maximum lines per function
    MAX_FILE_LINES = 500  # Maximum lines per file (excluding libs)
    MAGIC_NUMBER_MIN = 10  # Ignore small numbers (0-9 are often OK)
    DUPLICATE_MIN_LINES = 10  # Minimum code lines for duplicate detection


# Magic numbers that are commonly acceptable (values below MAGIC_NUMBER_MIN are
# ignored separately)
ACCEPTABLE_MAGIC_NUMBERS = {
    # Common mathematical/logical values
    100,
    1000,
    # WoW-specific common values
    64,
    128,
    256,
    512,
    1024,  # Power of 2
    360,
    180,
    90,
    45,  # Degrees
    255,  # Color component max
    # Time values
    60,
    3600,
    86400,  # Seconds
}

CATEGORY_PRIORITY = [
    "long_function",
    "deep_nesting",
    "duplicate_code",
    "long_file",
    "magic_number",
]


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
        Thresholds.MAX_NESTING_DEPTH, ge=1, description="Maximum allowed nesting depth"
    )
    max_function_lines: int = Field(
        Thresholds.MAX_FUNCTION_LINES, ge=1, description="Maximum lines per function"
    )
    max_file_lines: int = Field(
        Thresholds.MAX_FILE_LINES, ge=1, description="Maximum lines per file"
    )
    limit: int = Field(
        DEFAULT_ISSUE_LIMIT,
        ge=1,
        le=MAX_ISSUE_LIMIT,
        description="Maximum issues returned, most severe first (counts cover all issues)",
    )


class ComplexityResult(BaseModel):
    addon: str
    files_analyzed: int = 0
    issues: List[ComplexityIssue] = []
    summary: ComplexitySummary = Field(default_factory=ComplexitySummary)
    analysis_time_ms: float = 0.0
    truncated: bool = False
    total_issues: int = 0
    read_errors: List[str] = []


# ═══════════════════════════════════════════════════════════════════════════════
# DETECTION FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════


def analyze_nesting_depth(content: str) -> List[Tuple[int, int, int]]:
    """
    Block nesting depth of every line in Lua source.

    Returns ``(line_number, depth, max_depth_so_far)`` for each line. Depth counts
    enclosing if/for/while/repeat/do blocks plus nested functions; a top-level
    function body is depth 0, so a single ``if`` inside it is depth 1.
    """
    parsed = parse_lua(content)
    by_line = parsed.max_depth_by_line()
    info = []
    running = 0
    for line in range(1, parsed.line_count + 1):
        depth = by_line.get(line, 0)
        running = max(running, depth)
        info.append((line, depth, running))
    return info


def _parsed_files(
    addon_path: Path, lua_files: List[Path], cache: Optional[SourceCache]
):
    cache = cache or SourceCache(addon_path)
    for lua_file in lua_files:
        parsed = cache.parse(lua_file)
        if parsed is not None:
            yield lua_file, parsed


def find_deep_nesting(
    addon_path: Path,
    lua_files: List[Path],
    max_depth: int,
    cache: Optional[SourceCache] = None,
) -> List[ComplexityIssue]:
    """Find code with excessive nesting depth (one issue per offending block tree)."""
    issues = []

    for lua_file, parsed in _parsed_files(addon_path, lua_files, cache):
        rel_path = relative_display(lua_file, addon_path)
        worst: Dict[int, int] = {}  # id(root block) -> deepest level below it
        roots: Dict[int, Any] = {}
        for block in parsed.blocks:
            if block.depth <= max_depth:
                continue
            root = block
            while root.parent is not None and root.parent.depth > max_depth:
                root = root.parent
            key = id(root)
            roots[key] = root
            worst[key] = max(worst.get(key, 0), block.depth)

        for key, root in roots.items():
            line = parsed.tokens[root.start].line
            depth = worst[key]
            issues.append(
                ComplexityIssue(
                    category=ComplexityCategory.DEEP_NESTING.value,
                    confidence=Confidence.DEFINITE.value,
                    file=rel_path,
                    line=line,
                    name=f"Block at line {line}",
                    value=depth,
                    threshold=max_depth,
                    message=f"Nesting depth of {depth} exceeds maximum of {max_depth}",
                    suggestion="Extract nested logic into separate functions",
                )
            )

    return issues


def find_long_functions(
    addon_path: Path,
    lua_files: List[Path],
    max_lines: int,
    cache: Optional[SourceCache] = None,
) -> List[ComplexityIssue]:
    """Find functions that are too long (``function`` keyword to matching ``end``)."""
    issues = []

    for lua_file, parsed in _parsed_files(addon_path, lua_files, cache):
        rel_path = relative_display(lua_file, addon_path)
        for func in parsed.functions:
            length = func.length
            if length <= max_lines:
                continue
            issues.append(
                ComplexityIssue(
                    category=ComplexityCategory.LONG_FUNCTION.value,
                    confidence=Confidence.DEFINITE.value,
                    file=rel_path,
                    line=func.line,
                    name=func.name,
                    value=length,
                    threshold=max_lines,
                    message=f"Function '{func.name}' is {length} lines (max {max_lines})",
                    suggestion="Break into smaller functions with clear responsibilities",
                )
            )

    return issues


def find_long_files(
    addon_path: Path,
    lua_files: List[Path],
    max_lines: int,
    cache: Optional[SourceCache] = None,
) -> List[ComplexityIssue]:
    """Find files that are too long."""
    issues = []
    cache = cache or SourceCache(addon_path)

    for lua_file in lua_files:
        content = cache.read(lua_file)
        if content is None:
            continue
        line_count = len(content.splitlines())
        if line_count > max_lines:
            rel_path = relative_display(lua_file, addon_path)
            issues.append(
                ComplexityIssue(
                    category=ComplexityCategory.LONG_FILE.value,
                    confidence=Confidence.DEFINITE.value,
                    file=rel_path,
                    line=1,
                    name=rel_path,
                    value=line_count,
                    threshold=max_lines,
                    message=f"File has {line_count} lines (max {max_lines})",
                    suggestion="Split into multiple files by logical component",
                )
            )

    return issues


def _is_constant_name(text: str) -> bool:
    return text.isupper() and text.replace("_", "").isalnum() and text[0].isalpha()


def find_magic_numbers(
    addon_path: Path,
    lua_files: List[Path],
    cache: Optional[SourceCache] = None,
) -> List[ComplexityIssue]:
    """Find unexplained magic numbers in code (strings and comments are ignored)."""
    issues = []

    for lua_file, parsed in _parsed_files(addon_path, lua_files, cache):
        rel_path = relative_display(lua_file, addon_path)
        tokens = parsed.tokens

        first_on_line: Dict[int, int] = {}
        for idx, tok in enumerate(tokens):
            first_on_line.setdefault(tok.line, idx)

        braces: List[bool] = []  # True while inside a constant's table constructor
        for i, tok in enumerate(tokens):
            if tok.kind == OP:
                if tok.value == "{":
                    opened_by_constant = (
                        i >= 2
                        and tokens[i - 1].is_op("=")
                        and tokens[i - 2].kind == NAME
                        and _is_constant_name(tokens[i - 2].value)
                    )
                    braces.append(bool(braces and braces[-1]) or opened_by_constant)
                elif tok.value == "}" and braces:
                    braces.pop()
                continue
            if tok.kind != NUMBER or tok.value.lower().startswith("0x"):
                continue
            if braces and braces[-1]:
                continue
            prev = tokens[i - 1] if i else None
            nxt = tokens[i + 1] if i + 1 < len(tokens) else None
            if (
                prev is not None
                and prev.is_op("[")
                and nxt is not None
                and nxt.is_op("]")
            ):
                continue  # table index

            start = first_on_line[tok.line]
            if tokens[start].is_kw("local"):
                start += 1
            if (
                start + 1 < len(tokens)
                and tokens[start].kind == NAME
                and _is_constant_name(tokens[start].value)
                and tokens[start + 1].is_op("=")
            ):
                continue  # constant definition explains the number

            try:
                num = float(tok.value)
            except ValueError:
                continue
            if prev is not None and prev.is_op("-"):
                before = tokens[i - 2] if i >= 2 else None
                if before is None or not (
                    before.kind in (NAME, NUMBER)
                    or (before.kind == OP and before.value in (")", "]", "}"))
                    or (
                        before.kind == KEYWORD
                        and before.value in ("true", "false", "nil")
                    )
                ):
                    num = -num
            if (
                num in ACCEPTABLE_MAGIC_NUMBERS
                or abs(num) < Thresholds.MAGIC_NUMBER_MIN
            ):
                continue

            issues.append(
                ComplexityIssue(
                    category=ComplexityCategory.MAGIC_NUMBER.value,
                    confidence=Confidence.SUSPICIOUS.value,
                    file=rel_path,
                    line=tok.line,
                    name=f"Number {tok.value}",
                    value=int(abs(num)),
                    threshold=Thresholds.MAGIC_NUMBER_MIN,
                    message=f"Magic number {tok.value} should be a named constant",
                    suggestion=f"Define as: local DESCRIPTIVE_NAME = {tok.value}",
                )
            )

    return issues


def find_duplicate_code(
    addon_path: Path,
    lua_files: List[Path],
    cache: Optional[SourceCache] = None,
) -> List[ComplexityIssue]:
    """Find identical code blocks across files (comments and blank lines ignored)."""
    issues = []
    window = Thresholds.DUPLICATE_MIN_LINES
    files: List[Path] = []
    # hash -> [(file index, first line, last line)]
    blocks: Dict[bytes, List[Tuple[int, int, int]]] = defaultdict(list)

    for lua_file, parsed in _parsed_files(addon_path, lua_files, cache):
        file_index = len(files)
        files.append(lua_file)
        code = parsed.code_lines()
        for start in range(len(code) - window + 1):
            chunk = code[start : start + window]
            texts = [text for _, text in chunk]
            if len(set(texts)) < window // 2 + 1:
                continue  # mostly repeated boilerplate such as `end` lines
            digest = hashlib.blake2b("\n".join(texts).encode(), digest_size=12).digest()
            blocks[digest].append((file_index, chunk[0][0], chunk[-1][0]))

    candidates = []  # (file index, first line, last line, locations)
    for locations in blocks.values():
        if len({loc[0] for loc in locations}) > 1:
            first = min(locations)
            candidates.append((first[0], first[1], first[2], locations))
    candidates.sort(key=lambda item: (item[0], item[1]))

    merged: List[list] = []
    for file_index, first, last, locations in candidates:
        others = frozenset(loc[0] for loc in locations if loc[0] != file_index)
        if (
            merged
            and merged[-1][0] == file_index
            and merged[-1][3] == others
            and first <= merged[-1][2] + 1
        ):
            merged[-1][2] = max(merged[-1][2], last)
            merged[-1][4] = max(merged[-1][4], len(locations))
            continue
        merged.append([file_index, first, last, others, len(locations)])

    for file_index, first, last, others, count in merged:
        shown = ", ".join(
            relative_display(files[i], addon_path) for i in sorted(others)[:2]
        )
        issues.append(
            ComplexityIssue(
                category=ComplexityCategory.DUPLICATE_CODE.value,
                confidence=Confidence.LIKELY.value,
                file=relative_display(files[file_index], addon_path),
                line=first,
                name=f"Duplicated block at lines {first}-{last}",
                value=count,
                threshold=1,
                message=(
                    f"{last - first + 1} lines duplicated in {count} locations: {shown}"
                ),
                suggestion="Extract into a shared function",
            )
        )

    return issues


# ═══════════════════════════════════════════════════════════════════════════════
# MAIN ANALYSIS
# ═══════════════════════════════════════════════════════════════════════════════


def analyze_addon(
    addon_path: Path, addon_name: str, input: ComplexityInput
) -> ComplexityResult:
    """Run comprehensive complexity analysis on an addon."""
    start_time = time.time()
    addon_path = Path(addon_path).resolve()

    cache = SourceCache(addon_path)
    lua_files = cache.readable(iter_lua_files(addon_path))

    all_issues: List[ComplexityIssue] = []
    categories = input.categories or [c.value for c in ComplexityCategory]
    summary = ComplexitySummary()

    if ComplexityCategory.DEEP_NESTING.value in categories:
        nesting_issues = find_deep_nesting(
            addon_path, lua_files, input.max_nesting, cache
        )
        all_issues.extend(nesting_issues)
        if nesting_issues:
            summary.worst_nesting = max(i.value for i in nesting_issues)

    if ComplexityCategory.LONG_FUNCTION.value in categories:
        function_issues = find_long_functions(
            addon_path, lua_files, input.max_function_lines, cache
        )
        all_issues.extend(function_issues)
        if function_issues:
            summary.longest_function = max(i.value for i in function_issues)

    if ComplexityCategory.LONG_FILE.value in categories:
        file_issues = find_long_files(
            addon_path, lua_files, input.max_file_lines, cache
        )
        all_issues.extend(file_issues)
        if file_issues:
            summary.longest_file = max(i.value for i in file_issues)

    if ComplexityCategory.MAGIC_NUMBER.value in categories:
        all_issues.extend(find_magic_numbers(addon_path, lua_files, cache))

    if ComplexityCategory.DUPLICATE_CODE.value in categories:
        all_issues.extend(find_duplicate_code(addon_path, lua_files, cache))

    summary.total = len(all_issues)
    summary.by_category, _ = count_by(all_issues)
    kept, truncated, total = finalize_issues(all_issues, input.limit, CATEGORY_PRIORITY)

    return ComplexityResult(
        addon=addon_name,
        files_analyzed=len(lua_files),
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
    """Register complexity analysis commands with the AFD server."""

    @server.command(
        name="addon.complexity",
        description="Detect code complexity issues in a WoW addon (nesting, long functions, magic numbers)",
        input_schema=ComplexityInput,
        output_schema=ComplexityResult,
    )
    async def analyze_complexity(
        input: ComplexityInput, context: Any = None
    ) -> CommandResult[ComplexityResult]:
        bad = unknown_categories(input.categories, ComplexityCategory)
        if bad:
            return error(
                code="INVALID_CATEGORY",
                message=f"Unknown complexity categories: {', '.join(bad)}",
                suggestion="Valid categories: "
                + ", ".join(c.value for c in ComplexityCategory),
            )

        addon_path = find_addon_path(input.addon, input.path)

        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found in development directories",
                suggestion="Check the addon name or provide an explicit path",
            )

        result = await asyncio.to_thread(analyze_addon, addon_path, input.addon, input)

        src = create_source(
            type="analysis",
            id=f"complexity-{input.addon}",
            title=f"Complexity Analysis: {input.addon}",
            location=str(addon_path),
        )

        extra = ""
        if result.summary.worst_nesting > 0:
            extra += f". Worst nesting: {result.summary.worst_nesting} levels"
        if result.summary.longest_function > 0:
            extra += f". Longest function: {result.summary.longest_function} lines"
        if result.truncated:
            extra += f". Showing the {len(result.issues)} most severe of {result.total_issues}"
        reasoning = describe_findings(
            "complexity issues",
            input.addon,
            result.summary.total,
            result.summary.by_category,
            result.files_analyzed,
            extra=extra,
        )

        return success(data=result, reasoning=reasoning, sources=[src], confidence=0.9)

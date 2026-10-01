"""
Stale documentation detection for WoW addon development.

Comprehensive analysis to find:
- Relative staleness (docs not updated while code changed)
- Dead links (internal links to non-existent files)
- Dead references (mentions of functions/files that don't exist)
- Version drift (old version numbers mentioned)
- Outdated code examples (code blocks calling functions the addon no longer defines)
"""

import asyncio
import os
import time
from pathlib import Path
from typing import Any, Dict, Iterable, List, Optional, Set

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
    find_main_toc,
    iter_lua_files,
    relative_display,
)
from ..config import find_addon_path
from ..docs_analyzer import (
    CodeBlockAnalyzer,
    DocConfidence,
    DocIssue,
    DocMetrics,
    GitAnalyzer,
    MarkdownAnalyzer,
)
from .development import parse_toc_file

# Order used to rank issues of equal confidence
CATEGORY_PRIORITY = [
    "dead_link",
    "dead_reference",
    "version_drift",
    "outdated_example",
    "relative_staleness",
]

_SKIPPED_DIRS = {"node_modules", "__pycache__"}


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════


class StaleDocsInput(BaseModel):
    addon: str = Field(..., description="Name of the addon to analyze")
    path: Optional[str] = Field(None, description="Override path to addon folder")
    include_suspicious: bool = Field(
        True, description="Include lower-confidence findings"
    )
    commits_threshold: int = Field(
        10, ge=1, description="Flag docs not updated in this many code commits"
    )
    limit: int = Field(
        DEFAULT_ISSUE_LIMIT,
        ge=1,
        le=MAX_ISSUE_LIMIT,
        description="Maximum issues returned, most severe first (counts cover all issues)",
    )


class StaleDocIssue(BaseModel):
    category: str = Field(..., description="Category of documentation issue")
    confidence: str = Field(
        ..., description="Confidence level: definite, likely, suspicious"
    )
    file: str = Field(..., description="File path relative to addon")
    line: int = Field(0, description="Line number (0 if not applicable)")
    name: str = Field(..., description="Name of the issue")
    message: str = Field(..., description="Human-readable description")
    suggestion: Optional[str] = Field(None, description="Suggested fix")


class StaleDocsSummary(BaseModel):
    total: int = 0
    by_category: Dict[str, int] = Field(default_factory=dict)
    by_confidence: Dict[str, int] = Field(default_factory=dict)


class StaleDocsResult(BaseModel):
    addon: str
    docs_analyzed: int = 0
    issues: List[StaleDocIssue] = []
    summary: StaleDocsSummary = Field(default_factory=StaleDocsSummary)
    analysis_time_ms: float = 0.0
    git_available: bool = False
    truncated: bool = False
    total_issues: int = 0
    read_errors: List[str] = []


def _to_stale_issues(doc_issues: Iterable[DocIssue]) -> List[StaleDocIssue]:
    return [
        StaleDocIssue(
            category=i.category,
            confidence=i.confidence,
            file=i.file,
            line=i.line,
            name=i.name,
            message=i.message,
            suggestion=i.suggestion,
        )
        for i in doc_issues
    ]


# ═══════════════════════════════════════════════════════════════════════════════
# DETECTION FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════


def find_markdown_files(addon_path: Path) -> List[Path]:
    """Find all markdown files in the addon (root and common doc folders)."""
    found: Dict[Path, None] = {}

    for md_file in sorted(addon_path.glob("*.md")):
        found[md_file] = None

    for folder in ["docs", "doc", "documentation", "wiki"]:
        folder_path = addon_path / folder
        if not folder_path.is_dir():
            continue
        for md_file in sorted(folder_path.rglob("*.md")):
            parts = md_file.relative_to(addon_path).parts
            if any(p.startswith(".") or p in _SKIPPED_DIRS for p in parts[:-1]):
                continue
            found[md_file] = None

    return list(found)


def find_relative_staleness(
    git_analyzer: GitAnalyzer,
    doc_files: List[Path],
    addon_path: Path,
    commits_threshold: int,
) -> List[StaleDocIssue]:
    """Find docs that haven't been updated in many code commits."""
    issues = []

    stale_docs = git_analyzer.find_docs_not_updated_with_code(
        doc_files, commits_threshold
    )

    for doc_path, commits_behind in stale_docs:
        rel_path = relative_display(doc_path, addon_path)
        git_info = git_analyzer.get_file_last_modified(doc_path)

        last_update = ""
        if git_info and git_info.last_modified:
            last_update = f" (last: {git_info.last_modified.strftime('%Y-%m-%d')})"

        confidence = (
            DocConfidence.LIKELY.value
            if commits_behind > 50
            else DocConfidence.SUSPICIOUS.value
        )

        issues.append(
            StaleDocIssue(
                category="relative_staleness",
                confidence=confidence,
                file=rel_path,
                line=0,
                name=rel_path,
                message=f"Not updated in {commits_behind} code commits{last_update}",
                suggestion="Review and update documentation",
            )
        )

    return issues


def find_dead_links(
    markdown_analyzer: MarkdownAnalyzer,
    doc_metrics: Dict[Path, DocMetrics],
    addon_path: Path,
) -> List[StaleDocIssue]:
    """Find internal links that point to non-existent files."""
    issues: List[StaleDocIssue] = []
    for metrics in doc_metrics.values():
        issues.extend(_to_stale_issues(markdown_analyzer.find_dead_links(metrics)))
    return issues


def find_dead_references(
    markdown_analyzer: MarkdownAnalyzer,
    doc_metrics: Dict[Path, DocMetrics],
    existing_functions: Set[str],
    existing_files: Set[str],
    addon_path: Path,
) -> List[StaleDocIssue]:
    """Find references to functions/files that don't exist."""
    issues: List[StaleDocIssue] = []
    for metrics in doc_metrics.values():
        issues.extend(
            _to_stale_issues(
                markdown_analyzer.find_dead_references(
                    metrics, existing_functions, existing_files
                )
            )
        )
    return issues


def find_version_drift(
    markdown_analyzer: MarkdownAnalyzer,
    doc_metrics: Dict[Path, DocMetrics],
    current_version: Optional[str],
    addon_path: Path,
) -> List[StaleDocIssue]:
    """Find version mentions that are outdated."""
    issues: List[StaleDocIssue] = []
    if not current_version:
        return issues
    for metrics in doc_metrics.values():
        issues.extend(
            _to_stale_issues(
                markdown_analyzer.find_version_drift(metrics, current_version)
            )
        )
    return issues


def find_outdated_examples(
    code_analyzer: CodeBlockAnalyzer, doc_files: List[Path], addon_path: Path
) -> List[StaleDocIssue]:
    """Find code examples that may be outdated."""
    issues: List[StaleDocIssue] = []
    for doc_path in doc_files:
        issues.extend(
            _to_stale_issues(code_analyzer.analyze_code_blocks(doc_path, addon_path))
        )
    return issues


def get_addon_version(addon_path: Path, addon_name: str) -> Optional[str]:
    """Get the current addon version from the main TOC file."""
    main_toc = find_main_toc(addon_path, addon_name)
    if main_toc is None:
        return None
    return parse_toc_file(main_toc).get("metadata", {}).get("Version")


def get_existing_functions(
    addon_path: Path, addon_name: str, cache: Optional[SourceCache] = None
) -> Set[str]:
    """Get set of function names defined in the addon (Libs excluded)."""
    functions: Set[str] = set()
    cache = cache or SourceCache(addon_path)

    for lua_file in iter_lua_files(addon_path):
        parsed = cache.parse(lua_file)
        if parsed is None:
            continue
        for func in parsed.functions:
            if not func.named:
                continue
            functions.add(func.name)
            functions.add(func.name.replace(":", ".").rsplit(".", 1)[-1])

    return functions


def get_existing_files(addon_path: Path) -> Set[str]:
    """Get set of file names (and forward-slash relative paths) in the addon."""
    files: Set[str] = set()

    for dirpath, dirnames, filenames in os.walk(addon_path):
        dirnames[:] = [
            d for d in dirnames if not d.startswith(".") and d not in _SKIPPED_DIRS
        ]
        for name in filenames:
            files.add(name)
            rel = Path(dirpath, name).relative_to(addon_path)
            files.add(rel.as_posix())

    return files


# ═══════════════════════════════════════════════════════════════════════════════
# MAIN ANALYSIS FUNCTION
# ═══════════════════════════════════════════════════════════════════════════════


def analyze_docs(
    addon_path: Path, addon_name: str, input: StaleDocsInput
) -> StaleDocsResult:
    """Run comprehensive stale documentation analysis on an addon."""
    start_time = time.perf_counter()
    addon_path = Path(addon_path).resolve()

    cache = SourceCache(addon_path)
    doc_files = cache.readable(find_markdown_files(addon_path))

    if not doc_files:
        return StaleDocsResult(
            addon=addon_name,
            docs_analyzed=0,
            analysis_time_ms=0,
            read_errors=cache.errors,
        )

    git_analyzer = GitAnalyzer(addon_path)
    markdown_analyzer = MarkdownAnalyzer(addon_path, addon_name)

    current_version = get_addon_version(addon_path, addon_name)
    existing_functions = get_existing_functions(addon_path, addon_name, cache)
    existing_files = get_existing_files(addon_path)

    code_analyzer = CodeBlockAnalyzer(existing_functions)

    doc_metrics: Dict[Path, DocMetrics] = {}
    for doc_path in doc_files:
        metrics = markdown_analyzer.analyze_file(doc_path)
        metrics.git_info = git_analyzer.get_file_last_modified(doc_path)
        doc_metrics[doc_path] = metrics

    all_issues: List[StaleDocIssue] = []

    if git_analyzer.is_git_repo:
        all_issues.extend(
            find_relative_staleness(
                git_analyzer, doc_files, addon_path, input.commits_threshold
            )
        )

    all_issues.extend(find_dead_links(markdown_analyzer, doc_metrics, addon_path))
    all_issues.extend(
        find_dead_references(
            markdown_analyzer,
            doc_metrics,
            existing_functions,
            existing_files,
            addon_path,
        )
    )
    all_issues.extend(
        find_version_drift(markdown_analyzer, doc_metrics, current_version, addon_path)
    )
    all_issues.extend(find_outdated_examples(code_analyzer, doc_files, addon_path))

    if not input.include_suspicious:
        all_issues = [
            i for i in all_issues if i.confidence != DocConfidence.SUSPICIOUS.value
        ]

    by_category, by_confidence = count_by(all_issues)
    summary = StaleDocsSummary(
        total=len(all_issues), by_category=by_category, by_confidence=by_confidence
    )
    kept, truncated, total = finalize_issues(all_issues, input.limit, CATEGORY_PRIORITY)

    return StaleDocsResult(
        addon=addon_name,
        docs_analyzed=len(doc_files),
        issues=kept,
        summary=summary,
        analysis_time_ms=max(
            round((time.perf_counter() - start_time) * 1000, 3), 0.001
        ),
        git_available=git_analyzer.is_git_repo,
        truncated=truncated,
        total_issues=total,
        read_errors=cache.errors,
    )


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND REGISTRATION
# ═══════════════════════════════════════════════════════════════════════════════


def register_commands(server):
    """Register stale documentation detection commands with the AFD server."""

    @server.command(
        name="docs.stale",
        description="Detect stale or broken documentation in a WoW addon",
        input_schema=StaleDocsInput,
        output_schema=StaleDocsResult,
    )
    async def detect_stale_docs(
        input: StaleDocsInput, context: Any = None
    ) -> CommandResult[StaleDocsResult]:
        addon_path = find_addon_path(input.addon, input.path)

        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found in development directories",
                suggestion="Check the addon name or provide an explicit path with the 'path' parameter",
            )

        result = await asyncio.to_thread(analyze_docs, addon_path, input.addon, input)

        src = create_source(
            type="analysis",
            id=f"staledocs-{input.addon}",
            title=f"Stale Docs Analysis: {input.addon}",
            location=str(addon_path),
        )

        extra = ""
        if result.truncated:
            extra += f". Showing the {len(result.issues)} most severe of {result.total_issues}"
        if not result.git_available:
            extra += " (git not available - staleness detection limited)"
        reasoning = describe_findings(
            "issues",
            input.addon,
            result.summary.total,
            result.summary.by_category,
            result.docs_analyzed,
            scanned_unit="docs",
            extra=extra,
        )
        if result.summary.total == 0:
            reasoning = (
                f"No stale documentation found in {input.addon} "
                f"({result.docs_analyzed} docs analyzed)" + extra
            )

        return success(data=result, reasoning=reasoning, sources=[src], confidence=0.85)

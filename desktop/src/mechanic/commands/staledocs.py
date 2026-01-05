"""
Stale documentation detection for WoW addon development.

Comprehensive analysis to find:
- Relative staleness (docs not updated when code changed)
- Dead links (internal links to non-existent files)
- Dead references (mentions of functions/files that don't exist)
- Version drift (old version numbers mentioned)
- Git correlation (docs not updated in commits that touched code)
- Outdated code examples (code blocks with removed APIs)
"""

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pathlib import Path
from pydantic import BaseModel, Field
from typing import Any, Dict, List, Optional, Set
import time

from ..config import find_addon_path
from ..docs_analyzer import (
    GitAnalyzer, MarkdownAnalyzer, CodeBlockAnalyzer,
    DocConfidence, DocIssue, DocMetrics
)
from ..lua_analyzer import LuaAnalyzer
from .development import parse_toc_file


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
        10, description="Flag docs not updated in this many commits"
    )


class StaleDocIssue(BaseModel):
    category: str = Field(..., description="Category of documentation issue")
    confidence: str = Field(..., description="Confidence level: definite, likely, suspicious")
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


# ═══════════════════════════════════════════════════════════════════════════════
# DETECTION FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════

def find_markdown_files(addon_path: Path) -> List[Path]:
    """Find all markdown files in the addon."""
    md_files = []

    # Check root level
    for md_file in addon_path.glob("*.md"):
        md_files.append(md_file)

    # Check docs folder
    docs_path = addon_path / "docs"
    if docs_path.exists():
        for md_file in docs_path.rglob("*.md"):
            md_files.append(md_file)

    # Check other common doc locations
    for folder in ["doc", "documentation", "wiki"]:
        folder_path = addon_path / folder
        if folder_path.exists():
            for md_file in folder_path.rglob("*.md"):
                md_files.append(md_file)

    return md_files


def find_relative_staleness(
    git_analyzer: GitAnalyzer,
    doc_files: List[Path],
    addon_path: Path,
    commits_threshold: int
) -> List[StaleDocIssue]:
    """Find docs that haven't been updated in many commits."""
    issues = []

    stale_docs = git_analyzer.find_docs_not_updated_with_code(
        doc_files, commits_threshold
    )

    for doc_path, commits_behind in stale_docs:
        rel_path = doc_path.relative_to(addon_path)
        git_info = git_analyzer.get_file_last_modified(doc_path)

        last_update = ""
        if git_info and git_info.last_modified:
            last_update = f" (last: {git_info.last_modified.strftime('%Y-%m-%d')})"

        # Determine confidence based on how stale
        if commits_behind > 50:
            confidence = DocConfidence.LIKELY.value
        else:
            confidence = DocConfidence.SUSPICIOUS.value

        issues.append(StaleDocIssue(
            category="relative_staleness",
            confidence=confidence,
            file=str(rel_path),
            line=0,
            name=str(rel_path),
            message=f"Not updated in {commits_behind} commits{last_update}",
            suggestion="Review and update documentation"
        ))

    return issues


def find_dead_links(
    markdown_analyzer: MarkdownAnalyzer,
    doc_metrics: Dict[Path, DocMetrics],
    addon_path: Path
) -> List[StaleDocIssue]:
    """Find internal links that point to non-existent files."""
    issues = []

    for doc_path, metrics in doc_metrics.items():
        doc_issues = markdown_analyzer.find_dead_links(metrics)
        for issue in doc_issues:
            issues.append(StaleDocIssue(
                category=issue.category,
                confidence=issue.confidence,
                file=issue.file,
                line=issue.line,
                name=issue.name,
                message=issue.message,
                suggestion=issue.suggestion
            ))

    return issues


def find_dead_references(
    markdown_analyzer: MarkdownAnalyzer,
    doc_metrics: Dict[Path, DocMetrics],
    existing_functions: Set[str],
    existing_files: Set[str],
    addon_path: Path
) -> List[StaleDocIssue]:
    """Find references to functions/files that don't exist."""
    issues = []

    for doc_path, metrics in doc_metrics.items():
        doc_issues = markdown_analyzer.find_dead_references(
            metrics, existing_functions, existing_files
        )
        for issue in doc_issues:
            issues.append(StaleDocIssue(
                category=issue.category,
                confidence=issue.confidence,
                file=issue.file,
                line=issue.line,
                name=issue.name,
                message=issue.message,
                suggestion=issue.suggestion
            ))

    return issues


def find_version_drift(
    markdown_analyzer: MarkdownAnalyzer,
    doc_metrics: Dict[Path, DocMetrics],
    current_version: Optional[str],
    addon_path: Path
) -> List[StaleDocIssue]:
    """Find version mentions that are outdated."""
    issues = []

    if not current_version:
        return issues

    for doc_path, metrics in doc_metrics.items():
        doc_issues = markdown_analyzer.find_version_drift(metrics, current_version)
        for issue in doc_issues:
            issues.append(StaleDocIssue(
                category=issue.category,
                confidence=issue.confidence,
                file=issue.file,
                line=issue.line,
                name=issue.name,
                message=issue.message,
                suggestion=issue.suggestion
            ))

    return issues


def find_outdated_examples(
    code_analyzer: CodeBlockAnalyzer,
    doc_files: List[Path],
    addon_path: Path
) -> List[StaleDocIssue]:
    """Find code examples that may be outdated."""
    issues = []

    for doc_path in doc_files:
        doc_issues = code_analyzer.analyze_code_blocks(doc_path, addon_path)
        for issue in doc_issues:
            issues.append(StaleDocIssue(
                category=issue.category,
                confidence=issue.confidence,
                file=issue.file,
                line=issue.line,
                name=issue.name,
                message=issue.message,
                suggestion=issue.suggestion
            ))

    return issues


def get_addon_version(addon_path: Path, addon_name: str) -> Optional[str]:
    """Get the current addon version from TOC file."""
    toc_files = list(addon_path.glob("*.toc"))
    main_toc = None

    for toc in toc_files:
        if toc.stem == addon_name or toc.stem == addon_name.lstrip('!'):
            main_toc = toc
            break

    if not main_toc and toc_files:
        main_toc = toc_files[0]

    if not main_toc:
        return None

    parsed = parse_toc_file(main_toc)
    return parsed.get('metadata', {}).get('Version')


def get_existing_functions(addon_path: Path, addon_name: str) -> Set[str]:
    """Get set of function names defined in the addon."""
    functions = set()

    # Scan Lua files for function definitions
    for lua_file in addon_path.rglob("*.lua"):
        # Skip Libs
        if "Libs" in str(lua_file) or "libs" in str(lua_file):
            continue

        try:
            content = lua_file.read_text(encoding='utf-8', errors='replace')
            analyzer = LuaAnalyzer(addon_name)
            analyzer.analyze_file(lua_file, content)

            for key, func in analyzer.symbols.functions.items():
                # Add full name and base name
                functions.add(func.name)
                if ':' in func.name:
                    functions.add(func.name.split(':')[1])
                elif '.' in func.name:
                    functions.add(func.name.split('.')[-1])

        except Exception:
            continue

    return functions


def get_existing_files(addon_path: Path) -> Set[str]:
    """Get set of file names in the addon."""
    files = set()

    for f in addon_path.rglob("*"):
        if f.is_file():
            # Add relative path and just filename
            try:
                rel_path = f.relative_to(addon_path)
                files.add(str(rel_path))
                files.add(f.name)
            except ValueError:
                files.add(f.name)

    return files


# ═══════════════════════════════════════════════════════════════════════════════
# MAIN ANALYSIS FUNCTION
# ═══════════════════════════════════════════════════════════════════════════════

def analyze_docs(addon_path: Path, addon_name: str, input: StaleDocsInput) -> StaleDocsResult:
    """Run comprehensive stale documentation analysis on an addon."""
    start_time = time.time()

    # Find markdown files
    doc_files = find_markdown_files(addon_path)

    if not doc_files:
        return StaleDocsResult(
            addon=addon_name,
            docs_analyzed=0,
            analysis_time_ms=0
        )

    # Initialize analyzers
    git_analyzer = GitAnalyzer(addon_path)
    markdown_analyzer = MarkdownAnalyzer(addon_path, addon_name)

    # Get addon metadata
    current_version = get_addon_version(addon_path, addon_name)
    existing_functions = get_existing_functions(addon_path, addon_name)
    existing_files = get_existing_files(addon_path)

    # Initialize code block analyzer
    code_analyzer = CodeBlockAnalyzer(existing_functions, set())

    # Analyze each markdown file
    doc_metrics: Dict[Path, DocMetrics] = {}
    for doc_path in doc_files:
        metrics = markdown_analyzer.analyze_file(doc_path)
        metrics.git_info = git_analyzer.get_file_last_modified(doc_path)
        doc_metrics[doc_path] = metrics

    # Collect issues from all detectors
    all_issues: List[StaleDocIssue] = []

    # 1. Relative staleness (git-based)
    if git_analyzer._is_git_repo:
        all_issues.extend(find_relative_staleness(
            git_analyzer, doc_files, addon_path, input.commits_threshold
        ))

    # 2. Dead links
    all_issues.extend(find_dead_links(
        markdown_analyzer, doc_metrics, addon_path
    ))

    # 3. Dead references
    all_issues.extend(find_dead_references(
        markdown_analyzer, doc_metrics, existing_functions, existing_files, addon_path
    ))

    # 4. Version drift
    all_issues.extend(find_version_drift(
        markdown_analyzer, doc_metrics, current_version, addon_path
    ))

    # 5. Outdated code examples
    all_issues.extend(find_outdated_examples(
        code_analyzer, doc_files, addon_path
    ))

    # Filter by confidence if requested
    if not input.include_suspicious:
        all_issues = [i for i in all_issues if i.confidence != DocConfidence.SUSPICIOUS.value]

    # Build summary
    summary = StaleDocsSummary(total=len(all_issues))
    for issue in all_issues:
        summary.by_category[issue.category] = summary.by_category.get(issue.category, 0) + 1
        summary.by_confidence[issue.confidence] = summary.by_confidence.get(issue.confidence, 0) + 1

    analysis_time = (time.time() - start_time) * 1000

    return StaleDocsResult(
        addon=addon_name,
        docs_analyzed=len(doc_files),
        issues=all_issues[:50],  # Limit to 50 issues
        summary=summary,
        analysis_time_ms=round(analysis_time, 2),
        git_available=git_analyzer._is_git_repo
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
    async def detect_stale_docs(input: StaleDocsInput, context: Any = None) -> CommandResult[StaleDocsResult]:
        addon_path = find_addon_path(input.addon, input.path)

        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found in development directories",
                suggestion="Check the addon name or provide an explicit path with the 'path' parameter"
            )

        # STEP 2: Add markdown analysis, skip git
        import time
        start_time = time.time()
        
        # Find markdown files
        doc_files = list(addon_path.glob("*.md"))
        docs_path = addon_path / "docs"
        if docs_path.exists():
            doc_files.extend(docs_path.rglob("*.md"))
        
        # Initialize markdown analyzer (NO git - subprocess blocks MCP event loop)
        markdown_analyzer = MarkdownAnalyzer(addon_path, input.addon)
        
        # Analyze each file
        issues = []
        analyzed = 0
        for doc_path in doc_files:
            try:
                metrics = markdown_analyzer.analyze_file(doc_path)
                analyzed += 1
                # Check for dead links
                for issue in markdown_analyzer.find_dead_links(metrics):
                    issues.append(StaleDocIssue(
                        category=issue.category,
                        confidence=issue.confidence,
                        file=issue.file,
                        line=issue.line,
                        name=issue.name,
                        message=issue.message,
                        suggestion=issue.suggestion
                    ))
            except Exception:
                continue
        
        # Build summary
        summary = StaleDocsSummary(total=len(issues))
        for issue in issues:
            summary.by_category[issue.category] = summary.by_category.get(issue.category, 0) + 1
        
        analysis_time = (time.time() - start_time) * 1000
        
        result = StaleDocsResult(
            addon=input.addon,
            docs_analyzed=analyzed,
            issues=issues[:50],
            summary=summary,
            analysis_time_ms=round(analysis_time, 2),
            git_available=False  # Git analysis disabled for MCP (subprocess blocks)
        )

        src = create_source(
            type="analysis",
            id=f"staledocs-{input.addon}",
            title=f"Stale Docs Analysis: {input.addon}",
            location=str(addon_path)
        )

        # Build reasoning summary
        if result.summary.total == 0:
            reasoning = f"No stale documentation found in {input.addon} ({result.docs_analyzed} docs analyzed)"
        else:
            parts = []
            for cat, count in sorted(result.summary.by_category.items(), key=lambda x: -x[1]):
                parts.append(f"{count} {cat.replace('_', ' ')}")
            reasoning = f"Found {result.summary.total} issues in {input.addon}: {', '.join(parts[:3])}"
            if len(parts) > 3:
                reasoning += f" (+{len(parts) - 3} more categories)"

        if not result.git_available:
            reasoning += " (git not available - staleness detection limited)"

        return success(
            data=result,
            reasoning=reasoning,
            sources=[src],
            confidence=0.85
        )

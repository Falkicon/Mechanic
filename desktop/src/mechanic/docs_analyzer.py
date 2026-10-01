"""
Documentation analysis utilities for WoW addon development.

This module provides tools for detecting stale, outdated, or broken documentation
in addon projects. It analyzes markdown files for:
- Relative staleness compared to code changes
- Dead references to functions/files
- Broken internal links
- Version drift
- Outdated code examples
"""

import re
import subprocess
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from pathlib import Path
from typing import Dict, Iterator, List, Optional, Set, Tuple
from urllib.parse import unquote

from .analysis_common import relative_display
from .lua_tokenizer import NAME, OP, tokenize


class DocConfidence(str, Enum):
    """Confidence level for documentation issues."""

    DEFINITE = "definite"  # 100% certain (dead link, missing file)
    LIKELY = "likely"  # 90%+ certain (significant staleness)
    SUSPICIOUS = "suspicious"  # 70%+ certain (may need review)


@dataclass
class DocIssue:
    """Represents a documentation issue."""

    category: str
    confidence: str
    file: str
    line: int = 0
    name: str = ""
    message: str = ""
    suggestion: Optional[str] = None


@dataclass
class GitInfo:
    """Git information for a file."""

    last_modified: Optional[datetime] = None
    commits_behind: int = 0  # Code commits (lua/xml/toc) since the file last changed
    last_commit_hash: Optional[str] = None
    last_commit_message: Optional[str] = None


@dataclass
class DocMetrics:
    """Metrics about a documentation file."""

    path: Path
    git_info: Optional[GitInfo] = None
    word_count: int = 0
    link_count: int = 0
    code_block_count: int = 0
    references: Set[str] = field(default_factory=set)  # function_refs | file_refs
    function_refs: Set[str] = field(default_factory=set)
    file_refs: Set[str] = field(default_factory=set)
    internal_links: Set[str] = field(default_factory=set)
    version_mentions: Set[str] = field(default_factory=set)
    is_changelog: bool = False


# Commits that touch these paths count as "code changed" for staleness.
CODE_PATHSPECS = ("*.lua", "*.xml", "*.toc")


class GitAnalyzer:
    """Analyze git history for documentation staleness."""

    def __init__(self, repo_path: Path):
        self.repo_path = repo_path
        self._info_cache: Dict[str, Optional[GitInfo]] = {}
        self._is_git_repo = self._check_git_repo()

    @property
    def is_git_repo(self) -> bool:
        return self._is_git_repo

    def _git(self, args: List[str], timeout: int):
        """Run git in the repo; returns the completed process or None on failure."""
        try:
            return subprocess.run(
                ["git", *args],
                cwd=self.repo_path,
                capture_output=True,
                text=True,
                encoding="utf-8",
                errors="replace",
                timeout=timeout,
            )
        except Exception:
            return None

    def _check_git_repo(self) -> bool:
        """Check if the path is a git repository."""
        result = self._git(["rev-parse", "--git-dir"], 5)
        return result is not None and result.returncode == 0

    def get_file_last_modified(self, file_path: Path) -> Optional[GitInfo]:
        """Get git info for a specific file (cached per analyzer)."""
        if not self._is_git_repo:
            return None
        key = str(file_path)
        if key not in self._info_cache:
            self._info_cache[key] = self._load_file_info(file_path)
        return self._info_cache[key]

    def _load_file_info(self, file_path: Path) -> Optional[GitInfo]:
        result = self._git(
            ["log", "-1", "--format=%H|%ci|%s", "--", str(file_path)], 10
        )
        if result is None or result.returncode != 0 or not result.stdout.strip():
            return None

        parts = result.stdout.strip().split("|", 2)
        if len(parts) < 3:
            return None

        commit_hash, date_str, message = parts
        # Parse date (format: 2024-01-15 10:30:00 -0500)
        try:
            last_modified = datetime.strptime(
                date_str.strip()[:19], "%Y-%m-%d %H:%M:%S"
            )
        except ValueError:
            last_modified = None

        return GitInfo(
            last_modified=last_modified,
            commits_behind=self._count_code_commits_since(commit_hash),
            last_commit_hash=commit_hash[:8],
            last_commit_message=message[:80],
        )

    def _count_code_commits_since(self, commit_hash: str) -> int:
        """Count commits touching Lua/XML/TOC files since this commit."""
        result = self._git(
            ["rev-list", "--count", f"{commit_hash}..HEAD", "--", *CODE_PATHSPECS], 10
        )
        if result is not None and result.returncode == 0:
            try:
                return int(result.stdout.strip())
            except ValueError:
                pass
        return 0

    def get_recent_code_commits(
        self, limit: int = 20
    ) -> List[Tuple[str, str, datetime]]:
        """Get recent commits that touched Lua files."""
        if not self._is_git_repo:
            return []

        result = self._git(
            ["log", f"-{limit}", "--format=%H|%ci|%s", "--", "*.lua"], 15
        )
        if result is None or result.returncode != 0:
            return []

        commits = []
        for line in result.stdout.strip().split("\n"):
            parts = line.split("|", 2)
            if len(parts) >= 3:
                commit_hash, date_str, message = parts
                try:
                    date = datetime.strptime(date_str.strip()[:19], "%Y-%m-%d %H:%M:%S")
                except ValueError:
                    continue
                commits.append((commit_hash[:8], message[:60], date))
        return commits

    def find_docs_not_updated_with_code(
        self, doc_files: List[Path], code_commits: int = 10
    ) -> List[Tuple[Path, int]]:
        """Find docs that weren't updated while code changed.

        Returns list of (doc_path, code_commits_since_update), most stale first.
        """
        if not self._is_git_repo:
            return []

        suspicious = []
        for doc_path in doc_files:
            doc_info = self.get_file_last_modified(doc_path)
            if doc_info and doc_info.commits_behind > code_commits:
                suspicious.append((doc_path, doc_info.commits_behind))

        return sorted(suspicious, key=lambda x: -x[1])


_FENCE_OPEN = re.compile(r"^\s{0,3}(`{3,}|~{3,})\s*([\w+#.-]*)")
_FENCE_CLOSE = re.compile(r"^\s{0,3}(`{3,}|~{3,})\s*$")
_INLINE_CODE = re.compile(r"`[^`]*`")


def classify_lines(lines: List[str]) -> Iterator[Tuple[int, str, str, str]]:
    """Yield ``(line_no, line, kind, lang)`` with kind prose/open/code/close.

    Fences close only on a matching marker of at least the opening length, so the
    closing fence is never mistaken for a new block.
    """
    marker: Optional[str] = None
    for line_no, line in enumerate(lines, 1):
        if marker is None:
            match = _FENCE_OPEN.match(line)
            if match:
                marker = match.group(1)
                yield line_no, line, "open", match.group(2)
            else:
                yield line_no, line, "prose", ""
            continue
        close = _FENCE_CLOSE.match(line)
        if (
            close
            and close.group(1)[0] == marker[0]
            and len(close.group(1)) >= len(marker)
        ):
            marker = None
            yield line_no, line, "close", ""
        else:
            yield line_no, line, "code", ""


class MarkdownAnalyzer:
    """Analyze markdown files for documentation issues."""

    PATTERNS = {
        # [text](target "optional title"), target may be <angle bracketed>
        "link": re.compile(
            r"!?\[[^\]]*\]\(\s*(<[^>]*>|[^)\s]*)"
            r"(?:\s+(?:\"[^\"]*\"|'[^']*'|\([^)]*\)))?\s*\)"
        ),
        # `Addon:Method(` / `Module.Func(` inside an inline code span
        "function_reference": re.compile(r"`([A-Za-z_]\w*(?:[:.]\w+)+)\s*\([^`]*`"),
        "file_reference": re.compile(r"`([^`\s]+\.(?:lua|xml|toc))`"),
        # v1.2.3, 1.2.3 and "version 1.2" - bare x.y numbers (0.85, Lua 5.1) are not versions
        "version_mention": re.compile(
            r"(?<![\w.])v(\d+\.\d+(?:\.\d+)?)(?![\w]|\.\d)"
            r"|(?<![\w.])(\d+\.\d+\.\d+)(?![\w]|\.\d)"
            r"|\b(?:version|release)\s+v?(\d+\.\d+(?:\.\d+)?)(?![\w]|\.\d)",
            re.IGNORECASE,
        ),
    }

    CHANGELOG_NAMES = {
        "changelog",
        "changes",
        "history",
        "releases",
        "release_notes",
        "news",
    }

    def __init__(self, addon_path: Path, addon_name: str):
        self.addon_path = addon_path
        self.addon_name = addon_name

    def analyze_file(self, doc_path: Path) -> DocMetrics:
        """Analyze a markdown file and extract metrics."""
        metrics = DocMetrics(path=doc_path)
        metrics.is_changelog = doc_path.stem.lower() in self.CHANGELOG_NAMES

        try:
            content = doc_path.read_text(encoding="utf-8", errors="replace")
        except OSError:
            return metrics

        patterns = self.PATTERNS
        for _line_no, line, kind, _lang in classify_lines(content.splitlines()):
            if kind == "open":
                metrics.code_block_count += 1
                continue
            if kind != "prose":
                continue

            metrics.word_count += len(line.split())
            prose = _INLINE_CODE.sub(" ", line)

            for match in patterns["link"].finditer(prose):
                target = match.group(1).strip()
                if target.startswith("<") and target.endswith(">"):
                    target = target[1:-1].strip()
                if not target:
                    continue
                metrics.link_count += 1
                if not re.match(r"^(?:[A-Za-z][A-Za-z0-9+.-]+:|//)", target):
                    metrics.internal_links.add(target)

            for match in patterns["version_mention"].finditer(prose):
                metrics.version_mentions.add(next(g for g in match.groups() if g))

            for match in patterns["function_reference"].finditer(line):
                metrics.function_refs.add(match.group(1))
            for match in patterns["file_reference"].finditer(line):
                metrics.file_refs.add(match.group(1))

        metrics.references = metrics.function_refs | metrics.file_refs
        return metrics

    def _display(self, path: Path) -> str:
        return relative_display(path, self.addon_path)

    def find_dead_links(self, metrics: DocMetrics) -> List[DocIssue]:
        """Find internal links that point to non-existent files."""
        issues = []
        doc_dir = metrics.path.parent

        for link in sorted(metrics.internal_links):
            if link.startswith("#"):
                continue  # TODO: Could validate anchor exists in same file

            link_path = unquote(link.split("#")[0].split("?")[0])
            if not link_path:
                continue

            base = self.addon_path if link_path.startswith("/") else doc_dir
            target = base / link_path.lstrip("/")
            try:
                exists = target.exists()
            except (OSError, ValueError):
                exists = False

            if not exists:
                issues.append(
                    DocIssue(
                        category="dead_link",
                        confidence=DocConfidence.DEFINITE.value,
                        file=self._display(metrics.path),
                        name=link,
                        message=f"Link to '{link}' points to non-existent file",
                        suggestion="Update or remove the link",
                    )
                )

        return issues

    def find_dead_references(
        self,
        metrics: DocMetrics,
        existing_functions: Set[str],
        existing_files: Set[str],
    ) -> List[DocIssue]:
        """Find references to functions/files that don't exist."""
        issues = []
        rel_path = self._display(metrics.path)

        for ref in sorted(metrics.file_refs):
            normalized = ref.replace("\\", "/")
            if "/" in normalized:
                found = normalized in existing_files or any(
                    f.endswith("/" + normalized) for f in existing_files
                )
            else:
                found = normalized in existing_files
            if not found:
                issues.append(
                    DocIssue(
                        category="dead_reference",
                        confidence=DocConfidence.LIKELY.value,
                        file=rel_path,
                        name=ref,
                        message=f"References file '{ref}' which may not exist",
                        suggestion="Verify file exists or update reference",
                    )
                )

        for ref in sorted(metrics.function_refs):
            func_name = ref.split(":")[-1].split(".")[-1]
            if func_name not in existing_functions and ref not in existing_functions:
                issues.append(
                    DocIssue(
                        category="dead_reference",
                        confidence=DocConfidence.SUSPICIOUS.value,
                        file=rel_path,
                        name=ref,
                        message=f"References '{ref}' which may no longer exist",
                        suggestion="Verify function/method exists or update docs",
                    )
                )

        return issues

    @staticmethod
    def _version_parts(version: str) -> List[int]:
        match = re.match(r"\d+(?:\.\d+)*", version.strip().lstrip("vV"))
        return [int(x) for x in match.group(0).split(".")] if match else []

    def find_version_drift(
        self, metrics: DocMetrics, current_version: Optional[str]
    ) -> List[DocIssue]:
        """Find version mentions that are outdated (changelogs are exempt)."""
        issues = []

        if not current_version or not metrics.version_mentions or metrics.is_changelog:
            return issues

        current_parts = self._version_parts(current_version)
        if len(current_parts) < 2:
            return issues

        rel_path = self._display(metrics.path)

        for mentioned_version in sorted(metrics.version_mentions):
            mentioned_parts = self._version_parts(mentioned_version)
            if len(mentioned_parts) < 2:
                continue

            if mentioned_parts[0] < current_parts[0]:
                issues.append(
                    DocIssue(
                        category="version_drift",
                        confidence=DocConfidence.LIKELY.value,
                        file=rel_path,
                        name=f"v{mentioned_version}",
                        message=f"Mentions version {mentioned_version} but current is {current_version}",
                        suggestion="Update version references to current",
                    )
                )
            elif (
                mentioned_parts[0] == current_parts[0]
                and mentioned_parts[1] < current_parts[1] - 2
            ):
                issues.append(
                    DocIssue(
                        category="version_drift",
                        confidence=DocConfidence.SUSPICIOUS.value,
                        file=rel_path,
                        name=f"v{mentioned_version}",
                        message=f"Mentions old version {mentioned_version} (current: {current_version})",
                        suggestion="Consider updating version references",
                    )
                )

        return issues


_DOC_BUILTINS = {
    "print",
    "pairs",
    "ipairs",
    "type",
    "tostring",
    "tonumber",
    "table",
    "string",
    "math",
}
_ADDON_ROOTS = ("Addon", "Module", "self")


class CodeBlockAnalyzer:
    """Analyze code blocks in markdown for outdated examples."""

    def __init__(self, existing_functions: Set[str]):
        self.existing_functions = existing_functions

    def analyze_code_blocks(self, doc_path: Path, addon_path: Path) -> List[DocIssue]:
        """Find code blocks with potentially outdated references."""
        issues: List[DocIssue] = []

        try:
            content = doc_path.read_text(encoding="utf-8", errors="replace")
        except OSError:
            return issues

        rel_path = relative_display(doc_path, addon_path)
        start_line = 0
        lang = ""
        code_lines: List[str] = []

        for line_no, line, kind, fence_lang in classify_lines(content.splitlines()):
            if kind == "open":
                start_line, lang, code_lines = line_no, fence_lang, []
            elif kind == "code":
                code_lines.append(line)
            elif kind == "close" and lang.lower() in ("lua", ""):
                issues.extend(self._analyze_lua_block(code_lines, start_line, rel_path))

        return issues

    def _analyze_lua_block(
        self, code_lines: List[str], start_line: int, file_path: str
    ) -> List[DocIssue]:
        """Flag calls on Addon/Module/self that the addon no longer defines."""
        issues = []
        tokens, _ = tokenize("\n".join(code_lines))
        reported: Set[Tuple[str, int]] = set()

        for i, tok in enumerate(tokens):
            if tok.kind != NAME or (
                i and tokens[i - 1].kind == OP and tokens[i - 1].value in ".:"
            ):
                continue
            parts = [tok.value]
            j = i
            while (
                j + 2 < len(tokens)
                and tokens[j + 1].kind == OP
                and tokens[j + 1].value in (".", ":")
                and tokens[j + 2].kind == NAME
            ):
                parts.append(tokens[j + 2].value)
                j += 2
            if not (
                j + 1 < len(tokens)
                and tokens[j + 1].kind == OP
                and tokens[j + 1].value == "("
            ):
                continue

            root = parts[0]
            if root in _DOC_BUILTINS or root not in _ADDON_ROOTS or len(parts) < 2:
                continue
            func_name = ".".join(parts)
            separator = tokens[i + 1].value
            shown = root + separator + ".".join(parts[1:])
            base_func = parts[-1]
            if (
                base_func in self.existing_functions
                or func_name in self.existing_functions
            ):
                continue
            if not self.existing_functions:
                continue

            line = start_line + tok.line
            if (shown, line) in reported:
                continue
            reported.add((shown, line))
            issues.append(
                DocIssue(
                    category="outdated_example",
                    confidence=DocConfidence.SUSPICIOUS.value,
                    file=file_path,
                    line=line,
                    name=shown,
                    message=f"Code example references '{shown}' which may not exist",
                    suggestion="Verify example code is still valid",
                )
            )

        return issues

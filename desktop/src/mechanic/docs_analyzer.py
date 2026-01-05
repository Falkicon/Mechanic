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

from dataclasses import dataclass, field
from typing import Dict, Set, List, Optional, Tuple
from pathlib import Path
from enum import Enum
from datetime import datetime, timedelta
import re
import subprocess


class DocConfidence(str, Enum):
    """Confidence level for documentation issues."""
    DEFINITE = "definite"     # 100% certain (dead link, missing file)
    LIKELY = "likely"         # 90%+ certain (significant staleness)
    SUSPICIOUS = "suspicious" # 70%+ certain (may need review)


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
    commits_behind: int = 0  # How many commits since last update
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
    references: Set[str] = field(default_factory=set)
    internal_links: Set[str] = field(default_factory=set)
    version_mentions: Set[str] = field(default_factory=set)


class GitAnalyzer:
    """Analyze git history for documentation staleness."""

    def __init__(self, repo_path: Path):
        self.repo_path = repo_path
        self._is_git_repo = self._check_git_repo()

    def _check_git_repo(self) -> bool:
        """Check if the path is a git repository."""
        try:
            result = subprocess.run(
                ["git", "rev-parse", "--git-dir"],
                cwd=self.repo_path,
                capture_output=True,
                text=True,
                timeout=5
            )
            return result.returncode == 0
        except Exception:
            return False

    def get_file_last_modified(self, file_path: Path) -> Optional[GitInfo]:
        """Get git info for a specific file."""
        if not self._is_git_repo:
            return None

        try:
            # Get last commit date for file
            result = subprocess.run(
                ["git", "log", "-1", "--format=%H|%ci|%s", "--", str(file_path)],
                cwd=self.repo_path,
                capture_output=True,
                text=True,
                timeout=10
            )

            if result.returncode != 0 or not result.stdout.strip():
                return None

            parts = result.stdout.strip().split("|", 2)
            if len(parts) < 3:
                return None

            commit_hash, date_str, message = parts
            # Parse date (format: 2024-01-15 10:30:00 -0500)
            date_str = date_str.strip()
            try:
                last_modified = datetime.strptime(date_str[:19], "%Y-%m-%d %H:%M:%S")
            except ValueError:
                last_modified = None

            # Count commits since this file was modified
            commits_behind = self._count_commits_since(commit_hash)

            return GitInfo(
                last_modified=last_modified,
                commits_behind=commits_behind,
                last_commit_hash=commit_hash[:8],
                last_commit_message=message[:80]
            )

        except Exception:
            return None

    def _count_commits_since(self, commit_hash: str) -> int:
        """Count how many commits have been made since this commit."""
        try:
            result = subprocess.run(
                ["git", "rev-list", "--count", f"{commit_hash}..HEAD"],
                cwd=self.repo_path,
                capture_output=True,
                text=True,
                timeout=10
            )
            if result.returncode == 0:
                return int(result.stdout.strip())
        except Exception:
            pass
        return 0

    def get_recent_code_commits(self, limit: int = 20) -> List[Tuple[str, str, datetime]]:
        """Get recent commits that touched Lua files."""
        if not self._is_git_repo:
            return []

        try:
            result = subprocess.run(
                ["git", "log", f"-{limit}", "--format=%H|%ci|%s", "--", "*.lua"],
                cwd=self.repo_path,
                capture_output=True,
                text=True,
                timeout=15
            )

            if result.returncode != 0:
                return []

            commits = []
            for line in result.stdout.strip().split("\n"):
                if not line:
                    continue
                parts = line.split("|", 2)
                if len(parts) >= 3:
                    commit_hash, date_str, message = parts
                    try:
                        date = datetime.strptime(date_str.strip()[:19], "%Y-%m-%d %H:%M:%S")
                        commits.append((commit_hash[:8], message[:60], date))
                    except ValueError:
                        continue

            return commits

        except Exception:
            return []

    def get_files_changed_in_commits(self, commit_hashes: List[str]) -> Set[str]:
        """Get all files changed in a set of commits."""
        if not self._is_git_repo or not commit_hashes:
            return set()

        changed_files = set()
        try:
            for commit_hash in commit_hashes[:10]:  # Limit to avoid slow queries
                result = subprocess.run(
                    ["git", "diff-tree", "--no-commit-id", "--name-only", "-r", commit_hash],
                    cwd=self.repo_path,
                    capture_output=True,
                    text=True,
                    timeout=10
                )
                if result.returncode == 0:
                    changed_files.update(result.stdout.strip().split("\n"))
        except Exception:
            pass

        return changed_files

    def find_docs_not_updated_with_code(self, doc_files: List[Path], code_commits: int = 10) -> List[Tuple[Path, int]]:
        """Find docs that weren't updated when related code changed.

        Returns list of (doc_path, commits_behind) for suspicious docs.
        """
        if not self._is_git_repo:
            return []

        suspicious = []

        for doc_path in doc_files:
            doc_info = self.get_file_last_modified(doc_path)
            if not doc_info:
                continue

            # If doc hasn't been updated in many commits, it might be stale
            if doc_info.commits_behind > code_commits:
                suspicious.append((doc_path, doc_info.commits_behind))

        return sorted(suspicious, key=lambda x: -x[1])  # Most stale first


class MarkdownAnalyzer:
    """Analyze markdown files for documentation issues."""

    # Patterns for markdown parsing
    PATTERNS = {
        'internal_link': re.compile(r'\[([^\]]+)\]\(([^)]+)\)'),
        'code_block_start': re.compile(r'^```(\w+)?'),
        'code_block_end': re.compile(r'^```\s*$'),
        'inline_code': re.compile(r'`([^`]+)`'),
        'version_mention': re.compile(r'v?(\d+\.\d+(?:\.\d+)?)', re.IGNORECASE),
        'function_reference': re.compile(r'`(\w+(?:[:.]\w+)+)\s*\(`'),
        'file_reference': re.compile(r'`([^`]+\.(?:lua|xml|toc))`'),
        'heading': re.compile(r'^#+\s+(.+)'),
        'addon_name_pattern': re.compile(r'(?:addon|title)[:\s]+["\']?(\w+)["\']?', re.IGNORECASE),
    }

    def __init__(self, addon_path: Path, addon_name: str):
        self.addon_path = addon_path
        self.addon_name = addon_name

    def analyze_file(self, doc_path: Path) -> DocMetrics:
        """Analyze a markdown file and extract metrics."""
        metrics = DocMetrics(path=doc_path)

        try:
            content = doc_path.read_text(encoding='utf-8', errors='replace')
        except Exception:
            return metrics

        lines = content.splitlines()
        in_code_block = False
        word_count = 0

        for line in lines:
            # Track code blocks
            if self.PATTERNS['code_block_start'].match(line):
                in_code_block = True
                metrics.code_block_count += 1
                continue
            if self.PATTERNS['code_block_end'].match(line):
                in_code_block = False
                continue

            # Count words (outside code blocks)
            if not in_code_block:
                word_count += len(line.split())

            # Extract internal links
            for match in self.PATTERNS['internal_link'].finditer(line):
                link_target = match.group(2)
                # Skip external links
                if not link_target.startswith(('http://', 'https://', 'mailto:')):
                    metrics.internal_links.add(link_target)
                metrics.link_count += 1

            # Extract version mentions
            for match in self.PATTERNS['version_mention'].finditer(line):
                metrics.version_mentions.add(match.group(1))

            # Extract function/file references
            for match in self.PATTERNS['function_reference'].finditer(line):
                metrics.references.add(match.group(1))
            for match in self.PATTERNS['file_reference'].finditer(line):
                metrics.references.add(match.group(1))

        metrics.word_count = word_count
        return metrics

    def find_dead_links(self, metrics: DocMetrics) -> List[DocIssue]:
        """Find internal links that point to non-existent files."""
        issues = []
        doc_dir = metrics.path.parent

        for link in metrics.internal_links:
            # Handle anchor-only links
            if link.startswith('#'):
                continue  # TODO: Could validate anchor exists in same file

            # Split link from anchor
            link_path = link.split('#')[0]
            if not link_path:
                continue

            # Resolve relative path
            target_path = (doc_dir / link_path).resolve()

            # Check if target exists
            if not target_path.exists():
                rel_path = metrics.path.relative_to(self.addon_path)
                issues.append(DocIssue(
                    category="dead_link",
                    confidence=DocConfidence.DEFINITE.value,
                    file=str(rel_path),
                    name=link,
                    message=f"Link to '{link}' points to non-existent file",
                    suggestion=f"Update or remove the link"
                ))

        return issues

    def find_dead_references(
        self,
        metrics: DocMetrics,
        existing_functions: Set[str],
        existing_files: Set[str]
    ) -> List[DocIssue]:
        """Find references to functions/files that don't exist."""
        issues = []
        rel_path = metrics.path.relative_to(self.addon_path)

        for ref in metrics.references:
            # Check if it's a file reference
            if '.' in ref and not ':' in ref:
                # File reference (e.g., Core.lua)
                if ref not in existing_files:
                    issues.append(DocIssue(
                        category="dead_reference",
                        confidence=DocConfidence.LIKELY.value,
                        file=str(rel_path),
                        name=ref,
                        message=f"References file '{ref}' which may not exist",
                        suggestion="Verify file exists or update reference"
                    ))
            else:
                # Function reference (e.g., Addon:Function or Addon.Function)
                func_name = ref.split(':')[-1].split('.')[-1]
                # Check if function exists (simplified check)
                if func_name not in existing_functions and ref not in existing_functions:
                    issues.append(DocIssue(
                        category="dead_reference",
                        confidence=DocConfidence.SUSPICIOUS.value,
                        file=str(rel_path),
                        name=ref,
                        message=f"References '{ref}' which may no longer exist",
                        suggestion="Verify function/method exists or update docs"
                    ))

        return issues

    def find_version_drift(
        self,
        metrics: DocMetrics,
        current_version: Optional[str]
    ) -> List[DocIssue]:
        """Find version mentions that are outdated."""
        issues = []

        if not current_version or not metrics.version_mentions:
            return issues

        # Parse current version
        try:
            current_parts = [int(x) for x in current_version.split('.')]
        except ValueError:
            return issues

        rel_path = metrics.path.relative_to(self.addon_path)

        for mentioned_version in metrics.version_mentions:
            try:
                mentioned_parts = [int(x) for x in mentioned_version.split('.')]
            except ValueError:
                continue

            # Compare major.minor at minimum
            if len(mentioned_parts) >= 2 and len(current_parts) >= 2:
                # If mentioned version is significantly older
                if mentioned_parts[0] < current_parts[0]:
                    # Major version behind
                    issues.append(DocIssue(
                        category="version_drift",
                        confidence=DocConfidence.LIKELY.value,
                        file=str(rel_path),
                        name=f"v{mentioned_version}",
                        message=f"Mentions version {mentioned_version} but current is {current_version}",
                        suggestion="Update version references to current"
                    ))
                elif mentioned_parts[0] == current_parts[0] and mentioned_parts[1] < current_parts[1] - 2:
                    # More than 2 minor versions behind
                    issues.append(DocIssue(
                        category="version_drift",
                        confidence=DocConfidence.SUSPICIOUS.value,
                        file=str(rel_path),
                        name=f"v{mentioned_version}",
                        message=f"Mentions old version {mentioned_version} (current: {current_version})",
                        suggestion="Consider updating version references"
                    ))

        return issues


class CodeBlockAnalyzer:
    """Analyze code blocks in markdown for outdated examples."""

    def __init__(self, existing_functions: Set[str], existing_apis: Set[str]):
        self.existing_functions = existing_functions
        self.existing_apis = existing_apis

    def analyze_code_blocks(self, doc_path: Path, addon_path: Path) -> List[DocIssue]:
        """Find code blocks with potentially outdated references."""
        issues = []

        try:
            content = doc_path.read_text(encoding='utf-8', errors='replace')
        except Exception:
            return issues

        lines = content.splitlines()
        in_code_block = False
        code_block_start = 0
        code_block_lang = ""
        code_lines = []

        rel_path = doc_path.relative_to(addon_path)

        for line_num, line in enumerate(lines, 1):
            # Check for code block start
            match = re.match(r'^```(\w+)?', line)
            if match and not in_code_block:
                in_code_block = True
                code_block_start = line_num
                code_block_lang = match.group(1) or ""
                code_lines = []
                continue

            # Check for code block end
            if re.match(r'^```\s*$', line) and in_code_block:
                in_code_block = False

                # Only analyze Lua code blocks
                if code_block_lang.lower() in ('lua', ''):
                    block_issues = self._analyze_lua_block(
                        code_lines, code_block_start, str(rel_path)
                    )
                    issues.extend(block_issues)
                continue

            if in_code_block:
                code_lines.append(line)

        return issues

    def _analyze_lua_block(
        self,
        code_lines: List[str],
        start_line: int,
        file_path: str
    ) -> List[DocIssue]:
        """Analyze a Lua code block for outdated references."""
        issues = []
        code = "\n".join(code_lines)

        # Look for function calls that might be outdated
        # Pattern: word followed by ( or :word(
        call_pattern = re.compile(r'(\w+(?:[:.]\w+)*)\s*\(')

        for match in call_pattern.finditer(code):
            func_name = match.group(1)

            # Skip common Lua builtins
            if func_name in ('print', 'pairs', 'ipairs', 'type', 'tostring', 'tonumber',
                            'table', 'string', 'math', 'if', 'for', 'while', 'function'):
                continue

            # Check if it looks like a WoW API call (C_Namespace or camelCase global)
            if func_name.startswith('C_') or (func_name[0].isupper() and '.' not in func_name):
                # This might be a WoW API - could check against known deprecated APIs
                pass

            # Check against known addon functions
            base_func = func_name.split(':')[-1].split('.')[-1]
            if base_func not in self.existing_functions and func_name not in self.existing_functions:
                # Only flag if it looks like an addon-specific function
                if self.existing_functions and any(
                    func_name.startswith(prefix) for prefix in ['Addon', 'Module', 'self']
                ):
                    issues.append(DocIssue(
                        category="outdated_example",
                        confidence=DocConfidence.SUSPICIOUS.value,
                        file=file_path,
                        line=start_line,
                        name=func_name,
                        message=f"Code example references '{func_name}' which may not exist",
                        suggestion="Verify example code is still valid"
                    ))

        return issues

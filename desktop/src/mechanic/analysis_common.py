"""
Shared helpers for the addon analyzers (deadcode, security, complexity, staledocs).

- one ``*.lua`` walker with consistent Libs exclusion
- a per-run source cache (each file is read and parsed once)
- TOC selection
- result finalisation: severity sort before truncation, counts, reasoning text
"""

import os
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Sequence, Tuple

from .lua_structure import LuaFile, parse_lua

# Embedded third-party code lives in folders with these names (any case).
LIB_DIR_NAMES = frozenset({"libs", "lib"})

# Directories never worth scanning (VCS metadata, caches, worktrees, vendored JS).
_SKIPPED_DIR_NAMES = frozenset({"node_modules", "__pycache__"})

# Default number of issues returned by an analyzer command. The summary always
# reports counts for every issue found; ``truncated`` tells callers that the
# returned list was cut to the ``limit`` most severe issues.
DEFAULT_ISSUE_LIMIT = 200
MAX_ISSUE_LIMIT = 2000

_CONFIDENCE_RANK = {"definite": 0, "likely": 1, "suspicious": 2}


def is_lib_path(relative_parts: Sequence[str]) -> bool:
    """True if the directory part of a path relative to the addon is a Libs folder."""
    return any(part.lower() in LIB_DIR_NAMES for part in relative_parts[:-1])


def iter_files(
    addon_path: Path, suffixes: Sequence[str], include_libs: bool = False
) -> List[Path]:
    """Files under ``addon_path`` with one of ``suffixes``, sorted by relative path.

    Libs/Lib directories are excluded case-insensitively, judged on the path
    relative to the addon root so a parent folder's name never matters. Hidden
    directories (``.git``, ``.claude``) and ``node_modules`` are skipped.
    """
    root = Path(addon_path)
    wanted = tuple(s.lower() for s in suffixes)
    found: List[Tuple[str, Path]] = []
    for dirpath, dirnames, filenames in os.walk(root):
        dirnames[:] = [
            d
            for d in dirnames
            if not d.startswith(".")
            and d not in _SKIPPED_DIR_NAMES
            and (include_libs or d.lower() not in LIB_DIR_NAMES)
        ]
        for name in filenames:
            if name.lower().endswith(wanted):
                path = Path(dirpath) / name
                found.append((str(path.relative_to(root)).lower(), path))
    found.sort(key=lambda item: item[0])
    return [path for _, path in found]


def iter_lua_files(addon_path: Path, include_libs: bool = False) -> List[Path]:
    """All ``*.lua`` files under ``addon_path`` (see :func:`iter_files`)."""
    return iter_files(addon_path, (".lua",), include_libs)


def relative_display(path: Path, root: Path) -> str:
    """Path relative to ``root`` for issue reports (resolving only as a fallback)."""
    try:
        return str(Path(path).relative_to(root))
    except ValueError:
        try:
            return str(Path(path).resolve().relative_to(Path(root).resolve()))
        except (ValueError, OSError):
            return str(path)


class SourceCache:
    """Reads and parses each file once per analysis run; records unreadable files."""

    def __init__(self, root: Optional[Path] = None):
        self.root = root
        self._text: Dict[Path, Optional[str]] = {}
        self._parsed: Dict[Path, LuaFile] = {}
        self.errors: List[str] = []

    def read(self, path: Path) -> Optional[str]:
        path = Path(path)
        if path not in self._text:
            try:
                self._text[path] = path.read_text(encoding="utf-8", errors="replace")
            except OSError as exc:
                self._text[path] = None
                shown = relative_display(path, self.root) if self.root else str(path)
                self.errors.append(f"{shown}: {exc.strerror or exc}")
        return self._text[path]

    def parse(self, path: Path) -> Optional[LuaFile]:
        path = Path(path)
        if path not in self._parsed:
            text = self.read(path)
            if text is None:
                return None
            self._parsed[path] = parse_lua(text)
        return self._parsed[path]

    def readable(self, paths: Iterable[Path]) -> List[Path]:
        """Paths that could be read, in order (unreadable ones are in ``errors``)."""
        return [p for p in paths if self.read(p) is not None]


def find_main_toc(addon_path: Path, addon_name: str) -> Optional[Path]:
    """The addon's primary TOC: ``<name>.toc`` if present, else the first ``*.toc``."""
    toc_files = sorted(Path(addon_path).glob("*.toc"))
    for toc in toc_files:
        if toc.stem in (addon_name, addon_name.lstrip("!")):
            return toc
    return toc_files[0] if toc_files else None


def confidence_rank(confidence: str) -> int:
    return _CONFIDENCE_RANK.get(confidence, len(_CONFIDENCE_RANK))


def sort_issues(issues: list, category_order: Sequence[str] = ()) -> list:
    """Most severe first: confidence, then category priority, then location."""
    priority = {name: rank for rank, name in enumerate(category_order)}

    def key(issue):
        return (
            confidence_rank(getattr(issue, "confidence", "")),
            priority.get(issue.category, len(priority)),
            issue.file,
            getattr(issue, "line", 0),
        )

    return sorted(issues, key=key)


def finalize_issues(
    issues: list, limit: int, category_order: Sequence[str] = ()
) -> Tuple[list, bool, int]:
    """Sort by severity and cut to ``limit``. Returns ``(kept, truncated, total)``."""
    ordered = sort_issues(issues, category_order)
    total = len(ordered)
    return ordered[:limit], total > limit, total


def count_by(issues: list) -> Tuple[Dict[str, int], Dict[str, int]]:
    """Counts per category and per confidence over all issues."""
    by_category: Dict[str, int] = {}
    by_confidence: Dict[str, int] = {}
    for issue in issues:
        by_category[issue.category] = by_category.get(issue.category, 0) + 1
        conf = getattr(issue, "confidence", None)
        if conf is not None:
            by_confidence[conf] = by_confidence.get(conf, 0) + 1
    return by_category, by_confidence


def unknown_categories(requested: Optional[Sequence[str]], enum_cls) -> List[str]:
    """Names in ``requested`` that are not members of ``enum_cls``."""
    if not requested:
        return []
    valid = {member.value for member in enum_cls}
    return [name for name in requested if name not in valid]


def describe_findings(
    noun: str,
    addon: str,
    total: int,
    by_category: Dict[str, int],
    scanned: int,
    scanned_unit: str = "files",
    extra: str = "",
) -> str:
    """One-line reasoning text shared by the analyzer commands."""
    if total == 0:
        return f"No {noun} found in {addon} ({scanned} {scanned_unit} analyzed)"
    parts = [
        f"{count} {cat.replace('_', ' ')}"
        for cat, count in sorted(by_category.items(), key=lambda item: -item[1])
    ]
    text = f"Found {total} {noun} in {addon}: {', '.join(parts[:3])}"
    if len(parts) > 3:
        text += f" (+{len(parts) - 3} more categories)"
    return text + extra

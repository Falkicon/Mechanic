"""Small helpers shared by the addon-facing command modules."""

import re
from pathlib import Path
from typing import Any, Tuple

from afd import CommandResult, error

_RESERVED = '<>:"/\\|?*'
_SEMVER_LIKE = re.compile(r"^[0-9A-Za-z][0-9A-Za-z._+-]{0,63}$")


def addon_not_found(
    addon: str, suggestion: str = "Check the addon name or provide an explicit path"
) -> CommandResult[Any]:
    return error(
        code="ADDON_NOT_FOUND",
        message=f"Addon '{addon}' not found",
        suggestion=suggestion,
    )


def is_safe_component(value: Any) -> bool:
    """True when ``value`` is a single, non-reserved file or folder name."""
    return (
        isinstance(value, str)
        and bool(value.strip())
        and value not in (".", "..")
        and value == value.strip()
        and not value.endswith(".")
        and not any(c in _RESERVED or ord(c) < 32 for c in value)
    )


def is_valid_version(value: Any) -> bool:
    """Release version text that is safe in a TOC line, changelog and git tag."""
    return isinstance(value, str) and bool(_SEMVER_LIKE.match(value.lstrip("v")))


def read_text_eol(path: Path) -> Tuple[str, str]:
    """Read a text file as ``(text_with_LF, eol)`` so it can be written back unchanged."""
    raw = path.read_bytes().decode("utf-8", errors="surrogateescape")
    eol = "\r\n" if "\r\n" in raw else "\n"
    return raw.replace("\r\n", "\n"), eol


def write_text_eol(path: Path, text: str, eol: str) -> None:
    path.write_bytes(text.replace("\n", eol).encode("utf-8", errors="surrogateescape"))


def is_under_libs(path: Path, root: Path) -> bool:
    """True when ``path`` is inside a Libs folder below ``root`` (case-insensitive)."""
    try:
        parts = path.relative_to(root).parts[:-1]
    except ValueError:
        return False
    return any(part.lower() == "libs" for part in parts)

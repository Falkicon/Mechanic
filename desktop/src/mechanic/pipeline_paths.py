"""Location helpers shared by the API definition / sandbox pipeline commands.

The repository root is the directory that contains ``Mechanic/Mechanic.toc``;
the addon folder the game loads (``Mechanic/``) and its ``UI/APIDefs`` tree live
beneath it.  ``config.dev_path`` is the ``_dev_`` folder *above* the repository,
so paths must never be built as ``dev_path / "Mechanic" / "UI"``.
"""

import os
from pathlib import Path
from typing import Iterable, Optional

from .config import get_config

APIDEFS_RELATIVE = Path("Mechanic") / "UI" / "APIDefs"


def _is_repo_root(path: Path) -> bool:
    return (path / "Mechanic" / "Mechanic.toc").is_file()


def _candidate_roots() -> Iterable[Path]:
    dev_path = get_config().dev_path
    if dev_path:
        # _dev_/Mechanic is the repository; tolerate dev_path being the repo itself.
        yield dev_path / "Mechanic"
        yield dev_path
    # Running from a source checkout: desktop/src/mechanic/pipeline_paths.py.
    for parent in Path(__file__).resolve().parents:
        yield parent


def find_repo_root() -> Optional[Path]:
    """Return the Mechanic repository root, or None when it cannot be located."""
    for candidate in _candidate_roots():
        try:
            if _is_repo_root(candidate):
                return candidate
        except OSError:
            continue
    return None


def get_apidefs_dir() -> Optional[Path]:
    """Return the canonical ``Mechanic/UI/APIDefs`` folder (it may not exist yet)."""
    root = find_repo_root()
    return root / APIDEFS_RELATIVE if root else None


def find_lua_exe() -> Optional[Path]:
    """Find a Lua 5.1 executable: ``MECHANIC_LUA``, bundled ``bin/``, then PATH."""
    from .setup import find_tool

    override = os.environ.get("MECHANIC_LUA")
    if override and Path(override).is_file():
        return Path(override)
    return find_tool("lua") or find_tool("lua5.1")

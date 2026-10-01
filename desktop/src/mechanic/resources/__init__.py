"""Data files that ship inside the wheel (Lua helpers, JSON databases).

Commands must load these through :func:`resource_path` instead of walking up
from ``__file__`` to a source checkout, which does not exist in an installed
wheel.
"""

from pathlib import Path

_RESOURCE_DIR = Path(__file__).resolve().parent


def resource_path(name: str) -> Path:
    """Return the path of a packaged resource file.

    The file may not exist (for example a resource that was never added);
    callers should check ``.exists()`` and return a structured error.
    """
    return _RESOURCE_DIR / name

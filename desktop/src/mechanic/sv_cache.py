"""Parse SavedVariables files once per on-disk revision.

``addon.output`` and the target helpers re-read the same (often multi-MB)
``!Mechanic.lua`` several times per request.  Entries are keyed by the file's
identity, modification time and size, so a file WoW rewrites is always
re-parsed.  Callers must treat the returned mapping as read-only.
"""

import threading
from collections import OrderedDict
from pathlib import Path
from typing import Any, Dict, Tuple

from .parsers import parse_savedvariables

_MAX_ENTRIES = 8
_lock = threading.Lock()
_cache: "OrderedDict[Tuple[str, int, int], Dict[str, Any]]" = OrderedDict()


def parse_sv_file(path: Path) -> Dict[str, Any]:
    """Return the parsed variables of a SavedVariables file (cached, read-only)."""
    path = Path(path)
    stat = path.stat()
    key = (str(path.resolve()), stat.st_mtime_ns, stat.st_size)
    with _lock:
        hit = _cache.get(key)
        if hit is not None:
            _cache.move_to_end(key)
            return hit
    parsed = parse_savedvariables(path.read_text(encoding="utf-8", errors="replace"))
    with _lock:
        _cache[key] = parsed
        while len(_cache) > _MAX_ENTRIES:
            _cache.popitem(last=False)
    return parsed


def clear_cache() -> None:
    with _lock:
        _cache.clear()

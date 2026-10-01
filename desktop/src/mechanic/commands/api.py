"""
API Reference Commands for Mechanic Desktop.

Provides static API lookup and test queue management:
- api.search: Search API definitions by name/pattern
- api.info: Get detailed info about a specific API
- api.list: List APIs by namespace or category
- api.queue: Queue API tests for in-game execution
- api.stats: Get API statistics

These commands work WITHOUT the game running - they read the APIDefs files directly.
"""

import asyncio
import math
import re
import threading
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

from ..targets import (
    DiagnosticTarget,
    SelectedTarget,
    TargetError,
    select_target,
    queue_target_lua,
)

from ..lua_strings import quote_lua_string as _lua_string
from ..pipeline_paths import get_apidefs_dir
from .apidefs import LuaParseError, _unescape_lua_string, parse_lua_table_literal


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════


class APISearchInput(BaseModel):
    query: str = Field(..., description="Search pattern (supports * wildcards)")
    category: Optional[str] = Field(None, description="Filter by category")
    namespace: Optional[str] = Field(None, description="Filter by namespace")
    limit: int = Field(20, ge=1, description="Max results to return")


class APISearchResult(BaseModel):
    apis: List[Dict[str, Any]]
    total: int
    query: str


class APIInfoInput(BaseModel):
    api_name: str = Field(..., description="Full API name (e.g., C_Spell.GetSpellInfo)")


class APIInfoResult(BaseModel):
    api: Dict[str, Any]
    found: bool


class APIListInput(BaseModel):
    namespace: Optional[str] = Field(
        None, description="Namespace to list (e.g., C_Spell)"
    )
    category: Optional[str] = Field(None, description="Category to list")
    limit: int = Field(50, ge=1, description="Max results")


class APIListResult(BaseModel):
    apis: List[Dict[str, Any]]
    total: int
    filter: str


class APIQueueInput(BaseModel):
    target: Optional[DiagnosticTarget] = None
    apis: List[str] = Field(..., description="List of API names to queue for testing")
    params: Optional[Dict[str, Dict[str, Any]]] = Field(
        None,
        description="Optional parameters per API: {'C_Spell.GetSpellInfo': {'spellID': 8690}}",
    )


class APIQueueResult(BaseModel):
    target: Optional[SelectedTarget] = None
    queued: List[str]
    queue_file: str
    message: str


class APIStatsResult(BaseModel):
    total: int
    by_category: Dict[str, int]
    by_namespace: Dict[str, int]
    with_secrets: int
    protected: int


# ═══════════════════════════════════════════════════════════════════════════════
# API DEFINITION PARSER
# ═══════════════════════════════════════════════════════════════════════════════


def get_apidefs_path() -> Optional[Path]:
    """Find the repository's Mechanic/UI/APIDefs folder (the one the TOC loads)."""
    path = get_apidefs_dir()
    return path if path is not None and path.is_dir() else None


_ENTRY_START = re.compile(r'^APIDefs\[("(?:\\.|[^"\\\n])*")\]\s*=\s*\{', re.MULTILINE)
_STRING_OR_BRACE = re.compile(r"\"(?:\\.|[^\"\\\n])*\"|'(?:\\.|[^'\\\n])*'|[{}]")


def _match_table_end(content: str, open_brace: int) -> int:
    """Index just past the brace matching ``content[open_brace]`` (string-aware)."""
    depth = 0
    for token in _STRING_OR_BRACE.finditer(content, open_brace):
        text = token.group(0)
        if text == "{":
            depth += 1
        elif text == "}":
            depth -= 1
            if depth == 0:
                return token.end()
    return len(content)


def parse_lua_table_simple(content: str) -> Dict[str, Any]:
    """
    Parse the APIDefs format: ``APIDefs["key"] = { ... }`` blocks.

    Only the entry's own top-level fields are read, so the ``name`` of a
    parameter or return value can never replace the API's ``name``.
    """
    apis: Dict[str, Any] = {}

    for match in _ENTRY_START.finditer(content):
        start = match.end() - 1
        end = _match_table_end(content, start)
        try:
            table = parse_lua_table_literal(content[start:end])
        except LuaParseError:
            continue
        if not isinstance(table, dict):
            continue

        api_key = table.get("key")
        if not isinstance(api_key, str):
            api_key = _unescape_lua_string(match.group(1)[1:-1])

        api_def: Dict[str, Any] = {"key": api_key}
        for field, value in table.items():
            if isinstance(value, str) and value.startswith("expr:"):
                continue  # unevaluated expression such as the legacy func = _G[...]
            if field in ("params", "returns"):
                items = value if isinstance(value, list) else []
                api_def[field] = [item for item in items if isinstance(item, dict)]
            elif isinstance(field, str):
                api_def[field] = value
        apis[api_key] = api_def

    return apis


_APIS_CACHE: Dict[str, Any] = {"path": None, "signature": None, "apis": {}}
_APIS_LOCK = threading.Lock()


def _apidefs_signature(path: Path) -> Tuple[Tuple[str, int, int], ...]:
    entries = []
    for lua_file in path.glob("*.lua"):
        stat = lua_file.stat()
        entries.append((lua_file.name, stat.st_mtime_ns, stat.st_size))
    return tuple(sorted(entries))


def load_all_apis() -> Dict[str, Dict[str, Any]]:
    """
    Load all API definitions from the APIDefs folder.

    The parsed result is cached per folder and invalidated when any file's
    modification time or size changes.  Treat the returned mapping as
    read-only; copy an entry before modifying it.
    """
    path = get_apidefs_path()
    if not path:
        return {}

    signature = _apidefs_signature(path)
    with _APIS_LOCK:
        if _APIS_CACHE["path"] == str(path) and _APIS_CACHE["signature"] == signature:
            return _APIS_CACHE["apis"]

        all_apis: Dict[str, Dict[str, Any]] = {}
        for lua_file in sorted(path.glob("*.lua")):
            try:
                content = lua_file.read_text(encoding="utf-8")
            except (OSError, UnicodeDecodeError):
                continue
            all_apis.update(parse_lua_table_simple(content))

        _APIS_CACHE.update(path=str(path), signature=signature, apis=all_apis)
        return all_apis


def format_signature(api: Dict[str, Any]) -> str:
    """Generate human-readable signature from API definition."""
    params = api.get("params", [])
    returns = api.get("returns", [])

    param_str = (
        ", ".join(f"{p.get('name', '?')}: {p.get('type', 'any')}" for p in params)
        if params
        else ""
    )

    return_str = (
        ", ".join(f"{r.get('name', '?')}: {r.get('type', 'any')}" for r in returns)
        if returns
        else "void"
    )

    return f"({param_str}) -> {return_str}"


# ═══════════════════════════════════════════════════════════════════════════════
# SAVEDVARIABLES WRITER
# ═══════════════════════════════════════════════════════════════════════════════


def find_addon_path() -> Optional[Path]:
    from ..targets import discover_targets

    candidates = [c for c in discover_targets() if Path(c.addon_path).exists()]
    return Path(select_target(candidates=candidates).addon_path) if candidates else None


def write_queue_file(
    queue: List[str],
    params: Optional[Dict[str, Dict[str, Any]]] = None,
    target: Optional[SelectedTarget] = None,
) -> Optional[Path]:
    """
    Write the test queue to a separate MechanicQueue.lua file in the addon folder.

    This file is read by the addon on load and won't be overwritten by WoW's
    SavedVariables system during /reload.
    """
    addon_path = Path(target.addon_path) if target else find_addon_path()
    if not addon_path or not addon_path.exists():
        return None

    queue_file = addon_path / "MechanicQueue.lua"

    # Build the Lua table for the queue
    queue_items = []
    for api in queue:
        api_params = params.get(api, {}) if params else {}
        params_lua = lua_encode_table(api_params) if api_params else "{}"
        queue_items.append(
            f'\t{{\n\t\t["api"] = {_lua_encode(api)},\n'
            f'\t\t["params"] = {params_lua},\n\t}}'
        )

    queue_lua = "{\n" + ",\n".join(queue_items) + "\n}"

    content = f"""-- Auto-generated by Mechanic Desktop CLI
-- This file is read by Mechanic on addon load, then deleted
-- Do not edit manually

MECHANIC_API_QUEUE = {queue_lua}
"""

    if target:
        content = queue_target_lua(target) + content
    queue_file.write_text(content, encoding="utf-8")
    return queue_file


def lua_encode_table(d: Dict[str, Any]) -> str:
    """Encode a Python mapping as a Lua table without producing executable text."""
    return _lua_encode(d)


def _lua_encode(value: Any) -> str:
    """Encode the JSON-like values accepted by API queue parameters."""
    if value is None:
        return "nil"
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, str):
        return _lua_string(value)
    if isinstance(value, int):
        return str(value)
    if isinstance(value, float):
        if not math.isfinite(value):
            raise ValueError("Lua queue parameters cannot contain NaN or infinity")
        return repr(value)
    if isinstance(value, dict):
        items = [
            f"[{_lua_encode(str(key))}] = {_lua_encode(item)}"
            for key, item in value.items()
        ]
        return "{ " + ", ".join(items) + " }"
    if isinstance(value, (list, tuple)):
        return "{ " + ", ".join(_lua_encode(item) for item in value) + " }"
    raise ValueError(f"Unsupported Lua queue parameter type: {type(value).__name__}")


# ═══════════════════════════════════════════════════════════════════════════════
# COMMANDS
# ═══════════════════════════════════════════════════════════════════════════════


def register_commands(server):
    """Register API reference commands with the server."""

    @server.command(
        name="api.search",
        description="Search WoW APIs by name pattern. Works offline (reads static definitions).",
        input_schema=APISearchInput,
        output_schema=APISearchResult,
    )
    async def api_search(
        input: APISearchInput, context: Any = None
    ) -> CommandResult[APISearchResult]:
        all_apis = await asyncio.to_thread(load_all_apis)
        if not all_apis:
            return error(
                code="NO_APIDEFS",
                message="Could not find APIDefs folder",
                suggestion="Run from the Mechanic repository (Mechanic/UI/APIDefs must exist)",
            )

        # Convert wildcard to regex
        pattern = re.escape(input.query).replace(r"\*", ".*").replace(r"\?", ".")
        regex = re.compile(pattern, re.IGNORECASE)

        matches = []
        for key, api in all_apis.items():
            # Match against key or name
            if regex.search(key) or regex.search(api.get("name", "")):
                # Apply filters
                if input.category and api.get("category") != input.category:
                    continue
                if input.namespace:
                    ns = key.split(".")[0] if "." in key else key
                    if ns.lower() != input.namespace.lower():
                        continue

                matches.append(
                    {
                        "key": key,
                        "signature": format_signature(api),
                        "category": api.get("category"),
                        "protected": api.get("protected", False),
                        "midnightImpact": api.get("midnightImpact"),
                    }
                )

        # Sort by key and limit
        matches.sort(key=lambda x: x["key"])
        total = len(matches)
        matches = matches[: input.limit]

        src = create_source(type="file", id="apidefs", title="APIDefs (static)")

        return success(
            data=APISearchResult(apis=matches, total=total, query=input.query),
            reasoning=f"Found {total} APIs matching '{input.query}'",
            sources=[src],
        )

    @server.command(
        name="api.info",
        description="Get detailed information about a specific WoW API",
        input_schema=APIInfoInput,
        output_schema=APIInfoResult,
    )
    async def api_info(
        input: APIInfoInput, context: Any = None
    ) -> CommandResult[APIInfoResult]:
        all_apis = await asyncio.to_thread(load_all_apis)

        # Try exact match first
        api = all_apis.get(input.api_name)

        # Try case-insensitive match
        if not api:
            for key, val in all_apis.items():
                if key.lower() == input.api_name.lower():
                    api = val
                    break

        if not api:
            return success(
                data=APIInfoResult(api={}, found=False),
                reasoning=f"API '{input.api_name}' not found in definitions",
            )

        api = dict(api)  # the loader cache is shared; never mutate its entries
        api["signature"] = format_signature(api)

        src = create_source(
            type="file", id="apidefs", title=f"APIDefs/{api['key'].split('.')[0]}.lua"
        )

        return success(
            data=APIInfoResult(api=api, found=True),
            reasoning=f"Found API definition for {api['key']}",
            sources=[src],
        )

    @server.command(
        name="api.list",
        description="List APIs by namespace or category",
        input_schema=APIListInput,
        output_schema=APIListResult,
    )
    async def api_list(
        input: APIListInput, context: Any = None
    ) -> CommandResult[APIListResult]:
        all_apis = await asyncio.to_thread(load_all_apis)

        matches = []
        filter_desc = "all"

        for key, api in all_apis.items():
            # Filter by namespace
            if input.namespace:
                ns = key.split(".")[0] if "." in key else key
                if ns.lower() != input.namespace.lower():
                    continue
                filter_desc = f"namespace:{input.namespace}"

            # Filter by category
            if input.category:
                if api.get("category") != input.category:
                    continue
                filter_desc = f"category:{input.category}"

            matches.append(
                {
                    "key": key,
                    "name": api.get("name"),
                    "signature": format_signature(api),
                    "category": api.get("category"),
                    "protected": api.get("protected", False),
                }
            )

        matches.sort(key=lambda x: x["key"])
        total = len(matches)
        matches = matches[: input.limit]

        return success(
            data=APIListResult(apis=matches, total=total, filter=filter_desc),
            reasoning=f"Listed {total} APIs ({filter_desc})",
        )

    @server.command(
        name="api.queue",
        description="Queue API tests for in-game execution. After running this, /reload in WoW to execute tests.",
        input_schema=APIQueueInput,
        output_schema=APIQueueResult,
    )
    async def api_queue(
        input: APIQueueInput, context: Any = None
    ) -> CommandResult[APIQueueResult]:
        # Validate APIs exist
        all_apis = await asyncio.to_thread(load_all_apis)
        valid_apis = []
        invalid_apis = []
        api_names_by_case = {name.lower(): name for name in all_apis}

        for api_name in input.apis:
            canonical_name = api_names_by_case.get(api_name.lower())
            if canonical_name:
                valid_apis.append(canonical_name)
            else:
                invalid_apis.append(api_name)

        if not valid_apis:
            return error(
                code="NO_VALID_APIS",
                message=f"None of the specified APIs were found: {invalid_apis}",
                suggestion="Use 'api.search' to find valid API names",
            )

        # Write to queue file in addon folder (not SavedVariables)
        normalized_params = None
        if input.params:
            normalized_params = {
                api_names_by_case.get(name.lower(), name): values
                for name, values in input.params.items()
            }
        try:
            if normalized_params:
                _lua_encode(normalized_params)
            selected = select_target(input.target)
            queue_path = write_queue_file(valid_apis, normalized_params, selected)
        except TargetError as exc:
            return exc.result()
        except ValueError as exc:
            return error(
                code="INVALID_PARAMS",
                message=str(exc),
                suggestion=(
                    "Use strings, numbers, booleans, null, lists, or nested "
                    "objects as API parameters"
                ),
            )

        if not queue_path:
            return error(
                code="ADDON_NOT_FOUND",
                message="Could not find !Mechanic addon folder",
                suggestion="Ensure !Mechanic is installed in Interface/AddOns",
            )

        message = f"Queued {len(valid_apis)} API tests. /reload in WoW to execute."
        if invalid_apis:
            message += f" ({len(invalid_apis)} invalid APIs skipped: {invalid_apis})"

        return success(
            data=APIQueueResult(
                target=selected,
                queued=valid_apis,
                queue_file=str(queue_path),
                message=message,
            ),
            reasoning=f"Wrote test queue to {queue_path.name}",
        )

    @server.command(
        name="api.stats",
        description="Get statistics about available WoW APIs",
        output_schema=APIStatsResult,
    )
    async def api_stats(
        input: Dict[str, Any], context: Any = None
    ) -> CommandResult[APIStatsResult]:
        all_apis = await asyncio.to_thread(load_all_apis)

        by_category: Dict[str, int] = {}
        by_namespace: Dict[str, int] = {}
        with_secrets = 0
        protected = 0

        for key, api in all_apis.items():
            # Count by category
            cat = api.get("category", "unknown")
            by_category[cat] = by_category.get(cat, 0) + 1

            # Count by namespace
            ns = key.split(".")[0] if "." in key else "Global"
            by_namespace[ns] = by_namespace.get(ns, 0) + 1

            # Count secrets
            returns = api.get("returns", [])
            if any(r.get("canBeSecret") for r in returns):
                with_secrets += 1

            # Count protected
            if api.get("protected"):
                protected += 1

        return success(
            data=APIStatsResult(
                total=len(all_apis),
                by_category=by_category,
                by_namespace=dict(
                    sorted(by_namespace.items(), key=lambda x: -x[1])[:20]
                ),
                with_secrets=with_secrets,
                protected=protected,
            ),
            reasoning=f"Analyzed {len(all_apis)} API definitions",
        )

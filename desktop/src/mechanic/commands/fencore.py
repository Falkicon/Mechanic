"""
FenCore Catalog Commands for Mechanic Desktop.

Provides MCP-discoverable catalog of FenCore logic domains:
- fencore-catalog: Get full domain/function catalog
- fencore-search: Search functions by name/description
- fencore-info: Get detailed function info

The catalog is read from the selected diagnostic target's saved MechanicDB
(the same client/account/character/profile selection every other diagnostic
command uses).
"""

import asyncio
from pathlib import Path
from typing import Any, Dict, List, Optional

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

from ..sv_cache import parse_sv_file
from ..targets import (
    DiagnosticTarget,
    TargetError,
    read_db,
    select_target,
    validate_db,
)


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════


class CatalogInput(BaseModel):
    target: Optional[DiagnosticTarget] = None


class FunctionSchema(BaseModel):
    description: str = ""
    params: List[Dict[str, Any]] = []
    returns: Dict[str, Any] = {}
    example: Optional[str] = None


class DomainSchema(BaseModel):
    functions: Dict[str, FunctionSchema] = {}


class CatalogOutput(BaseModel):
    version: str
    domains: Dict[str, Dict[str, Any]]
    total_functions: int


class SearchInput(BaseModel):
    target: Optional[DiagnosticTarget] = None
    query: str = Field(
        ..., description="Search query (partial match on name or description)"
    )
    limit: int = Field(20, ge=1, description="Maximum results to return")


class SearchResult(BaseModel):
    domain: str
    name: str
    full_name: str
    description: str


class SearchOutput(BaseModel):
    query: str
    results: List[SearchResult]
    total: int


class InfoInput(BaseModel):
    target: Optional[DiagnosticTarget] = None
    domain: str = Field(..., description="Domain name (e.g., 'Math')")
    function: str = Field(..., description="Function name (e.g., 'Clamp')")


class InfoOutput(BaseModel):
    domain: str
    name: str
    full_name: str
    description: str
    params: List[Dict[str, Any]]
    returns: Dict[str, Any]
    example: Optional[str] = None


# ═══════════════════════════════════════════════════════════════════════════════
# HELPERS
# ═══════════════════════════════════════════════════════════════════════════════


def _catalog_in(container: Any) -> Optional[Dict]:
    """``container.<registered|addonData>.FenCore.catalog`` when it is a table."""
    if not isinstance(container, dict):
        return None
    for key in ("addonData", "registered"):
        group = container.get(key)
        fencore = group.get("FenCore") if isinstance(group, dict) else None
        catalog = fencore.get("catalog") if isinstance(fencore, dict) else None
        if isinstance(catalog, dict):
            return catalog
    return None


def get_fencore_catalog(target: Optional[DiagnosticTarget] = None) -> Optional[Dict]:
    """
    Get the FenCore catalog FenCore registered with MechanicLib for ``target``.

    The selected profile is searched first, then the database root. Raises
    TargetError when the target cannot be selected or read.
    """
    selected = select_target(target)
    path = Path(selected.sv_path)
    try:
        db = validate_db(parse_sv_file(path).get("MechanicDB"))
    except TargetError:
        raise
    except Exception:
        db = read_db(path)  # raises a TargetError that names the file
    profile = db.get("profiles", {}).get(selected.profile) if selected.profile else db
    return _catalog_in(profile) or _catalog_in(db)


async def _load_catalog(target: Optional[DiagnosticTarget]):
    """Return ``(catalog, None)`` or ``(None, error_result)``."""
    try:
        catalog = await asyncio.to_thread(get_fencore_catalog, target)
    except TargetError as exc:
        return None, exc.result()
    if not catalog:
        return None, error(
            code="CATALOG_NOT_FOUND",
            message="FenCore catalog not found in the selected MechanicDB",
            suggestion="Ensure FenCore is loaded in WoW, /reload, then retry",
        )
    return catalog, None


def _domains(catalog: Dict) -> Dict[str, Any]:
    domains = catalog.get("domains", {})
    return domains if isinstance(domains, dict) else {}


# ═══════════════════════════════════════════════════════════════════════════════
# COMMANDS
# ═══════════════════════════════════════════════════════════════════════════════


def register_commands(server):
    """Register FenCore commands with the server."""

    @server.command(
        name="fencore-catalog",
        description="Get full catalog of FenCore logic domains and functions",
        input_schema=CatalogInput,
        output_schema=CatalogOutput,
    )
    async def fencore_catalog(
        input: CatalogInput, context: Any = None
    ) -> CommandResult[CatalogOutput]:
        catalog, failure = await _load_catalog(input.target)
        if failure:
            return failure

        domains = _domains(catalog)
        total = sum(len(d) for d in domains.values() if isinstance(d, dict))

        src = create_source(
            type="game",
            id="fencore",
            title="FenCore Library",
        )

        return success(
            data=CatalogOutput(
                version=str(catalog.get("version", "unknown")),
                domains={k: v for k, v in domains.items() if isinstance(v, dict)},
                total_functions=total,
            ),
            reasoning=f"Found {len(domains)} domains with {total} functions",
            sources=[src],
            confidence=1.0,
        )

    @server.command(
        name="fencore-search",
        description="Search FenCore functions by name or description",
        input_schema=SearchInput,
        output_schema=SearchOutput,
    )
    async def fencore_search(
        input: SearchInput, context: Any = None
    ) -> CommandResult[SearchOutput]:
        catalog, failure = await _load_catalog(input.target)
        if failure:
            return failure

        query_lower = input.query.lower()
        results = []

        for domain_name, domain in _domains(catalog).items():
            if not isinstance(domain, dict):
                continue
            for func_name, func_info in domain.items():
                if not isinstance(func_info, dict):
                    continue
                full_name = f"{domain_name}.{func_name}"
                description = str(func_info.get("description", ""))

                if (
                    query_lower in full_name.lower()
                    or query_lower in description.lower()
                ):
                    results.append(
                        SearchResult(
                            domain=domain_name,
                            name=func_name,
                            full_name=full_name,
                            description=description,
                        )
                    )

        # Name matches first
        results.sort(
            key=lambda r: (
                0 if query_lower in r.name.lower() else 1,
                r.full_name.lower(),
            )
        )

        return success(
            data=SearchOutput(
                query=input.query,
                results=results[: input.limit],
                total=len(results),
            ),
            reasoning=f"Found {len(results)} functions matching '{input.query}'",
        )

    @server.command(
        name="fencore-info",
        description="Get detailed info about a specific FenCore function",
        input_schema=InfoInput,
        output_schema=InfoOutput,
    )
    async def fencore_info(
        input: InfoInput, context: Any = None
    ) -> CommandResult[InfoOutput]:
        catalog, failure = await _load_catalog(input.target)
        if failure:
            return failure

        domains = _domains(catalog)
        domain = domains.get(input.domain)

        if not domain or not isinstance(domain, dict):
            return error(
                code="DOMAIN_NOT_FOUND",
                message=f"Domain '{input.domain}' not found",
                suggestion=f"Available domains: {', '.join(domains)}",
            )

        func_info = domain.get(input.function)

        if not func_info or not isinstance(func_info, dict):
            return error(
                code="FUNCTION_NOT_FOUND",
                message=f"Function '{input.function}' not found in {input.domain}",
                suggestion=f"Available functions: {', '.join(domain)}",
            )

        params = func_info.get("params", [])
        returns = func_info.get("returns", {})
        return success(
            data=InfoOutput(
                domain=input.domain,
                name=input.function,
                full_name=f"{input.domain}.{input.function}",
                description=str(func_info.get("description", "")),
                params=[p for p in params if isinstance(p, dict)]
                if isinstance(params, list)
                else [],
                returns=returns if isinstance(returns, dict) else {},
                example=func_info.get("example"),
            ),
            reasoning=f"Retrieved info for FenCore.{input.domain}.{input.function}",
        )

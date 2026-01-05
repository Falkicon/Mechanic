"""
Atlas icon commands for WoW addon development.
Scans and searches Blizzard UI atlas icons.

Migrated from ADDON_DEV/Tools/AtlasScanner.
"""

import json
import re
from pathlib import Path
from typing import Any, Dict, List, Optional

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

from ..config import get_config


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════

class AtlasScanInput(BaseModel):
    source_path: str = Field(..., description="Path to wow-ui-source repository root")
    output_path: Optional[str] = Field(default=None, description="Output path for atlas_index.json (defaults to data_dir)")


class AtlasScanOutput(BaseModel):
    atlas_count: int = Field(..., description="Number of unique atlases found")
    xml_count: int = Field(..., description="Atlases found in XML files")
    lua_count: int = Field(..., description="Atlases found in Lua files")
    output_file: str = Field(..., description="Path to generated index file")


class AtlasSearchInput(BaseModel):
    query: str = Field(..., description="Search query for atlas icons (supports * wildcards)")
    limit: int = Field(default=20, description="Maximum results to return")
    include_files: bool = Field(default=False, description="Include source file paths in results")


class AtlasIcon(BaseModel):
    name: str = Field(..., description="Atlas icon name")
    types: Optional[List[str]] = Field(default=None, description="File types where found (xml, lua)")
    files: Optional[List[str]] = Field(default=None, description="Source files containing this atlas")


class AtlasSearchOutput(BaseModel):
    query: str = Field(..., description="The search query used")
    count: int = Field(..., description="Number of matches found")
    icons: List[AtlasIcon] = Field(..., description="Matching atlas icons")
    truncated: bool = Field(default=False, description="Whether results were truncated")


# ═══════════════════════════════════════════════════════════════════════════════
# REGEX PATTERNS
# ═══════════════════════════════════════════════════════════════════════════════

XML_ATLAS_RE = re.compile(r'atlas\s*=\s*"([^"]+)"', re.IGNORECASE)
LUA_ATLAS_RE = re.compile(r'SetAtlas\s*\(\s*"([^"]+)"', re.IGNORECASE)


# ═══════════════════════════════════════════════════════════════════════════════
# HELPER FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════

def _get_default_index_path() -> Path:
    """Get default path for atlas_index.json."""
    config = get_config()
    return config.data_dir / "atlas_index.json"


def _find_atlas_index() -> Optional[Path]:
    """Find atlas_index.json in configured locations."""
    config = get_config()
    search_paths = []

    # Check data directory first
    search_paths.append(config.data_dir / "atlas_index.json")

    # Check legacy locations
    if config.dev_path:
        search_paths.extend([
            config.dev_path / "ADDON_DEV" / "Tools" / "AtlasScanner" / "atlases.json",
            config.dev_path / "ADDON_DEV" / "Tools" / "AtlasScanner" / "atlas_index.json",
        ])

    for path in search_paths:
        if path.exists():
            return path

    return None


def _wildcard_to_regex(pattern: str) -> re.Pattern:
    """Convert a wildcard pattern to regex."""
    # Escape special regex chars except *
    escaped = re.escape(pattern).replace(r'\*', '.*')
    return re.compile(f'^{escaped}$', re.IGNORECASE)


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND IMPLEMENTATIONS
# ═══════════════════════════════════════════════════════════════════════════════

async def _atlas_scan(input: AtlasScanInput, context: Any = None) -> CommandResult[AtlasScanOutput]:
    """
    Scan wow-ui-source for atlas icons and generate atlas_index.json.

    Searches XML and Lua files for atlas references and builds a searchable index.
    """
    source_path = Path(input.source_path)
    if not source_path.exists():
        return error(
            code="SOURCE_NOT_FOUND",
            message=f"Source path not found: {source_path}",
            suggestion="Clone wow-ui-source: git clone https://github.com/Gethe/wow-ui-source"
        )

    # Find the Interface/AddOns directory
    addons_path = source_path / "Interface" / "AddOns"
    if not addons_path.exists():
        # Try alternate structures
        for alt in ["", "Interface"]:
            test_path = source_path / alt if alt else source_path
            if (test_path / "Blizzard_ActionBar").exists() or (test_path / "Blizzard_UIWidgets").exists():
                addons_path = test_path
                break
        else:
            return error(
                code="INVALID_SOURCE",
                message="Could not find Blizzard addons in source path",
                suggestion="Ensure source_path points to wow-ui-source root or Interface/AddOns"
            )

    # Output path
    output_file = Path(input.output_path) if input.output_path else _get_default_index_path()
    output_file.parent.mkdir(parents=True, exist_ok=True)

    # Scan for atlases
    atlases: Dict[str, Dict] = {}
    xml_count = 0
    lua_count = 0

    for file_path in addons_path.rglob("*"):
        if file_path.suffix not in [".xml", ".lua"]:
            continue

        try:
            content = file_path.read_text(encoding="utf-8", errors="ignore")

            if file_path.suffix == ".xml":
                matches = XML_ATLAS_RE.findall(content)
                for match in matches:
                    if match not in atlases:
                        atlases[match] = {"files": set(), "types": set()}
                    try:
                        rel_path = str(file_path.relative_to(source_path))
                    except ValueError:
                        rel_path = str(file_path)
                    atlases[match]["files"].add(rel_path)
                    atlases[match]["types"].add("xml")
                    xml_count += 1

            elif file_path.suffix == ".lua":
                matches = LUA_ATLAS_RE.findall(content)
                for match in matches:
                    if match not in atlases:
                        atlases[match] = {"files": set(), "types": set()}
                    try:
                        rel_path = str(file_path.relative_to(source_path))
                    except ValueError:
                        rel_path = str(file_path)
                    atlases[match]["files"].add(rel_path)
                    atlases[match]["types"].add("lua")
                    lua_count += 1

        except Exception:
            continue

    # Convert to serializable format
    index_data = {
        "meta": {
            "source": str(source_path),
            "atlas_count": len(atlases),
        },
        "atlases": {
            name: {
                "files": sorted(list(data["files"])),
                "types": sorted(list(data["types"]))
            }
            for name, data in sorted(atlases.items())
        }
    }

    # Write index
    output_file.write_text(json.dumps(index_data, indent=2), encoding="utf-8")

    return success(
        data=AtlasScanOutput(
            atlas_count=len(atlases),
            xml_count=xml_count,
            lua_count=lua_count,
            output_file=str(output_file)
        ),
        reasoning=f"Scanned {addons_path} and found {len(atlases)} unique atlas icons",
        sources=[create_source(type="directory", id="wow-ui-source", title="WoW UI Source")]
    )


async def _atlas_search(input: AtlasSearchInput, context: Any = None) -> CommandResult[AtlasSearchOutput]:
    """
    Search Blizzard UI atlas icons by name pattern.

    Supports wildcards: 'UI-*-Icon' matches 'UI-Quest-Icon', 'UI-Frame-Icon', etc.
    """
    # Find atlas index
    index_path = _find_atlas_index()

    if not index_path:
        return error(
            code="INDEX_NOT_FOUND",
            message="Atlas index not found",
            suggestion="Run atlas.scan first to generate the index"
        )

    # Load index
    try:
        data = json.loads(index_path.read_text(encoding="utf-8"))
    except Exception as e:
        return error(
            code="INDEX_READ_ERROR",
            message=f"Failed to read atlas index: {e}",
            suggestion="Regenerate the index with atlas.scan"
        )

    # Handle both old format (dict of names) and new format (with meta)
    if "atlases" in data:
        atlases = data["atlases"]
    else:
        # Legacy format: direct dict
        atlases = data

    # Build search pattern
    query = input.query
    if '*' in query:
        pattern = _wildcard_to_regex(query)
        matches = [(name, info) for name, info in atlases.items() if pattern.match(name)]
    else:
        query_lower = query.lower()
        matches = [(name, info) for name, info in atlases.items() if query_lower in name.lower()]

    # Sort by name
    matches.sort(key=lambda x: x[0])

    # Build results
    total = len(matches)
    truncated = total > input.limit
    matches = matches[:input.limit]

    icons = []
    for name, info in matches:
        icon = AtlasIcon(name=name)
        if isinstance(info, dict):
            icon.types = info.get("types")
            if input.include_files:
                icon.files = info.get("files")
        icons.append(icon)

    return success(
        data=AtlasSearchOutput(
            query=input.query,
            count=total,
            icons=icons,
            truncated=truncated
        ),
        reasoning=f"Found {total} atlas icons matching '{input.query}'",
        sources=[create_source(type="file", id="atlas-index", title="Atlas Index", location=str(index_path))]
    )


# ═══════════════════════════════════════════════════════════════════════════════
# REGISTRATION
# ═══════════════════════════════════════════════════════════════════════════════

def register_commands(server):
    """Register atlas commands with the AFD server."""

    server.command(
        name="atlas.scan",
        description="Scan wow-ui-source for atlas icons and generate searchable index",
        input_schema=AtlasScanInput,
        output_schema=AtlasScanOutput,
    )(_atlas_scan)

    server.command(
        name="atlas.search",
        description="Search Blizzard UI atlas icons by name pattern (supports wildcards)",
        input_schema=AtlasSearchInput,
        output_schema=AtlasSearchOutput,
    )(_atlas_search)

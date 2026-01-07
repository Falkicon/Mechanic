"""
API Definition commands for WoW addon development.
Parses Blizzard API documentation and generates APIDefs for Mechanic.

Migrated from ADDON_DEV/Tools/APIPopulator to AFD commands.
Enhanced with Townlong Yak integration and pure-Python Lua parser.
"""

import io
import json
import os
import re
import subprocess
import tempfile
import zipfile
from collections import defaultdict
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

import requests

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

from ..config import get_config


# Townlong Yak constants
TOWNLONG_YAK_BASE = "https://www.townlong-yak.com/framexml"
TOWNLONG_YAK_BUILDS = f"{TOWNLONG_YAK_BASE}/builds"


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════

class APIPopulateInput(BaseModel):
    source_path: str = Field(..., description="Path to wow-ui-source repository root")
    output_path: Optional[str] = Field(default=None, description="Output path for api_database.json (defaults to data_dir)")


class APIPopulateOutput(BaseModel):
    api_count: int = Field(..., description="Number of APIs parsed")
    category_counts: Dict[str, int] = Field(..., description="APIs per category")
    output_file: str = Field(..., description="Path to generated database file")
    wow_version: str = Field(..., description="WoW version detected")


class APIGenerateInput(BaseModel):
    database_path: Optional[str] = Field(default=None, description="Path to api_database.json (defaults to data_dir)")
    output_path: Optional[str] = Field(default=None, description="Output path for APIDefs (defaults to Mechanic/UI/APIDefs)")


class APIGenerateOutput(BaseModel):
    api_count: int = Field(..., description="Number of APIs generated")
    namespace_count: int = Field(..., description="Number of namespace files created")
    output_dir: str = Field(..., description="Path to generated APIDefs folder")
    files: List[str] = Field(..., description="List of generated files")


class APIRefreshInput(BaseModel):
    source_path: str = Field(..., description="Path to wow-ui-source repository root or Townlong Yak extract")


class APIRefreshOutput(BaseModel):
    api_count: int = Field(..., description="Total APIs processed")
    namespace_count: int = Field(..., description="Number of namespace files created")
    database_file: str = Field(..., description="Path to database file")
    apidefs_dir: str = Field(..., description="Path to APIDefs folder")


class APIDownloadInput(BaseModel):
    build_id: Optional[str] = Field(default=None, description="Specific build ID to download (e.g., '64889'). If not provided, fetches latest.")
    output_path: Optional[str] = Field(default=None, description="Where to extract the download. Defaults to _dev_/framexml/{version}")
    refresh: bool = Field(default=True, description="Run api.refresh after download")


class APIDownloadOutput(BaseModel):
    build_id: str = Field(..., description="Downloaded build ID")
    version: str = Field(..., description="WoW version (e.g., '12.0.1.64889')")
    output_path: str = Field(..., description="Path where files were extracted")
    file_count: int = Field(..., description="Number of files extracted")
    api_count: Optional[int] = Field(default=None, description="Number of APIs if refresh was run")


# ═══════════════════════════════════════════════════════════════════════════════
# CATEGORY DEFINITIONS
# ═══════════════════════════════════════════════════════════════════════════════

CATEGORIES = [
    {"key": "combat_midnight", "name": "Combat (Midnight)", "priority": 1},
    {"key": "general", "name": "General", "priority": 10},
    {"key": "unit", "name": "Unit & Player", "priority": 2},
    {"key": "spell", "name": "Spells & Abilities", "priority": 3},
    {"key": "item", "name": "Items & Inventory", "priority": 4},
    {"key": "ui", "name": "UI & Frames", "priority": 5},
    {"key": "map", "name": "Maps & Navigation", "priority": 6},
    {"key": "social", "name": "Social & Communication", "priority": 7},
    {"key": "achievement", "name": "Achievements & Progress", "priority": 8},
    {"key": "profession", "name": "Professions & Crafting", "priority": 9},
]

NAMESPACE_CATEGORY_MAP = {
    # Unit & Player
    "unit": "unit", "player": "unit", "party": "unit", "raid": "unit",
    "aura": "unit", "buff": "unit", "casting": "unit", "health": "unit",
    # Spells & Abilities
    "spell": "spell", "talent": "spell", "spellbook": "spell", "actionbar": "spell",
    "cooldown": "spell", "gcd": "spell",
    # Items & Inventory
    "item": "item", "container": "item", "bag": "item", "equipment": "item",
    "loot": "item", "currency": "item", "bank": "item", "inventory": "item",
    # UI & Frames
    "frame": "ui", "widget": "ui", "tooltip": "ui", "editmode": "ui",
    "settings": "ui", "colorpicker": "ui",
    # Maps & Navigation
    "map": "map", "minimap": "map", "worldmap": "map", "taxi": "map",
    "areapoi": "map", "vignette": "map", "navigation": "map", "fogofwar": "map",
    # Social & Communication
    "chat": "social", "guild": "social", "friend": "social", "club": "social",
    "battlenet": "social", "voicechat": "social", "mail": "social",
    # Achievements & Progress
    "achievement": "achievement", "quest": "achievement", "reputation": "achievement",
    "majorfaction": "achievement", "campaign": "achievement",
    # Professions & Crafting
    "tradeskill": "profession", "crafting": "profession", "profession": "profession",
    "recipe": "profession",
}


# ═══════════════════════════════════════════════════════════════════════════════
# PURE-PYTHON LUA TABLE PARSER
# ═══════════════════════════════════════════════════════════════════════════════

def _parse_lua_table_python(file_path: Path) -> Optional[Dict]:
    """
    Pure-Python parser for Blizzard API documentation Lua files.
    Parses the structured Lua table format without requiring lua.exe.
    """
    try:
        content = file_path.read_text(encoding="utf-8")
    except Exception:
        return None

    result = {}

    # Extract namespace
    ns_match = re.search(r'Namespace\s*=\s*"([^"]+)"', content)
    if ns_match:
        result["Namespace"] = ns_match.group(1)

    # Extract name
    name_match = re.search(r'^\s*Name\s*=\s*"([^"]+)"', content, re.MULTILINE)
    if name_match:
        result["Name"] = name_match.group(1)

    # Parse Functions block
    functions = []
    func_block_match = re.search(r'Functions\s*=\s*\{(.+?)\n\t\},', content, re.DOTALL)
    if func_block_match:
        func_block = func_block_match.group(1)
        # Split into individual function definitions
        func_pattern = re.compile(r'\{\s*Name\s*=\s*"([^"]+)"(.+?)^\t\t\}', re.MULTILINE | re.DOTALL)
        for match in func_pattern.finditer(func_block):
            func_name = match.group(1)
            func_body = match.group(2)
            func_data = {"Name": func_name}

            # Extract secret flags
            for secret_key in ["SecretArguments", "SecretReturns", "SecretWhenSpellCooldownRestricted",
                               "SecretWhenSpellAuraRestricted", "SecretWhenCurveSecret"]:
                secret_match = re.search(rf'{secret_key}\s*=\s*([^,\n]+)', func_body)
                if secret_match:
                    val = secret_match.group(1).strip()
                    if val == "true":
                        func_data[secret_key] = True
                    elif val == "false":
                        func_data[secret_key] = False
                    elif val.startswith('"'):
                        func_data[secret_key] = val.strip('"')
                    else:
                        func_data[secret_key] = val

            # Extract HasRestrictions
            if re.search(r'HasRestrictions\s*=\s*true', func_body):
                func_data["HasRestrictions"] = True

            # Extract MayReturnNothing
            if re.search(r'MayReturnNothing\s*=\s*true', func_body):
                func_data["MayReturnNothing"] = True

            # Extract Documentation
            doc_match = re.search(r'Documentation\s*=\s*\{\s*"([^"]+)"', func_body)
            if doc_match:
                func_data["Documentation"] = [doc_match.group(1)]

            # Parse Arguments
            args = []
            args_match = re.search(r'Arguments\s*=\s*\{(.+?)\n\t\t\t\}', func_body, re.DOTALL)
            if args_match:
                args_block = args_match.group(1)
                arg_pattern = re.compile(r'\{\s*Name\s*=\s*"([^"]+)"\s*,\s*Type\s*=\s*"([^"]+)"([^}]*)\}', re.DOTALL)
                for arg_match in arg_pattern.finditer(args_block):
                    arg = {
                        "Name": arg_match.group(1),
                        "Type": arg_match.group(2),
                        "Nilable": "Nilable = true" in arg_match.group(3)
                    }
                    default_match = re.search(r'Default\s*=\s*([^,}]+)', arg_match.group(3))
                    if default_match:
                        default_val = default_match.group(1).strip()
                        if default_val == "true":
                            arg["Default"] = True
                        elif default_val == "false":
                            arg["Default"] = False
                        elif default_val.isdigit():
                            arg["Default"] = int(default_val)
                        elif default_val.startswith('"'):
                            arg["Default"] = default_val.strip('"')
                    args.append(arg)
            if args:
                func_data["Arguments"] = args

            # Parse Returns
            returns = []
            returns_match = re.search(r'Returns\s*=\s*\{(.+?)\n\t\t\t\}', func_body, re.DOTALL)
            if returns_match:
                returns_block = returns_match.group(1)
                ret_pattern = re.compile(r'\{\s*Name\s*=\s*"([^"]+)"\s*,\s*Type\s*=\s*"([^"]+)"([^}]*)\}', re.DOTALL)
                for ret_match in ret_pattern.finditer(returns_block):
                    ret = {
                        "Name": ret_match.group(1),
                        "Type": ret_match.group(2),
                        "Nilable": "Nilable = true" in ret_match.group(3)
                    }
                    returns.append(ret)
            if returns:
                func_data["Returns"] = returns

            functions.append(func_data)

    if functions:
        result["Functions"] = functions

    return result if functions else None


# ═══════════════════════════════════════════════════════════════════════════════
# HELPER FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════

def _get_lua_exe() -> Optional[Path]:
    """Find lua.exe for parsing documentation files."""
    config = get_config()

    # Check ADDON_DEV/Tools/bin first
    if config.dev_path:
        lua_path = config.dev_path / "ADDON_DEV" / "Tools" / "bin" / "lua.exe"
        if lua_path.exists():
            return lua_path

    # Check PATH
    import shutil
    lua_in_path = shutil.which("lua") or shutil.which("lua5.1")
    if lua_in_path:
        return Path(lua_in_path)

    return None


def _get_lua_dumper() -> Path:
    """Get path to the lua_dumper.lua script."""
    return Path(__file__).parent.parent.parent.parent / "scripts" / "lua_dumper.lua"


def _get_default_database_path() -> Path:
    """Get default path for api_database.json."""
    config = get_config()
    return config.data_dir / "api_database.json"


def _get_default_apidefs_path() -> Optional[Path]:
    """Get default path for APIDefs output."""
    config = get_config()
    if config.dev_path:
        # Try Mechanic repo structure: _dev_/Mechanic/UI/APIDefs
        mechanic_repo = config.dev_path / "Mechanic" / "UI" / "APIDefs"
        if mechanic_repo.parent.exists():
            return mechanic_repo
    return None


def _determine_category(namespace: str, impact: str) -> str:
    """Determine category based on namespace and impact level."""
    if impact != "NORMAL":
        return "combat_midnight"

    ns_lower = namespace.lower() if namespace else ""
    for keyword, cat in NAMESPACE_CATEGORY_MAP.items():
        if keyword in ns_lower:
            return cat
    return "general"


def _parse_blizzard_file(lua_exe: Optional[Path], dumper_script: Optional[Path], file_path: Path) -> Optional[Dict]:
    """
    Parse a single Blizzard documentation file.
    Uses lua_dumper.lua if available, otherwise falls back to pure-Python parser.
    """
    # Try Lua-based parsing first if available
    if lua_exe and dumper_script and dumper_script.exists():
        try:
            result = subprocess.run(
                [str(lua_exe), str(dumper_script), str(file_path)],
                capture_output=True,
                text=True,
                check=True,
                timeout=30
            )
            if result.stdout.strip():
                return json.loads(result.stdout.strip())
        except Exception:
            pass

    # Fall back to pure-Python parser
    return _parse_lua_table_python(file_path)


def _generate_lua_params(params: List[Dict], examples: List[Dict] = None) -> str:
    """Generate Lua table string for parameters."""
    lua_params = []
    for p in params:
        default_val = p.get("default")
        if p.get("type") == "UnitToken" and default_val is None:
            default_val = "player"

        default_str = json.dumps(default_val) if default_val is not None else "nil"
        param_lua = f'{{ name = "{p["name"]}", type = "{p["type"]}", default = {default_str} }}'
        lua_params.append(param_lua)

    return '{ ' + ', '.join(lua_params) + ' }'


def _generate_lua_returns(returns: List[Dict], secret_flags: Dict) -> str:
    """Generate Lua table string for return values."""
    lua_rets = []
    for r in returns:
        can_be_secret = "true" if secret_flags.get("SecretReturns") else "false"
        lua_rets.append(f'{{ name = "{r["name"]}", type = "{r["type"]}", canBeSecret = {can_be_secret} }}')
    return '{ ' + ', '.join(lua_rets) + ' }'


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND IMPLEMENTATIONS
# ═══════════════════════════════════════════════════════════════════════════════

async def _api_populate(input: APIPopulateInput, context: Any = None) -> CommandResult[APIPopulateOutput]:
    """
    Parse Blizzard API documentation and generate api_database.json.

    Supports wow-ui-source from GitHub or Townlong Yak FrameXML downloads.
    Uses pure-Python parser with optional Lua-based parsing if lua.exe is available.
    """
    # Find lua.exe (optional, we have Python fallback)
    lua_exe = _get_lua_exe()
    dumper_script = _get_lua_dumper() if lua_exe else None

    # Validate source path
    source_path = Path(input.source_path)
    if not source_path.exists():
        return error(
            code="SOURCE_NOT_FOUND",
            message=f"Source path not found: {source_path}",
            suggestion="Clone wow-ui-source: git clone https://github.com/Gethe/wow-ui-source"
        )

    # Find documentation directory
    doc_dir = source_path / "Interface" / "AddOns" / "Blizzard_APIDocumentationGenerated"
    if not doc_dir.exists():
        # Try alternate path
        doc_dir = source_path / "Blizzard_APIDocumentationGenerated"
        if not doc_dir.exists():
            return error(
                code="DOCS_NOT_FOUND",
                message="Blizzard_APIDocumentationGenerated folder not found",
                suggestion="Ensure source_path points to wow-ui-source root"
            )

    # Output path
    output_file = Path(input.output_path) if input.output_path else _get_default_database_path()
    output_file.parent.mkdir(parents=True, exist_ok=True)

    # Initialize database
    database = {
        "meta": {
            "generated": datetime.now().isoformat(),
            "sources": ["blizzard_doc"],
            "wow_version": "12.0.1"
        },
        "categories": CATEGORIES,
        "apis": {}
    }

    # Skip internal namespaces
    skip_keywords = ["Internal", "Secure", "Debug", "LiveEvent", "MacOptions", "ConfigurationWarnings"]

    # Parse all documentation files
    files = [f for f in doc_dir.iterdir() if f.name.endswith("Documentation.lua")]

    for file_path in files:
        data = _parse_blizzard_file(lua_exe, dumper_script, file_path)
        if not data or "Functions" not in data:
            continue

        namespace = data.get("Namespace", "")

        # Skip internal namespaces
        if namespace and any(kw in namespace for kw in skip_keywords):
            continue

        for func in data["Functions"]:
            name = func.get("Name")
            if not name:
                continue

            full_name = f"{namespace}.{name}" if namespace else name

            # Detect Midnight Impact
            secret_flags = {k: v for k, v in func.items() if k.startswith("Secret")}

            impact = "NORMAL"
            if func.get("SecretReturns") == True:
                impact = "HIGH"
            elif any(k.startswith("SecretWhen") for k in secret_flags):
                impact = "CONDITIONAL"
            elif "SecretArguments" in secret_flags:
                impact = "RESTRICTED"

            category = _determine_category(namespace, impact)

            # Map parameters
            params = []
            for arg in func.get("Arguments", []):
                params.append({
                    "name": arg.get("Name"),
                    "type": arg.get("Type"),
                    "nilable": arg.get("Nilable", False),
                    "default": arg.get("Default")
                })

            # Map returns
            returns = []
            for ret in func.get("Returns", []):
                returns.append({
                    "name": ret.get("Name"),
                    "type": ret.get("Type"),
                    "nilable": ret.get("Nilable", False)
                })

            database["apis"][full_name] = {
                "namespace": namespace,
                "name": name,
                "category": category,
                "params": params,
                "returns": returns,
                "secretFlags": secret_flags,
                "midnightImpact": impact,
                "documentation": func.get("Documentation", []),
                "examples": []
            }

    # Write database
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(database, f, indent=2)

    # Count by category
    category_counts = defaultdict(int)
    for api in database["apis"].values():
        category_counts[api["category"]] += 1

    return success(
        data=APIPopulateOutput(
            api_count=len(database["apis"]),
            category_counts=dict(category_counts),
            output_file=str(output_file),
            wow_version=database["meta"]["wow_version"]
        ),
        reasoning=f"Parsed {len(files)} documentation files, generated {len(database['apis'])} API entries",
        sources=[create_source(type="file", id="blizzard_docs", title="Blizzard API Documentation")]
    )


async def _api_generate(input: APIGenerateInput, context: Any = None) -> CommandResult[APIGenerateOutput]:
    """
    Generate APIDefs Lua files from api_database.json.

    Creates individual namespace files and XML manifest for Mechanic.
    """
    # Find database
    db_path = Path(input.database_path) if input.database_path else _get_default_database_path()
    if not db_path.exists():
        return error(
            code="DATABASE_NOT_FOUND",
            message=f"api_database.json not found at {db_path}",
            suggestion="Run api.populate first to generate the database"
        )

    # Find output path
    output_dir = Path(input.output_path) if input.output_path else _get_default_apidefs_path()
    if not output_dir:
        return error(
            code="OUTPUT_NOT_FOUND",
            message="Could not determine APIDefs output path",
            suggestion="Specify output_path or ensure Mechanic repo exists"
        )

    # Load database
    with open(db_path, 'r', encoding='utf-8') as f:
        db = json.load(f)

    apis = db.get("apis", {})

    # Group by namespace
    ns_buckets = defaultdict(list)
    for key, data in sorted(apis.items()):
        ns = data["namespace"] or "Global"
        ns_buckets[ns].append((key, data))

    # Clean output directory
    if output_dir.exists():
        for f in output_dir.iterdir():
            if f.suffix in (".lua", ".xml"):
                f.unlink()
    else:
        output_dir.mkdir(parents=True, exist_ok=True)

    generated_files = []

    # Generate namespace files
    for ns, entries in ns_buckets.items():
        filename = f"{ns}.lua"
        filepath = output_dir / filename

        output = []
        output.append(f"-- Generated APIDefinitions for namespace: {ns}")
        output.append("local _, ns = ...")
        output.append("local APIDefs = ns.APIDefinitions")
        output.append("")

        for key, data in entries:
            subcat = data["namespace"].lower() if data["namespace"] else "global"
            flags = data.get("secretFlags", {})

            note = ""
            if flags:
                note_parts = []
                for k, v in flags.items():
                    if v == True:
                        note_parts.append(k)
                    else:
                        note_parts.append(f"{k}={v}")
                note = "Secret behavior: " + ", ".join(note_parts)

            # Generate function reference
            if "." in key:
                ns_name, fn_name = key.split(".", 1)
                func_ref = f'_G["{ns_name}"] and _G["{ns_name}"]["{fn_name}"]'
            else:
                func_ref = f'_G["{key}"]'

            lua_entry = f'APIDefs["{key}"] = {{\n'
            lua_entry += f'    key = "{key}",\n'
            lua_entry += f'    name = "{data["name"]}",\n'
            lua_entry += f'    category = "{data["category"]}",\n'
            lua_entry += f'    subcategory = "{subcat}",\n'
            lua_entry += f'    func = {func_ref},\n'
            lua_entry += f'    funcPath = "{key}",\n'
            lua_entry += f'    params = {_generate_lua_params(data["params"])},\n'
            lua_entry += f'    returns = {_generate_lua_returns(data["returns"], flags)},\n'
            lua_entry += f'    midnightImpact = "{data["midnightImpact"]}",\n'
            if data["midnightImpact"] == "RESTRICTED":
                lua_entry += f'    protected = true,\n'
            if note:
                lua_entry += f'    midnightNote = {json.dumps(note)},\n'
            lua_entry += '}\n'
            output.append(lua_entry)

        filepath.write_text("\n".join(output), encoding="utf-8")
        generated_files.append(filename)

    # Generate XML manifest
    xml_path = output_dir / "APIDefs.xml"
    xml_output = [
        '<Ui xmlns="http://www.blizzard.com/wow/ui/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.blizzard.com/wow/ui/..\\FrameXML\\UI.xsd">'
    ]
    for ns in sorted(ns_buckets.keys()):
        xml_output.append(f'    <Script file="{ns}.lua"/>')
    xml_output.append('</Ui>')

    xml_path.write_text("\n".join(xml_output), encoding="utf-8")
    generated_files.append("APIDefs.xml")

    # Generate registry (one level up from APIDefs)
    registry_path = output_dir.parent / "APIDefinitions_Registry.lua"
    reg_output = [
        "-- Generated API Registry Index",
        "local _, ns = ...",
        "ns.APIRegistry = {"
    ]
    for key, data in sorted(apis.items()):
        ns = data["namespace"] or "Global"
        reg_output.append(f'    ["{key}"] = {{ ns = "{ns}", cat = "{data["category"]}", impact = "{data["midnightImpact"]}", name = "{data["name"]}" }},')
    reg_output.append("}")

    registry_path.write_text("\n".join(reg_output), encoding="utf-8")

    return success(
        data=APIGenerateOutput(
            api_count=len(apis),
            namespace_count=len(ns_buckets),
            output_dir=str(output_dir),
            files=generated_files
        ),
        reasoning=f"Generated {len(ns_buckets)} namespace files with {len(apis)} APIs",
        sources=[create_source(type="file", id="api_database", title="API Database")]
    )


async def _api_refresh(input: APIRefreshInput, context: Any = None) -> CommandResult[APIRefreshOutput]:
    """
    Full refresh: parse Blizzard docs and regenerate all APIDefs.

    Combines api.populate and api.generate into a single command.
    """
    # Run populate
    populate_result = await _api_populate(
        APIPopulateInput(source_path=input.source_path),
        context
    )
    if not populate_result.success:
        return populate_result

    # Run generate
    generate_result = await _api_generate(
        APIGenerateInput(),
        context
    )
    if not generate_result.success:
        return generate_result

    return success(
        data=APIRefreshOutput(
            api_count=populate_result.data.api_count,
            namespace_count=generate_result.data.namespace_count,
            database_file=populate_result.data.output_file,
            apidefs_dir=generate_result.data.output_dir
        ),
        reasoning=f"Full refresh complete: {populate_result.data.api_count} APIs in {generate_result.data.namespace_count} namespaces"
    )


async def _api_download(input: APIDownloadInput, context: Any = None) -> CommandResult[APIDownloadOutput]:
    """
    Download FrameXML from Townlong Yak and optionally refresh API definitions.

    Downloads the complete FrameXML package for a specific build (or latest),
    extracts it, and can automatically run api.refresh to update the API database.
    """
    config = get_config()

    # Determine build ID
    build_id = input.build_id
    version = None

    if not build_id:
        # TODO: Scrape builds page for latest
        # For now, require explicit build ID
        return error(
            code="BUILD_ID_REQUIRED",
            message="build_id is required (auto-detection not yet implemented)",
            suggestion="Check https://www.townlong-yak.com/framexml/builds for available builds"
        )

    # Construct download URL
    download_url = f"{TOWNLONG_YAK_BASE}/{build_id}/get"

    try:
        # Download the ZIP file
        response = requests.get(download_url, stream=True, timeout=120)
        response.raise_for_status()

        # Extract version from Content-Disposition header
        content_disp = response.headers.get("Content-Disposition", "")
        if "filename=" in content_disp:
            # Extract filename like "12.0.1.64889.zip"
            import re as re_module
            filename_match = re_module.search(r'filename[*]?=(?:UTF-8\'\')?([^;]+)', content_disp)
            if filename_match:
                filename = filename_match.group(1).strip('"').strip()
                version = filename.replace(".zip", "")

        if not version:
            version = f"build_{build_id}"

    except requests.exceptions.RequestException as e:
        return error(
            code="DOWNLOAD_FAILED",
            message=f"Failed to download from Townlong Yak: {str(e)}",
            suggestion="Check build ID and network connection"
        )

    # Determine output path
    if input.output_path:
        output_path = Path(input.output_path)
    elif config.dev_path:
        output_path = config.dev_path / version
    else:
        output_path = Path(tempfile.gettempdir()) / f"framexml_{version}"

    # Create output directory
    output_path.mkdir(parents=True, exist_ok=True)

    # Extract ZIP
    try:
        zip_data = io.BytesIO(response.content)
        with zipfile.ZipFile(zip_data, 'r') as zf:
            zf.extractall(output_path)
            file_count = len(zf.namelist())
    except Exception as e:
        return error(
            code="EXTRACT_FAILED",
            message=f"Failed to extract ZIP: {str(e)}",
            suggestion="The download may be corrupted, try again"
        )

    api_count = None

    # Optionally run refresh
    if input.refresh:
        refresh_result = await _api_refresh(
            APIRefreshInput(source_path=str(output_path)),
            context
        )
        if refresh_result.success:
            api_count = refresh_result.data.api_count

    return success(
        data=APIDownloadOutput(
            build_id=build_id,
            version=version,
            output_path=str(output_path),
            file_count=file_count,
            api_count=api_count
        ),
        reasoning=f"Downloaded {version} from Townlong Yak ({file_count} files)" +
                  (f", refreshed {api_count} APIs" if api_count else ""),
        sources=[create_source(type="url", id=download_url, title="Townlong Yak FrameXML")]
    )


# ═══════════════════════════════════════════════════════════════════════════════
# REGISTRATION
# ═══════════════════════════════════════════════════════════════════════════════

def register_commands(server):
    """Register API definition commands with the AFD server."""

    server.command(
        name="api.populate",
        description="Parse Blizzard API documentation and generate api_database.json",
        input_schema=APIPopulateInput,
        output_schema=APIPopulateOutput,
    )(_api_populate)

    server.command(
        name="api.generate",
        description="Generate APIDefs Lua files from api_database.json for Mechanic",
        input_schema=APIGenerateInput,
        output_schema=APIGenerateOutput,
    )(_api_generate)

    server.command(
        name="api.refresh",
        description="Full refresh: parse Blizzard docs and regenerate all APIDefs in one step",
        input_schema=APIRefreshInput,
        output_schema=APIRefreshOutput,
    )(_api_refresh)

    server.command(
        name="api.download",
        description="Download FrameXML from Townlong Yak and optionally refresh API definitions",
        input_schema=APIDownloadInput,
        output_schema=APIDownloadOutput,
    )(_api_download)

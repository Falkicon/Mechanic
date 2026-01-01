"""
Localization and asset commands for WoW addon development.
Handles locale validation, string extraction, and atlas icon search.
"""

from afd import CommandResult, success, error
from afd.core.metadata import create_source, create_warning, WarningSeverity
from pathlib import Path
from pydantic import BaseModel, Field
from typing import Any, Dict, List, Optional
import re

# Use centralized config
from ..config import find_addon_path, get_config


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND REGISTRATION
# ═══════════════════════════════════════════════════════════════════════════════

def register_commands(server):
    """Register all locale and asset commands with the AFD server."""

    # ═══════════════════════════════════════════════════════════════════════════
    # locale.validate - Check locale coverage
    # ═══════════════════════════════════════════════════════════════════════════
    
    class LocaleValidateInput(BaseModel):
        addon: str = Field(..., description="Name of the addon to validate")
        path: Optional[str] = Field(None, description="Override path to addon folder")

    class LocaleMissing(BaseModel):
        locale: str
        missing_keys: List[str]

    class LocaleValidateResult(BaseModel):
        addon: str
        valid: bool
        baseline_keys: int = 0
        locales_found: List[str] = []
        missing: List[LocaleMissing] = []

    @server.command(
        name="locale.validate",
        description="Validate locale coverage against the enUS baseline",
        input_schema=LocaleValidateInput,
        output_schema=LocaleValidateResult,
    )
    async def validate_locale(input: LocaleValidateInput, context: Any = None) -> CommandResult[LocaleValidateResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or provide an explicit path"
            )
        
        locales_path = addon_path / "Locales"
        if not locales_path.exists():
            return success(
                data=LocaleValidateResult(addon=input.addon, valid=True),
                reasoning="No Locales folder found - addon may not support localization",
                confidence=0.8
            )
        
        # Find baseline (enUS)
        enus_path = locales_path / "enUS.lua"
        if not enus_path.exists():
            return error(
                code="NO_BASELINE",
                message="enUS.lua baseline not found in Locales folder",
                suggestion="Create enUS.lua as the baseline locale file"
            )
        
        # Extract keys from baseline
        baseline_content = enus_path.read_text(encoding='utf-8', errors='replace')
        baseline_keys = set(re.findall(r'\["([^"]+)"\]', baseline_content))
        
        # Check other locales
        locales_found = []
        missing_list = []
        
        for locale_file in locales_path.glob("*.lua"):
            if locale_file.name == "enUS.lua":
                continue
            
            locale_name = locale_file.stem
            locales_found.append(locale_name)
            
            content = locale_file.read_text(encoding='utf-8', errors='replace')
            locale_keys = set(re.findall(r'\["([^"]+)"\]', content))
            
            missing_keys = baseline_keys - locale_keys
            if missing_keys:
                missing_list.append(LocaleMissing(
                    locale=locale_name,
                    missing_keys=list(missing_keys)[:10]  # Limit
                ))
        
        valid = len(missing_list) == 0
        
        src = create_source(
            type="folder",
            id=f"locales-{input.addon}",
            title="Locales",
            location=str(locales_path)
        )
        
        warnings = []
        for m in missing_list:
            warnings.append(create_warning(
                code="MISSING_KEYS",
                message=f"{m.locale}: {len(m.missing_keys)} missing keys",
                severity=WarningSeverity.WARNING
            ))
        
        return success(
            data=LocaleValidateResult(
                addon=input.addon,
                valid=valid,
                baseline_keys=len(baseline_keys),
                locales_found=locales_found,
                missing=missing_list
            ),
            reasoning=f"Validated {len(locales_found)} locales against {len(baseline_keys)} baseline keys",
            sources=[src],
            warnings=warnings if warnings else None,
            confidence=0.95
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # locale.extract - Extract localizable strings
    # ═══════════════════════════════════════════════════════════════════════════
    
    class LocaleExtractInput(BaseModel):
        addon: str = Field(..., description="Name of the addon")
        path: Optional[str] = Field(None, description="Override path to addon folder")

    class LocaleExtractResult(BaseModel):
        addon: str
        strings_found: int = 0
        strings: List[str] = []

    @server.command(
        name="locale.extract",
        description="Extract potential localizable strings from addon code",
        input_schema=LocaleExtractInput,
        output_schema=LocaleExtractResult,
    )
    async def extract_locale(input: LocaleExtractInput, context: Any = None) -> CommandResult[LocaleExtractResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or provide an explicit path"
            )
        
        # Patterns for localizable strings
        # L["string"], L.string, or standalone strings in UI code
        patterns = [
            r'L\["([^"]+)"\]',
            r'L\.(\w+)',
            r':SetText\("([^"]+)"\)',
            r'title\s*=\s*"([^"]+)"',
            r'name\s*=\s*"([^"]+)"',
        ]
        
        found_strings = set()
        
        for lua_file in addon_path.rglob("*.lua"):
            # Skip Libs folder
            if "Libs" in str(lua_file):
                continue
            
            try:
                content = lua_file.read_text(encoding='utf-8', errors='replace')
                for pattern in patterns:
                    matches = re.findall(pattern, content)
                    found_strings.update(matches)
            except Exception:
                continue
        
        # Filter out obvious non-localizable strings
        filtered = [s for s in found_strings if len(s) > 2 and not s.isdigit()]
        
        src = create_source(
            type="scan",
            id=f"locale-extract-{input.addon}",
            title="String Extraction",
            location=str(addon_path)
        )
        
        return success(
            data=LocaleExtractResult(
                addon=input.addon,
                strings_found=len(filtered),
                strings=sorted(filtered)[:50]  # Limit to 50
            ),
            reasoning=f"Extracted {len(filtered)} potential localizable strings",
            sources=[src],
            confidence=0.8
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # atlas.search - Search Blizzard UI Atlas icons
    # ═══════════════════════════════════════════════════════════════════════════
    
    class AtlasSearchInput(BaseModel):
        query: str = Field(..., description="Search query for atlas icons")
        limit: int = Field(20, description="Maximum results to return")

    class AtlasIcon(BaseModel):
        name: str
        file: Optional[str] = None

    class AtlasSearchResult(BaseModel):
        query: str
        count: int = 0
        icons: List[AtlasIcon] = []

    # Common Blizzard atlas patterns (subset for quick search)
    COMMON_ATLASES = [
        "UI-HUD-", "UI-LFG-", "UI-QuestIcon-", "UI-Frame-",
        "Garr_", "ClassHall_", "Profession-",
        "Icon-", "Vehicle-", "Map-",
    ]

    @server.command(
        name="atlas.search",
        description="Search Blizzard UI Atlas icons by name pattern",
        input_schema=AtlasSearchInput,
        output_schema=AtlasSearchResult,
    )
    async def search_atlas(input: AtlasSearchInput, context: Any = None) -> CommandResult[AtlasSearchResult]:
        # Check for atlas index file in configured locations
        config = get_config()
        atlas_index_paths = []
        
        # Build search paths dynamically
        if config.dev_path:
            atlas_index_paths.extend([
                config.dev_path / "ADDON_DEV" / "Tools" / "AtlasScanner" / "atlas_index.json",
                config.dev_path / "ADDON_DEV" / "Data" / "atlas_index.json",
            ])
        
        # Also check data directory
        atlas_index_paths.append(config.data_dir / "atlas_index.json")
        
        import json
        atlas_data = None
        index_path = None
        
        for path in atlas_index_paths:
            if path.exists():
                try:
                    atlas_data = json.loads(path.read_text())
                    index_path = path
                    break
                except Exception:
                    continue
        
        if not atlas_data:
            # Fallback: return common patterns matching query
            matching = [
                AtlasIcon(name=f"{prefix}{input.query}")
                for prefix in COMMON_ATLASES
                if input.query.lower() in prefix.lower()
            ]
            
            return success(
                data=AtlasSearchResult(
                    query=input.query,
                    count=len(matching),
                    icons=matching[:input.limit]
                ),
                reasoning="Atlas index not found - returning common pattern suggestions",
                confidence=0.5
            )
        
        # Search the index
        query_lower = input.query.lower()
        matches = []
        
        for icon_name in atlas_data.get('icons', []):
            if query_lower in icon_name.lower():
                matches.append(AtlasIcon(name=icon_name))
                if len(matches) >= input.limit:
                    break
        
        src = create_source(
            type="file",
            id="atlas-index",
            title="Atlas Index",
            location=str(index_path) if index_path else "builtin"
        )
        
        return success(
            data=AtlasSearchResult(
                query=input.query,
                count=len(matches),
                icons=matches
            ),
            reasoning=f"Found {len(matches)} atlas icons matching '{input.query}'",
            sources=[src],
            confidence=0.9
        )

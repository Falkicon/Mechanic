"""
Localization commands for WoW addon development.
Handles locale validation and string extraction.
"""

import asyncio
import re
from pathlib import Path
from typing import Any, List, Optional, Set

from afd import CommandResult, error, success
from afd.core.metadata import WarningSeverity, create_source, create_warning
from pydantic import BaseModel, Field

from ..config import find_addon_path
from ._common import addon_not_found, is_under_libs

_KEY_PATTERN = re.compile(r'\["([^"]+)"\]')
_MISSING_KEY_SAMPLE = 10
_EXTRACT_PATTERNS = [
    # L["string"], L.string, or standalone strings in UI code
    re.compile(r'L\["([^"]+)"\]'),
    re.compile(r"L\.(\w+)"),
    re.compile(r':SetText\("([^"]+)"\)'),
    re.compile(r'title\s*=\s*"([^"]+)"'),
    re.compile(r'name\s*=\s*"([^"]+)"'),
]


def locale_keys(text: str) -> Set[str]:
    return set(_KEY_PATTERN.findall(text))


def extract_strings(addon_path: Path) -> List[str]:
    """Potentially localizable strings from non-library Lua files (blocking)."""
    found: Set[str] = set()
    for lua_file in addon_path.rglob("*.lua"):
        if is_under_libs(lua_file, addon_path):
            continue
        try:
            content = lua_file.read_text(encoding="utf-8", errors="replace")
        except OSError:
            continue
        for pattern in _EXTRACT_PATTERNS:
            found.update(pattern.findall(content))
    return sorted(s for s in found if len(s) > 2 and not s.isdigit())


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
        missing_count: int = Field(0, description="Total number of missing keys")
        missing_keys: List[str] = Field(
            default_factory=list,
            description=f"First {_MISSING_KEY_SAMPLE} missing keys, sorted",
        )

    class LocaleValidateResult(BaseModel):
        addon: str
        valid: bool
        baseline_keys: int = 0
        locales_found: List[str] = []
        missing: List[LocaleMissing] = []

    def compare_locales(locales_path: Path):
        enus_path = locales_path / "enUS.lua"
        baseline_keys = locale_keys(
            enus_path.read_text(encoding="utf-8", errors="replace")
        )
        locales_found: List[str] = []
        missing_list: List[LocaleMissing] = []
        for locale_file in sorted(locales_path.glob("*.lua")):
            if locale_file.name == "enUS.lua":
                continue
            locales_found.append(locale_file.stem)
            content = locale_file.read_text(encoding="utf-8", errors="replace")
            missing = sorted(baseline_keys - locale_keys(content))
            if missing:
                missing_list.append(
                    LocaleMissing(
                        locale=locale_file.stem,
                        missing_count=len(missing),
                        missing_keys=missing[:_MISSING_KEY_SAMPLE],
                    )
                )
        return baseline_keys, locales_found, missing_list

    @server.command(
        name="locale.validate",
        description="Validate locale coverage against the enUS baseline",
        input_schema=LocaleValidateInput,
        output_schema=LocaleValidateResult,
    )
    async def validate_locale(
        input: LocaleValidateInput, context: Any = None
    ) -> CommandResult[LocaleValidateResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return addon_not_found(input.addon)

        locales_path = addon_path / "Locales"
        if not locales_path.exists():
            return success(
                data=LocaleValidateResult(addon=input.addon, valid=True),
                reasoning="No Locales folder found - addon may not support localization",
                confidence=0.8,
            )

        if not (locales_path / "enUS.lua").exists():
            return error(
                code="NO_BASELINE",
                message="enUS.lua baseline not found in Locales folder",
                suggestion="Create enUS.lua as the baseline locale file",
            )

        baseline_keys, locales_found, missing_list = await asyncio.to_thread(
            compare_locales, locales_path
        )

        src = create_source(
            type="folder",
            id=f"locales-{input.addon}",
            title="Locales",
            location=str(locales_path),
        )

        warnings = [
            create_warning(
                code="MISSING_KEYS",
                message=f"{m.locale}: {m.missing_count} missing keys",
                severity=WarningSeverity.WARNING,
            )
            for m in missing_list
        ]

        return success(
            data=LocaleValidateResult(
                addon=input.addon,
                valid=not missing_list,
                baseline_keys=len(baseline_keys),
                locales_found=locales_found,
                missing=missing_list,
            ),
            reasoning=f"Validated {len(locales_found)} locales against {len(baseline_keys)} baseline keys",
            sources=[src],
            warnings=warnings or None,
            confidence=0.95,
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
    async def extract_locale(
        input: LocaleExtractInput, context: Any = None
    ) -> CommandResult[LocaleExtractResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return addon_not_found(input.addon)

        filtered = await asyncio.to_thread(extract_strings, addon_path)

        src = create_source(
            type="scan",
            id=f"locale-extract-{input.addon}",
            title="String Extraction",
            location=str(addon_path),
        )

        return success(
            data=LocaleExtractResult(
                addon=input.addon,
                strings_found=len(filtered),
                strings=filtered[:50],  # Limit to 50
            ),
            reasoning=f"Extracted {len(filtered)} potential localizable strings",
            sources=[src],
            confidence=0.8,
        )

"""
Asset management commands for WoW addon development.
Handles PNG to TGA conversion and asset synchronization.

Migrated from ADDON_DEV/Tools/AssetManager to AFD commands.
"""

import os
import shutil
from pathlib import Path
from typing import Any, Dict, List, Optional

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

from ..config import find_addon_path


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════

class AssetsSyncInput(BaseModel):
    addon: str = Field(..., description="Name of the addon to sync assets for")
    verbose: bool = Field(default=False, description="Show detailed output")


class AssetsSyncOutput(BaseModel):
    addon: str
    converted: int = Field(..., description="Number of PNG files converted to TGA")
    copied: int = Field(..., description="Number of files directly copied")
    removed: int = Field(..., description="Number of orphaned files removed")
    warnings: List[str] = Field(default_factory=list, description="Validation warnings")


class AssetsListInput(BaseModel):
    addon: str = Field(..., description="Name of the addon")


class AssetsListOutput(BaseModel):
    addon: str
    source_count: int
    target_count: int
    source_files: List[str]
    target_files: List[str]


# ═══════════════════════════════════════════════════════════════════════════════
# HELPER FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════

def _check_pillow_available() -> bool:
    """Check if Pillow is installed."""
    try:
        from PIL import Image
        return True
    except ImportError:
        return False


def _is_power_of_two(n: int) -> bool:
    """Check if a number is a power of 2."""
    return (n & (n - 1) == 0) and n != 0


def _validate_dimensions(width: int, height: int) -> List[str]:
    """Validate image dimensions for WoW compatibility."""
    issues = []
    if not _is_power_of_two(width):
        issues.append(f"Width ({width}) is not a power of 2")
    if not _is_power_of_two(height):
        issues.append(f"Height ({height}) is not a power of 2")
    return issues


def _sync_assets(addon_path: Path, verbose: bool = False) -> Dict[str, Any]:
    """
    Sync assets from assets_source to assets folder.
    Converts PNG to TGA and copies other files directly.
    """
    from PIL import Image

    source_dir = addon_path / "assets_source"
    target_dir = addon_path / "assets"

    result = {
        "converted": 0,
        "copied": 0,
        "removed": 0,
        "warnings": []
    }

    if not source_dir.exists():
        return result

    if not target_dir.exists():
        target_dir.mkdir(parents=True)

    # Process source files
    for source_file in source_dir.rglob("*"):
        if source_file.is_dir():
            continue

        rel_path = source_file.relative_to(source_dir)

        if source_file.suffix.lower() == ".png":
            # PNG -> TGA conversion
            target_file = target_dir / rel_path.with_suffix(".tga")
            target_file.parent.mkdir(parents=True, exist_ok=True)

            # Skip if up to date
            if target_file.exists():
                if source_file.stat().st_mtime <= target_file.stat().st_mtime:
                    continue

            try:
                with Image.open(source_file) as img:
                    width, height = img.size

                    # Validate dimensions
                    issues = _validate_dimensions(width, height)
                    if issues:
                        result["warnings"].append(f"{source_file.name}: {', '.join(issues)}")

                    # Convert to RGBA for 32-bit TGA
                    if img.mode != 'RGBA':
                        img = img.convert('RGBA')

                    img.save(target_file, "TGA")
                    result["converted"] += 1
            except Exception as e:
                result["warnings"].append(f"Error converting {source_file.name}: {str(e)}")
        else:
            # Direct copy for other file types
            target_file = target_dir / rel_path
            target_file.parent.mkdir(parents=True, exist_ok=True)

            if not target_file.exists() or source_file.stat().st_mtime > target_file.stat().st_mtime:
                try:
                    shutil.copy2(source_file, target_file)
                    result["copied"] += 1
                except Exception as e:
                    result["warnings"].append(f"Error copying {source_file.name}: {str(e)}")

    # Cleanup orphaned files
    if target_dir.exists():
        for target_file in target_dir.rglob("*"):
            if target_file.is_dir():
                continue

            rel_path = target_file.relative_to(target_dir)

            if target_file.suffix.lower() == ".tga":
                # Check for corresponding PNG source
                source_png = source_dir / rel_path.with_suffix(".png")
                source_tga = source_dir / rel_path
                if not source_png.exists() and not source_tga.exists():
                    try:
                        target_file.unlink()
                        result["removed"] += 1
                    except Exception:
                        pass
            else:
                source_file = source_dir / rel_path
                if not source_file.exists():
                    try:
                        target_file.unlink()
                        result["removed"] += 1
                    except Exception:
                        pass

        # Remove empty directories
        for root, dirs, files in os.walk(target_dir, topdown=False):
            for name in dirs:
                dir_path = Path(root) / name
                try:
                    dir_path.rmdir()
                except OSError:
                    pass

    return result


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND IMPLEMENTATIONS
# ═══════════════════════════════════════════════════════════════════════════════

async def _assets_sync(input: AssetsSyncInput, context: Any = None) -> CommandResult[AssetsSyncOutput]:
    """
    Sync assets from assets_source to assets folder.
    Converts PNG files to TGA format for WoW compatibility.
    """
    # Check for Pillow
    if not _check_pillow_available():
        return error(
            code="PACKAGE_MISSING",
            message="Pillow package not installed",
            suggestion="Install with: pip install Pillow  OR  pip install mechanic-desktop[assets]"
        )

    # Find addon
    addon_path = find_addon_path(input.addon)
    if not addon_path:
        return error(
            code="ADDON_NOT_FOUND",
            message=f"Addon '{input.addon}' not found",
            suggestion="Check the addon name and ensure it exists in the dev path."
        )

    source_dir = addon_path / "assets_source"
    if not source_dir.exists():
        return error(
            code="NO_ASSETS_SOURCE",
            message=f"No assets_source directory found in {input.addon}",
            suggestion="Create an 'assets_source' folder with PNG files to convert."
        )

    try:
        result = _sync_assets(addon_path, input.verbose)

        return success(
            data=AssetsSyncOutput(
                addon=input.addon,
                converted=result["converted"],
                copied=result["copied"],
                removed=result["removed"],
                warnings=result["warnings"]
            ),
            reasoning=f"Synced assets: {result['converted']} converted, {result['copied']} copied, {result['removed']} removed"
        )

    except Exception as e:
        return error(
            code="SYNC_FAILED",
            message=f"Asset sync failed: {str(e)}",
            suggestion="Check file permissions and ensure assets_source contains valid files."
        )


async def _assets_list(input: AssetsListInput, context: Any = None) -> CommandResult[AssetsListOutput]:
    """
    List asset files in an addon's assets_source and assets folders.
    """
    # Find addon
    addon_path = find_addon_path(input.addon)
    if not addon_path:
        return error(
            code="ADDON_NOT_FOUND",
            message=f"Addon '{input.addon}' not found",
            suggestion="Check the addon name and ensure it exists in the dev path."
        )

    source_dir = addon_path / "assets_source"
    target_dir = addon_path / "assets"

    source_files = []
    target_files = []

    if source_dir.exists():
        for f in source_dir.rglob("*"):
            if f.is_file():
                source_files.append(str(f.relative_to(source_dir)))

    if target_dir.exists():
        for f in target_dir.rglob("*"):
            if f.is_file():
                target_files.append(str(f.relative_to(target_dir)))

    source_files.sort()
    target_files.sort()

    return success(
        data=AssetsListOutput(
            addon=input.addon,
            source_count=len(source_files),
            target_count=len(target_files),
            source_files=source_files[:50],  # Limit output
            target_files=target_files[:50]
        ),
        reasoning=f"Found {len(source_files)} source files and {len(target_files)} target files"
    )


# ═══════════════════════════════════════════════════════════════════════════════
# REGISTRATION
# ═══════════════════════════════════════════════════════════════════════════════

def register_commands(server):
    """Register asset management commands with the AFD server."""

    server.command(
        name="assets.sync",
        description="Sync addon assets: convert PNG to TGA and copy other files from assets_source to assets",
        input_schema=AssetsSyncInput,
        output_schema=AssetsSyncOutput,
    )(_assets_sync)

    server.command(
        name="assets.list",
        description="List asset files in an addon's assets_source and assets folders",
        input_schema=AssetsListInput,
        output_schema=AssetsListOutput,
    )(_assets_list)

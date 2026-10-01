"""
Environment commands for WoW addon development.
Handles addon creation, junction syncing, and library management.
"""

import asyncio
import json
import os
import re
import shutil
import stat
import subprocess
import sys
from pathlib import Path
from typing import Any, Dict, List, Optional

from afd import CommandResult, error, success
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

# Use centralized config
from ..config import find_addon_path, get_config, get_data_dir
from ._common import addon_not_found, is_safe_component

TEMPLATE_NAME = "TemplateAddon"
AUTHOR_PLACEHOLDERS = ("YourName", "Your Name")
_SKIP_REWRITE_DIRS = {"libs", ".git"}
_MAX_REWRITE_BYTES = 2_000_000


# ═══════════════════════════════════════════════════════════════════════════════
# HELPERS
# ═══════════════════════════════════════════════════════════════════════════════


def _remove_tree_robust(path: Path) -> None:
    """Remove a directory tree, clearing read-only bits (common in .git on Windows)."""

    def clear_and_retry(func, target, *_exc):
        os.chmod(target, stat.S_IWRITE)
        func(target)

    if sys.version_info >= (3, 12):
        shutil.rmtree(path, onexc=clear_and_retry)
    else:
        shutil.rmtree(path, onerror=clear_and_retry)


def _rewrite_template_file(path: Path, name: str, author: Optional[str]) -> None:
    """Replace template placeholders in one text file, preserving its bytes otherwise."""
    raw = path.read_bytes()
    if len(raw) > _MAX_REWRITE_BYTES or b"\0" in raw:
        return
    try:
        text = raw.decode("utf-8")
    except UnicodeDecodeError:
        return
    updated = text.replace(TEMPLATE_NAME, name)
    if author:
        for placeholder in AUTHOR_PLACEHOLDERS:
            updated = updated.replace(placeholder, author)
    if updated != text:
        path.write_bytes(updated.encode("utf-8"))


def scaffold_addon(template: Path, dest: Path, name: str, author: Optional[str]) -> int:
    """Copy ``template`` to ``dest`` and personalise it. Returns the file count.

    The copy is removed again when any step fails so no half-made addon remains.
    """
    shutil.copytree(
        template, dest, ignore=shutil.ignore_patterns(".git", "__pycache__")
    )
    try:
        for path in dest.rglob("*"):
            relative = path.relative_to(dest).parts[:-1]
            if path.is_file() and not any(
                part.lower() in _SKIP_REWRITE_DIRS for part in relative
            ):
                _rewrite_template_file(path, name, author)
        # Deepest first so renaming a folder never invalidates a pending path
        for path in sorted(dest.rglob("*"), key=lambda p: len(p.parts), reverse=True):
            if TEMPLATE_NAME in path.name:
                path.rename(path.with_name(path.name.replace(TEMPLATE_NAME, name)))
        return sum(1 for p in dest.rglob("*") if p.is_file())
    except Exception:
        _remove_tree_robust(dest)
        raise


def _load_libs_config(libs_path: Path) -> Optional[Dict]:
    """Load libs.json from a Libs folder (None when missing, unreadable or not a table)."""
    config_file = libs_path / "libs.json"
    if config_file.exists():
        try:
            data = json.loads(config_file.read_text(encoding="utf-8"))
        except (OSError, ValueError):
            return None
        return data if isinstance(data, dict) else None
    return None


def _extract_lib_version(lib_path: Path) -> Optional[str]:
    """Extract version from library files."""
    for file in lib_path.glob("*.lua"):
        try:
            content = file.read_text(encoding="utf-8", errors="replace")[:1000]
        except OSError:
            continue
        # MINOR pattern (common in Ace3/libs)
        match = re.search(r"MINOR\s*=\s*(\d+)", content)
        if match:
            return f"r{match.group(1)}"
    return None


def _find_library_source(
    lib_name: str,
    lib_config,
    default_source: Optional[Path],
    dev_path: Optional[Path],
) -> Optional[Path]:
    """Find the source path for a library.

    Checks in order:
    1. Per-library 'source' in libs.json config
    2. Default source path (from command input or auto-detected)
    3. Standalone repo in dev_path (e.g., _dev_/FenUI)
    """
    if isinstance(lib_config, dict) and lib_config.get("source"):
        custom_source = Path(lib_config["source"])
        # Relative paths are relative to dev_path
        if not custom_source.is_absolute() and dev_path:
            custom_source = dev_path / custom_source
        if custom_source.exists():
            return custom_source

    if default_source and (default_source / lib_name).exists():
        return default_source / lib_name

    if dev_path and (dev_path / lib_name).exists():
        standalone = dev_path / lib_name
        # Verify it looks like a library (has .lua files or .toc)
        if any(standalone.glob("*.lua")) or any(standalone.glob("*.toc")):
            return standalone

    return None


def _get_lib_version_config(lib_config) -> str:
    """Extract version from library config (handles both string and dict formats)."""
    if isinstance(lib_config, dict):
        return str(lib_config.get("version", "latest"))
    return "latest" if lib_config is None else str(lib_config)


# Folders to exclude when copying libraries
IGNORE_PATTERNS = {
    ".git",
    ".coverage",
    "__pycache__",
    ".github",
    "Tests",
    ".deprecation-report.md",
    "PLANS",
}


def _copy_library(src: Path, dst: Path) -> None:
    """Copy a library, excluding development-only folders."""

    def ignore_patterns(directory, files):
        return [f for f in files if f in IGNORE_PATTERNS]

    shutil.copytree(src, dst, ignore=ignore_patterns)


def _replace_library(src: Path, dst: Path) -> None:
    """Replace ``dst`` with a fresh copy of ``src``; the old copy survives any failure."""
    staging = dst.with_name(dst.name + ".mechanic-new")
    backup = dst.with_name(dst.name + ".mechanic-old")
    for leftover in (staging, backup):
        if leftover.exists():
            _remove_tree_robust(leftover)
    try:
        _copy_library(src, staging)
    except Exception:
        if staging.exists():
            _remove_tree_robust(staging)
        raise
    dst.rename(backup)
    try:
        staging.rename(dst)
    except Exception:
        backup.rename(dst)
        _remove_tree_robust(staging)
        raise
    _remove_tree_robust(backup)


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND REGISTRATION
# ═══════════════════════════════════════════════════════════════════════════════


def register_commands(server):
    """Register all environment commands with the AFD server."""

    # ═══════════════════════════════════════════════════════════════════════════
    # addon.create - Create new addon from template
    # ═══════════════════════════════════════════════════════════════════════════

    class AddonCreateInput(BaseModel):
        name: str = Field(..., description="Name for the new addon")
        template: Optional[str] = Field(
            None, description="Template to use (defaults to _TemplateAddon)"
        )
        author: Optional[str] = Field(None, description="Author name for metadata")

    class AddonCreateResult(BaseModel):
        name: str
        path: str
        files_created: int = 0
        next_steps: List[str] = []

    @server.command(
        name="addon.create",
        description="Create a new WoW addon from a template",
        input_schema=AddonCreateInput,
        output_schema=AddonCreateResult,
    )
    async def create_addon(
        input: AddonCreateInput, context: Any = None
    ) -> CommandResult[AddonCreateResult]:
        if not is_safe_component(input.name):
            return error(
                code="INVALID_NAME",
                message=f"Invalid addon name: {input.name!r}",
                suggestion="Use a single folder name without path separators or reserved characters",
            )
        if input.author is not None and (
            not input.author.strip() or any(ord(c) < 32 for c in input.author)
        ):
            return error(
                code="INVALID_AUTHOR",
                message="The author must be a single line of text",
                suggestion="Provide a plain author name or omit it",
            )

        config = get_config()
        dev_path = config.dev_path

        if not dev_path or not dev_path.exists():
            return error(
                code="DEV_PATH_NOT_FOUND",
                message="Development path not found or not configured",
                suggestion="Set MECHANIC_DEV_PATH environment variable or create ~/.mechanic/config.json",
            )

        addon_path = dev_path / input.name
        if addon_path.exists():
            return error(
                code="ADDON_EXISTS",
                message=f"Addon '{input.name}' already exists at {addon_path}",
                suggestion="Choose a different name or delete the existing folder",
            )

        template_path = Path(input.template) if input.template else config.template_path
        if not template_path or not template_path.is_dir():
            return error(
                code="TEMPLATE_NOT_FOUND",
                message=f"Template not found: {template_path}",
                suggestion="Ensure _TemplateAddon exists in your dev path or specify a valid template path",
            )

        try:
            files_created = await asyncio.to_thread(
                scaffold_addon, template_path, addon_path, input.name, input.author
            )
        except Exception as e:
            if addon_path.exists():
                await asyncio.to_thread(_remove_tree_robust, addon_path)
            return error(
                code="COPY_FAILED",
                message=f"Failed to create addon from template: {e}",
                suggestion="Check permissions and disk space; nothing was left behind, so you can retry",
            )

        src = create_source(
            type="folder",
            id=f"addon-{input.name}",
            title=input.name,
            location=str(addon_path),
        )

        def call(command: str) -> str:
            return f"mech call {command} '{json.dumps({'addon': input.name})}'"

        next_steps = [call("addon.sync"), call("addon.validate")]
        if not input.author:
            next_steps.append(f"Set ## Author in {input.name}/{input.name}.toc")
        next_steps.append(f"Edit {input.name}/Core.lua to add your addon logic")
        return success(
            data=AddonCreateResult(
                name=input.name,
                path=str(addon_path),
                files_created=files_created,
                next_steps=next_steps,
            ),
            reasoning=f"Created addon repo '{input.name}' from {template_path.name}",
            sources=[src],
            confidence=1.0,
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # addon.sync - Create junction links to WoW clients
    # ═══════════════════════════════════════════════════════════════════════════

    class AddonSyncInput(BaseModel):
        addon: str = Field(..., description="Name of the addon to sync")
        flavors: Optional[List[str]] = Field(
            None, description="WoW flavors to sync to (defaults to all)"
        )
        dry_run: bool = Field(
            False,
            description="Validate and preview junctions without creating directories or links",
        )

    class SyncLink(BaseModel):
        flavor: str
        target: str
        status: str
        source: str = ""

    class AddonSyncResult(BaseModel):
        addon: str
        dry_run: bool = False
        links: List[SyncLink] = Field(default_factory=list)
        success_count: int = 0
        error_count: int = 0
        steps_completed: List[str] = Field(default_factory=list)
        recovery: List[str] = Field(default_factory=list)

    def plan_links(
        wow_base: Path, source: Path, addon: str, flavors: List[str]
    ) -> List[SyncLink]:
        """Preflight one link per installed client; nothing is created."""
        links = []
        for flavor in dict.fromkeys(flavors):
            client = wow_base / flavor
            target = client / "Interface" / "AddOns" / addon
            if not client.is_dir():
                status = "skipped: client not installed"
            elif not target.parent.resolve().is_relative_to(wow_base.resolve()):
                status = "conflict: parent points outside WoW installation"
            elif os.path.lexists(target):
                status = (
                    "exists"
                    if target.exists() and target.resolve() == source
                    else "conflict: existing target differs from source"
                )
            else:
                status = "planned"
            links.append(
                SyncLink(
                    flavor=flavor, target=str(target), source=str(source), status=status
                )
            )
        return links

    def create_link(target: Path, source: Path) -> None:
        target.parent.mkdir(parents=True, exist_ok=True)
        if sys.platform == "win32":
            env = os.environ.copy()
            env.update(
                MECHANIC_LINK_TARGET=str(target), MECHANIC_LINK_SOURCE=str(source)
            )
            result = subprocess.run(
                [
                    "powershell",
                    "-NoProfile",
                    "-Command",
                    "New-Item -ItemType Junction -Path $env:MECHANIC_LINK_TARGET -Target $env:MECHANIC_LINK_SOURCE -ErrorAction Stop | Out-Null",
                ],
                capture_output=True,
                text=True,
                encoding="utf-8",
                errors="replace",
                timeout=30,
                env=env,
            )
            if result.returncode:
                raise OSError(result.stderr.strip() or "Junction creation failed")
        else:
            target.symlink_to(source, target_is_directory=True)

    @server.command(
        name="addon.sync",
        description="Preflight and create addon junction links; supports dry_run",
        input_schema=AddonSyncInput,
        output_schema=AddonSyncResult,
    )
    async def sync_addon(
        input: AddonSyncInput, context: Any = None
    ) -> CommandResult[AddonSyncResult]:
        config = get_config()
        wow_base = config.wow_root
        if not wow_base or not wow_base.exists():
            return error(
                code="WOW_NOT_FOUND",
                message="WoW installation not found",
                suggestion="Configure MECHANIC_WOW_ROOT",
            )
        flavors = input.flavors or config.flavors
        if not is_safe_component(input.addon) or any(
            not is_safe_component(f) for f in flavors
        ):
            return error(
                code="INVALID_TARGET",
                message="Addon and flavors must be single folder names",
                suggestion="Use configured WoW flavor names and an addon folder name",
            )
        found = find_addon_path(input.addon)
        if not found:
            return addon_not_found(
                input.addon, "Check the addon name or create it first"
            )
        source = found.resolve()
        if not (source / f"{input.addon}.toc").is_file():
            return error(
                code="NO_TOC",
                message=f"{source} does not contain {input.addon}.toc",
                suggestion="Point the addon at the folder that holds its .toc (not the repository root); "
                "a junction to the wrong folder would not load in game",
            )

        data = AddonSyncResult(addon=input.addon, dry_run=input.dry_run)
        data.links = await asyncio.to_thread(
            plan_links, wow_base, source, input.addon, flavors
        )
        conflicts = [link for link in data.links if link.status.startswith("conflict")]
        if conflicts:
            data.error_count = len(conflicts)
            data.recovery = [
                "Inspect conflicting targets and correct the configured paths before syncing."
            ]
            result = error(
                code="SYNC_PREFLIGHT_FAILED",
                message="Conflicting addon destinations",
                suggestion=data.recovery[0],
                details={"links": [link.model_dump() for link in conflicts]},
            )
            result.data = data
            return result
        if not any(link.status in ("planned", "exists") for link in data.links):
            return error(
                code="NO_CLIENT_FOUND",
                message="None of the requested WoW clients are installed",
                suggestion=f"Check MECHANIC_WOW_ROOT ({wow_base}) and the flavors {list(dict.fromkeys(flavors))}",
            )
        if input.dry_run:
            return success(
                data, reasoning="Junction preview; no directories or links created"
            )
        for link in data.links:
            if link.status == "exists":
                data.success_count += 1
                continue
            if link.status != "planned":
                continue
            target = Path(link.target)
            try:
                await asyncio.to_thread(create_link, target, source)
                link.status = "created"
                data.success_count += 1
                data.steps_completed.append(str(target))
            except Exception as exc:
                link.status = f"error: {exc}"
                data.error_count += 1
                data.recovery = [
                    "Inspect the failed target and its parent folders; completed links and created parent directories remain.",
                    "Correct permissions or paths and retry addon.sync; existing matching links are preserved.",
                ]
                result = error(
                    code="SYNC_PARTIAL_FAILURE",
                    message=f"Could not create {target}: {exc}",
                    suggestion=data.recovery[0],
                    details={
                        "steps_completed": data.steps_completed,
                        "failed_target": str(target),
                        "recovery": data.recovery,
                    },
                )
                result.data = data
                return result
        return success(
            data,
            reasoning=f"Synced {input.addon} to {data.success_count} clients",
            confidence=1.0,
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # libs.check - Check library sync status
    # ═══════════════════════════════════════════════════════════════════════════

    class LibsCheckInput(BaseModel):
        addon: str = Field(..., description="Name of the addon to check")

    class LibStatus(BaseModel):
        name: str
        configured_version: Optional[str] = None
        installed_version: Optional[str] = None
        status: str = "ok"  # ok, missing, extra, outdated
        path: Optional[str] = None

    class LibsCheckResult(BaseModel):
        addon: str
        has_config: bool = False
        config_mode: Optional[str] = None
        libraries: List[LibStatus] = []
        issues: List[str] = []

    def scan_libs(libs_path: Path, addon: str) -> LibsCheckResult:
        libs_config = _load_libs_config(libs_path)
        has_config = libs_config is not None
        config_mode = str(libs_config.get("mode", "include")) if libs_config else None
        configured = libs_config.get("libraries", {}) if libs_config else {}
        if not isinstance(configured, dict):
            configured = {}

        installed_libs = {
            item.name: _extract_lib_version(item)
            for item in libs_path.iterdir()
            if item.is_dir() and item.name != "__pycache__"
        }

        libraries: List[LibStatus] = []
        issues: List[str] = []

        if has_config and config_mode == "include":
            for lib_name, configured_version in configured.items():
                version = _get_lib_version_config(configured_version)
                if lib_name in installed_libs:
                    libraries.append(
                        LibStatus(
                            name=lib_name,
                            configured_version=version,
                            installed_version=installed_libs[lib_name],
                            status="ok",
                            path=str(libs_path / lib_name),
                        )
                    )
                else:
                    libraries.append(
                        LibStatus(
                            name=lib_name, configured_version=version, status="missing"
                        )
                    )
                    issues.append(f"Missing: {lib_name}")

            for lib_name, installed_version in installed_libs.items():
                if lib_name not in configured:
                    libraries.append(
                        LibStatus(
                            name=lib_name,
                            installed_version=installed_version,
                            status="extra",
                            path=str(libs_path / lib_name),
                        )
                    )
                    issues.append(f"Extra (not in config): {lib_name}")
        else:
            for lib_name, installed_version in installed_libs.items():
                libraries.append(
                    LibStatus(
                        name=lib_name,
                        installed_version=installed_version,
                        status="ok",
                        path=str(libs_path / lib_name),
                    )
                )
            if not has_config:
                issues.append("No libs.json - run 'libs.init' to create one")

        return LibsCheckResult(
            addon=addon,
            has_config=has_config,
            config_mode=config_mode,
            libraries=sorted(libraries, key=lambda x: x.name),
            issues=issues,
        )

    @server.command(
        name="libs.check",
        description="Check addon library status against libs.json config",
        input_schema=LibsCheckInput,
        output_schema=LibsCheckResult,
    )
    async def check_libs(
        input: LibsCheckInput, context: Any = None
    ) -> CommandResult[LibsCheckResult]:
        addon_path = find_addon_path(input.addon)
        if not addon_path:
            return addon_not_found(input.addon, "Check the addon name")

        libs_path = addon_path / "Libs"
        if not libs_path.exists():
            return success(
                data=LibsCheckResult(addon=input.addon, issues=["No Libs folder"]),
                reasoning="No Libs folder found in addon",
                confidence=1.0,
            )

        data = await asyncio.to_thread(scan_libs, libs_path, input.addon)
        src = create_source(
            type="folder",
            id=f"libs-{input.addon}",
            title="Libs",
            location=str(libs_path),
        )
        return success(
            data=data,
            reasoning=f"Found {len(data.libraries)} libraries, {len(data.issues)} issues",
            sources=[src],
            confidence=1.0,
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # libs.init - Initialize libs.json from existing Libs folder
    # ═══════════════════════════════════════════════════════════════════════════

    class LibsInitInput(BaseModel):
        addon: str = Field(..., description="Name of the addon")
        mode: str = Field(
            "include",
            description="Config mode: 'include' (whitelist) or 'exclude' (blocklist)",
        )
        overwrite: bool = Field(False, description="Overwrite existing libs.json")

    class LibsInitResult(BaseModel):
        addon: str
        config_path: str
        libraries_count: int
        libraries: Dict[str, str]

    @server.command(
        name="libs.init",
        description="Creates a libs.json config file from currently installed libraries. ⚠️ Will NOT overwrite existing config unless overwrite=true is set.",
        input_schema=LibsInitInput,
        output_schema=LibsInitResult,
    )
    async def init_libs(
        input: LibsInitInput, context: Any = None
    ) -> CommandResult[LibsInitResult]:
        addon_path = find_addon_path(input.addon)
        if not addon_path:
            return addon_not_found(input.addon, "Check the addon name")

        libs_path = addon_path / "Libs"
        if not libs_path.exists():
            return error(
                code="NO_LIBS",
                message=f"No Libs folder found in {input.addon}",
                suggestion="Create a Libs folder first",
            )

        config_file = libs_path / "libs.json"
        if config_file.exists() and not input.overwrite:
            return error(
                code="CONFIG_EXISTS",
                message="libs.json already exists",
                suggestion="Use overwrite=true to replace it",
            )

        # Default to "latest"; pinning is a manual edit
        libraries = {
            item.name: "latest"
            for item in libs_path.iterdir()
            if item.is_dir() and item.name != "__pycache__"
        }
        config = {
            "$schema": "https://mechanic.dev/schemas/libs.json",
            "description": f"Library configuration for {input.addon}",
            "mode": input.mode,
            "libraries": dict(sorted(libraries.items())),
        }
        await asyncio.to_thread(
            config_file.write_text, json.dumps(config, indent=2), encoding="utf-8"
        )

        src = create_source(
            type="file",
            id=f"libs-config-{input.addon}",
            title="libs.json",
            location=str(config_file),
        )

        return success(
            data=LibsInitResult(
                addon=input.addon,
                config_path=str(config_file),
                libraries_count=len(libraries),
                libraries=libraries,
            ),
            reasoning=f"Generated libs.json with {len(libraries)} libraries",
            sources=[src],
            confidence=1.0,
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # libs.sync - Sync libraries based on libs.json config
    # ═══════════════════════════════════════════════════════════════════════════

    class LibsSyncInput(BaseModel):
        addon: str = Field(..., description="Name of the addon to sync")
        source: Optional[str] = Field(
            None,
            description="Source library path (defaults to <dev_path>/Libs, then <dev_path>/MechanicLocal/Libs)",
        )
        dry_run: bool = Field(False, description="Preview changes without applying")
        force: bool = Field(
            False, description="Force update existing libraries (replaces them)"
        )
        remove_extra: bool = Field(False, description="Remove libraries not in config")

    class SyncAction(BaseModel):
        library: str
        action: str  # copy, update, skip, remove, error
        source: Optional[str] = None
        target: Optional[str] = None
        reason: str

    class LibsSyncResult(BaseModel):
        addon: str
        dry_run: bool
        actions: List[SyncAction] = []
        copied: int = 0
        updated: int = 0
        skipped: int = 0
        removed: int = 0
        errors: int = 0
        steps_completed: List[str] = Field(default_factory=list)
        recovery: List[str] = Field(default_factory=list)

    def _do(actions: List[SyncAction], dry_run: bool, action: SyncAction, run, past):
        """Record ``action``; execute ``run`` unless previewing. Returns True on success."""
        if dry_run:
            action.reason = f"Would {action.reason}"
            actions.append(action)
            return True
        try:
            run()
        except Exception as exc:
            actions.append(
                SyncAction(library=action.library, action="error", reason=str(exc))
            )
            return False
        action.reason = past
        actions.append(action)
        return True

    def run_libs_sync(
        input: LibsSyncInput,
        libs_path: Path,
        configured_libs: Dict[str, Any],
        notes: Dict[str, Any],
        default_source: Optional[Path],
        dev_path: Optional[Path],
        dry_run: bool,
    ) -> LibsSyncResult:
        """Plan (dry_run) or apply the sync for every configured library (blocking)."""
        actions: List[SyncAction] = []
        copied = updated = skipped = removed = errors = 0
        installed = {item.name for item in libs_path.iterdir() if item.is_dir()}
        libs_root = libs_path.resolve()

        for lib_name, lib_config in configured_libs.items():
            target_path = libs_path / lib_name
            version = _get_lib_version_config(lib_config)
            src_lib = _find_library_source(
                lib_name, lib_config, default_source, dev_path
            )

            if (
                target_path.is_symlink()
                or target_path.resolve().parent != libs_root
                or (
                    src_lib
                    and (
                        not src_lib.is_dir()
                        or src_lib.resolve() == target_path.resolve()
                        or src_lib.resolve().is_relative_to(target_path.resolve())
                        or target_path.resolve().is_relative_to(src_lib.resolve())
                    )
                )
            ):
                actions.append(
                    SyncAction(
                        library=lib_name,
                        action="error",
                        target=str(target_path),
                        reason="Unsafe or overlapping source/target path",
                    )
                )
                errors += 1
                continue

            if version == "local" and not src_lib:
                actions.append(
                    SyncAction(
                        library=lib_name,
                        action="skip",
                        reason=str(
                            notes.get(
                                lib_name, "Local library not found in shared Libs"
                            )
                        ),
                    )
                )
                skipped += 1
                continue

            if target_path.exists():
                if input.force and src_lib:
                    ok = _do(
                        actions,
                        dry_run,
                        SyncAction(
                            library=lib_name,
                            action="update",
                            source=str(src_lib),
                            target=str(target_path),
                            reason=f"update from {src_lib.name}",
                        ),
                        lambda: _replace_library(src_lib, target_path),
                        f"Force updated from {src_lib.name}",
                    )
                    if ok:
                        updated += 1
                    else:
                        errors += 1
                else:
                    actions.append(
                        SyncAction(
                            library=lib_name,
                            action="skip",
                            target=str(target_path),
                            reason="Already installed (use force=true to update)",
                        )
                    )
                    skipped += 1
                continue

            if not src_lib:
                actions.append(
                    SyncAction(
                        library=lib_name, action="error", reason="Source not found"
                    )
                )
                errors += 1
                continue
            ok = _do(
                actions,
                dry_run,
                SyncAction(
                    library=lib_name,
                    action="copy",
                    source=str(src_lib),
                    target=str(target_path),
                    reason=f"copy from {src_lib.name}",
                ),
                lambda: _copy_library(src_lib, target_path),
                f"Copied from {src_lib.name}",
            )
            if ok:
                copied += 1
            else:
                errors += 1

        if input.remove_extra:
            for lib_name in sorted(installed):
                if lib_name in configured_libs:
                    continue
                target_path = libs_path / lib_name
                if (
                    target_path.is_symlink()
                    or target_path.resolve().parent != libs_root
                ):
                    actions.append(
                        SyncAction(
                            library=lib_name,
                            action="error",
                            target=str(target_path),
                            reason="Refusing to remove a linked library",
                        )
                    )
                    errors += 1
                    continue
                ok = _do(
                    actions,
                    dry_run,
                    SyncAction(
                        library=lib_name,
                        action="remove",
                        target=str(target_path),
                        reason="remove (not in config)",
                    ),
                    lambda: _remove_tree_robust(target_path),
                    "Not in libs.json config",
                )
                if ok:
                    removed += 1
                else:
                    errors += 1

        return LibsSyncResult(
            addon=input.addon,
            dry_run=dry_run,
            actions=actions,
            copied=copied,
            updated=updated,
            skipped=skipped,
            removed=removed,
            errors=errors,
            steps_completed=[]
            if dry_run
            else [
                f"{a.action}: {a.library}"
                for a in actions
                if a.action in ("copy", "update", "remove")
            ],
        )

    @server.command(
        name="libs.sync",
        description="Sync addon libraries based on libs.json config",
        input_schema=LibsSyncInput,
        output_schema=LibsSyncResult,
    )
    async def sync_libs(
        input: LibsSyncInput, context: Any = None
    ) -> CommandResult[LibsSyncResult]:
        config = get_config()

        addon_path = find_addon_path(input.addon)
        if not addon_path:
            return addon_not_found(input.addon, "Check the addon name")

        libs_path = addon_path / "Libs"
        if not libs_path.exists():
            return error(
                code="NO_LIBS",
                message=f"No Libs folder in {input.addon}",
                suggestion="Create Libs folder and libs.json first",
            )

        libs_config = _load_libs_config(libs_path)
        if not libs_config:
            return error(
                code="NO_CONFIG",
                message="No valid libs.json found (it must be a JSON object)",
                suggestion="Run 'libs.init' to create one",
            )

        mode = libs_config.get("mode", "include")
        configured_libs = libs_config.get("libraries", {})
        notes = libs_config.get("notes", {})
        if not isinstance(notes, dict):
            notes = {}

        if mode != "include":
            return error(
                code="UNSUPPORTED_MODE",
                message=f"Library sync mode '{mode}' is not supported",
                suggestion="Use include mode with explicit libraries",
            )
        if not isinstance(configured_libs, dict) or any(
            not is_safe_component(name) for name in configured_libs
        ):
            return error(
                code="INVALID_CONFIG",
                message="Library names must be single folder names",
                suggestion="Correct the libraries mapping in libs.json",
            )

        default_source = Path(input.source) if input.source else None
        if not default_source and config.dev_path:
            # Libs is the canonical location; the others are legacy/alternative
            for candidate in (
                config.dev_path / "Libs",
                config.dev_path / "MechanicLocal" / "Libs",
                config.dev_path / "_SharedLibs",
            ):
                if candidate.exists():
                    default_source = candidate
                    break

        def run(dry_run: bool) -> LibsSyncResult:
            return run_libs_sync(
                input,
                libs_path,
                configured_libs,
                notes,
                default_source,
                config.dev_path,
                dry_run,
            )

        # Preflight first so a real run never starts when any library would fail
        data = await asyncio.to_thread(run, True)
        if not input.dry_run and not data.errors:
            data = await asyncio.to_thread(run, False)

        src = create_source(
            type="folder",
            id=f"libs-sync-{input.addon}",
            title="Library Sync",
            location=str(libs_path),
        )

        preview = input.dry_run or data.dry_run
        if data.errors:
            data.recovery = [
                "Inspect error actions and their library folders before retrying; a failed copy/update may leave a partial folder.",
                "Restore affected libraries from their source or backup, then run dry_run=true before retrying.",
                "Preflight did not change library files."
                if data.dry_run
                else "Completed actions were not rolled back.",
            ]
            result = error(
                code="LIBS_PREFLIGHT_FAILED"
                if data.dry_run
                else "LIBS_PARTIAL_FAILURE",
                message=f"Library sync encountered {data.errors} errors",
                suggestion=data.recovery[0],
                details={
                    "actions": [a.model_dump() for a in data.actions],
                    "steps_completed": data.steps_completed,
                    "recovery": data.recovery,
                },
            )
            result.data = data
            return result
        return success(
            data=data,
            reasoning=f"{'Preview: ' if preview else ''}{data.copied} copied, {data.updated} updated, {data.skipped} skipped, {data.removed} removed",
            sources=[src],
            confidence=1.0,
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # env.status - Environment status for dashboard
    # ═══════════════════════════════════════════════════════════════════════════

    class FlavorInfo(BaseModel):
        name: str
        path: str
        exists: bool

    class EnvStatusInput(BaseModel):
        """Empty input for env.status"""

        pass

    class EnvStatusResult(BaseModel):
        wow_root: Optional[str]
        dev_path: Optional[str]
        data_dir: str
        flavors: List[FlavorInfo]

    @server.command(
        name="env.status",
        description="Get Mechanic environment configuration and status",
        input_schema=EnvStatusInput,
        output_schema=EnvStatusResult,
    )
    async def env_status(
        input: EnvStatusInput, context: Any = None
    ) -> CommandResult[EnvStatusResult]:
        config = get_config()

        flavors = []
        for flavor in config.flavors:
            flavor_path = config.wow_root / flavor if config.wow_root else None
            flavors.append(
                FlavorInfo(
                    name=flavor,
                    path=str(flavor_path) if flavor_path else "",
                    exists=flavor_path.exists() if flavor_path else False,
                )
            )

        return success(
            data=EnvStatusResult(
                wow_root=str(config.wow_root) if config.wow_root else None,
                dev_path=str(config.dev_path) if config.dev_path else None,
                data_dir=str(get_data_dir(create=False)),
                flavors=flavors,
            ),
            reasoning=f"Environment configured with {len([f for f in flavors if f.exists])} active WoW clients",
            confidence=1.0,
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # system.pick_file - Open native file picker dialog
    # ═══════════════════════════════════════════════════════════════════════════

    class PickFileInput(BaseModel):
        title: str = Field("Select File", description="Title of the dialog window")
        filter: str = Field(
            "All Files (*.*)|*.*",
            description="File filter (e.g., 'Text Files (*.txt)|*.txt')",
        )

    class PickFileResult(BaseModel):
        path: str
        filename: str
        directory: str

    @server.command(
        name="system.pick_file",
        description="Open a native file picker dialog to select a file (Windows only)",
        input_schema=PickFileInput,
        output_schema=PickFileResult,
    )
    async def pick_file(
        input: PickFileInput, context: Any = None
    ) -> CommandResult[PickFileResult]:
        if sys.platform != "win32":
            return error(
                code="UNSUPPORTED_PLATFORM",
                message="The native file picker is only available on Windows",
                suggestion="Pass the file path explicitly instead of picking it",
            )

        ps_script = """
        Add-Type -AssemblyName System.Windows.Forms
        $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog
        $FileBrowser.Title = $env:MECHANIC_PICKER_TITLE
        $FileBrowser.Filter = $env:MECHANIC_PICKER_FILTER
        $FileBrowser.InitialDirectory = [System.Environment]::GetFolderPath('MyDocuments')

        if ($FileBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
            Write-Output $FileBrowser.FileName
        }
        """

        picker_env = os.environ.copy()
        picker_env["MECHANIC_PICKER_TITLE"] = input.title
        picker_env["MECHANIC_PICKER_FILTER"] = input.filter
        try:
            result = await asyncio.to_thread(
                subprocess.run,
                ["powershell", "-NoProfile", "-STA", "-Command", ps_script],
                capture_output=True,
                text=True,
                encoding="utf-8",
                errors="replace",
                timeout=60,  # Give user time to pick
                env=picker_env,
            )
        except subprocess.TimeoutExpired:
            return error(
                code="TIMEOUT",
                message="The file picker was not answered within 60 seconds",
                suggestion="Run the command again and choose a file in the dialog",
            )
        except OSError as exc:
            return error(
                code="PICKER_FAILED",
                message=f"File picker could not be started: {exc}",
                suggestion="Ensure Windows PowerShell is available, or pass the path explicitly",
            )

        if result.returncode != 0:
            return error(
                code="PICKER_FAILED",
                message=f"File picker failed (exit {result.returncode}): {result.stderr.strip()[:300]}",
                suggestion="Run from an interactive desktop session, or pass the path explicitly",
            )

        file_path = result.stdout.strip()
        if not file_path or not Path(file_path).exists():
            return error(
                code="NO_SELECTION",
                message="No file selected or file does not exist",
                suggestion="Try again and select a valid file",
            )

        path_obj = Path(file_path)
        src = create_source(
            type="file",
            id="file-picker",
            title="User Selection",
            location=str(path_obj),
        )
        return success(
            data=PickFileResult(
                path=str(path_obj),
                filename=path_obj.name,
                directory=str(path_obj.parent),
            ),
            reasoning=f"User selected: {path_obj.name}",
            sources=[src],
            confidence=1.0,
        )

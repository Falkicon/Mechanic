"""
Environment commands for WoW addon development.
Handles addon creation, junction syncing, and library management.
"""

from afd import CommandResult, success, error
from afd.core.metadata import create_source, create_warning, WarningSeverity
from pathlib import Path
from pydantic import BaseModel, Field
from typing import Any, Dict, List, Optional
import subprocess
import shutil

# Use centralized config
from ..config import get_config, find_addon_path


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
        template: Optional[str] = Field(None, description="Template to use (defaults to _TemplateAddon)")
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
    async def create_addon(input: AddonCreateInput, context: Any = None) -> CommandResult[AddonCreateResult]:
        config = get_config()
        dev_path = config.dev_path
        
        if not dev_path or not dev_path.exists():
            return error(
                code="DEV_PATH_NOT_FOUND",
                message="Development path not found or not configured",
                suggestion="Set MECHANIC_DEV_PATH environment variable or create ~/.mechanic/config.json"
            )
        
        # Check if addon already exists
        addon_path = dev_path / input.name
        if addon_path.exists():
            return error(
                code="ADDON_EXISTS",
                message=f"Addon '{input.name}' already exists at {addon_path}",
                suggestion="Choose a different name or delete the existing folder"
            )
        
        # Find template
        template_path = Path(input.template) if input.template else config.template_path
        if not template_path or not template_path.exists():
            return error(
                code="TEMPLATE_NOT_FOUND",
                message=f"Template not found: {template_path}",
                suggestion="Ensure _TemplateAddon exists in your dev path or specify a valid template path"
            )
        
        # Copy template
        try:
            shutil.copytree(template_path, addon_path)
        except Exception as e:
            return error(
                code="COPY_FAILED",
                message=f"Failed to copy template: {e}",
                suggestion="Check permissions and disk space"
            )
        
        # Rename nested folder and files, update content
        files_created = 0
        template_name = "TemplateAddon" # Hardcoded based on known structure
        
        # 1. Rename the nested addon folder if it exists
        nested_addon_path = addon_path / template_name
        if nested_addon_path.exists() and nested_addon_path.is_dir():
            new_nested_path = addon_path / input.name
            nested_addon_path.rename(new_nested_path)
        
        # 2. Process all files
        # We walk top-down so we can rename directories as we go? 
        # Actually rglob is fine, but we must be careful about renaming parents while iterating.
        # Safest to do content updates first, then renames.
        
        all_files = list(addon_path.rglob("*"))
        
        # Content updates
        for file_path in all_files:
            if file_path.is_file():
                files_created += 1
                if file_path.suffix in ['.lua', '.toc', '.md', '.xml', '.json', '.yaml']:
                    try:
                        content = file_path.read_text(encoding='utf-8')
                        if template_name in content or "Your Name" in content:
                            content = content.replace(template_name, input.name)
                            if input.author:
                                content = content.replace("## Author: Your Name", f"## Author: {input.author}")
                                content = content.replace("Your Name", input.author)
                            file_path.write_text(content, encoding='utf-8')
                    except Exception:
                        pass

        # Filename/Directory Renames (Deepest first to avoid breaking paths)
        # Re-list to get current paths
        # We need to rename files named "TemplateAddon.*" to "NewName.*"
        
        for file_path in sorted(addon_path.rglob("*"), key=lambda p: len(p.parts), reverse=True):
            if template_name in file_path.name:
                new_name = file_path.name.replace(template_name, input.name)
                new_path = file_path.parent / new_name
                try:
                    file_path.rename(new_path)
                except Exception:
                    pass
        
        src = create_source(
            type="folder",
            id=f"addon-{input.name}",
            title=input.name,
            location=str(addon_path)
        )
        
        return success(
            data=AddonCreateResult(
                name=input.name,
                path=str(addon_path),
                files_created=files_created,
                next_steps=[
                    f"Run: mech call addon.sync -i '{{\"addon\": \"{input.name}\"}}'",
                    f"Run: mech call addon.validate -i '{{\"addon\": \"{input.name}\"}}'",
                    f"Edit {input.name}/Core.lua to add your addon logic"
                ]
            ),
            reasoning=f"Created addon repo '{input.name}' with nested '{input.name}' folder",
            sources=[src],
            confidence=1.0
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # addon.sync - Create junction links to WoW clients
    # ═══════════════════════════════════════════════════════════════════════════
    
    class AddonSyncInput(BaseModel):
        addon: str = Field(..., description="Name of the addon to sync")
        flavors: Optional[List[str]] = Field(None, description="WoW flavors to sync to (defaults to all)")

    class SyncLink(BaseModel):
        flavor: str
        target: str
        status: str

    class AddonSyncResult(BaseModel):
        addon: str
        links: List[SyncLink] = []
        success_count: int = 0
        error_count: int = 0

    @server.command(
        name="addon.sync",
        description="Create junction links from development addon to WoW client folders",
        input_schema=AddonSyncInput,
        output_schema=AddonSyncResult,
    )
    async def sync_addon(input: AddonSyncInput, context: Any = None) -> CommandResult[AddonSyncResult]:
        config = get_config()
        wow_base = config.wow_root
        
        if not wow_base or not wow_base.exists():
            return error(
                code="WOW_NOT_FOUND",
                message="WoW installation not found",
                suggestion="Set MECHANIC_WOW_ROOT environment variable or create ~/.mechanic/config.json"
            )
        
        # Find source addon using centralized path resolution
        source_path = find_addon_path(input.addon)
        if not source_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or create it first with addon.create"
            )
        
        flavors = input.flavors or config.flavors
        links = []
        success_count = 0
        error_count = 0
        
        for flavor in flavors:
            addons_path = wow_base / flavor / "Interface" / "AddOns" / input.addon
            
            if addons_path.exists():
                links.append(SyncLink(
                    flavor=flavor,
                    target=str(addons_path),
                    status="exists"
                ))
                success_count += 1
                continue
            
            # Create parent directory if needed
            addons_path.parent.mkdir(parents=True, exist_ok=True)
            
            # Create junction (Windows) or symlink
            try:
                if subprocess.sys.platform == 'win32':
                    # Use mklink /J for junction
                    result = subprocess.run(
                        ["cmd", "/c", "mklink", "/J", str(addons_path), str(source_path)],
                        capture_output=True,
                        text=True,
                        timeout=10
                    )
                    if result.returncode == 0:
                        links.append(SyncLink(flavor=flavor, target=str(addons_path), status="created"))
                        success_count += 1
                    else:
                        links.append(SyncLink(flavor=flavor, target=str(addons_path), status=f"failed: {result.stderr}"))
                        error_count += 1
                else:
                    addons_path.symlink_to(source_path)
                    links.append(SyncLink(flavor=flavor, target=str(addons_path), status="created"))
                    success_count += 1
            except Exception as e:
                links.append(SyncLink(flavor=flavor, target=str(addons_path), status=f"error: {e}"))
                error_count += 1
        
        src = create_source(
            type="junction",
            id=f"sync-{input.addon}",
            title=f"Junction Links for {input.addon}",
            location=str(source_path)
        )
        
        return success(
            data=AddonSyncResult(
                addon=input.addon,
                links=links,
                success_count=success_count,
                error_count=error_count
            ),
            reasoning=f"Synced {input.addon} to {success_count} clients ({error_count} errors)",
            sources=[src],
            confidence=1.0
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

    def _load_libs_config(libs_path: Path) -> Optional[Dict]:
        """Load libs.json from a Libs folder."""
        import json
        config_file = libs_path / "libs.json"
        if config_file.exists():
            try:
                return json.loads(config_file.read_text(encoding='utf-8'))
            except Exception:
                return None
        return None

    def _extract_lib_version(lib_path: Path) -> Optional[str]:
        """Extract version from library files."""
        import re
        for file in lib_path.glob("*.lua"):
            try:
                content = file.read_text(encoding='utf-8', errors='replace')[:1000]
                # Look for MINOR pattern (common in Ace3/libs)
                match = re.search(r'MINOR\s*=\s*(\d+)', content)
                if match:
                    return f"r{match.group(1)}"
            except Exception:
                pass
        return None

    @server.command(
        name="libs.check",
        description="Check addon library status against libs.json config",
        input_schema=LibsCheckInput,
        output_schema=LibsCheckResult,
    )
    async def check_libs(input: LibsCheckInput, context: Any = None) -> CommandResult[LibsCheckResult]:
        addon_path = find_addon_path(input.addon)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name"
            )
        
        libs_path = addon_path / "Libs"
        if not libs_path.exists():
            return success(
                data=LibsCheckResult(addon=input.addon, issues=["No Libs folder"]),
                reasoning="No Libs folder found in addon",
                confidence=1.0
            )
        
        # Load libs.json config
        libs_config = _load_libs_config(libs_path)
        has_config = libs_config is not None
        config_mode = libs_config.get("mode", "include") if libs_config else None
        configured_libs = libs_config.get("libraries", {}) if libs_config else {}
        
        # Scan installed libraries
        installed_libs = {}
        for item in libs_path.iterdir():
            if item.is_dir() and item.name != "__pycache__":
                installed_libs[item.name] = _extract_lib_version(item)
        
        libraries = []
        issues = []
        
        if has_config and config_mode == "include":
            # Check for missing configured libs
            for lib_name, configured_version in configured_libs.items():
                if lib_name in installed_libs:
                    libraries.append(LibStatus(
                        name=lib_name,
                        configured_version=configured_version,
                        installed_version=installed_libs[lib_name],
                        status="ok",
                        path=str(libs_path / lib_name)
                    ))
                else:
                    libraries.append(LibStatus(
                        name=lib_name,
                        configured_version=configured_version,
                        status="missing"
                    ))
                    issues.append(f"Missing: {lib_name}")
            
            # Check for extra libs not in config
            for lib_name, installed_version in installed_libs.items():
                if lib_name not in configured_libs and lib_name != "libs.json":
                    libraries.append(LibStatus(
                        name=lib_name,
                        installed_version=installed_version,
                        status="extra",
                        path=str(libs_path / lib_name)
                    ))
                    issues.append(f"Extra (not in config): {lib_name}")
        else:
            # No config - just report what's installed
            for lib_name, installed_version in installed_libs.items():
                libraries.append(LibStatus(
                    name=lib_name,
                    installed_version=installed_version,
                    status="ok",
                    path=str(libs_path / lib_name)
                ))
            if not has_config:
                issues.append("No libs.json - run 'libs.init' to create one")
        
        src = create_source(
            type="folder",
            id=f"libs-{input.addon}",
            title="Libs",
            location=str(libs_path)
        )
        
        return success(
            data=LibsCheckResult(
                addon=input.addon,
                has_config=has_config,
                config_mode=config_mode,
                libraries=sorted(libraries, key=lambda x: x.name),
                issues=issues
            ),
            reasoning=f"Found {len(libraries)} libraries, {len(issues)} issues",
            sources=[src],
            confidence=1.0
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # libs.init - Initialize libs.json from existing Libs folder
    # ═══════════════════════════════════════════════════════════════════════════
    
    class LibsInitInput(BaseModel):
        addon: str = Field(..., description="Name of the addon")
        mode: str = Field("include", description="Config mode: 'include' (whitelist) or 'exclude' (blocklist)")
        overwrite: bool = Field(False, description="Overwrite existing libs.json")

    class LibsInitResult(BaseModel):
        addon: str
        config_path: str
        libraries_count: int
        libraries: Dict[str, str]

    @server.command(
        name="libs.init",
        description="Generate libs.json from existing Libs folder",
        input_schema=LibsInitInput,
        output_schema=LibsInitResult,
    )
    async def init_libs(input: LibsInitInput, context: Any = None) -> CommandResult[LibsInitResult]:
        import json
        
        addon_path = find_addon_path(input.addon)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name"
            )
        
        libs_path = addon_path / "Libs"
        if not libs_path.exists():
            return error(
                code="NO_LIBS",
                message=f"No Libs folder found in {input.addon}",
                suggestion="Create a Libs folder first"
            )
        
        config_file = libs_path / "libs.json"
        if config_file.exists() and not input.overwrite:
            return error(
                code="CONFIG_EXISTS",
                message="libs.json already exists",
                suggestion="Use overwrite=true to replace it"
            )
        
        # Scan existing libraries
        libraries = {}
        for item in libs_path.iterdir():
            if item.is_dir() and item.name not in ["__pycache__"]:
                # Default to "latest", could be enhanced to detect pinning needs
                libraries[item.name] = "latest"
        
        # Build config
        config = {
            "$schema": "https://mechanic.dev/schemas/libs.json",
            "description": f"Library configuration for {input.addon}",
            "mode": input.mode,
            "libraries": dict(sorted(libraries.items()))
        }
        
        # Write config
        config_file.write_text(json.dumps(config, indent=2), encoding='utf-8')
        
        src = create_source(
            type="file",
            id=f"libs-config-{input.addon}",
            title="libs.json",
            location=str(config_file)
        )
        
        return success(
            data=LibsInitResult(
                addon=input.addon,
                config_path=str(config_file),
                libraries_count=len(libraries),
                libraries=libraries
            ),
            reasoning=f"Generated libs.json with {len(libraries)} libraries",
            sources=[src],
            confidence=1.0
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # libs.sync - Sync libraries based on libs.json config
    # ═══════════════════════════════════════════════════════════════════════════
    
    class LibsSyncInput(BaseModel):
        addon: str = Field(..., description="Name of the addon to sync")
        source: Optional[str] = Field(None, description="Source library path (defaults to ADDON_DEV Libs)")
        dry_run: bool = Field(False, description="Preview changes without applying")
        remove_extra: bool = Field(False, description="Remove libraries not in config")

    class SyncAction(BaseModel):
        library: str
        action: str  # copy, skip, remove, error
        source: Optional[str] = None
        target: Optional[str] = None
        reason: str

    class LibsSyncResult(BaseModel):
        addon: str
        dry_run: bool
        actions: List[SyncAction] = []
        copied: int = 0
        skipped: int = 0
        removed: int = 0
        errors: int = 0

    @server.command(
        name="libs.sync",
        description="Sync addon libraries based on libs.json config",
        input_schema=LibsSyncInput,
        output_schema=LibsSyncResult,
    )
    async def sync_libs(input: LibsSyncInput, context: Any = None) -> CommandResult[LibsSyncResult]:
        config = get_config()
        
        addon_path = find_addon_path(input.addon)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name"
            )
        
        libs_path = addon_path / "Libs"
        if not libs_path.exists():
            return error(
                code="NO_LIBS",
                message=f"No Libs folder in {input.addon}",
                suggestion="Create Libs folder and libs.json first"
            )
        
        # Load libs.json
        libs_config = _load_libs_config(libs_path)
        if not libs_config:
            return error(
                code="NO_CONFIG",
                message="No libs.json found",
                suggestion="Run 'libs.init' to create one"
            )
        
        mode = libs_config.get("mode", "include")
        configured_libs = libs_config.get("libraries", {})
        notes = libs_config.get("notes", {})
        
        # Find source library path
        source_path = Path(input.source) if input.source else None
        if not source_path:
            # Try common locations
            if config.dev_path:
                # Check for central Libs in ADDON_DEV or similar
                possible_sources = [
                    config.dev_path / "ADDON_DEV" / "Libs",
                    config.dev_path / "_SharedLibs",
                    config.dev_path / "Libs",
                ]
                for p in possible_sources:
                    if p.exists():
                        source_path = p
                        break
        
        actions = []
        copied = skipped = removed = errors = 0
        
        # Get currently installed
        installed = {item.name for item in libs_path.iterdir() if item.is_dir()}
        
        if mode == "include":
            # Process configured libraries
            for lib_name, version in configured_libs.items():
                target_path = libs_path / lib_name
                
                # Skip local libs
                if version == "local":
                    actions.append(SyncAction(
                        library=lib_name,
                        action="skip",
                        reason=notes.get(lib_name, "Marked as local")
                    ))
                    skipped += 1
                    continue
                
                # Check if already installed
                if target_path.exists():
                    actions.append(SyncAction(
                        library=lib_name,
                        action="skip",
                        target=str(target_path),
                        reason="Already installed"
                    ))
                    skipped += 1
                    continue
                
                # Find source
                if source_path and (source_path / lib_name).exists():
                    src_lib = source_path / lib_name
                    if not input.dry_run:
                        try:
                            shutil.copytree(src_lib, target_path)
                            actions.append(SyncAction(
                                library=lib_name,
                                action="copy",
                                source=str(src_lib),
                                target=str(target_path),
                                reason=f"Copied (version: {version})"
                            ))
                            copied += 1
                        except Exception as e:
                            actions.append(SyncAction(
                                library=lib_name,
                                action="error",
                                reason=str(e)
                            ))
                            errors += 1
                    else:
                        actions.append(SyncAction(
                            library=lib_name,
                            action="copy",
                            source=str(src_lib),
                            target=str(target_path),
                            reason=f"Would copy (version: {version})"
                        ))
                        copied += 1
                else:
                    actions.append(SyncAction(
                        library=lib_name,
                        action="error",
                        reason="Source not found"
                    ))
                    errors += 1
            
            # Handle extra libraries (not in config)
            if input.remove_extra:
                for lib_name in installed:
                    if lib_name not in configured_libs and lib_name != "libs.json":
                        target_path = libs_path / lib_name
                        if not input.dry_run:
                            try:
                                shutil.rmtree(target_path)
                                actions.append(SyncAction(
                                    library=lib_name,
                                    action="remove",
                                    target=str(target_path),
                                    reason="Not in libs.json config"
                                ))
                                removed += 1
                            except Exception as e:
                                actions.append(SyncAction(
                                    library=lib_name,
                                    action="error",
                                    reason=str(e)
                                ))
                                errors += 1
                        else:
                            actions.append(SyncAction(
                                library=lib_name,
                                action="remove",
                                target=str(target_path),
                                reason="Would remove (not in config)"
                            ))
                            removed += 1
        
        src = create_source(
            type="folder",
            id=f"libs-sync-{input.addon}",
            title="Library Sync",
            location=str(libs_path)
        )
        
        return success(
            data=LibsSyncResult(
                addon=input.addon,
                dry_run=input.dry_run,
                actions=actions,
                copied=copied,
                skipped=skipped,
                removed=removed,
                errors=errors
            ),
            reasoning=f"{'Preview: ' if input.dry_run else ''}{copied} copied, {skipped} skipped, {removed} removed, {errors} errors",
            sources=[src],
            confidence=1.0
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
    async def env_status(input: EnvStatusInput, context: Any = None) -> CommandResult[EnvStatusResult]:
        config = get_config()
        
        # Gather flavor information
        flavors = []
        for flavor in config.flavors:
            flavor_path = config.wow_root / flavor if config.wow_root else None
            flavors.append(FlavorInfo(
                name=flavor,
                path=str(flavor_path) if flavor_path else "",
                exists=flavor_path.exists() if flavor_path else False
            ))
        
        return success(
            data=EnvStatusResult(
                wow_root=str(config.wow_root) if config.wow_root else None,
                dev_path=str(config.dev_path) if config.dev_path else None,
                data_dir=str(config.data_dir),
                flavors=flavors
            ),
            reasoning=f"Environment configured with {len([f for f in flavors if f.exists])} active WoW clients",
            confidence=1.0
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # system.pick_file - Open native file picker dialog
    # ═══════════════════════════════════════════════════════════════════════════
    
    class PickFileInput(BaseModel):
        title: str = Field("Select File", description="Title of the dialog window")
        filter: str = Field("All Files (*.*)|*.*", description="File filter (e.g., 'Text Files (*.txt)|*.txt')")

    class PickFileResult(BaseModel):
        path: str
        filename: str
        directory: str

    @server.command(
        name="system.pick_file",
        description="Open a native file picker dialog to select a file",
        input_schema=PickFileInput,
        output_schema=PickFileResult,
    )
    async def pick_file(input: PickFileInput, context: Any = None) -> CommandResult[PickFileResult]:
        # PowerShell script to open file dialog
        ps_script = f"""
        Add-Type -AssemblyName System.Windows.Forms
        $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog
        $FileBrowser.Title = '{input.title}'
        $FileBrowser.Filter = '{input.filter}'
        $FileBrowser.InitialDirectory = [System.Environment]::GetFolderPath('MyDocuments')
        
        if ($FileBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {{
            Write-Output $FileBrowser.FileName
        }}
        """
        
        try:
            result = subprocess.run(
                ["powershell", "-Command", ps_script],
                capture_output=True,
                text=True,
                timeout=60  # Give user time to pick
            )
            
            file_path = result.stdout.strip()
            
            if not file_path or not Path(file_path).exists():
                return error(
                    code="NO_SELECTION",
                    message="No file selected or file does not exist",
                    suggestion="Try again and select a valid file"
                )
                
            path_obj = Path(file_path)
            
            src = create_source(
                type="file",
                id="file-picker",
                title="User Selection",
                location=str(path_obj)
            )
            
            return success(
                data=PickFileResult(
                    path=str(path_obj),
                    filename=path_obj.name,
                    directory=str(path_obj.parent)
                ),
                reasoning=f"User selected: {path_obj.name}",
                sources=[src],
                confidence=1.0
            )
            
        except subprocess.TimeoutExpired:
            return error(code="TIMEOUT", message="File picker timed out")
        except Exception as e:
            return error(code="ERROR", message=f"File picker failed: {e}")

"""
Release pipeline commands for WoW addon development.
Handles version bumping, changelog updates, and git operations.
"""

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pathlib import Path
from pydantic import BaseModel, Field
from typing import Any, List, Optional
import re
import subprocess
from datetime import datetime

# Use centralized config
from ..config import find_addon_path


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND REGISTRATION
# ═══════════════════════════════════════════════════════════════════════════════

def register_commands(server):
    """Register all release pipeline commands with the AFD server."""

    # ═══════════════════════════════════════════════════════════════════════════
    # version.bump - Update version in .toc file
    # ═══════════════════════════════════════════════════════════════════════════
    
    class VersionBumpInput(BaseModel):
        addon: str = Field(..., description="Name of the addon")
        version: str = Field(..., description="New version string (e.g., '1.2.0')")
        path: Optional[str] = Field(None, description="Override path to addon folder")

    class VersionBumpResult(BaseModel):
        addon: str
        old_version: Optional[str] = None
        new_version: str
        toc_file: str

    @server.command(
        name="version.bump",
        description="Update the version in a WoW addon's .toc file",
        input_schema=VersionBumpInput,
        output_schema=VersionBumpResult,
    )
    async def bump_version(input: VersionBumpInput, context: Any = None) -> CommandResult[VersionBumpResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or provide an explicit path"
            )
        
        # Find .toc file
        toc_files = list(addon_path.glob("*.toc"))
        if not toc_files:
            return error(
                code="NO_TOC",
                message="No .toc file found in addon folder",
                suggestion="Ensure the addon has a valid .toc file"
            )
        
        main_toc = None
        for toc in toc_files:
            if toc.stem == input.addon:
                main_toc = toc
                break
        if not main_toc:
            main_toc = toc_files[0]
        
        # Read and update
        content = main_toc.read_text(encoding='utf-8')
        old_version = None
        
        # Extract old version
        match = re.search(r'^## Version:\s*(.+)$', content, re.MULTILINE)
        if match:
            old_version = match.group(1).strip()
        
        # Replace version
        new_content = re.sub(
            r'^(## Version:)\s*.+$',
            f'\\1 {input.version}',
            content,
            flags=re.MULTILINE
        )
        
        if new_content == content and '## Version:' not in content:
            # Add version field if missing
            new_content = content + f"\n## Version: {input.version}\n"
        
        main_toc.write_text(new_content, encoding='utf-8')
        
        src = create_source(
            type="file",
            id=f"toc-{input.addon}",
            title=main_toc.name,
            location=str(main_toc)
        )
        
        return success(
            data=VersionBumpResult(
                addon=input.addon,
                old_version=old_version,
                new_version=input.version,
                toc_file=main_toc.name
            ),
            reasoning=f"Updated version from {old_version or 'none'} to {input.version}",
            sources=[src],
            confidence=1.0
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # changelog.add - Add entry to CHANGELOG.md
    # ═══════════════════════════════════════════════════════════════════════════
    
    class ChangelogAddInput(BaseModel):
        addon: str = Field(..., description="Name of the addon")
        version: str = Field(..., description="Version for the changelog entry")
        message: str = Field(..., description="Change description")
        category: str = Field("Changed", description="Category: Added, Changed, Fixed, Removed")
        path: Optional[str] = Field(None, description="Override path to addon folder")

    class ChangelogAddResult(BaseModel):
        addon: str
        version: str
        changelog_file: str
        entry_added: bool

    @server.command(
        name="changelog.add",
        description="Add an entry to the addon's CHANGELOG.md",
        input_schema=ChangelogAddInput,
        output_schema=ChangelogAddResult,
    )
    async def add_changelog(input: ChangelogAddInput, context: Any = None) -> CommandResult[ChangelogAddResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or provide an explicit path"
            )
        
        changelog_path = addon_path / "CHANGELOG.md"
        today = datetime.now().strftime("%Y-%m-%d")
        
        new_entry = f"\n## [{input.version}] - {today}\n\n### {input.category}\n- {input.message}\n"
        
        if changelog_path.exists():
            content = changelog_path.read_text(encoding='utf-8')
            # Insert after header
            if "# Changelog" in content:
                content = content.replace("# Changelog", f"# Changelog{new_entry}", 1)
            else:
                content = new_entry + content
        else:
            content = f"# Changelog\n\nAll notable changes to {input.addon} will be documented in this file.{new_entry}"
        
        changelog_path.write_text(content, encoding='utf-8')
        
        src = create_source(
            type="file",
            id=f"changelog-{input.addon}",
            title="CHANGELOG.md",
            location=str(changelog_path)
        )
        
        return success(
            data=ChangelogAddResult(
                addon=input.addon,
                version=input.version,
                changelog_file=str(changelog_path),
                entry_added=True
            ),
            reasoning=f"Added changelog entry for v{input.version}: {input.message[:50]}...",
            sources=[src],
            confidence=1.0
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # git.commit - Stage and commit changes
    # ═══════════════════════════════════════════════════════════════════════════
    
    class GitCommitInput(BaseModel):
        addon: str = Field(..., description="Name of the addon")
        message: str = Field(..., description="Commit message")
        path: Optional[str] = Field(None, description="Override path to addon folder")

    class GitCommitResult(BaseModel):
        addon: str
        commit_hash: Optional[str] = None
        message: str
        files_staged: int = 0

    @server.command(
        name="git.commit",
        description="Stage all changes and commit in the addon's git repository",
        input_schema=GitCommitInput,
        output_schema=GitCommitResult,
    )
    async def git_commit(input: GitCommitInput, context: Any = None) -> CommandResult[GitCommitResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or provide an explicit path"
            )
        
        try:
            # Stage all changes
            stage_result = subprocess.run(
                ["git", "add", "-A"],
                cwd=str(addon_path),
                capture_output=True,
                text=True,
                timeout=30
            )
            
            # Get staged file count
            status = subprocess.run(
                ["git", "diff", "--cached", "--name-only"],
                cwd=str(addon_path),
                capture_output=True,
                text=True,
                timeout=10
            )
            files_staged = len([f for f in status.stdout.splitlines() if f.strip()])
            
            # Commit
            commit_result = subprocess.run(
                ["git", "commit", "-m", input.message],
                cwd=str(addon_path),
                capture_output=True,
                text=True,
                timeout=30
            )
            
            # Get commit hash
            hash_result = subprocess.run(
                ["git", "rev-parse", "--short", "HEAD"],
                cwd=str(addon_path),
                capture_output=True,
                text=True,
                timeout=10
            )
            commit_hash = hash_result.stdout.strip() if hash_result.returncode == 0 else None
            
        except FileNotFoundError:
            return error(
                code="GIT_NOT_FOUND",
                message="Git is not installed or not in PATH",
                suggestion="Install Git and ensure it's in your PATH"
            )
        except subprocess.TimeoutExpired:
            return error(
                code="TIMEOUT",
                message="Git operation timed out",
                suggestion="Check for large files or network issues"
            )
        
        if commit_result.returncode != 0 and "nothing to commit" in commit_result.stdout.lower():
            return success(
                data=GitCommitResult(
                    addon=input.addon,
                    message=input.message,
                    files_staged=0
                ),
                reasoning="No changes to commit",
                confidence=1.0
            )
        
        src = create_source(
            type="git",
            id=f"commit-{commit_hash or 'unknown'}",
            title=f"Commit {commit_hash or 'unknown'}",
            location=str(addon_path)
        )
        
        return success(
            data=GitCommitResult(
                addon=input.addon,
                commit_hash=commit_hash,
                message=input.message,
                files_staged=files_staged
            ),
            reasoning=f"Committed {files_staged} files with hash {commit_hash}",
            sources=[src],
            confidence=1.0
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # git.tag - Create a version tag
    # ═══════════════════════════════════════════════════════════════════════════
    
    class GitTagInput(BaseModel):
        addon: str = Field(..., description="Name of the addon")
        version: str = Field(..., description="Version to tag (e.g., '1.2.0')")
        message: Optional[str] = Field(None, description="Tag message (defaults to version)")
        path: Optional[str] = Field(None, description="Override path to addon folder")

    class GitTagResult(BaseModel):
        addon: str
        tag: str
        created: bool

    @server.command(
        name="git.tag",
        description="Create a git tag for a version release",
        input_schema=GitTagInput,
        output_schema=GitTagResult,
    )
    async def git_tag(input: GitTagInput, context: Any = None) -> CommandResult[GitTagResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or provide an explicit path"
            )
        
        tag_name = f"v{input.version}" if not input.version.startswith('v') else input.version
        tag_message = input.message or f"Release {tag_name}"
        
        try:
            result = subprocess.run(
                ["git", "tag", "-a", tag_name, "-m", tag_message],
                cwd=str(addon_path),
                capture_output=True,
                text=True,
                timeout=30
            )
        except FileNotFoundError:
            return error(
                code="GIT_NOT_FOUND",
                message="Git is not installed or not in PATH",
                suggestion="Install Git and ensure it's in your PATH"
            )
        except subprocess.TimeoutExpired:
            return error(
                code="TIMEOUT",
                message="Git operation timed out",
                suggestion="Check for network issues"
            )
        
        if result.returncode != 0:
            if "already exists" in result.stderr.lower():
                return success(
                    data=GitTagResult(addon=input.addon, tag=tag_name, created=False),
                    reasoning=f"Tag {tag_name} already exists",
                    confidence=1.0
                )
            return error(
                code="GIT_ERROR",
                message=f"Failed to create tag: {result.stderr}",
                suggestion="Ensure you have committed your changes first"
            )
        
        src = create_source(
            type="git",
            id=f"tag-{tag_name}",
            title=f"Tag {tag_name}",
            location=str(addon_path)
        )
        
        return success(
            data=GitTagResult(addon=input.addon, tag=tag_name, created=True),
            reasoning=f"Created tag {tag_name}",
            sources=[src],
            confidence=1.0
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # release.all - Orchestrate full release flow
    # ═══════════════════════════════════════════════════════════════════════════
    
    class ReleaseAllInput(BaseModel):
        addon: str = Field(..., description="Name of the addon")
        version: str = Field(..., description="New version string")
        message: str = Field(..., description="Changelog entry and release description")
        category: str = Field("Changed", description="Changelog category")
        path: Optional[str] = Field(None, description="Override path")

    class ReleaseAllResult(BaseModel):
        addon: str
        version: str
        steps_completed: List[str]
        commit_hash: Optional[str]
    
    @server.command(
        name="release.all",
        description="Run full release: bump version, update changelog, commit, and tag",
        input_schema=ReleaseAllInput,
        output_schema=ReleaseAllResult,
    )
    async def release_all(input: ReleaseAllInput, context: Any = None) -> CommandResult[ReleaseAllResult]:
        steps = []
        
        # 1. Bump Version
        bump_res = await bump_version(VersionBumpInput(
            addon=input.addon,
            version=input.version,
            path=input.path
        ))
        if not bump_res.success:
            return error(code="BUMP_FAILED", message=f"Version bump failed: {bump_res.error.message}")
        steps.append(f"Bumped version to {input.version}")
        
        # 2. Update Changelog
        log_res = await add_changelog(ChangelogAddInput(
            addon=input.addon,
            version=input.version,
            message=input.message,
            category=input.category,
            path=input.path
        ))
        if not log_res.success:
            return error(code="CHANGELOG_FAILED", message=f"Changelog update failed: {log_res.error.message}")
        steps.append("Updated CHANGELOG.md")
        
        # 3. Git Commit
        commit_msg = f"chore(release): v{input.version}\n\n{input.message}"
        commit_res = await git_commit(GitCommitInput(
            addon=input.addon,
            message=commit_msg,
            path=input.path
        ))
        if not commit_res.success:
            return error(code="COMMIT_FAILED", message=f"Git commit failed: {commit_res.error.message}")
        steps.append(f"Committed changes ({commit_res.data.commit_hash or 'dry-run'})")
        
        # 4. Git Tag
        tag_res = await git_tag(GitTagInput(
            addon=input.addon,
            version=input.version,
            message=f"Release v{input.version}: {input.message}",
            path=input.path
        ))
        if not tag_res.success:
            return error(code="TAG_FAILED", message=f"Git tag failed: {tag_res.error.message}")
        steps.append(f"Created tag v{input.version}")
        
        return success(
            data=ReleaseAllResult(
                addon=input.addon,
                version=input.version,
                steps_completed=steps,
                commit_hash=commit_res.data.commit_hash
            ),
            reasoning=f"Successfully released v{input.version}",
            confidence=1.0
        )

"""
Release pipeline commands for WoW addon development.
Handles version bumping, changelog updates, and git operations.
"""

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pydantic import BaseModel, Field
from typing import Any, List, Optional
import asyncio
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
    async def bump_version(
        input: VersionBumpInput, context: Any = None
    ) -> CommandResult[VersionBumpResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or provide an explicit path",
            )

        # Find .toc file
        toc_files = list(addon_path.glob("*.toc"))
        if not toc_files:
            return error(
                code="NO_TOC",
                message="No .toc file found in addon folder",
                suggestion="Ensure the addon has a valid .toc file",
            )

        main_toc = None
        for toc in toc_files:
            if toc.stem == input.addon:
                main_toc = toc
                break
        if not main_toc:
            main_toc = toc_files[0]

        # Read and update
        content = main_toc.read_text(encoding="utf-8")
        old_version = None

        # Extract old version
        match = re.search(r"^## Version:\s*(.+)$", content, re.MULTILINE)
        if match:
            old_version = match.group(1).strip()

        # Replace version
        new_content = re.sub(
            r"^(## Version:)\s*.+$", f"\\1 {input.version}", content, flags=re.MULTILINE
        )

        if new_content == content and "## Version:" not in content:
            # Add version field if missing
            new_content = content + f"\n## Version: {input.version}\n"

        main_toc.write_text(new_content, encoding="utf-8")

        src = create_source(
            type="file",
            id=f"toc-{input.addon}",
            title=main_toc.name,
            location=str(main_toc),
        )

        return success(
            data=VersionBumpResult(
                addon=input.addon,
                old_version=old_version,
                new_version=input.version,
                toc_file=main_toc.name,
            ),
            reasoning=f"Updated version from {old_version or 'none'} to {input.version}",
            sources=[src],
            confidence=1.0,
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # changelog.add - Add entry to CHANGELOG.md
    # ═══════════════════════════════════════════════════════════════════════════

    class ChangelogAddInput(BaseModel):
        addon: str = Field(..., description="Name of the addon")
        version: str = Field(..., description="Version for the changelog entry")
        message: str = Field(..., description="Change description")
        category: str = Field(
            "Changed", description="Category: Added, Changed, Fixed, Removed"
        )
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
    async def add_changelog(
        input: ChangelogAddInput, context: Any = None
    ) -> CommandResult[ChangelogAddResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or provide an explicit path",
            )

        changelog_path = addon_path / "CHANGELOG.md"
        today = datetime.now().strftime("%Y-%m-%d")

        new_entry = f"\n## [{input.version}] - {today}\n\n### {input.category}\n- {input.message}\n"

        if changelog_path.exists():
            content = changelog_path.read_text(encoding="utf-8")
            # Insert after header
            if "# Changelog" in content:
                content = content.replace("# Changelog", f"# Changelog{new_entry}", 1)
            else:
                content = new_entry + content
        else:
            content = f"# Changelog\n\nAll notable changes to {input.addon} will be documented in this file.{new_entry}"

        changelog_path.write_text(content, encoding="utf-8")

        src = create_source(
            type="file",
            id=f"changelog-{input.addon}",
            title="CHANGELOG.md",
            location=str(changelog_path),
        )

        return success(
            data=ChangelogAddResult(
                addon=input.addon,
                version=input.version,
                changelog_file=str(changelog_path),
                entry_added=True,
            ),
            reasoning=f"Added changelog entry for v{input.version}: {input.message[:50]}...",
            sources=[src],
            confidence=1.0,
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
        description="Stage all addon changes and create a git commit",
        input_schema=GitCommitInput,
        output_schema=GitCommitResult,
    )
    async def git_commit(
        input: GitCommitInput, context: Any = None
    ) -> CommandResult[GitCommitResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or provide an explicit path",
            )

        try:
            # Stage all changes
            stage_result = await asyncio.to_thread(
                subprocess.run,
                ["git", "add", "-A", "--", "."],
                cwd=str(addon_path),
                capture_output=True,
                text=True,
                timeout=30,
            )
            if stage_result.returncode != 0:
                return error(
                    code="GIT_STAGE_FAILED",
                    message=stage_result.stderr.strip() or "Failed to stage changes",
                    suggestion="Resolve the git error and retry the commit",
                )

            # Get staged file count
            status = await asyncio.to_thread(
                subprocess.run,
                ["git", "diff", "--cached", "--name-only", "--", "."],
                cwd=str(addon_path),
                capture_output=True,
                text=True,
                timeout=10,
            )
            if status.returncode != 0:
                return error(
                    code="GIT_STATUS_FAILED",
                    message=status.stderr.strip() or "Failed to inspect staged changes",
                    suggestion="Verify the addon path is inside a git repository",
                )
            files_staged = len([f for f in status.stdout.splitlines() if f.strip()])

            # Commit
            commit_result = await asyncio.to_thread(
                subprocess.run,
                ["git", "commit", "-m", input.message],
                cwd=str(addon_path),
                capture_output=True,
                text=True,
                timeout=30,
            )

            # Get commit hash
            hash_result = await asyncio.to_thread(
                subprocess.run,
                ["git", "rev-parse", "--short", "HEAD"],
                cwd=str(addon_path),
                capture_output=True,
                text=True,
                timeout=10,
            )
            commit_hash = (
                hash_result.stdout.strip() if hash_result.returncode == 0 else None
            )

        except FileNotFoundError:
            return error(
                code="GIT_NOT_FOUND",
                message="Git is not installed or not in PATH",
                suggestion="Install Git and ensure it's in your PATH",
            )
        except subprocess.TimeoutExpired:
            return error(
                code="TIMEOUT",
                message="Git operation timed out",
                suggestion="Check for large files or network issues",
            )

        commit_output = (commit_result.stdout + commit_result.stderr).lower()
        if commit_result.returncode != 0 and "nothing to commit" in commit_output:
            return success(
                data=GitCommitResult(
                    addon=input.addon, message=input.message, files_staged=0
                ),
                reasoning="No changes to commit",
                confidence=1.0,
            )
        if commit_result.returncode != 0:
            return error(
                code="GIT_COMMIT_FAILED",
                message=commit_result.stderr.strip()
                or commit_result.stdout.strip()
                or "Git commit failed",
                suggestion="Resolve the git error and retry the commit",
            )

        src = create_source(
            type="git",
            id=f"commit-{commit_hash or 'unknown'}",
            title=f"Commit {commit_hash or 'unknown'}",
            location=str(addon_path),
        )

        return success(
            data=GitCommitResult(
                addon=input.addon,
                commit_hash=commit_hash,
                message=input.message,
                files_staged=files_staged,
            ),
            reasoning=f"Committed {files_staged} files with hash {commit_hash}",
            sources=[src],
            confidence=1.0,
        )

    # ═══════════════════════════════════════════════════════════════════════════
    # git.tag - Create a version tag
    # ═══════════════════════════════════════════════════════════════════════════

    class GitTagInput(BaseModel):
        addon: str = Field(..., description="Name of the addon")
        version: str = Field(..., description="Version to tag (e.g., '1.2.0')")
        message: Optional[str] = Field(
            None, description="Tag message (defaults to version)"
        )
        path: Optional[str] = Field(None, description="Override path to addon folder")

    class GitTagResult(BaseModel):
        addon: str
        tag: str
        created: bool

    @server.command(
        name="git.tag",
        description="Create an annotated git tag for an addon release",
        input_schema=GitTagInput,
        output_schema=GitTagResult,
    )
    async def git_tag(
        input: GitTagInput, context: Any = None
    ) -> CommandResult[GitTagResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or provide an explicit path",
            )

        tag_name = (
            f"v{input.version}" if not input.version.startswith("v") else input.version
        )
        tag_message = input.message or f"Release {tag_name}"

        try:
            result = await asyncio.to_thread(
                subprocess.run,
                ["git", "tag", "-a", tag_name, "-m", tag_message],
                cwd=str(addon_path),
                capture_output=True,
                text=True,
                timeout=30,
            )
        except FileNotFoundError:
            return error(
                code="GIT_NOT_FOUND",
                message="Git is not installed or not in PATH",
                suggestion="Install Git and ensure it's in your PATH",
            )
        except subprocess.TimeoutExpired:
            return error(
                code="TIMEOUT",
                message="Git operation timed out",
                suggestion="Check for network issues",
            )

        if result.returncode != 0:
            if "already exists" in result.stderr.lower():
                try:
                    existing = await asyncio.to_thread(
                        subprocess.run,
                        [
                            "git",
                            "rev-parse",
                            "--verify",
                            f"refs/tags/{tag_name}^{{commit}}",
                        ],
                        cwd=str(addon_path),
                        capture_output=True,
                        text=True,
                        timeout=10,
                    )
                    intended = await asyncio.to_thread(
                        subprocess.run,
                        ["git", "rev-parse", "--verify", "HEAD^{commit}"],
                        cwd=str(addon_path),
                        capture_output=True,
                        text=True,
                        timeout=10,
                    )
                except (OSError, subprocess.TimeoutExpired) as exc:
                    return error(
                        code="TAG_CHECK_FAILED",
                        message=str(exc),
                        suggestion="Inspect the existing tag and HEAD before retrying",
                    )
                if (
                    existing.returncode == 0
                    and intended.returncode == 0
                    and existing.stdout.strip() == intended.stdout.strip()
                ):
                    return success(
                        data=GitTagResult(
                            addon=input.addon, tag=tag_name, created=False
                        ),
                        reasoning=f"Tag {tag_name} already points to the intended commit",
                        confidence=1.0,
                    )
                return error(
                    code="TAG_CONFLICT",
                    message=f"Tag {tag_name} does not point to HEAD",
                    suggestion="Choose a new version or inspect the existing tag; it was not changed",
                    details={
                        "tag": tag_name,
                        "existing_commit": existing.stdout.strip(),
                        "intended_commit": intended.stdout.strip(),
                    },
                )
            return error(
                code="GIT_ERROR",
                message=f"Failed to create tag: {result.stderr}",
                suggestion="Ensure you have committed your changes first",
            )

        src = create_source(
            type="git",
            id=f"tag-{tag_name}",
            title=f"Tag {tag_name}",
            location=str(addon_path),
        )

        return success(
            data=GitTagResult(addon=input.addon, tag=tag_name, created=True),
            reasoning=f"Created tag {tag_name}",
            sources=[src],
            confidence=1.0,
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
        dry_run: bool = Field(
            False,
            description="Validate and preview without changing files, index, commits or tags",
        )

    class ReleaseStep(BaseModel):
        command: str
        target: str
        description: str

    class ReleaseAllResult(BaseModel):
        addon: str
        version: str
        dry_run: bool = False
        steps_planned: List[ReleaseStep] = Field(default_factory=list)
        steps_completed: List[str] = Field(default_factory=list)
        commit_hash: Optional[str] = None
        failed_step: Optional[str] = None
        recovery: List[str] = Field(default_factory=list)

    @server.command(
        name="release.all",
        description="Preflight and run version bump, changelog, commit and tag; supports dry_run",
        input_schema=ReleaseAllInput,
        output_schema=ReleaseAllResult,
    )
    async def release_all(
        input: ReleaseAllInput, context: Any = None
    ) -> CommandResult[ReleaseAllResult]:
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return error(
                code="ADDON_NOT_FOUND",
                message=f"Addon '{input.addon}' not found",
                suggestion="Check the addon name or provide an explicit path",
            )
        tocs = sorted(addon_path.glob("*.toc"))
        if not tocs:
            return error(
                code="NO_TOC",
                message="No .toc file found",
                suggestion="Provide the addon folder containing its TOC",
            )
        tag = input.version if input.version.startswith("v") else f"v{input.version}"

        async def git(*args):
            return await asyncio.to_thread(
                subprocess.run,
                ["git", *args],
                cwd=str(addon_path),
                capture_output=True,
                text=True,
                timeout=30,
            )

        try:
            valid_tag = await git("check-ref-format", f"refs/tags/{tag}")
            head = await git("rev-parse", "--verify", "HEAD^{commit}")
            existing = await git("show-ref", "--verify", "--quiet", f"refs/tags/{tag}")
            staged = await git("diff", "--cached", "--name-only")
            if valid_tag.returncode or head.returncode or staged.returncode:
                return error(
                    code="PREFLIGHT_FAILED",
                    message="Invalid release tag or Git repository without a readable HEAD/index",
                    suggestion="Use a valid version and a repository with an initial commit",
                )
            if existing.returncode not in (0, 1):
                return error(
                    code="PREFLIGHT_FAILED",
                    message="Unable to inspect existing release tags",
                    suggestion="Resolve the Git reference error before releasing",
                )
            if existing.returncode == 0:
                return error(
                    code="TAG_CONFLICT",
                    message=f"Release tag {tag} already exists",
                    suggestion="Choose a new version; release.all creates a new release commit and never moves existing tags",
                )
            if staged.stdout.strip():
                return error(
                    code="STAGED_CHANGES",
                    message="The repository already contains staged changes",
                    suggestion="Commit or unstage existing changes before release.all so its commit scope is clear",
                )
        except (OSError, subprocess.TimeoutExpired) as exc:
            return error(
                code="PREFLIGHT_FAILED",
                message=f"Git preflight failed: {exc}",
                suggestion="Check Git availability and repository access",
            )
        toc = next((item for item in tocs if item.stem == input.addon), tocs[0])
        data = ReleaseAllResult(
            addon=input.addon,
            version=input.version,
            dry_run=input.dry_run,
            steps_planned=[
                ReleaseStep(
                    command="version.bump",
                    target=str(toc),
                    description=f"Set version to {input.version}",
                ),
                ReleaseStep(
                    command="changelog.add",
                    target=str(addon_path / "CHANGELOG.md"),
                    description=input.message,
                ),
                ReleaseStep(
                    command="git.commit",
                    target=str(addon_path),
                    description="Stage all addon changes and create release commit",
                ),
                ReleaseStep(
                    command="git.tag",
                    target=tag,
                    description="Tag the new release commit",
                ),
            ],
        )
        if input.dry_run:
            return success(
                data,
                reasoning="Release preflight passed; no files, index, commits or tags changed",
            )
        common = {"addon": input.addon, "path": input.path}
        calls = [
            ("version.bump", {**common, "version": input.version}),
            (
                "changelog.add",
                {
                    **common,
                    "version": input.version,
                    "message": input.message,
                    "category": input.category,
                },
            ),
            (
                "git.commit",
                {**common, "message": f"chore(release): {tag}\n\n{input.message}"},
            ),
            (
                "git.tag",
                {
                    **common,
                    "version": input.version,
                    "message": f"Release {tag}: {input.message}",
                },
            ),
        ]
        for command, params in calls:
            result = await server.execute(command, params, context=context)
            if not result.success:
                data.failed_step = command
                data.recovery = [
                    "Inspect git status and git diff (including --cached) before changing or retrying the release.",
                    f"Resolve the {command} error, then resume that command and the remaining steps individually.",
                    "Completed steps were not rolled back; rerunning release.all may duplicate the changelog entry.",
                ]
                failure = error(
                    code="RELEASE_PARTIAL_FAILURE",
                    message=f"Release stopped at {command}: {result.error.message}",
                    suggestion=data.recovery[0],
                    details={
                        "failed_step": command,
                        "steps_completed": data.steps_completed,
                        "recovery": data.recovery,
                        "cause": result.error.model_dump(),
                    },
                )
                failure.data = data
                return failure
            data.steps_completed.append(command)
            if command == "git.commit":
                data.commit_hash = result.data.commit_hash
        return success(data, reasoning=f"Successfully released {tag}", confidence=1.0)

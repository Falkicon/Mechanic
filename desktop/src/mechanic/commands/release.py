"""
Release pipeline commands for WoW addon development.
Handles version bumping, changelog updates, and git operations.
"""

import asyncio
import re
import subprocess
from datetime import datetime
from pathlib import Path
from typing import Any, List, Optional

from afd import CommandResult, error, success
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

from ..config import find_addon_path
from ._common import (
    addon_not_found,
    is_valid_version,
    read_text_eol,
    write_text_eol,
)

CHANGELOG_CATEGORIES = (
    "Added",
    "Changed",
    "Deprecated",
    "Removed",
    "Fixed",
    "Security",
)


# ═══════════════════════════════════════════════════════════════════════════════
# HELPERS
# ═══════════════════════════════════════════════════════════════════════════════


async def _git(cwd: Path, *args: str, timeout: int = 30):
    """Run git in ``cwd`` off the event loop (no shell; output decoded as UTF-8)."""
    return await asyncio.to_thread(
        subprocess.run,
        ["git", *args],
        cwd=str(cwd),
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="replace",
        timeout=timeout,
    )


def _git_missing():
    return error(
        code="GIT_NOT_FOUND",
        message="Git is not installed or not in PATH",
        suggestion="Install Git and ensure it's in your PATH",
    )


def _git_timeout(suggestion: str = "Check for large files or network issues"):
    return error(
        code="TIMEOUT", message="Git operation timed out", suggestion=suggestion
    )


def _invalid_version_error(version: str):
    return error(
        code="INVALID_VERSION",
        message=f"Invalid version {version!r}",
        suggestion="Use letters, digits, '.', '_', '+' or '-' only, e.g. 1.2.0",
    )


def normalize_category(category: str) -> Optional[str]:
    for known in CHANGELOG_CATEGORIES:
        if category.strip().lower() == known.lower():
            return known
    return None


def _invalid_category_error(category: str):
    return error(
        code="INVALID_CATEGORY",
        message=f"Unknown changelog category {category!r}",
        suggestion=f"Use one of: {', '.join(CHANGELOG_CATEGORIES)}",
    )


def pick_toc(addon_path: Path, addon: str) -> Optional[Path]:
    tocs = sorted(addon_path.glob("*.toc"))
    return next((t for t in tocs if t.stem == addon), tocs[0] if tocs else None)


def apply_version(content: str, version: str) -> str:
    """Set ``## Version:`` in TOC text (LF newlines), appending it when missing."""
    new_content, count = re.subn(
        r"^(##[ \t]*Version:)[ \t]*.*$",
        lambda m: f"{m.group(1)} {version}",
        content,
        count=1,
        flags=re.MULTILINE,
    )
    if count:
        return new_content
    sep = "" if content.endswith("\n") or not content else "\n"
    return f"{content}{sep}## Version: {version}\n"


def format_changelog_entry(
    version: str, category: str, message: str, today: str
) -> str:
    bullet = "\n  ".join(line.strip() for line in message.strip().splitlines())
    return f"## [{version}] - {today}\n\n### {category}\n- {bullet}\n"


def insert_changelog_entry(content: str, entry: str, addon: str) -> str:
    """Put ``entry`` above the newest release heading, keeping any intro text."""
    if not content.strip():
        return (
            f"# Changelog\n\nAll notable changes to {addon} will be documented in this file.\n\n"
            + entry
        )
    heading = re.search(r"^## \[", content, re.MULTILINE)
    if heading:
        return content[: heading.start()] + entry + "\n" + content[heading.start() :]
    if not re.match(r"\s*#[ \t]+\S", content):
        content = "# Changelog\n\n" + content
    return content.rstrip("\n") + "\n\n" + entry


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
        if not is_valid_version(input.version):
            return _invalid_version_error(input.version)

        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return addon_not_found(input.addon)

        main_toc = pick_toc(addon_path, input.addon)
        if not main_toc:
            return error(
                code="NO_TOC",
                message="No .toc file found in addon folder",
                suggestion="Ensure the addon has a valid .toc file",
            )

        content, eol = await asyncio.to_thread(read_text_eol, main_toc)
        match = re.search(r"^##[ \t]*Version:[ \t]*(.*)$", content, re.MULTILINE)
        old_version = match.group(1).strip() if match else None

        await asyncio.to_thread(
            write_text_eol, main_toc, apply_version(content, input.version), eol
        )

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
            "Changed",
            description="Category: Added, Changed, Deprecated, Removed, Fixed, Security",
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
        if not is_valid_version(input.version):
            return _invalid_version_error(input.version)
        category = normalize_category(input.category)
        if category is None:
            return _invalid_category_error(input.category)
        if not input.message.strip():
            return error(
                code="EMPTY_MESSAGE",
                message="The changelog message is empty",
                suggestion="Describe the change in one or two sentences",
            )

        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return addon_not_found(input.addon)

        changelog_path = addon_path / "CHANGELOG.md"
        entry = format_changelog_entry(
            input.version, category, input.message, datetime.now().strftime("%Y-%m-%d")
        )

        if changelog_path.exists():
            content, eol = await asyncio.to_thread(read_text_eol, changelog_path)
        else:
            content, eol = "", "\n"
        updated = insert_changelog_entry(content, entry, input.addon)
        await asyncio.to_thread(write_text_eol, changelog_path, updated, eol)

        src = create_source(
            type="file",
            id=f"changelog-{input.addon}",
            title="CHANGELOG.md",
            location=str(changelog_path),
        )

        preview = input.message.strip().splitlines()[0]
        return success(
            data=ChangelogAddResult(
                addon=input.addon,
                version=input.version,
                changelog_file=str(changelog_path),
                entry_added=True,
            ),
            reasoning=f"Added changelog entry for v{input.version}: {preview[:50]}"
            + ("..." if len(preview) > 50 else ""),
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
        description="Stage all addon changes and create a git commit limited to the addon folder",
        input_schema=GitCommitInput,
        output_schema=GitCommitResult,
    )
    async def git_commit(
        input: GitCommitInput, context: Any = None
    ) -> CommandResult[GitCommitResult]:
        if not input.message.strip():
            return error(
                code="EMPTY_MESSAGE",
                message="The commit message is empty",
                suggestion="Provide a commit message",
            )
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return addon_not_found(input.addon)

        try:
            stage = await _git(addon_path, "add", "-A", "--", ".")
            if stage.returncode != 0:
                return error(
                    code="GIT_STAGE_FAILED",
                    message=stage.stderr.strip() or "Failed to stage changes",
                    suggestion="Resolve the git error and retry the commit",
                )

            staged = await _git(
                addon_path, "diff", "--cached", "--name-only", "--", ".", timeout=10
            )
            if staged.returncode != 0:
                return error(
                    code="GIT_STATUS_FAILED",
                    message=staged.stderr.strip() or "Failed to inspect staged changes",
                    suggestion="Verify the addon path is inside a git repository",
                )
            files_staged = len([f for f in staged.stdout.splitlines() if f.strip()])

            # Nothing staged in the addon folder: never commit what else is staged
            if files_staged == 0:
                return success(
                    data=GitCommitResult(
                        addon=input.addon, message=input.message, files_staged=0
                    ),
                    reasoning="No changes to commit in the addon folder",
                    confidence=1.0,
                )

            # The pathspec keeps files staged elsewhere in the repository out of the commit
            commit = await _git(addon_path, "commit", "-m", input.message, "--", ".")
            if commit.returncode != 0:
                return error(
                    code="GIT_COMMIT_FAILED",
                    message=commit.stderr.strip()
                    or commit.stdout.strip()
                    or "Git commit failed",
                    suggestion="Resolve the git error and retry the commit",
                )
            head = await _git(addon_path, "rev-parse", "--short", "HEAD", timeout=10)
            commit_hash = head.stdout.strip() if head.returncode == 0 else None
        except FileNotFoundError:
            return _git_missing()
        except subprocess.TimeoutExpired:
            return _git_timeout()

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
        if not is_valid_version(input.version):
            return _invalid_version_error(input.version)
        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return addon_not_found(input.addon)

        tag_name = (
            f"v{input.version}" if not input.version.startswith("v") else input.version
        )
        tag_message = input.message or f"Release {tag_name}"

        try:
            result = await _git(addon_path, "tag", "-a", tag_name, "-m", tag_message)
            if result.returncode != 0 and "already exists" in result.stderr.lower():
                try:
                    existing = await _git(
                        addon_path,
                        "rev-parse",
                        "--verify",
                        f"refs/tags/{tag_name}^{{commit}}",
                        timeout=10,
                    )
                    intended = await _git(
                        addon_path, "rev-parse", "--verify", "HEAD^{commit}", timeout=10
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
        except FileNotFoundError:
            return _git_missing()
        except subprocess.TimeoutExpired:
            return _git_timeout("Check for network issues")

        if result.returncode != 0:
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

    async def preflight_release(addon_path: Path, tag: str):
        """Return an error result when the repository cannot take this release."""
        try:
            valid_tag = await _git(addon_path, "check-ref-format", f"refs/tags/{tag}")
            head = await _git(addon_path, "rev-parse", "--verify", "HEAD^{commit}")
            existing = await _git(
                addon_path, "show-ref", "--verify", "--quiet", f"refs/tags/{tag}"
            )
            staged = await _git(addon_path, "diff", "--cached", "--name-only")
        except (OSError, subprocess.TimeoutExpired) as exc:
            return error(
                code="PREFLIGHT_FAILED",
                message=f"Git preflight failed: {exc}",
                suggestion="Check Git availability and repository access",
            )
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
        return None

    @server.command(
        name="release.all",
        description="Preflight and run version bump, changelog, commit and tag; supports dry_run",
        input_schema=ReleaseAllInput,
        output_schema=ReleaseAllResult,
    )
    async def release_all(
        input: ReleaseAllInput, context: Any = None
    ) -> CommandResult[ReleaseAllResult]:
        if not is_valid_version(input.version):
            return _invalid_version_error(input.version)
        category = normalize_category(input.category)
        if category is None:
            return _invalid_category_error(input.category)

        addon_path = find_addon_path(input.addon, input.path)
        if not addon_path:
            return addon_not_found(input.addon)
        toc = pick_toc(addon_path, input.addon)
        if not toc:
            return error(
                code="NO_TOC",
                message="No .toc file found",
                suggestion="Provide the addon folder containing its TOC",
            )
        tag = input.version if input.version.startswith("v") else f"v{input.version}"

        failure = await preflight_release(addon_path, tag)
        if failure is not None:
            return failure

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
                    "category": category,
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
            failed_message = result.error.message if not result.success else None
            # A release commit that recorded nothing would tag an unrelated commit
            if (
                result.success
                and command == "git.commit"
                and not result.data.commit_hash
            ):
                failed_message = "nothing was committed for the release"
            if failed_message is not None:
                data.failed_step = command
                data.recovery = [
                    "Inspect git status and git diff (including --cached) before changing or retrying the release.",
                    f"Resolve the {command} error, then resume that command and the remaining steps individually.",
                    "Completed steps were not rolled back; rerunning release.all may duplicate the changelog entry.",
                ]
                failure = error(
                    code="RELEASE_PARTIAL_FAILURE",
                    message=f"Release stopped at {command}: {failed_message}",
                    suggestion=data.recovery[0],
                    details={
                        "failed_step": command,
                        "steps_completed": data.steps_completed,
                        "recovery": data.recovery,
                        "cause": result.error.model_dump() if result.error else None,
                    },
                )
                failure.data = data
                return failure
            data.steps_completed.append(command)
            if command == "git.commit":
                data.commit_hash = result.data.commit_hash
        return success(data, reasoning=f"Successfully released {tag}", confidence=1.0)

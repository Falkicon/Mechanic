"""version.bump, changelog.add, git.commit and release.all regression tests."""

import subprocess

import pytest

from mechanic.commands import release
from mechanic.commands.core import get_server


def git(path, *args):
    return subprocess.run(
        ["git", *args], cwd=path, capture_output=True, text=True, check=True
    ).stdout.strip()


@pytest.fixture
def repo(tmp_path):
    git(tmp_path, "init")
    git(tmp_path, "config", "user.email", "test@example.invalid")
    git(tmp_path, "config", "user.name", "Test")
    git(tmp_path, "config", "core.autocrlf", "false")
    addon = tmp_path / "Demo"
    addon.mkdir()
    (addon / "Demo.toc").write_bytes(
        b"## Title: Demo\r\n## Version: 1.0\r\nCore.lua\r\n"
    )
    (addon / "Core.lua").write_text("print(1)\n", encoding="utf-8")
    (addon / "CHANGELOG.md").write_text(
        "# Changelog\n\nAll notable changes are documented here.\n\n"
        "## [1.0] - 2026-01-01\n\n### Added\n- first\n",
        encoding="utf-8",
    )
    (tmp_path / "outside.txt").write_text("x", encoding="utf-8")
    git(tmp_path, "add", ".")
    git(tmp_path, "commit", "-m", "initial")
    return tmp_path


async def call(command, repo, **params):
    return await get_server().execute(
        command, {"addon": "Demo", "path": str(repo / "Demo"), **params}
    )


# ── version.bump ─────────────────────────────────────────────────────────────


@pytest.mark.asyncio
async def test_version_bump_preserves_crlf_and_other_lines(repo):
    result = await call("version.bump", repo, version="1.1.0")

    assert result.success, result.error
    assert result.data.old_version == "1.0" and result.data.new_version == "1.1.0"
    assert (repo / "Demo" / "Demo.toc").read_bytes() == (
        b"## Title: Demo\r\n## Version: 1.1.0\r\nCore.lua\r\n"
    )


@pytest.mark.asyncio
async def test_version_bump_appends_missing_version_field(repo):
    toc = repo / "Demo" / "Demo.toc"
    toc.write_bytes(b"## Title: Demo\nCore.lua")

    result = await call("version.bump", repo, version="2.0")

    assert result.success and result.data.old_version is None
    assert toc.read_bytes() == b"## Title: Demo\nCore.lua\n## Version: 2.0\n"


@pytest.mark.parametrize(
    "version",
    ["", "1.0\n## Interface: 1", "1.0 beta", "\\1", "a\\g<0>", "-x", "x" * 80],
)
@pytest.mark.asyncio
async def test_version_bump_rejects_unsafe_versions(repo, version):
    before = (repo / "Demo" / "Demo.toc").read_bytes()

    result = await call("version.bump", repo, version=version)

    assert not result.success and result.error.code == "INVALID_VERSION"
    assert result.error.suggestion
    assert (repo / "Demo" / "Demo.toc").read_bytes() == before


def test_apply_version_uses_literal_replacement():
    assert release.apply_version("## Version: 1\n", "1.0+build.5") == (
        "## Version: 1.0+build.5\n"
    )


# ── changelog.add ────────────────────────────────────────────────────────────


@pytest.mark.asyncio
async def test_changelog_entry_goes_above_newest_release_and_keeps_intro(repo):
    result = await call(
        "changelog.add",
        repo,
        version="1.1",
        message="Fixed a bug\nsecond line",
        category="fixed",
    )

    assert result.success, result.error
    text = (repo / "Demo" / "CHANGELOG.md").read_text(encoding="utf-8")
    assert text.startswith(
        "# Changelog\n\nAll notable changes are documented here.\n\n## [1.1] - "
    )
    assert "### Fixed\n- Fixed a bug\n  second line\n\n## [1.0] - 2026-01-01" in text
    assert text.count("All notable changes") == 1


@pytest.mark.asyncio
async def test_changelog_created_when_missing(repo):
    (repo / "Demo" / "CHANGELOG.md").unlink()

    result = await call(
        "changelog.add", repo, version="1.1", message="Added stuff", category="Added"
    )

    assert result.success
    text = (repo / "Demo" / "CHANGELOG.md").read_text(encoding="utf-8")
    assert text.startswith("# Changelog\n\nAll notable changes to Demo")
    assert "## [1.1] - " in text and "- Added stuff" in text


def test_insert_changelog_without_release_headings_appends_after_intro():
    entry = release.format_changelog_entry("2.0", "Changed", "x", "2026-02-02")

    text = release.insert_changelog_entry("# Changelog\n\nIntro text\n", entry, "A")

    assert (
        text
        == "# Changelog\n\nIntro text\n\n## [2.0] - 2026-02-02\n\n### Changed\n- x\n"
    )
    assert release.insert_changelog_entry("no header yet\n", entry, "A").startswith(
        "# Changelog\n\nno header yet"
    )


@pytest.mark.asyncio
async def test_changelog_rejects_bad_category_and_empty_message(repo):
    bad = await call(
        "changelog.add", repo, version="1.1", message="m", category="## Oops"
    )
    empty = await call("changelog.add", repo, version="1.1", message="  ")

    assert bad.error.code == "INVALID_CATEGORY" and bad.error.suggestion
    assert empty.error.code == "EMPTY_MESSAGE"


# ── git.commit ───────────────────────────────────────────────────────────────


@pytest.mark.asyncio
async def test_commit_is_limited_to_the_addon_folder(repo):
    (repo / "Demo" / "Core.lua").write_text("print(2)\n", encoding="utf-8")
    (repo / "outside.txt").write_text("staged elsewhere", encoding="utf-8")
    git(repo, "add", "outside.txt")

    result = await call("git.commit", repo, message="change core")

    assert result.success, result.error
    assert result.data.files_staged == 1 and result.data.commit_hash
    assert git(repo, "show", "--name-only", "--format=", "HEAD") == "Demo/Core.lua"
    assert git(repo, "diff", "--cached", "--name-only") == "outside.txt"


@pytest.mark.asyncio
async def test_commit_with_nothing_in_addon_does_not_commit_other_staged_files(repo):
    (repo / "outside.txt").write_text("staged elsewhere", encoding="utf-8")
    git(repo, "add", "outside.txt")
    head = git(repo, "rev-parse", "HEAD")

    result = await call("git.commit", repo, message="nothing here")

    assert result.success and result.data.files_staged == 0
    assert result.data.commit_hash is None
    assert git(repo, "rev-parse", "HEAD") == head
    assert git(repo, "diff", "--cached", "--name-only") == "outside.txt"


@pytest.mark.asyncio
async def test_commit_nothing_to_commit_is_language_independent(repo, monkeypatch):
    monkeypatch.setenv("LANG", "de_DE.UTF-8")
    monkeypatch.setenv("LC_ALL", "de_DE.UTF-8")

    result = await call("git.commit", repo, message="noop")

    assert result.success and result.data.files_staged == 0


@pytest.mark.asyncio
async def test_commit_rejects_empty_message(repo):
    result = await call("git.commit", repo, message="   ")

    assert result.error.code == "EMPTY_MESSAGE"


@pytest.mark.asyncio
async def test_commit_reports_git_failure_with_suggestion(repo):
    hook = repo / ".git" / "hooks" / "pre-commit"
    hook.write_bytes(b"#!/bin/sh\necho 'rejected by hook' >&2\nexit 1\n")
    # POSIX git only runs executable hooks; Windows git ignores the bit.
    hook.chmod(0o755)
    (repo / "Demo" / "Core.lua").write_text("print(3)\n", encoding="utf-8")

    result = await call("git.commit", repo, message="blocked")

    assert not result.success
    assert result.error.code == "GIT_COMMIT_FAILED" and result.error.suggestion
    assert "rejected by hook" in result.error.message


# ── release.all ──────────────────────────────────────────────────────────────


@pytest.mark.asyncio
async def test_release_all_end_to_end(repo):
    result = await call(
        "release.all", repo, version="1.1.0", message="Ship it", category="Added"
    )

    assert result.success, result.error
    assert result.data.steps_completed == [
        "version.bump",
        "changelog.add",
        "git.commit",
        "git.tag",
    ]
    assert git(repo, "tag", "--list") == "v1.1.0"
    assert git(repo, "rev-list", "-n1", "v1.1.0") == git(repo, "rev-parse", "HEAD")
    assert b"## Version: 1.1.0\r\n" in (repo / "Demo" / "Demo.toc").read_bytes()
    assert git(repo, "status", "--porcelain") == ""


@pytest.mark.asyncio
async def test_release_all_validates_before_touching_anything(repo):
    before = git(repo, "rev-parse", "HEAD")

    bad_version = await call("release.all", repo, version="1 0", message="m")
    bad_category = await call(
        "release.all", repo, version="1.1", message="m", category="Nope"
    )

    assert bad_version.error.code == "INVALID_VERSION"
    assert bad_category.error.code == "INVALID_CATEGORY"
    assert git(repo, "rev-parse", "HEAD") == before
    assert git(repo, "status", "--porcelain") == ""


@pytest.mark.asyncio
async def test_release_all_refuses_when_other_changes_are_staged(repo):
    (repo / "outside.txt").write_text("staged", encoding="utf-8")
    git(repo, "add", "outside.txt")

    result = await call("release.all", repo, version="1.1", message="m")

    assert result.error.code == "STAGED_CHANGES"
    assert b"1.0" in (repo / "Demo" / "Demo.toc").read_bytes()


@pytest.mark.asyncio
async def test_tag_rejects_unsafe_version(repo):
    result = await call("git.tag", repo, version="--force")

    assert result.error.code == "INVALID_VERSION"
    assert git(repo, "tag", "--list") == ""

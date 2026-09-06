"""Mutation previews, catalog parity and failure recovery using isolated fixtures."""

import json
import subprocess
from types import SimpleNamespace

import pytest
from afd import error, success
from afd.server import create_server
from afd.server.decorators import get_command_metadata
from pydantic import BaseModel, ValidationError
from mechanic.commands import catalog, environment
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
    (tmp_path / "Demo.toc").write_text("## Version: 1.0\n", encoding="utf-8")
    git(tmp_path, "add", ".")
    git(tmp_path, "commit", "-m", "initial")
    return tmp_path


def snapshot(path):
    return {
        str(p.relative_to(path)): p.read_bytes() for p in path.rglob("*") if p.is_file()
    }


@pytest.mark.asyncio
async def test_catalog_schema_and_mutation_parity():
    server = get_server()
    result = await server.execute("commands.list", {})
    assert result.success
    entries = {c.name: c for c in result.data.commands}
    assert set(entries) == {c.name for c in server.list_commands()}
    for cmd in server.list_commands():
        assert (
            entries[cmd.name].mutation
            == cmd.mutation
            == get_command_metadata(cmd.handler).mutation
        )
    assert entries["libs.sync"].mutation
    assert not entries["commands.list"].mutation
    assert (
        entries["release.all"].input_schema["properties"]["dry_run"]["type"]
        == "boolean"
    )
    assert "$defs" in entries["commands.list"].output_schema
    assert entries["api.queue"].input_schema["properties"]["apis"]["type"] == "array"


def test_audit_rejects_unreviewed_command():
    server = create_server("audit")

    @server.command(name="unknown.command", description="Unaudited")
    async def unknown(input):
        return success({})

    with pytest.raises(ValueError, match="Missing mutation audit"):
        catalog.apply_mutation_audit(server)


@pytest.mark.asyncio
async def test_release_preview_preserves_files_index_refs(repo):
    before = snapshot(repo)
    result = await get_server().execute(
        "release.all",
        {
            "addon": "Demo",
            "path": str(repo),
            "version": "2.0",
            "message": "Change",
            "dry_run": True,
        },
    )
    assert result.success, result.error
    assert len(result.data.steps_planned) == 4
    assert result.data.steps_completed == []
    assert snapshot(repo) == before


@pytest.mark.asyncio
async def test_release_preflight_tag_conflict_preserves_files(repo):
    git(repo, "tag", "v2.0")
    before = snapshot(repo)
    result = await get_server().execute(
        "release.all",
        {"addon": "Demo", "path": str(repo), "version": "2.0", "message": "Change"},
    )
    assert not result.success and result.error.code == "TAG_CONFLICT"
    assert snapshot(repo) == before


@pytest.mark.asyncio
async def test_tag_existing_commit_must_match(repo):
    server = get_server()
    params = {"addon": "Demo", "path": str(repo), "version": "2.0"}
    first = await server.execute("git.tag", params)
    assert first.success and first.data.created
    repeated = await server.execute("git.tag", params)
    assert repeated.success and not repeated.data.created
    (repo / "changed").write_text("change")
    git(repo, "add", ".")
    git(repo, "commit", "-m", "next")
    conflict = await server.execute("git.tag", params)
    assert not conflict.success and conflict.error.code == "TAG_CONFLICT"
    assert git(repo, "rev-parse", "v2.0^{commit}") != git(repo, "rev-parse", "HEAD")


@pytest.mark.asyncio
async def test_release_partial_failure_reports_completed_steps(repo, monkeypatch):
    server = get_server()
    original = server.execute

    async def execute(name, params, context=None):
        if name == "changelog.add":
            return error(
                "WRITE_FAILED", "Injected write failure", suggestion="Check access"
            )
        return await original(name, params, context)

    monkeypatch.setattr(server, "execute", execute)
    result = await server.execute(
        "release.all",
        {"addon": "Demo", "path": str(repo), "version": "2.0", "message": "Change"},
    )
    assert not result.success
    assert result.data.steps_completed == ["version.bump"]
    assert result.data.failed_step == "changelog.add"
    assert result.data.recovery
    assert result.error.details["steps_completed"] == ["version.bump"]
    assert "2.0" in (repo / "Demo.toc").read_text()
    assert git(repo, "tag", "--list") == ""


@pytest.fixture
def sync_fixture(tmp_path, monkeypatch):
    addon = tmp_path / "Demo"
    libs = addon / "Libs"
    libs.mkdir(parents=True)
    (libs / "libs.json").write_text(
        json.dumps({"mode": "include", "libraries": {"One": "latest", "Two": "latest"}})
    )
    source = tmp_path / "source"
    for name in ("One", "Two"):
        (source / name).mkdir(parents=True)
        (source / name / "code.lua").write_text("return true")
    wow = tmp_path / "wow"
    wow.mkdir()
    monkeypatch.setattr(environment, "find_addon_path", lambda *args: addon)
    monkeypatch.setattr(
        environment,
        "get_config",
        lambda: SimpleNamespace(
            dev_path=tmp_path,
            data_dir=tmp_path / "data",
            wow_root=wow,
            flavors=["_retail_"],
        ),
    )
    return addon, source, wow


@pytest.mark.asyncio
async def test_sync_previews_never_write(sync_fixture, tmp_path):
    addon, source, wow = sync_fixture
    before = snapshot(tmp_path)
    dirs = {str(p) for p in tmp_path.rglob("*")}
    server = get_server()
    libraries = await server.execute(
        "libs.sync", {"addon": "Demo", "source": str(source), "dry_run": True}
    )
    links = await server.execute("addon.sync", {"addon": "Demo", "dry_run": True})
    assert libraries.success, libraries.error
    assert libraries.data.copied == 2 and libraries.data.steps_completed == []
    assert links.success and links.data.links[0].status == "planned"
    assert snapshot(tmp_path) == before
    assert {str(p) for p in tmp_path.rglob("*")} == dirs


@pytest.mark.asyncio
async def test_libs_preflight_blocks_all_writes_for_missing_source(
    sync_fixture, tmp_path
):
    addon, source, wow = sync_fixture
    (source / "Two" / "code.lua").unlink()
    (source / "Two").rmdir()
    before = snapshot(tmp_path)
    result = await get_server().execute(
        "libs.sync", {"addon": "Demo", "source": str(source)}
    )
    assert not result.success and result.error.code == "LIBS_PREFLIGHT_FAILED"
    assert result.data.steps_completed == []
    assert snapshot(tmp_path) == before


@pytest.mark.asyncio
async def test_libs_partial_failure_retains_completed_actions(
    sync_fixture, monkeypatch
):
    addon, source, wow = sync_fixture
    original = environment.shutil.copytree

    def copy(src, dst, **kwargs):
        if src.name == "Two":
            raise OSError("Injected copy failure")
        return original(src, dst, **kwargs)

    monkeypatch.setattr(environment.shutil, "copytree", copy)
    result = await get_server().execute(
        "libs.sync", {"addon": "Demo", "source": str(source)}
    )
    assert not result.success and result.error.code == "LIBS_PARTIAL_FAILURE"
    assert result.data.steps_completed == ["copy: One"]
    assert result.data.recovery
    assert (addon / "Libs" / "One" / "code.lua").exists()


@pytest.mark.asyncio
async def test_mcp_routes_once_through_execute_and_preserves_context(monkeypatch):
    pytest.importorskip("mcp.server.fastmcp")
    server = create_server("route")

    class Input(BaseModel):
        count: int

    seen = []

    @server.command(
        name="route.test", description="Route", input_schema=Input, mutation=True
    )
    async def command(input, context=None):
        seen.append((input.count, context))
        return success({"count": input.count})

    original = server.execute
    calls = []

    async def execute(name, input, context=None):
        calls.append(name)
        return await original(name, input, context)

    monkeypatch.setattr(server, "execute", execute)
    tool = server._create_mcp_server()._tool_manager.get_tool("route.test")
    context = object()
    result = json.loads(await tool.fn(count="3", context=context))
    assert result["success"] and result["data"] == {"count": 3}
    assert calls == ["route.test"] and seen == [(3, context)]
    assert tool.annotations.readOnlyHint is False
    with pytest.raises(ValidationError):
        await tool.fn(count="bad", context=context)
    assert len(calls) == 1


@pytest.mark.asyncio
async def test_release_success_tags_new_commit(repo):
    result = await get_server().execute(
        "release.all",
        {"addon": "Demo", "path": str(repo), "version": "2.0", "message": "Change"},
    )
    assert result.success, result.error
    assert result.data.steps_completed == [
        "version.bump",
        "changelog.add",
        "git.commit",
        "git.tag",
    ]
    assert git(repo, "rev-parse", "v2.0^{commit}") == git(repo, "rev-parse", "HEAD")
    assert result.data.commit_hash == git(repo, "rev-parse", "--short", "HEAD")


@pytest.mark.asyncio
async def test_addon_sync_partial_failure(sync_fixture, monkeypatch):
    addon, source, wow = sync_fixture
    calls = []

    def run(*args, **kwargs):
        calls.append(args)
        return SimpleNamespace(
            returncode=0 if len(calls) == 1 else 1, stderr="Injected junction failure"
        )

    monkeypatch.setattr(environment.subprocess, "run", run)
    monkeypatch.setattr(environment.subprocess.sys, "platform", "win32")
    result = await get_server().execute(
        "addon.sync", {"addon": "Demo", "flavors": ["one", "two"]}
    )
    assert not result.success and result.error.code == "SYNC_PARTIAL_FAILURE"
    assert len(result.data.steps_completed) == 1
    assert result.data.links[0].status == "created"
    assert result.data.links[1].status.startswith("error:")
    assert result.data.recovery

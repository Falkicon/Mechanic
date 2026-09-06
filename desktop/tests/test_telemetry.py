"""Deterministic self-overhead contracts; no live game or user history access."""

import asyncio

import pytest
from afd import error
from afd.server import create_server
from mechanic import telemetry
from mechanic.commands import diagnostics
from mechanic.commands.core import get_server
from mechanic.storage import Storage


def test_metrics_bound_names_samples_and_percentiles():
    now = [0.0]
    metrics = telemetry.OverheadMetrics(
        clock=lambda: now[0], sample_limit=3, series_limit=2
    )
    for duration in (1, 2, 3, 4):
        token = metrics.begin("known")
        now[0] += duration
        metrics.finish(token, failed=duration == 2)
    for i in range(50):
        token = metrics.begin(f"unknown-{i}")
        metrics.finish(token)
    snapshot = metrics.snapshot()
    assert set(snapshot.series) == {"known", "other"}
    known = snapshot.series["known"]
    assert known.count == 4 and known.failures == 1 and known.inflight == 0
    assert known.sample_count == 3 and known.mean_ms == 3000 and known.p95_ms == 4000
    assert snapshot.series["other"].count == 50
    assert snapshot.uptime_seconds == 10


@pytest.mark.asyncio
async def test_dispatch_inflight_failures_and_no_new_tasks(monkeypatch):
    metrics = telemetry.OverheadMetrics()
    monkeypatch.setattr(telemetry, "metrics", metrics)
    server = create_server("metrics")
    seen = []

    @server.command(name="work", description="Work")
    async def work(input, context=None):
        seen.append(metrics.snapshot().series["command:work"].inflight)
        return error("EXPECTED", "Expected failure")

    telemetry.instrument_server(server)
    wrapped = server.execute
    telemetry.instrument_server(server)
    assert server.execute is wrapped
    before = asyncio.all_tasks()
    assert not (await server.execute("work", {"private": "not retained"})).success
    for i in range(20):
        await server.execute(f"unknown-{i}", {})
    assert asyncio.all_tasks() == before
    snapshot = metrics.snapshot()
    assert seen == [1]
    assert snapshot.series["command:work"].failures == 1
    assert snapshot.series["command:unknown"].count == 20
    assert "private" not in snapshot.model_dump_json()


def test_parser_counts_swallowed_parse_failures(monkeypatch):
    from mechanic.parsers import parse_savedvariables

    metrics = telemetry.OverheadMetrics()
    monkeypatch.setattr(telemetry, "metrics", metrics)
    assert parse_savedvariables("Demo = {value = 3}")["Demo"]["value"] == 3
    assert "<parse error:" in parse_savedvariables('Demo = "unterminated')["Demo"]
    data = metrics.snapshot().series["parser:savedvariables"]
    assert data.count == 2 and data.failures == 1 and data.inflight == 0


def test_history_stats_missing_never_creates_and_existing_read_only(
    tmp_path, monkeypatch
):
    path = tmp_path / "history.db"
    assert not Storage.read_stats(path)["available"]
    assert not path.exists()
    storage = Storage(path)
    storage.save_command_result("test", {"success": True})
    before = {p.name: p.read_bytes() for p in tmp_path.iterdir()}
    import mechanic.storage as module

    original = module.sqlite3.connect
    calls = []

    def connect(path, **kwargs):
        calls.append((path, kwargs))
        return original(path, **kwargs)

    monkeypatch.setattr(module.sqlite3, "connect", connect)
    stats = storage.get_stats()
    assert stats["available"] and stats["rows"]["command_results"] == 1
    assert stats["file_bytes"] == len(before["history.db"])
    assert calls[0][0].endswith("?mode=ro") and calls[0][1]["uri"]
    assert {p.name: p.read_bytes() for p in tmp_path.iterdir()} == before


@pytest.mark.asyncio
async def test_metrics_do_not_read_addon_without_explicit_target(tmp_path, monkeypatch):
    monkeypatch.setenv("MECHANIC_DATA_DIR", str(tmp_path))
    monkeypatch.setattr(
        diagnostics, "select_target", lambda target: pytest.fail("unexpected game read")
    )
    result = await get_server().execute("diagnostic.metrics", {})
    assert result.success and result.data.addon is None and result.data.target is None
    assert not result.data.runtime.available
    assert result.data.runtime.async_tasks is None
    assert not result.data.history.available
    assert list(tmp_path.iterdir()) == []
    empty = await get_server().execute("diagnostic.metrics", {"target": {}})
    assert not empty.success and empty.error.code == "TARGET_REQUIRED"


@pytest.mark.asyncio
async def test_metrics_explicit_target_reads_only_selected_profile(
    tmp_path, monkeypatch
):
    from mechanic.targets import SelectedTarget

    target = SelectedTarget(
        client="client",
        account="account",
        character="character",
        profile="profile",
        sv_path=str(tmp_path / "selected.lua"),
        addon_path=str(tmp_path / "addon"),
    )
    seen = []
    monkeypatch.setenv("MECHANIC_DATA_DIR", str(tmp_path))
    monkeypatch.setattr(diagnostics, "select_target", lambda selector: target)

    def read(selected):
        seen.append(selected)
        return {"diagnosticOverhead": {"active_tickers": 1, "hub_sync_ms": 2.5}}

    monkeypatch.setattr(diagnostics, "read_profile", read)
    result = await get_server().execute(
        "diagnostic.metrics", {"target": {"profile": "profile"}}
    )
    assert result.success and seen == [target]
    assert (
        result.data.addon.active_tickers == 1 and result.data.addon.hub_sync_ms == 2.5
    )


@pytest.mark.asyncio
async def test_actual_mcp_schemas_and_annotations():
    pytest.importorskip("mcp.server.fastmcp")
    from mechanic.mcp_server import create_mcp_server

    server = get_server()
    mcp = create_mcp_server(server)
    tools = {tool.name: tool for tool in await mcp.list_tools()}
    for cmd in server.list_commands():
        tool = tools[cmd.name.replace(".", "-")]
        assert tool.annotations.readOnlyHint == (not cmd.mutation)
        assert tool.annotations.destructiveHint == cmd.mutation
    queue = tools["api-queue"].inputSchema
    assert queue["properties"]["apis"]["type"] == "array"
    assert "apis" in queue["required"] and "target" in queue["properties"]
    assert "$defs" in queue
    assert "dry_run" in tools["release-all"].inputSchema["properties"]
    assert "kwargs" not in tools["commands-list"].inputSchema.get("properties", {})
    assert tools["git-tag"].annotations.idempotentHint is False


@pytest.mark.asyncio
async def test_metrics_polls_do_not_grow_http_history(tmp_path, monkeypatch):
    from mechanic import server as http

    storage = Storage(tmp_path / "history.db")
    monkeypatch.setattr(http, "storage", storage)
    monkeypatch.setenv("MECHANIC_DATA_DIR", str(tmp_path))
    for name in ("commands.list", "diagnostic.targets", "diagnostic.metrics"):
        await http.execute_command(http.ExecuteRequest(command=name))
    assert storage.get_stats()["rows"]["command_results"] == 0


@pytest.mark.asyncio
async def test_actual_mcp_calls_catalog_metrics_and_typed_defaults(
    tmp_path, monkeypatch
):
    pytest.importorskip("mcp.server.fastmcp")
    import json
    from pydantic import BaseModel, Field
    from mechanic.mcp_server import create_mcp_server
    from afd import success

    monkeypatch.setenv("MECHANIC_DATA_DIR", str(tmp_path))
    mcp = create_mcp_server(get_server())

    def decode(content):
        if isinstance(content, tuple):
            content = content[0]
        text = "\n".join(block.text for block in content if hasattr(block, "text"))
        return json.loads(text.split("--- Full Response ---", 1)[1])

    catalog_result = decode(await mcp.call_tool("commands-list", {}))
    assert catalog_result["success"] and catalog_result["data"]["commands"]
    metric_result = decode(await mcp.call_tool("diagnostic-metrics", {}))
    assert metric_result["success"] and metric_result["data"]["addon"] is None

    class Defaults(BaseModel):
        count: int = Field(3, description="Count")
        values: list[str] = Field(default_factory=list)

    server = create_server("default-call")

    @server.command(name="defaults.test", description="Defaults", input_schema=Defaults)
    async def command(input):
        return success(input.model_dump())

    default_mcp = create_mcp_server(server)
    result = decode(await default_mcp.call_tool("defaults-test", {}))
    assert result["success"] and result["data"] == {"count": 3, "values": []}


@pytest.mark.parametrize(
    "command", ["diagnostic.metrics", "dashboard.metrics", "atlas.search", "env.status"]
)
def test_first_run_metrics_subprocess_never_creates_history(tmp_path, command):
    import os
    import subprocess
    import sys

    data_dir = tmp_path / "missing" / "data"
    env = os.environ.copy()
    env["MECHANIC_DATA_DIR"] = str(data_dir)
    script = """
import asyncio
import os
import sys
from pathlib import Path
from mechanic.commands.core import get_server
from mechanic.config import get_data_dir
assert not Path(os.environ['MECHANIC_DATA_DIR']).exists()
assert get_data_dir(create=False) == Path(os.environ['MECHANIC_DATA_DIR'])
assert not Path(os.environ['MECHANIC_DATA_DIR']).exists()
params = {"query": "missing-test-icon"} if sys.argv[1] == "atlas.search" else {}
result = asyncio.run(get_server().execute(sys.argv[1], params))
if sys.argv[1] == 'diagnostic.metrics':
    assert result.success and not result.data.history.available, result
elif sys.argv[1] == 'dashboard.metrics':
    assert not result.success and result.error.code == 'NO_DATA', result
elif sys.argv[1] == 'env.status':
    assert result.success, result
else:
    assert not result.success and result.error.code == 'INDEX_NOT_FOUND', result
assert 'mechanic.server' not in sys.modules
assert not Path(os.environ['MECHANIC_DATA_DIR']).exists()
"""
    result = subprocess.run(
        [sys.executable, "-c", script, command], env=env, capture_output=True, text=True
    )
    assert result.returncode == 0, result.stdout + result.stderr
    assert not data_dir.parent.exists()

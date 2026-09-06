"""Exercise target selection and the actual generated Lua/Bootstrap/SV boundary."""

import os
import shutil
import subprocess
from pathlib import Path

import pytest
from mechanic import config
from mechanic.commands.core import get_server
from mechanic.targets import discover_targets

ROOT = Path(__file__).resolve().parents[2]


@pytest.mark.asyncio
async def test_reload_broadcast_preserves_identity_and_skips_ambiguous_history(
    monkeypatch,
):
    import json
    from unittest.mock import AsyncMock, Mock
    from mechanic import server

    storage = Mock()
    broadcast = AsyncMock()
    monkeypatch.setattr(server, "storage", storage)
    monkeypatch.setattr(server.manager, "broadcast", broadcast)
    candidates = [{"profile": "Raid"}, {"profile": "Other"}]
    await server.notify_reload(
        {"addon": "!Mechanic", "timestamp": 1, "candidates": candidates}
    )
    storage.save_reload.assert_not_called()
    assert json.loads(broadcast.call_args.args[0])["candidates"] == candidates
    target = {"character": "Hero - Realm", "profile": "Raid"}
    await server.notify_reload(
        {"addon": "!Mechanic", "timestamp": 2, "target": target, "data": {"tests": []}}
    )
    storage.save_reload.assert_called_once()
    assert json.loads(broadcast.call_args.args[0])["target"] == target


@pytest.mark.asyncio
async def test_watcher_invalidates_ambiguous_profiles_without_publishing_data(
    monkeypatch, tmp_path
):
    from mechanic import watcher

    path = install(tmp_path)
    monkeypatch.setattr(config, "discover_saved_variables", lambda: [path.parent])
    notifications = []

    async def changes(*args, **kwargs):
        yield {(2, str(path))}

    async def notify(payload):
        notifications.append(payload)

    monkeypatch.setattr(watcher, "awatch", changes)
    monkeypatch.setattr(watcher, "notify_reload", notify)
    await watcher.SVWatcher([path.parent]).start()
    assert len(notifications) == 1
    assert notifications[0]["target"] is None
    assert len(notifications[0]["candidates"]) == 2
    assert "data" not in notifications[0]


def install(tmp_path, client="retail", account="A"):
    base = tmp_path / client
    sv = base / "WTF" / "Account" / account / "SavedVariables"
    sv.mkdir(parents=True)
    addon = base / "Interface" / "AddOns" / "!Mechanic"
    addon.mkdir(parents=True, exist_ok=True)
    path = sv / "!Mechanic.lua"
    path.write_text(
        'MechanicDB = { ["profileKeys"] = { ["Hero - Realm"] = "Raid" }, ["profiles"] = { ["Raid"] = {}, ["Other"] = { ["marker"] = "untouched" } } }',
        encoding="utf-8",
    )
    return path


@pytest.mark.asyncio
async def test_target_ambiguity_never_writes_queue(monkeypatch, tmp_path):
    files = [install(tmp_path), install(tmp_path, "beta")]
    monkeypatch.setattr(
        config, "discover_saved_variables", lambda: [p.parent for p in reversed(files)]
    )
    result = await get_server().execute("lua.queue", {"code": ["return 1"]})
    assert not result.success and result.error.code == "TARGET_AMBIGUOUS"
    assert len(result.error.details["candidates"]) == 4
    assert not list(tmp_path.rglob("MechanicQueue.lua"))
    targets = await get_server().execute("diagnostic.targets", {})
    assert targets.success and len(targets.data.targets) == 4
    assert targets.data.targets == discover_targets()


@pytest.mark.asyncio
@pytest.mark.parametrize("character", ["Hero", "SomeoneElse", "unknown"])
async def test_actual_bootstrap_roundtrip(monkeypatch, tmp_path, character):
    runtime = (
        os.environ.get("MECHANIC_LUA") or shutil.which("lua5.1") or shutil.which("lua")
    )
    if not runtime:
        pytest.skip("Lua runtime is required for the real Bootstrap contract")
    path = install(tmp_path)
    monkeypatch.setattr(config, "discover_saved_variables", lambda: [path.parent])
    target = {
        "client": str(path.parents[4]),
        "account": "A",
        "character": "Hero - Realm",
        "profile": "Raid",
    }
    server = get_server()
    queued = await server.execute(
        "lua.queue",
        {
            "target": target,
            "code": [
                "return 42",
                "return false",
                "error('expected')",
                "local =",
                "local t = {}; t.self=t; return t",
            ],
            "labels": ["duplicate", "duplicate", "runtime", "compile", "cycle"],
        },
    )
    assert queued.success, queued.error
    subprocess.run(
        [
            runtime,
            str(ROOT / "tests/fixtures/diagnostic_roundtrip.lua"),
            queued.data.queue_file,
            str(path),
            str(ROOT / "!Mechanic/Bootstrap.lua"),
            character,
        ],
        check=True,
        capture_output=True,
        text=True,
    )
    results = await server.execute("lua.results", {"target": target})
    output = await server.execute("addon.output", {"target": target})
    parsed = await server.execute(
        "sv.parse", {"file_path": str(path), "target": target}
    )
    assert results.success and output.success and parsed.success
    assert (
        results.data.target
        == output.data.target
        == parsed.data.target
        == queued.data.target
    )
    assert '"untouched"' in path.read_text(encoding="utf-8")
    if character == "Hero":
        assert results.data.total == output.data.lua_eval_count == 5
        assert [r["success"] for r in results.data.results] == [
            True,
            True,
            False,
            False,
            True,
        ]
        assert results.data.results[0]["result"] == "42"
        assert results.data.results[1]["result"] == "false"
        assert results.data.results[0]["label"] == results.data.results[1]["label"]
        assert results.data.last_run == output.data.timestamp == "2026-09-05 12:00:00"
        assert (
            parsed.data.addons["!Mechanic"]["luaEvalResults"]["lastRun"]
            == results.data.last_run
        )
    else:
        assert results.data.total == output.data.lua_eval_count == 0


@pytest.mark.asyncio
@pytest.mark.parametrize(
    "body",
    [
        "MechanicDB = 2",
        'MechanicDB = { ["profiles"] = 3 }',
        'MechanicDB = { ["profileKeys"] = { ["Hero"] = true } }',
    ],
)
async def test_malformed_targets_are_actionable(monkeypatch, tmp_path, body):
    path = install(tmp_path)
    path.write_text(body, encoding="utf-8")
    monkeypatch.setattr(config, "discover_saved_variables", lambda: [path.parent])
    result = await get_server().execute("diagnostic.targets", {})
    assert not result.success and result.error.code == "TARGET_READ_ERROR"
    assert result.error.suggestion


def test_profile_removed_after_selection_is_explicit(monkeypatch, tmp_path):
    from mechanic.targets import read_profile, TargetError

    path = install(tmp_path)
    monkeypatch.setattr(config, "discover_saved_variables", lambda: [path.parent])
    target = next(t for t in discover_targets() if t.profile == "Raid")
    path.write_text('MechanicDB = { ["profiles"] = {} }', encoding="utf-8")
    with pytest.raises(TargetError) as raised:
        read_profile(target)
    assert raised.value.code == "TARGET_NOT_FOUND"


@pytest.mark.asyncio
async def test_explicit_unknown_target_never_falls_back(monkeypatch, tmp_path):
    path = install(tmp_path)
    monkeypatch.setattr(config, "discover_saved_variables", lambda: [path.parent])
    result = await get_server().execute(
        "addon.output", {"target": {"account": "missing"}}
    )
    assert not result.success and result.error.code == "TARGET_NOT_FOUND"


@pytest.mark.asyncio
async def test_generic_saved_variables_dont_claim_diagnostic_identity(tmp_path):
    path = tmp_path / "Test.lua"
    path.write_text(
        'TestDB = { ["profiles"] = { ["Default"] = { ["answer"] = 42 } } }',
        encoding="utf-8",
    )
    parsed = await get_server().execute("sv.parse", {"file_path": str(path)})
    assert parsed.success
    assert parsed.data.target is None
    assert parsed.data.addons["Test"]["answer"] == 42

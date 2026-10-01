"""Regression coverage for the desktop infrastructure fixes (CLI, bridge, storage, setup)."""

import asyncio
import io
import json
import os
import re
import sqlite3
import subprocess
import sys
import zipfile
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import AsyncMock

import pytest
from click.testing import CliRunner
from fastapi.testclient import TestClient

from mechanic import cli, setup as tool_setup, storage as storage_module, utils
from mechanic.commands.core import get_server
from mechanic.storage import Storage


@pytest.fixture
def bridge(monkeypatch, tmp_path):
    from mechanic import server

    monkeypatch.setattr(server, "storage", Storage(tmp_path / "history.db"))
    with TestClient(server.app, base_url="http://localhost") as client:
        yield client


# --- Startup side effects and /health ---------------------------------------


def _run_python(code: str, data_dir: Path, *args: str):
    env = os.environ.copy()
    env["MECHANIC_DATA_DIR"] = str(data_dir)
    return subprocess.run(
        [sys.executable, "-c", code, *args],
        env=env,
        capture_output=True,
        text=True,
        timeout=120,
    )


def test_importing_the_bridge_and_cli_help_never_create_history(tmp_path):
    data_dir = tmp_path / "missing" / "data"
    code = (
        "import sys\n"
        "from click.testing import CliRunner\n"
        "from mechanic import server\n"
        "from mechanic.cli import main\n"
        "assert 'storage' not in vars(server)\n"
        "result = CliRunner().invoke(main, ['--help'])\n"
        "assert result.exit_code == 0, result.output\n"
    )
    result = _run_python(code, data_dir)
    assert result.returncode == 0, result.stdout + result.stderr
    assert not data_dir.parent.exists()


def test_health_reports_version_and_port(bridge):
    from mechanic import __version__, server

    body = bridge.get("/health").json()
    assert body == {"status": "healthy", "version": __version__, "port": None}
    server.set_http_port(3100)
    try:
        assert bridge.get("/health").json()["port"] == 3100
    finally:
        server.set_http_port(None)


def test_version_is_single_sourced():
    import mechanic

    assert re.fullmatch(r"\d+\.\d+\.\d+", mechanic.__version__)
    pyproject = (Path(mechanic.__file__).parents[2] / "pyproject.toml").read_text(
        encoding="utf-8"
    )
    assert 'dynamic = ["version"]' in pyproject
    assert 'attr = "mechanic.__version__"' in pyproject


# --- Shutdown -----------------------------------------------------------------


@pytest.mark.asyncio
async def test_request_shutdown_calls_registered_handler_after_delay(monkeypatch):
    from mechanic import server

    called = asyncio.Event()
    monkeypatch.setattr(server, "_shutdown_handler", None)
    assert server.request_shutdown(0) is False
    server.set_shutdown_handler(called.set)
    try:
        assert server.request_shutdown(0.01) is True
        await asyncio.wait_for(called.wait(), 2)
    finally:
        server.set_shutdown_handler(None)


# --- History persistence ----------------------------------------------------


def test_history_retention_and_oversized_results(monkeypatch, tmp_path):
    monkeypatch.setattr(storage_module, "MAX_COMMAND_ROWS", 5)
    monkeypatch.setattr(storage_module, "MAX_RESULT_BYTES", 200)
    db = Storage(tmp_path / "history.db")
    for index in range(8):
        db.save_command_result("cmd", {"success": True, "data": {"n": index}})
    history = db.get_command_history("cmd", 50)
    assert [entry["result"]["data"]["n"] for entry in history] == [3, 4, 5, 6, 7]

    big_id = db.save_command_result(
        "big", {"success": False, "error": {"code": "X"}, "data": "x" * 1000}
    )
    stored = db.get_command_result(big_id)["result"]
    assert stored["truncated"] is True
    assert stored["success"] is False and stored["error"] == {"code": "X"}
    assert stored["original_bytes"] > 200


def test_reload_history_is_capped(monkeypatch, tmp_path):
    monkeypatch.setattr(storage_module, "MAX_RELOAD_ROWS", 3)
    db = Storage(tmp_path / "history.db")
    for index in range(6):
        db.save_reload(
            index,
            {"Demo": {"tests": [{"name": f"t{index}", "passed": True}], "perf": {}}},
        )
    stats = db.get_stats()["rows"]
    assert stats["reload_history"] == 3
    assert stats["test_results"] == 3 and stats["perf_metrics"] == 3


def test_save_reload_tolerates_unexpected_shapes(tmp_path):
    db = Storage(tmp_path / "history.db")
    db.save_reload(
        1, {"A": "text", "B": {"tests": {"k": 1}, "perf": 3}, "C": {"tests": ["x"]}}
    )
    assert db.get_stats()["rows"]["reload_history"] == 1


def test_history_listing_omits_large_results_and_serves_them_by_id(bridge):
    from mechanic import server

    store = server.get_storage()
    small = store.save_command_result("demo", {"success": True, "data": {"a": 1}})
    large = store.save_command_result("demo", {"success": True, "data": "y" * 5000})

    listing = bridge.get("/api/history", params={"max_result_bytes": 1000}).json()[
        "history"
    ]
    by_id = {entry["id"]: entry for entry in listing}
    assert by_id[small]["result"]["data"] == {"a": 1}
    assert by_id[large]["result"]["truncated"] is True
    assert by_id[large]["result"]["history_id"] == large
    assert by_id[large]["result_bytes"] > 5000

    full = bridge.get(f"/api/history/{large}").json()
    assert full["result"]["data"] == "y" * 5000
    assert bridge.get("/api/history/999999").status_code == 404


@pytest.mark.asyncio
async def test_reload_broadcast_survives_history_failure(monkeypatch):
    from mechanic import server

    broadcast = AsyncMock()
    failing = SimpleNamespace(
        save_reload=lambda *a: (_ for _ in ()).throw(
            sqlite3.OperationalError("database is locked")
        )
    )
    monkeypatch.setattr(server, "storage", failing)
    monkeypatch.setattr(server.manager, "broadcast", broadcast)
    await server.notify_reload(
        {"addon": "!Mechanic", "timestamp": 1, "data": {"tests": []}}
    )
    broadcast.assert_awaited_once()


# --- Input validation contract -----------------------------------------------


@pytest.mark.asyncio
async def test_invalid_input_is_a_validation_error_with_field_details():
    result = await get_server().execute("sv.parse", {"file_path": 7})
    assert not result.success
    assert result.error.code == "VALIDATION_ERROR"
    fields = [item["field"] for item in result.error.details["errors"]]
    assert fields == ["file_path"]
    assert "file_path" in result.error.message

    missing = await get_server().execute("sv.parse", {})
    assert missing.error.code == "VALIDATION_ERROR"

    not_object = await get_server().execute("sv.parse", ["x"])
    assert not_object.error.code == "VALIDATION_ERROR"
    assert not_object.error.details["errors"][0]["field"] == "(input)"


@pytest.mark.asyncio
async def test_valid_input_still_reaches_the_handler(tmp_path):
    result = await get_server().execute(
        "sv.parse", {"file_path": str(tmp_path / "missing.lua")}
    )
    assert result.error.code == "FILE_NOT_FOUND"


# --- SavedVariables parse failures -------------------------------------------


@pytest.mark.asyncio
async def test_sv_parse_reports_truncated_file_as_error(tmp_path):
    from mechanic.parsers import is_parse_error, parse_savedvariables

    truncated = "MechanicDB = { profiles = { Default = { tests = {"
    assert is_parse_error(parse_savedvariables(truncated)["MechanicDB"])
    path = tmp_path / "!Mechanic.lua"
    path.write_text(truncated, encoding="utf-8")
    result = await get_server().execute("sv.parse", {"file_path": str(path)})
    assert not result.success
    assert result.error.code == "PARSE_ERROR" and result.error.retryable is True


@pytest.mark.asyncio
async def test_sv_parse_normalizes_without_mutating_the_shared_parse(tmp_path):
    path = tmp_path / "Demo.lua"
    path.write_text(
        "Demo = { testResults = { a = { passed = true } } }", encoding="utf-8"
    )
    first = await get_server().execute("sv.parse", {"file_path": str(path)})
    second = await get_server().execute("sv.parse", {"file_path": str(path)})
    assert first.data.addons["Demo"]["tests"] == [{"name": "a", "passed": True}]
    assert second.data.addons["Demo"]["tests"] == first.data.addons["Demo"]["tests"]


# --- Watcher ----------------------------------------------------------------


def test_watcher_prefilter_reads_only_potentially_diagnostic_files(tmp_path):
    from mechanic.watcher import _may_carry_diagnostics

    plain = tmp_path / "Other.lua"
    plain.write_text("OtherDB = { color = 1 }", encoding="utf-8")
    tests = tmp_path / "Tested.lua"
    tests.write_text("TestedDB = { testResults = {} }", encoding="utf-8")
    primary = tmp_path / "!Mechanic.lua"
    primary.write_text("MechanicDB = {}", encoding="utf-8")
    assert not _may_carry_diagnostics(plain)
    assert _may_carry_diagnostics(tests)
    assert _may_carry_diagnostics(primary)
    assert not _may_carry_diagnostics(tmp_path / "gone.lua")


@pytest.mark.asyncio
async def test_watcher_never_parses_unrelated_savedvariables(monkeypatch, tmp_path):
    from mechanic import watcher
    from mechanic.commands import core

    other = tmp_path / "Other.lua"
    other.write_text("OtherDB = { color = 1 }", encoding="utf-8")

    async def changes(*paths, stop_event):
        yield {(1, str(other))}

    parsed = []

    class Server:
        async def execute(self, name, payload):
            parsed.append(name)

    monkeypatch.setattr(watcher, "awatch", changes)
    monkeypatch.setattr(core, "get_server", lambda: Server())
    await watcher.SVWatcher([tmp_path]).start()
    assert parsed == []


@pytest.mark.asyncio
async def test_watcher_reload_trigger_runs_off_the_event_loop(monkeypatch, tmp_path):
    from mechanic import watcher

    src = tmp_path / "src"
    src.mkdir()
    source_file = src / "Core.lua"
    source_file.write_text("x = 1", encoding="utf-8")
    threads = []

    def trigger(keys):
        import threading

        threads.append((keys, threading.current_thread() is threading.main_thread()))
        return True

    async def changes(*paths, stop_event):
        yield {(1, str(source_file))}

    monkeypatch.setattr(watcher, "awatch", changes)
    monkeypatch.setattr(utils, "trigger_wow_reload", trigger)
    await watcher.SVWatcher(
        [], src_paths=[src], auto_reload=True, reload_key="9"
    ).start()
    assert threads == [("9", False)]


def test_windows_reload_uses_exact_window_match_and_a_timeout(monkeypatch):
    captured = {}

    def run(args, **kwargs):
        captured.update(args=args, kwargs=kwargs)
        return SimpleNamespace(returncode=0)

    monkeypatch.setattr(utils.subprocess, "run", run)
    assert utils._trigger_reload_windows("^+r", 0.1) is True
    script = captured["args"][-1]
    assert "MainWindowTitle" in script and "AppActivate($game.Id)" in script
    assert "AppActivate($title)" not in script
    assert captured["kwargs"]["timeout"] == utils.RELOAD_TIMEOUT_SECONDS

    def hang(args, **kwargs):
        raise subprocess.TimeoutExpired(args, kwargs["timeout"])

    monkeypatch.setattr(utils.subprocess, "run", hang)
    assert utils._trigger_reload_windows("^+r", 0.1) is False


# --- Configuration ------------------------------------------------------------


def test_save_user_config_merges_and_ignores_none(tmp_path, monkeypatch):
    from mechanic import config

    monkeypatch.setattr(Path, "home", classmethod(lambda cls: tmp_path))
    path = tmp_path / ".mechanic" / "config.json"
    path.parent.mkdir()
    path.write_text(
        json.dumps({"flavors": ["_retail_"], "template_path": str(tmp_path)}),
        encoding="utf-8",
    )
    instance = config.MechanicConfig()
    instance.save_user_config(
        {"wow_root": str(tmp_path), "dev_path": None, "template_path": None}
    )
    saved = json.loads(path.read_text(encoding="utf-8"))
    assert saved == {
        "flavors": ["_retail_"],
        "template_path": str(tmp_path),
        "wow_root": str(tmp_path),
    }


def test_null_path_settings_do_not_crash_properties():
    from mechanic import config

    instance = config.MechanicConfig()
    instance._config = {"wow_root": None, "dev_path": None, "template_path": None}
    instance._loaded = True
    assert instance.template_path is None
    assert instance.dev_path is None or isinstance(instance.dev_path, Path)
    instance.wow_root  # must not raise


# --- CLI --------------------------------------------------------------------


class FakeServer:
    def __init__(self, result):
        self.result = result
        self.calls = []

    async def execute(self, name, payload, context=None):
        self.calls.append((name, payload))
        return self.result

    def list_commands(self):
        return []


def _ok(data=None):
    from afd import success

    return success(data or {"done": True})


def test_agent_flag_reaches_addon_output_and_failure_exits_nonzero(monkeypatch):
    from afd import error
    from mechanic.commands import core

    fake = FakeServer(_ok())
    monkeypatch.setattr(core, "get_server", lambda: fake)
    result = CliRunner().invoke(cli.main, ["--agent", "addon.output"])
    assert result.exit_code == 0
    assert fake.calls == [("addon.output", {"agent_mode": True})]

    fake = FakeServer(error("TARGET_NOT_FOUND", "nothing"))
    monkeypatch.setattr(core, "get_server", lambda: fake)
    assert CliRunner().invoke(cli.main, ["addon.output"]).exit_code == 1
    assert fake.calls == [("addon.output", {"agent_mode": False})]


def test_docs_json_is_real_json_and_failure_exits_nonzero(monkeypatch, tmp_path):
    output = tmp_path / "ref.md"
    result = CliRunner().invoke(cli.main, ["--json", "docs", "-o", str(output)])
    assert result.exit_code == 0, result.output
    payload = json.loads(result.output)
    assert payload["success"] is True

    from afd import error
    from mechanic.commands import core

    monkeypatch.setattr(core, "get_server", lambda: FakeServer(error("X", "bad")))
    assert CliRunner().invoke(cli.main, ["docs"]).exit_code == 1


def test_shell_survives_invalid_json(monkeypatch):
    from mechanic.commands import core

    fake = FakeServer(_ok())
    monkeypatch.setattr(core, "get_server", lambda: fake)
    result = CliRunner().invoke(
        cli.main,
        ["shell"],
        input='call demo.cmd {bad\ndemo.other {also bad\ncall demo.good {"a": 1}\nexit\n',
    )
    assert result.exit_code == 0, result.output
    assert result.output.count("Invalid JSON") == 2
    assert fake.calls == [("demo.good", {"a": 1})]


def test_release_runs_release_all_with_its_preflight(monkeypatch):
    from mechanic.commands import core

    fake = FakeServer(_ok({"steps_planned": [], "steps_completed": ["version.bump"]}))
    monkeypatch.setattr(core, "get_server", lambda: fake)
    result = CliRunner().invoke(
        cli.main, ["release", "Weekly", "1.2.0", "Notes", "--dry-run"]
    )
    assert result.exit_code == 0, result.output
    assert fake.calls == [
        (
            "release.all",
            {
                "addon": "Weekly",
                "version": "1.2.0",
                "message": "Notes",
                "category": "Changed",
                "dry_run": True,
            },
        )
    ]
    skipped = CliRunner().invoke(
        cli.main, ["release", "Weekly", "1.2.0", "Notes", "--skip-tag"]
    )
    assert skipped.exit_code == 2 and len(fake.calls) == 1


def test_send_keys_description_and_sse_defaults():
    assert cli.describe_send_keys("^+r") == "Ctrl+Shift+R"
    assert cli.describe_send_keys("9") == "9"
    params = {param.name: param for param in cli.mcp.params}
    assert params["port"].default == cli.DEFAULT_MCP_SSE_PORT != 3100
    assert params["host"].default == "127.0.0.1"


def test_sse_transport_warns_about_unauthenticated_mutating_commands(monkeypatch):
    from mechanic import mcp_server
    from mechanic.commands import core

    started = {}

    class FakeMCP:
        settings = SimpleNamespace(host=None, port=None)

        def run(self, transport):
            started["transport"] = transport
            started["host"] = self.settings.host
            started["port"] = self.settings.port

    monkeypatch.setattr(core, "get_server", lambda: FakeServer(_ok()))
    monkeypatch.setattr(mcp_server, "create_mcp_server", lambda *a, **k: FakeMCP())
    result = CliRunner().invoke(cli.main, ["-q", "mcp", "--transport", "sse"])
    assert result.exit_code == 0, result.output
    assert started == {
        "transport": "sse",
        "host": "127.0.0.1",
        "port": cli.DEFAULT_MCP_SSE_PORT,
    }
    assert "unauthenticated" in result.output


def test_output_encoding_is_made_safe_for_legacy_code_pages():
    raw = io.BytesIO()
    stream = io.TextIOWrapper(raw, encoding="cp1252", errors="strict")
    saved = sys.stdout, sys.stderr
    sys.stdout = sys.stderr = stream
    try:
        cli.ensure_utf8_output()
        print("snowman ☃")
        stream.flush()
    finally:
        sys.stdout, sys.stderr = saved
    assert "☃".encode("utf-8") in raw.getvalue()


# --- Tool setup ---------------------------------------------------------------

GOOD_EXE = b"lua executable"


def _zip(**files):
    buffer = io.BytesIO()
    with zipfile.ZipFile(buffer, "w") as archive:
        for name, data in files.items():
            archive.writestr(name, data)
    return buffer.getvalue()


def _tool(sha, **extra):
    import hashlib

    return {
        "version": "1",
        "windows": {
            "url": "https://example.test/tool.zip",
            "filename": "lua.exe",
            "archive_path": "lua.exe",
            "sha256": hashlib.sha256(GOOD_EXE).hexdigest() if sha == "good" else sha,
            **extra,
        },
    }


def test_unverifiable_checksums_are_never_trusted(tmp_path, monkeypatch):
    target = tmp_path / "tool.exe"
    target.write_bytes(b"anything")
    for value in ("skip", "placeholder", "", None, "abc"):
        assert tool_setup.verify_checksum(target, value) is False
    monkeypatch.setattr(tool_setup, "BIN_DIR", tmp_path / "bin")
    downloads = []
    monkeypatch.setattr(tool_setup, "download_file", lambda url: downloads.append(url))
    ok, message = tool_setup.download_tool_windows("lua", _tool("placeholder"))
    assert ok is False and "No verified checksum" in message
    assert downloads == [] and not (tmp_path / "bin").exists()


def test_checksum_is_verified_before_anything_is_written(tmp_path, monkeypatch):
    monkeypatch.setattr(tool_setup, "BIN_DIR", tmp_path / "bin")
    monkeypatch.setattr(
        tool_setup, "download_file", lambda url: _zip(**{"lua.exe": b"tampered"})
    )
    ok, message = tool_setup.download_tool_windows("lua", _tool("good"))
    assert ok is False and "Checksum mismatch" in message
    assert not (tmp_path / "bin").exists()


def test_extra_files_are_installed_with_the_tool(tmp_path, monkeypatch):
    monkeypatch.setattr(tool_setup, "BIN_DIR", tmp_path / "bin")
    archive = _zip(**{"lua.exe": GOOD_EXE, "lua5.1.dll": b"dll"})
    monkeypatch.setattr(tool_setup, "download_file", lambda url: archive)
    tool = _tool("good", extra_files=["lua5.1.dll"])
    ok, message = tool_setup.download_tool_windows("lua", tool)
    assert ok is True, message
    assert (tmp_path / "bin" / "lua.exe").read_bytes() == GOOD_EXE
    assert (tmp_path / "bin" / "lua5.1.dll").read_bytes() == b"dll"
    assert not list((tmp_path / "bin").glob("*.part"))

    # A later run recognises the complete install and does not download again.
    monkeypatch.setattr(tool_setup, "download_file", lambda url: pytest.fail("again"))
    assert tool_setup.download_tool_windows("lua", tool)[1].startswith("Already")


def test_missing_companion_file_fails_before_installing(tmp_path, monkeypatch):
    monkeypatch.setattr(tool_setup, "BIN_DIR", tmp_path / "bin")
    monkeypatch.setattr(
        tool_setup, "download_file", lambda url: _zip(**{"lua.exe": GOOD_EXE})
    )
    ok, _ = tool_setup.download_tool_windows(
        "lua", _tool("good", extra_files=["lua5.1.dll"])
    )
    assert ok is False and not (tmp_path / "bin" / "lua.exe").exists()


def test_shipped_checksums_have_real_hashes_for_downloadable_windows_tools():
    manifest = tool_setup.load_checksums()
    assert manifest["tools"]
    for name, info in manifest["tools"].items():
        windows = info.get("windows", {})
        if windows.get("url"):
            assert tool_setup.is_valid_sha256(windows.get("sha256")), name


def test_setup_summary_says_where_tools_go():
    summary = tool_setup.get_setup_summary([])
    assert summary["bin_dir"] == str(tool_setup.BIN_DIR)
    assert isinstance(summary["source_checkout"], bool)


# --- MCP registry vs hand-maintained tables ----------------------------------


def test_mcp_tables_match_the_command_registry():
    from afd.server.decorators import get_command_metadata
    from mechanic import mcp_server

    server = get_server()
    names = {command.name for command in server.list_commands()}
    tables = {
        "TOOL_EXAMPLES": mcp_server.TOOL_EXAMPLES,
        "TOOL_ANNOTATIONS": mcp_server.TOOL_ANNOTATIONS,
        "TOOL_TITLES": mcp_server.TOOL_TITLES,
        "TOOL_INTENTS": mcp_server.TOOL_INTENTS,
    }
    for label, table in tables.items():
        assert set(table) <= names, (label, sorted(set(table) - names))
    assert names <= set(mcp_server.TOOL_EXAMPLES), sorted(
        names - set(mcp_server.TOOL_EXAMPLES)
    )
    for name in sorted(names):
        prefix = mcp_server.category_prefix(name)
        assert prefix in mcp_server.TOOL_CATEGORIES, f"{name}: no category '{prefix}'"
        assert mcp_server.get_category_for_tool(name) != "Miscellaneous"

    for name, example in mcp_server.TOOL_EXAMPLES.items():
        schema = get_command_metadata(server.registry.get(name).handler).input_schema
        payload = json.loads(example)
        if schema is not None:
            schema.model_validate(payload)


def test_dashed_and_dotted_commands_share_category_lookup():
    from mechanic import mcp_server

    assert mcp_server.category_prefix("api.search") == "api"
    assert mcp_server.category_prefix("fencore-catalog") == "fencore"
    assert "FenCore" in mcp_server.get_category_for_tool("fencore-catalog")
    assert "Diagnostics" in mcp_server.get_category_for_tool("diagnostic.targets")

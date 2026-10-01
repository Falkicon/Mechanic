"""Regression coverage for the local bridge, watcher and MCP adapter."""

import asyncio
import json
import sqlite3
from types import SimpleNamespace
from unittest.mock import AsyncMock

import pytest
from fastapi.testclient import TestClient
from pydantic import BaseModel


@pytest.fixture
def bridge(monkeypatch, tmp_path):
    from mechanic import server
    from mechanic.storage import Storage

    monkeypatch.setattr(server, "storage", Storage(tmp_path / "history.db"))
    with TestClient(server.app, base_url="http://localhost") as client:
        yield client


def test_bridge_blocks_foreign_origin_and_host(bridge):
    assert (
        bridge.post(
            "/api/execute",
            json={"command": "tools.status"},
            headers={"Origin": "https://example.com"},
        ).status_code
        == 403
    )
    assert (
        bridge.get("/health", headers={"Host": "attacker.example"}).status_code == 400
    )
    assert (
        bridge.get("/health", headers={"Origin": "http://localhost"}).status_code == 200
    )


@pytest.mark.parametrize(
    "body",
    [
        {},
        {"command": []},
        {"command": ""},
        {"command": "tools.status", "input": None},
        {"command": "tools.status", "input": []},
    ],
)
def test_bridge_rejects_malformed_requests(bridge, body):
    assert bridge.post("/api/execute", json=body).status_code == 422


def test_bridge_bounds_history(bridge):
    assert bridge.get("/api/history?limit=-1").status_code == 422
    assert bridge.get("/api/history?limit=1001").status_code == 422


def test_websocket_rejects_foreign_origin(bridge):
    from starlette.websockets import WebSocketDisconnect

    with pytest.raises(WebSocketDisconnect) as exc:
        with bridge.websocket_connect(
            "ws://localhost/ws", headers={"Origin": "https://example.com"}
        ):
            pytest.fail("Cross-origin socket accepted")
    assert exc.value.code == 1008


def test_history_failure_does_not_hide_executed_result(bridge, monkeypatch):
    from afd import success
    from mechanic import server
    from mechanic.commands import core

    execute = AsyncMock(return_value=success({"done": True}))
    monkeypatch.setattr(core, "get_server", lambda: SimpleNamespace(execute=execute))

    def unavailable(*args):
        raise sqlite3.OperationalError("database locked")

    monkeypatch.setattr(server.storage, "save_command_result", unavailable)
    response = bridge.post("/api/execute", json={"command": "example.mutate"})
    assert response.status_code == 200
    assert response.json()["success"] is True
    execute.assert_awaited_once()


@pytest.mark.asyncio
async def test_broadcast_removes_dead_socket_and_delivers_to_healthy_socket():
    from mechanic.server import ConnectionManager

    manager = ConnectionManager()
    dead = SimpleNamespace(send_text=AsyncMock(side_effect=RuntimeError("closed")))
    healthy = SimpleNamespace(send_text=AsyncMock())
    manager.active_connections = [dead, healthy]
    await manager.broadcast("reload")
    healthy.send_text.assert_awaited_once_with("reload")
    assert manager.active_connections == [healthy]


@pytest.mark.asyncio
async def test_watcher_stop_wakes_idle_watch(monkeypatch, tmp_path):
    from mechanic import watcher

    started = asyncio.Event()

    async def idle_watch(*paths, stop_event):
        started.set()
        await stop_event.wait()
        if False:
            yield set()

    monkeypatch.setattr(watcher, "awatch", idle_watch)
    instance = watcher.SVWatcher([tmp_path])
    task = asyncio.create_task(instance.start())
    await asyncio.wait_for(started.wait(), 1)
    instance.stop()
    await asyncio.wait_for(task, 1)
    assert not instance.running


@pytest.mark.asyncio
async def test_watcher_no_paths_is_not_running():
    from mechanic.watcher import SVWatcher

    instance = SVWatcher([])
    await instance.start()
    assert not instance.running


def test_environment_priority(monkeypatch, tmp_path):
    from mechanic.config import load_environment

    desktop = tmp_path / "desktop.env"
    user = tmp_path / "user.env"
    desktop.write_text(
        "MECHANIC_REVIEW_SYSTEM=project\nMECHANIC_REVIEW_PROJECT=project\n"
    )
    user.write_text(
        "MECHANIC_REVIEW_SYSTEM=user\nMECHANIC_REVIEW_PROJECT=user\nMECHANIC_REVIEW_USER=user\n"
    )
    monkeypatch.setenv("MECHANIC_REVIEW_SYSTEM", "system")
    for name in ("MECHANIC_REVIEW_PROJECT", "MECHANIC_REVIEW_USER"):
        monkeypatch.setenv(name, "")  # Ensure dotenv additions are undone too.
        monkeypatch.delenv(name, raising=False)
    load_environment(desktop, user)
    import os

    assert os.environ["MECHANIC_REVIEW_SYSTEM"] == "system"
    assert os.environ["MECHANIC_REVIEW_PROJECT"] == "project"
    assert os.environ["MECHANIC_REVIEW_USER"] == "user"


def test_custom_data_dir_created(monkeypatch, tmp_path):
    from mechanic.config import get_data_dir

    location = tmp_path / "new" / "data"
    monkeypatch.setenv("MECHANIC_DATA_DIR", str(location))
    assert get_data_dir() == location
    assert location.is_dir()


def test_storage_closes_connections(monkeypatch, tmp_path):
    from mechanic import storage

    real_connect = sqlite3.connect
    connections = []

    def connect(*args, **kwargs):
        connection = real_connect(*args, **kwargs)
        connections.append(connection)
        return connection

    monkeypatch.setattr(storage.sqlite3, "connect", connect)
    db = storage.Storage(tmp_path / "history.db")
    db.save_command_result("test", {"success": True})
    assert len(db.get_command_history()) == 1
    db.clear_command_history()
    for connection in connections:
        with pytest.raises(sqlite3.ProgrammingError, match="closed"):
            connection.execute("SELECT 1")


@pytest.mark.asyncio
async def test_mcp_hyphenated_name_and_required_after_default(monkeypatch):
    # Mechanic's own adapter (mcp_server.create_mcp_server) registers every MCP
    # tool; the afd package's MCP layer is not used in production.
    pytest.importorskip("mcp.server.fastmcp")
    from afd import success
    from afd.server import create_server
    from mechanic.mcp_server import create_mcp_server

    server = create_server("regression")

    class Input(BaseModel):
        optional: str = "default"
        required: str

    @server.command(name="fencore-search", description="Search", input_schema=Input)
    async def search(input):
        return success(input.model_dump())

    mcp = create_mcp_server(server)
    tools = {tool.name: tool for tool in await mcp.list_tools()}
    assert tools["fencore-search"].inputSchema["required"] == ["required"]
    content = await mcp.call_tool("fencore-search", {"required": "needle"})
    if isinstance(content, tuple):
        content = content[0]
    text = "\n".join(block.text for block in content if hasattr(block, "text"))
    result = json.loads(text.split("--- Full Response ---", 1)[1])
    assert result["data"] == {"optional": "default", "required": "needle"}


@pytest.mark.asyncio
async def test_mcp_factory_defaults_are_evaluated_per_request():
    pytest.importorskip("mcp.server.fastmcp")
    from itertools import count

    from pydantic import Field

    from afd import success
    from afd.server import create_server

    sequence = count(1)

    class Input(BaseModel):
        nonce: int = Field(default_factory=lambda: next(sequence))

    from mechanic.mcp_server import create_mcp_server

    server = create_server("factory-regression")

    @server.command(name="factory.test", description="Factory test", input_schema=Input)
    async def command(input):
        return success(input.model_dump())

    mcp = create_mcp_server(server)

    async def nonce():
        content = await mcp.call_tool("factory-test", {})
        if isinstance(content, tuple):
            content = content[0]
        text = "\n".join(block.text for block in content if hasattr(block, "text"))
        return json.loads(text.split("--- Full Response ---", 1)[1])["data"]["nonce"]

    assert [await nonce(), await nonce(), await nonce()] == [1, 2, 3]

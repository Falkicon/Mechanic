import asyncio
import json
import logging
import sqlite3
from contextlib import asynccontextmanager
from importlib.resources import files
from pathlib import Path
from typing import Optional
from urllib.parse import urlsplit

from fastapi import FastAPI, Query, Request, WebSocket, WebSocketDisconnect
from fastapi.responses import JSONResponse
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel, Field
from starlette.middleware.trustedhost import TrustedHostMiddleware

from .config import get_config
from .storage import Storage

http_runtime_running = False


@asynccontextmanager
async def lifespan(app):
    global http_runtime_running
    http_runtime_running = True
    try:
        yield
    finally:
        http_runtime_running = False


app = FastAPI(title="Mechanic Desktop", lifespan=lifespan)
app.add_middleware(
    TrustedHostMiddleware, allowed_hosts=["localhost", "127.0.0.1", "[::1]"]
)
logger = logging.getLogger(__name__)


def is_same_origin(connection) -> bool:
    """Reject browser requests from other sites to the local command bridge."""
    origin = connection.headers.get("origin")
    if origin is None:  # Non-browser clients do not send Origin.
        return True
    try:
        parsed = urlsplit(origin)
        expected_scheme = (
            "https" if connection.url.scheme in {"https", "wss"} else "http"
        )
        return (
            parsed.scheme == expected_scheme
            and parsed.netloc.lower() == connection.headers.get("host", "").lower()
            and not parsed.path
            and not parsed.query
            and not parsed.fragment
        )
    except ValueError:
        return False


@app.middleware("http")
async def check_origin(request: Request, call_next):
    if not is_same_origin(request):
        return JSONResponse(
            {"detail": "Cross-origin requests are not allowed"}, status_code=403
        )
    return await call_next(request)


class ExecuteRequest(BaseModel):
    command: str = Field(min_length=1)
    input: dict = Field(default_factory=dict)


# Initialize storage using centralized config
config = get_config()
storage = Storage(config.data_dir / "mechanic.db")

# Mount dashboard folder
dashboard_path = Path(files("mechanic.dashboard"))
app.mount(
    "/dashboard", StaticFiles(directory=dashboard_path, html=True), name="dashboard"
)


class ConnectionManager:
    def __init__(self):
        self.active_connections: list[WebSocket] = []

    async def connect(self, websocket: WebSocket):
        await websocket.accept()
        self.active_connections.append(websocket)

    def disconnect(self, websocket: WebSocket):
        if websocket in self.active_connections:
            self.active_connections.remove(websocket)

    async def broadcast(self, message: str):
        async def send(connection):
            try:
                await asyncio.wait_for(connection.send_text(message), timeout=5)
            except Exception:
                self.disconnect(connection)

        await asyncio.gather(
            *(send(connection) for connection in tuple(self.active_connections))
        )


manager = ConnectionManager()


@app.get("/")
async def root():
    return {"status": "Mechanic Desktop is running", "ui": "/dashboard/", "api": "/api"}


@app.get("/health")
async def health():
    """Health check endpoint for monitoring."""
    return {"status": "healthy"}


@app.post("/api/execute")
async def execute_command(req: ExecuteRequest):
    """Bridge between FastAPI and AFD Server. Persists results to history."""
    from .commands.core import get_server

    server = get_server()
    name = req.command
    input_data = req.input

    result = await server.execute(name, input_data)

    # Convert result to dict for storage
    result_dict = (
        result.model_dump(mode="json")
        if hasattr(result, "model_dump")
        else dict(result)
    )

    # Save to history (skip internal commands like sv.discover, tools.status)
    skip_commands = {
        "sv.discover",
        "tools.status",
        "dashboard.metrics",
        "server.shutdown",
        "commands.list",
        "diagnostic.targets",
        "diagnostic.metrics",
    }
    if name and name not in skip_commands:
        addon = input_data.get("addon")
        try:
            storage.save_command_result(
                name, result_dict, addon if isinstance(addon, str) else None
            )
        except sqlite3.Error:
            # A history failure must not imply that an already executed mutation failed.
            logger.exception("Unable to persist command history for %s", name)

    return result


@app.get("/api/history")
async def get_history(
    command: Optional[str] = None, limit: int = Query(default=50, ge=1, le=1000)
):
    """Get command execution history."""
    history = storage.get_command_history(command, limit)
    return {"history": history}


@app.post("/api/history/clear")
async def clear_history(req: dict = None):
    """Clear command execution history."""
    command = req.get("command") if req else None
    count = storage.clear_command_history(command)
    return {"cleared": count, "command": command}


@app.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    if not is_same_origin(websocket):
        await websocket.close(code=1008)
        return
    await manager.connect(websocket)
    try:
        while True:
            await websocket.receive_text()
    except WebSocketDisconnect:
        pass
    finally:
        manager.disconnect(websocket)


async def notify_reload(update_info: dict):
    """
    Broadcaster for file watcher to call.
    Updates may carry only target candidates when a profile selection is required.
    """
    # Save to SQLite
    addon = update_info.get("addon")
    data = update_info.get("data")
    timestamp = update_info.get("timestamp")

    # Storage expects dict of addon_name -> data
    if isinstance(data, dict):
        storage.save_reload(timestamp, {addon: data})

    # Broadcast to UI
    payload = json.dumps(
        {
            "type": "reload",
            "addon": addon,
            "timestamp": timestamp,
            "data": data,
            "target": update_info.get("target"),
            "candidates": update_info.get("candidates", []),
        }
    )
    await manager.broadcast(payload)

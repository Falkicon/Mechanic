from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from fastapi.staticfiles import StaticFiles
from pathlib import Path
from typing import Optional
import json
import asyncio
from .storage import Storage
from .config import get_config

app = FastAPI(title="Mechanic Desktop")

# Initialize storage using centralized config
config = get_config()
storage = Storage(config.data_dir / "mechanic.db")

# Mount dashboard folder
dashboard_path = Path(__file__).parent.parent.parent / "dashboard"
app.mount("/dashboard", StaticFiles(directory=dashboard_path, html=True), name="dashboard")

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
        for connection in self.active_connections:
            await connection.send_text(message)

manager = ConnectionManager()

@app.get("/")
async def root():
    return {"status": "Mechanic Desktop is running", "ui": "/dashboard/", "api": "/api"}

@app.get("/health")
async def health():
    """Health check endpoint for monitoring."""
    return {"status": "healthy"}

@app.post("/api/execute")
async def execute_command(req: dict):
    """Bridge between FastAPI and AFD Server. Persists results to history."""
    from .commands.core import get_server
    server = get_server()
    name = req.get("command")
    input_data = req.get("input", {})
    
    result = await server.execute(name, input_data)
    
    # Convert result to dict for storage
    result_dict = result.model_dump() if hasattr(result, 'model_dump') else dict(result)
    
    # Save to history (skip internal commands like sv.discover, tools.status)
    skip_commands = {"sv.discover", "tools.status", "dashboard.metrics", "server.shutdown"}
    if name and name not in skip_commands:
        addon = input_data.get("addon")
        storage.save_command_result(name, result_dict, addon)
    
    return result

@app.get("/api/history")
async def get_history(command: Optional[str] = None, limit: int = 50):
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
    await manager.connect(websocket)
    try:
        while True:
            await websocket.receive_text()
    except WebSocketDisconnect:
        manager.disconnect(websocket)

async def notify_reload(update_info: dict):
    """
    Broadcaster for file watcher to call.
    update_info = {"addon": str, "timestamp": float, "data": dict}
    """
    # Save to SQLite
    addon = update_info.get("addon")
    data = update_info.get("data")
    timestamp = update_info.get("timestamp")
    
    # Storage expects dict of addon_name -> data
    storage.save_reload(timestamp, {addon: data})
    
    # Broadcast to UI
    payload = json.dumps({
        "type": "reload",
        "addon": addon,
        "timestamp": timestamp,
        "data": data
    })
    await manager.broadcast(payload)


# Mechanic Dashboard Reference

The Dashboard is a web-based UI that connects to the Mechanic server for real-time addon development.

## Starting the Dashboard

```bash
mech                        # Start server + open browser
mech dashboard              # Same as above
mech dashboard --port 8080  # Custom port (default: 8765)
mech dashboard --no-browser # Start server without opening browser
```

## Architecture

```
┌─────────────────┐    WebSocket    ┌─────────────────┐
│   Dashboard     │ ◄────────────── │  FastAPI Server │
│   (Browser)     │                 │   (Python)      │
└─────────────────┘                 └─────────────────┘
                                           │
                                    File Watcher
                                           │
                                           ▼
                                   ┌─────────────────┐
                                   │ SavedVariables  │
                                   │  (WTF folder)   │
                                   └─────────────────┘
```

## Features

### Real-Time SavedVariables Sync
- Watches `MechanicDB.lua` for changes
- Auto-parses on file modification
- Pushes updates via WebSocket

### Reload Trigger
- Click "Reload" button in dashboard
- Focuses WoW window
- Sends configured reload key (default: `/reload`)

### Addon Output View
- Displays errors, tests, console logs
- Formatted markdown rendering
- Copy to clipboard

### Metrics Display
- Reload count
- Last reload time
- Error/warning counts

## WebSocket API

### Connection
```javascript
const ws = new WebSocket("ws://localhost:8765/ws");

ws.onmessage = (event) => {
    const data = JSON.parse(event.data);
    switch (data.type) {
        case "sv_update":
            // SavedVariables changed
            updateUI(data.payload);
            break;
        case "reload_complete":
            // Reload was triggered
            showNotification("Reloaded!");
            break;
    }
};
```

### Message Types

| Type | Direction | Payload |
|------|-----------|---------|
| `sv_update` | Server → Client | Parsed SavedVariables |
| `reload_trigger` | Client → Server | `{ key: "F5" }` |
| `reload_complete` | Server → Client | `{ success: true }` |
| `error` | Server → Client | `{ message: "..." }` |

## REST API

### Execute Command
```http
POST /api/execute
Content-Type: application/json

{
    "command": "addon.lint",
    "input": { "addon": "MyAddon" }
}
```

### Response
```json
{
    "success": true,
    "data": { "warnings": 0, "errors": 0 },
    "reasoning": "No issues found"
}
```

### Available Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/execute` | POST | Execute AFD command |
| `/api/commands` | GET | List available commands |
| `/api/status` | GET | Server status |
| `/ws` | WS | WebSocket connection |

## Dashboard HTML

Located at: `desktop/dashboard/index.html`

Built with vanilla HTML/JS (no framework):
- Modern CSS with variables
- WebSocket client
- Fetch API for REST calls

### Key DOM Elements
```html
<div id="output"><!-- Addon output markdown --></div>
<div id="metrics"><!-- Reload metrics --></div>
<button id="reload-btn">Reload</button>
<button id="copy-btn">Copy Output</button>
```

## Configuration

### Server Settings
Environment variables or config file:

| Setting | Default | Description |
|---------|---------|-------------|
| `MECHANIC_PORT` | 8765 | Server port |
| `MECHANIC_HOST` | 127.0.0.1 | Bind address |
| `WOW_PATH` | Auto-detect | WoW installation |
| `RELOAD_KEY` | — | Key to send for reload |

### Account Discovery
```bash
mech call sv.discover
```

Returns:
```json
{
    "accounts": [
        {
            "name": "12345678#1",
            "path": "C:/WoW/_retail_/WTF/Account/12345678#1",
            "characters": ["CharName-Realm"]
        }
    ]
}
```

## Troubleshooting

### Dashboard Won't Connect
1. Check server is running: `mech dashboard`
2. Check port not in use: `netstat -an | findstr 8765`
3. Check firewall allows localhost

### SavedVariables Not Updating
1. Verify WoW path detected: `mech call sv.discover`
2. Check file watcher: Look for "Watching..." message
3. Force reload in WoW: `/reload`

### Reload Not Working (Dashboard UI)
1. Check WoW is focused
2. Verify reload key mapping
3. Use the Dashboard reload button (human users only)

> **Note for Agents**: Do NOT use `reload.trigger`. Ask the user to `/reload` in WoW and wait for confirmation.

## Development

### Running in Dev Mode
```bash
cd desktop
pip install -e .
mech dashboard
```

### Testing API
```bash
# List commands
curl http://localhost:8765/api/commands

# Execute command
curl -X POST http://localhost:8765/api/execute \
  -H "Content-Type: application/json" \
  -d '{"command": "addon.lint", "input": {"addon": "MyAddon"}}'
```

### Adding Dashboard Features
1. Modify `dashboard/index.html`
2. Add server endpoint in `server.py` if needed
3. Test via browser dev tools

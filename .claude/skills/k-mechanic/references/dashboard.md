# Mechanic Dashboard Reference

The dashboard is a local web UI served by the same process that holds the command registry. It is for people; agents use MCP. All behaviour comes from commands: the UI is a consumer of `/api/execute`.

## Starting it

```bash
mech dashboard                       # http://127.0.0.1:3100/dashboard/ (also the default for plain `mech`)
mech dashboard --port 8080 --no-browser
mech dashboard -w "<WTF/Account/<acct>/SavedVariables>" -s "<addon source folder>"
mech stop --port 3100
```

`--watch/-w` and `--src/-s` are repeatable. Without `--watch`, `sv.discover` finds accounts that contain `!Mechanic.lua`. `--auto-reload` (opt-in) sends `--reload-key` to the WoW window when watched sources change.

## Architecture

```
Browser (desktop/dashboard/*)  --/api/execute-->  FastAPI server (desktop/src/mechanic/server.py)
        ^  WebSocket /ws (server -> client)               |  command registry (same as MCP)
        |                                                 v
        +------- reload broadcast <------ SavedVariables file watcher (watcher.py)
```

The server binds to `127.0.0.1`, rejects requests whose `Origin` is not the same host, and is not authenticated. Do not expose it beyond localhost.

## HTTP routes

| Route | Method | Purpose |
|---|---|---|
| `/` | GET | Status JSON with the UI and API locations |
| `/health` | GET | `{"status": "healthy", "version": "...", "port": N}` (`port` is null when no HTTP server runs in the process) |
| `/api/execute` | POST | Body `{"command": "addon.lint", "input": {...}}`; returns the `CommandResult` and records history |
| `/api/history` | GET | Recent command results: `command`, `limit` (1-1000), `max_result_bytes` query parameters. Results above the size limit come back as a stub with `truncated: true` and `history_id` |
| `/api/history/{id}` | GET | One stored result in full |
| `/api/history/clear` | POST | Body `{"command": "..."}` optional; clears history |
| `/dashboard/` | GET | Static UI |
| `/ws` | WebSocket | Server pushes only; client messages are ignored |

History is bounded (1000 command rows, 200 reload rows; results over 1 MB are stored as a stub). The sidebar command list, version, port and status are rendered from `commands.list` and `/health`; there is no separate command-list route.

## WebSocket

The server pushes one message type when the watcher sees a reload:

```json
{"type": "reload", "addon": "...", "timestamp": "...", "data": {}, "target": {}, "candidates": []}
```

The dashboard treats it as an invalidation and re-reads the selected target. When several profiles match, `candidates` carries the options instead of a selection (same rule as `diagnostic.targets`).

## Views

Mechanic (addon output for the selected target), Command (schema-generated form or raw JSON for any command, with run history), Libraries (`libs.check/init/sync`), Settings (environment), Sandbox (`sandbox.test`). The **Reload** button only shows instructions: type `/reload` in game and wait for the sync. A diagnostic-target selector (from `diagnostic.targets`) scopes the Mechanic view and queue/read commands.

## File layout (`desktop/dashboard/`)

| File | Role |
|---|---|
| `index.html` | Markup only |
| `dashboard.css` | Styles (no external font request) |
| `render.js` | Pure rendering helpers (UMD, unit-tested under Node) |
| `schema-form.js` | Form generation from command input schemas |
| `state.js`, `api.js`, `views.js`, `app.js`, `ws.js`, `main.js` | State, HTTP client, views, shell and shortcuts, WebSocket client, startup |

Node regressions live in `tests/dashboard_*_regressions.cjs` (shared helper `tests/dashboard_harness.cjs`); run each with `node tests/<name>.cjs`. Escape any command output rendered into HTML (use the helpers in `render.js`).

## Configuration

| Setting | Meaning |
|---|---|
| `MECHANIC_WOW_ROOT` | WoW installation root (overrides discovery and `~/.mechanic/config.json`) |
| `MECHANIC_DEV_PATH` | The `_dev_` folder where addons are looked up |
| `MECHANIC_DATA_DIR` | History/data directory (default `~/.mechanic/data`) |
| `GEMINI_API_KEY` | Needed by `research.query` (`desktop/.env` or `~/.mechanic/.env`) |

Config file: `~/.mechanic/config.json` (see `desktop/config.json.example`); `mech setup` writes it.

## Troubleshooting

- Page does not load: confirm the process (`mech dashboard`), the port (default 3100) and that nothing else uses it. MCP over SSE uses 3101 by default.
- Output stays empty: SavedVariables only update on `/reload` or logout; check `mech call sv.discover` and `diagnostic.targets`.
- Stale target: a reload broadcast re-reads the selected target; pick the right one in the selector.

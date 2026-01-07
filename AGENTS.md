# Mechanic - Agent Documentation

Technical reference for AI agents working on the Mechanic project.

---
## The year is 2026. Your Year clock may be off!


## MCP Server (Primary)

Mechanic exposes all 53 commands as MCP tools. **ALWAYS use MCP tools directly** - this is the fastest and most reliable way to interact with the ecosystem.

### Key MCP Tools

| Tool | Description |
|------|-------------|
| `addon.output` | Get all errors, tests, console logs (after user confirms reload) |
| `addon.test` | Run Busted tests for an addon |
| `addon.lint` | Run Luacheck linter |
| `sandbox.test` | Run tests offline (no WoW needed) |
| `api.search` | Search WoW APIs (offline) |

### After In-Game Changes

**IMPORTANT**: Do NOT call `addon.output` immediately after code changes. The timing between reload and SavedVariables sync is unpredictable.

1. **Ask** the user to `/reload` in WoW
2. **Wait** for the user to confirm the reload is complete
3. **Then** call the `addon.output` MCP tool with `agent_mode=true` to get accurate results

---

## CLI Fallback (Users Only)

The `mech` CLI is for user interaction. AI agents should use MCP tools. Reference the CLI documentation only to understand the underlying command structure.

---

## Quick Reference

| Component | Path | Description |
|-----------|------|-------------|
| **WoW Addon** | `!Mechanic/` | In-game development hub |
| **Desktop Tool** | `desktop/` | Local companion (CLI + Dashboard) |
| **Specifications** | `PLAN/` | Phase plans and master spec |

---

## Project Structure

```
Mechanic/                   ← Git repo root
├── !Mechanic/              ← Bootstrap addon (loads first via ! prefix)
│   ├── !Mechanic.toc
│   ├── Bootstrap.lua
│   ├── MechanicQueue.lua
│   └── Libs/
├── Mechanic/               ← Main addon (full UI hub)
│   ├── Mechanic.toc
│   ├── Core.lua
│   ├── Utils.lua
│   ├── UI/
│   └── Libs/
├── desktop/                ← Mechanic Desktop
│   ├── pyproject.toml
│   ├── dashboard/          ← Web UI (vanilla HTML/JS)
│   ├── data/               ← SQLite database
│   ├── tests/              ← Pytest test suite (9 tests)
│   └── src/mechanic/
│       ├── cli.py          ← Click CLI entry point
│       ├── server.py       ← FastAPI + WebSocket
│       ├── watcher.py      ← SavedVariables file watcher
│       └── commands/       ← Command modules
│           ├── core.py       ← Base commands (sv.*, reload.*, etc.)
│           ├── development.py ← addon.validate, addon.lint, etc.
│           ├── release.py    ← version.bump, changelog.add, etc.
│           ├── locale.py     ← locale.validate, locale.extract
│           ├── atlas.py      ← atlas.scan, atlas.search
│           └── environment.py ← addon.create, addon.sync, libs.check
├── PLAN/                   ← Project-wide specs
├── AGENTS.md               ← This file
├── README.md
└── CHANGELOG.md
```

---

## ⚠️ CRITICAL: Development Standards

> **All new features MUST follow structured command principles.**

### Core Principles

1. **Commands First**: Every feature is a command with typed input/output schemas.
2. **Structured Results**: All commands return `CommandResult` with `success`, `data`, `error`.
3. **Actionable Errors**: Errors include `code`, `message`, and `suggestion` for recovery.
4. **Metadata for Trust**: Include `sources`, `reasoning`, and `confidence` where applicable.
5. **Headless Backend**: UI is a pure consumer of commands via `/api/execute` bridge.

### Command Template

```python
from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

class MyInput(BaseModel):
    param: str = Field(..., description="Input parameter")

class MyOutput(BaseModel):
    result: str

@server.command(
    name="feature.action",
    description="Description of what this command does",
    input_schema=MyInput,
    output_schema=MyOutput,
)
async def my_command(input: MyInput, context: Any = None) -> CommandResult[MyOutput]:
    src = create_source(type="file", id="my-source", title="Source Name")
    return success(
        data=MyOutput(result="value"),
        reasoning="Explanation of what happened",
        sources=[src],
        confidence=0.95
    )
```

---

## Command Reference

For the complete command reference with all 53 commands, see the **using-mechanic** skill:
`.claude/skills/using-mechanic/references/afd-commands.md`

### Command Categories (Summary)

| Category | Commands | File |
|----------|----------|------|
| Core | `sv.*`, `dashboard.*`, `server.*` | `core.py` |
| Development | `addon.validate`, `addon.lint`, `addon.format`, `addon.test`, `addon.deprecations` | `development.py` |
| Release | `version.bump`, `changelog.add`, `git.*`, `release.all` | `release.py` |
| Environment | `addon.create`, `addon.sync`, `libs.*`, `env.status`, `system.pick_file` | `environment.py` |
| Locale | `locale.validate`, `locale.extract` | `locale.py` |
| Atlas | `atlas.scan`, `atlas.search` | `atlas.py` |
| Lua | `lua.queue`, `lua.results` | `lua.py` |
| API | `api.search`, `api.info`, `api.list`, `api.queue`, `api.stats`, `api.populate`, `api.generate`, `api.refresh` | `api.py`, `apidefs.py` |
| Sandbox | `sandbox.generate`, `sandbox.status`, `sandbox.exec`, `sandbox.test` | `sandbox.py` |
| Tools | `tools.status` | `tools.py` |
| Output | `addon.output` | `output.py` |
| Docs | `docs.generate` | `docs.py` |
| Research | `research.query` | `research.py` |
| Assets | `assets.sync`, `assets.list` | `assets.py` |
| Perf | `perf.baseline`, `perf.compare`, `perf.report`, `perf.list` | `perf.py` |
| FenCore | `fencore-catalog`, `fencore-search`, `fencore-info` | `fencore.py` |

---

## Testing Requirements

All commands MUST have corresponding tests:

```python
import pytest
from afd.testing.assertions import assert_success, assert_error

@pytest.mark.asyncio
async def test_my_command_success():
    server = get_server()
    result = await server.execute("feature.action", {"param": "value"})
    assert_success(result)
```

Run tests: `pytest -v` from `desktop/`

Current test status: **9 tests passing**

---

## Development Workflow

1. **Environment Setup**:
   - Run `desktop/scripts/setup_dev_env.bat` to install Lua/C dependencies.
   - Verify with `mech call addon.test`.

2. **Adding a new feature**:
   - Create command in appropriate module (`development.py`, `release.py`, etc.)
   - Add tests in `desktop/tests/`
   - Run `pytest -v` to verify
   - Update `.claude/skills/using-mechanic/references/afd-commands.md` with the new command

3. **Documentation updates**:
   - Update this AGENTS.md for agent guidance
   - Update skill reference files for detailed command docs
   - Update README.md for user-facing docs
   - Update CHANGELOG.md for version history

---

## Agent Guidelines

1. **Diagnostic Hub First**: `!Mechanic` is now the architect of all ecosystem data. When you need to understand the state of the entire project (tests, perf, logs), trigger or trust the **Diagnostic Hub**.
2. **Addon work**: Navigate to `!Mechanic/` subfolder, reference its `AGENTS.md`.
3. **Desktop work**: Navigate to `desktop/` subfolder, follow command patterns.
4. **Always test**: Run `pytest` after making changes to `desktop/`.
5. **Reload Workflow**: After code changes, ask the user to `/reload` and wait for confirmation before calling `addon.output`. The timing between reload and SavedVariables sync is unpredictable.
6. **Junction links**: Must point to `!Mechanic/!Mechanic`, not root.

---

## Troubleshooting

### "Tool not found" (e.g., Busted)
If an agent encounters `TOOL_NOT_FOUND` errors:
1. Check if the tool exists in `desktop/bin/`.
2. Check if it's a `.bat` file (Mechanic supports both `.exe` and `.bat`).
3. For **Busted**: It requires C compilation. Run `desktop/scripts/setup_dev_env.bat`.
4. Ensure `luarocks` is in the system PATH.

### Wrong Language Displayed (Locale Overwrite Hazard)
If users report seeing Chinese/Russian/etc. instead of English:
1. **Cause**: Non-English locale files (e.g., `zhCN.lua`) are loaded unconditionally and overwrite English strings.
2. **Fix**: Every non-English locale file MUST start with a locale guard:
   ```lua
   if GetLocale() ~= "zhCN" then return end
   ```
3. **Why**: The TOC loads all locale files in order. Without the guard, the last file loaded wins (often Chinese or Russian if sorted alphabetically).

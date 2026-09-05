# Mechanic - Agent Documentation

Technical reference for AI agents working on the Mechanic project.

---
## Scope and source of truth

This file covers the bootstrap addon and desktop tool. Main-addon work also follows [Mechanic/AGENTS.md](Mechanic/AGENTS.md). Read current schemas through `commands.list`; package/TOC files define component versions. Historical plans and review reports describe their dated snapshots.


## MCP Server (Primary)

Mechanic exposes its registered commands through MCP. **Use connected MCP tools directly** for ecosystem operations. The enhanced MCP adapter uses dash names (for example, `addon-output`); this document uses registry names (`addon.output`).

If Mechanic MCP is unavailable, state that limitation and use source inspection and isolated offline checks for repository work. Do not substitute a live CLI operation or claim that offline checks verified installed game state.

### Key MCP Tools

| Tool | Description |
|------|-------------|
| `addon.output` | Get all errors, tests, console logs (after user confirms reload) |
| `addon.test` | Run Busted tests for an addon |
| `addon.lint` | Run Luacheck linter |
| `sandbox.test` | Run tests offline (no WoW needed) |
| `api.search` | Search local API definitions (offline) |
| `diagnostic.targets` | Discover client/account/character/profile identities |
| `diagnostic.metrics` | Read bounded desktop overhead and optional saved addon metrics |
| `commands.list` | Read schemas and mutation metadata |

### After In-Game Changes

**IMPORTANT**: Do NOT call `addon.output` immediately after code changes. The timing between reload and SavedVariables sync is unpredictable.

1. **Ask** the user to `/reload` in WoW
2. **Wait** for the user to confirm the reload is complete
3. **Then** call the `addon.output` MCP tool with `agent_mode=true` and the same explicit diagnostic target.

A worktree edit does not update an installed addon automatically. Complete offline checks first; live verification requires installing/syncing the changed addon and a confirmed reload. Documentation-only changes do not require a game reload.

---

## CLI Fallback (Users Only)

The `mech` CLI is for user interaction. AI agents should use MCP tools. Reference the CLI documentation only to understand the underlying command structure.

---

## Quick Reference

| Component | Path | Description |
|-----------|------|-------------|
| **Bootstrap Addon** | `!Mechanic/` | Registration library, early queues, and SavedVariables owner |
| **Main Addon** | `Mechanic/` | In-game UI and diagnostic aggregation |
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
│   ├── tests/              ← Isolated Pytest test suite
│   └── src/mechanic/
│       ├── cli.py          ← Click CLI entry point
│       ├── server.py       ← FastAPI + WebSocket
│       ├── watcher.py      ← SavedVariables file watcher
│       └── commands/       ← Command modules
│           ├── core.py       ← Base commands (sv.*, dashboard.metrics, server.shutdown)
│           ├── development.py ← addon.validate, addon.lint, etc.
│           ├── release.py    ← version.bump, changelog.add, etc.
│           ├── locale.py     ← locale.validate, locale.extract
│           ├── atlas.py      ← atlas.scan, atlas.search
│           ├── environment.py ← addon.create, addon.sync, libs.check
│           ├── catalog.py     ← schemas and mutation audit
│           ├── targets.py     ← diagnostic.targets
│           └── diagnostics.py ← diagnostic.metrics
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
6. **Mutation Audit**: Add every new command to the explicit read-only/mutating audit in `commands/catalog.py`; registry initialization rejects unaudited commands.
7. **Diagnostic Identity**: Use `diagnostic.targets` and pass the same target through queues and reads. Never choose a profile or client by newest-file/first-match heuristics.

### Command Template

```python
from typing import Any
from afd import CommandResult, success
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

For registered input/output schemas and mutation metadata, call `commands.list`. See [command reference](.claude/skills/using-mechanic/references/afd-commands.md) and [diagnostic workflow](docs/quality-improvements.md).

### Command Categories (Summary)

| Category | Commands | File |
|----------|----------|------|
| Diagnostics | `diagnostic.targets`, `diagnostic.metrics`, `commands.list` | `targets.py`, `diagnostics.py`, `catalog.py` |
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

Latest verified test status (2026-09-05): **243 tests passing** with MCP installed and `MECHANIC_LUA` set to a Lua 5.1 executable. Optional transport/Lua cases skip when their runtimes are absent.

Additional offline regressions: `lua tests/addon_regressions.lua`, `lua tests/overhead_regressions.lua`, `node tests/dashboard_regressions.cjs`, and `node tests/dashboard_schema_regressions.cjs` from the repository root. See `docs/quality-improvements.md` for current validation and the original review for deferred findings. Desktop tests must use temporary output/data directories; the shared fixture isolates configuration and discovery.

---

## Development Workflow

1. **Environment Setup**:
   - From `desktop/`, install the development dependencies with `python -m pip install -c constraints-dev.txt -e ".[dev]"`.
   - For Windows Lua/Busted compilation, see `desktop/scripts/setup_dev_env.bat`. It installs dependencies; do not run it just to inspect repository state.
   - Query `tools.status` through MCP before using external addon tools. `addon.test` requires an addon input.

2. **Adding a new feature**:
   - Create command in appropriate module (`development.py`, `release.py`, etc.)
   - Add the command to the explicit mutation audit in `commands/catalog.py`; registration rejects unaudited names.
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

1. **Diagnostic Hub First**: The bootstrap owns `MechanicDB`; the main addon aggregates ecosystem diagnostics into it. Discover a target and read its saved output after the confirmed reload. SQLite history is separate from that selected snapshot.
2. **Addon work**: Bootstrap code is in `!Mechanic/`; main addon code and its additional instructions are in `Mechanic/`. There is no separate bootstrap `AGENTS.md`.
3. **Desktop work**: Navigate to `desktop/` subfolder, follow command patterns.
4. **Verification**: Run `pytest` for desktop code changes, the relevant Lua/Node harnesses for addon/dashboard changes, and Ruff for Python. For documentation-only changes, verify paths, examples, and references against source.
5. **Reload Workflow**: After installing addon changes, ask the user to `/reload` and wait for confirmation before calling `addon.output`. Do not infer completion from elapsed time or watcher events.
6. **Addon links**: `<client>/Interface/AddOns/!Mechanic` must point to `<repo>/!Mechanic`; the sibling `Mechanic` link must point to `<repo>/Mechanic`. Each destination must contain its matching TOC. Never point either addon link at the repository root.
7. **Local data**: Default history is `~/.mechanic/data/mechanic.db`; `MECHANIC_DATA_DIR` overrides the directory. Keep fixtures and benchmarks in temporary paths. Read-only commands must not initialize directories or databases.

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

# Mechanic - Agent Documentation

Technical reference for AI agents working on the Mechanic project.

---
## Scope and source of truth

This file covers the bootstrap addon and the desktop tool. Main-addon work also follows [Mechanic/AGENTS.md](Mechanic/AGENTS.md). The skills in `.claude/skills/` hold task-specific guidance; [using-mechanic](.claude/skills/using-mechanic/SKILL.md) is the single home of the diagnostic-target and reload protocol. Read current schemas through `commands.list` (or the generated [command reference](.claude/skills/using-mechanic/references/afd-commands.md)); package/TOC files define component versions (at the time of writing: desktop 0.5.0 from `mechanic.__version__`, `!Mechanic` 1.4.6, `Mechanic` 1.3.7). Historical plans and review reports describe their dated snapshots.

## MCP Server (Primary)

Mechanic exposes its registered commands through MCP. **Use connected MCP tools directly** for ecosystem operations. The MCP adapter uses dash names (for example, `addon-output`); this document uses registry names (`addon.output`). The repo's `.mcp.json` starts `mech mcp` over stdio.

If Mechanic MCP is unavailable, state that limitation and use source inspection and isolated offline checks for repository work. Do not substitute a live CLI operation or claim that offline checks verified installed game state.

### Key MCP Tools

| Tool | Description |
|------|-------------|
| `diagnostic.targets` | Discover client/account/character/profile identities |
| `addon.output` | Get errors, tests, console logs (after the user confirms a reload) |
| `lua.queue` / `api.queue` / `lua.results` | Queue code or API tests for the next load; read the results |
| `addon.test`, `sandbox.test` | Busted tests / offline Core tests in the restricted sandbox |
| `addon.lint`, `addon.format` | Luacheck / StyLua |
| `api.search`, `api.info` | Search local API definitions (offline) |
| `diagnostic.metrics` | Bounded desktop overhead and optional saved addon metrics |
| `commands.list` | Schemas and mutation metadata for every command |

### After In-Game Changes

**IMPORTANT**: Do NOT call `addon.output` immediately after code changes. The timing between reload and SavedVariables sync is unpredictable.

1. Call `diagnostic.targets` and choose the target; pass the same explicit `target` to every queue and read call (never pick a profile by newest file or first match).
2. **Ask** the user to `/reload` in WoW.
3. **Wait** for the user to confirm the reload is complete.
4. **Then** call `addon.output` with `agent_mode=true` and the same target, and check its freshness timestamp.

A worktree edit does not update an installed addon automatically. Complete offline checks first; live verification requires installing/syncing the changed addon and a confirmed reload. Documentation-only changes do not require a game reload. Full protocol, mutation and `dry_run` rules, and error codes: [using-mechanic](.claude/skills/using-mechanic/SKILL.md).

---

## CLI (Users Only)

The `mech` CLI is for people. AI agents should use MCP tools. See [cli-commands](.claude/skills/k-mechanic/references/cli-commands.md) for the user-facing CLI; there is no `mech lint/test/format` and `mech call` takes one positional JSON argument (no `-i`).

---

## Quick Reference

| Component | Path | Description |
|-----------|------|-------------|
| **Bootstrap Addon** | `!Mechanic/` | MechanicLib, early queue, owns `MechanicDB` SavedVariables |
| **Main Addon** | `Mechanic/` | In-game UI hub and diagnostic aggregation |
| **Desktop Tool** | `desktop/` | Command registry, MCP server, CLI, dashboard |
| **Agent skills** | `.claude/` (canonical), `.agent/` (generated) | Skills, commands, protocol; see [.claude/AGENTS.md](.claude/AGENTS.md) |
| **Specifications** | `PLAN/` | Phase plans and master spec |

---

## Project Structure

```
Mechanic/                   <- Git repo root
├── !Mechanic/              <- Bootstrap addon (loads first via ! prefix)
│   ├── !Mechanic.toc
│   ├── Bootstrap.lua
│   ├── MechanicQueue.lua   <- Queue file the desktop writes (Lua / API tests)
│   └── Libs/               <- LibStub, MechanicLib (runtime copy)
├── Mechanic/               <- Main addon (in-game hub)
│   ├── Mechanic.toc
│   ├── Core.lua, Utils.lua, Settings.lua
│   ├── UI/                 <- Tabs (Inspect*, Console, Errors, Tests, Performance, Tools, API)
│   │   ├── APIDefs/        <- GENERATED API definitions (the only APIDefs tree)
│   │   └── Shared/
│   ├── Locales/
│   └── Libs/               <- Ace3, FenUI (synced), MechanicLib (editing source)
├── desktop/                <- Mechanic Desktop (Python package mechanic-desktop)
│   ├── pyproject.toml
│   ├── dashboard/          <- Web UI: index.html (markup), dashboard.css, render/state/api/views/app/ws/main/schema-form .js
│   ├── tests/              <- Isolated pytest suite
│   ├── scripts/            <- setup_dev_env.bat, wheel smoke test
│   └── src/mechanic/
│       ├── cli.py          <- Click CLI (mech)
│       ├── server.py       <- FastAPI + WebSocket (dashboard bridge)
│       ├── mcp_server.py   <- MCP adapter (dash names)
│       ├── watcher.py      <- SavedVariables file watcher
│       ├── targets.py      <- Diagnostic target discovery/selection
│       ├── validation.py   <- VALIDATION_ERROR for invalid input
│       ├── storage.py, config.py, parsers.py, setup.py, telemetry.py, sv_cache.py, utils.py
│       ├── lua_tokenizer.py, lua_structure.py, analysis_common.py  <- shared analyzer core
│       ├── resources/      <- Packaged data (deprecated_apis.json, checksums.json, Lua helpers); load via resource_path()
│       └── commands/       <- One module per command group (see categories below)
├── tests/                  <- Lua (*_regressions.lua) and Node (*_regressions.cjs) harnesses
├── sandbox/generated/      <- Generated WoW API stubs (git-ignored)
├── docs/, PLAN/            <- Documentation and specs
├── .claude/                <- Canonical skills/commands + generators (gen_command_reference.py, sync_ide.py)
├── .agent/                 <- GENERATED from .claude (do not edit)
├── AGENTS.md               <- This file
├── README.md
└── CHANGELOG.md
```

---

## CRITICAL: Development Standards

> **All new features MUST follow structured command principles.**

### Core Principles

1. **Commands First**: Every feature is a command with typed input/output schemas.
2. **Structured Results**: All commands return `CommandResult` with `success`, `data`, `error`.
3. **Actionable Errors**: Errors include `code`, `message`, and `suggestion` for recovery.
4. **Metadata for Trust**: Include `sources`, `reasoning`, and `confidence` where applicable.
5. **Headless Backend**: UI is a pure consumer of commands via the `/api/execute` bridge.
6. **Mutation Audit**: Add every new command to the explicit read-only/mutating audit in `commands/catalog.py`; registry initialization rejects unaudited commands.
7. **Diagnostic Identity**: Use `diagnostic.targets` and pass the same target through queues and reads. Never choose a profile or client by newest-file/first-match heuristics.
8. **Generated docs stay generated**: the command reference and `.agent/` are produced by scripts and guarded by tests (see Development Workflow).

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

Step-by-step (module registration, mutation audit, tests, regeneration): [k-desktop](.claude/skills/k-desktop/SKILL.md).

---

## Command Reference

For registered input/output schemas and mutation metadata, call `commands.list`. The generated [command reference](.claude/skills/using-mechanic/references/afd-commands.md) lists every command with its inputs; the diagnostic workflow is in [docs/quality-improvements.md](docs/quality-improvements.md).

### Command Categories (Summary)

60 commands are registered. `pytest` checks that every one is mentioned here (by name or as `group.*`).

| Category | Commands | File |
|----------|----------|------|
| Diagnostics | `diagnostic.targets`, `diagnostic.metrics`, `commands.list` | `targets.py`, `diagnostics.py`, `catalog.py` |
| Core | `sv.parse`, `sv.discover`, `dashboard.metrics`, `server.shutdown` | `core.py` |
| Development | `addon.validate`, `addon.lint`, `addon.format`, `addon.test`, `addon.deprecations` | `development.py` |
| Analysis | `addon.security`, `addon.complexity`, `addon.deadcode`, `docs.stale` | `security.py`, `complexity.py`, `deadcode.py`, `staledocs.py` |
| Release | `version.bump`, `changelog.add`, `git.commit`, `git.tag`, `release.all` | `release.py` |
| Environment | `addon.create`, `addon.sync`, `libs.check`, `libs.init`, `libs.sync`, `env.status`, `system.pick_file` | `environment.py` |
| Locale | `locale.validate`, `locale.extract` | `locale.py` |
| Atlas | `atlas.scan`, `atlas.search` | `atlas.py` |
| Lua | `lua.queue`, `lua.results` | `lua.py` |
| API | `api.search`, `api.info`, `api.list`, `api.queue`, `api.stats` | `api.py` |
| API definitions | `api.populate`, `api.generate`, `api.refresh`, `api.download` | `apidefs.py` |
| Sandbox | `sandbox.generate`, `sandbox.status`, `sandbox.exec`, `sandbox.test` | `sandbox.py` |
| Tools | `tools.status` | `tools.py` |
| Output | `addon.output` | `output.py` |
| Docs | `docs.generate` | `docs.py` |
| Research | `research.query` | `research.py` |
| Assets | `assets.sync`, `assets.list` | `assets.py` |
| Perf | `perf.baseline`, `perf.compare`, `perf.report`, `perf.list` | `perf.py` |
| FenCore | `fencore-catalog`, `fencore-search`, `fencore-info` | `fencore.py` |

The analyzers (`addon.security`, `addon.complexity`, `addon.deadcode`, `docs.stale`) share a Lua tokenizer and report `truncated`, `total_issues` and `read_errors`; they take a `limit` (default 200). `addon.deprecations` reads `resources/deprecated_apis.json`, currently a small seed that warns `DEPRECATION_DB_LIMITED`. `sandbox.exec`/`sandbox.test` run Lua in a restricted environment.

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

Run tests: `pytest -v` from `desktop/`.

Test status (last recorded run, desktop `pytest`, Python 3.13 with MCP installed and `MECHANIC_LUA` set to a Lua 5.1 executable): 707 tests collected, 700 passed (this run included the real-Lua and MCP cases). The 7 failures are all in `tests/test_locale_parity.py`; they belong to the locale cleanup that was still pending when this was recorded. Optional transport/Lua cases skip when their runtimes are absent. Parametrization makes an exact static count impossible; trust a fresh `pytest` run over any number written here.

Agent-doc guard: `desktop/tests/test_agent_docs.py` fails when the generated command reference or `.agent/` is stale, when a command is missing from this file's categories, or when skill front matter or relative links in `.claude/`, `.agent/` and the AGENTS files break.

Additional offline regressions from the repository root: `lua tests/<name>_regressions.lua` for each Lua harness (Lua 5.1) and `node tests/<name>_regressions.cjs` for each dashboard suite (`tests/dashboard_harness.cjs` is a shared helper, not a suite). Desktop tests must use temporary output/data directories; the shared fixture isolates configuration and discovery. CI (`.github/workflows/ci.yml`) runs these on every push and pull request.

---

## Development Workflow

1. **Environment Setup**:
   - From `desktop/`, install the development dependencies with `python -m pip install -c constraints-dev.txt -e ".[dev]"`. The command framework is the hosted `afd` package (`afd>=0.8.0,<0.9` in `pyproject.toml`, pinned in `constraints-dev.txt`); the repository no longer vendors a copy.
   - For Windows Lua/Busted compilation, see `desktop/scripts/setup_dev_env.bat`. It installs dependencies; do not run it just to inspect repository state. `mech setup` downloads checksum-verified Lua tools for the user.
   - Query `tools.status` through MCP before using external addon tools. `addon.test` requires an addon input.

2. **Adding a new feature**:
   - Create the command in the appropriate module under `desktop/src/mechanic/commands/` (new modules are registered in `commands/core.py`).
   - Add the command to the explicit mutation audit in `commands/catalog.py`; registration rejects unaudited names.
   - Add tests in `desktop/tests/`.
   - Run `pytest -v` and Ruff (`ruff check --select E4,E7,E9,F src tests` and `ruff format --check src tests`).
   - Regenerate the agent docs: `python .claude/gen_command_reference.py` then `python .claude/sync_ide.py`.
   - Add the command to the category table above.

3. **Documentation updates**:
   - Update this AGENTS.md for agent guidance; skills and commands live in `.claude/` (canonical; never edit `.agent/` by hand).
   - Regenerate `docs/cli-reference.md` with `docs.generate` (`mech docs`).
   - Update README.md for user-facing docs and CHANGELOG.md for version history.

---

## Agent Guidelines

1. **Diagnostic Hub First**: The bootstrap owns `MechanicDB`; the main addon aggregates ecosystem diagnostics into it. Discover a target and read its saved output after the confirmed reload. SQLite history is separate from that selected snapshot.
2. **Addon work**: Bootstrap code is in `!Mechanic/`; main addon code and its additional instructions are in `Mechanic/`. There is no separate bootstrap `AGENTS.md`. Addon Lua is Lua 5.1 (no `goto`, `bit32`, `//`).
3. **Desktop work**: Navigate to the `desktop/` subfolder and follow command patterns ([k-desktop](.claude/skills/k-desktop/SKILL.md)). Commands that touch API data follow [k-apidefs](.claude/skills/k-apidefs/SKILL.md).
4. **Verification**: Run `pytest` for desktop code changes, the relevant Lua/Node harnesses for addon/dashboard changes, and Ruff for Python. For documentation-only changes, verify paths, examples and references against source.
5. **Reload Workflow**: After installing addon changes, ask the user to `/reload` and wait for confirmation before calling `addon.output`. Do not infer completion from elapsed time or watcher events.
6. **Addon links**: `<client>/Interface/AddOns/!Mechanic` must point to `<repo>/!Mechanic`; the sibling `Mechanic` link must point to `<repo>/Mechanic`. Each destination must contain its matching TOC. Never point either addon link at the repository root. `addon.sync` with `dry_run` previews them.
7. **Local data**: Default history is `~/.mechanic/data/mechanic.db`; `MECHANIC_DATA_DIR` overrides the directory. Keep fixtures and benchmarks in temporary paths. Read-only commands must not initialize directories or databases.
8. **Releases**: always `release.all` with `dry_run` first and wait for the user's confirmation ([s-release](.claude/skills/s-release/SKILL.md)).
9. **Generated files**: do not hand-edit `Mechanic/UI/APIDefs/`, `.claude/skills/using-mechanic/references/afd-commands.md` or `.agent/`; regenerate them.

---

## Troubleshooting

### "Tool not found" (for example Busted, Luacheck, StyLua)
If an agent encounters `TOOL_NOT_FOUND` errors:
1. Call `tools.status` to see what is missing.
2. The user can run `mech setup` (checksum-verified downloads) or put the tools on PATH; Mechanic supports both `.exe` and `.bat` shims.
3. For **Busted**: it requires C compilation. Run `desktop/scripts/setup_dev_env.bat` or `mech setup-busted` for an existing LuaRocks install.
4. Ensure `luarocks` is in the system PATH.

### Wrong or missing language strings
Localization uses AceLocale-3.0 files in `Mechanic/Locales/`; follow the pattern in the current files rather than loading strings unconditionally, and use `locale.validate` for coverage. Run the locale tests (`desktop/tests/test_locale_parity.py`) after changing these files.

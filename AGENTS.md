# Mechanic - Agent Documentation

Technical reference for AI agents working on the Mechanic project.

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
!Mechanic/                  ← Git repo root
├── !Mechanic/              ← WoW addon (junction target)
│   ├── !Mechanic.toc
│   ├── Core.lua
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
│       └── commands/       ← AFD command modules
│           ├── core.py       ← Base commands (sv.*, reload.*, etc.)
│           ├── development.py ← addon.validate, addon.lint, etc.
│           ├── release.py    ← version.bump, changelog.add, etc.
│           ├── locale.py     ← locale.*, atlas.search
│           └── environment.py ← addon.create, addon.sync, libs.check
├── PLAN/                   ← Project-wide specs
├── AGENTS.md               ← This file
├── README.md
└── CHANGELOG.md
```

---

## ⚠️ CRITICAL: AFD Development Standards

> **All new features MUST follow Agent-First Development (AFD) principles.**
> Reference: https://github.com/Falkicon/afd

### Core Principles

1. **Commands First**: Every feature is an AFD command with typed input/output schemas.
2. **Structured Results**: All commands return `CommandResult` with `success`, `data`, `error`.
3. **Actionable Errors**: Errors include `code`, `message`, and `suggestion` for recovery.
4. **Metadata for Trust**: Include `sources`, `reasoning`, and `confidence` where applicable.
5. **Headless Backend**: UI is a pure consumer of commands via `/api/execute` bridge.

### AFD Command Template

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

## Complete AFD Command Reference

### Core Commands (core.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `sv.parse` | `file_path` | `SavedVariables` | Parse SavedVariables Lua file |
| `sv.discover` | (none) | `DiscoverOutput` | Auto-discover WoW accounts |
| `reload.trigger` | `key` | `ReloadOutput` | Focus WoW and send reload key |
| `dashboard.metrics` | (none) | `Dict` | Get latest reload metrics |
| `server.shutdown` | (none) | `ShutdownOutput` | Gracefully stop server via API |

### Development Commands (development.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `addon.validate` | `addon`, `path?` | `ValidationResult` | Validate .toc file |
| `addon.lint` | `addon`, `path?`, `fix?` | `LintResult` | Run Luacheck linter |
| `addon.format` | `addon`, `path?`, `check?` | `FormatResult` | Run StyLua formatter |
| `addon.test` | `addon`, `path?`, `coverage?` | `TestResult` | Run Busted tests |
| `addon.deprecations` | `addon`, `path?`, `fix?` | `DeprecationResult` | Scan deprecated APIs |

### Release Commands (release.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `version.bump` | `addon`, `version` | `VersionBumpResult` | Update .toc version |
| `changelog.add` | `addon`, `version`, `message`, `category?` | `ChangelogAddResult` | Add CHANGELOG entry |
| `git.commit` | `addon`, `message` | `GitCommitResult` | Stage and commit |
| `git.tag` | `addon`, `version`, `message?` | `GitTagResult` | Create version tag |

### Locale Commands (locale.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `locale.validate` | `addon` | `LocaleValidateResult` | Check locale coverage |
| `locale.extract` | `addon` | `LocaleExtractResult` | Find localizable strings |
| `atlas.search` | `query`, `limit?` | `AtlasSearchResult` | Search Blizzard icons |

### Environment Commands (environment.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `addon.create` | `name`, `template?`, `author?` | `AddonCreateResult` | Create from template |
| `addon.sync` | `addon`, `flavors?` | `AddonSyncResult` | Create junction links |
| `libs.check` | `addon`, `mode` | `LibsCheckResult` | Check library status |

### Output Commands (output.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `addon.output` | `agent_mode?` | `AddonOutputResult` | Get all addon data (errors, tests, console) as markdown |

> **Agent Mode**: Use `agent_mode: true` or CLI flag `--agent` for smart compression:
> - Groups errors by addon, deduplicates by file:line
> - Shows top 5 errors per addon with occurrence counts
> - **~70% smaller output** while preserving understanding

### Documentation Commands (docs.py)

| Command | Input | Output | Description |
|---------|-------|--------|-------------|
| `docs.generate` | `output_path?`, `format?` | `DocsGenerateOutput` | Auto-generate CLI reference from registered commands |

> **Self-Documenting**: Run `mech docs` to regenerate `docs/cli-reference.md` whenever commands change.

---

## CLI Commands

| Command | Description |
|---------|-------------|
| `mech` | Start dashboard (default) |
| `mech dashboard` | Start dashboard with options |
| `mech reload` | Trigger in-game reload |
| `mech stop` | Gracefully stop running server via API |
| `mech call <cmd>` | Execute any AFD command directly |
| `mech --agent call <cmd>` | Execute with agent-optimized output |
| `mech docs` | **Convenience**: generates docs/cli-reference.md from command registry |
| `mech release <addon> <ver> <msg>` | **Convenience**: chains version.bump → changelog.add → git.commit → git.tag |

### Global Flags

| Flag | Description |
|------|-------------|
| `--json` | Output raw JSON (for parsing) |
| `--quiet` | Suppress non-essential output |
| `--agent` | Smart compression for AI agents (groups, dedupes, limits) |

---

## Testing Requirements

All AFD commands MUST have corresponding tests:

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
   - Create AFD command in appropriate module (`development.py`, `release.py`, etc.)
   - Add tests in `desktop/tests/`
   - Run `pytest -v` to verify
   - Update this AGENTS.md command reference

2. **Documentation updates**:
   - Update this AGENTS.md for agent guidance
   - Update README.md for user-facing docs
   - Update CHANGELOG.md for version history

---

## Agent Guidelines

1. **Addon work**: Navigate to `!Mechanic/` subfolder, reference its AGENTS.md
2. **Desktop work**: Navigate to `desktop/` subfolder, follow AFD patterns
3. **Always test**: Run `pytest` after making changes to desktop/
4. **Use commands**: Prefer AFD commands over direct file manipulation
5. **Junction links**: Must point to `!Mechanic/!Mechanic`, not root

---

## Troubleshooting

### "Tool not found" (e.g., Busted)
If an agent encounters `TOOL_NOT_FOUND` errors:
1. Check if the tool exists in `desktop/bin/`.
2. Check if it's a `.bat` file (Mechanic supports both `.exe` and `.bat`).
3. For **Busted**: It requires C compilation. Run `desktop/scripts/setup_dev_env.bat`.
4. Ensure `luarocks` is in the system PATH.

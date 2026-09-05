# Contributing to Mechanic

Thanks for your interest in contributing! This document covers the development philosophy, architecture patterns, and guidelines for working on Mechanic.

---

## Project Philosophy

### Why Mechanic Exists

I found WoW addon development tooling to be fragmented, outdated, and disconnected from modern developer workflows. Documentation is scattered, tools don't talk to each other, and there's no integration with the AI-assisted workflows that have transformed other development ecosystems.

So I built the tooling I wished existed — bringing patterns from professional developer tooling to the addon community.

### What This Means for Contributors

- **Community-focused:** Features that benefit the addon community are prioritized
- **Open to ideas:** If you have a use case, open an issue — community feedback genuinely shapes the roadmap
- **Quality over quantity:** PRs should align with the project's architecture (see below)
- **Realistic timelines:** This is a passion project — I may not respond immediately, but I read everything

> 💡 **[Sponsoring the project](https://github.com/sponsors/Falkicon) helps prioritize work.** If there's a feature you need, sponsorship is a great way to signal that — it's not a guarantee, but it definitely helps.

Let's build better tooling for the addon community together.

---

## Core Principle: Command-First Development

Mechanic is built with a **command-first architecture** — a pattern where every feature is designed as a structured command that both humans and AI agents can use.

### What This Means in Practice

1. **Commands over UI-only features**
   - Desktop capabilities should be accessible through the shared command registry, CLI, and MCP
   - The dashboard is a *visualization* of command output, not a separate system
   - If an agent can't do it, it's incomplete

2. **Structured input/output**
   - Commands use typed schemas (Pydantic models)
   - Output includes `success`, `data`, `reasoning`, and `error` fields
   - Agents can parse results reliably

3. **Human-readable by default**
   - CLI output is formatted for terminal readability
   - JSON mode available for programmatic access (`--json`)
   - Markdown formatting for agent consumption

### Example: The Right Way

```python
# ✅ Good: Command with schema, accessible via CLI and dashboard
@server.command(
    name="addon.validate",
    description="Validate addon .toc file structure",
    input_schema=ValidateInput,
    output_schema=ValidateOutput,
)
async def validate_addon(input: ValidateInput, context: Any = None):
    # ... implementation
    return success(data=result, reasoning="Validated 15 fields")
```

```python
# ❌ Bad: Logic buried in UI handler, not accessible to agents
@app.post("/api/validate")
def validate_endpoint():
    # ... logic that can't be called from CLI
```

---

## Architecture Overview

```
┌─────────────────┐      /reload      ┌─────────────────┐      MCP/CLI    ┌─────────────────┐
│   In-Game Hub   │ ───────────────▶  │    Desktop      │ ◀────────────▶  │    Clients      │
│   (Lua Addon)   │   SavedVariables  │   (Python)      │   Commands      │                 │
└─────────────────┘                   └─────────────────┘                 └─────────────────┘
```

### The Three Layers

| Layer | Purpose | Technology |
|-------|---------|------------|
| **In-Game** | Data collection, live inspection, user interaction | Lua, AceAddon-3.0, FenUI |
| **Desktop** | Data aggregation, command execution, dashboard | Python, FastAPI, WebSocket |
| **Clients** | Agent access, automation, scripting | MCP, Click, shared command schemas |

### Data Flow

1. **In-Game** → `!Mechanic` owns `MechanicDB`; the main `Mechanic` addon aggregates data into the shared database
2. **On Reload** → WoW flushes SavedVariables to disk
3. **Watcher** → Desktop detects file change, parses Lua tables
4. **Storage** → Data persisted to SQLite for history
5. **Dashboard** → WebSocket invalidates the current view; the browser re-reads its selected diagnostic target
6. **Commands** → MCP/CLI reads use the same client/account/character/profile target; they do not merge unqualified SQLite history into a selected snapshot

**Key insight:** The in-game addon cannot push data in real-time. Game-to-desktop snapshots flow through SavedVariables on reload/logout; desktop-to-game queues are separate addon files loaded on reload. Design accordingly.

---

## Development Patterns

### 1. Commands Live in Modules

Commands are organized by domain in `desktop/src/mechanic/commands/`:

```
commands/
├── core.py        # sv.parse, sv.discover, server.shutdown
├── development.py # addon.validate, addon.lint, addon.format, addon.test
├── environment.py # addon.create, addon.sync, libs.check
├── release.py     # version.bump, changelog.add, git.commit, git.tag
├── locale.py      # locale.validate, locale.extract
├── atlas.py       # atlas.scan, atlas.search
├── catalog.py     # commands.list and mutation audit
├── targets.py     # diagnostic.targets
├── diagnostics.py # diagnostic.metrics
└── output.py      # addon.output (errors, tests, console)
```

### 2. Schema-First Design

Define your input/output schemas before implementing:

```python
class MyInput(BaseModel):
    addon: str = Field(..., description="Addon folder name")
    verbose: bool = Field(default=False, description="Include extra details")

class MyOutput(BaseModel):
    status: str
    details: List[str]
```

### 3. Use the Result Helpers

```python
from afd import success, error
from afd.core.metadata import create_source

# Success with data
return success(
    data=MyOutput(status="ok", details=["..."]),
    reasoning="Completed in 0.5s",
    sources=[create_source(type="file", id="result", title="Addon file", location="path/to/file.lua")]
)

# Failure with error
return error(
    code="ADDON_NOT_FOUND",
    message=f"Addon '{name}' does not exist",
    suggestion="Check the addon name and try again"
)
```

### 4. Dashboard Consumes Command Schemas

The dashboard loads `commands.list` and generates forms for all registered commands, including defaults, descriptions, and mutation status. Add accurate typed schemas and tests; do not maintain a second copy of command defaults in JavaScript. Complex inputs can use raw JSON.

Register every command in the explicit read-only/mutating audit in `commands/catalog.py`. File writes, code execution, process/UI actions, and commands with optional mutation must be classified accordingly. A read-only command must not create data directories or initialize a database on its first call.

For diagnostic commands, use the shared `DiagnosticTarget`/`SelectedTarget` models. For release/sync changes, preserve preview behavior and report partial completion with actionable recovery guidance.

---

## Adding a New Command

1. **Define schemas** in the appropriate module
2. **Implement the command** with `@server.command()` decorator
3. **Register the module** in `commands/core.py` and classify mutation in `commands/catalog.py`
4. **Write tests** through `server.execute` in `desktop/tests/`
5. **Update the command reference**, relevant usage docs, and changelog; add a CLI wrapper only if generic `call` is insufficient

### Checklist

- [ ] Input/output schemas defined with descriptions
- [ ] Command returns `success()` or `error()`
- [ ] Works via `mech call <command> '{...}'`
- [ ] Mutation classification is explicit; read-only behavior and previews match their claims
- [ ] Error cases handled gracefully
- [ ] Tests cover happy path and edge cases
- [ ] AGENTS.md updated

---

## Code Style

### Python (Desktop)

- **Formatter:** Ruff; CI runs `ruff format --check src/ tests/`
- **Lint:** Ruff correctness rules `E4,E7,E9,F`, pinned in `desktop/constraints-dev.txt`; broader modernization debt is recorded in the [review](docs/quality-review-2026-09-05.md)
- **Type hints:** Required for public functions and schemas
- **Docstrings:** Required for commands, optional elsewhere

### Lua (Addon)

- **Formatter:** StyLua (run `mech call addon.format`)
- **Linter:** Luacheck (run `mech call addon.lint`)
- **Patterns:** Event-driven, no OnUpdate polling, static frame pools

---

## Testing

### Running Tests

```bash
cd desktop
python -m pip install -c constraints-dev.txt -e ".[dev]"
python -m pytest -v
python -m ruff check src tests
python -m ruff format --check src tests
```

The shared pytest fixture isolates home/config/data paths and WoW discovery. Use temporary fixtures; never read or write a developer's installed addon or saved diagnostic history from a test. Install the MCP extra for transport coverage and set `MECHANIC_LUA` to a Lua 5.1 executable for the real bootstrap contract. Missing optional runtimes cause those cases to skip.

From the repository root, run `lua5.1 tests/addon_regressions.lua`, `lua5.1 tests/overhead_regressions.lua`, `node tests/dashboard_regressions.cjs`, and `node tests/dashboard_schema_regressions.cjs` for addon/dashboard changes. CI also builds and smoke-tests the installed wheel, including packaged dashboard assets.

### Test Philosophy

- Test commands via the server (integration-style)
- Mock external dependencies (file system, WoW client)
- Focus on the contract (input → output), not implementation details

---

## Pull Request Guidelines

### Before Submitting

1. **Explain the use case** — Why is this change valuable?
2. **Keep it focused** — One feature/fix per PR
3. **Verify your changes** — Run the relevant automated checks. For installed addon changes, include live reload validation when available; clearly state when only offline checks ran. Documentation-only edits need link/example verification rather than a game reload.
4. **Update docs** — AGENTS.md, README if needed

### PR Template

```markdown
## What

Brief description of the change.

## Why

What problem does this solve? How will it be used?

## Testing

How did you verify this works?

## Checklist

- [ ] Commands follow structured patterns
- [ ] Tests added/updated
- [ ] Documentation updated
```

---

## Questions?

Open an issue or start a discussion. I can't promise quick responses, but I do read everything.

---

<p align="center">
  <em>Build better addons, faster.</em>
</p>

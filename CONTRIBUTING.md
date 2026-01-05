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
- **Quality over quantity:** PRs should align with the project's architecture (see AFD below)
- **Realistic timelines:** This is a passion project — I may not respond immediately, but I read everything

> 💡 **[Sponsoring the project](https://github.com/sponsors/Falkicon) helps prioritize work.** If there's a feature you need, sponsorship is a great way to signal that — it's not a guarantee, but it definitely helps.

Let's build better tooling for the addon community together.

---

## Core Principle: Agent-First Development (AFD)

Mechanic is built on **AFD (Agent-First Development)** — a pattern where every feature is designed as a structured command that both humans and AI agents can use.

### What This Means in Practice

1. **Commands over UI-only features**
   - Every capability should be accessible via CLI
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
┌─────────────────┐      /reload      ┌─────────────────┐      mech       ┌─────────────────┐
│   In-Game Hub   │ ───────────────▶  │    Desktop      │ ◀────────────▶  │   Agent CLI     │
│   (Lua Addon)   │   SavedVariables  │   (Python)      │   Commands      │                 │
└─────────────────┘                   └─────────────────┘                 └─────────────────┘
```

### The Three Layers

| Layer | Purpose | Technology |
|-------|---------|------------|
| **In-Game** | Data collection, live inspection, user interaction | Lua, AceAddon-3.0, FenUI |
| **Desktop** | Data aggregation, command execution, dashboard | Python, FastAPI, WebSocket |
| **CLI** | Agent access, automation, scripting | Click, AFD commands |

### Data Flow

1. **In-Game** → Addon writes to `MechanicDB` (SavedVariables)
2. **On Reload** → WoW flushes SavedVariables to disk
3. **Watcher** → Desktop detects file change, parses Lua tables
4. **Storage** → Data persisted to SQLite for history
5. **Dashboard** → WebSocket pushes update to browser
6. **CLI** → Same data available via `mech addon.output`

**Key insight:** The in-game addon cannot push data in real-time. All data flows through SavedVariables on `/reload`. Design accordingly.

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
├── localization.py# locale.validate, locale.extract, atlas.search
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
from afd import success, failure

# Success with data
return success(
    data=MyOutput(status="ok", details=["..."]),
    reasoning="Completed in 0.5s",
    sources=["path/to/file.lua"]
)

# Failure with error
return failure(
    code="ADDON_NOT_FOUND",
    message=f"Addon '{name}' does not exist",
    suggestion="Check the addon name and try again"
)
```

### 4. Dashboard Mirrors CLI

If you add a command, consider whether it should appear in the dashboard:

- **Yes:** Core workflow commands (validate, lint, test, output)
- **Maybe:** Utility commands (atlas.search, libs.check)
- **No:** Internal commands (sv.parse, server.shutdown)

The dashboard calls commands via the same server the CLI uses. Never add dashboard-only logic.

---

## Adding a New Command

1. **Define schemas** in the appropriate module
2. **Implement the command** with `@server.command()` decorator
3. **Add CLI wrapper** if it needs special argument handling
4. **Write tests** in `desktop/tests/`
5. **Update AGENTS.md** with command documentation

### Checklist

- [ ] Input/output schemas defined with descriptions
- [ ] Command returns `success()` or `failure()`
- [ ] Works via `mech call <command> -i '{...}'`
- [ ] Error cases handled gracefully
- [ ] Tests cover happy path and edge cases
- [ ] AGENTS.md updated

---

## Code Style

### Python (Desktop)

- **Formatter:** We don't enforce one, but be consistent
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
pytest -v
```

### Test Philosophy

- Test commands via the server (integration-style)
- Mock external dependencies (file system, WoW client)
- Focus on the contract (input → output), not implementation details

---

## Pull Request Guidelines

### Before Submitting

1. **Explain the use case** — Why is this change valuable?
2. **Keep it focused** — One feature/fix per PR
3. **Test your changes** — At minimum, manual testing
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

- [ ] Commands follow AFD patterns
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

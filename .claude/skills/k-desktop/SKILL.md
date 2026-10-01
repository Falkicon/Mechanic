---
name: k-desktop
description: >
  How to change Mechanic Desktop (the Python tool in desktop/): layout, adding
  or changing a command, the mandatory read-only/mutating audit in catalog.py,
  input validation, tests, regenerating the command reference, and the checks
  to run. Load when editing desktop/src/mechanic, dashboard or desktop tests.
  Triggers: add command, new command, desktop, python, pytest, ruff, catalog,
  mutation audit, command schema, afd, MCP adapter.
---

# Mechanic Desktop development

Mechanic Desktop is the Python half of Mechanic: a command registry exposed three ways (MCP, CLI, dashboard HTTP bridge). Features are commands first; UI and docs consume them.

## Layout

| Path | Role |
|---|---|
| `desktop/pyproject.toml` | Package (`mechanic-desktop`; version single-sourced from `mechanic.__version__`), dependencies (including the hosted `afd` command framework, `afd>=0.8.0,<0.9`, pinned in `constraints-dev.txt`; there is no vendored copy), extras, console scripts `mech`/`mechanic` |
| `desktop/src/mechanic/commands/*.py` | One module per command group, each with `register_commands(server)` |
| `desktop/src/mechanic/commands/core.py` | Builds the server, registers every module, runs the mutation audit, installs input validation and timing |
| `desktop/src/mechanic/commands/catalog.py` | `READ_ONLY` / `MUTATING` sets and `commands.list` |
| `desktop/src/mechanic/{cli,server,mcp_server,watcher,targets,storage,config,validation}.py` | CLI, FastAPI app, MCP adapter, SavedVariables watcher, diagnostic targets, history DB, configuration, `VALIDATION_ERROR` |
| `desktop/src/mechanic/{lua_tokenizer,lua_structure,analysis_common}.py` | Shared Lua tokenizer and analyzer helpers used by deadcode/security/complexity/docs.stale |
| `desktop/src/mechanic/resources/` | Packaged data (`deprecated_apis.json`, `checksums.json`, Lua helpers); load with `resource_path(name)`, never by walking up from `__file__` |
| `desktop/dashboard/` | Static web UI ([dashboard reference](../k-mechanic/references/dashboard.md)) |
| `desktop/tests/` | Pytest suite (isolated config, data and WoW discovery via `conftest.py`) |
| `tests/` (repo root) | Lua (`*_regressions.lua`) and Node (`*_regressions.cjs`) harnesses |

## Adding a command

1. **Module**: add `@server.command(name="group.action", description=..., input_schema=Model, output_schema=Model)` inside `register_commands(server)` of the right `commands/*.py` (new module: also register it in `core.py`).
2. **Schemas**: pydantic models with a `Field(..., description=...)` on every input; defaults must be real defaults, not sentinel hacks. Anything that touches an installed client takes `target: Optional[DiagnosticTarget]` and resolves it with `select_target` (`targets.py`), turning `TargetError` into `exc.result()`.
3. **Results**: return `success(data, reasoning=..., sources=[...], warnings=[...])` or `error(code=..., message=..., suggestion=...)`. Error codes are stable API; make the suggestion actionable.
4. **Blocking work** (subprocess, file scans, SQLite) goes through `asyncio.to_thread` or `asyncio.create_subprocess_exec`; never block the event loop, and never print to stdout (it carries the MCP stdio protocol).
5. **Mutation audit (mandatory)**: add the name to `READ_ONLY` or `MUTATING` in `catalog.py`. Registration raises `Missing mutation audit for <name>` otherwise. Mutating means persistent writes, launched processes or UI, or code execution; a command with `dry_run` stays mutating. Read-only commands must not create directories or databases.
6. **Input validation** is automatic: invalid input returns `VALIDATION_ERROR` with `error.details.errors` before your handler runs.
7. **Tests** in `desktop/tests/test_<area>.py`: `result = await get_server().execute("group.action", {...})`, then `assert_success` / `assert_error` (`afd.testing.assertions`) and check `data`. Use `tmp_path` for addon fixtures; the shared fixture isolates `~/.mechanic` and WoW discovery. Add a regression test for every bug fix.
8. **Regenerate the agent command reference and mirror it** (below), then update the human docs (`docs/cli-reference.md` via `docs.generate`, README, CHANGELOG).
9. If the command needs new data files, put them in `resources/` and make sure `pyproject.toml` package-data covers the extension.

## Regenerating generated docs

```bash
python .claude/gen_command_reference.py   # .claude/skills/using-mechanic/references/afd-commands.md from the registry
python .claude/sync_ide.py                # .agent/ mirror of skills, commands (as workflows) and rules
```

`desktop/tests/test_agent_docs.py` fails when either is stale, when counts or mutation flags drift, and when skill front matter or relative links break. `gen_command_reference.py` imports the installed `mechanic` package (`pip install -e desktop`); `sync_ide.py` needs only Python.

## Checks before finishing

From `desktop/` (install: `python -m pip install -c constraints-dev.txt -e ".[dev]"`):

```bash
pytest -q                                      # set MECHANIC_LUA to a Lua 5.1 executable to enable the Lua contract tests
ruff check --select E4,E7,E9,F src tests && ruff format --check src tests
```

From the repository root: `lua tests/<name>_regressions.lua` (Lua 5.1, each file), `node tests/<name>_regressions.cjs` (each dashboard suite; `tests/dashboard_harness.cjs` is a helper), and `luacheck "!Mechanic/" "Mechanic/" --config .luacheckrc`. CI runs all of these (`.github/workflows/ci.yml`). Never claim installed-game behaviour from offline checks ([using-mechanic](../using-mechanic/SKILL.md)).

## Conventions

- Registry names are dotted (`addon.output`); the MCP adapter converts dots to dashes; `fencore-*` are registered with dashes.
- Tests must use temporary data/config directories; never touch `~/.mechanic` or a real WoW install.
- Read-only commands that analyze an addon accept `addon` and an optional `path` override and resolve it with `find_addon_path`.
- Keep the CLI thin: `mech call` and the shortcuts only run registered commands.

Related: [k-apidefs](../k-apidefs/SKILL.md) (APIDefs generation), [k-mechanic](../k-mechanic/SKILL.md) (architecture), [s-test](../s-test/SKILL.md) (addon tests).

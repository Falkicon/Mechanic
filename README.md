# Mechanic

**In-game diagnostics and desktop commands for WoW addon development.**

![Interface](https://img.shields.io/badge/Interface-120100-green)
![Python](https://img.shields.io/badge/Python-3.10%2B-3776AB?logo=python&logoColor=white)
[![GitHub](https://img.shields.io/badge/GitHub-Falkicon%2FMechanic-181717?logo=github)](https://github.com/Falkicon/Mechanic)
[![Sponsor](https://img.shields.io/badge/Sponsor-pink?logo=githubsponsors)](https://github.com/sponsors/Falkicon)

Mechanic combines a WoW diagnostic hub, a local desktop dashboard, and a shared command registry for CLI and MCP clients. The project is in alpha; interfaces and workflows may change. Both addon TOCs declare `## Interface: 120100, 16001` (Retail 12.1.0 and WoW: Forever).

[Quick start](#quick-start) · [Agent guidance](AGENTS.md) · [Contributing](CONTRIBUTING.md) · [Roadmap](PLAN/ROADMAP.md) · [Changelog](CHANGELOG.md) · [Addon changelog](Mechanic/CHANGELOG.md)

## What it provides

| Area | Capabilities |
|---|---|
| In-game hub | Frame inspection, console logs, BugGrabber errors, addon tests, performance metrics, tools, and API testing |
| Desktop dashboard | Saved diagnostic output, explicit client/account/character/profile selection, command forms generated from schemas, and raw JSON input |
| Shared commands | 60 registered commands for diagnostics, addon development, libraries, localization, assets, API research, and releases |
| Queue workflow | Queue Lua snippets or API tests, reload in game, then read the selected profile's saved results |
| Offline testing | Python command tests and Lua sandbox tests (restricted Lua 5.1 environment with generated WoW API stubs) without a running WoW client |
| Release and sync | Preview plans, preflight checks, mutation metadata, and partial-failure recovery guidance |

Use `commands.list` for current input/output schemas and mutation metadata. See the [quality improvements guide](docs/quality-improvements.md) for targeting, previews, metrics, and validation limits.

## Quick start

You need Python 3.10+ for the desktop tool. A WoW installation is needed for in-game diagnostics; offline tests can run without one. Git and external Lua tools are required by the commands that use them.

1. Install the repository's **two addon folders** as siblings under your client's `Interface/AddOns/`: `!Mechanic/` and `Mechanic/`. Copy or link each folder containing its matching TOC, not the repository root. The main addon depends on the bootstrap addon.
2. From the repository root, install the desktop tool:

   ```bash
   cd desktop
   python -m pip install -e .
   mech setup
   mech dashboard
   ```

3. Open `http://localhost:3100/dashboard/` if the browser does not open automatically. Enable both addons in WoW, reload, then choose a diagnostic target in the dashboard.

`mech setup` discovers configuration and installs development tools; it does not install both addon folders for you. Windows has the most complete desktop integration; platform-specific setup, file picking, links, and reload automation have limitations elsewhere. See [desktop setup and configuration](desktop/README.md).

The desktop watches SavedVariables on disk. The data reflects the last save/reload, not a live stream from WoW. With several accounts or profiles, select a target explicitly. If none are discovered, check the configured client paths and save/reload the enabled addons.

## Commands for terminal users

`mech` and `mechanic` are equivalent entry points. JSON is a positional argument to `call`; global flags go before the subcommand.

```bash
# List commands and inspect one command's parameters
mech commands
mech commands --detail lua.queue

# Discover diagnostic identities and read complete command schemas
mech --json call diagnostic.targets
mech --json call commands.list

# Validate TOC structure; linting and tests are separate commands
mech call addon.validate '{"addon": "MyAddon"}'
mech call addon.lint '{"addon": "MyAddon"}'

# Search the locally available API definitions
mech call api.search '{"query": "*Spell*", "limit": 10}'

# Read desktop overhead metrics without loading game data
mech --json call diagnostic.metrics
```

For a queue round trip, copy a matching identity from `diagnostic.targets`. This example uses placeholder paths and names:

```bash
mech call lua.queue '{"target":{"client":"C:/Games/World of Warcraft/_retail_","account":"ACCOUNT","character":"Hero - Realm","profile":"Raid"},"code":["return GetMoney()/10000"],"labels":["gold"]}'
# Reload WoW on the selected character and wait for completion.
mech --json call lua.results '{"target":{"client":"C:/Games/World of Warcraft/_retail_","account":"ACCOUNT","character":"Hero - Realm","profile":"Raid"}}'
```

Use the same target with `api.queue` and `addon.output`. An omitted target succeeds only when exactly one candidate matches. Queue files are shared within a client installation; character/profile guards prevent execution on a mismatched character or profile. See the [targeting limitations](docs/quality-improvements.md#select-a-diagnostic-target), including shared profiles and runtime account identity.

### MCP for agents

Install MCP support with `python -m pip install -e ".[mcp]"` from `desktop/`, then configure your MCP client to launch `mech mcp` using that environment. The default transport is stdio. `mech mcp --transport sse` serves SSE on `127.0.0.1:3101` (change with `--host`/`--port`); SSE has no authentication and exposes mutating commands (git, release, Lua queues), so keep it on localhost. Agents should use the connected MCP tools directly and follow [AGENTS.md](AGENTS.md).

The enhanced MCP adapter replaces dots with dashes in tool names: `addon.output` becomes `addon-output`, and `diagnostic.targets` becomes `diagnostic-targets`. Registry, CLI, and dashboard names retain dots.

After a user confirms an in-game reload, an agent can call `addon.output` with `agent_mode: true` and the selected target. Never treat a file notification or elapsed time as confirmation that the requested reload completed.

### Release previews

```bash
# Inspect the plan before making a release
mech --json call release.all '{"addon":"MyAddon","version":"1.2.0","message":"Added a feature","dry_run":true}'

# Preview configured addon links and library copies
mech --json call addon.sync '{"addon":"MyAddon","dry_run":true}'
mech --json call libs.sync '{"addon":"MyAddon","dry_run":true}'
```

Run the selected operation with `dry_run: false` to apply it. `release.all` updates the TOC/changelog, commits addon changes, and tags the commit. It reports completed steps and recovery guidance if a later step fails; it does not roll changes back automatically. `mech release ADDON VERSION MESSAGE` runs the same `release.all` command (add `--dry-run` to preview and `--category` to choose the changelog section); `--skip-tag` was removed.

### Offline Lua tests

```bash
mech call sandbox.generate
mech call sandbox.test '{"addon":"MyAddon"}'
```

`sandbox.test` needs only a Lua 5.1 interpreter (found by `mech setup`, `MECHANIC_LUA` or `PATH`); stubs from `sandbox.generate` are optional and come from the generated API definitions. Code runs in a restricted environment (no `os`, `io`, or `require` outside the addon folder; 30 second limit for `sandbox.exec`, 60 seconds for `sandbox.test`). Stubs support testing addon logic, but do not reproduce protected APIs, rendering, or every WoW runtime behavior. See the [testing guide](docs/integration/testing.md).

## Architecture

```text
Mechanic/                       # Repository root
├── !Mechanic/                  # Bootstrap addon; loads registration API and queues
│   ├── !Mechanic.toc
│   ├── Bootstrap.lua
│   └── MechanicQueue.lua
├── Mechanic/                   # Main addon; depends on !Mechanic
│   ├── Mechanic.toc
│   ├── Core.lua
│   ├── Bindings.xml
│   └── UI/
├── desktop/
│   ├── src/mechanic/           # Commands, CLI, MCP, HTTP, watcher, parser, storage
│   ├── src/mechanic/resources/ # Packaged data (tool checksums, Lua runner/framework, deprecation seed)
│   ├── dashboard/              # Packaged HTML/CSS/JS interface (index.html, dashboard.css, render/state/api/views/app/ws/main/schema-form .js)
│   ├── tests/
│   └── pyproject.toml
├── tests/                      # Offline Lua and dashboard regressions
├── docs/
└── PLAN/
```

The bootstrap owns `MechanicDB` SavedVariables and early queue processing. The main addon aggregates registered addon data into that shared database. WoW writes it to `!Mechanic.lua` on reload/logout. The desktop watcher broadcasts changes, and the dashboard reads its selected target through `/api/execute`. SQLite stores desktop history separately (bounded, with oversized results stored as stubs); its default location is `~/.mechanic/data/mechanic.db`, configurable with `MECHANIC_DATA_DIR`. The structured-command framework is the hosted [`afd`](https://pypi.org/project/afd/) package (`afd>=0.8.0,<0.9`), declared in `desktop/pyproject.toml`.

The desktop server binds to `127.0.0.1` and checks local hosts and browser origins. It is a trusted local development tool: commands can write files and execute code with your user permissions. See [SECURITY.md](SECURITY.md).

## Development and validation

```bash
cd desktop
python -m pip install -c constraints-dev.txt -e ".[dev]"
python -m pytest -v
python -m ruff check src tests
python -m ruff format --check src tests
```

From the repository root, run the standalone regressions with Lua 5.1 and Node. CI runs every `tests/*_regressions.lua` and `tests/*_regressions.cjs` file (`tests/dashboard_harness.cjs` is a shared helper, not a suite):

```bash
for suite in tests/*_regressions.lua; do lua5.1 "$suite"; done
for suite in tests/*_regressions.cjs; do node "$suite"; done
```

Set `MECHANIC_LUA` to a Lua 5.1 executable to enable the Python-to-Lua queue contract tests and the sandbox tests. The MCP adapter tests run with the `dev` extra. The Python suite has about 700 tests. CI is configured for Python 3.10–3.13 on Windows and Linux, plus wheel smoke, MCP, dashboard, Lua, and lint jobs; it has not been run on GitHub for this tree. See [validation evidence and limits](docs/quality-improvements.md#verified-locally-on-2026-09-05) (a dated snapshot).

## Keybindings

In WoW's Key Bindings settings, assign **Reload UI (Dev)** and **Toggle Mechanic Panel** (`Bindings.xml` cannot set defaults). `Ctrl+Shift+R` and `Ctrl+Shift+M` are only suggestions. Source-watch auto-reload (`mech dashboard --auto-reload --src PATH`) has optional Windows/macOS helpers and requires the configured key to match your in-game binding.

## Documentation

| Document | Purpose |
|---|---|
| [Desktop README](desktop/README.md) | Installation, configuration, and CLI usage |
| [Agent instructions](AGENTS.md) | Command standards, diagnostic targets, and reload workflow |
| [Addon integration](docs/addon-integration.md) | Register an addon with MechanicLib |
| [Integration guides](docs/integration/cli-workflow.md) | Console, tests, performance, tools, inspect, errors, SavedVariables, release, CurseForge, troubleshooting |
| [Addon architecture](docs/addon-architecture.md) | Three-layer design for testable addons |
| [Addon development guide](docs/addon-dev-guide/AGENTS.md) | 24 guides on WoW addon practices (Midnight, secret values, UI, testing, release) |
| [Migration from addon-dev](docs/migration-from-addon-dev.md) | Mapping from the retired `addon-dev` CLI to `mech` |
| [API changelog](docs/api-changelog.md) | WoW API changes (12.0.1 coverage; see its gap note) |
| [Command reference](docs/cli-reference.md) | Generated registry command parameters and invocation templates |
| [Quality improvements](docs/quality-improvements.md) | Targets, schema forms, previews, metrics, and validation |
| [Contributing](CONTRIBUTING.md) | Development and PR guidance |
| [Roadmap](PLAN/ROADMAP.md) | Implemented capabilities and future work |
| [Compatibility workbench PRD](PLAN/compatibility-workbench.prd.md) | Proposed API inspection, guided checks, and evidence reports; not yet implemented |
| [Changelog](CHANGELOG.md) | Desktop history; links to the separate [addon changelog](Mechanic/CHANGELOG.md) |
| [Security policy](SECURITY.md) | Supported versions, reporting, trust boundaries |

## License

GPL-3.0 — see [LICENSE](LICENSE).

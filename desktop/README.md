# Mechanic Desktop

Mechanic Desktop is the local companion for World of Warcraft addon development. It provides a FastAPI dashboard, a SavedVariables watcher, and a structured command registry exposed through the CLI and MCP.

The dashboard is packaged for both source checkouts and built wheels as `mechanic.dashboard`. Its HTTP and WebSocket bridge is intended for local use and enforces the local same-origin boundary.

For the architecture findings and validation limits, see the [September 2026 quality review](../docs/quality-review-2026-09-05.md). The [diagnostic and command workflow](../docs/quality-improvements.md) covers target selection, schema-driven forms, previews, and metrics.

## Features

- **Dashboard and watcher** - WebSocket updates from watched SavedVariables folders, with local SQLite history.
- **60 registered commands** - Lint, test, format, inspect, release, API, sandbox, performance, and asset workflows.
- **Schema-driven forms** - The dashboard reads `commands.list` input/output schemas, defaults, descriptions, and mutation flags. Supported object schemas get forms; complex schemas retain a raw JSON editor.
- **Deterministic diagnostics** - `diagnostic.targets` discovers client, account, character, and profile combinations. Pass the selected target to commands that read or write diagnostic data.
- **Previewable operations** - `release.all`, `addon.sync`, and `libs.sync` accept `dry_run: true` to show their plan.
- **Optional source-change reload** - `--auto-reload` can send a configured key after Lua source changes on Windows and macOS. A WoW /reload is still the authoritative way to reload the addon and save results.

## Installation

### Prerequisites

- Python 3.10 or higher
- World of Warcraft with both `!Mechanic` and `Mechanic` installed for the full diagnostic hub
- Git for version-control and release commands
- Lua 5.1 for the real bootstrap contract tests (optional for normal use)

### Install from a checkout

Run these commands from the repository's desktop/ directory, which contains pyproject.toml:

~~~bash
python -m pip install -e .

# Development dependencies and the pinned local validation tools
python -m pip install -c constraints-dev.txt -e ".[dev]"
~~~

For a non-editable installation from this directory, use `python -m pip install .`. To build a wheel, install the constrained `build`, `setuptools`, and `wheel` tools and run `python -m build --wheel --no-isolation`; see [.github/workflows/ci.yml](../.github/workflows/ci.yml) for the complete build and smoke-check procedure. The installed package includes mechanic.dashboard/index.html and mechanic.dashboard/schema-form.js; the server resolves those assets from the package rather than from the source checkout.

The package exposes both mech and mechanic console scripts. The examples below use mech.

### Quick start

~~~bash
# Configure paths and download luacheck/StyLua (and busted.bat on Windows)
mech setup

# Auto-discover SavedVariables and open the dashboard on port 3100
mech dashboard

# Or provide one or more SavedVariables folders explicitly
mech dashboard --watch "C:\Path\To\WTF\Account\NAME\SavedVariables"
~~~

The `--watch/-w` option belongs to dashboard and is repeatable. If no watch path is supplied, `sv.discover` searches configured WoW installations for accounts containing !Mechanic.lua. Use `--no-browser` to suppress automatic browser launch and `--port/-p` to change port 3100.

## Configuration

Mechanic loads the first existing JSON config in this order: ~/.mechanic/config.json; on non-Windows systems, $XDG_CONFIG_HOME/mechanic/config.json (or ~/.config/mechanic/config.json); then mechanic.config.json in the current directory. Use the checked-in [config.json.example](config.json.example) as a starting point.

The recognized environment variables are:

~~~bash
# Windows PowerShell
$env:MECHANIC_WOW_ROOT = "C:\Program Files (x86)\World of Warcraft"
$env:MECHANIC_DEV_PATH = "C:\Program Files (x86)\World of Warcraft\_dev_"
$env:MECHANIC_DATA_DIR = "C:\Path\To\MechanicData"

# macOS/Linux
export MECHANIC_WOW_ROOT="/Applications/World of Warcraft"
export MECHANIC_DEV_PATH="$MECHANIC_WOW_ROOT/_dev_"
export MECHANIC_DATA_DIR="$HOME/.mechanic/data"
~~~

Explicit process environment variables take precedence over .env files. The loader accepts desktop/.env and ~/.mechanic/.env. `MECHANIC_DATA_DIR` defaults to ~/.mechanic/data; it stores the history database and caches. If dev_path is not configured, discovery uses <wow_root>/_dev_ when that directory exists. The default flavor list is ["_retail_", "_beta_", "_ptr_"]; addon_search_paths can add extra addon roots. `GEMINI_API_KEY` is used by the optional `research.query` command.

WoW root discovery has common fallbacks for Windows, macOS, and Linux Wine/Lutris layouts. It is still safe to set `MECHANIC_WOW_ROOT` and `MECHANIC_DEV_PATH` explicitly when several installations are present.

## CLI usage

Global output flags go before the subcommand:

~~~bash
# List the registry and inspect a command's parameters
mech commands
mech commands --filter addon
mech commands --detail libs.check

# Call a registered command; the JSON argument is positional and defaults to {}
mech call sv.discover
mech call addon.validate '{"addon":"MyAddon"}'
mech --json call diagnostic.targets '{}'
mech --agent call addon.output '{}'

# Generate the current command reference
mech docs
mech docs --format json --output ./cli-reference.json

# Show configuration or stop a running local server
mech status
mech stop --port 3100
~~~

Other top-level commands are shell, dashboard, `addon.output`, release, setup, setup-busted, and mcp. The `release.all` registry command provides the dry-run preflight and recovery metadata described below. The older mech release shortcut uses positional arguments (mech release MyAddon 1.2.0 "Added a feature") and sequences individual version, changelog, commit, and tag commands; it does not provide `release.all`'s preview/preflight contract. Add `--skip-tag` to omit the Git tag. mech mcp uses stdio by default; install the MCP extra first and use mech mcp --transport sse --port 3100 for SSE.

There is no mech reload command. The dashboard reload button displays the /reload instruction, and watcher events only report file changes. `--auto-reload --src PATH` sends the configured key when a Lua source file changes; the CLI option defaults to key 9, and `--reload-key` changes it. The addon binding is not assigned a WoW default key, so bind the addon action and make the CLI key match. This window-focus helper is implemented for Windows and macOS; Linux does not support it.

### Tool setup

~~~bash
mech setup                 # Download or verify configured tools
mech setup --verify        # Verify without downloading
mech setup --force         # Re-download tools
mech setup --skip-config   # Set up tools without path prompts
mech setup-busted          # Regenerate Windows busted.bat
~~~

### Optional extras

~~~bash
python -m pip install -e ".[mcp]"      # MCP server support
python -m pip install -e ".[research]"  # Gemini research command
python -m pip install -e ".[assets]"    # PNG-to-TGA asset support
python -m pip install -e ".[all]"       # All runtime extras
~~~

## Registered commands

`mech commands` lists commands; `mech --json call commands.list` returns their complete schemas and mutation metadata. The current registry contains these 60 names:

~~~text
addon.complexity   addon.create       addon.deadcode      addon.deprecations
addon.format       addon.lint         addon.output        addon.security
addon.sync         addon.test         addon.validate      api.download
api.generate       api.info           api.list            api.populate
api.queue          api.refresh        api.search          api.stats
assets.list        assets.sync        atlas.scan          atlas.search
changelog.add      commands.list      dashboard.metrics   diagnostic.metrics
diagnostic.targets docs.generate      docs.stale          env.status
fencore-catalog    fencore-info       fencore-search      git.commit
git.tag            libs.check         libs.init           libs.sync
locale.extract     locale.validate    lua.queue           lua.results
perf.baseline      perf.compare       perf.list           perf.report
release.all        research.query     sandbox.exec        sandbox.generate
sandbox.status     sandbox.test       server.shutdown     sv.discover
sv.parse           system.pick_file   tools.status        version.bump
~~~

## Targets, previews, and metrics

Use `diagnostic.targets` first when more than one client, account, character, or profile may exist. Pass the same returned target object to `lua.queue`, `api.queue`, `lua.results`, `addon.output`, and `sv.parse`. Omitting a target is valid only when exactly one candidate matches; ambiguous or missing selections return candidates instead of choosing the newest file or first profile.

Use `dry_run: true` with `release.all`, `addon.sync`, or `libs.sync` to inspect a plan. Previews do not reserve filesystem or Git state, and a non-preview multi-step operation can leave completed changes when a later step fails.

`diagnostic.metrics` reports bounded, process-local command/parser timing, failures, in-flight work, uptime, HTTP task/socket counts, and history database sizes. With an explicit target it also includes the last saved addon overhead snapshot. This is an inspection snapshot, not a live or exhaustive count of every WoW timer.

## Dashboard and local API

The dashboard listens on 127.0.0.1:3100 by default and serves at /dashboard/. It uses the local /api/execute command bridge and /ws watcher stream. The bridge validates local host and same-origin requests; it is not authentication for a remotely exposed deployment.

The dashboard can run without valid watch paths, but it cannot show SavedVariables updates until a real folder is supplied. Install both `!Mechanic` and `Mechanic`, select a target when prompted, run /reload in WoW, and wait for the watcher to sync the written file.

## Project structure

~~~text
desktop/
├── bin/                    # Downloaded development tools
├── config.json.example     # JSON path configuration example
├── dashboard/              # Packaged static dashboard assets
│   ├── index.html
│   └── schema-form.js
├── src/
│   ├── afd/                # Structured command server/runtime
│   └── mechanic/
│       ├── cli.py          # Click CLI entry point
│       ├── config.py       # Configuration and path discovery
│       ├── server.py       # FastAPI server and local bridge
│       ├── storage.py      # SQLite history
│       ├── watcher.py      # SavedVariables/source watcher
│       └── commands/       # Registered command modules
├── tests/                  # Isolated Python tests
├── constraints-dev.txt    # Pinned local validation tools
├── pyproject.toml          # Package and optional extras
└── README.md
~~~

## Development and validation

~~~bash
python -m pip install -c constraints-dev.txt -e ".[dev]"
pytest -v
~~~

The last verified local baseline (2026-09-05) passed 243 Python tests with MCP 1.28.1 and a real Lua 5.1 runtime, plus the dashboard and Lua regression harnesses. Set `MECHANIC_LUA` to a Lua 5.1 executable to run the real bootstrap contract locally.

The offline Lua environment models only the APIs needed by its contracts. Tests do not validate WoW rendering, protected API behavior, or live SavedVariables timing. In-game behavior remains unverified until the worktree is installed in WoW and a /reload is confirmed.

## Troubleshooting

### WoW installation not found

Set `MECHANIC_WOW_ROOT` and `MECHANIC_DEV_PATH`, or create ~/.mechanic/config.json. Run mech status to inspect the resolved paths.

### Luacheck, StyLua, or Busted is missing

Run mech setup. On Windows, mech setup can generate desktop/bin/busted.bat when LuaRocks is installed.

### Dashboard will not connect

Ensure port 3100 is available and open the dashboard from the local instance. Use mech dashboard `--no-browser` and browse to http://127.0.0.1:3100/dashboard/ when automatic launch is unavailable.

### No diagnostic output appears

Confirm that both `!Mechanic` and `Mechanic` are enabled in the selected WoW client, run /reload in-game, and wait for the SavedVariables file to be written. File watcher notifications alone do not confirm that an in-game reload completed.

## License

GPL-3.0

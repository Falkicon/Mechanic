# Mechanic - WoW Addon Development Hub

[![Status](https://img.shields.io/badge/Phase%2010-Complete-brightgreen)]()
[![AFD](https://img.shields.io/badge/Architecture-AFD-blue)]()
[![Commands](https://img.shields.io/badge/Commands-21-purple)]()
[![Tests](https://img.shields.io/badge/Tests-9%20Passing-green)]()

**Mechanic** is a comprehensive development hub for World of Warcraft addons, combining an in-game inspection tool with a modern desktop companion that provides real-time feedback, development automation, and quality tooling.

---

## Quick Start

```bash
# Navigate to desktop folder
cd "C:\Program Files (x86)\World of Warcraft\_dev_\!Mechanic\desktop"

# Install (first time only)
pip install -e .

# Start the dashboard
mech
```

This opens the Mechanic Dashboard at [http://localhost:3100](http://localhost:3100) with:
- Live reload notifications from WoW
- Test results and performance metrics
- Command console for direct AFD command execution

---

## Features

### In-Game (!Mechanic Addon)
- **Properties Inspector**: Examine frame hierarchies and widget properties
- **Console**: Capture and filter debug logs and errors
- **Errors**: Advanced error capture with stack traces and suppression
- **Test Runner**: Execute and report Lua test results
- **Performance**: Monitor addon memory and CPU usage
- **Tools**: Utility collection (Reload, GC, etc.)
- **API Reference**: Browsable library of WoW API events and functions

### Desktop (Mechanic CLI + Dashboard)
- **Live Reload Detection**: Watch SavedVariables for changes, display instantly
- **21 AFD Commands**: Validate, lint, format, test, release, and more
- **WebSocket Streaming**: Real-time data to dashboard
- **Release Workflow**: One-command version bump, changelog, commit, tag
- **Persistence**: Command history and UI state saved across restarts
- **Graceful Shutdown**: Reliable process management via `mech stop`

---

## CLI Commands

| Command | Description |
|---------|-------------|
| `mech` | Start dashboard (default) |
| `mech dashboard` | Start with custom port |
| `mech reload` | Trigger in-game /reload |
| `mech stop` | Stop running server |
| `mech call <cmd> -i <json>` | Execute any AFD command |
| `mech release <addon> <ver> <msg>` | Full release workflow |

### Examples

```bash
# Validate an addon
mech call addon.validate -i '{"addon": "Weekly"}'

# Scan for deprecated APIs
mech call addon.deprecations -i '{"addon": "Weekly"}'

# Check locale coverage
mech call locale.validate -i '{"addon": "Weekly"}'

# Release a new version
mech release Weekly 1.2.0 "Added new feature"
```

---

## AFD Commands (21 Total)

### Development
- `addon.validate` - Validate .toc file structure
- `addon.lint` - Run Luacheck linter
- `addon.format` - Run StyLua formatter
- `addon.test` - Run Busted unit tests
- `addon.deprecations` - Scan for deprecated APIs

### Release
- `version.bump` - Update version in .toc
- `changelog.add` - Add CHANGELOG.md entry
- `git.commit` - Stage and commit changes
- `git.tag` - Create annotated git tag

### Localization
- `locale.validate` - Check locale coverage vs baseline
- `locale.extract` - Extract localizable strings
- `atlas.search` - Search Blizzard UI icons

### Environment
- `addon.create` - Create addon from template
- `addon.sync` - Create junction links to WoW clients
- `libs.check` - Check library sync status

### Core
- `sv.parse` - Parse SavedVariables file
- `sv.discover` - Discover WoW accounts
- `reload.trigger` - Trigger in-game reload
- `dashboard.metrics` - Get latest metrics
- `server.shutdown` - Gracefully stop server (New in 0.2.1)

---

## Project Structure

```
!Mechanic/
├── !Mechanic/              ← WoW addon (junction target)
│   ├── !Mechanic.toc
│   ├── Core.lua
│   └── UI/
├── desktop/                ← Mechanic Desktop
│   ├── pyproject.toml
│   ├── dashboard/          ← Web UI
│   ├── tests/              ← 9 pytest tests
│   └── src/mechanic/
│       ├── cli.py
│       ├── server.py
│       └── commands/       ← 5 AFD modules
├── PLAN/                   ← Phase specifications
├── AGENTS.md               ← Agent development guide
└── README.md               ← This file
```

---

## Development

### Prerequisites
### Prerequisites
- Python 3.10+
- WoW client with SavedVariables access
- **Development Tools**:
  - `luarocks` (for Busted)
  - `luacheck` (Auto-installed by `mech setup`)
  - `stylua` (Auto-installed by `mech setup`)

### Installing Test Dependencies (Busted)
The `addon.test` command requires Busted (Lua Unit Testing framework). We provide a script to automate this setup, as it requires compiling C modules.

**Prerequisites:**
1.  **LuaRocks**: Installed and in PATH ([Download](https://luarocks.org/)).
2.  **Visual Studio Build Tools**: "Desktop development with C++" workload installed.

**One-Click Setup:**
Run the setup script to automatically find your compiler, link local libraries, and install Busted:
```powershell
.\desktop\scripts\setup_dev_env.bat
```

Alternatively, `mech call addon.test` will provide guidance if dependencies are missing.

### Running Tests

```bash
cd desktop
pytest -v
```

### Adding Commands

1. Add command to appropriate module in `desktop/src/mechanic/commands/`
2. Add tests in `desktop/tests/`
3. Update AGENTS.md command reference

---

## Technology Stack

| Component | Technology |
|-----------|------------|
| Architecture | [AFD](https://github.com/Falkicon/Agent-First-Development) |
| CLI | Click |
| Server | FastAPI + Uvicorn |
| Real-time | WebSockets |
| Storage | SQLite |
| Dashboard | Vanilla HTML/CSS/JS |
| Testing | Pytest + afd[testing] |

---

## License

MIT License - See LICENSE file for details.

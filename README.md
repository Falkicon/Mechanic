# Mechanic

**The addon development platform built for AI-assisted workflows.**

![WoW Version](https://img.shields.io/badge/WoW-12.0%2B-blue)
![Interface](https://img.shields.io/badge/Interface-120001-green)
[![GitHub](https://img.shields.io/badge/GitHub-Falkicon%2FMechanic-181717?logo=github)](https://github.com/Falkicon/Mechanic)
[![Sponsor](https://img.shields.io/badge/Sponsor-pink?logo=githubsponsors)](https://github.com/sponsors/Falkicon)

![Commands](https://img.shields.io/badge/Commands-21-purple)
![Python](https://img.shields.io/badge/Python-3.10%2B-3776AB?logo=python&logoColor=white)

> **Status:** Core features production-ready. Built for WoW 12.0 Midnight.
> Alpha phase — expect evolving APIs. [Roadmap](ROADMAP.md) | [Contributing](CONTRIBUTING.md) | [Sponsor](https://github.com/sponsors/Falkicon)

---

## Why Mechanic?

Building WoW addons means constantly switching between the game client and your editor. You reload, check for errors, copy stack traces manually, guess at frame hierarchies, and hope your changes work. It's slow, tedious, and breaks your flow.

**Mechanic changes that.**

```
┌─────────────────┐      /reload      ┌─────────────────┐      mech       ┌─────────────────┐
│ Diagnostic Hub  │ ───────────────▶  │    Desktop UI   │ ◀────────────▶  │   Agent CLI     │
│  (!Mechanic)    │   SavedVariables  │                 │   Full Access   │                 │
│ • Aggregation   │                   │ • Errors        │                 │ • Automate      │
│ • Tests/Logs    │                   │ • Modular Tests │                 │ • Validate      │
│ • Perf Metrics  │                   │ • Console       │                 │ • Release       │
│ • Lib Registry  │                   │ • System Health │                 │ • Create        │
└─────────────────┘                   └─────────────────┘                 └─────────────────┘
```

**One ecosystem. Zero context switching.**

---

## The Developer Experience

### 1. Rich In-Game Tools

While you're in-game, Mechanic gives you a full development hub:

| Tool | What It Does |
|------|--------------|
| **Inspect** | Pick any frame, explore its hierarchy, edit properties live, export Lua code |
| **Console** | Capture all addon logs with filtering, search, and deduplication |
| **Errors** | Full stack traces with BugGrabber integration, session filtering |
| **Tests** | Run unit tests, see results instantly, track pass/fail history |
| **Performance** | Real-time FPS, memory, CPU profiling per addon |
| **Tools** | Addon-registered diagnostics, health logs, quick actions (reload, GC, reset) |
| **API Browser** | Searchable reference for WoW APIs with Midnight 12.0 readiness status |

### 2. Desktop Dashboard (On Reload)

Every `/reload` automatically syncs your game state to a beautiful desktop dashboard via the **Diagnostic Hub**:

- **Errors** — Grouped by addon/file, powered by BugGrabber.
- **Modular Tests** — Row-per-addon test results with hierarchical details.
- **System Health** — Integrated performance metrics (buffers, memory, CPU).
- **Console** — Full ecosystem console buffer with timestamps and filtering.
- **Lib Registry** — Real-time tracking of loaded library versions.

The dashboard updates in real-time via WebSocket. No manual refresh needed.

### 3. Agent-Ready CLI

Here's where it gets powerful: **everything in the dashboard is available via CLI.**

```bash
# Get a full snapshot of addon state (errors, tests, console)
mech addon.output

# Trigger an in-game reload from terminal
mech reload

# Validate, lint, format, test — all in one command
mech call addon.validate -i '{"addon": "MyAddon"}'

# Execute Lua code in-game and get results (round-trip)
mech call lua.queue -i '{"code": ["GetMoney()/10000"], "labels": ["gold"]}'
# Then /reload in WoW, and read results:
mech call lua.results

# Search WoW APIs offline
mech call api.search -i '{"query": "*Spell*", "limit": 10}'

# Queue API tests to run in-game
mech call api.queue -i '{"apis": ["C_Spell.GetSpellInfo"], "params": {"C_Spell.GetSpellInfo": {"spellID": 8690}}}'
```

This means your AI coding assistant can:
- Pull the latest errors after a reload
- Run validation before committing
- Execute the full release workflow
- Create new addons from templates

**Example workflow:** You tell your agent "I just reloaded, check for errors." The agent runs `mech addon.output`, sees a nil error in `UI.lua:47`, reads the file, identifies the issue, and proposes a fix — all without you copying stack traces or switching windows.

> **Tip for AI-assisted development:** Add `!Mechanic/AGENTS.md` to your agent's context. It contains the full command reference, workflow patterns, and integration guides that help agents use Mechanic effectively.

**You focus on the code. The agent handles the tooling.**

### 4. Offline Sandbox Testing

Test your addon's Core logic without WoW running. The sandbox generates 5000+ API stubs from Blizzard's APIDefs.

```bash
# Generate stubs once
mech call sandbox.generate

# Run tests in ~30ms (vs. 30s reload cycles)
mech call sandbox.test -i '{"addon": "MyAddon"}'
```

- **Fast iteration** — 30ms test feedback vs. 30-second `/reload` cycles
- **CI/CD ready** — Run tests on every commit without a game client
- **Pure logic focus** — Test business logic in isolation from WoW runtime

See the [Testing Guide](docs/integration/testing.md) for test file conventions and assertion reference.

---

## Quick Start

```bash
# 1. Install (one time)
cd "!Mechanic/desktop"
pip install -e .

# 2. Start the dashboard
mech

# 3. Open in browser
# → http://localhost:3100
```

The dashboard connects to your WoW client automatically. Just `/reload` in-game and watch the data flow.

---

## What's Next?

| Your Goal | Start Here |
|-----------|------------|
| Just exploring | Quick Start above |
| Integrate my addon | [Addon Integration Guide](docs/addon-integration.md) |
| AI-assisted workflow | [AGENTS.md](AGENTS.md) |
| Offline testing | [Testing Guide](docs/integration/testing.md) |
| Full command reference | [CLI Reference](docs/cli-reference.md) |

---

## Complete Tooling Suite

Beyond the live development loop, Mechanic includes a full suite of quality tools:

### Addon Lifecycle

| Command | Description |
|---------|-------------|
| `mech call addon.create` | Bootstrap a new addon from template |
| `mech call addon.sync` | Create junction links to all WoW clients |
| `mech call addon.validate` | Validate .toc structure and metadata |
| `mech call addon.lint` | Run Luacheck with project rules |
| `mech call addon.format` | Auto-format with StyLua |
| `mech call addon.test` | Execute Busted unit tests |
| `mech call addon.deprecations` | Scan for deprecated 12.0 APIs |
| `mech call libs.check` | Check library status vs libs.json |
| `mech call libs.init` | Create libs.json from installed libraries |
| `mech call libs.sync` | Sync libraries based on libs.json |
| `mech call lua.queue` | Queue Lua code for in-game execution |
| `mech call lua.results` | Read results from last Lua queue |
| `mech call api.search` | Search WoW APIs by pattern (offline) |
| `mech call api.queue` | Queue API tests for in-game execution |
| `mech call sandbox.exec` | Execute Lua in sandbox with API stubs |
| `mech call tools.status` | Check dev tools installation status |
| `mech call env.status` | Get environment configuration |
| `mech call system.pick_file` | Open native file picker dialog |

### Release Automation

```bash
# Full release in one command (release.all):
# 1. Bumps version in .toc
# 2. Adds CHANGELOG entry
# 3. Commits changes
# 4. Creates git tag
mech release MyAddon 1.2.0 "Added new feature"

# Or run individual steps:
mech call version.bump --addon MyAddon --version 1.2.0
mech call changelog.add --addon MyAddon --version 1.2.0 --message "Added new feature"
mech call git.commit --addon MyAddon --message "Release v1.2.0"
mech call git.tag --addon MyAddon --version 1.2.0
```

### Localization

| Command | Description |
|---------|-------------|
| `mech call locale.validate` | Check translation coverage |
| `mech call locale.extract` | Extract localizable strings |
| `mech call atlas.search` | Search Blizzard UI icons/atlases |

---

## Architecture

Mechanic is built with a structured command architecture where every feature is designed as a command that both humans and AI agents can use.

```
!Mechanic/
├── !Mechanic/           # WoW Addon (Lua)
│   ├── Core.lua         # AceAddon-3.0 foundation
│   ├── UI/              # FenUI-based panels
│   └── Bindings.xml     # Keybindings (CTRL+SHIFT+R for reload)
│
├── desktop/             # Desktop Application (Python)
│   ├── src/mechanic/
│   │   ├── cli.py       # Click-based CLI
│   │   ├── server.py    # FastAPI + WebSocket
│   │   ├── watcher.py   # SavedVariables file watcher
│   │   └── commands/    # 21 commands
│   └── dashboard/       # Vanilla HTML/CSS/JS UI
│
└── PLAN/                # Development roadmap
```

### Data Flow

1. **Addons** → Register with `MechanicLib` to expose tests/metrics.
2. **Diagnostic Hub** → `!Mechanic` aggregates all registered addon data.
3. **On Reload** → WoW flushes `!Mechanic.lua` SavedVariables to disk.
4. **Watcher** → Desktop detects file change, parses the consolidated Hub data.
5. **Dashboard** → WebSocket pushes modular updates to browser.
6. **CLI** → Same data available via `mech addon.output`.

---

## Technology

| Layer | Stack |
|-------|-------|
| In-Game | Lua, AceAddon-3.0, FenUI |
| Desktop | Python 3.10+, FastAPI, Click |
| Real-time | WebSockets, watchfiles |
| Storage | SQLite (metrics history) |
| Dashboard | Vanilla HTML/CSS/JS |
| Testing | Pytest, Busted |

---

## Development

### Prerequisites

- Python 3.10+
- WoW client with SavedVariables access
- Optional: LuaRocks + Busted for unit testing

### First-Time Setup

```bash
cd desktop
pip install -e .
mech setup  # Downloads luacheck, stylua
```

### Running Tests

```bash
cd desktop
pytest -v
```

---

## Keybindings

Mechanic registers these in-game keybindings (Key Bindings → Mechanic):

| Binding | Default | Action |
|---------|---------|--------|
| Reload UI (Dev) | `CTRL+SHIFT+R` | Triggers `/reload` |
| Toggle Mechanic | `CTRL+SHIFT+M` | Opens/closes panel |

The desktop can trigger these remotely via `mech reload`.

---

## Documentation

| Document | Description |
|----------|-------------|
| [Addon Integration Guide](docs/addon-integration.md) | How to integrate your addon with Mechanic |
| [CLI Reference](docs/cli-reference.md) | Auto-generated command reference (run `mech docs`) |
| [AGENTS.md](AGENTS.md) | AI agent reference (commands, schemas, patterns) |
| [CONTRIBUTING.md](CONTRIBUTING.md) | Development philosophy and PR guidelines |
| [ROADMAP.md](ROADMAP.md) | Planned features and future direction |
| [CHANGELOG.md](CHANGELOG.md) | Version history |

---

## License

GPL-3.0 — See [LICENSE](LICENSE) for details.

---

<p align="center">
  <strong>Build better addons, faster.</strong><br>
  <em>In-game inspection • Desktop dashboard • Agent automation</em>
</p>

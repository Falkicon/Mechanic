# Mechanic

**The complete addon development platform for World of Warcraft.**

![WoW Version](https://img.shields.io/badge/WoW-11.2.7%2B-blue)
![Interface](https://img.shields.io/badge/Interface-120001-green)
![Status](https://img.shields.io/badge/Status-Alpha-orange)
[![GitHub](https://img.shields.io/badge/GitHub-Falkicon%2FMechanic-181717?logo=github)](https://github.com/Falkicon/Mechanic)
[![Sponsor](https://img.shields.io/badge/Sponsor-pink?logo=githubsponsors)](https://github.com/sponsors/Falkicon)

![AFD](https://img.shields.io/badge/Architecture-AFD-blueviolet)
![Commands](https://img.shields.io/badge/Commands-21-purple)
![Python](https://img.shields.io/badge/Python-3.10%2B-3776AB?logo=python&logoColor=white)

> **⚠️ Alpha Software**
> 
> I found WoW addon development tooling to be fragmented, outdated, and disconnected from modern developer workflows. So I built the tooling I wished existed — bringing patterns from professional developer tooling to the addon community.
> 
> - **Alpha status:** Core features work well, but expect rough edges and evolving APIs
> - **Contributions:** PRs welcome — see [CONTRIBUTING.md](CONTRIBUTING.md)
> - **Feature requests:** Open an issue with your use case — community feedback shapes the roadmap
> - **Sponsorship:** [Supporting the project](https://github.com/sponsors/Falkicon) helps prioritize features 💜
> 
> If you're building WoW addons and want a better developer experience, give it a try!

---

## Why Mechanic?

Building WoW addons means constantly switching between the game client and your editor. You reload, check for errors, copy stack traces manually, guess at frame hierarchies, and hope your changes work. It's slow, tedious, and breaks your flow.

**Mechanic changes that.**

```
┌─────────────────┐      /reload      ┌─────────────────┐      mech       ┌─────────────────┐
│   In-Game Hub   │ ───────────────▶  │    Desktop UI   │ ◀────────────▶  │   Agent CLI     │
│                 │   SavedVariables  │                 │   Full Access   │                 │
│ • Inspect       │                   │ • Errors        │                 │ • Automate      │
│ • Debug         │                   │ • Tests         │                 │ • Validate      │
│ • Test          │                   │ • Console       │                 │ • Release       │
│ • Profile       │                   │ • Metrics       │                 │ • Create        │
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

Every `/reload` automatically syncs your game state to a beautiful desktop dashboard:

- **Errors** — Current session errors with smart grouping by addon/file
- **Tests** — Pass/fail badges, duration, captured logs
- **Console** — Full console buffer with timestamps and filtering
- **Metrics** — Last reload time, environment info, performance data

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
```

This means your AI coding assistant can:
- Pull the latest errors after a reload
- Run validation before committing
- Execute the full release workflow
- Create new addons from templates

> **Tip for AI-assisted development:** Add `!Mechanic/AGENTS.md` to your agent's context. It contains the full command reference, workflow patterns, and integration guides that help agents use Mechanic effectively.

**You focus on the code. The agent handles the tooling.**

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

📖 **Want to integrate your addon fully?** See the [Addon Integration Guide](docs/addon-integration.md) for console logging, test setup, SavedVariables patterns, and more.

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

### Release Automation

```bash
# Full release in one command:
# 1. Bumps version in .toc
# 2. Adds CHANGELOG entry
# 3. Commits changes
# 4. Creates git tag
mech release MyAddon 1.2.0 "Added new feature"
```

### Localization

| Command | Description |
|---------|-------------|
| `mech call locale.validate` | Check translation coverage |
| `mech call locale.extract` | Extract localizable strings |
| `mech call atlas.search` | Search Blizzard UI icons/atlases |

---

## Architecture

Mechanic is built on [AFD (Agent-First Development)](https://github.com/Falkicon/afd) — a pattern where every feature is designed as a structured command that both humans and AI agents can use.

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
│   │   └── commands/    # 21 AFD commands
│   └── dashboard/       # Vanilla HTML/CSS/JS UI
│
└── PLAN/                # Development roadmap
```

### Data Flow

1. **In-Game** → Mechanic addon writes to `MechanicDB` (SavedVariables)
2. **On Reload** → WoW flushes SavedVariables to disk
3. **Watcher** → Desktop detects file change, parses Lua tables
4. **Dashboard** → WebSocket pushes update to browser
5. **CLI** → Same data available via `mech addon.output`

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

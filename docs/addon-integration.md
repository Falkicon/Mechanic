# Addon Integration Guide

Integrate your World of Warcraft addon with Mechanic's development ecosystem.

---

## Quick Start

### Prerequisites

- Mechanic Desktop installed (`pip install -e .` in `!Mechanic/desktop`)
- Your addon in a development folder (e.g., `_dev_/MyAddon/`)
- WoW client with SavedVariables access

### Minimum Setup (5 minutes)

```bash
# 1. Register with MechanicLib in your addon
# local MechanicLib = LibStub("MechanicLib-1.0", true)
# MechanicLib:Register("MyAddon", { version = "1.0.0" })

# 2. Start the dashboard
mech

# 3. Reload WoW
# → !Mechanic aggregates your data and pushes it to the dashboard automatically
```

That's it for basic integration. Read on for deeper integration.

---

## Feature Index

Jump to the guide you need:

| I want to... | Guide |
|--------------|-------|
| Add console logging | [Console Integration](./integration/console.md) |
| Run unit tests (offline) | [Test Integration](./integration/testing.md) |
| Track performance metrics | [Performance Profiling](./integration/performance.md) |
| Add a custom tools panel | [Tools Integration](./integration/tools.md) |
| Automate releases | [Release Automation](./integration/release.md) |
| Inspect frames at runtime | [Inspect Integration](./integration/inspect.md) |
| Track errors | [Error Tracking](./integration/errors.md) |
| Structure my addon for testing | [Addon Architecture](./addon-architecture.md) |

---

## Project Setup

### Folder Structure

Mechanic expects addons in your development folder (typically `_dev_/`):

```
_dev_/
├── MyAddon/
│   ├── MyAddon.toc
│   ├── Core.lua
│   ├── CHANGELOG.md        # Optional, for release automation
│   └── Tests/              # Optional, for unit tests
│       └── Core_spec.lua
├── !Mechanic/              # Mechanic addon
└── ADDON_DEV/              # Shared tools (optional)
```

### Junction Links

Mechanic creates junction links from your dev folder to each WoW client:

```bash
# Create links to all detected clients (_retail_, _beta_, _ptr_)
mech call addon.sync -i '{"addon": "MyAddon"}'

# Specify specific flavors
mech call addon.sync -i '{"addon": "MyAddon", "flavors": ["_retail_", "_beta_"]}'
```

### TOC File Requirements

```toc
## Interface: 110207
## Version: 1.0.0
## Title: My Addon
## Author: YourName
## SavedVariables: MyAddonDB
```

Validate your TOC:

```bash
mech call addon.validate -i '{"addon": "MyAddon"}'
```

---

## Integration Guides

Deep-dive documentation for each Mechanic feature:

### Core

| Guide | Description |
|-------|-------------|
| [Addon Architecture](./addon-architecture.md) | Three-layer design for testable addons |
| [MechanicLib Registration](./integration/mechaniclib.md) | Connect your addon to Mechanic's ecosystem |
| [SavedVariables Patterns](./integration/saved-variables.md) | Expose data for the dashboard |

### In-Game Tabs

| Tab | Guide | Description |
|-----|-------|-------------|
| **Inspect** | [Inspect Integration](./integration/inspect.md) | Frame watch list, click-through patterns |
| **Console** | [Console Integration](./integration/console.md) | Logging, categories, lifecycle messages |
| **Errors** | [Error Tracking](./integration/errors.md) | BugGrabber integration |
| **Tests** | [Test Integration](./integration/testing.md) | Sandbox, Desktop (Busted), + in-game tests |
| **Performance** | [Performance Profiling](./integration/performance.md) | Block timing, sub-metrics |
| **Tools** | [Tools Integration](./integration/tools.md) | Custom tools panels |

### Workflow

| Guide | Description |
|-------|-------------|
| [CLI Workflow](./integration/cli-workflow.md) | Daily development commands |
| [Release Automation](./integration/release.md) | Version bumping, changelog, tagging |
| [Troubleshooting](./integration/troubleshooting.md) | Common issues and solutions |

---

## Dashboard Features

### What Appears Automatically

| Section | Source | Updates On |
|---------|--------|------------|
| **Errors** | BugGrabber SavedVariables | `/reload` |
| **Tests** | Diagnostic Hub (`!Mechanic.lua`) | `/reload` |
| **Console** | Diagnostic Hub (`!Mechanic.lua`) | `/reload` |
| **Metrics** | Diagnostic Hub (`!Mechanic.lua`) | `/reload` |

### Real-Time Updates

The dashboard uses WebSocket for instant updates:
- File watcher detects SavedVariables change
- Server parses Lua tables
- WebSocket pushes to browser
- No manual refresh needed

---

## Next Steps

- **For AI-assisted development:** Add `!Mechanic/AGENTS.md` to your agent's context
- **For CI/CD:** See the [GitHub Actions workflow](../.github/workflows/ci.yml)
- **For contributing:** Read [CONTRIBUTING.md](../CONTRIBUTING.md)
- **For CLI reference:** See [CLI Reference](./cli-reference.md)

---

<p align="center">
  <em>Questions? Open an issue or check the <a href="../README.md">README</a>.</em>
</p>

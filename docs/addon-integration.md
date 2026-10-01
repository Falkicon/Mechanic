# Addon Integration Guide

Integrate your World of Warcraft addon with Mechanic's development ecosystem.

---

## Quick Start

### Prerequisites

- Mechanic Desktop installed (`python -m pip install -e .` from the `desktop/` folder of the Mechanic repository)
- Both Mechanic addon folders (`!Mechanic` and `Mechanic`) installed in your client's `Interface/AddOns/`
- Your addon in a development folder (for example `_dev_/MyAddon/`)
- A WoW client with SavedVariables access

### Minimum Setup (5 minutes)

```bash
# 1. Register with MechanicLib in your addon (Lua):
#    local MechanicLib = LibStub("MechanicLib-1.0", true)
#    if MechanicLib then MechanicLib:Register("MyAddon", { version = "1.0.0" }) end

# 2. Start the dashboard
mech dashboard

# 3. Run /reload in WoW
#    -> WoW writes !Mechanic.lua; the desktop watcher notices it and the dashboard shows your data
```

That is it for basic integration. Read on for deeper integration.

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
└── Mechanic/               # This repository
    ├── !Mechanic/          # Bootstrap addon
    ├── Mechanic/           # Main addon
    ├── desktop/            # Desktop tool (mech CLI, dashboard, MCP server)
    └── _TemplateAddon/     # Used by addon.create
```

### Junction Links

Mechanic creates links from your dev folder to each installed WoW client. On Windows these are junctions; elsewhere they are symlinks.

```bash
# Preview the links without creating anything
mech call addon.sync '{"addon": "MyAddon", "dry_run": true}'

# Create links to all detected clients (_retail_, _beta_, _ptr_)
mech call addon.sync '{"addon": "MyAddon"}'

# Specify specific flavors
mech call addon.sync '{"addon": "MyAddon", "flavors": ["_retail_", "_beta_"]}'
```

The addon folder must contain `MyAddon.toc` directly. Uninstalled clients are skipped, and `NO_CLIENT_FOUND` is returned if none of the requested clients exist.

### TOC File Requirements

```toc
## Interface: 120100
## Version: 1.0.0
## Title: My Addon
## Author: YourName
## SavedVariables: MyAddonDB
```

Validate your TOC:

```bash
mech call addon.validate '{"addon": "MyAddon"}'
```

---

## Integration Guides

Deep-dive documentation for each Mechanic feature:

### Core

| Guide | Description |
|-------|-------------|
| [Addon Architecture](./addon-architecture.md) | Three-layer design for testable addons |
| [MechanicLib Registration](./integration/mechaniclib.md) | Connect your addon to Mechanic's ecosystem |
| [SavedVariables Patterns](./integration/saved-variables.md) | What the desktop reads, and how to expose your data |

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
| [CurseForge Deployment](./integration/curseforge.md) | Packaging and tags |
| [Library Reference](./integration/libraries.md) | Ace3 and helper libraries, `libs.*` commands |
| [Troubleshooting](./integration/troubleshooting.md) | Common issues and solutions |

---

## Dashboard Features

### What Appears

| Section | Source | Updates On |
|---------|--------|------------|
| **Errors** | `!BugGrabber.lua` (BugGrabber SavedVariables) | `/reload`, logout |
| **Tests** | Diagnostic hub (`!Mechanic.lua`) | `/reload`, logout |
| **Console** | Diagnostic hub (`!Mechanic.lua`) | `/reload`, logout |
| **Metrics** | Diagnostic hub (`!Mechanic.lua`) | `/reload`, logout |

Only addons that register through MechanicLib contribute to the hub data. See [SavedVariables Patterns](./integration/saved-variables.md).

### Updates

WoW only writes SavedVariables on reload, logout or quit, so the data is a snapshot, not a live stream:

- The file watcher detects the changed SavedVariables file
- The dashboard receives a WebSocket notification and re-reads its selected diagnostic target
- No manual refresh is needed after the file is written

---

## Next Steps

- **For AI-assisted development:** add the repository's [AGENTS.md](../AGENTS.md) to your agent's context
- **For CI/CD:** see the [GitHub Actions workflow](../.github/workflows/ci.yml)
- **For contributing:** read [CONTRIBUTING.md](../CONTRIBUTING.md)
- **For CLI reference:** see [CLI Reference](./cli-reference.md)
- **For the in-game addon dev guide:** see the [Addon Development Guide](./addon-dev-guide/AGENTS.md)

---

<p align="center">
  <em>Questions? Open an issue or check the <a href="../README.md">README</a>.</em>
</p>

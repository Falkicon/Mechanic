# !Mechanic

In-game development hub for World of Warcraft addon developers. Centralizes debugging, testing, error capture, and performance monitoring with universal copy support.

![WoW Version](https://img.shields.io/badge/WoW-12.0%2B-blue)
![Interface](https://img.shields.io/badge/Interface-120001-green)
[![GitHub](https://img.shields.io/badge/GitHub-Falkicon%2FMechanic-181717?logo=github)](https://github.com/Falkicon/Mechanic)
[![Sponsor](https://img.shields.io/badge/Sponsor-pink?logo=githubsponsors)](https://github.com/sponsors/Falkicon)

## Features

| Feature | Description |
|---------|-------------|
| **Console** | Aggregated debug output from all registered addons with filters, search, and dedup. Includes **semantic color highlighting** (e.g., Purple for Midnight secret values). |
| **Errors** | BugGrabber integration with pause/resume - finally copy errors without them scrolling away. |
| **Tests** | Unified view of test results across all addons with **structured diagnostic details** for granular check reporting. |
| **Performance** | Memory/CPU metrics with extended diagnostics (FPS, latency, GC). |
| **Universal Copy** | Every piece of data is copyable with optional environment context. Console exports automatically strip color codes for clean text. |

## Why Mechanic?

- **Pause Error Capture**: BugSack's biggest UX problem - errors scroll by too fast to copy. Mechanic lets you pause.
- **Environment Context**: Copies include WoW version, client type (Retail/PTR/Beta), character info - perfect for AI agents.
- **Unified Debug Hub**: Stop switching between addons to check logs. Everything in one place.
- **Developer Mode Detection**: Replaces DevMarker.lua pattern across all addons.

## Installation

1. Download from [CurseForge](https://curseforge.com/wow/addons/mechanic) or [GitHub](https://github.com/Falkicon/Mechanic)
2. Extract to `Interface/AddOns/`
3. Optionally install `!BugGrabber` for error capture

## Usage

| Command | Action |
|---------|--------|
| `/mech` | Toggle main panel |
| `/mech console` | Open Console tab |
| `/mech errors` | Open Errors tab |
| `/mech tests` | Open Tests tab |
| `/mech perf` | Open Performance tab |
| `/mech reload` | Reload UI |
| `/mech gc` | Force garbage collection |

## For Addon Developers

### Integration via MechanicLib

MechanicLib is a lightweight library (~150 lines) that lets your addon integrate with Mechanic. It supports rich test results and semantic logging:

```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)

-- Registration with rich test results (Phase 5)
MechanicLib:Register("MyAddon", {
    tests = {
        getResult = function(id)
            return {
                passed = true,
                message = "API Check Complete",
                details = {
                    { label = "C_Spell.GetInfo", value = "Success", status = "pass" },
                    { label = "Secret Value", value = "Detected", status = "warn" },
                }
            }
        end
    }
})

-- Logging with semantic categories
MechanicLib:Log("MyAddon", "Midnight secret detected", MechanicLib.Categories.SECRET)
```

### Copy Output Format

When users copy from Mechanic, they get clean, markdown-friendly text:

```
=== Mechanic Console Export ===
WoW: 12.0.0 (58234) | Client: Beta | Interface: 120001
Character: Fenris-Stormrage (Druid, Balance)
---
[MyAddon] [Trigger] Aura "Player Health" activated
[MyAddon] [Region] Icon frame shown
```

Perfect for pasting into bug reports or AI assistants.

## Optional Dependencies

| Addon | Purpose |
|-------|---------|
| `!BugGrabber` | Error capture for the Errors tab |

## Documentation

- **[AGENTS.md](AGENTS.md)** - Technical reference for contributors
- **[PLAN/MASTER_PLAN.md](PLAN/MASTER_PLAN.md)** - Complete specification

## License

GPL-3.0 License - see [LICENSE](LICENSE) for details.

## Author

Fen (Falkicon)

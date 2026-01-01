# !Mechanic - Agent Documentation

Technical reference for AI agents working on this addon.

For shared patterns, library references, and development guides, see **[ADDON_DEV/AGENTS.md](../ADDON_DEV/AGENTS.md)**.

---

## Quick Reference

| Item | Value |
|------|-------|
| **Current Version** | 1.2.3 |
| **MechanicLib** | 1.0 (Minor 3) |
| **Primary Commands** | `/mech`, `/mechanic` |
| **Status** | Stable (Self-Monitoring Added) |

---

## Project Intent

!Mechanic is a centralized in-game development hub that provides:

- **Inspect**: Frame and table inspector with Pick mode and Watch list
- **Console**: Aggregated debug output from all registered addons
- **Errors**: BugGrabber integration with pause/resume capability
- **Tests**: Unified view of test results across all addons
- **Performance**: Memory/CPU metrics with extended diagnostics
- **Tools**: Addon-specific diagnostic panels
- **API**: Test Bench for API discovery and Midnight readiness
- **Self-Monitoring**: !Mechanic uses itself as a reference implementation via dogfooding

### Dogfooding & Health Log
!Mechanic implements advanced self-monitoring:
- **Persistent Health Log**: Internal errors and lifecycle events are stored in `MechanicDB` for post-reload auditing.
- **Self-Diagnostic Tools**: Use the `Tools` tab to view/export the health log and reset UI state.
- **In-Game Tests**: Self-tests for database integrity and module loading.

**Key Feature**: Universal copyability with optional environment context for AI agents and bug reports.

---

## Specification Documents

Full implementation specifications are in the `PLAN/` folder:

| Document | Description | Status |
|----------|-------------|--------|
| [MASTER_PLAN.md](PLAN/MASTER_PLAN.md) | Complete project specification, API docs, UI layouts | Reference |
| [01-foundation.plan.md](PLAN/01-foundation.plan.md) | Phase 1: MechanicLib, Console, Copy system | ✅ Complete |
| [02-error-tests.plan.md](PLAN/02-error-tests.plan.md) | Phase 2: BugGrabber integration, Tests module | ✅ Complete |
| [03-performance.plan.md](PLAN/03-performance.plan.md) | Phase 3: Performance module, Settings, Minimap | ✅ Complete |
| [04-migration.plan.md](PLAN/04-migration.plan.md) | Phase 4: ActionHud/WimpyAuras integration | ✅ Complete |
| [05-polish.plan.md](PLAN/05-polish.plan.md) | Phase 5: Category colors, rich test details | ✅ Complete |
| [06-extensibility.plan.md](PLAN/06-extensibility.plan.md) | Phase 6: Tools tab, Performance sub-metrics, Console/Errors left-nav | ✅ Complete |
| [07-api-bench.plan.md](PLAN/07-api-bench.plan.md) | Phase 7: API Test Bench for Midnight readiness | ✅ Complete |
| [08-inspect.plan.md](PLAN/08-inspect.plan.md) | Phase 8: Inspect Tab (Frame Inspector & Watch List) | ✅ Complete |
| [09-api_database_automation.plan.md](PLAN/09-api_database_automation.plan.md) | Phase 9: API Database Automation & Lazy Loading | ✅ Complete |
| [10-persistence_initialization.plan.md](PLAN/10-persistence_initialization.plan.md) | Phase 10: Persistence & Initialization | ✅ Complete |

**Start with MASTER_PLAN.md** for complete context before implementing any phase.

---

## File Structure

```
!Mechanic/
├── !Mechanic.toc              # Addon manifest
├── Core.lua                   # Main addon, registration, slash commands
├── Utils.lua                  # Shared pure utility functions
├── Settings.lua               # AceConfig settings panel
├── AGENTS.md                  # This file
├── PLAN/                      # Specifications (see above)
├── UI/
│   ├── MainFrame.lua          # FenUI Panel + tabs
│   ├── Console.lua            # Console tab module
│   ├── Errors.lua             # Errors tab module
│   ├── Tests.lua              # Tests tab module
│   ├── Tools.lua              # Tools tab module
│   ├── API.lua                # API Test Bench module
│   ├── APIDefinitions.lua     # API base schemas & curated definitions
│   ├── APIDefinitions_Registry.lua # Lazy-loading index for all APIs
│   ├── APIDefs/               # Namespace-specific definitions (200+ files)
│   ├── Inspect.lua            # Inspect tab module & Pick mode
│   ├── InspectTree.lua        # Contextual tree component
│   ├── InspectDetails.lua     # Detailed property inspector
│   ├── InspectWatch.lua       # Live-refreshing watch list
│   ├── Performance.lua        # Performance tab module
│   └── Shared/
│       ├── SplitNavLayout.lua # Reusable left-nav helper
│       └── FrameResolver.lua  # Path resolution utility
├── Libs/
│   ├── MechanicLib/           # SOURCE - synced to other addons
│   ├── FenUI/                 # UI framework
│   └── Ace3 libs...
└── Locales/
    └── enUS.lua
```

---

## MechanicLib

MechanicLib is the integration library that other addons embed. It provides:

```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)

-- Developer mode detection (replaces DevMarker.lua)
if MechanicLib and MechanicLib:IsEnabled() then
    -- Register, show debug UI, etc.
end

-- Registration
MechanicLib:Register("AddonName", capabilities)

-- Logging
MechanicLib:Log("AddonName", "message", MechanicLib.Categories.TRIGGER)
```

**Source of Truth**: `Libs/MechanicLib/MechanicLib.lua`
**Deployment**: Via `lib_sync.ps1` to consuming addons

---

## Development Workflow

### Running the Addon
```powershell
# Create junction links (first time)
mcp_AddonDevTools_sync_junctions("!Mechanic")

# Validate TOC
mcp_AddonDevTools_validate_tocs()

# Lint
mcp_AddonDevTools_lint_addon("!Mechanic")
```

### Slash Commands
| Command | Action |
|---------|--------|
| `/mech` | Toggle main panel |
| `/mech inspect` | Open Inspect tab |
| `/mech console` | Open Console tab |
| `/mech errors` | Open Errors tab |
| `/mech tests` | Open Tests tab |
| `/mech perf` | Open Performance tab |
| `/mech tools` | Open Tools tab |
| `/mech api` | Open API tab |
| `/mech reload` | ReloadUI() |
| `/mech gc` | Force garbage collection |

---

## Agent Guidelines

1. **Read MASTER_PLAN.md first** - Contains all shared context
2. **Phase specs are self-contained** - Each phase can be implemented independently
3. **MechanicLib is the source** - Changes to MechanicLib must be synced via lib_sync
4. **FenUI first** - Use FenUI widgets where possible; add new widgets to FenUI proper
5. **Test both scenarios** - Ensure addons work with and without !Mechanic

---

## Key Patterns

### Developer Mode Detection
```lua
-- Replaces DevMarker.lua pattern
local MechanicLib = LibStub("MechanicLib-1.0", true)
local isDeveloper = MechanicLib and MechanicLib:IsEnabled()
```

### Copy with Environment Header
```lua
function Module:GetCopyText(includeHeader)
    local lines = {}
    if includeHeader then
        table.insert(lines, Mechanic:GetEnvironmentHeader())
        table.insert(lines, "---")
    end
    -- Add module-specific content
    return table.concat(lines, "\n")
end
```

### Shared Utilities
Pure functions (formatting, detection, error parsing) should be placed in `Utils.lua` and exposed via `Mechanic.Utils` (and `ns.Utils`). This ensures logic is testable and reusable across all tab modules.

### Inspect Tab (Phase 8 & 11)
The Inspect tab provides frame and table inspection.
- **Universal Inspection**: Handles both WoW `Frame` objects and plain global `tables`.
- **4-Column Layout**: Tree | Properties | Details | Watch List.
- **Live Property Editor**: Edit geometry, visibility, layering, and scale in real-time.
- **Section Registry**: Extensible property sections via `InspectProperties:RegisterSection()`.
- **Contextual Tree**: Shows Ancestors (for frames) and Children (for frames).
- **Property Discovery**: Automatically lists common properties (`GetText`, `GetValue`) and iterates up to 10 members for plain tables.
- **Watch List**: Supports live-refreshing values for tracked objects.
- **DevTools Export**: Export changes as Markdown/Lua snippets.

### API Test Bench (Phase 7 & 9)
...

| Dependency | Type | Purpose |
|------------|------|---------|
| `!BugGrabber` | Optional | Error capture for Errors module |
| `FenUI` | Embedded | UI framework |
| `Ace3` | Embedded | Addon framework |
| `LibDBIcon` | Embedded | Minimap button |
| `LibDataBroker` | Embedded | Launcher support |

---

## Testing

Manual testing required - no automated test framework for this addon yet.

**Test Matrix**:
1. Load !Mechanic alone - verify UI works
2. Load with registered addons - verify registration
3. Load without !BugGrabber - verify graceful degradation
4. Verify copy output includes correct environment header


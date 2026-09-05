# Mechanic – Agent Documentation

Technical reference for AI agents working on the Mechanic in-game addon.

For CLI/Desktop documentation, see the root **[AGENTS.md](../AGENTS.md)**.

---

## Quick Reference

| Item | Value |
|------|-------|
| **Current Version** | 1.3.3 |
| **MechanicLib** | 1.0 (Minor 3) |
| **Primary Commands** | `/mech`, `/mechanic` |
| **Status** | Stable |

---

## Project Intent

Mechanic is a centralized in-game development hub that provides:

- **Inspect**: Frame and table inspector with Pick mode and Watch list
- **Console**: Aggregated debug output from all registered addons
- **Errors**: BugGrabber integration with pause/resume capability
- **Tests**: Unified view of test results across all addons
- **Performance**: Memory/CPU metrics with extended diagnostics
- **Tools**: Addon-specific diagnostic panels
- **API**: Test Bench for API discovery and Midnight readiness

---

## Architecture Note

Mechanic uses a **pragmatic traditional structure** rather than strict layered separation:

| Layer | Files | Notes |
|-------|-------|-------|
| **Utilities** | `Utils.lua` | Pure functions with FenUI fallbacks |
| **Core** | `Core.lua` | Mixed logic + events + registration |
| **View** | `UI/*.lua` | Seven tabs plus their supporting modules, using FenUI widgets |

This is intentional - Mechanic is a dev tool where full layer separation provides minimal testability benefit for significant refactoring effort.

---

## File Structure

```
Mechanic/
├── Mechanic.toc           # Addon manifest (depends on !Mechanic)
├── Core.lua               # Main addon, registration, slash commands
├── Utils.lua              # Shared pure utility functions
├── Settings.lua           # AceConfig settings panel
├── embeds.xml             # Library loading
├── Bindings.xml           # Keybindings (CTRL+SHIFT+R for reload)
├── UI/
│   ├── MainFrame.lua      # FenUI Panel + tab container
│   ├── Console.lua        # Console tab module
│   ├── Errors.lua         # Errors tab module
│   ├── Tests.lua          # Tests tab module
│   ├── Tools.lua          # Tools tab module
│   ├── API.lua            # API Test Bench module
│   ├── APIDefinitions.lua # API base schemas
│   ├── APIDefs/           # Namespace-specific definitions (200+ files)
│   ├── Inspect.lua        # Inspect tab + Pick mode
│   ├── InspectTree.lua    # Hierarchical tree component
│   ├── InspectDetails.lua # Property detail panel
│   ├── InspectProperties.lua # Editable property sections
│   ├── InspectWatch.lua   # Live-refreshing watch list
│   ├── Performance.lua    # Performance tab module
│   └── Shared/
│       ├── SplitNavLayout.lua # Reusable left-nav helper
│       └── FrameResolver.lua  # Path resolution utility
├── Libs/
│   ├── MechanicLib/       # SOURCE - synced to other addons
│   ├── FenUI/             # UI framework
│   └── Ace3 libs...
└── Locales/               # 13 locales loaded by Mechanic.toc
    ├── enUS.lua
    └── ...
```

---

## MechanicLib

MechanicLib is the integration library that other addons embed:

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

**Editing source**: `Libs/MechanicLib/MechanicLib.lua`. At runtime, `!Mechanic` loads its bootstrap copy first from `../!Mechanic/Libs/MechanicLib/MechanicLib.lua`. After changing the editing source, sync and verify every embedded copy before testing.

---

## Debugging Best Practices

> **IMPORTANT**: Use `MechanicLib:Log()` instead of `print()` for all debug output.

### Why MechanicLib:Log() over print()

| Feature | `print()` | `MechanicLib:Log()` |
|---------|-----------|---------------------|
| Output location | Chat frame only | Console buffer + copyable |
| Agent access | Requires screenshot | `addon.output` retrieves directly |
| Filtering | None | Source + category filters |
| Persistence | Lost on scroll | Saved to SavedVariables |
| Categories | None | Semantic colors (TRIGGER, API, SECRET, etc.) |

### Example

```lua
-- ❌ Don't use print() for debugging
print("[MyAddon] Cooldown cached:", spellID)

-- ✅ Use MechanicLib:Log() instead
local MechanicLib = LibStub("MechanicLib-1.0", true)
if MechanicLib then
    MechanicLib:Log("MyAddon", "Cooldown cached: " .. spellID, MechanicLib.Categories.COOLDOWN)
end
```

### Available Categories

```lua
MechanicLib.Categories = {
    TRIGGER = "[Trigger]",
    REGION = "[Region]",
    API = "[API]",
    COOLDOWN = "[Cooldown]",
    EVENT = "[Event]",
    VALIDATION = "[Validation]",
    SECRET = "[Secret]",      -- Purple highlight for Midnight values
    PERF = "[Perf]",
    LOAD = "[Load]",
    CORE = "[Core]",
}
```

---

## Tooling

### Standard Workflows

Use Mechanic's MCP tools directly with `{"addon": "Mechanic"}`:

| Task | MCP tool |
|------|----------|
| Linting | `addon.lint` |
| Formatting | `addon.format` |
| TOC validation | `addon.validate` |
| Library status | `libs.check` |

The `mech` CLI is a user-facing fallback when MCP is unavailable.

### In-Game Testing

> **IMPORTANT**: Do NOT use `reload.trigger`. Ask the user to `/reload` in WoW and wait for their confirmation before calling the `addon.output` MCP tool with `agent_mode: true` and the target selected through `diagnostic.targets`. Install/sync worktree changes before live verification; documentation-only changes require no reload.

---

## Slash Commands

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

## Libraries

| Dependency | Type | Purpose |
|------------|------|---------|
| `!Mechanic` | Required | Bootstrap loader (loads first) |
| `!BugGrabber` | Optional | Error capture for Errors module |
| `FenUI` | Local | UI framework (synced from _dev_/Libs) |
| `MechanicLib` | Local | Registration API; editing source here, bootstrap runtime copy in `!Mechanic` |
| `Ace3` | Embedded | Addon framework |
| `LibDBIcon` | Embedded | Minimap button |
| `LibDataBroker` | Embedded | Launcher support |

---

## Key Patterns

### FenUI Graceful Fallbacks

Utils.lua delegates to FenUI with robust fallbacks:

```lua
local F = FenUI and FenUI.Utils

function Utils:GetClientType()
    return F and F:GetClientType() or "Retail"
end
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

---

## Agent Guidelines

1. **Core.lua is large (41KB)** - Contains mixed concerns; edit carefully
2. **Utils.lua is pure** - Keep utility functions stateless and testable
3. **UI modules are self-contained** - Each tab manages its own state
4. **MechanicLib is edited here** - Sync and verify the `!Mechanic` runtime copy and all consuming addons after changes
5. **FenUI first** - Use FenUI widgets; add new widgets to FenUI proper
6. **Test both scenarios** - Ensure addons work with and without Mechanic

---

## Testing

Run the offline addon regressions from the repository root when Lua 5.1 is available:

```bash
lua tests/addon_regressions.lua
lua tests/overhead_regressions.lua
```

These checks cover bootstrap contracts, main-addon lifecycle behavior, and diagnostic overhead. In-game behavior still requires the following manual test matrix.

**Test Matrix**:
1. Load both `!Mechanic` and `Mechanic` without other integrated addons - verify UI opens
2. Load with registered addons - verify registration in Tools tab
3. Load without !BugGrabber - verify graceful degradation
4. Verify all tabs render correctly
5. Test Pick mode in Inspect tab
6. Verify copy output includes environment header

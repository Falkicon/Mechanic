# Mechanic - Agent Documentation

Technical reference for AI agents working on the Mechanic in-game addon.

For CLI/Desktop documentation, see the root **[AGENTS.md](../AGENTS.md)**. The diagnostic-target and reload protocol is in the [using-mechanic skill](../.claude/skills/using-mechanic/SKILL.md).

---

## Quick Reference

| Item | Value |
|------|-------|
| **Current Version** | 1.3.7 (`Mechanic.toc`; the TOC is authoritative) |
| **Interface** | 120100 (Retail), 16001 (WoW: Forever) |
| **Bootstrap** | `!Mechanic` 1.4.6 (separate addon and TOC) |
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
| **Utilities** | `Utils.lua` | Shared helpers with FenUI fallbacks |
| **Core** | `Core.lua` | Mixed logic + events + registration + slash commands |
| **View** | `UI/*.lua` | Seven tabs plus their supporting modules, using FenUI widgets |

This is intentional - Mechanic is a dev tool where full layer separation provides minimal testability benefit for significant refactoring effort.

---

## File Structure

```
Mechanic/
├── Mechanic.toc           # Addon manifest (depends on !Mechanic)
├── Core.lua               # Main addon, registration, hub sync, slash commands (~1,400 lines)
├── Utils.lua              # Shared utilities (colors, environment header, dialogs, library listing)
├── Settings.lua           # AceConfig settings panel (incl. settings registered by other addons)
├── embeds.xml             # Library loading
├── Bindings.xml           # MECHANIC_TOGGLE and MECHANIC_DEV_RELOAD bindings (no default keys)
├── UI/
│   ├── MainFrame.lua      # FenUI Panel + tab container
│   ├── Console.lua        # Console tab module
│   ├── Errors.lua         # Errors tab module
│   ├── Tests.lua          # Tests tab module
│   ├── Tools.lua          # Tools tab module
│   ├── API.lua            # API Test Bench module
│   ├── APIDefinitions.lua # API definition registry/loader
│   ├── APIDefs/           # GENERATED namespace definitions + APIDefs.xml (200+ files, see k-apidefs); never hand-edit
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
│   ├── FenUI/             # UI framework (synced copy from the FenUI repo)
│   └── Ace3 libs, LibDBIcon, LibDataBroker...
└── Locales/               # 13 locale files loaded by Mechanic.toc
```

Offline Lua harnesses covering this addon live in the repository `tests/` folder (`tests/*_regressions.lua`).

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

Complete API, capabilities table and categories: [mechaniclib reference](../.claude/skills/k-mechanic/references/mechaniclib.md).

**Editing source**: `Libs/MechanicLib/MechanicLib.lua`. At runtime, `!Mechanic` loads its bootstrap copy first from `../!Mechanic/Libs/MechanicLib/MechanicLib.lua`. After changing the editing source, sync and verify every embedded copy before testing.

---

## Debugging Best Practices

> **IMPORTANT**: Use `MechanicLib:Log()` instead of `print()` for all debug output.

### Why MechanicLib:Log() over print()

| Feature | `print()` | `MechanicLib:Log()` |
|---------|-----------|---------------------|
| Output location | Chat frame only | Console buffer + copyable |
| Agent access | Requires screenshot | `addon.output` retrieves directly (after a confirmed reload) |
| Filtering | None | Source + category filters |
| Persistence | Lost on scroll | Synced to SavedVariables (last 50 lines per addon) |
| Categories | None | Semantic tags (TRIGGER, API, SECRET, etc.) |

### Example

```lua
-- Don't use print() for debugging
print("[MyAddon] Cooldown cached:", spellID)

-- Use MechanicLib:Log() instead
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

> **IMPORTANT**: Ask the user to `/reload` in WoW and wait for their confirmation before calling the `addon.output` MCP tool with `agent_mode: true` and the target selected through `diagnostic.targets`. Install/sync worktree changes before live verification; documentation-only changes require no reload.

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
| `/mech pause` | Pause/resume the active tab |
| `/mech clear` | Clear the active tab |

Keybindings (`MECHANIC_TOGGLE`, `MECHANIC_DEV_RELOAD`) have **no default keys**; users bind them in the Key Bindings UI.

---

## Libraries

| Dependency | Type | Purpose |
|------------|------|---------|
| `!Mechanic` | Required | Bootstrap loader (loads first) |
| `!BugGrabber` | Optional | Error capture for Errors module |
| `FenCore` | Optional | Logic library (catalog reaches `fencore-*` commands) |
| `FenUI` | Local | UI framework (synced from the FenUI repo) |
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
    return (F and F.GetClientType) and F:GetClientType() or "Retail"
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

### Secret values

Check `issecretvalue(value)` before comparing, concatenating or doing arithmetic on values from APIs that can return secrets (Inspect and the bootstrap already do).

---

## Agent Guidelines

1. **Core.lua is large (~1,400 lines)** - It mixes concerns; edit carefully and keep changes local.
2. **Utils.lua is shared infrastructure** - Keep helpers small and free of tab-specific state.
3. **UI modules are self-contained** - Each tab manages its own state.
4. **MechanicLib is edited here** - Sync and verify the `!Mechanic` runtime copy and all consuming addons after changes.
5. **FenUI first** - Use FenUI widgets; add new widgets to FenUI proper (FenUI is synced, so change it in its own repo).
6. **Test both scenarios** - Ensure addons work with and without Mechanic.
7. **Generated code** - `UI/APIDefs/` is generated by `api.refresh`; change the generator, not the output.
8. **Lua 5.1** - no `goto`, `bit32` or `//`.

---

## Testing

Run the offline addon regressions from the repository root when Lua 5.1 is available (each file in `tests/`):

```bash
lua tests/addon_regressions.lua
lua tests/overhead_regressions.lua
lua tests/api_perf_regressions.lua
lua tests/inspect_regressions.lua
```

These checks cover bootstrap contracts, main-addon lifecycle behavior, diagnostic overhead, API-tab performance and the Inspect module. In-game behavior still requires the following manual test matrix.

**Test Matrix**:
1. Load both `!Mechanic` and `Mechanic` without other integrated addons - verify UI opens
2. Load with registered addons - verify registration in Tools tab
3. Load without !BugGrabber - verify graceful degradation
4. Verify all tabs render correctly
5. Test Pick mode in Inspect tab
6. Verify copy output includes environment header

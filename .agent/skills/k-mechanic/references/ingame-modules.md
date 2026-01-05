# In-Game Modules Reference

!Mechanic provides a tabbed development hub accessible via `/mech` in-game.

## Tab Overview

| Tab | Purpose | Key Features |
|-----|---------|--------------|
| **Console** | Debug output aggregation | Log levels, addon filtering, copy |
| **Errors** | BugGrabber integration | Pause/resume, clear, stack traces |
| **Tests** | Unit test results | Pass/fail counts, details, re-run |
| **Inspect** | Frame & table inspector | Pick mode, watch list, live edit |
| **Performance** | Memory/CPU metrics | History, GC triggers, warnings |
| **Tools** | Addon diagnostics | Per-addon debug panels |
| **API** | API Test Bench | Midnight readiness, secret values |

## Console Tab

Aggregates debug output from all MechanicLib-registered addons.

### Log Levels
```lua
MechanicLib:Log("MyAddon", "message", MechanicLib.Categories.DEBUG)
MechanicLib:Log("MyAddon", "message", MechanicLib.Categories.INFO)
MechanicLib:Log("MyAddon", "message", MechanicLib.Categories.WARNING)
MechanicLib:Log("MyAddon", "message", MechanicLib.Categories.ERROR)
MechanicLib:Log("MyAddon", "message", MechanicLib.Categories.TRIGGER)
```

### Features
- Filter by addon name in left nav
- Filter by log level
- Search/filter messages
- Copy with environment header
- Clear console

## Errors Tab

Integrates with !BugGrabber to capture Lua errors.

### Features
- Real-time error capture
- Pause/resume error collection
- View full stack traces
- Group errors by addon
- Copy error details for bug reports
- Clear error list

### Requirements
- Optional dependency on `!BugGrabber`
- Gracefully degrades without it (shows warning)

## Tests Tab

Displays unit test results from registered addons.

### Test Registration
```lua
MechanicLib:RegisterTests("MyAddon", {
    {
        name = "Test Name",
        func = function()
            assert(true, "Should pass")
        end
    }
})
```

### Features
- Run all tests
- Run tests for specific addon
- View pass/fail counts
- Expand test details
- Copy test results

## Inspect Tab

Frame and table inspector with Pick mode.

### Pick Mode
1. Click "Pick" button
2. Hover over any frame in game
3. Click to inspect

### Features
- **Tree View**: Ancestors and children hierarchy
- **Properties**: GetPoint, GetSize, visibility, alpha
- **Live Edit**: Modify geometry, visibility, scale
- **Watch List**: Track values across reloads
- **Export**: Generate Lua snippets for DevTools

### Universal Inspection
```lua
-- Inspect a frame
/run Mechanic:InspectFrame(UIParent)

-- Inspect a global table
/run Mechanic:InspectTable(_G.MyAddonDB)
```

### Property Sections
Extensible via `InspectProperties:RegisterSection()`:
- Geometry (position, size, scale)
- Visual (alpha, visibility, layer)
- Text (font, string, color)
- Texture (atlas, texcoords)
- Custom (addon-specific)

## Performance Tab

Memory and CPU monitoring with history.

### Metrics Displayed
- AddOn Memory (per-addon breakdown)
- Total UI Memory
- Garbage Collection stats
- Frame rate impact
- Event processing time

### Features
- Historical charts
- Memory leak detection warnings
- Force GC button (`/mech gc`)
- Extended diagnostics sub-panel

## Tools Tab

Addon-specific diagnostic panels.

### Registration
```lua
MechanicLib:RegisterToolPanel("MyAddon", {
    name = "My Debug Panel",
    create = function(parent)
        -- Build UI, return frame
        local frame = CreateFrame("Frame", nil, parent)
        -- ...
        return frame
    end
})
```

### Built-in Tools
- Health Log viewer (self-monitoring)
- Database inspector
- UI state reset

## API Tab (Test Bench)

API discovery and Midnight readiness testing.

### Features
- Browse all C_ namespaces
- Search APIs by name
- Test API calls with parameters
- Detect secret values
- Export API documentation

### Secret Value Detection
APIs returning SecretValues are flagged:
```lua
-- Shows [SECRET] indicator
C_Item.GetItemGUID(...)  -- Returns SecretValue in 12.0
```

## Slash Commands

| Command | Opens Tab |
|---------|-----------|
| `/mech` | Toggle panel |
| `/mech console` | Console |
| `/mech errors` | Errors |
| `/mech tests` | Tests |
| `/mech inspect` | Inspect |
| `/mech perf` | Performance |
| `/mech tools` | Tools |
| `/mech api` | API Bench |

## Utility Commands

| Command | Action |
|---------|--------|
| `/mech reload` | ReloadUI() |
| `/mech gc` | Force garbage collection |
| `/mech reset` | Reset UI state |

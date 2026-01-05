# MechanicLib Integration

MechanicLib is the integration library that addons embed to work with !Mechanic.

## Installation

Copy `MechanicLib` folder from `!Mechanic/Libs/` to your addon's `Libs/` folder.

### TOC Entry
```toc
## OptionalDeps: !Mechanic

Libs\MechanicLib\MechanicLib.lua
```

## Basic Usage

```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)

-- Always check if available (optional dependency)
if MechanicLib and MechanicLib:IsEnabled() then
    -- Mechanic is loaded and enabled
end
```

## Registration

```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)
if not MechanicLib then return end

MechanicLib:Register("MyAddon", {
    -- Capabilities
    logging = true,      -- Enable console logging
    tests = true,        -- Register test suite
    tools = true,        -- Register tool panel
    performance = true,  -- Include in perf monitoring
})
```

## Logging

```lua
-- Log categories
MechanicLib:Log("MyAddon", "Debug message", MechanicLib.Categories.DEBUG)
MechanicLib:Log("MyAddon", "Info message", MechanicLib.Categories.INFO)
MechanicLib:Log("MyAddon", "Warning!", MechanicLib.Categories.WARNING)
MechanicLib:Log("MyAddon", "Error occurred", MechanicLib.Categories.ERROR)
MechanicLib:Log("MyAddon", "Event triggered", MechanicLib.Categories.TRIGGER)

-- Shorthand (defaults to INFO)
MechanicLib:Log("MyAddon", "Simple message")
```

### Log Categories

| Category | Use Case |
|----------|----------|
| `DEBUG` | Verbose debugging, variable dumps |
| `INFO` | General information |
| `WARNING` | Non-fatal issues |
| `ERROR` | Errors that need attention |
| `TRIGGER` | Event triggers, state changes |

## Test Registration

```lua
MechanicLib:RegisterTests("MyAddon", {
    {
        name = "Database initializes correctly",
        func = function()
            assert(MyAddonDB ~= nil, "DB should exist")
            assert(type(MyAddonDB.profile) == "table", "Profile should be table")
        end
    },
    {
        name = "Default settings applied",
        func = function()
            local defaults = MyAddon:GetDefaults()
            assert(defaults.enabled == true)
        end
    },
    {
        name = "API wrapper handles nil",
        func = function()
            local result = MyAddon:SafeGetInfo(nil)
            assert(result == nil, "Should return nil for nil input")
        end
    }
})
```

### Test Best Practices
- Keep tests focused and fast
- Use descriptive names
- Test edge cases (nil, empty, boundary)
- Don't test Blizzard APIs directly

## Tool Panel Registration

```lua
MechanicLib:RegisterToolPanel("MyAddon", {
    name = "My Debug Tools",
    create = function(parent)
        local frame = CreateFrame("Frame", nil, parent)
        frame:SetAllPoints()
        
        -- Add debug controls
        local btn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
        btn:SetText("Dump State")
        btn:SetSize(100, 22)
        btn:SetPoint("TOPLEFT", 10, -10)
        btn:SetScript("OnClick", function()
            DevTools_Dump(MyAddonDB)
        end)
        
        return frame
    end
})
```

## Developer Mode Detection

Replace old `DevMarker.lua` patterns:

```lua
-- OLD (deprecated)
local isDev = DevMarker and DevMarker:IsEnabled()

-- NEW (MechanicLib)
local MechanicLib = LibStub("MechanicLib-1.0", true)
local isDev = MechanicLib and MechanicLib:IsEnabled()

-- Use for conditional debug features
if isDev then
    -- Register debug slash commands
    -- Enable verbose logging
    -- Show debug UI elements
end
```

## Performance Registration

```lua
-- Automatic when capability enabled
MechanicLib:Register("MyAddon", { performance = true })

-- Manual metric reporting
MechanicLib:ReportMetric("MyAddon", "cache_hits", cacheHitCount)
MechanicLib:ReportMetric("MyAddon", "process_time_ms", processingTime)
```

## Data Sync for Desktop

MechanicLib stores data in SavedVariables that the desktop tool reads:

```lua
-- Automatic sync on /reload
-- Data available at: MechanicDB.diagnostics

-- Force sync (e.g., after test run)
Mechanic:SyncAllAddonData()
```

### Synced Data
- Console logs
- Error captures
- Test results
- Performance metrics

## API Reference

### Core Methods

| Method | Description |
|--------|-------------|
| `MechanicLib:IsEnabled()` | Check if Mechanic is active |
| `MechanicLib:Register(addon, caps)` | Register addon with capabilities |
| `MechanicLib:Log(addon, msg, cat)` | Log message to Console |
| `MechanicLib:RegisterTests(addon, tests)` | Register test suite |
| `MechanicLib:RegisterToolPanel(addon, cfg)` | Register Tools panel |

### Categories Table

```lua
MechanicLib.Categories = {
    DEBUG = 1,
    INFO = 2,
    WARNING = 3,
    ERROR = 4,
    TRIGGER = 5,
}
```

## Complete Integration Example

```lua
local ADDON_NAME = ...
local MyAddon = LibStub("AceAddon-3.0"):NewAddon(ADDON_NAME, "AceEvent-3.0")

-- Optional Mechanic integration
local MechanicLib = LibStub("MechanicLib-1.0", true)
local isDev = MechanicLib and MechanicLib:IsEnabled()

function MyAddon:OnInitialize()
    -- Register with Mechanic if available
    if MechanicLib then
        MechanicLib:Register(ADDON_NAME, {
            logging = true,
            tests = true,
            tools = isDev,  -- Only show tools in dev mode
            performance = true,
        })
        
        -- Register tests
        MechanicLib:RegisterTests(ADDON_NAME, self:GetTests())
        
        -- Register tool panel (dev only)
        if isDev then
            MechanicLib:RegisterToolPanel(ADDON_NAME, {
                name = "Debug Panel",
                create = function(parent)
                    return self:CreateDebugPanel(parent)
                end
            })
        end
    end
end

function MyAddon:Log(msg, level)
    level = level or MechanicLib.Categories.INFO
    if MechanicLib then
        MechanicLib:Log(ADDON_NAME, msg, level)
    end
    -- Also print to chat in dev mode
    if isDev then
        print(format("[%s] %s", ADDON_NAME, msg))
    end
end
```

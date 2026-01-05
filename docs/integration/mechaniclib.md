# MechanicLib Registration

MechanicLib is the in-game library that connects your addon to Mechanic's ecosystem. Registration enables console logging, testing, performance metrics, tools panels, and frame inspection.

---

## Basic Registration

```lua
local ADDON_NAME = ...

-- Initialize MechanicLib if available
local MechanicLib = LibStub("MechanicLib-1.0", true)

local function OnAddonLoaded()
    if MechanicLib then
        MechanicLib:Register(ADDON_NAME, {
            version = C_AddOns.GetAddOnMetadata(ADDON_NAME, "Version"),
            
            -- Debug buffer for console output
            getDebugBuffer = function()
                return MyAddon.debugBuffer or {}
            end,
            clearDebugBuffer = function()
                if MyAddon.debugBuffer then
                    wipe(MyAddon.debugBuffer)
                end
            end,
        })
    end
end
```

---

## Full Registration (All Features)

See [Flightsim](../../../Flightsim/Flightsim.lua) for a complete example:

```lua
MechanicLib:Register(ADDON_NAME, {
    version = C_AddOns.GetAddOnMetadata(ADDON_NAME, "Version"),
    
    -- Console Integration
    getDebugBuffer = function() return MyAddon.debugBuffer or {} end,
    clearDebugBuffer = function() wipe(MyAddon.debugBuffer or {}) end,
    
    -- Testing Integration
    tests = {
        getAll = function() return MyAddon:GetTests() end,
        getCategories = function() return { "API", "UI" } end,
        run = function(id) return MyAddon:RunTest(id) end,
        getResult = function(id) return MyAddon:GetTestResult(id) end,
    },
    
    -- Performance Integration
    performance = {
        getSubMetrics = function() return MyAddon:GetPerformanceSubMetrics() end,
    },
    
    -- Tools Integration (custom panel in Mechanic's Tools tab)
    tools = {
        createPanel = function(container)
            MyAddon:CreateToolsPanel(container)
        end,
    },
    
    -- Inspect Integration (frame watch list)
    inspect = {
        getWatchFrames = function()
            return {
                { label = "Main Frame", frame = MyAddon.frame, property = "Visibility" },
                { label = "Status Bar", frame = MyAddon.statusBar, property = "Value" },
            }
        end,
    },
    
    -- Settings exposed in Mechanic UI
    settings = {
        debugMode = {
            type = "toggle",
            name = "Debug Mode",
            get = function() return MyAddonDB.profile.debugMode end,
            set = function(v) MyAddonDB.profile.debugMode = v end,
        },
    },
})
```

---

## Registration Options Reference

| Option | Type | Description |
|--------|------|-------------|
| `version` | string | Addon version string |
| `getDebugBuffer` | function | Returns array of log entries |
| `clearDebugBuffer` | function | Clears the debug buffer |
| `tests` | table | Testing integration hooks |
| `performance` | table | Performance metrics hooks |
| `tools` | table | Custom tools panel |
| `inspect` | table | Frame watch list |
| `settings` | table | Exposed settings |

---

## Unregistration (Optional)

```lua
function MyAddon:OnDisable()
    local MechanicLib = LibStub("MechanicLib-1.0", true)
    if MechanicLib then
        MechanicLib:Unregister(ADDON_NAME)
    end
end
```

---

## Related Guides

- [Console Integration](./console.md)
- [Testing Integration](./testing.md)
- [Performance Profiling](./performance.md)
- [Tools Integration](./tools.md)
- [Inspect Integration](./inspect.md)

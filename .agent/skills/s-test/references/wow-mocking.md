# WoW API Mocking

Mocking WoW APIs for unit testing.

## Basic Mock Setup

```lua
-- tests/mocks/wow_api.lua
_G.UnitName = function(unit)
    if unit == "player" then return "TestPlayer" end
    return nil
end

_G.UnitHealth = function(unit)
    return 100
end

_G.UnitHealthMax = function(unit)
    return 100
end

_G.GetTime = function()
    return os.clock()
end

_G.InCombatLockdown = function()
    return false
end
```

## Mock Tables

```lua
-- C_ namespaces
_G.C_Timer = {
    After = function(delay, callback)
        -- Immediate execution for tests
        callback()
    end,
    NewTicker = function(interval, callback, iterations)
        return { Cancel = function() end }
    end,
}

_G.C_Map = {
    GetBestMapForUnit = function(unit)
        return 84 -- Stormwind
    end,
    GetMapInfo = function(mapID)
        return { name = "Test Zone", mapType = 3 }
    end,
}
```

## Frame Mocks

```lua
local frameMock = {
    Show = function(self) self.visible = true end,
    Hide = function(self) self.visible = false end,
    IsShown = function(self) return self.visible end,
    SetPoint = function() end,
    SetSize = function() end,
    SetScript = function(self, event, handler)
        self.scripts = self.scripts or {}
        self.scripts[event] = handler
    end,
    RegisterEvent = function() end,
}

_G.CreateFrame = function(frameType, name, parent, template)
    local frame = setmetatable({}, { __index = frameMock })
    frame.visible = false
    return frame
end
```

## Using Mocks in Tests

```lua
-- tests/core_spec.lua
require("tests.mocks.wow_api")

describe("MyAddon", function()
    before_each(function()
        -- Reset combat state
        _G.InCombatLockdown = function() return false end
    end)

    describe("in combat", function()
        before_each(function()
            _G.InCombatLockdown = function() return true end
        end)

        it("should queue frame operations", function()
            -- Test queuing behavior
        end)
    end)
end)
```

## Spy/Stub with Busted

```lua
describe("event handling", function()
    it("should register events", function()
        local spy_register = spy.on(_G, "RegisterEvent")
        
        addon:OnEnable()
        
        assert.spy(spy_register).was_called()
        spy_register:revert()
    end)

    it("should call handler", function()
        local stub_handler = stub(addon, "HandleEvent")
        
        addon:ProcessEvent("TEST")
        
        assert.stub(stub_handler).was_called_with("TEST")
        stub_handler:revert()
    end)
end)
```

## LibStub Mock

```lua
local libs = {}

_G.LibStub = function(name, silent)
    if libs[name] then return libs[name] end
    if not silent then error("Library not found: " .. name) end
    return nil
end

-- Register mock libraries
libs["AceAddon-3.0"] = {
    NewAddon = function(self, name, ...)
        return { name = name }
    end,
}

libs["AceDB-3.0"] = {
    New = function(self, name, defaults)
        return {
            profile = defaults.profile or {},
            char = defaults.char or {},
            global = defaults.global or {},
        }
    end,
}
```

## Best Practices

1. **Isolate mocks** — Each test should set up needed mocks
2. **Reset state** — Clear mocks in after_each
3. **Mock minimally** — Only mock what's needed
4. **Test real logic** — Don't mock what you're testing
5. **Use spies for verification** — Track function calls

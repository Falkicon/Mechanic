# Test Integration

Mechanic supports two types of testing:

1. **Desktop Tests (Busted)** — Unit tests run via CLI outside the game
2. **In-Game Tests** — Runtime tests that verify actual WoW API behavior

---

## Desktop Tests (Busted)

Create a `Tests/` folder with Busted-style specs:

```
MyAddon/
├── Core.lua
└── Tests/
    ├── helpers_spec.lua
    └── utils_spec.lua
```

### Example Test File

See [Flightsim/Tests/helpers_spec.lua](../../../Flightsim/Tests/helpers_spec.lua)

```lua
-- Tests/helpers_spec.lua

-- Mock LibStub and WoW APIs for testing outside game
_G.LibStub = function() return { Register = function() end } end
_G.C_AddOns = { GetAddOnMetadata = function() return "1.0.0" end }

-- Load the addon files
require("MyAddon")
require("UI")

describe("MyAddon Helpers", function()
    local Utils = _G.MyAddonUI.Utils

    describe("Clamp", function()
        it("should return the value if within range", function()
            assert.equals(5, Utils.Clamp(5, 0, 10))
        end)

        it("should return the min value if below range", function()
            assert.equals(0, Utils.Clamp(-1, 0, 10))
        end)

        it("should return the max value if above range", function()
            assert.equals(10, Utils.Clamp(11, 0, 10))
        end)
    end)

    describe("ColorForPct", function()
        local function assert_near(expected, actual)
            assert.is_true(math.abs(expected - actual) < 0.001)
        end

        it("should return red for 0%", function()
            local r, g, b = Utils.ColorForPct(0)
            assert_near(0.769, r)
            assert_near(0.169, g)
        end)
    end)
end)
```

### Running Desktop Tests

```bash
# Run all tests
mech call addon.test -i '{"addon": "MyAddon"}'

# With coverage
mech call addon.test -i '{"addon": "MyAddon", "coverage": true}'
```

---

## In-Game Tests (Runtime Verification)

For tests that need actual WoW APIs (secret values, combat states, etc.), define in-game tests.

### Test Definitions

```lua
-- UI.lua

MyAddonUI.tests = {
    {
        id = "api_diag",
        name = "API Diagnostic",
        category = "API Diagnostic",
        type = "auto",
        description = "Checks core APIs for secret values.",
    },
    {
        id = "ui_compliance",
        name = "UI Compliance",
        category = "UI Compliance",
        type = "auto",
        description = "Verifies StatusBar compliance with secret passthrough.",
    },
}
```

### Test Runner Functions

```lua
function MyAddonUI:GetTests()
    return self.tests
end

function MyAddonUI:RunTest(id)
    local startTime = debugprofilestop()
    local result = self:GetTestResult(id)
    if type(result) == "table" then
        result.duration = (debugprofilestop() - startTime) / 1000
        result.id = id
    end
    return result
end

function MyAddonUI:GetTestResult(id)
    if id == "api_diag" then
        local details = {}
        
        -- Test 1: GetUnitSpeed
        local speed = GetUnitSpeed("player")
        local speedSecret = issecretvalue and issecretvalue(speed)
        table.insert(details, {
            label = 'GetUnitSpeed("player")',
            value = speedSecret and "???" or tostring(speed),
            status = speedSecret and "warn" or "pass",
        })
        
        -- Test 2: Some API check
        table.insert(details, {
            label = "C_SomeAPI.GetValue",
            value = "OK",
            status = "pass",
        })
        
        return {
            passed = true,
            message = speedSecret and "Running in Degraded Mode" or "Running in Normal Mode",
            details = details,
        }
    end
    
    return { passed = false, message = "Unknown test ID" }
end
```

### Register with MechanicLib

```lua
MechanicLib:Register(ADDON_NAME, {
    tests = {
        getAll = function() return MyAddonUI:GetTests() end,
        getCategories = function() return { "API Diagnostic", "UI Compliance" } end,
        run = function(id) return MyAddonUI:RunTest(id) end,
        getResult = function(id) return MyAddonUI:GetTestResult(id) end,
    },
})
```

---

## Test Result Format

Each test should return:

```lua
{
    passed = true,           -- boolean
    message = "Status text", -- string
    details = {              -- array of detail items
        {
            label = "Test name",
            value = "Result value",
            status = "pass",  -- "pass", "fail", or "warn"
        },
    },
    duration = 0.123,        -- seconds (added by RunTest)
    id = "test_id",          -- (added by RunTest)
}
```

---

## Viewing Results

| Location | How |
|----------|-----|
| **In-game** | Mechanic panel → Tests tab shows categories, pass/fail, details |
| **Dashboard** | Test results sync on `/reload` |
| **CLI** | `mech addon.output` includes test results |

---

## Related Guides

- [MechanicLib Registration](./mechaniclib.md)
- [Performance Profiling](./performance.md)

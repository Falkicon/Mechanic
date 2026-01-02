# Test Integration

Mechanic supports three types of testing:

1. **Sandbox Tests** — Offline tests using generated WoW API stubs (no Busted required)
2. **Desktop Tests (Busted)** — Unit tests run via CLI outside the game
3. **In-Game Tests** — Runtime tests that verify actual WoW API behavior

---

## Sandbox Tests (Recommended)

The sandbox provides a complete WoW API stub environment for testing addons offline without external dependencies.

### Setup

Your addon needs test files with the `_spec.lua` suffix in either `Core/` or `Tests/` folders:

```
MyAddon/
├── Core.lua
├── Core/
│   └── utils_spec.lua      # Tests in Core/
└── Tests/
    └── core_spec.lua       # Tests in Tests/
```

### Writing Tests

Tests use a Busted-compatible API:

```lua
-- Tests/core_spec.lua

describe("MyAddon Core", function()
    before_each(function()
        -- Setup code runs before each test
    end)

    after_each(function()
        -- Cleanup code runs after each test
    end)

    it("should initialize correctly", function()
        assert.is_not_nil(_G.MyAddon)
    end)

    it("should clamp values", function()
        assert.equals(50, MyAddon.Utils.Clamp(50, 0, 100))
        assert.equals(0, MyAddon.Utils.Clamp(-10, 0, 100))
        assert.equals(100, MyAddon.Utils.Clamp(150, 0, 100))
    end)
end)
```

### Available Assertions

| Assertion | Description |
|-----------|-------------|
| `assert.equals(expected, actual)` | Strict equality |
| `assert.not_equals(a, b)` | Values are different |
| `assert.is_true(val)` | Strictly `true` |
| `assert.is_false(val)` | Strictly `false` |
| `assert.truthy(val)` | Truthy value |
| `assert.falsy(val)` | Falsy value |
| `assert.is_nil(val)` | Value is nil |
| `assert.is_not_nil(val)` | Value is not nil |
| `assert.is_near(expected, actual, tolerance)` | Numeric proximity |
| `assert.match(pattern, str)` | String pattern match |
| `assert.same(expected, actual)` | Deep table equality |
| `assert.has_error(fn, pattern)` | Function throws error |

### Running Sandbox Tests

```bash
# Generate WoW API stubs (run once or after API changes)
mech call sandbox.generate

# Run tests for an addon
mech call sandbox.test -i '{"addon": "MyAddon"}'
```

### How It Works

1. `sandbox.generate` parses WoW's APIDefs and generates Lua stubs (~5000+ APIs)
2. `sandbox.test` builds a test script with:
   - WoW API stubs
   - Test framework
   - Addon source files
   - Spec files from `Core/` and `Tests/`
3. Tests run in plain Lua with mocked WoW environment

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

# Test Integration

Mechanic supports three types of testing:

1. **Sandbox Tests** — Offline tests using generated WoW API stubs (no Busted required)
2. **Desktop Tests (Busted)** — Unit tests run via CLI outside the game
3. **In-Game Tests** — Runtime tests that verify actual WoW API behavior

---

## Which Testing Approach?

| Method | Speed | Requires WoW? | Best For |
|--------|-------|---------------|----------|
| Sandbox | ~30ms | No | Core logic, CI/CD pipelines |
| Desktop (Busted) | ~5s | No | Integration tests, complex mocking |
| In-Game | ~30s | Yes | API behavior, UI verification, secret values |

**Recommendation:** Start with Sandbox tests for your `Core/` layer. Add In-Game tests only for features that need live API behavior.

---

## Sandbox Tests (Recommended)

The sandbox provides a complete WoW API stub environment for testing addons offline without external dependencies.

### Setup

Sandbox tests can live in either location:
- `Core/*_spec.lua` - Tests alongside source files
- `Tests/**/*_spec.lua` - Dedicated test folder (recommended)

The `Tests/` folder keeps source code clean while allowing organized test structure.

```
MyAddon/
├── Core/                    # Source files (loaded by sandbox)
│   ├── init.lua
│   ├── Actions/
│   │   └── tracker.lua
│   └── Schemas/
│       └── types.lua
└── Tests/                   # All tests (searched by sandbox)
    ├── Core/                # Tests for Core layer
    │   ├── tracker_spec.lua
    │   └── journal_spec.lua
    └── Integration/         # Full addon tests (Busted only)
        └── ui_spec.lua
```

### Writing Tests

Tests use a Busted-compatible API. Since WoW addons use `local _, ns = ...` for namespace access, you need a helper to load source files with proper varargs:

```lua
-- Tests/Core/tracker_spec.lua

-- Set up globals for addon loading (sandbox pattern)
_G.ns = { Actions = {} }

-- Stub the vararg loader that WoW addons use
local function loadAddonFile(path)
    local chunk = loadfile(path)
    if chunk then
        chunk("MyAddon", _G.ns)  -- Pass addon name and namespace
    end
end

-- Load the Core layer files
loadAddonFile("Core/Actions/tracker.lua")
local Tracker = _G.ns.Actions.Tracker

-- Tests
describe("Tracker.GetCurrencyStatus", function()
    it("returns capped status when at weekly max", function()
        local result = Tracker.GetCurrencyStatus({
            quantity = 500,
            maxWeeklyQuantity = 500,
            quantityEarnedThisWeek = 500,
        })

        assert.is_true(result.success)
        assert.is_true(result.data.isCapped)
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

### What Failures Look Like

When a test fails, you'll see clear output with the file, line, and assertion that failed:

```
FAIL Tests/Core/tracker_spec.lua:47
  Tracker.GetCurrencyStatus > returns isCapped=true when at weekly max
    Expected: true
    Got: false

  Stack: tracker_spec.lua:47: in function <tracker_spec.lua:40>

Tests: 42 total, 41 passed, 1 failed
```

**Debugging tips:**
- Check the line number in the stack trace
- Look at what the test expected vs. what it got
- Add `print()` statements temporarily to see intermediate values
- Run with `--verbose` for more detail: `mech call sandbox.test -i '{"addon": "MyAddon", "verbose": true}'`

### How It Works

1. `sandbox.generate` parses WoW's APIDefs and generates Lua stubs (~5000+ APIs)
2. `sandbox.test` builds a test script with:
   - WoW API stubs
   - Test framework
   - All `*.lua` files from `Core/` (source files)
   - All `*_spec.lua` files from `Core/` and `Tests/` (test files)
3. Tests run in plain Lua 5.1 with mocked WoW environment

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

- [Addon Architecture](../addon-architecture.md) — Three-layer design for testable addons
- [MechanicLib Registration](./mechaniclib.md)
- [Performance Profiling](./performance.md)

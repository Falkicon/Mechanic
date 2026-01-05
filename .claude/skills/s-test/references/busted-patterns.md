# Busted Test Patterns

Unit testing patterns for WoW addons.

## Basic Structure

```lua
-- tests/mymodule_spec.lua
describe("MyModule", function()
    local MyModule

    setup(function()
        -- Once before all tests
    end)

    teardown(function()
        -- Once after all tests
    end)

    before_each(function()
        -- Before each test
        MyModule = require("MyModule")
    end)

    after_each(function()
        -- After each test
        package.loaded["MyModule"] = nil
    end)

    it("should do something", function()
        -- Test code
    end)
end)
```

## Assertions

```lua
-- Equality
assert.equals(expected, actual)
assert.same(expectedTable, actualTable) -- Deep compare

-- Truthiness
assert.is_true(value)
assert.is_false(value)
assert.is_nil(value)
assert.is_not_nil(value)

-- Types
assert.is_string(value)
assert.is_number(value)
assert.is_table(value)
assert.is_function(value)

-- Errors
assert.has_error(function()
    error("boom")
end)

assert.has_no_error(function()
    -- safe code
end)
```

## Nested Describes

```lua
describe("MyAddon", function()
    describe("when initialized", function()
        it("should have defaults", function() end)
    end)

    describe("when in combat", function()
        before_each(function()
            -- Mock combat state
        end)

        it("should queue operations", function() end)
    end)
end)
```

## Pending Tests

```lua
pending("TODO: implement this test")

it("not yet implemented", function()
    pending("needs API mock")
end)
```

## Tags

```lua
it("should work #slow", function()
    -- Long running test
end)

-- Run only tagged: busted --tags=slow
-- Exclude tagged: busted --exclude-tags=slow
```

## Test File Organization

```
MyAddon/
├── tests/
│   ├── core_spec.lua
│   ├── utils_spec.lua
│   ├── ui_spec.lua
│   └── mocks/
│       └── wow_api.lua
└── .busted
```

## Busted Config

```lua
-- .busted
return {
    default = {
        verbose = true,
        coverage = false,
        ROOT = {"tests"},
    },
    ci = {
        coverage = true,
        output = "junit",
    },
}
```

## Running Tests

```bash
# All tests
mech call addon.test '{"addon": "MyAddon"}'

# With coverage
mech call addon.test '{"addon": "MyAddon", "coverage": true}'

# Specific file
busted tests/core_spec.lua

# With tag
busted --tags=unit
```

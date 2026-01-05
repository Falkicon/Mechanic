# Addon Error Patterns

Common WoW addon errors and fixes.

## Lua Runtime Errors

### attempt to index nil value

```lua
-- Error: attempt to index nil value (local 'data')
local data = GetSomeData()
print(data.name) -- data is nil!

-- Fix: Check before accessing
local data = GetSomeData()
if data then print(data.name) end
```

### attempt to call nil value

```lua
-- Error: attempt to call nil value (method 'DoSomething')
self:DoSomething() -- doesn't exist

-- Fix: Check if function exists
if self.DoSomething then
    self:DoSomething()
end

-- For WoW APIs
if C_SomeAPI and C_SomeAPI.Method then
    C_SomeAPI.Method()
end
```

### bad argument #N

```lua
-- Error: bad argument #1 to 'format' (string expected, got nil)
string.format("Hello %s", nil)

-- Fix: Validate arguments
local name = GetName() or "Unknown"
string.format("Hello %s", name)
```

### attempt to perform arithmetic on nil

```lua
-- Error: attempt to perform arithmetic on nil value
local percent = health / UnitHealthMax("target")

-- Fix: Validate both values
local health = UnitHealth("target") or 0
local maxHealth = UnitHealthMax("target") or 1
local percent = health / maxHealth
```

## Combat Lockdown Errors

### Action blocked by Blizzard

```lua
-- Error: Action[SetPoint] blocked because of ADDON_NAME
frame:SetPoint("CENTER") -- During combat!

-- Fix: Check combat state
if InCombatLockdown() then return end
frame:SetPoint("CENTER")
```

## Taint Errors

### Interface action failed

```lua
-- Causes: Modified Blizzard table, called secure function with tainted data

-- ❌ Wrong
_G["ActionButton1"].customData = "tainted"

-- ✅ Use hooks
hooksecurefunc("ActionButton_Update", function(button)
    -- Safe post-hook
end)
```

## Frame Errors

### Frame already exists

```lua
-- Fix: Check or don't use global names
local frame = _G["MyFrame"] or CreateFrame("Frame", "MyFrame", UIParent)

-- Better: Don't use names
local frame = CreateFrame("Frame", nil, UIParent)
```

## Loading Errors

### Addon not loading

Checklist:
1. .toc filename matches folder name (case-sensitive)
2. Interface version correct
3. No Lua syntax errors (`mech call addon.lint '{"addon": "MyAddon"}'`)
4. Dependencies exist
5. File paths in .toc correct

# Combat Lockdown

Protected functions and taint avoidance patterns.

## Understanding Combat Lockdown

During combat, WoW restricts operations that could give unfair advantages:
- Creating/modifying frames that affect gameplay
- Showing/hiding action bars
- Targeting, casting spells programmatically
- Moving protected frames

## Checking Combat State

```lua
if InCombatLockdown() then
    -- Can't do protected operations
    return
end

-- Events for combat transitions
self:RegisterEvent("PLAYER_REGEN_DISABLED") -- Entering combat
self:RegisterEvent("PLAYER_REGEN_ENABLED")  -- Leaving combat
```

## Protected vs Unprotected

### Safe During Combat

```lua
-- Text and visuals
fontString:SetText("Hello")
texture:SetTexture("path")
frame:SetAlpha(0.5)

-- Reading data
local name = UnitName("target")
local health = UnitHealth("player")

-- Timers and callbacks
C_Timer.After(1, function() end)

-- Secure frame visibility (if created properly)
-- See Secure Templates section
```

### Blocked During Combat

```lua
-- Frame creation/destruction
CreateFrame("Frame", nil, UIParent) -- ❌

-- Frame anchoring changes
frame:SetPoint("CENTER") -- ❌
frame:ClearAllPoints()   -- ❌

-- Parent changes
frame:SetParent(newParent) -- ❌

-- Show/Hide of protected frames
ActionButton1:Show() -- ❌
ActionButton1:Hide() -- ❌

-- Attributes on protected frames
frame:SetAttribute("type", "spell") -- ❌
```

## Queue Pattern

Queue operations for after combat:

```lua
local MyAddon = LibStub("AceAddon-3.0"):NewAddon("MyAddon", "AceEvent-3.0")

local combatQueue = {}

function MyAddon:QueueOperation(func, ...)
    if InCombatLockdown() then
        table.insert(combatQueue, { func = func, args = {...} })
        self:RegisterEvent("PLAYER_REGEN_ENABLED")
        self:Print("Queued for after combat")
    else
        func(...)
    end
end

function MyAddon:PLAYER_REGEN_ENABLED()
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    for _, op in ipairs(combatQueue) do
        op.func(unpack(op.args))
    end
    wipe(combatQueue)
end

-- Usage
MyAddon:QueueOperation(function()
    MyAddon.frame:SetPoint("CENTER")
end)
```

## Secure Templates

For combat-time actions, use secure templates:

```lua
-- Secure action button
local button = CreateFrame("Button", "MySecureButton", UIParent, "SecureActionButtonTemplate")
button:SetAttribute("type", "spell")
button:SetAttribute("spell", "Heroic Strike")

-- Secure unit button (targeting)
local unitBtn = CreateFrame("Button", nil, UIParent, "SecureUnitButtonTemplate")
unitBtn:SetAttribute("type", "target")
unitBtn:SetAttribute("unit", "focus")

-- These work IN combat because they're secure
```

### State Drivers

Change attributes based on state:

```lua
-- Show/hide based on combat state
RegisterStateDriver(frame, "visibility", "[combat] show; hide")

-- Change attribute based on modifier
RegisterStateDriver(frame, "unit", "[mod:shift] focus; target")
```

## Taint

Taint occurs when secure code touches insecure code:

```lua
-- ❌ Causes taint
local secureTable = SomeBlizzardSecureTable
secureTable.myKey = "value"  -- Taints the table

-- ❌ Calling secure functions with tainted data
local taintedValue = MyAddon.GetValue()
SecureFunction(taintedValue)  -- Spreads taint

-- ✅ Use hooks instead of modification
hooksecurefunc("SecureFunction", function(...)
    -- Your code runs AFTER the secure function
    -- Doesn't taint the original
end)
```

### Detecting Taint

```lua
-- Check if variable is tainted
local isTainted = issecurevariable("VariableName")
local isTainted, source = issecurevariable(_G, "SomeGlobal")

-- In development, enable taint logging
/console taintLog 1
-- Check Logs/taint.log
```

## Best Practices

1. **Pre-create all frames** - Create at load time, toggle visibility
2. **Never modify Blizzard tables** - Use hooks instead
3. **Check InCombatLockdown()** - Before any protected operation
4. **Use secure templates** - For combat-time button actions
5. **Queue don't block** - Let user know action is queued
6. **Test in combat** - Many bugs only appear in combat

## Common Patterns

### Toggle Frame Safely

```lua
function MyAddon:ToggleFrame()
    if InCombatLockdown() then
        self:Print("Cannot toggle during combat")
        return
    end
    
    if self.frame:IsShown() then
        self.frame:Hide()
    else
        self.frame:Show()
    end
end
```

### Safe Frame Update

```lua
function MyAddon:UpdateFramePosition(x, y)
    if InCombatLockdown() then
        self.pendingPosition = { x = x, y = y }
        self:RegisterEvent("PLAYER_REGEN_ENABLED")
        return
    end
    
    self.frame:ClearAllPoints()
    self.frame:SetPoint("CENTER", UIParent, "CENTER", x, y)
end

function MyAddon:PLAYER_REGEN_ENABLED()
    if self.pendingPosition then
        self:UpdateFramePosition(self.pendingPosition.x, self.pendingPosition.y)
        self.pendingPosition = nil
    end
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
end
```

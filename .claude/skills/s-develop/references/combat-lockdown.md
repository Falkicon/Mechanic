# Combat Lockdown

Protected functions and taint avoidance patterns.

## Understanding Combat Lockdown

During combat, WoW restricts operations on **protected** frames and secure actions so addons cannot automate gameplay:
- Showing, hiding, moving, resizing or re-parenting protected frames (action buttons, unit buttons, secure templates) and frames anchored to them
- Changing secure attributes (`SetAttribute`) on secure frames
- Targeting, casting and using items programmatically
- Creating secure/protected frames

Your own plain frames are **not** restricted: you can create, move, anchor, show and hide ordinary (non-secure) frames in combat. Restrictions apply when a frame is protected, or when anchoring ties your frame to a protected one. In 12.0+ combat also makes some API return values secret ([api-patterns.md](api-patterns.md)).

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

### Fine during combat

```lua
-- Plain frames and their visuals
local myFrame = CreateFrame("Frame", nil, UIParent)   -- non-secure template: allowed
myFrame:SetPoint("CENTER")
myFrame:Show()
fontString:SetText("Hello")
texture:SetTexture("path")
frame:SetAlpha(0.5)

-- Reading data (values may be secret in 12.0+; check issecretvalue before using them)
local name = UnitName("target")

-- Timers and callbacks
C_Timer.After(1, function() end)
```

### Blocked during combat (protected frames and secure actions)

```lua
ActionButton1:Show()                    -- protected frame
ActionButton1:SetPoint("CENTER")        -- protected frame
frame:SetAttribute("type", "spell")     -- secure frame attributes
secureFrame:SetParent(newParent)        -- re-parenting protected frames
CreateFrame("Button", nil, UIParent, "SecureActionButtonTemplate")  -- secure frame creation
```

`frame:IsProtected()` reports whether a frame is protected (and whether restrictions currently apply). A plain frame that is **anchored to** a protected frame becomes restricted too.

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
-- Causes taint
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

### Toggle a Protected Frame Safely

The guard is needed only when `self.frame` is protected or anchored to a protected frame; a plain frame can be toggled in combat.

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

### Safe Update of a Protected Frame

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

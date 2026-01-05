# Event Patterns

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2025-12-18

---

## Overview

Events are the foundation of efficient addon design. This guide consolidates event handling best practices.

**Midnight Alert**: Combat log events (`COMBAT_LOG_EVENT_UNFILTERED`) will no longer be available to addons in Midnight. Plan accordingly.

---

## Basic Event Registration

### Single Frame Handler (Recommended)

```lua
local frame = CreateFrame("Frame")

frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")

frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        InitializeAddon()
    elseif event == "PLAYER_REGEN_DISABLED" then
        EnterCombat()
    elseif event == "PLAYER_REGEN_ENABLED" then
        ExitCombat()
    end
end)
```

### Function Table Pattern (Cleaner)

```lua
local frame = CreateFrame("Frame")
local events = {}

function events:PLAYER_ENTERING_WORLD(isLogin, isReload)
    if isLogin or isReload then
        InitializeAddon()
    end
end

function events:PLAYER_REGEN_DISABLED()
    EnterCombat()
end

function events:PLAYER_REGEN_ENABLED()
    ExitCombat()
end

frame:SetScript("OnEvent", function(self, event, ...)
    if events[event] then
        events[event](self, ...)
    end
end)

for event in pairs(events) do
    frame:RegisterEvent(event)
end
```

---

## Common Events Reference

### Lifecycle Events

| Event | When | Use For |
|-------|------|---------|
| `ADDON_LOADED` | Each addon loads | Initialize your addon (check arg1) |
| `PLAYER_ENTERING_WORLD` | Login, reload, zone change | Full refresh |
| `PLAYER_LOGOUT` | Before logout | Cleanup |

### Combat Events

| Event | When | Use For |
|-------|------|---------|
| `PLAYER_REGEN_DISABLED` | Enter combat | Lock protected changes |
| `PLAYER_REGEN_ENABLED` | Exit combat | Apply queued changes |

### Spell/Cooldown Events

| Event | When | Use For |
|-------|------|---------|
| `SPELL_UPDATE_COOLDOWN` | Any cooldown changes | Update cooldown displays |
| `SPELL_UPDATE_CHARGES` | Charge-based ability changes | Update charge displays |
| `SPELLS_CHANGED` | Spell book changes | Invalidate spell caches |

### UI Events

| Event | When | Use For |
|-------|------|---------|
| `ACTIONBAR_UPDATE_STATE` | Action bar state changes | Update button states |
| `ACTIONBAR_SLOT_CHANGED` | Action bar slot changes | Update icons |
| `PLAYER_MOUNT_DISPLAY_CHANGED` | Mount status changes | Show/hide mount UI |

---

## Unit Events

Unit events can be filtered to specific units:

```lua
frame:RegisterUnitEvent("UNIT_HEALTH", "player", "target")
frame:RegisterUnitEvent("UNIT_POWER_UPDATE", "player")

frame:SetScript("OnEvent", function(self, event, unit, ...)
    if event == "UNIT_HEALTH" then
        UpdateHealthBar(unit)
    elseif event == "UNIT_POWER_UPDATE" then
        local powerType = ...
        UpdatePowerBar(unit, powerType)
    end
end)
```

**Prefer `RegisterUnitEvent`** over `RegisterEvent` for unit events - it's more efficient.

---

## Event Throttling

For events that fire frequently:

```lua
local lastUpdate = 0
local THROTTLE = 0.1  -- 100ms

function events:UNIT_HEALTH(unit)
    local now = GetTime()
    if now - lastUpdate < THROTTLE then return end
    lastUpdate = now
    
    UpdateHealthDisplay(unit)
end
```

### Bucket Events (AceEvent)

For batching multiple rapid events:

```lua
local addon = LibStub("AceAddon-3.0"):NewAddon("MyAddon", "AceEvent-3.0", "AceBucket-3.0")

function addon:OnEnable()
    -- Fires once after 0.2s of no BAG_UPDATE events
    self:RegisterBucketEvent("BAG_UPDATE", 0.2, "OnBagUpdate")
end

function addon:OnBagUpdate(bagIDs)
    -- bagIDs is a table of all bags that changed
    RefreshInventoryDisplay()
end
```

---

## Custom Messages (Inter-Addon Communication)

### AceEvent Messages

```lua
local addon = LibStub("AceAddon-3.0"):NewAddon("MyAddon", "AceEvent-3.0")

-- Register to receive
function addon:OnEnable()
    self:RegisterMessage("MYADDON_SETTINGS_CHANGED", "OnSettingsChanged")
end

function addon:OnSettingsChanged(event, settingName, newValue)
    -- Handle setting change
end

-- Send from anywhere
addon:SendMessage("MYADDON_SETTINGS_CHANGED", "opacity", 0.8)
```

### Native Callbacks

For Mixins using CallbackRegistryMixin:

```lua
-- See Frame Templates guide for CallbackRegistryMixin pattern
myObject:RegisterCallback("OnValueChanged", function(_, value)
    -- Handle callback
end)
```

---

## Event Payload Patterns

### Destructuring Arguments

```lua
function events:COMBAT_LOG_EVENT_UNFILTERED()
    local timestamp, subevent, _, sourceGUID, sourceName, _, _, 
          destGUID, destName, _, _, spellID, spellName = CombatLogGetCurrentEventInfo()
    
    if subevent == "SPELL_CAST_SUCCESS" then
        -- Handle spell cast
    end
end
```

**Midnight Warning**: This pattern will not work in Midnight. Combat log events are being removed from addon access.

### Conditional Registration

```lua
-- Only register if feature is enabled
if AddonDB.trackCooldowns then
    frame:RegisterEvent("SPELL_UPDATE_COOLDOWN")
else
    frame:UnregisterEvent("SPELL_UPDATE_COOLDOWN")
end
```

---

## Midnight Event Changes

### Events Being Removed/Restricted

| Event | Midnight Status |
|-------|-----------------|
| `COMBAT_LOG_EVENT_UNFILTERED` | Removed from addons |
| Combat log chat | Converted to KStrings |
| Instance chat events | May contain secret values |

### Safe Events

| Event | Status |
|-------|--------|
| `PLAYER_ENTERING_WORLD` | Safe |
| `PLAYER_REGEN_*` | Safe |
| `SPELL_UPDATE_COOLDOWN` | Safe (but values may be secret) |
| `UNIT_HEALTH` | Safe (but values may be secret) |

### Adaptation Pattern

```lua
local IS_MIDNIGHT = (select(4, GetBuildInfo()) >= 120000)

if not IS_MIDNIGHT then
    -- Pre-Midnight: Use combat log
    frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
else
    -- Midnight: Use alternative approach or disable feature
    print("[MyAddon] Combat log tracking disabled in Midnight")
end
```

---

## Technical Nuances (New Analyst Findings)

### The Payload Opacity Problem

**Context**: These restrictions primarily apply in **Protected Contexts** (Instanced Combat). In the open world or out-of-combat, event payloads remain readable and standard filtering logic is safe.

In Midnight instanced combat, event payloads (like `spellID`, `auraInstanceID`, or `unitHealth`) often arrive as **Secret Values**. This fundamentally changes how event handlers must be written.

#### 1. The Death of the Filter
Standard event-driven logic usually starts with a filter: `if spellID == TrackedID then`. This will **error** in combat if the ID is secret.

- **Constraint**: You cannot discriminate between events in combat handlers unless the payload is on the **Whitelist**.
- **Alternative**: Handlers must act as **Blind Pipes**. Receive the payload and immediately assign it to a passthrough-capable widget (like `StatusBar:SetValue(val)`).

#### 2. KString Transformation
Inter-addon communication payloads are converted to **KStrings** in instances. This renders standard `SendAddonMessage` data unparsable. Event handlers for custom messages should be disabled or limited to binary state-triggers (e.g., "Boss started") rather than data-sharing.

---

## Performance Best Practices

### Do

```lua
-- Register only events you need
frame:RegisterEvent("SPELL_UPDATE_COOLDOWN")

-- Unregister when not needed
frame:UnregisterEvent("SPELL_UPDATE_COOLDOWN")

-- Use unit events with filters
frame:RegisterUnitEvent("UNIT_HEALTH", "player")

-- Early return for irrelevant events
function events:UNIT_HEALTH(unit)
    if unit ~= "player" then return end
    -- ...
end
```

### Don't

```lua
-- DON'T register all events "just in case"
frame:RegisterAllEvents()  -- Never do this

-- DON'T do heavy work in frequently-fired events without throttling
function events:UNIT_HEALTH()
    RefreshEntireUI()  -- Too expensive to call every health change
end
```

---

## Debugging Events

```lua
-- Temporary event logger
local debugFrame = CreateFrame("Frame")
debugFrame:RegisterAllEvents()
debugFrame:SetScript("OnEvent", function(self, event, ...)
    print("[EVENT]", event, ...)
end)

-- Or use /etrace in-game
```

---

## Quick Reference

```lua
-- Minimal event setup
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:RegisterEvent("PLAYER_REGEN_ENABLED")
f:SetScript("OnEvent", function(self, event, ...)
    if self[event] then self[event](self, ...) end
end)

function f:PLAYER_ENTERING_WORLD(isLogin, isReload)
    -- Initialize
end

function f:PLAYER_REGEN_DISABLED()
    -- Enter combat
end

function f:PLAYER_REGEN_ENABLED()
    -- Exit combat
end
```

---

## See Also

- [Combat Lockdown](./07-combat-lockdown.doc.md) - Combat event handling
- [Performance](./08-performance.doc.md) - Throttling patterns
- [Midnight Readiness](./12-midnight-readiness.doc.md) - Event restrictions
- [Library Index](../AGENTS.md#library-index) - AceEvent-3.0



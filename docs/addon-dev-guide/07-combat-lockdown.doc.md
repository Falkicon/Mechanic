# Combat Lockdown

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2026-01-02

---

## Overview

Combat rules are not "nice to have"—they determine whether your addon works at all. Understanding protected actions, taint, and secure templates is essential.

**Midnight Alert**: Combat restrictions expand dramatically in 12.0. Beyond existing protected actions, addons lose access to combat log events, instance chat becomes secret, and many API returns become opaque "secret values."

---

## Current Protected Actions (Pre-Midnight)

During combat (`InCombatLockdown() == true`), these actions are blocked for **addon (insecure) code**:

| Action | Example |
|--------|---------|
| Protected frame attributes | `SetAttribute()` on secure frames |
| Programmatic secure button manipulation | Changing spell bindings, clicking via code |
| Certain UI modifications | Moving/reparenting action bars |
| Protected frame structure | Reparenting secure frames |

> **Note**: Hardware clicks on secure action buttons still work in combat—that's the point of secure templates. The restriction is on programmatic changes from insecure code.

---

## Secret Aspects and Visual Taint (Midnight 12.0)

In Midnight, passing Secret Values into certain script object APIs can mark those objects with **Secret Aspects**, causing specific getters to return Secrets and making some APIs inaccessible to tainted code.

### Secret Aspects (from Blizzard's API memo)

| Aspect | Affected APIs | Effect |
|--------|---------------|--------|
| **Shown** | `SetShown`, `IsShown`, `IsVisible` | Visibility state becomes secret |
| **Secret Anchors** | Anchor/position APIs | Inaccessible to tainted code; propagates down anchor chain |

### Impact
- **Symptom**: Errors like `attempt to compare ... (a secret value)` inside Blizzard files.
- **Cause**: Secret values flowed into script object APIs, marking objects with secret aspects.
- **Propagation**: Secret Anchors can cascade down an anchor chain, affecting child frames.

### Safe Styling Pattern
Guard structural edits to Blizzard frames—this is good defensive practice even if the exact taint mechanics are complex:

#### Pattern 1: Basic Guard
```lua
local function StyleBlizzardFrame(frame)
    if InCombatLockdown() then return end
    frame:Hide()
end
```

#### Pattern 2: Deferred Updates
Use `C_Timer.After(0)` to defer work and avoid re-entrancy issues when hooking Blizzard functions:

```lua
hooksecurefunc(BlizzardFrame, "OnAcquireItem", function(_, item)
    -- Defer to next tick to avoid re-entrancy issues
    C_Timer.After(0, function()
        if InCombatLockdown() then
            item.Border:SetAlpha(0)
        else
            item.Border:Hide()
        end
        item.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    end)
end)
```

> **Important**: Deferring with `C_Timer.After(0)` does **not** untaint code or grant secure execution. It's useful for avoiding re-entrancy and ordering issues, but never rely on it for security or taint removal.

---

## Midnight Combat Restrictions (12.0)

### New in Midnight

| Restriction | Impact |
|-------------|--------|
| **Combat Log Events** | No longer accessible to addons |
| **Combat Log Parsing** | Combat log chat-tab messages converted to KStrings (unparseable) |
| **Instance Chat** | Delivered to Lua as Secret Values while in an instance |
| **Addon Communication** | Disallowed while in an instance |
| **Secret Values** | Many API returns become opaque |

### What This Means

```lua
-- PRE-MIDNIGHT: This worked
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:SetScript("OnEvent", function(self, event, ...)
    local _, subEvent, _, sourceGUID = CombatLogGetCurrentEventInfo()
    -- Parse and react to combat log
end)

-- MIDNIGHT: Combat log events no longer fire for addons
-- The above code simply won't receive events during encounters
```

### Instance Communication Block

```lua
-- PRE-MIDNIGHT: Addons could send/receive during combat
C_ChatInfo.SendAddonMessage("PREFIX", data, "RAID")

-- MIDNIGHT: Disallowed while in an instance
-- Per Blizzard's API memo, addon communications are blocked in instances
```

> **Note**: Blizzard indicated during testing that restrictions were being refined based on feedback (e.g., potentially narrowing to boss encounters / Mythic+ specifically). Verify current behavior against your target build.

---

## General Guidance

### Do not attempt protected actions in combat

```lua
-- BAD: Will error in combat
function OnClick()
    secureButton:SetAttribute("spell", newSpell)
end

-- GOOD: Check lockdown first
function OnClick()
    if InCombatLockdown() then
        print("Cannot change while in combat")
        return
    end
    secureButton:SetAttribute("spell", newSpell)
end
```

### Avoid insecure hooking of protected frames

Hooking protected frames with insecure code can cause taint. If you need to react to secure frame behavior, use:

- `hooksecurefunc()` for post-hooks (safe)
- Avoid pre-hooks on protected functions

---

## Queue Pattern

If a setting change requires protected work, queue it:

```lua
local pendingChanges = {}

function QueueChange(key, value)
    if InCombatLockdown() then
        pendingChanges[key] = value
        -- Will apply after combat
    else
        ApplyChange(key, value)
    end
end

-- Register for combat end
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_ENABLED" then
        for key, value in pairs(pendingChanges) do
            ApplyChange(key, value)
        end
        wipe(pendingChanges)
    end
end)
```

---

## Secure Templates

If you need secure behavior (e.g., casting spells on click):

```lua
local button = CreateFrame("Button", "MySecureButton", UIParent, "SecureActionButtonTemplate")
button:SetAttribute("type", "spell")
button:SetAttribute("spell", "Fireball")
```

**Critical rules for secure templates**:

1. Set attributes **only** outside combat.
2. Keep insecure code minimal—don't mix secure and insecure logic.
3. Test thoroughly in combat scenarios.

---

## Taint Basics

**Taint** is a marker that tracks when insecure (addon) code has touched execution paths. Addon code is inherently tainted—the concern is contaminating secure execution paths that Blizzard's protected code relies on.

### How taint spreads

```lua
-- Writing to a secure table contaminates it
SomeSecureTable.key = "value"  -- Taints the table

-- Hooking/replacing secure functions can contaminate execution paths
SomeSecureFunction = MyFunction  -- BAD: Breaks secure execution
```

The key issue isn't that "your addon becomes tainted" (it already is), but that **writes and hooking patterns can contaminate execution paths**, blocking protected functions from running.

### Avoiding taint propagation

- Don't modify Blizzard's secure globals or tables.
- Use `hooksecurefunc()` for post-hooks—it's designed to avoid breaking secure execution paths.
- Keep your addon's namespace separate from Blizzard's.
- Avoid pre-hooks or direct replacement of protected functions.

> **About `hooksecurefunc()`**: This function runs your post-hook with taint present, then restores the previous execution mode. It cannot "remove taint" but is designed to avoid contaminating the secure execution path.

---

## Combat Event Reference

| Event | Meaning |
|-------|---------|
| `PLAYER_REGEN_DISABLED` | Entered combat |
| `PLAYER_REGEN_ENABLED` | Left combat |

```lua
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")

frame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_DISABLED" then
        self.inCombat = true
        EnterCombatMode()
    elseif event == "PLAYER_REGEN_ENABLED" then
        self.inCombat = false
        ExitCombatMode()
        ApplyPendingChanges()
    end
end)
```

---

## Midnight Combat Mode Pattern

Consider implementing a "combat mode" that gracefully degrades:

```lua
local IS_MIDNIGHT = (select(4, GetBuildInfo()) >= 120000)

local function EnterCombatMode()
    if IS_MIDNIGHT then
        -- Hide features that won't work
        CombatLogPanel:Hide()
        BossTimerPanel:SetText("Native alerts active")
        
        -- Switch to passthrough-compatible display
        UseStatusBarPassthrough()
    end
end

local function ExitCombatMode()
    if IS_MIDNIGHT then
        -- Restore full functionality
        CombatLogPanel:Show()
        BossTimerPanel:SetText("")
        
        -- Refresh all data now that APIs work
        RefreshAllData()
    end
end
```

---

## Debugging Combat Issues

1. Enable script errors: `/console scriptErrors 1`
2. Watch for "action blocked" messages.
3. Use BugGrabber/BugSack to capture stack traces.
4. Check if error only happens in combat.
5. **Midnight**: Test in M+ and raid instances specifically.

See [Debugging](./10-debugging.doc.md) for more tools.

---

## References

- [Blizzard Combat Philosophy](https://worldofwarcraft.blizzard.com/en-gb/news/24246290/combat-philosophy-and-addon-disarmament-in-midnight)
- [Secret Values Guide](./13-midnight-secret-values.doc.md)
- [Midnight Readiness Guide](./12-midnight-readiness.doc.md)

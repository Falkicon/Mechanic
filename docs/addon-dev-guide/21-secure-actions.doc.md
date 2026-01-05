# Secure Actions

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2025-12-18

---

## Overview

Secure actions are protected operations that affect gameplay (casting spells, targeting, etc.). Understanding when you need secure templates - and when you don't - prevents unnecessary complexity.

---

## When You Need Secure Templates

| Action | Requires Secure? |
|--------|------------------|
| Cast a spell on click | Yes |
| Target a unit on click | Yes |
| Use an item on click | Yes |
| Change action bar page | Yes |
| Display cooldown information | **No** |
| Show/hide frames | **No** (unless during combat) |
| Update textures/text | **No** |

**Rule of thumb**: If clicking a button performs a protected action, you need a secure template.

---

## When You Don't Need Secure Templates

Most addons are **display-only** and don't need secure templates:

- ActionHud - Displays action bar state (no casting)
- Flightsim - Displays flight speed/charges (no casting)
- Damage meters - Display combat data (no actions)
- Unit frames (display) - Show health/power (targeting is optional)

If your addon only **shows information**, use regular frames.

---

## SecureActionButtonTemplate

For buttons that cast spells or use items:

```lua
local button = CreateFrame("Button", "MySpellButton", UIParent, 
    "SecureActionButtonTemplate")

-- Set attributes OUTSIDE combat only
button:SetAttribute("type", "spell")
button:SetAttribute("spell", "Fireball")

-- Visual setup (can be done anytime)
button:SetSize(36, 36)
button:SetPoint("CENTER")
button:SetNormalTexture(C_Spell.GetSpellTexture(133))
```

### Attribute Types

| type | Additional Attributes | Action |
|------|----------------------|--------|
| `spell` | `spell` = spell name/ID | Cast spell |
| `item` | `item` = item name/ID | Use item |
| `macro` | `macro` = macro name/index | Run macro |
| `target` | `unit` = unit token | Target unit |
| `focus` | `unit` = unit token | Set focus |
| `action` | `action` = action slot | Perform action slot |

### Example: Multi-Purpose Button

```lua
local button = CreateFrame("Button", "MySecureButton", UIParent,
    "SecureActionButtonTemplate")

-- Left click casts spell
button:SetAttribute("type1", "spell")
button:SetAttribute("spell1", "Fireball")

-- Right click targets
button:SetAttribute("type2", "target")
button:SetAttribute("unit2", "focus")
```

---

## Attribute Changes in Combat

**Critical**: You cannot change secure attributes during combat.

```lua
local function SetButtonSpell(spellID)
    if InCombatLockdown() then
        -- Queue for after combat
        pendingSpell = spellID
        return
    end
    
    button:SetAttribute("spell", spellID)
end

-- Apply pending changes after combat
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:SetScript("OnEvent", function()
    if pendingSpell then
        button:SetAttribute("spell", pendingSpell)
        pendingSpell = nil
    end
end)
```

---

## State Drivers

Automatically change frame behavior based on game state:

```lua
local frame = CreateFrame("Frame", "MyStateFrame", UIParent,
    "SecureHandlerStateTemplate")

-- Show in combat, hide out of combat
RegisterStateDriver(frame, "visibility", "[combat] show; hide")

-- Custom state handling
RegisterStateDriver(frame, "mystate", "[mod:shift] shifted; normal")

frame:SetAttribute("_onstate-mystate", [[
    if newstate == "shifted" then
        -- Secure Lua: limited environment
        self:SetAlpha(0.5)
    else
        self:SetAlpha(1)
    end
]])
```

### Common State Conditions

| Condition | Meaning |
|-----------|---------|
| `[combat]` | In combat |
| `[nocombat]` | Out of combat |
| `[mod:shift]` | Shift key held |
| `[mod:ctrl]` | Ctrl key held |
| `[mod:alt]` | Alt key held |
| `[stance:1]` | In stance 1 |
| `[mounted]` | On a mount |
| `[vehicleui]` | In vehicle |
| `[petbattle]` | In pet battle |

---

## Restricted Environment

Secure handler snippets run in a restricted Lua environment:

### Available

- Basic Lua (math, string, table operations)
- Frame methods on `self`
- `GetAttribute`, `SetAttribute`
- State information

### Not Available

- Global tables
- Most API functions
- Print/debug functions
- Creating new frames

```lua
frame:SetAttribute("_onstate-combat", [[
    -- This is restricted Lua
    local alpha = self:GetAttribute("combatAlpha") or 0.5
    self:SetAlpha(alpha)
    
    -- This would ERROR:
    -- print("Combat state changed")  -- Not available
    -- CreateFrame(...)               -- Not available
]])
```

---

## Blizzard Action Bar Reference

Study Blizzard's implementation:

```
wow-ui-source-live/Interface/AddOns/Blizzard_ActionBar/
├── Mainline/ActionButton.lua      # Action button logic
├── Mainline/ActionBarController.lua
└── Shared/ActionButtonUtil.lua
```

Key patterns:
- `ActionButton_OnLoad` - Button initialization
- `ActionButton_UpdateState` - State updates
- `ActionButton_UpdateCooldown` - Cooldown display

---

## Secure vs Insecure Frames

### Hybrid Pattern

Combine secure button with insecure overlay:

```lua
-- Secure button (handles clicks)
local secureButton = CreateFrame("Button", "MySecureBtn", UIParent,
    "SecureActionButtonTemplate")
secureButton:SetAttribute("type", "spell")
secureButton:SetAttribute("spell", "Fireball")

-- Insecure overlay (handles display)
local overlay = CreateFrame("Frame", nil, secureButton)
overlay:SetAllPoints()
overlay:SetFrameLevel(secureButton:GetFrameLevel() + 1)

-- Overlay can be updated anytime
overlay.cooldown = CreateFrame("Cooldown", nil, overlay, "CooldownFrameTemplate")
overlay.cooldown:SetAllPoints()

-- Update overlay display (not restricted by combat)
local function UpdateDisplay()
    local info = C_Spell.GetSpellCooldown(133)
    if info then
        overlay.cooldown:SetCooldown(info.startTime, info.duration)
    end
end
```

---

## Common Mistakes

### Don't

```lua
-- DON'T try to change attributes in combat
button:SetScript("OnClick", function()
    button:SetAttribute("spell", newSpell)  -- ERRORS in combat
end)

-- DON'T use secure templates for display-only addons
local displayFrame = CreateFrame("Frame", nil, UIParent,
    "SecureHandlerStateTemplate")  -- Unnecessary complexity
```

### Do

```lua
-- DO check combat lockdown before attribute changes
if not InCombatLockdown() then
    button:SetAttribute("spell", newSpell)
end

-- DO use regular frames for display
local displayFrame = CreateFrame("Frame", nil, UIParent)
-- Update display anytime - it's not protected
```

---

## Quick Decision Guide

```
Does clicking your button need to:
├── Cast a spell? → SecureActionButtonTemplate
├── Target something? → SecureActionButtonTemplate  
├── Use an item? → SecureActionButtonTemplate
├── Just show info? → Regular Frame
└── Open a panel? → Regular Frame (but may need combat check for Show/Hide)
```

---

## Midnight Considerations

Secure actions remain functional in Midnight. The restrictions primarily affect:
- **Data reading** (secret values)
- **Combat log** (removed)
- **Communication** (restricted in instances)

Secure button functionality for casting/targeting is unchanged.

---

## See Also

- [Combat Lockdown](./07-combat-lockdown.doc.md) - Combat restrictions
- [Frame Templates](./18-frame-templates-mixins.doc.md) - Template inheritance
- [UI Engineering](./05-ui-engineering.doc.md) - Non-secure frame creation



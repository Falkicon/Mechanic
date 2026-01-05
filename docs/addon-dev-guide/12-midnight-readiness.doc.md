# Midnight Readiness

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2025-12-20 (added unit frame anchor patterns)

---

## Overview

WoW 12.0 (Midnight) introduces the most significant addon API changes in WoW's history. This guide covers what's changing and how to prepare.

**Key Dates**:
- **Pre-patch**: January 20, 2026
- **Full release**: March 2, 2026

---

## Blizzard's Philosophy

From the [official announcement](https://worldofwarcraft.blizzard.com/en-gb/news/24246290/combat-philosophy-and-addon-disarmament-in-midnight):

> "The overarching goal of the changes in Midnight is to level the playing field."

Blizzard wants combat addons to provide **display customization**, not **decision-making assistance**.

---

## Tools for Midnight Auditing

The `ADDON_DEV` environment provides specialized tools for auditing addons against 12.0 changes.

### 1. Blizzard UI Bridge
Use `search_blizzard_ui` and `read_blizzard_file` to research how Blizzard is handling secret values and duration objects.
- **Ripgrep Search**: Sub-second searching across all 11.2.8/12.0.0 source files.
- **Content Distillation**: Use `distill_mode="skeleton"` to quickly understand Blizzard's frame mixins and API documentation without token bloat.

### 2. Deprecation Scanner & Auto-Fixer
Scan for deprecated APIs and optionally auto-fix namespace migrations:

```bash
# Scan only (dry-run)
addon-dev fix-deprecations MyAddon

# Apply automatic fixes
addon-dev fix-deprecations MyAddon --apply

# Generate migration report
addon-dev fix-deprecations MyAddon --report
```

The tool identifies:
- Use of `COMBAT_LOG_EVENT_UNFILTERED`
- Insecure anchor modifications on Blizzard frames
- Legacy API calls slated for removal (auto-fixes namespace migrations)

---

## What's Changing

### 1. Secret Values System

Many API returns become "secret values" during combat in instances:

| API | Combat Behavior |
|-----|-----------------|
| `C_Spell.GetSpellCooldown()` | Returns secret duration |
| `C_Spell.GetSpellCharges()` | Returns secret charge counts |
| `UnitHealth(unit)` | Returns secret value |
| `UnitPower(unit)` | Returns secret value |
| `C_UnitAuras.*` | Protected, may error |

**Secret values cannot be**:
- Compared (`if health > 0`)
- Used in arithmetic (`health + 100`)
- Formatted as strings (`string.format("%d", health)`)
- Used with `tonumber()` or `or` operator

### 2. Combat Log Restrictions

- **Combat log events** no longer fire for addons
- **Combat log messages** converted to KStrings (unparseable)
- This breaks: DBM, BigWigs, Details!, Skada, etc.

### 3. Instance Communication

- **Chat messages** sent as secret values during encounters
- **Addon communication** blocked during M+/raids
- This breaks: DBM sync, WeakAura sharing, loot councils (during combat)

### 4. What Blizzard Is Adding Natively

| Feature | Status | Solution |
|---------|--------|----------|
| Damage/Healing Meters | Built-in | Direct to native |
| Boss Alerts | Built-in | Direct to native |
| Cooldown Tracking | Built-in | `CooldownViewer` reskin |
| Customizable Nameplates | Enhanced | Style-only hooks |
| **Duration Objects** | New (12.0) | `C_DurationUtil.CreateDuration` |
| **Heal Calculators** | New (12.0) | `UnitHealPredictionCalculator` |
| **Secrecy Queries** | New (12.0) | `GetSpellAuraSecrecy`, `GetPowerTypeSecrecy` |
| **Interpretive Time** | New (12.0) | `SecondsFormatter` |
| **Settings Utility** | New (12.0) | `C_SettingsUtil` namespace |

### 5. Protected APIs (Field-Tested)

Some APIs are now fully **protected** during combat in instances - they cause `ADDON_ACTION_BLOCKED` errors:

| API | Error Type | Workaround |
|-----|-----------|------------|
| `C_UnitAuras.GetPlayerAuraBySpellID()` | ADDON_ACTION_BLOCKED | Use UNIT_AURA event cache |
| `CooldownViewerSettings:GetDataProvider()` methods | Cascading secret value crashes | Pre-seed cache outside combat |
| `AuraUtil.ForEachAura()` | `unpack` error with secrets | Use direct `C_UnitAuras.GetAuraSlots()` |
| Frame region `GetDrawLayer()` | Secret value error | Use `IsObjectType()` instead |
| Any GetAttribute on protected frames | ADDON_ACTION_BLOCKED | Hook, don't query |

### 6. Frame Methods That Return Secrets

These frame/region methods return secret values during instanced combat:

| Method | Workaround |
|--------|------------|
| `texture:GetDrawLayer()` | Check `IsObjectType()` instead |
| `frame:GetAttribute(name)` | Cache values before combat |
| Various GetPoint/GetSize | May return secrets |

### 7. Unit Frame Anchor Operations (Field-Tested)

Modifying Blizzard unit frame anchoring causes taint when done repeatedly in hooks:

| Operation | Taint Risk | Workaround |
|-----------|------------|------------|
| `ManaBar:ClearAllPoints()` | ⚠️ High if repeated | One-time setup pattern |
| `ManaBar:SetPoint()` | ⚠️ High if repeated | One-time setup pattern |
| `HealthBar:SetAllPoints()` | ❌ Protected | Don't use, set width/height instead |
| `bar:SetWidth()` / `bar:SetHeight()` | ✅ Safe | Preferred approach |
| `bar:SetStatusBarTexture()` | ✅ Safe | Works for flat bar styling |
| `bar:SetStatusBarColor()` | ✅ Safe | Works for color customization |
| `bar.lockShow = 1` | ❌ Secret value | Don't modify internal properties |

**Key insight**: Anchor changes (`ClearAllPoints`, `SetPoint`) cause `ADDON_ACTION_BLOCKED` when called repeatedly during Blizzard's update hooks. Apply them **once** at setup, not on every style refresh.

### 8. Animation API Renames (11.0+)

Modern WoW (11.0+/12.0) has renamed core methods in the `Animation` system to follow a `Set[Property][From/To]` pattern. The old method names have been removed in the 12.0 engine.

| Animation Type | Old Method (NIL in 12.0) | New Method (11.0+) |
|----------------|--------------------------|--------------------|
| **Scale** | `SetFromScale(x, y)` | `SetScaleFrom(x, y)` |
| **Scale** | `SetToScale(x, y)` | `SetScaleTo(x, y)` |

**Note**: `Alpha` animations still use `SetFromAlpha` and `SetToAlpha`, and `Translation` animations still use `SetOffset`. Developers should prioritize using the `C_` namespace or FenUI's `Animation` module for abstraction.

### 9. Mouse Focus API Change (Field-Tested)

The legacy `GetMouseFocus()` API is **nil** in WoW 11.0+. The replacement `GetMouseFoci()` has fundamentally different behavior:

| Old API | New API | Behavior |
|---------|---------|----------|
| `GetMouseFocus()` | **NIL** (removed) | Recalculated on-demand |
| N/A | `GetMouseFoci()` | Returns **cached stack** at frame boundaries |

**Critical Limitation**: Any frame with `EnableMouse(true)` blocks the **entire focus stack** from `GetMouseFoci()`. The old pattern of briefly disabling mouse input to "see through" an overlay **cannot work** because `GetMouseFoci()` doesn't recalculate on-demand.

**Broken Pattern** (overlay-based frame picking):
```lua
-- This CANNOT work in 11.0+:
local overlay = CreateFrame("Frame")
overlay:EnableMouse(true)  -- Blocks GetMouseFoci()!
overlay:SetScript("OnUpdate", function(s)
    s:EnableMouse(false)
    local focus = GetMouseFoci()[1]  -- Still returns {overlay} only!
    s:EnableMouse(true)
end)
```

**Working Pattern** (event-based frame picking):
```lua
-- Use GLOBAL_MOUSE_DOWN instead of overlay:
local eventFrame = CreateFrame("Frame")

function StartPicking()
    -- Delay registration to skip the button click that started pick mode
    C_Timer.After(0.15, function()
        eventFrame:RegisterEvent("GLOBAL_MOUSE_DOWN")
        eventFrame:SetScript("OnEvent", function(s, event, button)
            if button == "LeftButton" then
                local foci = GetMouseFoci()  -- Returns REAL frames!
                local target = foci[1]
                -- ... filter UIParent, WorldFrame, your own frames
                ProcessSelection(target)
                StopPicking()
            end
        end)
    end)
end

function StopPicking()
    eventFrame:UnregisterAllEvents()
end
```

**Key Points**:
- Use `GLOBAL_MOUSE_DOWN` event for frame/click detection
- Use `C_Timer.After(0.1-0.2s)` to skip the initiating click
- Blizzard uses this pattern in `ColorPickerFrame`, `Menu.lua`, `SharedTalentUI`
- For keyboard consumption, use `SetPropagateKeyboardInput(false)`

---

### 9. EditBox Interaction & Selection (Field-Tested)

Changes in the 12.0 engine have made `EditBox` interaction more sensitive to script shadowing and parent frame conflicts.

| Issue | Cause | Symptoms | Workaround |
|-------|-------|----------|------------|
| **Selection Blocking** | `OnMouseDown` script on `EditBox` | `Ctrl+A` works, but mouse-dragging fails to select text. | Remove `OnMouseDown`/`OnMouseUp` from the `EditBox`. Use `SetAutoFocus(true)` or focus on show. |
| **Drag Interception** | `RegisterForDrag` on parent frame | Mouse-drag initiates window movement instead of text selection. | Use `OnMouseDown` + `self:StartMoving()` for window dragging instead of the "heavy" `RegisterForDrag` API. |
| **Interaction Dead-zones** | Manual height updates in `OnTextChanged` | Mouse coordinates for selection become offset or "frozen" in long fields. | Avoid manual `SetHeight` calls during active interaction. Let the `UIPanelScrollFrameTemplate` handle the scrollable area. |
| **Silent Interaction Crash** | Legacy `GetTextHeight()` call | UI thread "dies" during click, looking like a freeze. | `GetTextHeight()` is removed. Use robust calculation: `(eb:GetNumLines() or 1) * fontHeight`. |

---

## Reskin Strategy (Field-Tested)

For features that require protected APIs (like aura tracking), the **reskin approach** works:

1. **Don't create custom frames** - Let Blizzard's native UI call protected APIs
2. **Hook into Blizzard frames** using `hooksecurefunc()`
3. **Reparent and style** - Move their frames to your container
4. **Apply custom visuals** - Scale, opacity, fonts, positioning

```lua
-- Example: Reskin Blizzard's BuffIconCooldownViewer
local function SetupReskin()
    local blizzFrame = BuffIconCooldownViewer
    if not blizzFrame then return end
    
    -- Save original state for restoration
    local originalParent = blizzFrame:GetParent()
    
    -- Reparent to our container
    blizzFrame:SetParent(myContainer)
    blizzFrame:ClearAllPoints()
    blizzFrame:SetPoint("CENTER", myContainer, "CENTER", 0, 0)
    
    -- Hook to re-apply styling after Blizzard updates
    hooksecurefunc(blizzFrame, "RefreshLayout", function()
        blizzFrame:SetScale(1.5)  -- Our custom scale
    end)
end
```

**Advantage**: Blizzard's code handles all protected API calls; you just control presentation.

---

## What Survives

### Fully Functional

| Pattern | Why |
|---------|-----|
| Display-only frames | No protected actions |
| StatusBar passthrough | Accepts secret values |
| Cooldown frame passthrough | Accepts secret values |
| Event-driven updates | Stable contract |
| Settings/Configuration | Outside combat |
| Out-of-combat functionality | No restrictions |

### Degraded but Functional

| Feature | Degraded Behavior |
|---------|-------------------|
| Health bars | Display works, can't read exact values |
| Cooldown displays | Swipe works, can't show timer text |
| Charge tracking | Can show "has charges", not count |

---

## Compatibility Matrix

Create this for your addon:

| Feature | APIs Used | Combat-Safe? | Fallback Strategy |
|---------|-----------|--------------|-------------------|
| Health bar | `UnitHealth()` | ⚠️ Secret | Use `UnitHealthPercent()` or passthrough |
| Cooldown bar | `C_Spell.GetSpellCooldown()` | ⚠️ Secret | Use `Cooldown:SetCooldown()` passthrough |
| Charge display | `C_Spell.GetSpellCharges()` | ⚠️ Secret | Hide count, show binary state |
| Boss timers | Combat log | ❌ Blocked | Remove feature, direct to native |
| DPS tracking | Combat log | ❌ Blocked | Remove feature, direct to native |

---

## Implementation Patterns

### Pattern 1: Detect and Degrade

```lua
local IS_MIDNIGHT = (select(4, GetBuildInfo()) >= 120000)

local function UpdateDisplay(spellID)
    local chargeInfo = C_Spell.GetSpellCharges(spellID)
    if not chargeInfo then return end
    
    -- Check for secret values
    local isSecret = IS_MIDNIGHT and issecretvalue and 
                     issecretvalue(chargeInfo.currentCharges)
    
    if isSecret then
        -- Degraded mode
        chargeText:SetText("...")
        -- But passthrough still works
        chargeBar:SetMinMaxValues(0, 1)
        chargeBar:SetValue(1)
    else
        -- Normal mode
        chargeText:SetText(chargeInfo.currentCharges .. "/" .. chargeInfo.maxCharges)
        chargeBar:SetMinMaxValues(0, chargeInfo.maxCharges)
        chargeBar:SetValue(chargeInfo.currentCharges)
    end
end
```

### Pattern 2: Use Helper APIs

```lua
-- Instead of UnitHealth() which returns secret
local healthPercent = UnitHealthPercent("player")  -- Returns readable 0-100

-- Instead of parsing aura duration
local timeLeft = C_UnitAuras.GetAuraDurationRemainingByAuraInstanceID(unit, auraID)
```

### Pattern 3: StatusBar Passthrough & Displayable Values

```lua
-- StatusBars accept secret values and display correctly
local healthBar = CreateFrame("StatusBar", nil, parent)

local function UpdateHealth()
    local unit = "player"
    local maxHealth = UnitHealthMax(unit)  -- May be secret
    local health = UnitHealth(unit)         -- May be secret
    
    -- 1. Progress: This works! Blizzard handles the secret internally
    healthBar:SetMinMaxValues(0, maxHealth)
    healthBar:SetValue(health)

    -- 2. Text: Use the displayable flag (second parameter = true)
    local displayHealth = UnitHealth(unit, true) -- Non-secret number
    if displayHealth then
        fontString:SetText(AbbreviateNumbers(displayHealth))
    end

    -- 3. Percent: Use CurveConstants.ScaleTo100 for 0-100 numeric return
    if CurveConstants and CurveConstants.ScaleTo100 then
        local pct = UnitHealthPercent(unit, true, CurveConstants.ScaleTo100)
        percentString:SetText(string.format("%.0f%%", pct))
    end
end
```

### Pattern 4: Cooldown Passthrough

```lua
-- Cooldown frames accept secret values
local cooldown = CreateFrame("Cooldown", nil, parent, "CooldownFrameTemplate")

local function UpdateCooldown(spellID)
    local info = C_Spell.GetSpellCooldown(spellID)
    if info and info.duration > 0 then
        -- This works even with secret duration
        cooldown:SetCooldown(info.startTime, info.duration)
    else
        cooldown:Clear()
    end
end
```

### Pattern 5: One-Time Anchor Setup (Field-Tested)

Anchor changes on unit frame bars cause taint when done repeatedly. Apply them once:

```lua
-- Track which frames have been modified (reset on /reload)
local anchorsApplied = {}

local function StyleTargetFrame()
    local main = TargetFrameContent.TargetFrameContentMain
    if not main or InCombatLockdown() then return end
    
    -- Safe: Width/height changes can be called repeatedly
    local healthContainer = main.HealthBarsContainer
    if healthContainer then
        healthContainer:SetWidth(126)
        healthContainer:SetHeight(20)
        if healthContainer.HealthBar then
            healthContainer.HealthBar:SetWidth(126)
            healthContainer.HealthBar:SetHeight(20)
        end
    end
    
    -- One-time only: Anchor changes cause taint if repeated
    if main.ManaBar and not anchorsApplied["TargetMana"] then
        main.ManaBar:SetWidth(126)
        main.ManaBar:SetHeight(10)
        -- Blizzard default has x=8 offset, realign to left
        main.ManaBar:ClearAllPoints()
        main.ManaBar:SetPoint("TOPLEFT", healthContainer, "BOTTOMLEFT", 0, 0)
        anchorsApplied["TargetMana"] = true
    end
end

-- Reset anchors on settings change (requires /reload to take effect)
function MyAddon:UpdateLayout()
    wipe(anchorsApplied)
    -- ... rest of layout update
end
```

**Why this works**: Taint occurs when protected methods fire during Blizzard's update cycles (hooked functions). Doing it once at initial setup, before hooks fire repeatedly, avoids the issue.

### Pattern 6: Safe Unit Frame Styling (Field-Tested)

Style bars without touching protected properties:

```lua
local FLAT_TEXTURE = "Interface\\Buttons\\WHITE8x8"
local COLOR_MULT = 0.85  -- Slightly desaturated

local function ApplyFlatTexture(bar, unit, barType)
    if not bar then return end
    
    -- Safe: Texture and color changes
    bar:SetStatusBarTexture(FLAT_TEXTURE)
    
    if barType == "health" then
        if unit and UnitIsPlayer(unit) then
            local _, class = UnitClass(unit)
            local color = RAID_CLASS_COLORS[class]
            if color then
                bar:SetStatusBarColor(color.r * COLOR_MULT, color.g * COLOR_MULT, color.b * COLOR_MULT)
            end
        end
    elseif barType == "mana" then
        local powerType = UnitPowerType(unit)
        local color = PowerBarColor[powerType]
        if color then
            bar:SetStatusBarColor(color.r * COLOR_MULT, color.g * COLOR_MULT, color.b * COLOR_MULT)
        end
    end
    
    -- Safe: Hide animation elements
    if bar.FullPowerFrame then bar.FullPowerFrame:Hide() end
    if bar.Spark then bar.Spark:Hide() end
    if bar.FeedbackFrame then bar.FeedbackFrame:Hide() end
end
```

---

## Testing Workflow

### 1. Get Test Environment

When PTR/Beta becomes available:
- Install test client
- Copy your addon
- Update interface version

### 2. Test Sequence

```
1. Load addon in open world - should work normally
2. Enter M+ or raid instance
3. Enter combat
4. Check for errors (/console scriptErrors 1)
5. Verify degraded display works
6. Exit combat - verify full functionality returns
7. Leave instance - verify normal operation
```

### 3. Document Results

Update your compatibility matrix with test results.

---

## Automated Compatibility Auditing

This workspace provides automated tools to catch Midnight issues before they cause in-game errors.

### 1. Deprecation Scanner & Auto-Fixer
Scans for removed or modified Blizzard APIs and can automatically apply safe migrations.
- **Scan**: `addon-dev fix-deprecations MyAddon` (dry-run mode)
- **Fix**: `addon-dev fix-deprecations MyAddon --apply` (applies changes)

### 2. API Populator
Automates the discovery of 5,000+ APIs from Blizzard documentation and mines thousands of real-world usage examples from popular addons.
- **Action**: Maintain the `!Mechanic` API database via `ADDON_DEV/Tools/APIPopulator/`.

### 3. Midnight Pattern Linting
Custom linting rules flag secret value leaks, missing `pcall` wrappers, and unsafe anchor modifications.
- **Action**: Run the Cursor command `@lint` or use the `lint_addon` tool.
- **New Rules**:
  - `WOW009`: Detects unsafe anchor modifications on protected Blizzard frames.
  - `WOW010`: Detects global leakage of secret values during combat.

### 4. Blizzard UI Bridge
Search and read Blizzard's native implementation patterns directly from your development environment.
- **Action**: Use `search_blizzard_ui(query)` or `read_blizzard_file(path)` to study how Blizzard handles specific UI components without leaving your chat session.
- **How it helps**: Quickly find which native frames are protected and how Blizzard themselves styles them in 12.0.

### 5. !Mechanic API Test Bench
Manual validation of API behavior in combat with automated documentation.
- **Action**: Use `/mech api` in-game to test specific functions and verify secret returns in instance combat.

---

## Compat Layer Template

```lua
-- Compat.lua
local _, ns = ...

local interfaceVersion = select(4, GetBuildInfo())
ns.IS_MIDNIGHT = interfaceVersion >= 120000

-- Safe charge info getter
function ns.GetSpellChargesSafe(spellID)
    local info = C_Spell.GetSpellCharges(spellID)
    if not info then return nil, false, false end
    
    local isSecret = ns.IS_MIDNIGHT and issecretvalue and 
                     issecretvalue(info.currentCharges)
    
    return info, isSecret, true
end

-- Safe health getter with fallback
function ns.GetUnitHealthSafe(unit)
    if ns.IS_MIDNIGHT then
        -- Use helper API that returns readable value
        local percent = UnitHealthPercent(unit)
        if percent then
            return percent, true  -- Returns percent, isPercent
        end
    end
    
    -- Normal mode - return actual health
    return UnitHealth(unit), false
end

-- Defensive patch for Blizzard Midnight Beta UI crash (ClassyMap)
-- Prevents crash when covenant data is nil during expansion button updates
if LandingPageRenownButtonMixin and LandingPageRenownButtonMixin.UpdateButtonTextures then
    local old = LandingPageRenownButtonMixin.UpdateButtonTextures
    LandingPageRenownButtonMixin.UpdateButtonTextures = function(self)
        local id = C_Covenants.GetActiveCovenantID()
        if id and id ~= 0 and C_Covenants.GetCovenantData(id) then
            return old(self)
        end
        self:Hide()
    end
end
```

---

## Resources

### Official

- [Combat Philosophy Announcement](https://worldofwarcraft.blizzard.com/en-gb/news/24246290/combat-philosophy-and-addon-disarmament-in-midnight)
- [Day 1 Alpha UI Update](https://eu.forums.blizzard.com/en/wow/t/day-1-alpha-ui-and-addons-update/590772)

### Community

- **WoWUIDev Discord** - Real-time developer discussion
- **Warcraft Wiki** - [Patch 12.0.0 API Changes](https://warcraft.wiki.gg/wiki/Patch_12.0.0/API_changes)

### Local Reference

- **Blizzard UI Source**: `wow-ui-source-live/Interface/AddOns/`
- **API Documentation**: `Blizzard_APIDocumentationGenerated/`
- **Deprecation Guides**: `Blizzard_Deprecated/`

---

## See Also

- [Secret Values](./13-midnight-secret-values.doc.md) - Detailed secret value handling
- [Combat Lockdown](./07-combat-lockdown.doc.md) - Combat restriction details
- [API Resilience](./09-api-resilience.doc.md) - Defensive programming

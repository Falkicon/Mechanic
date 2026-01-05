# Midnight Secret Values

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2026-01-02 (updated activation rules for M+/Raids/PvP, userdata detection)

---

## Overview

Midnight (12.0) introduces "secret values" - API returns that become opaque during combat in instanced content. This is the most significant addon restriction Blizzard has ever implemented.

**Pre-patch**: January 20, 2026

---

## Context and Scope (The "Protected Context")

**Critical Distinction**: Secret Values do not exist everywhere. They are bound to the **Protected Context**, but the rules vary by content type.

- **Protected Context** (values become `Secret<T>` userdata):
    - **Mythic+ (M+)**: **ENTIRE RUN** - From key start to completion/reset. Even between pulls!
    - **Raids**: During **boss encounters** only (pull to wipe/kill). Trash is generally readable.
    - **PvP (Arena/BG)**: **Entire match** duration.
    - **Dungeons (no key)**: Generally in combat only.
- **Open Context** (values remain readable):
    - **Where**: Open world, cities, player housing.
    - **When**: Out of combat (anywhere), or in non-restricted content.
    - **Status**: APIs return **Readable Values** as they do today.

**Important**: `InCombatLockdown()` is NOT the sole indicator. In M+, secrets persist between pulls. Always check the actual value type with `issecretvalue()` or `type(v) == "userdata"`.

Addons should be designed to handle both:
1. **Detect** if a value is secret (`issecretvalue(v)` or `type(v) == "userdata"`).
2. **Switch** to "Passthrough Mode" if secret (use Blizzard widgets directly).
3. **Resume** "Logic Mode" when readable.

---

## Detection

```lua
-- issecretvalue() is a new global function in Midnight (12.0+)
-- Returns true if the value is secret, nil/false otherwise

local IS_MIDNIGHT = (select(4, GetBuildInfo()) >= 120000)

-- Primary detection: Check if a specific value is secret
local function IsValueSecret(value)
    if not IS_MIDNIGHT then return false end
    -- Primary: Use the dedicated API
    if issecretvalue then
        return issecretvalue(value) == true
    end
    -- Fallback: Secret values are userdata type
    if type(value) == "userdata" then
        return true
    end
    return false
end

-- Context detection: Are we in an environment where secrets may exist?
-- CRITICAL: This is NOT just InCombatLockdown()!
local function MayHaveSecretValues()
    if not IS_MIDNIGHT then return false end
    -- M+: Entire run is secured (even between pulls!)
    if C_ChallengeMode and C_ChallengeMode.IsChallengeModeActive
       and C_ChallengeMode.IsChallengeModeActive() then
        return true
    end
    -- Raids: During boss encounters only
    if IsEncounterInProgress and IsEncounterInProgress() then
        return true
    end
    -- PvP: Entire match
    local _, instanceType = IsInInstance()
    if instanceType == "pvp" or instanceType == "arena" then
        return true
    end
    -- Fallback: Combat in party/raid instances
    if InCombatLockdown() then
        if instanceType == "party" or instanceType == "raid" then
            return true
        end
    end
    return false
end

-- FIELD-TESTED: Reliable Type-Based Detection for numeric secrets
-- For numeric API returns, type() returns "number" but tonumber()
-- returns the secret value itself (not nil). Comparisons will crash.
local function IsNumericSecret(val)
    if type(val) ~= "number" then return false end
    local ok = pcall(function() local _ = val > 0 end)
    return not ok
end
```

---

## What Fails with Secret Values

Secret values error or behave unexpectedly when used in:

| Operation | Example | Result |
|-----------|---------|--------|
| Comparisons | `if charges > 0 then` | Error |
| Arithmetic | `charges + 1` | Error |
| String formatting | `string.format("%d", charges)` | Error |
| `tonumber()` | `tonumber(charges)` | Error |
| `or` operator | `charges or 0` | Error |
| Text display | `fontString:SetText(charges)` | Error |
| Table key | `table[charges] = true` | Error |
| Concatenation | `"Count: " .. charges` | Error |

### Field-Tested: Additional Secret Sources

From PTR testing, these also become secret in combat:

| Source | Fields Affected |
|--------|-----------------|
| Aura data (`C_UnitAuras.*`) | `spellId`, `name`, `icon`, `expirationTime`, `duration`, `applications`, `auraInstanceID` |
| Frame regions | `GetDrawLayer()` returns |
| Cooldown info | `activeCategory`, `duration`, `startTime` |
| Spell info | `castCount` from `C_Spell.GetSpellCastCount()` |

**Critical**: Even `auraInstanceID` can become secret, breaking cache lookups that use it as a key.

---

## What Works (Passthrough)

Some Blizzard widgets accept secret values directly - they handle the decryption internally:

| Widget/Method | Works? | Use Case |
|---------------|--------|----------|
| `StatusBar:SetValue(secret)` | ✅ | Health/resource bars |
| `StatusBar:SetMinMaxValues(0, secret)` | ✅ | Health/resource bars |
| `Cooldown:SetCooldown(start, secret)` | ✅ | Cooldown swipes |
| `Cooldown:SetCooldownDuration(secret, modRate)` | ✅ | Cooldown swipes |

---

## Helper APIs

Blizzard provides helper APIs that return readable values even when primary APIs return secrets:

| Secret Source | Helper API | Returns |
|---------------|------------|---------|
| `UnitHealth(unit)` | `UnitHealth(unit, true)` | **Displayable** numeric value (Safe for text) |
| `UnitPower(unit)` | `UnitPower(unit, type, true)` | **Displayable** numeric value (Safe for text) |
| `UnitHealth(unit)` | `UnitHealthPercent(unit, true, CurveConstants.ScaleTo100)` | Readable 0-100 (Safe for arithmetic) |
| `UnitHealth(unit)` | `UnitHealthMissing(unit, true)` | Readable missing amount |
| Aura duration | `C_UnitAuras.GetUnitAuraDuration(unit, id)` | **Duration Object** |
| Spell Cooldown | `C_ActionBar.GetActionCooldownRemaining(id)` | **Duration Object** |
| Cast/Channel | `UnitCastingDuration(unit)` | **Duration Object** |
| Combo Points | `GetComboPoints(unit)` | **Non-Secret** (Retail 11.2.8+) |
| Charged Points | `GetUnitChargedPowerPoints(unit)` | **Non-Secret** (Retail 11.2.8+) |

**Note**: The `true` parameter in unit health functions specifies that you want a **displayable** (non-secret) version of the value.

---

## Common Addon Patterns

### Pattern A: Passthrough Display

Pass secret values directly to widgets that support them, and use the "displayable" flag for text:

```lua
local function UpdateHealthBar(unit)
    local maxHealth = UnitHealthMax(unit)  -- May be secret
    local health = UnitHealth(unit)         -- May be secret
    
    -- 1. Passthrough - Blizzard handles it internally
    healthBar:SetMinMaxValues(0, maxHealth)
    healthBar:SetValue(health)
    
    -- 2. Text Display - Use the "displayable" flag (true)
    local displayHealth = UnitHealth(unit, true)
    if displayHealth then
        healthText:SetText(AbbreviateNumbers(displayHealth))
    else
        healthText:SetText("???")
    end
    
    -- 3. Percentages - Use CurveConstants for reliable decryption
    if UnitHealthPercent and CurveConstants then
        local pct = UnitHealthPercent(unit, true, CurveConstants.ScaleTo100)
        percentText:SetText(string.format("%.0f%%", pct))
    end
end
```

### Pattern B: Cooldown Passthrough

```lua
local function UpdateCooldownDisplay(spellID)
    local info = C_Spell.GetSpellCooldown(spellID)
    if not info then
        cooldownFrame:Clear()
        return
    end
    
    -- Passthrough works - swipe displays correctly
    cooldownFrame:SetCooldown(info.startTime, info.duration)
    
    -- But we can't show timer text
    -- info.duration may be secret, can't format it
    timerText:SetText("")  -- or hide it
end
```

### Pattern C: Binary State Detection

Sometimes you can detect binary state without reading values:

```lua
local function HasCharges(spellID)
    local info = C_Spell.GetSpellCharges(spellID)
    if not info then return false end
    
    -- Can't compare currentCharges > 0, but...
    -- Check if spell is usable as a proxy
    local isUsable = C_Spell.IsSpellUsable(spellID)
    return isUsable
end
```

### Pattern D: Safe Default Fallback

```lua
local function GetSafeChargeCount(spellID)
    local info = C_Spell.GetSpellCharges(spellID)
    if not info then return 0, 0 end
    
    -- Check if secret
    if IsValueSecret(info.currentCharges) then
        return nil, nil  -- Signal that we can't read
    end
    
    return info.currentCharges, info.maxCharges
end

-- Usage
local current, max = GetSafeChargeCount(spellID)
if current then
    chargeText:SetText(current .. "/" .. max)
else
    chargeText:SetText("...")  -- Degraded display
end
```

### Pattern E: Complete Feature Disable

For features that can't work at all:

```lua
local function UpdateCombatLogFeature()
    if IS_MIDNIGHT then
        -- Combat log is completely blocked
        combatLogPanel:Hide()
        combatLogPanel.disabled = true
        return
    end
    
    -- Normal operation...
end
```

### Pattern F: Safe Comparison Function (Field-Tested)

Direct comparisons with potentially-secret values cause errors. Use a robust safe wrapper that handles `nil` and different operators:

```lua
-- Safe comparison that handles nil and secret values (from ActionHud)
function Utils.SafeCompare(a, b, op)
    local ok, result = pcall(function()
        if a == nil or b == nil then return nil end
        if Utils.IsValueSecret(a) or Utils.IsValueSecret(b) then return nil end

        if op == ">" then return a > b
        elseif op == "<" then return a < b
        elseif op == ">=" then return a >= b
        elseif op == "<=" then return a <= b
        elseif op == "==" then return a == b
        elseif op == "~=" then return a ~= b
        end
        return nil
    end)
    return ok and result or nil
end

-- Usage
local isLong = Utils.SafeCompare(duration, 1.5, ">")
if isLong then
    -- Duration is greater than 1.5s
elseif isLong == false then
    -- Duration is 1.5s or less
else
    -- Can't determine (secret or nil)
end
```

### Pattern G: Pre-Seeding Lookup Tables (Field-Tested)

Build data mappings **outside combat** when values are readable:

```lua
local textureToSpellID = {}

local function PreSeedKnownSpells()
    if InCombatLockdown() then return end  -- Only safe outside combat
    
    -- Query spells the player knows
    for spellID = 1, 500000 do
        local info = C_Spell.GetSpellInfo(spellID)
        if info and info.iconID then
            textureToSpellID[info.iconID] = spellID
        end
    end
end

-- Call at PLAYER_ENTERING_WORLD or on PLAYER_REGEN_ENABLED
```

**Use case**: When `auraData.spellId` is secret but `auraData.icon` is readable, you can look up the spell ID from a pre-seeded texture map.

### Pattern H: Frame Region Type Checking (Field-Tested)

`GetDrawLayer()` returns secrets, but `IsObjectType()` still works:

```lua
-- DON'T: GetDrawLayer returns secret
local layer = region:GetDrawLayer()
if layer == "OVERLAY" then  -- ERROR: comparing secret value
    region:Hide()
end

-- DO: Use IsObjectType instead
local regions = {frame:GetRegions()}
for _, region in ipairs(regions) do
    if region:IsObjectType("MaskTexture") then
        region:Hide()  -- Hide mask textures
    elseif region:IsObjectType("Texture") and region ~= frame.Icon then
        region:Hide()  -- Hide non-icon textures
    end
end
```

---

## Degraded UI Strategies

When full data isn't available, show useful partial information:

| Full UI | Degraded Alternative | Implementation |
|---------|---------------------|----------------|
| "3/6 charges" | "Has charges" / "Empty" | Use `IsSpellUsable()` |
| "4.2s remaining" | Cooldown swipe only | `Cooldown:SetCooldown()` passthrough |
| "12,345 HP" | "75%" | Use `UnitHealthPercent()` |
| Exact DPS | "Damage meter disabled" | Direct to native meter |
| Boss timer "Phase 2 in 15s" | "Native alerts active" | Hide timer |

---

## Reskin Strategy (Field-Tested)

When your feature requires protected APIs (like `C_UnitAuras.GetPlayerAuraBySpellID()`), **reskin Blizzard's native frames** instead of creating your own:

### Why Reskin Works

- Blizzard's native UI code can call protected APIs
- You just reparent their frames and apply custom styling
- `hooksecurefunc()` lets you re-apply styling after Blizzard updates

### Implementation

```lua
local function SetupReskin()
    local blizzFrame = BuffIconCooldownViewer
    if not blizzFrame then 
        C_Timer.After(0.5, SetupReskin)  -- Retry if not ready
        return 
    end
    
    -- Store original state for restoration
    self.originalParent = blizzFrame:GetParent()
    self.originalPoint = {blizzFrame:GetPoint()}
    
    -- Reparent to our container
    blizzFrame:SetParent(myContainer)
    blizzFrame:ClearAllPoints()
    blizzFrame:SetPoint("CENTER", myContainer, "CENTER", 0, 0)
    
    -- Hook layout refresh to reapply our styling
    hooksecurefunc(blizzFrame, "RefreshLayout", function()
        blizzFrame:SetScale(1.5)
        blizzFrame:SetAlpha(0.9)
    end)
    
    -- Hook item frame acquisition to style individual items
    hooksecurefunc(blizzFrame, "OnAcquireItemFrame", function(_, itemFrame)
        StyleItemFrame(itemFrame)
    end)
end

local function StyleItemFrame(itemFrame)
    -- Strip Blizzard decorations
    local regions = {itemFrame:GetRegions()}
    for _, region in ipairs(regions) do
        if region:IsObjectType("MaskTexture") then
            region:Hide()  -- Remove rounded corners
        end
    end
    
    -- Apply custom styling
    if itemFrame.Icon then
        itemFrame.Icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)  -- Cleaner crop
    end
end
```

### Caveats

- **Reload required**: `hooksecurefunc()` can't be removed. Toggling features may require `/reload`.
- **Blizzard may override**: Hook ordering matters. Re-apply styling after their updates.
- **EditMode conflicts**: May need to unregister from UIParent's managed frame list.

### Field-Tested Safe vs Unsafe Operations

When reskinning Blizzard frames, some operations are safe (don't trigger internal refresh), others cause cascading errors:

| Safe Operations | Unsafe Operations |
|-----------------|-------------------|
| `frame:SetScale(x)` | `frame.iconScale = x` (triggers item refresh) |
| `frame:SetAlpha(x)` | `frame:SetHideWhenInactive(x)` (protected API calls) |
| `frame.childXPadding = x` | `containerFrame:Layout()` (triggers refresh cycle) |
| `frame.ignoreFramePositionManager = true` | `frame.layoutParent = nil` (breaks OnShow/OnHide) |
| `itemFrame:SetScale(x)` in hook | Iterating `itemFramePool` in ApplyCustomStyling |

**Key insight**: Operations in `hooksecurefunc` callbacks (like `OnAcquireItemFrame`) run AFTER Blizzard's code, so styling individual items there is safe. But calling methods that trigger new refresh cycles from `ApplyCustomStyling` is not.

### Unit Frame Bar Properties (Field-Tested)

When styling Blizzard unit frame bars (health, mana, power), some internal properties are protected:

| Safe | Unsafe |
|------|--------|
| `bar:SetStatusBarTexture(texture)` | `bar.lockShow = 1` (protected internal) |
| `bar:SetStatusBarColor(r, g, b)` | `bar.lockColor = true` (may conflict) |
| `bar:SetWidth(w)` / `bar:SetHeight(h)` | `bar:ClearAllPoints()` (taint if repeated) |
| `bar.FullPowerFrame:Hide()` | `bar:SetAllPoints(parent)` (protected) |
| `bar.Spark:Hide()` | |
| `bar.FeedbackFrame:Hide()` | |

**Example - forcing text visibility**:
```lua
-- DON'T: lockShow is a protected internal property
bar.lockShow = 1  -- Causes secret value errors

-- DO: Use Show/SetAlpha (Blizzard may override)
local textEl = bar.TextString or bar.Text
if textEl then
    textEl:Show()
    textEl:SetAlpha(1)
end
```

**Note**: Blizzard's update functions may override your `Show()` calls. For always-visible text, you may need to hook the bar's update method and reapply.

---

## Implementation Example

Complete example showing all patterns:

```lua
local IS_MIDNIGHT = (select(4, GetBuildInfo()) >= 120000)

local function IsValueSecret(value)
    return IS_MIDNIGHT and issecretvalue and issecretvalue(value)
end

local ChargeDisplay = {}

function ChargeDisplay:Update(spellID)
    local info = C_Spell.GetSpellCharges(spellID)
    if not info then
        self:Hide()
        return
    end
    
    self:Show()
    
    -- Always works: StatusBar passthrough
    self.bar:SetMinMaxValues(0, info.maxCharges)
    self.bar:SetValue(info.currentCharges)
    
    -- Check if we can read values for text
    if IsValueSecret(info.currentCharges) then
        -- Degraded mode
        self.text:SetText("...")
        self.bar:SetAlpha(0.7)  -- Visual indicator of degraded state
    else
        -- Full mode
        self.text:SetText(info.currentCharges .. "/" .. info.maxCharges)
        self.bar:SetAlpha(1.0)
    end
end
```

---

## When Secret Values Activate

Secret values are triggered by a combination of **Content Type** and **Combat State**. The strictness varies by environment.

| Context | Secret Values? | Activation Trigger |
|---------|---------------|-------------------|
| Open world solo | ❌ No | - |
| Open world combat | ❌ No | - |
| Dungeon (no key) | ⚠️ In combat | `InCombatLockdown()` |
| **Mythic+ (Challenge Mode)** | ✅ **ENTIRE RUN** | `C_ChallengeMode.IsChallengeModeActive()` - Even between pulls! |
| **Raid (any difficulty)** | ✅ During encounter | `IsEncounterInProgress()` (boss pull to wipe/kill) |
| **PvP (Arena/BG)** | ✅ Entire match | Instance type = "pvp" or "arena" |
| Delves | ⚠️ TBD | Likely in combat |
| Training Dummies (instanced) | ✅ Yes | Field-tested |

**Critical:** `InCombatLockdown()` is **NOT** the sole switch. In M+, you are in a "Secret" state even out of combat (between pulls). You must check the actual value type.

### Detection Code

```lua
-- Check if a value is secret (type becomes userdata)
local function IsValueSecret(value)
    if issecretvalue then
        return issecretvalue(value) == true
    end
    -- Fallback: secret values become userdata
    return type(value) == "userdata"
end

-- Check if we're in a secret context
local function MayHaveSecretValues()
    -- M+: entire run secured
    if C_ChallengeMode.IsChallengeModeActive() then return true end
    -- Raid: during boss encounters
    if IsEncounterInProgress() then return true end
    -- PvP: entire match
    local _, instanceType = IsInInstance()
    if instanceType == "pvp" or instanceType == "arena" then return true end
    -- Fallback: combat in instances
    if InCombatLockdown() and (instanceType == "party" or instanceType == "raid") then
        return true
    end
    return false
end
```

### Field-Tested Observations (PTR 12.0)

- **M+**: Secret values activate on key start, remain active until completion/reset
- **Raids**: Activate on `ENCOUNTER_START`, deactivate on `ENCOUNTER_END`
- Values return to readable state appropriately per content type
- Some APIs (`C_UnitAuras.GetPlayerAuraBySpellID()`) are fully protected, not just secret
- Pre-seeding data before combat (on `PLAYER_ENTERING_WORLD`) is a viable mitigation

### Pattern J: The Diagnostic Visual Pattern (Field-Tested)

When building diagnostic tools (like !Mechanic), use a consistent visual placeholder for secret values to avoid crashes and inform the user:

```lua
-- Helper for consistent value conversion
local function SafeToString(val)
    if val == nil then return "nil" end
    -- issecretvalue is the primary check
    if issecretvalue and issecretvalue(val) then 
        return "[secret]" 
    end
    -- secondary pcall for extra safety
    local ok, str = pcall(tostring, val)
    return ok and str or "[error]"
end

-- Usage in a property list
table.insert(props, string.format("Health: %s", SafeToString(UnitHealth("player"))))
```

**Why this works**:
- **Prevents Crashes**: `tostring()` on some secret types causes immediate Lua errors.
- **User Clarity**: Clearly identifies *why* a value is missing (it's protected), rather than just showing `nil` or `0`.
- **Diagnostic Friendly**: Preserves the structure of your UI while hiding restricted data.

---

## 12.0 API Change Log (New)

| Date | API | Change | Impact |
|------|-----|--------|--------|
| 2025-12-26 | `StatusBar:GetValue()` | Becomes secret in combat | Cannot read health/power from bars |
| 2025-12-26 | `StatusBar:GetMinMaxValues()` | Becomes secret in combat | Cannot read limits from bars |
| 2025-12-26 | `Region:GetDrawLayer()` | Returns secret string | Cannot check layer type via comparison |
| 2025-12-27 | `Animation:SetFromScale()` | **NIL** (Removed) | Replaced by `SetScaleFrom(x, y)` |
| 2025-12-27 | `Animation:SetToScale()` | **NIL** (Removed) | Replaced by `SetScaleTo(x, y)` |

---

## Testing Checklist

When testing Midnight compatibility:

1. **Open world** - Verify normal operation
2. **Enter instance** - Note any immediate changes
3. **Enter combat** - Check for errors, verify degraded display
4. **Watch for errors** - `/console scriptErrors 1`
5. **Exit combat** - Verify full functionality returns
6. **Leave instance** - Verify normal operation resumes
7. **Log results** - Document what works/fails

### Field-Tested Debug Techniques

1. **Use BugSack/BugGrabber** - Essential for capturing errors that flash by
2. **Use !Mechanic Console** - Automatically highlights `[Secret]` category logs in **purple**, making it easy to spot when and where secret values are leaking into your logic.
3. **Use !Mechanic API Test Bench** - Rapidly test thousands of APIs in combat using the "Run Category" feature to identify exactly which fields become secret in 12.0. Uses an automated database built from Blizzard documentation and addon scanning.
4. **Use !Mechanic Inspect** - Add specific frames or status bars to the **Watch List** to verify if `SetValue` passthrough is working correctly during combat.
5. **Create a debug log buffer** - Store events and values for later analysis
3. **Log with safe tostring**:
   ```lua
   local function SafeToString(value)
       if value == nil then return "nil" end
       if issecretvalue and issecretvalue(value) then return "???" end
       return tostring(value)
   end
   ```
4. **Test in Training Dummies area** - Instanced scenarios apply restrictions even on dummies

### Error Messages to Watch For

| Error | Cause | Solution |
|-------|-------|----------|
| `table index is secret` | Using secret value as table key | Check `IsValueSecret()` first |
| `attempt to compare ... (a secret value)` | Direct comparison with secret | Use `SafeCompare()` wrapper |
| `ADDON_ACTION_BLOCKED ... 'UNKNOWN()'` | Calling protected API | Reskin approach or remove feature |
| `attempt to compare field 'maxCharges' (a secret value)` | Blizzard code comparing after taint | Fix the taint source |
| `attempt to perform arithmetic on local 'currValue' (a secret value)` | Blizzard code calculating after taint | Fix the taint source |

### Cascading Errors from Taint (Field-Tested)

When your addon causes `ADDON_ACTION_BLOCKED` or simple combat taint, Blizzard's own code may cascade into secret value errors. This happens because Blizzard's internal scripts (which can normally read secret values) are downgraded to "insecure" execution when touching tainted frames.

| Taint Source | Cascade Errors In | Resulting Error Message |
|--------------|-------------------|-------------------------|
| `ClearAllPoints()` on `BuffBarCooldownViewer` | `Blizzard_CooldownViewer` | `attempt to compare local 'spellID' (a secret value)` |
| `SetParent()` on `Duration` text | `Blizzard_CooldownViewer` | `attempt to compare field 'maxCharges' (a secret value)` |
| `SetAllPoints()` on `HealthBar` | `Blizzard_TextStatusBar` | `attempt to perform arithmetic on 'currValue' (a secret value)` |
| Modifying `bar.lockShow` property | `Blizzard_UnitFrame` | `attempt to perform arithmetic on 'currValue' (a secret value)` |

**Solution**: The cascade errors are symptoms, not the cause. You cannot fix the error inside `Blizzard_CooldownViewer`. You must fix the **taint source** in your own code.

#### Mitigation A: Strict Guards (Recommended)
Add `InCombatLockdown()` guards around anchor/parenting modifications and defer styling to `PLAYER_REGEN_ENABLED`.

#### Mitigation B: Async Injection (Advanced)
If styling MUST happen in combat (e.g., for a HUD), use `C_Timer.After(0)` to break the taint chain. This runs your code in a fresh thread *after* Blizzard's protected code has finished its secret-value-sensitive operations.

```lua
hooksecurefunc(BlizzardFrame, "OnAcquireItem", function(_, item)
    C_Timer.After(0, function()
        -- Now safe to style visuals without causing a crash in the caller
        StyleItemVisuals(item)
    end)
end)
```

---

## Technical Nuances (New Analyst Findings)

Recent technical audits have identified additional subtle behaviors of the Midnight API that impact complex architectures.

### 1. Property Contagion (The Aspect System)
Secret values are **contagious** when applied to frame geometry. Once you set a frame's property using a secret value, that frame property itself becomes secret for the remainder of combat.

- **Example**: `frame:SetWidth(unit_health_pct)` where `unit_health_pct` is secret.
- **Impact**: `frame:GetWidth()` will now return a **Secret Value**. 
- **Consequence**: Any layout logic that tries to measure `Frame A` to position `Frame B` will error. You must use static layouts or Blizzard's native `Layout()` methods.

### 2. KString Communication Blackout
During instanced encounters, standard communication channels are obfuscated using **KStrings**.

- **Scope**: Impacts `SendAddonMessage`, `BATTLEGROUND_CHAT`, and `RAID_CHAT`.
- **Behavior**: Data sent through these channels is converted to unparsable KStrings (similar to secret values).
- **Consequence**: Cross-client synchronization for WeakAuras, cooldown counters, or damage meters is functionally impossible during active combat. Use pre-combat synchronization or post-combat reconciliation.

### 3. The Death of the Filter
Because event payloads (like Spell IDs) are often delivered as secret values, the traditional "Filter then Process" pattern is broken.

- **Constraint**: You cannot use `if spellID == 123` inside an event handler if `spellID` is secret.
- **Required Shift**: Transition to **Passthrough-Pipelines** where the event handler blindly forwards the secret payload to a UI widget (e.g., `StatusBar:SetValue(secretID)`).

---

## The "Black Box" APIs (New in Midnight)
Blizzard has introduced a category of APIs designed to display secret information without revealing the value to the addon. This is the **preferred** way to handle secret data in 12.0.

### 1. Duration Objects (`C_DurationUtil`)
The new standard for time tracking. Duration objects are first-class Lua objects that perform calculations natively on secret data.
- **Creation**: `C_DurationUtil.CreateDuration()` (creates a zero duration).
- **Evaluation**: `durationObj:EvaluateRemainingDuration()` returns a secret numeric value that can be passed to widgets.
- **Widget Integration**:
  - `StatusBar:SetTimerDuration(durationObj)` - Animates a bar based on a duration.
  - `Cooldown:SetCooldownFromDurationObject(durationObj)` - Sets a cooldown sweep.

### 2. SecondsFormatter (For Timers)
Allows displaying countdown strings for secret durations.
```lua
-- Blizzard handles the formatting internally
local formatter = CreateSecondsFormatter(0, SecondsFormatter.Abbreviation.None, true);
local duration = C_UnitAuras.GetUnitAuraDuration(unit, auraID); -- Returns Duration Object
fontString:SetText(formatter:Format(duration)); 
```

### 3. UnitHealPredictionCalculator (For Health Bars)
The new standard for rendering incoming heals and absorbs.
- `CreateUnitHealPredictionCalculator()` - Creates the calculator object.
- `UnitGetDetailedHealPrediction(unit, healer, calculator)` - Updates the calculator with fresh data.

### 4. Curve Utilities (Coloring & Alpha)
New APIs for applying logic based on secret booleans (like `isClamped` from calculators):
- `C_CurveUtil.EvaluateColorFromBoolean(secretBool, colorA, colorB, texture)`
- `C_CurveUtil.EvaluateColorValueFromBoolean(secretBool, colorA, colorB)`
- `frame:SetAlphaFromBoolean(secretBool, visibleAlpha, hiddenAlpha)` - Safely toggles visibility.

### 6. Gamepad Simulation (New in 12.0)
Blizzard now allows simulated mouse events outside of combat, specifically for gamepad support.
- `SetCursorPosition(x, y)`
- `SimulateMouseDown(button)` / `SimulateMouseUp(button)`
- `SimulateMouseClick(button)`
- `SimulateMouseWheel(delta)`
- **Restriction**: Only available **outside combat** and in response to a **gamepad hardware event**.

### 7. String Utilities (`C_StringUtil`)
Methods for handling secret strings safely:
- `C_StringUtil.EscapeLuaFormatString(secretStr)` - Replaces `%` with `%%` in secret strings.
- `RemoveContiguousSpaces(secretStr)` - Cleans up consecutive spaces.
- `EscapeLuaPatterns(secretStr)` - Escapes Lua pattern characters.

---

## The Whitelist Exceptions
Blizzard maintains a whitelist of spells whose values (cooldown, charges, duration) remain **readable** in combat.

| Resource | Key ID | Use Case |
|----------|--------|----------|
| **GCD** | 61304 | Accurate cast bar and latency tracking |
| **Skyriding Vigor** | 376747 | Custom flight HUDs |
| **Skyriding Abilities** | 372608, 361584, 372610 | Surge Forward, Whirling Surge, Skyward Ascent (readable in combat) |
| **Maelstrom Weapon** | 187880 | Enhancement Shaman resource tracking |
| **Combat Res** | (Various) | Tracking raid-wide battle res counts |

---

## Field-Tested: Visual Taint Cascade

When your addon interacts with Blizzard's UI layer APIs, you can cause **taint that cascades** into Blizzard's own code. Their internal scripts, which normally handle secret values correctly, become "insecure" when touching tainted data and crash.

### CooldownViewerSettings Data Provider (Field-Tested)

The `CooldownViewerSettings:GetDataProvider()` API returns an object that internally calls protected `C_CooldownViewer` APIs. When you call methods like `GetOrderedCooldownIDsForCategory()` or `GetCooldownInfoForID()` during combat, Blizzard's code internally compares secret spellIDs and crashes.

| API | Behavior | Error |
|-----|----------|-------|
| `provider:GetOrderedCooldownIDsForCategory(cat)` | Compares spellIDs internally | `attempt to compare local 'spellID' (a secret value)` |
| `provider:GetCooldownInfoForID(id)` | Accesses secret fields | `attempt to compare field 'maxCharges' (a secret value)` |

**Solution: Pre-seeded Cache Pattern**

Cache the data **outside combat** and use cached data during combat:

```lua
local cooldownCache = {
    categoryIDs = {},  -- [category] = { cooldownID, ... }
    cooldownInfo = {}, -- [cooldownID] = info
    valid = false,
}

function MyAddon:RefreshCooldownCache()
    if InCombatLockdown() then return end
    wipe(cooldownCache.categoryIDs)
    wipe(cooldownCache.cooldownInfo)

    local provider = CooldownViewerSettings:GetDataProvider()
    if not provider then return end

    for _, category in ipairs(categories) do
        local ok, ids = pcall(provider.GetOrderedCooldownIDsForCategory, provider, category)
        if ok and ids then
            cooldownCache.categoryIDs[category] = {}
            for _, id in ipairs(ids) do
                table.insert(cooldownCache.categoryIDs[category], id)
                local infoOk, info = pcall(provider.GetCooldownInfoForID, provider, id)
                if infoOk and info then
                    -- Deep copy to avoid secret value contamination
                    cooldownCache.cooldownInfo[id] = {
                        spellID = info.spellID,
                        overrideSpellID = info.overrideSpellID,
                        linkedSpellIDs = info.linkedSpellIDs,
                    }
                end
            end
        end
    end
    cooldownCache.valid = true
end

function MyAddon:GetCooldownIDs(category)
    if InCombatLockdown() or MayHaveSecretValues() then
        return cooldownCache.valid and cooldownCache.categoryIDs[category] or {}
    end
    if not cooldownCache.valid then
        self:RefreshCooldownCache()
    end
    return cooldownCache.categoryIDs[category] or {}
end
```

**Cache refresh triggers:**
- `PLAYER_ENTERING_WORLD` - Initial population
- `PLAYER_REGEN_ENABLED` - Refresh if invalidated during combat
- `CooldownViewerSettings.OnDataChanged` - User changed config

---

### AuraUtil.ForEachAura Crash (Field-Tested)

The `AuraUtil.ForEachAura()` helper function crashes in Midnight when aura data contains secret values. It internally calls `UnpackAuraData()` which fails with:

```
bad argument #1 to 'unpack' (table expected, got secret)
```

**Solution: Use Direct C_UnitAuras APIs**

Replace `AuraUtil.ForEachAura` with direct slot iteration:

```lua
-- DON'T: AuraUtil crashes with secrets
AuraUtil.ForEachAura("player", "HELPFUL", nil, function(aura)
    -- This crashes when aura fields are secret
end)

-- DO: Direct slot iteration with pcall protection
local function ScanAuras(unit, filter)
    local results = {}
    local slots = C_UnitAuras.GetAuraSlots(unit, filter)
    if not slots then return results end

    for _, slot in ipairs(slots) do
        local ok, aura = pcall(C_UnitAuras.GetAuraDataBySlot, unit, slot)
        if ok and aura then
            table.insert(results, aura)
        end
    end
    return results
end

local buffs = ScanAuras("player", "HELPFUL")
```

**Why this works:**
- `C_UnitAuras.GetAuraSlots()` returns slot indices (not secret)
- `C_UnitAuras.GetAuraDataBySlot()` returns aura data with potentially secret fields
- The `pcall` wrapper catches any errors from individual aura access
- You can still use aura fields in passthrough patterns (StatusBar, Cooldown widgets)

---

### C_UnitAuras.GetPlayerAuraBySpellID Protection (Field-Tested)

This API is **fully protected** during instanced combat, not just returning secrets:

```lua
-- This causes ADDON_ACTION_BLOCKED in M+/raids
local aura = C_UnitAuras.GetPlayerAuraBySpellID(spellID)
```

**Solution: Event-driven aura cache**

Build an aura cache from `UNIT_AURA` events instead of querying directly:

```lua
local auraCache = {}

function MyAddon:OnUnitAura(event, unit, updateInfo)
    if unit ~= "player" then return end

    -- Rebuild cache from slots (safe)
    wipe(auraCache)
    local slots = C_UnitAuras.GetAuraSlots("player", "HELPFUL")
    if slots then
        for _, slot in ipairs(slots) do
            local ok, aura = pcall(C_UnitAuras.GetAuraDataBySlot, "player", slot)
            if ok and aura and aura.spellId then
                auraCache[aura.spellId] = aura
            end
        end
    end
end

function MyAddon:GetPlayerAura(spellID)
    return auraCache[spellID]
end
```

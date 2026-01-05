# Error Recovery

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2025-12-18

---

## Overview

Robust addons recover gracefully from errors. This guide covers patterns for feature isolation, self-healing, and user-friendly error handling.

---

## Feature Isolation

### Principle

One feature failing should not break the entire addon.

### Pattern: Protected Feature Calls

```lua
local function SafeCall(func, ...)
    local ok, err = pcall(func, ...)
    if not ok then
        -- Log error but don't crash
        if AddonDB.debugMode then
            print("|cffff0000[MyAddon] Error:|r", err)
        end
        return false, err
    end
    return true
end

-- Usage
SafeCall(UpdateCooldownDisplay)
SafeCall(RefreshHealthBars)
-- If one fails, others still run
```

### Pattern: Module Isolation

```lua
local modules = {}

function RegisterModule(name, initFunc)
    modules[name] = {
        init = initFunc,
        enabled = true,
        error = nil
    }
end

function InitializeModules()
    for name, module in pairs(modules) do
        local ok, err = pcall(module.init)
        if not ok then
            module.enabled = false
            module.error = err
            print("|cffff0000[MyAddon]|r Module '" .. name .. "' failed to load")
        end
    end
end

-- Usage
RegisterModule("cooldowns", InitCooldowns)
RegisterModule("healthBars", InitHealthBars)
RegisterModule("combatLog", InitCombatLog)  -- May fail in Midnight
```

---

## Corrupted SavedVariables Recovery

### Detection

```lua
local function ValidateDB()
    -- Check for required structure
    if type(AddonDB) ~= "table" then
        return false, "DB is not a table"
    end
    
    if type(AddonDB.profile) ~= "table" then
        return false, "Missing profile table"
    end
    
    -- Check for valid value types
    if AddonDB.profile.opacity and type(AddonDB.profile.opacity) ~= "number" then
        return false, "Invalid opacity type"
    end
    
    return true
end
```

### Recovery

```lua
local DEFAULTS = {
    profile = {
        enabled = true,
        opacity = 1.0,
        position = { x = 0, y = 0 }
    }
}

local function RecoverDB()
    local valid, err = ValidateDB()
    
    if not valid then
        print("|cffff9900[MyAddon]|r Settings corrupted, resetting to defaults")
        print("|cffff9900[MyAddon]|r Reason:", err)
        
        -- Backup corrupted data (optional)
        if AddonDB then
            AddonDB_Backup = CopyTable(AddonDB)
        end
        
        -- Reset to defaults
        AddonDB = CopyTable(DEFAULTS)
    else
        -- Deep merge defaults (add missing keys)
        CopyDefaults(AddonDB, DEFAULTS)
    end
end

-- Call on ADDON_LOADED
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "MyAddon" then
        RecoverDB()
    end
end)
```

### Partial Recovery

Recover only corrupted sections:

```lua
local function RecoverSection(section, defaults)
    if type(AddonDB[section]) ~= "table" then
        AddonDB[section] = CopyTable(defaults)
        return true  -- Was recovered
    end
    return false  -- Was fine
end

-- Usage
RecoverSection("profile", DEFAULTS.profile)
RecoverSection("position", DEFAULTS.position)
```

---

## Self-Healing Patterns

### Auto-Disable Broken Features

```lua
local featureErrors = {}
local MAX_ERRORS = 3

local function TrackFeatureError(featureName)
    featureErrors[featureName] = (featureErrors[featureName] or 0) + 1
    
    if featureErrors[featureName] >= MAX_ERRORS then
        print("|cffff0000[MyAddon]|r Disabling '" .. featureName .. "' due to repeated errors")
        DisableFeature(featureName)
        return true  -- Was disabled
    end
    return false
end

local function SafeFeatureUpdate(featureName, updateFunc)
    local ok, err = pcall(updateFunc)
    if not ok then
        if TrackFeatureError(featureName) then
            -- Feature was disabled
        end
    else
        -- Success - reset error count
        featureErrors[featureName] = 0
    end
end
```

### Frame State Recovery

```lua
local function RecoverFrameState(frame)
    -- Check if frame exists
    if not frame then return false end
    
    -- Check parent
    if not frame:GetParent() then
        frame:SetParent(UIParent)
    end
    
    -- Check position
    if not frame:GetPoint() then
        frame:SetPoint("CENTER")
    end
    
    -- Check size
    local width, height = frame:GetSize()
    if width == 0 or height == 0 then
        frame:SetSize(200, 100)  -- Default size
    end
    
    return true
end
```

---

## User-Friendly Error Messages

### Don't

```lua
-- DON'T show technical errors to users
print("Error: attempt to index nil value 'spellInfo' at line 234")
```

### Do

```lua
-- DO provide actionable messages
local function ShowUserError(feature, suggestion)
    print("|cffff9900[MyAddon]|r " .. feature .. " encountered an issue.")
    if suggestion then
        print("|cffff9900[MyAddon]|r " .. suggestion)
    end
end

-- Usage
ShowUserError(
    "Cooldown tracking",
    "Try /myaddon reset or report this issue if it persists."
)
```

### Error Severity Levels

```lua
local function LogError(severity, message)
    local prefix = {
        info = "|cff00ff00[MyAddon]|r ",
        warn = "|cffff9900[MyAddon]|r ",
        error = "|cffff0000[MyAddon]|r "
    }
    
    print((prefix[severity] or prefix.info) .. message)
end

-- Usage
LogError("info", "Addon loaded successfully")
LogError("warn", "Some features unavailable in Midnight combat")
LogError("error", "Failed to initialize - try /myaddon reset")
```

---

## Graceful Degradation

### Midnight Example

```lua
local IS_MIDNIGHT = (select(4, GetBuildInfo()) >= 120000)

local function UpdateChargeDisplay(spellID)
    local info = C_Spell.GetSpellCharges(spellID)
    if not info then
        -- No charges - hide display
        chargeFrame:Hide()
        return
    end
    
    -- Check for secret values in Midnight
    if IS_MIDNIGHT and issecretvalue and issecretvalue(info.currentCharges) then
        -- Degraded mode - show something useful
        chargeFrame:Show()
        chargeText:SetText("...")
        chargeBar:SetAlpha(0.7)
        
        -- Try passthrough anyway
        local ok = pcall(function()
            chargeBar:SetMinMaxValues(0, info.maxCharges)
            chargeBar:SetValue(info.currentCharges)
        end)
        
        if not ok then
            -- Passthrough failed - hide entirely
            chargeFrame:Hide()
        end
        return
    end
    
    -- Normal mode - full display
    chargeFrame:Show()
    chargeText:SetText(info.currentCharges .. "/" .. info.maxCharges)
    chargeBar:SetAlpha(1.0)
    chargeBar:SetMinMaxValues(0, info.maxCharges)
    chargeBar:SetValue(info.currentCharges)
end
```

---

## Reset Command

Always provide a reset option:

```lua
function commands.reset()
    if InCombatLockdown() then
        print("[MyAddon] Cannot reset during combat")
        return
    end
    
    -- Confirm with user
    StaticPopupDialogs["MYADDON_RESET"] = {
        text = "Reset MyAddon to default settings?",
        button1 = "Yes",
        button2 = "No",
        OnAccept = function()
            wipe(AddonDB)
            ReloadUI()
        end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
    }
    StaticPopup_Show("MYADDON_RESET")
end
```

### Hard Reset (No Confirm)

```lua
function commands.hardreset()
    if InCombatLockdown() then
        print("[MyAddon] Cannot reset during combat")
        return
    end
    
    print("[MyAddon] Performing hard reset...")
    AddonDB = nil
    ReloadUI()
end
```

---

## Error Logging for Reports

```lua
local errorLog = {}
local MAX_LOG_SIZE = 50

local function LogErrorForReport(context, err)
    table.insert(errorLog, {
        time = date("%Y-%m-%d %H:%M:%S"),
        context = context,
        error = err,
        combat = InCombatLockdown(),
        instance = select(2, GetInstanceInfo())
    })
    
    -- Trim log
    while #errorLog > MAX_LOG_SIZE do
        table.remove(errorLog, 1)
    end
end

function commands.errors()
    if #errorLog == 0 then
        print("[MyAddon] No errors logged")
        return
    end
    
    print("=== MyAddon Error Log ===")
    for i, entry in ipairs(errorLog) do
        print(entry.time, entry.context, entry.error)
    end
    print("========================")
end
```

---

## Quick Reference

```lua
-- Wrap risky operations
local ok, err = pcall(RiskyFunction)

-- Validate data before use
if type(data) ~= "table" then return end

-- Provide fallbacks
local value = data.value or DEFAULT_VALUE

-- Track repeated errors
errorCount[feature] = (errorCount[feature] or 0) + 1

-- Disable after threshold
if errorCount[feature] >= 3 then DisableFeature(feature) end

-- Always offer reset
/myaddon reset
```

---

## See Also

- [Debugging](./10-debugging.doc.md) - Error capture tools
- [SavedVariables](./04-saved-variables.doc.md) - Data structure design
- [Midnight Secret Values](./13-midnight-secret-values.doc.md) - Handling Midnight restrictions
- [Testing Strategies](./22-testing-strategies.doc.md) - Preventing errors



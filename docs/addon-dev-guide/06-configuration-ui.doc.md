# Configuration UI

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2026-01-02

---

## Overview

Prefer the native Blizzard AddOn Settings APIs for in-game configuration when possible.

**Initialization**: Use `EventUtil.ContinueOnAddOnLoaded` to register settings after your addon loads. This ensures SavedVariables are available before you create settings.

---

## Why Native Settings

| Benefit | Description |
|---------|-------------|
| Minimal dependencies | No Ace3 required |
| Discoverable | Users find it in Options → AddOns |
| Future-proof | Less affected by API pruning than custom frames |
| Consistent UX | Matches Blizzard's UI patterns |

---

## Basic Setup

### Register a category

```lua
local category = Settings.RegisterVerticalLayoutCategory("My Addon")

-- Add to the settings panel
Settings.RegisterAddOnCategory(category)

-- Store category ID for opening later
ADDON_CATEGORY_ID = category:GetID()
```

### Open programmatically

```lua
-- Via slash command
SLASH_MYADDON1 = "/myaddon"
SlashCmdList["MYADDON"] = function()
    Settings.OpenToCategory(ADDON_CATEGORY_ID)
end
```

---

## Setting Types

### Checkbox

```lua
local function GetValue()
    return AddonDB.profile.enabled
end

local function SetValue(value)
    AddonDB.profile.enabled = value
    -- Apply change immediately
    UpdateAddonState()
end

local setting = Settings.RegisterAddOnSetting(category, 
    "MyAddon_Enabled",       -- Variable name (stable identifier)
    "enabled",               -- Variable key (key into the table)
    AddonDB.profile,         -- Variable table
    Settings.VarType.Boolean,-- Variable type
    "Enable Addon",          -- Display name
    true                     -- Default value
)

Settings.CreateCheckbox(category, setting, "Enable or disable the addon.")
```

### Slider

```lua
local setting = Settings.RegisterAddOnSetting(category,
    "MyAddon_Opacity",       -- Variable name (stable identifier)
    "opacity",               -- Variable key (key into the table)
    AddonDB.profile,
    Settings.VarType.Number, -- Variable type
    "Opacity",
    1.0
)

local options = Settings.CreateSliderOptions(0, 100, 1)
options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, 
    function(value) return value .. "%" end
)

Settings.CreateSlider(category, setting, options, "Set the frame opacity.")
```

### Dropdown

```lua
local function GetOptions()
    local container = Settings.CreateControlTextContainer()
    container:Add("option1", "Option One")
    container:Add("option2", "Option Two")
    container:Add("option3", "Option Three")
    return container:GetData()
end

local setting = Settings.RegisterAddOnSetting(category,
    "MyAddon_Mode",          -- Variable name (stable identifier)
    "mode",                  -- Variable key (key into the table)
    AddonDB.profile,
    Settings.VarType.String, -- Variable type
    "Display Mode",
    "option1"
)

Settings.CreateDropdown(category, setting, GetOptions, "Choose display mode.")
```

---

## Proxy Settings Pattern

When backing onto SavedVariables with different scales (e.g., UI shows 0-100, stored as 0.0-1.0):

```lua
-- Create proxy setting
local proxySetting = Settings.RegisterProxySetting(category,
    "MyAddon_OpacityProxy",  -- Variable name
    Settings.VarType.Number, -- Variable type
    "Opacity",
    100,  -- Default (in UI scale)
    function()
        -- GetValue: Convert stored → display
        return math.floor(AddonDB.profile.opacity * 100 + 0.5)
    end,
    function(value)
        -- SetValue: Convert display → stored
        AddonDB.profile.opacity = value / 100
        UpdateOpacity()
    end
)
```

---

## Type Strictness

**Critical**: Be strict about types for dropdown values.

```lua
-- BAD: Mixing number and string
container:Add(1, "Option One")      -- number key
container:Add("two", "Option Two")  -- string key

-- GOOD: Consistent types
container:Add("1", "Option One")
container:Add("2", "Option Two")
```

Mismatched types can cause the Settings panel to fail to render silently.

---

## Blizzard Settings Reference

Study Blizzard's Settings implementations:

```
wow-ui-source-live/Interface/AddOns/Blizzard_Settings/
├── Blizzard_Settings.lua          # Core settings framework
├── Blizzard_SettingsDefinitions/  # How Blizzard defines settings
└── Blizzard_SettingsShared/       # Shared utilities
```

### Example from Blizzard

```lua
-- From Blizzard_Settings - how they create a checkbox
local function CreateCheckbox(category, variable, name, tooltip, ...)
    local setting = Settings.RegisterAddOnSetting(category, variable.name, variable.key, 
        VariableTable, variable.type, name, variable.defaultValue)
    
    local initializer = Settings.CreateCheckbox(category, setting, tooltip)
    return setting, initializer
end
```

---

## Practical Tips

1. **Test after changes** - Settings panel errors don't always show.
2. **Use defaults** - Always provide sensible defaults.
3. **Apply immediately** - Call update functions in SetValue, don't wait for reload.
4. **Keep descriptions short** - Tooltip space is limited.

### Localization Pattern (AceLocale-3.0)
When using the native Settings API, wrap all display strings in `L["KEY"]` directly. Unlike AceConfig, there is no automatic lookup.

```lua
local L = LibStub("AceLocale-3.0"):GetLocale("MyAddon")

local setting = Settings.RegisterAddOnSetting(category, 
    "MyAddon_Enabled", "enabled", AddonDB.profile, Settings.VarType.Boolean,
    L["Enable Addon"], -- Localized Name
    true
)

Settings.CreateCheckbox(category, setting, L["Enable or disable the addon."]) -- Localized Tooltip
```

---

## AceConfig Alternative

For complex configuration needs, AceConfig provides more flexibility:

```lua
local options = {
    type = "group",
    args = {
        enabled = {
            type = "toggle",
            name = "Enable",
            get = function() return DB.enabled end,
            set = function(_, v) DB.enabled = v end,
        },
    },
}

LibStub("AceConfig-3.0"):RegisterOptionsTable("MyAddon", options)
LibStub("AceConfigDialog-3.0"):AddToBlizOptions("MyAddon", "My Addon")
```

See [Library Index](../AGENTS.md#library-index) for AceConfig documentation.

---

## Midnight UI Enhancements

Blizzard is adding native features in Midnight that were previously addon territory:

| Feature | Status | Notes |
|---------|--------|-------|
| Damage Meters | Native | Built-in DPS/HPS tracking |
| Boss Alerts | Native | Integrated boss warnings |
| Cooldown Manager | Native | Personal cooldown tracking |
| Customizable Nameplates | Native | More configuration options |

Consider whether your addon's Settings UI should integrate with or complement these new features.

---

## Settings Initialization Pattern

Use `EventUtil.ContinueOnAddOnLoaded` to register settings after your addon loads. This ensures SavedVariables are available:

```lua
EventUtil.ContinueOnAddOnLoaded("MyAddon", function()
    -- SavedVariables are now loaded
    local category = Settings.RegisterVerticalLayoutCategory("My Addon")
    
    -- Register settings here...
    
    Settings.RegisterAddOnCategory(category)
end)
```

### Opening to Categories

```lua
-- Open to your addon's settings
Settings.OpenToCategory(categoryID)

-- With subcategory scroll target
Settings.OpenToCategory(categoryID, scrollToElementName)
```

> **Note**: `Settings.OpenToCategory` may not properly locate non-root addon subcategories in all cases. Test subcategory navigation thoroughly for your specific setup.

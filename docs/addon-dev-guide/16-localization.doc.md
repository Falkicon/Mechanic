# Localization

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2025-12-18

---

## Overview

Support all 11 WoW-supported locales to reach the global player base. Use AceLocale-3.0 as the standard approach.

---

## Supported Locales

| Code | Language | Region |
|------|----------|--------|
| `enUS` | English | Americas (default) |
| `enGB` | English | Europe |
| `deDE` | German | Germany |
| `frFR` | French | France |
| `esES` | Spanish | Spain |
| `esMX` | Spanish | Latin America |
| `itIT` | Italian | Italy |
| `ptBR` | Portuguese | Brazil |
| `ptPT` | Portuguese | Portugal |
| `ruRU` | Russian | Russia |
| `koKR` | Korean | Korea |
| `zhCN` | Chinese | China (Simplified) |
| `zhTW` | Chinese | Taiwan (Traditional) |

---

## File Structure

```
MyAddon/
├── MyAddon.toc
├── Locales/
│   ├── enUS.lua      # Default (always loads first)
│   ├── deDE.lua
│   ├── frFR.lua
│   ├── esES.lua
│   ├── esMX.lua
│   ├── itIT.lua
│   ├── ptBR.lua
│   ├── ruRU.lua
│   ├── koKR.lua
│   ├── zhCN.lua
│   └── zhTW.lua
├── Core.lua
└── ...
```

---

## TOC Load Order

Load locales **before** any code that uses them:

```toc
## LoadManagers: AddonLoader

# Libraries
Libs\LibStub\LibStub.lua
Libs\AceLocale-3.0\AceLocale-3.0.lua

# Locales (default first, then alphabetical)
Locales\enUS.lua
Locales\deDE.lua
Locales\esES.lua
Locales\esMX.lua
Locales\frFR.lua
Locales\itIT.lua
Locales\koKR.lua
Locales\ptBR.lua
Locales\ruRU.lua
Locales\zhCN.lua
Locales\zhTW.lua

# Core (after locales)
Core.lua
```

---

## AceLocale-3.0 Pattern (Preferred)

### Default Locale (enUS.lua)

```lua
local L = LibStub("AceLocale-3.0"):NewLocale("MyAddon", "enUS", true)
if not L then return end

-- UI Labels
L["ENABLE"] = "Enable"
L["DISABLE"] = "Disable"
L["SETTINGS"] = "Settings"

-- Messages
L["ADDON_LOADED"] = "MyAddon loaded."
L["FEATURE_ENABLED"] = "%s has been enabled."  -- %s = feature name

-- Tooltips
L["ENABLE_TOOLTIP"] = "Enable or disable this feature."
```

### Other Locales (e.g., deDE.lua)

```lua
local L = LibStub("AceLocale-3.0"):NewLocale("MyAddon", "deDE")
if not L then return end

L["ENABLE"] = "Aktivieren"
L["DISABLE"] = "Deaktivieren"
L["SETTINGS"] = "Einstellungen"
L["ADDON_LOADED"] = "MyAddon geladen."
L["FEATURE_ENABLED"] = "%s wurde aktiviert."
L["ENABLE_TOOLTIP"] = "Diese Funktion aktivieren oder deaktivieren."
```

### Using Localized Strings

```lua
local L = LibStub("AceLocale-3.0"):GetLocale("MyAddon")

-- Direct usage
print(L["ADDON_LOADED"])

-- With format placeholders
print(string.format(L["FEATURE_ENABLED"], "Cooldown Tracker"))
```

---

## Localization Patterns by Framework

### AceConfig-3.0 (Options Table)
AceConfig usually handles strings via specific fields in the options table.

```lua
args = {
    myToggle = {
        name = L["ENABLE_FEATURE"],
        desc = L["FEATURE_TOOLTIP"],
        type = "toggle",
        -- ...
    }
}
```

### Blizzard Settings API (Direct Assignment)
When using the native Blizzard Settings API (as seen in ActionHud), strings are often assigned directly during registration or in layout building.

```lua
-- pattern used in ActionHud
local generalOptions = {
    name = "ActionHud",
    args = {
        locked = {
            name = L["Lock Frame"],
            desc = L["Lock the HUD in place. Uncheck to drag."],
            -- ...
        }
    }
}
```

**Note**: In some cases, strings in Blizzard's native API must be localized *before* registration as they are not re-queried from the table.

---

## String Key Naming Conventions

| Pattern | Example | Use For |
|---------|---------|---------|
| `NOUN` | `L["SETTINGS"]` | Single-word labels |
| `NOUN_NOUN` | `L["HEALTH_BAR"]` | Multi-word labels |
| `VERB_NOUN` | `L["ENABLE_FEATURE"]` | Action labels |
| `CONTEXT_TEXT` | `L["TOOLTIP_ENABLE"]` | Contextual strings |
| `MSG_DESCRIPTION` | `L["MSG_LOADED"]` | Messages/notifications |

**Rules**:
- UPPERCASE with underscores
- Descriptive but concise
- Group related strings with common prefixes

---

## Writing Translatable Strings

### Do

```lua
-- Use placeholders for variable content
L["CHARGES_REMAINING"] = "%d charges remaining"

-- Keep sentences complete
L["CLICK_TO_OPEN"] = "Click to open settings"

-- Use neutral terminology
L["READY"] = "Ready"
```

### Don't

```lua
-- DON'T concatenate strings (word order varies by language)
L["GREETING"] = "Hello, " .. playerName  -- BAD

-- DON'T use idioms
L["STATUS"] = "Piece of cake"  -- BAD - doesn't translate

-- DON'T split sentences
L["PART1"] = "Click here to"
L["PART2"] = "open settings"  -- BAD - can't reorder

-- DON'T embed numbers in strings without placeholders
L["MSG"] = "You have 5 items"  -- BAD if 5 is variable
```

### Placeholder Order

Some languages reorder placeholders. Use numbered placeholders for complex strings:

```lua
-- English: "Player dealt 500 damage to Target"
-- German might need: "Player hat Target 500 Schaden zugefügt"
L["DAMAGE_DEALT"] = "%1$s dealt %2$d damage to %3$s"
```

---

## CurseForge Localization

CurseForge provides free community translation:

1. **Enable localization** in your project settings
2. **Upload base strings** (enUS)
3. **Community translates** via CurseForge interface
4. **Download translations** and include in releases

### Exporting for CurseForge

Create a `Localization.lua` export format:

```lua
-- For CurseForge localization export
local L = LibStub("AceLocale-3.0"):NewLocale("MyAddon", "enUS", true)
-- @localization(locale="enUS", format="lua_additive_table", handle-subnamespaces="none")@
```

---

## Blizzard Reference

Study Blizzard's localization patterns:

```
wow-ui-source-live/Interface/AddOns/Blizzard_UIParent/Shared/Localization.lua
```

Key patterns:
- Number formatting varies by locale (Asian locales use different abbreviations)
- Some UI elements need locale-specific positioning
- Use `GetLocale()` to detect current client locale

---

## Quick Locale Detection

```lua
local locale = GetLocale()

-- Asian locales need different number formatting
local isAsianLocale = locale == "koKR" or locale == "zhCN" or locale == "zhTW"

-- Right-to-left considerations (WoW doesn't have RTL locales, but good practice)
local needsSpecialLayout = locale == "zhCN" or locale == "zhTW"
```

---

## Fallback Behavior

AceLocale automatically falls back to the default locale (enUS) for missing translations:

```lua
-- If deDE doesn't define L["NEW_FEATURE"], it uses enUS value
local L = LibStub("AceLocale-3.0"):GetLocale("MyAddon")
print(L["NEW_FEATURE"])  -- Falls back to English if not translated
```

---

## Standalone Pattern (No External Dependencies)

For lightweight addons that do not use Ace3, use a minimal metatable-based `L` table. This pattern is used in **Flightsim**.

### Implementation (Core.lua)

```lua
local L = setmetatable({}, {
    __index = function(t, k)
        return k -- Fallback to key if string missing
    end,
})
MyAddon.L = L
```

### Locale File (Locales/enUS.lua)

```lua
local L = MyAddon.L

L["START_FLIGHT"] = "Start Flight"
L["STOP_FLIGHT"] = "Stop Flight"
```

### Usage

```lua
local L = MyAddon.L
print(L["START_FLIGHT"])
```

---

## Localization Automation

This workspace includes tools to automate the extraction and validation of localized strings.

### Key Tools

| Tool | Command | Purpose |
|------|---------|---------|
| **Extractor** | `addon-dev localize extract <Addon>` | Find all `L["KEY"]` in source code |
| **Validator** | `addon-dev localize validate <Addon>` | Check coverage across all locale files |
| **Scaffolder** | `addon-dev localize scaffold <Addon>` | Create missing locale `.lua` files |

### Standard Workflow

1.  **Extract**: Identify all strings used in your code.
    ```bash
    addon-dev localize extract "Weekly"
    ```
2.  **Scaffold**: Generate placeholder files for all 11 supported locales.
    ```bash
    addon-dev localize scaffold "Weekly"
    ```
3.  **Validate**: Verify that all locales have been updated.
    ```bash
    addon-dev localize validate "Weekly"
    ```

---

## See Also

- [Style Guide](./17-style-guide.doc.md) - Text conventions for translatable strings
- [Library Index](../AGENTS.md#library-index) - AceLocale-3.0 documentation



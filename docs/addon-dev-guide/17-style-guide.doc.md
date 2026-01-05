# WoW UX Style Guide

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2025-12-18

---

## Overview

Align your addon's look and feel with Blizzard's UI conventions. This improves user experience and makes your addon feel native.

---

## Text Conventions

### Capitalization

| Element | Style | Example |
|---------|-------|---------|
| Titles/Headers | Title Case | "Character Settings" |
| Labels | Sentence case | "Show cooldown text" |
| Buttons | Title Case | "Apply Changes" |
| Tooltips | Sentence case | "Click to enable this feature." |
| Messages | Sentence case | "Settings have been saved." |

### Punctuation

| Element | Rule | Example |
|---------|------|---------|
| Labels | No trailing period | "Enable feature" |
| Tooltips | End with period | "Enables the cooldown display." |
| Messages | End with period | "Your settings have been saved." |
| Lists | No trailing periods | "• Cooldowns\n• Buffs\n• Debuffs" |

### Numbers

```lua
-- Use Blizzard's number formatting
local formatted = BreakUpLargeNumbers(1234567)  -- "1,234,567"
local abbreviated = AbbreviateLargeNumbers(1234567)  -- "1.2M"

-- Percentages: no space before %
"75%"  -- Correct
"75 %"  -- Incorrect
```

---

## Terminology Alignment

### Use Official Names

Always use Blizzard's official terminology:

| Use | Don't Use |
|-----|-----------|
| "Spell" | "Ability" (unless specifically abilities) |
| "Cooldown" | "CD" (in UI, abbreviations OK in chat) |
| "Mythic+" | "M+", "Mythic Plus" |
| "Instance" | "Dungeon" (when generic) |
| "SavedVariables" | "Settings file", "Config" |

### Spell and Ability Names

```lua
-- Get official localized name, don't hardcode
local spellInfo = C_Spell.GetSpellInfo(spellID)
local officialName = spellInfo and spellInfo.name

-- Don't do this:
local name = "Fireball"  -- Breaks in other locales
```

---

## Color Usage

### Class Colors

```lua
-- Use Blizzard's class color table
local classColor = RAID_CLASS_COLORS["WARRIOR"]
text:SetTextColor(classColor.r, classColor.g, classColor.b)

-- Or use the color string
local coloredName = classColor:WrapTextInColorCode(playerName)
```

### Quality Colors

| Quality | Hex | Use |
|---------|-----|-----|
| Poor | `#9d9d9d` | Gray items |
| Common | `#ffffff` | White items |
| Uncommon | `#1eff00` | Green items |
| Rare | `#0070dd` | Blue items |
| Epic | `#a335ee` | Purple items |
| Legendary | `#ff8000` | Orange items |

```lua
-- Use Blizzard's quality colors
local color = ITEM_QUALITY_COLORS[quality]
```

### Semantic Colors

| Color | Hex | Use |
|-------|-----|-----|
| Red | `#ff0000` | Errors, unavailable, hostile |
| Green | `#00ff00` | Success, available, friendly |
| Yellow | `#ffff00` | Warnings, caution |
| Gray | `#808080` | Disabled, inactive |
| Warm Gray | `#3A3531` | Modern Dark UI (Settings Panel background) |

### FenUI Token Palette
When using FenUI, prefer semantic tokens over hex codes for consistent dark mode support:

| Token | Hex | Use |
|-------|-----|-----|
| `surfacePanel` | `#3A3531` | Main panel backgrounds |
| `surfaceInset` | `#2B2724` | Recessed areas (sidebar, inputs) |
| `surfaceDeep` | `#1F1C1A` | Alternating rows, deep insets |
| `textHeading` | `#FFD100` | Section headers and titles |

---

## Icon Usage

### Standard Sizes

| Context | Size | Example |
|---------|------|---------|
| Action bar | 36x36, 45x45 | Spell icons |
| Minimap | 16x16, 20x20 | Tracking icons |
| Tooltips | 16x16 | Inline icons |
| Headers | 24x24, 32x32 | Section icons |

### Using Blizzard Icons

```lua
-- Use atlas textures when possible (resolution-independent)
texture:SetAtlas("common-icon-checkmark")

-- For spell icons
local iconID = C_Spell.GetSpellTexture(spellID)
texture:SetTexture(iconID)
```

---

## UI Layout

### Spacing

| Element | Spacing |
|---------|---------|
| Between buttons | 4-8px |
| Panel padding | 10-16px |
| Section spacing | 16-24px |
| Label to control | 4-8px |

### Alignment

- **Left-align** labels and text
- **Right-align** numbers and values
- **Center** titles and buttons (when alone)

---

## Sound Usage

### When to Use Sound

- **Do**: Confirm important actions, alert to critical events
- **Don't**: Every button click, routine updates

### Standard Sounds

```lua
-- Use Blizzard's sound kit IDs
PlaySound(SOUNDKIT.IG_MAINMENU_OPEN)      -- Open panel
PlaySound(SOUNDKIT.IG_MAINMENU_CLOSE)     -- Close panel
PlaySound(SOUNDKIT.IG_MAINMENU_OPTION)    -- Option changed
PlaySound(SOUNDKIT.IG_QUEST_LOG_ABANDON)  -- Warning/cancel
```

---

## Writing for Translation

### Avoid

| Problem | Bad | Good |
|---------|-----|------|
| Idioms | "A piece of cake" | "Easy" |
| Slang | "OP", "gg" | "Powerful", "Complete" |
| Cultural references | "Home run" | "Success" |
| Humor that doesn't translate | Puns | Straightforward text |
| Embedded grammar | "5 item(s)" | "%d items" with plural handling |

### Placeholder Guidelines

```lua
-- Good: Clear placeholder purpose
L["DAMAGE_DEALT"] = "%s dealt %d damage"

-- Better: Numbered for reordering
L["DAMAGE_DEALT"] = "%1$s dealt %2$d damage to %3$s"

-- Include translator notes
L["CHARGES"] = "%d charges"  -- %d = number of charges remaining
```

---

## Blizzard UI Reference

Study Blizzard's patterns in:

```
wow-ui-source-live/Interface/AddOns/Blizzard_SharedXML/
wow-ui-source-live/Interface/AddOns/Blizzard_Settings/
wow-ui-source-live/Interface/AddOns/Blizzard_UIPanels_Game/
```

### Common Patterns

- Panel backgrounds use `BackdropTemplateMixin`
- Checkboxes use sentence-case labels
- Sliders show current value to the right
- Dropdowns use Title Case for options

---

## Accessibility Considerations

### Color Blindness

- Don't rely on color alone to convey information
- Pair colors with icons or text
- Test with WoW's built-in colorblind modes

### Text Readability

- Minimum font size: 10pt for body text
- Ensure sufficient contrast (light text on dark backgrounds)
- Avoid ALL CAPS for long text (harder to read)

---

## Code Style and Formatting

To maintain a consistent codebase, use the centralized code formatting system.

### Automated Formatting

Lua code is formatted using **StyLua**. The configuration is centralized in `ADDON_DEV/Linting/.stylua.toml`.

- **Indentation**: Tabs (WoW convention)
- **Line Length**: 120 columns (Matches Luacheck)
- **Quotes**: Prefer Double Quotes
- **Parentheses**: Always include parentheses for function calls

### Usage

```bash
# Format a specific addon
addon-dev format MyAddon

# Format all addons
addon-dev format --all

# Check only (no changes)
addon-dev format MyAddon --check
```

### Editor Integration

The workspace includes a `.vscode/settings.json` that enables **Format on Save**. Ensure the **StyLua** extension is installed in Cursor/VS Code.

---

## Quick Reference Card

```
Labels:        Sentence case, no period
Buttons:       Title Case
Tooltips:      Sentence case, end with period
Messages:      Sentence case, end with period
Numbers:       BreakUpLargeNumbers() or AbbreviateLargeNumbers()
Colors:        Use RAID_CLASS_COLORS, ITEM_QUALITY_COLORS
Icons:         Use atlas textures when available
Sounds:        Use SOUNDKIT constants
Translation:   No idioms, use numbered placeholders
```

---

## See Also

- [Localization](./16-localization.doc.md) - Multi-language support
- [UI Engineering](./05-ui-engineering.doc.md) - Frame creation and layout
- [Configuration UI](./06-configuration-ui.doc.md) - Settings panel patterns



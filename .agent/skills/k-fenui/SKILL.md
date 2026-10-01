---
name: k-fenui
description: >
  Context for FenUI, the Blizzard-first UI widget library vendored in
  Mechanic/Libs/FenUI. Covers the real factory API (FenUI:CreatePanel, CreateButton,
  CreateStack, CreateTabGroup, CreateGrid), design tokens, themes and graceful
  degradation. Load when building or changing addon UI. Triggers: fenui, ui,
  widget, panel, layout, stack, tabs, grid, theme, tokens.
---

# FenUI

FenUI is a progressive-enhancement widget layer over Blizzard's frames and templates, with a design-token theme system. The copy in `Mechanic/Libs/FenUI/` is synced from the FenUI source repo (`_dev_/Libs/FenUI`); fix FenUI in its own repo and re-sync rather than patching the vendored copy. Authoritative docs: `Mechanic/Libs/FenUI/README.md` and `Mechanic/Libs/FenUI/AGENTS.md`.

## Access and degradation

`FenUI` is a plain global (`FenUI = FenUI or {}` in `Core/FenUI.lua`), not a LibStub library. The library is embedded through `Libs\FenUI\FenUI.xml`. Always guard when FenUI is optional:

```lua
if FenUI and FenUI.CreatePanel then
    frame = FenUI:CreatePanel(parent, config)
else
    frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")  -- fallback
end
```

## Factories

Pattern: `FenUI:Create<Widget>(parent, config)` returns a Blizzard frame with a mixin applied. A string config is accepted by `CreatePanel` (title) and `CreateButton` (text). Builder forms exist for a few: `FenUI.Panel(parent):title("..."):build()`, `FenUI.Flex`, `FenUI.Stack`, `FenUI.TabGroup`, `FenUI.Group`.

| Area | Factories |
|---|---|
| Containers | `CreatePanel`, `CreateInset`, `CreateScrollPanel`, `CreateScrollInset`, `CreateCard`, `CreateDialog`, `CreateSection`, `CreateGroup` |
| Layout | `CreateLayout`, `CreateStack`, `CreateFlex`, `CreateGrid`, `CreateSplitLayout`, `CreateToolbar` |
| Controls | `CreateButton`, `CreateIconButton`, `CreateCloseButton`, `CreateImageButton`, `CreateCheckbox`, `CreateInput`, `CreateMultiLineEditBox`, `CreateDropdown`, `CreateScrollBar` |
| Navigation and lists | `CreateTabGroup`, `CreateTree`, `CreateVirtualList` |
| Display | `CreateImage`, `CreateSectionHeader`, `CreateStatusRow`, `CreateInfoPanel`, `CreateEmptyState`, `CreateRoundedBox`, `CreateChevron` |
| Theming UI | `CreateThemePicker`, `CreateThemeOption`, `CreateSettingsGroup` |

```lua
local panel = FenUI:CreatePanel(UIParent, { title = "My Window", width = 400, height = 300,
    movable = true, resizable = true, closable = true })

local stack = FenUI:CreateStack(panel, { direction = "vertical", gap = "md", align = "stretch", padding = "sm" })
stack:AddChild(topButton)
stack:AddChild(spacer, { grow = 1 })

local tabs = FenUI:CreateTabGroup(panel, {
    tabs = { { key = "main", text = "Main" }, { key = "settings", text = "Settings", badge = "!" } },
    onChange = function(key) end,
})

local grid = FenUI:CreateGrid(panel, { columns = { 24, "1fr", "auto" }, rowHeight = 24,
    onRowClick = function(row, data) end })

local button = FenUI:CreateButton(panel, { text = "Click me", onClick = function() end })
```

Sizes accept numbers, percentages (`"50%"`), viewport units and `"auto"`; `minWidth/maxWidth/aspectRatio` constrain layouts. Check the factory's `config` handling in `Widgets/<Name>.lua` for the exact keys before using one you have not used.

## Tokens and themes

- Colors: `FenUI:GetColor(token)`, `GetColorRGB`, `GetColorHex`, `GetColorTable`; spacing `FenUI:GetSpacing("spacingPanel")`; radius `FenUI:GetRadius("radiusControl")`. Three tiers: primitive, semantic, component. Use semantic tokens (`textDefault`, `textHeading`, `surfacePanel`), not raw colors.
- Themes: `FenUI:GetThemeList()`, `FenUI:SetGlobalTheme(name)`, `FenUI:GetGlobalTheme()`, `FenUI:OnThemeChanged(callback)`. A global theme change re-colors live widgets; a custom widget that resolves token colors once defines `RefreshTheme()` and calls `FenUI:RegisterThemedFrame(widget)`.
- Blizzard scroll frames can be skinned with `FenUI:SkinScrollFrame`.

## Mechanic conventions

- Use FenUI widgets instead of raw frames where one exists; add new widgets to FenUI itself.
- Type scale and neutral headings follow the Obsidian look (`Mechanic/CHANGELOG.md` 1.3.7): gold only for the window title, active tab, selection and focus.
- Keep the view layer thin and test at several UI scales.
- Mechanic's `Utils.lua` falls back gracefully when FenUI helpers are missing.

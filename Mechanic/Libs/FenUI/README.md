# FenUI

A Blizzard-first UI widget library for World of Warcraft addon development. Build consistent, themeable interfaces using native WoW frame templates and a modern design token system.

![WoW Version](https://img.shields.io/badge/WoW-12.0%2B-blue)
![Interface](https://img.shields.io/badge/Interface-120001-green)
[![GitHub](https://img.shields.io/badge/GitHub-Falkicon%2FFenUI-181717?logo=github)](https://github.com/Falkicon/FenUI)
[![Sponsor](https://img.shields.io/badge/Sponsor-pink?logo=githubsponsors)](https://github.com/sponsors/Falkicon)

> **Midnight Ready**: FenUI targets Interface 120001 and uses defensive patterns for Midnight compatibility. All Blizzard API dependencies are validated via `/fenui validate`.

## Philosophy

FenUI is a **progressive enhancement layer** on top of Blizzard's native UI system:

- **Blizzard-first**: Uses `NineSliceUtil`, Atlas textures, and native frame templates
- **Graceful degradation**: Addons work without FenUI installed
- **Design tokens**: Semantic colors, spacing, and fonts for consistent theming
- **Responsive Sizing**: Support for percentages (`50%`), viewport units (`10vh`), and auto-updating layouts
- **Familiar patterns**: CSS Grid-inspired layouts, slot-based composition

## Features

| Feature | Description |
|---------|-------------|
| **Panel** | Window container with title, close button, and content slots |
| **Tabs** | Tab groups with badges, disabled states, and keyboard navigation |
| **Stack/Flex** | Flexbox-inspired stacking layouts with alignment and wrapping |
| **Grid** | CSS Grid-inspired layout with column definitions and data binding |
| **Toolbar** | Horizontal slot-based layout for buttons and controls |
| **Buttons** | Standard, icon, and close buttons with consistent styling |
| **SectionHeader** | Navigation section headers with design token styling |
| **StatusRow** | Standardized icon + label + value row with optional formatting |
| **Image** | Conditional variants, sizing modes, masking, tinting, Atlas support |
| **EmptyState** | Slot-based centered overlay for empty content areas |
| **Animations** | Declarative motion system with transitions, presets, and keyframes |
| **Containers** | Insets and scroll panels |
| **Themes** | Multiple built-in themes (TWW, Dragonflight, Dark, etc.) |
| **Tokens** | Three-tier design token system (primitive → semantic → component) |

## Installation

FenUI is designed to be embedded in your addon, not installed as a standalone addon.

### Option 1: Copy to Libs folder

1. Copy the `FenUI` folder to your addon's `Libs/` directory
2. Add to your `embeds.xml`:

```xml
<Include file="Libs\FenUI\FenUI.xml"/>
```

### Option 2: Standalone (for development)

1. Copy `FenUI` to `Interface/AddOns/`
2. Add as optional dependency in your `.toc`:

```
## OptionalDeps: FenUI
```

## Quick Start

### Create a Panel

```lua
-- Simple panel
local panel = FenUI:CreatePanel(UIParent, {
    title = "My Window",
    width = 400,
    height = 300,
    movable = true,
    resizable = true,
    closable = true,
})

-- Or use the builder pattern
local panel = FenUI.Panel(UIParent)
    :title("My Window")
    :size(400, 300)
    :movable()
    :resizable()
    :closable()
    :build()
```

### Create a Stack (Flexbox)

```lua
-- Vertical stack with spacing and alignment
local stack = FenUI:CreateStack(parent, {
    direction = "vertical",
    gap = "md",
    align = "stretch",
    padding = "sm",
})

stack:AddChild(topButton)
stack:AddChild(spacer, { grow = 1 }) -- Fills remaining space
stack:AddChild(bottomButton)

-- Or use the builder pattern for a horizontal flex wrap
local flex = FenUI.Flex(parent)
    :gap("xs")
    :justify("center")
    :build()
```

### Constraint System

FenUI components support min/max boundaries and aspect ratio locking to ensure layouts remain usable across different screen sizes.

```lua
-- Component with min/max boundaries
local panel = FenUI:CreatePanel(parent, {
    width = "80%",
    minWidth = 300,
    maxWidth = 800,
    height = "auto",
    minHeight = 200,
})

-- Aspect ratio locking (supports "16:9", "4/3", or number)
local card = FenUI:CreateLayout(parent, {
    width = "100%",
    aspectRatio = "16:9",
})

-- Aspect ratio based on height
local icon = FenUI:CreateLayout(parent, {
    height = 64,
    aspectRatio = 1,
    aspectBase = "height", -- width will be calculated from height
})
```

### Animation & Transitions (v2.8.0+)

FenUI provides a declarative animation system that wraps WoW's native `AnimationGroup` API.

```lua
-- 1. Property Transitions (automatic animation on SetAlpha, SetScale, etc.)
local panel = FenUI:CreatePanel(parent, {
    transitions = {
        alpha = { duration = 0.2, easing = "ease-out" },
        scale = { duration = 0.15 },
    },
})

panel:SetAlpha(0.5) -- Fades to 0.5 over 0.2s

-- 2. Lifecycle Animations (Show/Hide)
local dialog = FenUI.Panel(parent)
    :showAnimation("fadeIn")
    :hideAnimation("fadeOut")
    :build()

-- 3. Custom Keyframe Animations
local bounce = FenUI.Animation:Keyframes({
    [0] = { scale = 1 },
    [0.5] = { scale = 1.1 },
    [1] = { scale = 1 },
    duration = 0.3,
})
bounce:Play(myFrame)

-- 4. Chaining
FenUI.Animation.Presets.slideUp:Then(FenUI.Animation.Presets.fadeOut):Play(myFrame)
```

### Create Tabs

```lua
local tabs = FenUI:CreateTabGroup(parent, {
    tabs = {
        { key = "main", text = "Main" },
        { key = "settings", text = "Settings", badge = "!" },
    },
    onChange = function(key)
        print("Selected:", key)
    end,
})
```

### Create a Grid

```lua
local grid = FenUI:CreateGrid(parent, {
    columns = { 24, "1fr", "auto" },  -- icon, name, count
    rowHeight = 24,
    onRowClick = function(row, data)
        print("Clicked:", data.name)
    end,
})

grid:SetData(myItems, function(row, item)
    row:SetIcon(1, item.icon)
    row:SetText(2, item.name)
    row:SetText(3, item.count)
end)
```

### Create an Image

```lua
-- Simple texture
local img = FenUI:CreateImage(parent, {
    texture = "Interface\\Icons\\INV_Misc_Book_09",
    width = 64,
    height = 64,
})

-- Faction-conditional image
local factionImg = FenUI:CreateImage(parent, {
    condition = "faction",  -- or "class", "race", "spec"
    variants = {
        Horde = "path/to/horde.png",
        Alliance = "path/to/alliance.png",
    },
    fallback = "path/to/default.png",
    width = 128,
    height = 128,
    mask = "circle",  -- or "rounded", or custom texture path
    onClick = function(self) print("Clicked!") end,
})

-- Atlas texture with tinting
local atlasImg = FenUI:CreateImage(parent, {
    atlas = "ShipMissionIcon-Combat-Map",
    width = 32,
    height = 32,
    tint = "feedbackSuccess",  -- FenUI token
})
```

### Create a Section Header

```lua
local header = FenUI:CreateSectionHeader(parent, {
    text = "ADDONS",
    spacing = "md",  -- 12-16px top margin
})
```

### Use Design Tokens

```lua
-- Get colors (safe for SetTextColor)
local r, g, b = FenUI:GetColorRGB("textDefault")
fontString:SetTextColor(r, g, b)

-- Or use the helper
FenUI:SetTextColor(fontString, "textHeading")

-- Get spacing
local padding = FenUI:GetSpacing("spacingPanel")  -- 24px
```

## Design Tokens

FenUI uses a three-tier token system:

```
┌─────────────────────────────────────────────────────────┐
│  COMPONENT (optional per-widget overrides)              │
├─────────────────────────────────────────────────────────┤
│  SEMANTIC (purpose-based, theme-overridable)            │
│  surfacePanel, textHeading, interactiveHover            │
├─────────────────────────────────────────────────────────┤
│  PRIMITIVE (raw values, never change)                   │
│  gold500, gray900, spacing.md                           │
└─────────────────────────────────────────────────────────┘
```

### Semantic Token Categories

| Category | Tokens |
|----------|--------|
| **Surfaces** | `surfacePanel`, `surfaceElevated`, `surfaceInset`, `surfaceRowAlt` |
| **Text** | `textDefault`, `textMuted`, `textDisabled`, `textHeading`, `textOnAccent` |
| **Borders** | `borderDefault`, `borderSubtle`, `borderFocus` |
| **Interactive** | `interactiveDefault`, `interactiveHover`, `interactiveActive`, `interactiveDisabled` |
| **Feedback** | `feedbackSuccess`, `feedbackError`, `feedbackWarning`, `feedbackInfo` |

## Graceful Degradation

Always check before using FenUI:

```lua
if FenUI and FenUI.CreatePanel then
    -- Use FenUI
    frame = FenUI:CreatePanel(parent, config)
else
    -- Fallback to native frames
    frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    -- Manual setup...
end
```

## Slash Commands

| Command | Description |
|---------|-------------|
| `/fenui` | Show version and status |
| `/fenui validate` | Check Blizzard API dependencies |
| `/fenui theme [name]` | Get/set global theme |
| `/fenui themes` | List available themes |
| `/fenui debug` | Toggle debug mode |

## Files

| File | Purpose |
|------|---------|
| `Core/FenUI.lua` | Global namespace, version, slash commands |
| `Core/Tokens.lua` | Three-tier design token system |
| `Core/BlizzardBridge.lua` | NineSlice layouts, Atlas helpers |
| `Core/ThemeManager.lua` | Theme registration and switching |
| `Widgets/*.lua` | Panel, Tabs, Grid, Toolbar, Buttons, etc. |
| `Validation/DependencyChecker.lua` | API change detection |

## Technical Notes

- Uses Blizzard's native `NineSliceUtil` and `NineSliceLayouts`
- Event-driven architecture with lifecycle hooks
- Frame pooling for grids and lists
- No external dependencies
- Validated against Midnight (12.0) API changes

## Documentation

- **[AGENTS.md](AGENTS.md)** – Technical reference for AI agents
- **[Docs/DESIGN_PRINCIPLES.md](Docs/DESIGN_PRINCIPLES.md)** – Philosophy and guidelines
- **[IMPROVEMENTS.md](IMPROVEMENTS.md)** – Backlog of planned enhancements

## Support

If you find FenUI useful, consider [sponsoring on GitHub](https://github.com/sponsors/Falkicon) to support continued development. Every contribution helps!

## License

GPL-3.0 License – see [LICENSE](LICENSE) for details.

## Author

Fen (Falkicon)

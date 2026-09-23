# FenUI – Agent Documentation

Technical reference for AI agents modifying this UI library.

## External References

### Development Documentation

For addon development guidance, refer to the Mechanic hub documentation:

- **Addon Development Guide** (`Mechanic/docs/addon-dev-guide/`) – Full documentation covering:
  - Core principles, project structure, TOC best practices
  - UI engineering, configuration UI, combat lockdown
  - Performance optimization, API resilience
  - Debugging, packaging/release workflow
  - Midnight (12.0) compatibility and secret values
- **Library Reference** (`Mechanic/docs/integration/libraries.md`) – Library management via `mech libs.sync`

### Blizzard UI Source Code

- **wow-ui-source** – Official Blizzard UI addon code
  - Essential for understanding `NineSliceUtil`, `NineSliceLayouts`, and Atlas textures
  - Reference for native frame templates and widget implementations
  - Use when building new widgets or debugging layout issues

### FenUI Documentation

- **[Docs/DESIGN_PRINCIPLES.md](Docs/DESIGN_PRINCIPLES.md)** – Philosophy, guidelines, and patterns
- **[IMPROVEMENTS.md](IMPROVEMENTS.md)** – Backlog of identified improvements
- **[README.md](README.md)** – User-facing documentation and API reference

---

## Project Intent

A Blizzard-first UI widget library for World of Warcraft addon development.

- **Progressive enhancement layer** on native WoW UI APIs
- **Design token system** for consistent theming
- **Composable components** with familiar patterns (CSS Grid, slots)
- **Graceful degradation** – addons work without FenUI installed

## Constraints

## Source of Truth

This directory (`_dev_/Libs/FenUI/`) is the **primary source of truth** for FenUI.

- **Development**: All new features, bug fixes, and widget enhancements must be made here.
- **Distribution**: Changes are propagated to consuming addons (!Mechanic, Weekly, etc.) via `mech libs.sync`.
- **Enforcement**: Consuming addons have Libs/ ignored by agents to prevent accidental direct edits.
- **Independence**: FenUI is standalone with no external dependencies (does not require FenCore).

- Must work on Retail 12.0+
- **Interface Version**: Currently targeting **120001** (Midnight expansion, released January 20th, 2026)
- No external dependencies (standalone library)
- Addons consuming FenUI must remain functional if FenUI is missing

## File Structure

```
FenUI/
├── Core/                    # Foundation layer
│   ├── FenUI.lua           # Global namespace, version, debug, slash commands
│   ├── Animation.lua       # Declarative animation system (v2.8.0+)
│   ├── Tokens.lua          # Three-tier design token system & BorderPack Registry
│   ├── BlizzardBridge.lua  # Custom NineSlice renderer (8-texture), Atlas helpers
│   └── ThemeManager.lua    # Theme registration and application
│
├── Widgets/                 # UI components
│   ├── Layout.lua          # FOUNDATIONAL container primitive (background, border, shadow, cells)
│   ├── Stack.lua           # FLEXBOX-inspired stacking layout (vertical/horizontal, wrap, grow)
│   ├── Panel.lua           # Main window container (supports movable/resizable)
│   ├── Containers.lua      # Insets, managed scroll panels
│   ├── ScrollBar.lua       # Custom dark scrollbar widget (v2.5.0+)
│   ├── SplitLayout.lua     # Horizontal/Vertical split layouts
│   ├── Tabs.lua            # Tab groups with states and badges
│   ├── Buttons.lua         # Standard, icon, and close buttons
│   ├── Grid.lua            # CSS Grid-inspired layout for content
│   ├── Toolbar.lua         # Horizontal slot-based layout
│   ├── Image.lua           # Conditional images with sizing, masking, tinting, fill mode
│   └── EmptyState.lua      # Slot-based centered empty content overlay
│
├── Assets/                  # Custom textures
│   ├── shadow-soft-64.png  # Soft drop shadow (64px gradient)
│   ├── shadow-hard-64.png  # Hard drop shadow (64px gradient)
│   ├── glow-soft-64.png    # Soft glow effect (64px gradient)
│   └── glow-hard-24.png    # Hard glow effect (24px gradient)
│
├── Validation/
│   └── DependencyChecker.lua  # API/layout validation for updates
│
├── Settings/
│   └── ThemePicker.lua     # AceConfig integration, theme UI
│
├── Docs/
│   └── DESIGN_PRINCIPLES.md # Philosophy and guidelines
│
├── FenUI.toc               # Addon manifest
├── README.md               # User documentation
├── IMPROVEMENTS.md         # Backlog
└── LICENSE                 # GPL-3.0
```

## Architecture

### Token System

FenUI uses a three-tier design token hierarchy:

```
┌─────────────────────────────────────────────────────────┐
│  COMPONENT (optional per-widget overrides)              │
├─────────────────────────────────────────────────────────┤
│  SEMANTIC (purpose-based, theme-overridable)            │
│  surfacePanel, textHeading, interactiveHover, etc.      │
├─────────────────────────────────────────────────────────┤
│  PRIMITIVE (raw values, never change)                   │
│  gold500, gray900, spacing.md, etc.                     │
└─────────────────────────────────────────────────────────┘
```

**Token Resolution:**
1. Check `currentOverrides` (from active theme)
2. Fall back to `semantic` tokens
3. Resolve to `primitive` values

**Key APIs:**
```lua
FenUI:GetColor(semanticToken)        -- Returns r, g, b, a
FenUI:GetColorRGB(semanticToken)     -- Returns r, g, b (no alpha)
FenUI:GetColorTableRGB(semanticToken)-- Returns {r, g, b}
FenUI:GetSpacing(semanticToken)      -- Returns pixels
FenUI:GetLayout(layoutName)          -- Returns layout constant
FenUI:GetFont(semanticToken)         -- Returns font object name

-- Sizing & Constraints
FenUI.Utils:ApplySize(frame, w, h, constraints) -- Low-level sizing engine
```

### Widget Creation Pattern

All widgets follow this structure:

```lua
-- 1. Define a mixin with methods
local WidgetMixin = {}
function WidgetMixin:Init(config) ... end
function WidgetMixin:SomeMethod() ... end

-- 2. Create factory function
function FenUI:CreateWidget(parent, config)
    local widget = CreateFrame("Frame", nil, parent)
    FenUI.Mixin(widget, WidgetMixin)
    widget:Init(config)
    return widget
end

-- 3. Optionally, create a builder for fluent API
function FenUI.Widget(parent)
    return WidgetBuilder:new(parent)
end
```

### Dual API Pattern

Every widget supports both APIs:

**Config Object (simple):**
```lua
local tabs = FenUI:CreateTabGroup(parent, {
    tabs = { { key = "main", text = "Main" } },
    onChange = function(key) end,
})
```

**Builder Pattern (fluent):**
```lua
local tabs = FenUI.TabGroup(parent)
    :tab("main", "Main")
    :onChange(function(key) end)
    :build()
```

### Graceful Degradation Pattern

Consuming addons should always check before use:

```lua
-- Pattern used in Weekly, Strategy, etc.
if FenUI and FenUI.CreatePanel then
    frame = FenUI:CreatePanel(parent, config)
else
    frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    -- Manual fallback setup...
end
```

### Layout Component

`Layout.lua` is the foundational container primitive. All other containers (Panel, Inset, Dialog, Card) build on it:

```
┌─────────────────────────────────────────────────────────────┐
│  Layout Component                                           │
│  ├── Drop Shadow Frame (behind, for soft/hard/glow)        │
│  ├── Shadow Layer (inner shadow using Blizzard textures)   │
│  ├── Background Layer (color, image, gradient, conditional) │
│  ├── Border Layer (NineSlice via BlizzardBridge)           │
│  └── Content Layer (single-cell or multi-row cells)        │
└─────────────────────────────────────────────────────────────┘
```

**Key APIs:**
```lua
-- Simple container with inner shadow
local box = FenUI:CreateLayout(parent, {
    border = "Panel",
    background = "surfacePanel",
    shadow = "inner",
    padding = "spacingPanel",
})

-- Container with drop shadow
local elevated = FenUI:CreateLayout(parent, {
    border = "Panel",
    background = "surfaceElevated",
    shadow = "soft",  -- or "hard", "glow", "glowHard"
})

-- Glow with custom color
local highlighted = FenUI:CreateLayout(parent, {
    border = "Panel",
    shadow = { type = "glow", color = "gold500", alpha = 0.8 },
})

-- Multi-cell container (CSS Grid-like syntax)
local gridBox = FenUI:CreateLayout(parent, {
    border = "Inset",
    rows = { "auto", "1fr", "auto" },  -- header, content, footer
    cells = {
        [1] = { background = "gray800" },
        [2] = { background = { image = "..." } },
        [3] = { background = "gray800" },
    },
    gap = "spacingElement",
})

-- Sizing with constraints
local constrained = FenUI:CreateLayout(parent, {
    width = "100%",
    maxWidth = 400,
    minHeight = 200,
    aspectRatio = "16:9",
})
```

**Shadow Types:**
| Type | Texture | Effect |
|------|---------|--------|
| `"inner"` | Blizzard overlays | Inset shadow inside frame |
| `"soft"` | shadow-soft-64 | Diffuse drop shadow |
| `"hard"` | shadow-hard-64 | Sharp drop shadow |
| `"glow"` | glow-soft-64 | Soft additive glow |
| `"glowHard"` | glow-hard-24 | Tight additive glow |

**Convenience Aliases:**
- `FenUI:CreateCard()` - Layout with subtle border
- `FenUI:CreateDialog()` - Layout with shadow preset

### Blizzard Bridge

`BlizzardBridge.lua` wraps native Blizzard APIs:

```lua
-- Layout aliases (simplified names for NineSlice layouts)
FenUI.Layouts = {
    Panel = "ButtonFrameTemplateNoPortrait",
    Inset = "InsetFrameTemplate",
    -- etc.
}

-- Apply a layout to any frame
FenUI:ApplyLayout(frame, "Panel", textureKit)
```

## SavedVariables

Stored in `FenUIDB`:

```lua
{
    globalTheme = "Default",  -- Currently active theme
    -- Future: user preferences, custom themes
}
```

## Slash Commands

- `/fenui` – Show version and status
- `/fenui validate` – Run dependency checker
- `/fenui theme <name>` – Switch global theme

## Debugging

- **Debug Mode**: `FenUI.debugMode = true` enables verbose logging
- **Validation**: `/fenui validate` checks for Blizzard API changes
- **Globals**: `FenUI` (main namespace), `FenUIDB` (saved variables)

## Troubleshooting

### Background Issues

FenUI uses a dedicated background frame architecture for NineSlice compatibility. Common issues and solutions:

| Problem | Cause | Solution |
|---------|-------|----------|
| **Background not showing** | Frame has 0x0 size at Init time | The `OnSizeChanged` handler should auto-fix this. If not, ensure the frame gets sized via anchors or explicit `SetSize()`. |
| **Background bleeding outside corners** | Inset too small for chamfered border | Increase the inset values in `BORDER_INSETS` table or use `backgroundInset` config override. |
| **Transparent gaps at edges** | Inset too large | Decrease the inset values. Panel uses asymmetric insets (6/2/6/2) to balance this. |
| **Background visible but wrong color** | Token not resolving | Check that the color token exists in `Tokens.lua`. Use `/fenui tokens` to debug. |

### Adding Custom Border Types

To add support for a new NineSlice border:

1. Find the layout name used in `BlizzardBridge.lua` or `NineSliceLayouts.lua`
2. Test in-game to find the minimum inset that prevents bleeding
3. Add an entry to `BORDER_INSETS` in `Layout.lua`:

```lua
local BORDER_INSETS = {
    -- existing entries...
    MyCustomBorder = { left = 4, right = 4, top = 4, bottom = 4 },
}
```

### Architecture Reference

```
Layout Frame (NineSlice border via custom renderer)
  └── bgFrame (frameLevel -1, MouseEnabled but ClickDisabled for Inspect)
        └── bgTexture (color/gradient/image)
```

The `bgFrame` child exists because WoW 9.1.5+ has conflicts between NineSlice and textures created directly on the same frame. This follows Blizzard's pattern in `FlatPanelBackgroundTemplate`.

**Inspectability**: Since v2.5.0, structural frames (cells, backgrounds, scroll content) use `SetMouseClickEnabled(false)` to ensure they are visible to `GetMouseFoci()` (and thus !Mechanic) without intercepting user clicks.

## Consuming Addons

FenUI is used by:

| Addon | Usage |
|-------|-------|
| **!Mechanic** | Development hub UI |
| **Weekly** | Journal window, tabs, grid, empty states |

When modifying FenUI, test these addons to ensure compatibility.

## Agent Guidelines

1. **Token Everything** – Never hardcode colors or pixel values
2. **Provide Fallbacks** – Consuming addons must work without FenUI
3. **Test Integration** – Load Weekly or !Mechanic after any widget changes
4. **Sync Libraries** – Use `mech libs.sync` to deploy changes to consuming addons
5. **Follow Patterns** – Use existing widget patterns (Mixin + Factory + Builder)

## Documentation Requirements

**Always update documentation when making changes:**

### README.md
Update when:
- Adding new widgets or APIs
- Changing existing widget behavior
- Modifying token names or structure

### Docs/DESIGN_PRINCIPLES.md
Update when:
- Establishing new patterns or guidelines
- Learning from integration issues
- Refining the token system

### IMPROVEMENTS.md
Update when:
- Identifying potential improvements during integration
- Completing items from the backlog

**Format** (Keep a Changelog style):
```markdown
## [Version] - YYYY-MM-DD
### Added
- New widgets or features

### Changed
- Changes to existing APIs

### Fixed
- Bug fixes
```

## Future Considerations

### Midnight (12.0) Compatibility

FenUI handles secret values internally:
- `Utils/Formatting.lua` uses WoW's `issecretvalue()` API directly
- Secret values are detected and formatted as `(SECRET)` in debug output
- Font string sizing and layout measurements account for secret values

No additional configuration required - FenUI is Midnight-ready out of the box.

### Planned Components

See `IMPROVEMENTS.md` for the backlog, including:
- Divider/Header component
- Stat Row component
- List convenience wrapper for Grid
- Enhanced badge system

## Performance Notes

### Avoid in Hot Paths

- `FenUI:GetModule()` lookups – cache references
- Token resolution in `OnUpdate` – cache values at frame level
- Table creation in event handlers – reuse tables with `wipe()`

### Frame Pooling

Grid and other list components use row pooling:
```lua
local row = table.remove(self.rowPool) or CreateNewRow()
-- ... use row ...
table.insert(self.rowPool, row)  -- return to pool
```

## Library Management

FenUI is developed in `_dev_/Libs/FenUI/` and deployed to consuming addons via the Mechanic CLI.

**Source of Truth:** `_dev_/Libs/FenUI/`

**Independence:** FenUI is a standalone library with no external dependencies:
- Does NOT require FenCore
- Can be used independently or alongside FenCore
- Addons choose which libraries to include via `libs.json`

**Deployment:** FenUI is embedded in consuming addons (not a standalone addon):
- `!Mechanic/Libs/FenUI/`
- `Weekly/Libs/FenUI/`

**To deploy changes:**
```bash
mech libs.sync
```

**Addon Configuration:** Addons specify libraries in `libs.json`:
```json
{
  "FenUI": "latest"
}
```

**Load Order:** Consuming addons include FenUI via `embeds.xml`:
```xml
<Include file="Libs\FenUI\FenUI.xml"/>
```

**Note:** The `.toc` file is kept for reference but is not used when FenUI is embedded.


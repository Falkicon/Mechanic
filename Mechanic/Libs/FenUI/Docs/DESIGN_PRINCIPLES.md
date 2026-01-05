# FenUI Design Principles

FenUI is a Blizzard-first UI widget library for World of Warcraft addon development. This document captures the philosophy, guidelines, and patterns that guide its design.

---

## Core Philosophy

### 1. Manageability First (AI & Agent Friendly)

The top priority for FenUI is ease of understanding and modification by both human developers and AI agents. If a native Blizzard asset or "black box" API makes the code harder to reason about, provides inconsistent results, or requires complex magic offsets, it should be replaced with a custom, intentional, and documented implementation.

**In practice:** Instead of fighting Blizzard's aggressive `NineSliceUtil` which overwrites textures and sub-layers, we use a custom internal NineSlice renderer where every texture and anchor is explicitly defined in Lua.

### 2. Performance

While manageability is paramount, FenUI must remain performant. Avoid unnecessary `OnUpdate` polling, use frame pooling for repeated elements, and keep the drawing hierarchy flat where possible.

### 3. Foundation First

Build flexible, underlying systems before convenience shortcuts. A strong foundation ensures consistency and extensibility as the library grows.

**In practice:** Create a generic `Toolbar` component that can be used to build footers, headers, and navigation bars—rather than creating separate `Footer` and `Header` components with duplicated logic.

### 2. Semantic Building Blocks

Design components by *function*, not *purpose*. Components should describe what they do, not where they're used.

| ✅ Do | ❌ Don't |
|-------|----------|
| `Grid` | `ItemList` |
| `Toolbar` | `Footer` |
| `EmptyState` | `NoItemsMessage` |

### 3. Familiar Patterns

Leverage patterns developers already know. FenUI borrows concepts from CSS Grid, web component slots, and design token systems—making it intuitive for developers with modern UI experience.

### 4. Zero Default Spacing

Containers and widgets should never have built-in padding or margins by default. This ensures that when you compose components, you don't have to "fight" hidden offsets. Spacing is always intentional and explicit.

### 5. Responsive Sizing

FenUI supports responsive sizing units beyond just raw pixels. This allows containers to adapt to their parent's size or the screen viewport.

- **Percentages (`"50%"`)**: Relative to the parent container's width/height.
- **Viewport Units (`"10vh"`, `"5vw"`)**: Relative to the total screen size.
- **Fit to Content (`"auto"`)**: The container automatically resizes to perfectly wrap its children. This is reactive—if content grows (e.g. text), the container grows.
- **Auto-Updating**: Components with percentage sizes automatically resize when their parent container changes size.
- **Constraints**: Support for `minWidth`, `maxWidth`, `minHeight`, and `maxHeight` boundaries that apply regardless of the base size mode.
- **Aspect Ratio Locking**: Components can lock their dimensions to a specific ratio (e.g., 16:9) while still respecting other constraints.

---

## Technical Principles

### Intentional Custom (Formerly Blizzard-First)

FenUI provides a standalone, intentional UI framework that prioritizes control and predictability. While we match Blizzard's aesthetic (colors, typography), we avoid direct dependencies on fragile internal Blizzard templates and "black box" utilities.

- **Custom NineSlice Renderer:** We manually manage the 8 textures for borders to ensure pixel-perfect alignment and layering control.
- **Theme Packs:** UI styles are defined in self-contained "Packs" that bundle border assets and color palettes.
- **Template Decoupling:** We build widgets from base frames rather than inheriting from Blizzard's complex XML templates (e.g., `ButtonFrameTemplate`).

**Why:** Native Blizzard templates often carry legacy baggage, forced insets, and "double bevel" looks that are difficult to disable. Providing our own assets ensures total visual fidelity.

### Design Tokens

Style components using a three-tier token system:

```
┌─────────────────────────────────────────────────────────┐
│  COMPONENT TOKENS (optional per-widget overrides)       │
├─────────────────────────────────────────────────────────┤
│  SEMANTIC TOKENS (purpose-based, theme-overridable)     │
│  surfacePanel, textHeading, interactiveHover, etc.      │
├─────────────────────────────────────────────────────────┤
│  PRIMITIVE TOKENS (raw values, never change)            │
│  gold500, gray900, spacing.md, etc.                     │
└─────────────────────────────────────────────────────────┘
```

Themes override semantic tokens, not primitives. Components consume semantic tokens, not primitives directly.

### Graceful Degradation

Addons using FenUI must remain functional when the library is missing.

```lua
-- Pattern: Check before use, provide fallback
if FenUI and FenUI.CreatePanel then
    frame = FenUI:CreatePanel(parent, config)
else
    frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    -- Manual setup...
end
```

### Dual API

Offer two ways to create widgets:

**Config Object** — Simple, declarative, good for standard use cases:
```lua
local grid = FenUI:CreateGrid(parent, {
    columns = { "auto", "1fr", "auto" },
    rowHeight = 24,
})
```

**Builder Pattern** — Fluent, readable, good for complex configurations:
```lua
local tabs = FenUI.TabGroup(parent)
    :tab("overview", "Overview")
    :tab("settings", "Settings", nil, true)  -- disabled
    :onChange(function(key) end)
    :build()
```

---

## Development Process

### Iterative Cycle

Develop in tight loops:

1. **Build** — Implement a feature in FenUI
2. **Integrate** — Use it in a real addon (Weekly, Strategy, etc.)
3. **Learn** — Identify pain points, bugs, or missing features
4. **Improve** — Refine FenUI based on findings
5. **Repeat**

### Real-World Validation

If a component isn't easy to use in a real project, it needs refinement. Theoretical elegance means nothing if the API is clunky in practice.

### Document As You Go

Principles emerge from practice, not theory. Update this document whenever new patterns are established through implementation.

---

## Component Design Guidelines

### Slots Over Props

Favor content injection over configuration properties.

```lua
-- ✅ Flexible: accepts any frame
toolbar:AddFrame(myCustomWidget)

-- ❌ Rigid: only accepts specific config
toolbar:SetRightLabel("text")
```

Slots let developers compose components freely. Props lock them into predefined options.

### Container Architecture

FenUI differentiates between **structural** and **visual** containers.

- **Group (Structural)**: A skinless container with no background, border, or shadows. Equivalent to a `<div>`. Use for semantics and layout grouping.
- **Layout (Visual Foundation)**: The base for all styled containers. Handles backgrounds, borders, and shadows.

Higher-level visual components build on Layout:

```
Layout (visual foundation)
  ├── Panel = Layout + title + close button
  ├── Inset = Layout with inset styling
  ├── Card = Layout with subtle border
  └── Dialog = Layout with shadow preset
```

Use `Group` for minimal structural needs:

```lua
local sidebar = FenUI:CreateGroup(parent, {
    width = 200,
    padding = "spacingElement",
})
```

Use `Layout` directly when you need custom visual containers:

```lua
local custom = FenUI:CreateLayout(parent, {
    border = "Inset",
    background = {
        gradient = { orientation = "VERTICAL", from = "gray950", to = "gray900" },
    },
    shadow = "inner",
    rows = { "auto", "1fr" },
    cells = {
        [1] = { background = "gray800" },  -- Header
        [2] = {},                          -- Content
    },
})
```

### Lifecycle Hooks

Widgets should provide standard hooks for extension:

| Hook | When it fires |
|------|---------------|
| `onCreate` | After the frame is initialized |
| `onShow` | When the frame becomes visible |
| `onHide` | When the frame is hidden |
| `onThemeChange` | When global or local theme changes |

### Token Everything

Avoid hardcoded values. Colors, spacing, fonts, and layout constants should all flow through the token system.

```lua
-- ✅ Good
local padding = FenUI:GetLayout("panelPadding")
local r, g, b = FenUI:GetColorRGB("textMuted")

-- ❌ Bad
local padding = 12
local r, g, b = 0.5, 0.5, 0.5
```

### Manual and Data-Bound

Support both patterns. Data binding should internally use manual methods for consistency.

```lua
-- Manual: full control
local row = grid:AddRow()
row:GetCell(1):SetIcon(texture)
row:GetCell(2):SetText(name)

-- Data-bound: convenience for lists
grid:SetData(items)
grid:SetRowBinder(function(row, item, index)
    row:GetCell(1):SetIcon(item.icon)
    row:GetCell(2):SetText(item.name)
end)
```

---

## Anti-Patterns to Avoid

| Anti-Pattern | Why it's problematic |
|--------------|---------------------|
| Hardcoded colors/sizes | Breaks theming, hard to maintain |
| Polling with `OnUpdate` | Performance drain; use events instead |
| Deep component nesting | Makes debugging and styling difficult |
| Monolithic widgets | Harder to compose; prefer small building blocks |
| Skipping fallbacks | Addon breaks if FenUI isn't installed |
| Blocking Selection | Setting `OnMouseDown` on EditBox parents | Prevents text highlighting and copying |

---

## Known Traps & Performance

### 1. Multi-line EditBox Selection
When wrapping an `EditBox` inside a `ScrollFrame` (like `MultiLineEditBox`), it is a common trap to set `OnMouseDown` scripts on the parent frames to "click to focus". 

**The Trap:** Setting `OnMouseDown` on a parent frame (or the EditBox itself) often intercepts the mouse-down event that the WoW engine uses to initiate text selection/highlighting. 

**The Solution:** 
- Use `OnMouseUp` on the parent frames for focusing logic.
- Avoid manual `SetHeight` calls on the `EditBox` during active interaction, as this can cause coordinate offsets ("Interaction Dead-zones").
- Ensure the `EditBox` correctly handles its own focus while allowing events to bubble where appropriate.

---

## Summary

FenUI succeeds when:

- Components are **small, composable building blocks**
- The API feels **familiar and intuitive**
- Addons **work without FenUI** (graceful degradation)
- Styling flows through **design tokens**
- Real-world usage **drives improvements**

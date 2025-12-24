# FenUI Design Principles

FenUI is a Blizzard-first UI widget library for World of Warcraft addon development. This document captures the philosophy, guidelines, and patterns that guide its design.

---

## Core Philosophy

### 1. Foundation First

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

---

## Technical Principles

### Blizzard-First

FenUI is a *progressive enhancement layer*, not a replacement for Blizzard's UI system.

- Use `NineSliceUtil` and `NineSliceLayouts` for frame styling
- Leverage the native Atlas system for textures
- Support `textureKit` theming for seamless integration with official UI

**Why:** Native APIs are stable, performant, and future-proof. Fighting the platform creates maintenance burden.

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

The `Layout` component is the foundation for all containers. It handles:

- **Background** — Color, image, gradient, or conditional
- **Border** — NineSlice via BlizzardBridge
- **Shadow** — Inner (Blizzard textures) or drop (custom textures)
- **Cells** — Single content area or multi-row structure

Higher-level components build on Layout:

```
Layout (foundation)
  ├── Panel = Layout + title + close button
  ├── Inset = Layout with inset styling
  ├── Card = Layout with subtle border
  └── Dialog = Layout with shadow preset
```

Use Layout directly when you need custom containers:

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

---

## Summary

FenUI succeeds when:

- Components are **small, composable building blocks**
- The API feels **familiar and intuitive**
- Addons **work without FenUI** (graceful degradation)
- Styling flows through **design tokens**
- Real-world usage **drives improvements**

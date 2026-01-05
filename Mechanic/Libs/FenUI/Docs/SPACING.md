# Spacing System

FenUI uses a systematic approach to spacing based on **Margin** and **Padding** tokens. This ensures consistent alignment across all components and prevents common UI issues like "background bleeding" or "transparent gaps".

## Core Principle: Zero Default Spacing

Containers and widgets in FenUI never have built-in padding or margins by default. This makes components highly composable, as their visual boundaries match their logical boundaries.

- **Explicit Padding**: Always provide `padding` (or side-specific attributes) to containers.
- **Intentional Margins**: Margins are applied by the consumer during positioning, not the component itself.

## Mental Model: Margin vs. Padding

FenUI differentiates between spacing *outside* a container and spacing *inside* a container.

### 1. Margin (External Spacing)
Margins control the distance between a component's visual elements (border, background) and its physical boundary. This allows you to space components away from neighbors without changing parent padding or manual anchor offsets.

- **`margin`**: Can be a number, a token name, or a table `{ top, bottom, left, right }`.
- **Side Overrides**: `marginTop`, `marginBottom`, `marginLeft`, `marginRight` attributes override any values set in the `margin` property.

### 2. Padding (Internal Spacing)
Padding controls the distance from a component's visual edge to its internal content. FenUI supports both symmetric padding and side-specific overrides.

- **`padding`**: Can be a number, a token name, or a table `{ top, bottom, left, right }`.
- **Side Overrides**: `paddingTop`, `paddingBottom`, `paddingLeft`, `paddingRight` attributes override any values set in the `padding` property.

---

## Systematic Application

### Panels
Panels use the `SafeZone` frame to position their content slots. This ensures that content is clear of the Blizzard "metal" border art. However, no additional internal padding is applied by default. Panels also support `margin` which will inset the entire visual panel (border and background) from its anchors.

### Insets and ScrollPanels
These convenience containers no longer apply default margins or padding. You must explicitly set `padding` if you want a gap between the inset's border and its content.

### Groups
The `Group` widget is skinless and also adheres to the Zero Default Spacing principle. Use it for semantic grouping or to create custom layout structures without adding any visual weight. It supports both `padding` and `margin` which work together to define the internal content area.

```lua
local sidebarGroup = FenUI:CreateGroup(parent, {
    marginLeft = "spacingPanel",
    marginRight = "spacingPanel",
})
```

### Layout Primitive
The `Layout` component is the primary consumer of the spacing system. It correctly insets backgrounds, borders, and shadows based on the provided `margin`, and insets content based on both `margin` and `padding`.

```lua
FenUI:CreateLayout(parent, {
    margin = 10,
    padding = 20,
    border = "ModernDark",
})
-- Result: Border starts at 10px from frame edge. Content starts at 30px (10 margin + 20 padding) from frame edge.
```

---

## Background Insets (NineSlice Compatibility)

FenUI uses a dedicated **background frame architecture** to ensure backgrounds render correctly with NineSlice borders.

### Why This Matters

In WoW 9.1.5+, frames using NineSlice borders cannot reliably render textures created directly on them. FenUI creates a child frame (`bgFrame`) at `frameLevel 0` specifically for backgrounds, following Blizzard's pattern in `FlatPanelBackgroundTemplate`.

### Asymmetric Insets

Different border types have different chamfered corner sizes. FenUI uses **asymmetric insets** to handle this:

| Border Type | Left | Right | Top | Bottom | Notes |
|-------------|------|-------|-----|--------|-------|
| `Panel` | 6px | 2px | 6px | 2px | ButtonFrameTemplateNoPortrait |
| `Inset` | 2px | 2px | 2px | 2px | InsetFrameTemplate |
| `Dialog` | 6px | 6px | 6px | 6px | DialogBorderTemplate |

### Custom Override

To override the default insets for a specific Layout:

```lua
FenUI:CreateLayout(parent, {
    border = "Panel",
    background = "surfacePanel",
    backgroundInset = { left = 8, right = 4, top = 8, bottom = 4 },
})
```

### Troubleshooting

| Problem | Cause | Solution |
|---------|-------|----------|
| Background bleeding outside corners | Inset too small | Increase inset values |
| Transparent gaps at edges | Inset too large | Decrease inset values |
| Background not showing at all | Frame has 0x0 size at Init | OnSizeChanged handler should fix this automatically |

---

## Spacing Tokens

| Token | Type | Value | Use Case |
|-------|------|-------|----------|
| `marginPanel` | Semantic | `12px` | Suggested Panel -> Content gap |
| `marginContainer` | Semantic | `8px` | Suggested gap between siblings |
| `insetContent` | Semantic | `8px` | Suggested Content -> Border gap |
| `spacingPanel` | Legacy | `16px` | Old internal padding (deprecated) |

## Layout Constants

| Constant | Value | Description |
|----------|-------|-------------|
| `headerHeight` | `24px` | Safe-zone for Panel header bar |
| `footerHeight` | `32px` | Safe-zone for Panel footer bar |
| `tabHeight` | `28px` | Standard height for top tabs |

---

## Best Practices

1. **Avoid Hardcoded Offsets**: Always use `FenUI:GetSpacing("marginPanel")` or `FenUI:GetLayout("headerHeight")` instead of numeric literals like `-35`.
2. **Edge-to-Edge Content**: If you need a background image to touch the border art exactly, set `backgroundInset = 0` in the Layout config.
3. **Internal Spacing**: Use the `padding` or side-specific attributes on Layouts and Grids to control content flow.
4. **Zero Default**: Assume every container starts with 0 padding. Add only what you need.
5. **Auto Sizing**: Use `width = "auto"` or `height = "auto"` when you want a container to shrink-wrap its contents. This is especially useful for dialogs and tooltips.

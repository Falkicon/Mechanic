# FenUI Improvement Backlog

Lessons learned from integrating FenUI v2 with Weekly Journal.

## High Priority

### 1. Color API Helpers
**Problem**: `FenUI:GetColor()` returns 4 values (r,g,b,a) but `SetTextColor()` and other WoW APIs expect 3.

**Solution**: Add convenience methods:
```lua
FenUI:GetColorRGB(token)     -- returns r, g, b (no alpha)
FenUI:GetColorTable(token)   -- returns {r, g, b} table
FenUI:SetTextColor(fontString, token)  -- applies directly
```

### 2. Content Inset Component
**Problem**: Creating a styled content area inside a panel requires manual backdrop setup with hardcoded values.

**Solution**: Add `FenUI:CreateInset(parent, config)` that creates a properly styled content container:
```lua
local inset = FenUI:CreateInset(panel, {
    padding = "md",  -- uses spacing tokens
    scroll = true,   -- optional scroll frame
})
```

### 3. Scroll Panel Widget
**Problem**: Creating scrollable content requires boilerplate (ScrollFrame + ScrollChild + template).

**Solution**: Add `FenUI:CreateScrollPanel(parent, config)`:
```lua
local scroll = FenUI:CreateScrollPanel(parent, {
    padding = 5,
    showScrollBar = true,
})
local content = scroll:GetScrollChild()
```

### 4. Layout Spacing Tokens
**Problem**: Journal uses hardcoded pixel values (10, 12, 40, 68) for positioning.

**Solution**: Add layout-specific semantic tokens:
```lua
FenUI.Tokens.semantic = {
    -- Panel layout
    panelPadding = "md",        -- 16px - edge padding
    panelHeaderHeight = 40,      -- title bar height
    panelFooterHeight = 40,      -- footer height
    
    -- Content layout  
    contentPadding = "sm",       -- 8px - content inset
    rowHeight = 24,              -- standard row height
    tabHeight = 28,              -- tab button height
}
```

## Medium Priority

### 5. List/Row Component
**Problem**: Journal manually creates rows with icon, name, extra text, highlight, click handlers.

**Solution**: Add `FenUI:CreateListRow(parent, config)`:
```lua
local row = FenUI:CreateListRow(parent, {
    icon = "Interface\\Icons\\...",
    text = "Item Name",
    subtext = "Extra info",
    onClick = function() end,
    onEnter = function() end,
})
row:SetIcon(texture)
row:SetText(text)
row:SetSubtext(text)
row:SetHighlighted(bool)
```

### 6. List Container
**Problem**: Managing a pool of rows and rendering lists requires custom code.

**Solution**: Add `FenUI:CreateList(parent, config)`:
```lua
local list = FenUI:CreateList(scrollChild, {
    rowHeight = 24,
    rowTemplate = "default",  -- or custom
    onRowCreate = function(row) end,
    onRowBind = function(row, data) end,
})
list:SetData(items)
list:Refresh()
```

### 7. Empty State Component
**Problem**: "No items" messaging is common but manual.

**Solution**: Add `FenUI:CreateEmptyState(parent, config)`:
```lua
local empty = FenUI:CreateEmptyState(parent, {
    icon = "...",
    title = "No items collected",
    subtitle = "Items will appear here as you collect them",
})
```

### 8. Badge Support Expansion
**Problem**: Only tabs have badges. Other components need them too.

**Solution**: Add `BadgeMixin` that can be applied to any component:
```lua
FenUI.Mixin(button, FenUI.BadgeMixin)
button:SetBadge("5")
button:SetBadgeColor("feedbackSuccess")
```

## Low Priority

### 9. Divider/Header Component
**Problem**: Section headers like "By Category" are manually created.

**Solution**: Add `FenUI:CreateDivider(parent, text)` and `FenUI:CreateSectionHeader(parent, text)`.

### 10. Footer Component
**Problem**: Panel footers with buttons need manual layout.

**Solution**: Add footer slot support with button alignment:
```lua
panel:SetFooter({
    left = { clearTabBtn, clearAllBtn },
    right = { weekLabel },
})
```

### 11. Stat Row Component
**Problem**: Dashboard stats (icon + label + value) are common.

**Solution**: Add `FenUI:CreateStatRow(parent, config)`:
```lua
local stat = FenUI:CreateStatRow(parent, {
    icon = "...",
    label = "Total Items",
    value = "42",
    valueColor = "feedbackSuccess",
})
```

## API Consistency

### 12. Standardize Color Parameters
All FenUI widgets that accept colors should accept:
- Semantic token string: `"feedbackSuccess"`
- Color table: `{0.2, 0.8, 0.2}`
- Raw values: `0.2, 0.8, 0.2`

### 13. Standardize Size Parameters
All FenUI widgets that accept sizes should accept:
- Spacing token string: `"md"`
- Number: `16`

## Documentation Needs

- Add "Integrating FenUI into Existing Addons" guide
- Document common patterns (scrollable lists, dashboards, settings panels)
- Add visual examples of each component
- Document token system with visual swatches

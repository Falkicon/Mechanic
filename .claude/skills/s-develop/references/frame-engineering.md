# Frame Engineering

UI frame creation and management patterns.

## Frame Creation

### Basic Frame

```lua
local frame = CreateFrame("Frame", "MyAddonFrame", UIParent)
frame:SetSize(200, 100)
frame:SetPoint("CENTER")
```

### Frame Types

| Type | Purpose |
|------|---------|
| Frame | Basic container |
| Button | Clickable element |
| EditBox | Text input |
| ScrollFrame | Scrollable content |
| StatusBar | Progress bars |
| Slider | Value selection |
| CheckButton | Toggle option |
| GameTooltip | Tooltip display |

### From Template

```lua
-- Use Blizzard templates
local button = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
button:SetText("Click Me")

-- Backdrop template
local panel = CreateFrame("Frame", nil, parent, "BackdropTemplate")
panel:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 },
})
```

## Positioning

### SetPoint

```lua
-- Anchor to parent
frame:SetPoint("TOPLEFT", 10, -10)
frame:SetPoint("BOTTOMRIGHT", -10, 10)

-- Anchor to another frame
frame:SetPoint("LEFT", otherFrame, "RIGHT", 5, 0)

-- Clear and reset
frame:ClearAllPoints()
frame:SetPoint("CENTER")
```

### Common Anchors

```
TOPLEFT    TOP       TOPRIGHT
LEFT       CENTER    RIGHT
BOTTOMLEFT BOTTOM    BOTTOMRIGHT
```

### Responsive Layout

```lua
-- Fill parent with padding
frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, -10)
frame:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -10, 10)

-- Chain elements horizontally
local prev = nil
for i, data in ipairs(items) do
    local btn = CreateFrame("Button", nil, parent)
    btn:SetSize(80, 24)
    if prev then
        btn:SetPoint("LEFT", prev, "RIGHT", 5, 0)
    else
        btn:SetPoint("LEFT", 10, 0)
    end
    prev = btn
end
```

## Frame Pools

Reuse frames instead of creating/destroying:

```lua
-- Create pool
local buttonPool = CreateFramePool("Button", parent, "UIPanelButtonTemplate")

-- Acquire frame from pool
local button = buttonPool:Acquire()
button:SetText("New Button")
button:Show()

-- Release back to pool (hides and resets)
buttonPool:Release(button)

-- Release all
buttonPool:ReleaseAll()
```

## Font Strings

```lua
local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
text:SetPoint("CENTER")
text:SetText("Hello World")
text:SetTextColor(1, 1, 1) -- RGB 0-1

-- Custom font
text:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
```

## Textures

```lua
-- Solid color
local bg = frame:CreateTexture(nil, "BACKGROUND")
bg:SetAllPoints()
bg:SetColorTexture(0, 0, 0, 0.5) -- RGBA

-- Image
local icon = frame:CreateTexture(nil, "ARTWORK")
icon:SetSize(32, 32)
icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")

-- Atlas (Blizzard UI texture)
icon:SetAtlas("QuestNormal")
```

## Layers

Draw order (back to front):
1. BACKGROUND
2. BORDER
3. ARTWORK
4. OVERLAY
5. HIGHLIGHT

```lua
frame:CreateTexture(nil, "BACKGROUND")  -- Behind content
frame:CreateTexture(nil, "OVERLAY")     -- Above content
```

## Scripts

```lua
frame:SetScript("OnShow", function(self)
    -- Frame became visible
end)

frame:SetScript("OnHide", function(self)
    -- Frame was hidden
end)

frame:SetScript("OnEnter", function(self)
    -- Mouse entered
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:AddLine("Tooltip text")
    GameTooltip:Show()
end)

frame:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

-- Button specific
button:SetScript("OnClick", function(self, button, down)
    if button == "LeftButton" then
        -- left click
    elseif button == "RightButton" then
        -- right click
    end
end)
```

## Draggable Frames

```lua
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")

frame:SetScript("OnDragStart", function(self)
    self:StartMoving()
end)

frame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    -- Save position
    local point, _, relPoint, x, y = self:GetPoint()
    db.position = { point, relPoint, x, y }
end)
```

## Resizable Frames

```lua
frame:SetResizable(true)
frame:SetResizeBounds(100, 50, 400, 300) -- min/max width/height

-- Create resize handle
local resizer = CreateFrame("Button", nil, frame)
resizer:SetSize(16, 16)
resizer:SetPoint("BOTTOMRIGHT")
resizer:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")

resizer:SetScript("OnMouseDown", function()
    frame:StartSizing("BOTTOMRIGHT")
end)

resizer:SetScript("OnMouseUp", function()
    frame:StopMovingOrSizing()
end)
```

## Strata and Level

Control draw order:

```lua
-- Strata (coarse, system-wide)
frame:SetFrameStrata("HIGH")
-- BACKGROUND < LOW < MEDIUM < HIGH < DIALOG < FULLSCREEN < TOOLTIP

-- Level (fine, within strata)
frame:SetFrameLevel(10)
```

## Best Practices

1. **Pre-create frames** - Don't create in combat or OnUpdate
2. **Use frame pools** - For dynamic lists, reuse frames
3. **Parent wisely** - Child frames inherit show/hide/strata
4. **Name sparingly** - Global names for debugging only
5. **Hide don't destroy** - frame:Hide() is instant, destroying is complex

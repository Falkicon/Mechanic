# Inspect Integration

Register frames for Mechanic's Inspect tool (frame watch list).

---

## Frame Registration

```lua
MechanicLib:Register(ADDON_NAME, {
    inspect = {
        getWatchFrames = function()
            local frames = {}
            
            -- Main container
            if MyAddon.frame then
                table.insert(frames, {
                    label = "Main Frame",
                    frame = MyAddon.frame,
                    property = "Visibility",
                })
            end
            
            -- Status bars
            if MyAddon.healthBar then
                table.insert(frames, {
                    label = "Health Bar",
                    frame = MyAddon.healthBar,
                    property = "Value",
                })
            end
            
            -- Dynamic frames
            for i, bar in ipairs(MyAddon.abilityBars or {}) do
                table.insert(frames, {
                    label = "Ability " .. i,
                    frame = bar,
                    property = "Value",
                })
            end
            
            return frames
        end,
    },
})
```

---

## Property Types

| Property | Description | Best For |
|----------|-------------|----------|
| `Visibility` | Shows/hides, alpha, shown state | Containers, panels |
| `Value` | Current StatusBar value | Progress bars, health bars |
| `Width` | Tracks frame width changes | Dynamic-width elements |
| `Position` | Tracks anchor points | Movable frames |

---

## Click-Through Containers

When creating container frames that should show in Inspect but not block mouse clicks:

```lua
-- Container that's visible but click-through
local container = CreateFrame("Frame", nil, UIParent)
container:SetSize(200, 100)
container:EnableMouse(false)  -- Click-through

-- Child that receives clicks
local button = CreateFrame("Button", nil, container, "UIPanelButtonTemplate")
button:EnableMouse(true)  -- Interactive
```

### Scroll Containers

```lua
local scrollFrame = CreateFrame("ScrollFrame", nil, parent)
scrollFrame:EnableMouseWheel(true)  -- Scroll works

local scrollChild = CreateFrame("Frame", nil, scrollFrame)
scrollChild:EnableMouse(true)  -- Content is interactive
```

---

## Frame Registration Format

Each frame entry should include:

| Field | Type | Description |
|-------|------|-------------|
| `label` | string | Display name in Inspect panel |
| `frame` | Frame | The actual frame object |
| `property` | string | Property to track (see Property Types) |

---

## Best Practices

1. **Register key frames** — Main container, primary UI elements
2. **Use descriptive labels** — "Speed Bar" not "Bar1"
3. **Handle nil frames** — Check existence before adding
4. **Include dynamic frames** — Loop through ability bars, buff icons, etc.

---

## Example: Full Implementation

From [FenUI_Explorer/Core.lua](../../../FenUI_Explorer/Core.lua):

```lua
MechanicLib:Register(ADDON_NAME, {
    inspect = {
        getWatchFrames = function()
            local frames = {}
            if self.frame then
                table.insert(frames, { label = "Explorer Main", frame = self.frame, property = "Visibility" })
                if self.layout then
                    table.insert(frames, { label = "Explorer Layout", frame = self.layout, property = "Visibility" })
                    local content = self.layout:GetContentFrame()
                    if content then
                        table.insert(frames, { label = "Explorer Content", frame = content, property = "Visibility" })
                    end
                end
            end
            return frames
        end,
    },
})
```

---

## Related Guides

- [MechanicLib Registration](./mechaniclib.md)
- [Tools Integration](./tools.md)

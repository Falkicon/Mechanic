# Tools Integration

Register a custom tools panel that appears in Mechanic's Tools tab.

---

## Tools vs Tests

| Tab | Purpose | Content |
|-----|---------|---------|
| **Tools** | Interactive actions | Buttons that trigger slash commands, toggle settings |
| **Tests** | Verification | Pass/fail checks for API compatibility, data integrity |

Tools are **actions**. Tests are **assertions**.

---

## Button-Based Tools Panel

**Example:** See [Flightsim/Config.lua](../../../Flightsim/Config.lua)

```lua
--- Create a button helper
local function CreateToolButton(parent, x, y, width, text, onClick)
    local btn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    btn:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    btn:SetSize(width, 24)
    btn:SetText(text)
    btn:SetScript("OnClick", onClick)
    return btn
end

function MyAddon:CreateToolsPanel(container)
    -- Title
    local title = container:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 10, -10)
    title:SetText("MyAddon Tools")

    -- Description
    local desc = container:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    desc:SetPoint("TOPLEFT", 10, -35)
    desc:SetText("Quick actions for MyAddon.")

    -- Row 1: Position & Lock
    local row1Label = container:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    row1Label:SetPoint("TOPLEFT", 10, -65)
    row1Label:SetText("Position:")

    CreateToolButton(container, 80, -60, 100, "Reset", function()
        if MyAddonDB and MyAddonDB.profile then
            MyAddonDB.profile.x = 0
            MyAddonDB.profile.y = 0
            -- Apply to frame...
            print("|cff00ff00MyAddon:|r Position reset.")
        end
    end)

    CreateToolButton(container, 185, -60, 80, "Lock", function()
        if MyAddonDB and MyAddonDB.profile then
            MyAddonDB.profile.locked = true
            print("|cff00ff00MyAddon:|r Locked.")
        end
    end)

    CreateToolButton(container, 270, -60, 80, "Unlock", function()
        if MyAddonDB and MyAddonDB.profile then
            MyAddonDB.profile.locked = false
            print("|cff00ff00MyAddon:|r Unlocked.")
        end
    end)

    -- Row 2: Debug
    local row2Label = container:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    row2Label:SetPoint("TOPLEFT", 10, -100)
    row2Label:SetText("Debug:")

    CreateToolButton(container, 80, -95, 100, "Toggle Debug", function()
        if MyAddonDB and MyAddonDB.profile then
            MyAddonDB.profile.debugMode = not MyAddonDB.profile.debugMode
            MyAddon.debugMode = MyAddonDB.profile.debugMode
            print("|cff00ff00MyAddon:|r Debug " .. (MyAddon.debugMode and "ON" or "OFF"))
        end
    end)

    -- Footer
    local footer = container:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    footer:SetPoint("BOTTOM", 0, 10)
    footer:SetText("Use /myaddon for more options.")
end
```

### Register with MechanicLib

```lua
MechanicLib:Register(ADDON_NAME, {
    tools = {
        createPanel = function(container)
            MyAddon:CreateToolsPanel(container)
        end,
    },
})
```

---

## Layout Guidelines

### Spacing Constants

| Element | Value |
|---------|-------|
| Title Y offset | -10 |
| Description Y offset | -35 |
| First row Y offset | -65 |
| Row spacing | 35px |
| Button height | 24px |
| Label X offset | 10 |
| First button X offset | 80 |

### Button Sizing

| Button Type | Width |
|-------------|-------|
| Short action (Lock, Unlock) | 80px |
| Standard action (Reset, Toggle) | 100px |
| Wide action (Show Always) | 100-120px |

---

## Best Practices

| Practice | Reason |
|----------|--------|
| **Print feedback with colored prefix** | `\|cff00ff00AddonName:\|r` confirms action executed |
| **Guard DB access** | Check `if MyAddonDB and MyAddonDB.profile then` |
| **Reuse slash command logic** | Buttons should call same functions as `/addon` commands |
| **Keep buttons in logical rows** | Position, Visibility, Debug, etc. |

---

## Related Guides

- [MechanicLib Registration](./mechaniclib.md)
- [Tests Integration](./tests.md)
- [Console Integration](./console.md)

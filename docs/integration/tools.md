# Tools Integration

Register a custom tools panel that appears in Mechanic's Tools tab.

---

## Basic Tools Panel

**Example:** See [FenUI_Explorer/Core.lua](../../../FenUI_Explorer/Core.lua)

```lua
function MyAddon:CreateToolsPanel(container)
    -- Title
    local title = container:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 10, -10)
    title:SetText("MyAddon Tools")
    
    -- Description
    local desc = container:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    desc:SetPoint("TOPLEFT", 10, -40)
    desc:SetText("Quick actions for MyAddon.")
    
    -- Action Button
    local btn = CreateFrame("Button", nil, container, "UIPanelButtonTemplate")
    btn:SetPoint("TOPLEFT", 10, -80)
    btn:SetSize(150, 24)
    btn:SetText("Toggle Feature")
    btn:SetScript("OnClick", function()
        MyAddon:ToggleFeature()
    end)
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

## Advanced Tools Panel (Compliance Lab)

**Example:** See [Flightsim/Config.lua](../../../Flightsim/Config.lua) for a "Midnight UI Compliance Lab" that tests various API patterns:

```lua
function MyAddon:CreateCompliancePanel(container)
    local title = container:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -10)
    title:SetText("Midnight UI Compliance Lab")
    
    local function CreateTestBar(y, label, color)
        local bar = CreateFrame("StatusBar", nil, container)
        bar:SetHeight(24)
        bar:SetPoint("TOPLEFT", container, "TOPLEFT", 20, y)
        bar:SetPoint("TOPRIGHT", container, "TOPRIGHT", -20, y)
        bar:SetStatusBarTexture("Interface/Buttons/WHITE8X8")
        bar:SetStatusBarColor(unpack(color))
        
        local bg = bar:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints()
        bg:SetColorTexture(0.1, 0.1, 0.1, 1)
        
        local text = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        text:SetPoint("CENTER")
        text:SetText(label)
        
        return bar
    end
    
    -- Test 1: Standard SetValue
    pcall(function()
        local bar = CreateTestBar(-50, "1. SetValue(1) [Control]", { 0, 1, 0 })
        bar:SetMinMaxValues(0, 1)
        bar:SetValue(1)
    end)
    
    -- Test 2: Secret Passthrough
    pcall(function()
        local bar = CreateTestBar(-80, "2. SetValue(secret) [Speed]", { 0, 0.5, 1 })
        bar:SetMinMaxValues(0, 1000)
        local speed = GetUnitSpeed("player")
        bar:SetValue(type(speed) == "number" and speed or 0)
    end)
    
    -- Test 3: Boolean Proxy
    pcall(function()
        local bar = CreateTestBar(-110, "3. SetValue(Proxy) [Spell Usable]", { 1, 0.5, 0 })
        local usable = C_Spell.IsSpellUsable(372608)
        bar:SetMinMaxValues(0, 1)
        bar:SetValue(usable and 1 or 0)
    end)
end
```

---

## Panel Guidelines

1. **Use standard WoW templates** — `UIPanelButtonTemplate`, `GameFontNormal`, etc.
2. **Wrap in pcall** — Prevents tools panel errors from breaking Mechanic
3. **Provide clear labels** — Users should understand each tool's purpose
4. **Keep actions focused** — One button = one action

---

## Related Guides

- [MechanicLib Registration](./mechaniclib.md)
- [Inspect Integration](./inspect.md)

# Frame Templates and Mixins

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2025-12-18

---

## Overview

Blizzard uses Mixins as their preferred OOP pattern. Understanding this system is essential for working with or extending Blizzard UI.

---

## Mixins: Blizzard's OOP Pattern

A Mixin is a table of functions that can be "mixed into" other objects. This is Blizzard's composition-over-inheritance approach.

### Defining a Mixin

```lua
MyButtonMixin = {}

function MyButtonMixin:OnLoad()
    self:RegisterForClicks("LeftButtonUp", "RightButtonUp")
end

function MyButtonMixin:OnClick(button)
    if button == "LeftButton" then
        self:DoLeftClick()
    else
        self:DoRightClick()
    end
end

function MyButtonMixin:DoLeftClick()
    print("Left clicked:", self:GetName())
end

function MyButtonMixin:DoRightClick()
    print("Right clicked:", self:GetName())
end
```

### Applying a Mixin

```lua
-- Method 1: CreateFromMixins (creates new table with mixin functions)
local myObject = CreateFromMixins(MyButtonMixin)

-- Method 2: Mixin (adds functions to existing object)
local frame = CreateFrame("Button", nil, UIParent)
Mixin(frame, MyButtonMixin)
frame:OnLoad()

-- Method 3: XML template (preferred for reusable UI)
```

---

## XML Templates

XML templates define reusable frame structures.

### Basic Template

```xml
<Ui xmlns="http://www.blizzard.com/wow/ui/">
    <Button name="MyButtonTemplate" mixin="MyButtonMixin" virtual="true">
        <Size x="100" y="24"/>
        <NormalTexture file="Interface\Buttons\UI-Panel-Button-Up"/>
        <HighlightTexture file="Interface\Buttons\UI-Panel-Button-Highlight"/>
        <Scripts>
            <OnLoad method="OnLoad"/>
            <OnClick method="OnClick"/>
        </Scripts>
    </Button>
</Ui>
```

### Using the Template in Lua

```lua
local button = CreateFrame("Button", "MyButton1", UIParent, "MyButtonTemplate")
button:SetPoint("CENTER")
-- OnLoad is called automatically, Mixin is applied
```

---

## When to Use XML vs Pure Lua

### Use XML When

- Creating reusable templates used multiple times
- Defining complex hierarchical structures
- Inheriting from Blizzard templates
- Need visual editor compatibility

### Use Pure Lua When

- Dynamic frame creation
- Simple one-off frames
- Full programmatic control needed
- No Blizzard template inheritance needed

### Hybrid Approach (Recommended)

```lua
-- Define Mixin in Lua
MyFrameMixin = {}
function MyFrameMixin:OnLoad()
    -- Setup
end

-- Use XML for template structure, reference Lua Mixin
-- Or create entirely in Lua for simpler cases
local frame = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
Mixin(frame, MyFrameMixin)
frame:OnLoad()
```

---

## Common Blizzard Templates

### BackdropTemplate

Required for frames with backgrounds since 9.0:

```lua
local frame = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
frame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 32,
    insets = { left = 8, right = 8, top = 8, bottom = 8 }
})
frame:SetBackdropColor(0, 0, 0, 0.8)
```

### SecureActionButtonTemplate

For buttons that perform protected actions:

```lua
local button = CreateFrame("Button", "MySecureButton", UIParent, 
    "SecureActionButtonTemplate")
button:SetAttribute("type", "spell")
button:SetAttribute("spell", "Fireball")
-- Attributes must be set outside combat
```

### SecureHandlerStateTemplate

For state-driven behavior:

```lua
local frame = CreateFrame("Frame", nil, UIParent, 
    "SecureHandlerStateTemplate")
RegisterStateDriver(frame, "visibility", "[combat] show; hide")
```

---

## Blizzard Mixin Patterns

Study these in `wow-ui-source-live/Interface/AddOns/Blizzard_SharedXML/`:

### CallbackRegistryMixin

For objects that need callback/event systems:

```lua
MyObjectMixin = CreateFromMixins(CallbackRegistryMixin)
MyObjectMixin:GenerateCallbackEvents({ "OnValueChanged", "OnReset" })

function MyObjectMixin:SetValue(value)
    self.value = value
    self:TriggerEvent("OnValueChanged", value)
end

-- Usage
local obj = CreateFromMixins(MyObjectMixin)
obj:OnLoad()  -- Initializes callback system
obj:RegisterCallback("OnValueChanged", function(_, value)
    print("Value changed to:", value)
end)
```

### ScrollBoxMixin

Modern scrolling (replaces FauxScrollFrame):

```lua
-- See: wow-ui-source-live/.../Blizzard_SharedXML/Shared/Scroll/
```

---

## Modifying Blizzard UI

### Safe Hook Pattern

```lua
-- Post-hook (safe, runs after original)
hooksecurefunc(SomeFrame, "SomeMethod", function(self, ...)
    -- Your code runs after original
end)

-- DO NOT replace functions on protected frames
```

### Frame Skin Pattern

```lua
-- Safely restyle a Blizzard frame
local function SkinFrame(frame)
    -- Hide original textures
    if frame.NineSlice then
        frame.NineSlice:Hide()
    end
    
    -- Apply new backdrop
    if not frame.customBackdrop then
        frame.customBackdrop = CreateFrame("Frame", nil, frame, "BackdropTemplate")
        frame.customBackdrop:SetAllPoints()
        frame.customBackdrop:SetFrameLevel(frame:GetFrameLevel())
        frame.customBackdrop:SetBackdrop({...})
    end
end
```

### Hijacking Pattern (Use Carefully)

For proxy/shadow systems like ActionHud's cooldown hijacking:

```lua
-- Store original state
frame.ahOriginalParent = frame:GetParent()
frame.ahOriginalAlpha = frame:GetAlpha()

-- Reparent to your container
frame:SetParent(myContainer)
frame:SetAlpha(0)  -- Hide original

-- Create proxy for display
local proxy = CreateFrame("Frame", nil, myContainer)
-- Sync proxy with original on timer

-- Restore when disabled
function RestoreFrame(frame)
    if frame.ahOriginalParent then
        frame:SetParent(frame.ahOriginalParent)
        frame:SetAlpha(frame.ahOriginalAlpha or 1)
    end
end
```

---

## Mixin Inheritance

Combine multiple mixins:

```lua
-- Base mixin
BaseFrameMixin = {}
function BaseFrameMixin:OnLoad()
    self.initialized = true
end

-- Extended mixin
ExtendedFrameMixin = CreateFromMixins(BaseFrameMixin)
function ExtendedFrameMixin:OnLoad()
    BaseFrameMixin.OnLoad(self)  -- Call parent
    self:SetupExtendedFeatures()
end

function ExtendedFrameMixin:SetupExtendedFeatures()
    -- Additional setup
end
```

---

## Blizzard UI Source Reference

Key directories for studying templates and mixins:

```
wow-ui-source-live/Interface/AddOns/Blizzard_SharedXML/
├── Shared/
│   ├── Scroll/ScrollTemplates.lua    # Modern scroll system
│   ├── Slider/MinimalSlider.lua      # Slider mixin
│   └── Tabs/MinimalTab.lua           # Tab mixin

wow-ui-source-live/Interface/AddOns/Blizzard_ActionBar/
└── Mainline/ActionButton.lua         # Action button implementation

wow-ui-source-live/Interface/AddOns/Blizzard_UnitFrame/
└── PlayerFrame.lua                   # Unit frame patterns
```

---

## Quick Decision Guide

| Situation | Approach |
|-----------|----------|
| Reusable button with behavior | Mixin + XML template |
| One-off settings panel | Pure Lua + BackdropTemplate |
| Extending Blizzard frame | hooksecurefunc + Mixin |
| Action button (casts spells) | SecureActionButtonTemplate |
| Complex scrolling list | Study Blizzard's ScrollBox |
| Simple scrolling | ScrollFrame template |

---

## See Also

- [UI Engineering](./05-ui-engineering.doc.md) - Frame creation basics
- [Secure Actions](./21-secure-actions.doc.md) - Protected frame handling
- [Combat Lockdown](./07-combat-lockdown.doc.md) - Combat restrictions



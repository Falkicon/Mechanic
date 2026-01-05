# UI Engineering

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2026-01-02

---

## Overview

Efficient frame creation and layout is critical for addon performance and maintainability.

**Midnight Note**: Display-only frames are unaffected by Midnight restrictions. This is the safest category of addon functionality.

---

## Frame Creation

### Prefer a single root frame

```lua
local frame = CreateFrame("Frame", "MyAddonFrame", UIParent)
frame:SetSize(200, 100)
frame:SetPoint("CENTER")

-- Child regions
frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
frame.icon = frame:CreateTexture(nil, "ARTWORK")
```

**Why**: Easier to manage visibility, positioning, and cleanup.

### Widget recycling

Don't recreate frames repeatedly. Create once, reuse forever:

```lua
-- Create pool once
local buttonPool = {}
for i = 1, 10 do
    buttonPool[i] = CreateFrame("Button", nil, parent)
end

-- Reuse on update
function UpdateDisplay(items)
    for i, button in ipairs(buttonPool) do
        if items[i] then
            button:Show()
            button:SetText(items[i].name)
        else
            button:Hide()
        end
    end
end
```

## Managed Visibility (Midnight 12.0)
In Midnight, the standard "Calculate then Display" pattern is often blocked for combat values. Use "Managed Visibility" patterns instead.

### Pattern: The Black Box Pattern
Pass secret values directly to interpretation objects. Do not attempt to read or modify the value yourself.

**Example: SecondsFormatter** (pseudocode—verify API names against your target build)
```lua
-- PROBLEMATIC (May fail with secret values)
local time = expiration - GetTime()
fontString:SetText(string.format("%ds", time))

-- PASSTHROUGH (Using Blizzard's formatter objects)
-- Blizzard has announced SecondsFormatter objects specifically for formatting secret time values
local formatter = CreateSecondsFormatter(0, SecondsFormatter.Abbreviation.None, true);
fontString:SetText(formatter:Format(expiration - GetTime()))
```

> **Note**: Blizzard has publicly described adding `SecondsFormatter` Lua objects specifically to format secret time values into strings. Verify exact API names against FrameXML or generated API docs for your target build.

### Pattern: Decorative Alpha Hiding
If you only need visual disappearance, `SetAlpha(0)` may be preferable to `Hide()` in combat. Protected/secure frames cannot be programmatically shown/hidden/re-anchored/resized in combat, which is why `Hide()` can cause blocked-action errors.

> **Note**: This pattern won't help if the frame or method is protected in that context—it's a heuristic for visual-only changes, not a taint bypass.

### Pattern: Deferred Updates
Use `C_Timer.After(0)` to defer non-critical visual updates to the next frame tick. This reduces re-entrancy and ordering issues when hooking Blizzard functions.

```lua
-- hooksecurefunc is safe, but its callback runs in the same execution context
hooksecurefunc(BlizzardFrame, "OnAcquireItem", function(_, item)
    -- Zero-delay timer defers to the next tick
    C_Timer.After(0, function()
        -- Apply visual modifications after the original function completes
        if InCombatLockdown() then
            item.Border:SetAlpha(0)
        else
            item.Border:Hide()
        end
        item.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    end)
end)
```

> **Note**: `C_Timer.After(0)` schedules a callback for the next tick—it does **not** "untaint" or grant secure execution. It's useful for deferring work and avoiding re-entrancy, but won't bypass taint restrictions on protected frames.

## Icons and Atlases

WoW uses **Atlases** for most modern UI elements. Atlases are named texture regions that handle scaling and resolution automatically.

### Finding Icons
Use the `AtlasScanner` tool to find the correct atlas name for your UI:

```bash
addon-dev atlas search <keyword>
```

**Example**:
```bash
addon-dev atlas search eye
# Result: socialqueuing-icon-eye
```

### Applying Atlases
```lua
local tex = frame:CreateTexture(nil, "ARTWORK")
tex:SetAtlas("socialqueuing-icon-eye")
```

---

## FenUI Library

The `FenUI` library is the recommended framework for building structured, modern-looking UI panels and dashboards in the `ADDON_DEV` environment.

### FenUI Explorer (Storybook)
For a live, interactive reference of all available FenUI components, use the **FenUI Explorer** addon.
- **Access**: Run `/fui` in-game or click the minimap button.
- **Reference**: Use it to study layouts (Stack, Flex, Grid), widgets (Buttons, Tabs, Inputs), and design tokens (Colors, Spacing) in real-time.

#### Responsive Sizing & Constraints
FenUI supports advanced sizing units and boundaries to ensure layouts remain usable across all screen sizes:
- **Responsive Units**: Support for percentages (`"50%"`) and viewport units (`"10vh"`, `"5vw"`).
- **Intrinsic Sizing**: `"auto"` mode allows frames to shrink-wrap their content reactively.
- **Boundaries**: All widgets support `minWidth`, `maxWidth`, `minHeight`, and `maxHeight`.
- **Aspect Ratio**: Lock dimensions using `aspectRatio` (e.g., `"16:9"`, `1`) and `aspectBase` ("width" or "height").

### Core Widgets

| Widget | Purpose | Example Usage |
|--------|---------|---------------|
| `Panel` | Standard window with title, close box, and safe zone. | Main addon windows, settings. |
| `Tabs` | Horizontal navigation tabs. | Switching between modules (Console, Tests). |
| `StatusRow` | Horizontal bar for key-value status items. | Information bars, performance metrics. |
| `MultiLineEditBox` | Scrollable, multi-line text area. | Console logs, code export/import. |
| `Toolbar` | Horizontal button row with icons and tooltips. | Action buttons, filtering controls. |
| `SplitNavLayout` | Helper for left-nav / right-content split views. | Dashboard modules (Console, Tools). |
| `ScrollBar` | Managed dark scrollbar widget using design tokens. | Custom scrollable containers (v2.5.0+). |
| `Animation` | Declarative motion system wrapping WoW's native AnimationGroup. | Show/hide transitions, property changes. |

### Animation & Transition System (FenUI v2.8.0+)
FenUI provides a declarative way to add motion to your UI while maintaining performance through WoW's native `AnimationGroup` API.

**Key Features**:
- **Property Transitions**: Automatically animate value changes for `alpha`, `scale`, and `offset` via intercepted setters.
- **Lifecycle Animations**: Show/Hide frames with built-in presets like `fadeIn` or `slideUp`.
- **Keyframes**: Define multi-step animations using a timeline syntax.
- **Chaining**: Sequence animations using the `.Then()` API.

**Animation API Note**: Modern WoW uses consistent naming for animation methods. Verify method names against FrameXML or generated API docs for your target build.
- `Scale`: Use `SetScaleFrom(x, y)` and `SetScaleTo(x, y)` (these methods exist on Scale animation objects).
- `Alpha`: Use `SetFromAlpha(val)` and `SetToAlpha(val)`.
- `Translation`: Use `SetOffset(x, y)`.

> **Verify**: If you encounter `nil value` errors on animation methods, check the current FrameXML for the correct method names in your target build.

**Example**:
```lua
-- Panel with show/hide animations and alpha transition
local panel = FenUI.Panel(parent)
    :showAnimation("slideUp")
    :hideAnimation("fadeOut")
    :transition("alpha", { duration = 0.2 })
    :build()

-- This will now animate automatically
panel:SetAlpha(0.5)
```

### Custom NineSlice Engine
FenUI v2.5.0+ moves away from Blizzard's native `NineSliceUtil` due to its opacity and fragility. It implements a **Custom NineSlice Renderer** that manages 8 individual textures (4 corners, 4 edges) per frame.

- **Manageability**: Assets and insets are explicitly defined in `Tokens.lua` under `BorderPack` registry.
- **Visual Control**: Direct control over `edgeSize`, `slice` dimensions, and `contentInset`.
- **Dynamic Layers**: Backgrounds are automatically inset to stay within custom border edges.

### Inspectability Support
To support advanced in-game debugging, structural frames (cells, backgrounds, scroll areas) should be pickable by the inspector without blocking user interaction.

**The "Ghost Frame" Pattern**:
```lua
-- Modern Blizzard way to enable mouse-over (for GetMouseFoci) 
-- while ensuring clicks pass through to interactive elements below.
frame:EnableMouse(true)
if frame.SetMouseClickEnabled then
    frame:SetMouseClickEnabled(false)
end
```
*Implemented in FenUI foundational widgets (`Layout`, `ScrollPanel`).*

### FenUI & !Mechanic Integration
The `!Mechanic` Inspect tool has native support for the FenUI library. When you inspect a FenUI-based frame, a dedicated **FenUI Details** section appears with:
- **Layout Type**: Displays the underlying NineSlice layout (e.g., `Modern`, `Inset`).
- **Configuration**: Exposes internal settings like background tokens, padding, and cell structures.
- **Visual State**: Live feedback on border application and shadow types.

This integration is **automatic** for any frame created using `FenUI:CreateLayout()` or its derived widgets (`Panel`, `Dialog`, `Card`, etc.).

---

## Blizzard UI Source Reference

Study Blizzard's implementations in `wow-ui-source-live/Interface/AddOns/`:

| Component | Source Location |
|-----------|-----------------|
| Action Bars | `Blizzard_ActionBar/` |
| Unit Frames | `Blizzard_UnitFrame/` |
| Nameplates | `Blizzard_NamePlates/` |
| Cooldowns | `Blizzard_Cooldown/` |
| Settings UI | `Blizzard_Settings/` |

### Learning from Blizzard Code

```lua
-- Example: How Blizzard creates cooldown frames
-- See: Blizzard_Cooldown/Cooldown.lua

-- Their pattern for cooldown setup:
local function CooldownFrame_Set(self, start, duration, enable, forceShowDrawEdge, modRate)
    if enable and enable ~= 0 and start > 0 and duration > 0 then
        self:SetDrawEdge(forceShowDrawEdge)
        self:SetCooldown(start, duration, modRate)
    else
        self:Clear()
    end
end
```

---

## Layout and Sizing

### Data-driven layout

Treat layout as data, not hardcoded values:

```lua
local LAYOUT = {
    padding = 10,
    rowHeight = 24,
    gap = 4,
    width = 200,
}

function RebuildLayout()
    local y = -LAYOUT.padding
    for i, row in ipairs(rows) do
        row:SetPoint("TOPLEFT", LAYOUT.padding, y)
        row:SetHeight(LAYOUT.rowHeight)
        y = y - LAYOUT.rowHeight - LAYOUT.gap
    end
    frame:SetHeight(-y + LAYOUT.padding)
end
```

### Dynamic height

Recalculate height based on visible elements:

```lua
function UpdateFrameHeight()
    local visibleCount = 0
    for _, row in ipairs(rows) do
        if row:IsShown() then
            visibleCount = visibleCount + 1
        end
    end
    local height = (visibleCount * ROW_HEIGHT) + (2 * PADDING)
    frame:SetHeight(math.max(height, MIN_HEIGHT))
end
```

---

## Responsiveness

### Throttle OnUpdate

If updating on `OnUpdate`, throttle aggressively:

```lua
local elapsed = 0
local THROTTLE = 0.1  -- 10 updates per second max

frame:SetScript("OnUpdate", function(self, delta)
    elapsed = elapsed + delta
    if elapsed < THROTTLE then return end
    elapsed = 0
    
    -- Skip work when hidden
    if not self:IsVisible() then return end
    
    -- Actual update logic
    UpdateDisplay()
end)
```

### Prefer events

Events are always better than polling when available:

| Instead of Polling | Use Event |
|--------------------|-----------|
| Check cooldown every frame | `SPELL_UPDATE_COOLDOWN` |
| Check mount status | `PLAYER_MOUNT_DISPLAY_CHANGED` |
| Check zone | `ZONE_CHANGED_NEW_AREA` |
| Check combat | `PLAYER_REGEN_DISABLED/ENABLED` |

---

## Midnight-Safe UI Patterns

### Styling Blizzard Frames Safely (Midnight 12.0)

In Midnight, many Blizzard frames (Action Bars, Unit Frames, Cooldown Viewers) are strictly protected. Modifying their structure during combat causes **taint**, which prevents Blizzard's code from reading **secret values**.

**The Guard Pattern**:

```lua
-- pattern used in ActionHud to avoid ADDON_ACTION_BLOCKED
function MyModule:StyleBlizzardFrame(frame)
    if not frame or InCombatLockdown() then
        return
    end

    -- Operations that cause taint in combat:
    frame:Hide()
    frame:ClearAllPoints()
    frame:SetParent(newParent)
    
    -- styling operations are safe once guarded
    Utils.StripBlizzardDecorations(frame)
end
```

### StatusBar Passthrough

The passthrough pattern forwards potentially-secret values to Blizzard-compatible display widgets instead of inspecting/comparing them. This aligns with Blizzard's intent for Midnight:

```lua
local healthBar = CreateFrame("StatusBar", nil, parent)
healthBar:SetMinMaxValues(0, 1)

-- Passthrough pattern: forward values without inspection
local function UpdateHealth(unit)
    local maxHealth = UnitHealthMax(unit)  -- May be secret in combat
    local health = UnitHealth(unit)        -- May be secret in combat
    
    -- Forward to StatusBar without comparing/operating on the values
    healthBar:SetMinMaxValues(0, maxHealth)
    healthBar:SetValue(health)
end
```

> **Note**: The passthrough concept (forwarding secret values to display widgets) matches Blizzard's described intent. However, verify specific widget/method support for secret values against official documentation or beta testing for your target build.

### Cooldown Frame Passthrough

```lua
-- Passthrough pattern for cooldown display
local cooldown = CreateFrame("Cooldown", nil, parent, "CooldownFrameTemplate")

local function UpdateCooldown(spellID)
    local info = C_Spell.GetSpellCooldown(spellID)
    if info then
        -- Forward values to Cooldown widget without inspection
        cooldown:SetCooldown(info.startTime, info.duration, info.modRate)
    end
end
```

> **Note**: This follows the passthrough pattern—verify Cooldown widget support for secret values against official documentation or beta testing.

### Heal Prediction Passthrough
Midnight restricts reading incoming heals/absorbs. Blizzard has described `CreateUnitHealPredictionCalculator` and `UnitGetDetailedHealPrediction` as the intended way to compute heal/absorb outputs for passing into other APIs:

```lua
-- Calculator pattern for absorbs/heals (officially described by Blizzard)
local calculator = CreateUnitHealPredictionCalculator()

local function UpdateAbsorbs(unit)
    -- Updates the calculator object (black-box computation)
    UnitGetDetailedHealPrediction(unit, "player", calculator)
    
    -- Forward calculator result to display widget
    local incoming = calculator:GetIncomingHeals()
    myAbsorbBar:SetValue(incoming)
end
```

---

## Asset Management Workflow

To maintain high-quality UI assets while ensuring compatibility with WoW's TGA requirements, follow this workflow:

1. **Source Files**: Place your lossless `.png` files in an `assets_source/` folder within your addon directory.
2. **Automated Conversion**: Use the `addon-dev assets` tool to generate WoW-compatible `.tga` files in the `assets/` folder.
3. **Power of 2**: The tool will validate that your images have dimensions that are powers of 2 (e.g., 64x64, 128x128), which is required for WoW to render them correctly.

### Commands

```bash
addon-dev assets sync          # Perform a one-time sync of all assets
addon-dev assets watch         # Watch assets_source/ and sync in real-time
```

### Benefits
- **Lossless Source**: Keep your master files in PNG format.
- **Auto-Validation**: Detect dimension issues before they reach the game.
- **Alpha Support**: Automatically handles 32-bit TGA conversion to preserve transparency.

---

## Avoid UI Spam

### Don't recreate frames

```lua
-- BAD: Creates new frame every update
function Update()
    local button = CreateFrame("Button", nil, parent)
    button:SetText("Click")
end

-- GOOD: Reuse existing frame
function Update()
    if not self.button then
        self.button = CreateFrame("Button", nil, parent)
    end
    self.button:SetText("Click")
end
```

### Hide instead of destroy

```lua
-- BAD: Destroy unused widgets
for _, widget in ipairs(widgets) do
    widget:SetParent(nil)
    widget = nil
end

-- GOOD: Hide unused widgets
for _, widget in ipairs(widgets) do
    widget:Hide()
end
```

---

## Common Patterns

### Show/Hide with fade

```lua
function FadeIn(frame, duration)
    frame:SetAlpha(0)
    frame:Show()
    UIFrameFadeIn(frame, duration or 0.2, 0, 1)
end

function FadeOut(frame, duration)
    UIFrameFadeOut(frame, duration or 0.2, frame:GetAlpha(), 0)
end
```

### Draggable frames

```lua
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    -- Save position
    local _, _, _, x, y = self:GetPoint()
    DB.position = { x = x, y = y }
end)
```

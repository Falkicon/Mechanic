# Debugging

> Part of the [Addon Development Guide](./AGENTS.md)

Last updated: 2026-09-30

---

## Overview

Debugging is a first-class concern. Good diagnostics make the difference between a 5-minute fix and hours of frustration.

**Midnight Note**: Debug tools become even more important when dealing with secret values and combat restrictions. Add Midnight-specific diagnostic info to your debug output.

---

## In-Game Diagnostics

### Recommended slash commands

Every addon should have:

| Command | Purpose |
|---------|---------|
| `/addon status` | One-line "is it working?" summary |
| `/addon debug` | Full dump of settings, state, and recent errors |

### Status command example

```lua
SLASH_MYADDON1 = "/myaddon"
SlashCmdList["MYADDON"] = function(msg)
    if msg == "status" then
        local status = AddonDB.enabled and "ENABLED" or "DISABLED"
        local frameVisible = MyFrame:IsVisible() and "visible" or "hidden"
        print(string.format("[MyAddon] %s | Frame: %s", status, frameVisible))
    elseif msg == "debug" then
        DebugDump()
    end
end
```

### Debug dump example (Midnight-aware)

```lua
function DebugDump()
    local interfaceVersion = select(4, GetBuildInfo())
    local IS_MIDNIGHT = interfaceVersion >= 120000
    
    print("=== MyAddon Debug ===")
    print("Version:", C_AddOns.GetAddOnMetadata("MyAddon", "Version"))
    print("Interface:", interfaceVersion)
    print("Is Midnight:", IS_MIDNIGHT and "Yes" or "No")
    print("---")
    print("Enabled:", AddonDB.enabled)
    print("Position:", AddonDB.position.x, AddonDB.position.y)
    print("---")
    print("Frame visible:", MyFrame:IsVisible())
    print("In combat:", InCombatLockdown())
    
    -- Midnight-specific diagnostics
    if IS_MIDNIGHT then
        print("--- Midnight Status ---")
        local testInfo = C_Spell.GetSpellCharges(372608)  -- Surge Forward
        if testInfo then
            local isSecret = issecretvalue and issecretvalue(testInfo.currentCharges)
            print("Secret values active:", isSecret and "Yes" or "No")
        end
    end
    
    print("=====================")
end
```

## !Mechanic Hub

The **Mechanic** addon (installed with its `!Mechanic` bootstrap) is the in-game development hub. Use `/mech inspect` to access advanced frame auditing tools.

### Inspect Tab Features
- **Pick Mode**: Click any frame in the game to inspect it immediately.
- **FenUI Support**: Automatic detection and display of FenUI layout metadata (configuration, themes, and identifiers).
- **Reverse Highlight**: Hovering nodes in the frame tree highlights the corresponding frame in the game with a gold border.
- **Inspectability Support**: Foundational FenUI frames (`Layout`, `ScrollPanel`) use the **Ghost Frame Pattern** to ensure structural elements (backgrounds, cells) are pickable by the inspector without blocking clicks.
- **Visibility Toggle**: Click the eye icon (👁) in the tree to quickly `Show()` or `Hide()` any frame for visual debugging.
- **Pin to Console**: Click the pin icon (📌) to assign the selected frame to `_G.f`. This creates a live "shortcut" for use in chat commands.

### Power User Workflow: The Pin Pattern (📌)

The **Pin** feature is designed to bridge the gap between visual inspection and manual code testing. It saves you from typing long, complex frame paths in the chat console.

#### Step-by-Step Example:
1.  **Open Inspect**: Use `/mech inspect` or click the **Pick** button.
2.  **Select a Frame**: Click a frame in the game or find it in the tree (e.g., `CharacterMicroButton`).
3.  **Pin it**: Click the 📌 icon next to the frame name in the tree.
    - *Feedback*: !Mechanic will print: `!Mechanic: Pinned: _G.f = CharacterMicroButton`
4.  **Use it in Chat**: Open your chat box and type a command using `f` as the object:
    - `/run print(f:GetName())`
    - `/run f:SetAlpha(0.5)`
    - `/run dump(f:GetPoint())`

#### Why it matters:
Instead of typing:
`/run print(PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBar:GetWidth())`

You just type:
`/run print(f:GetWidth())`

The variable `f` is a **live handle** to the object. You can use it for any `/run` or `/script` command until you pin a different frame.

---

---

## BugGrabber / BugSack

These addons capture Lua errors with full context:

- **BugGrabber**: Captures errors silently.
- **BugSack**: UI to view captured errors.

### Using them

1. Install both addons.
2. Errors are captured automatically.
3. Click the minimap icon or `/bugsack` to view.

### Your addon should still work without them

```lua
-- Don't require BugGrabber
local function SafeCall(func, ...)
    local ok, err = pcall(func, ...)
    if not ok then
        -- Fall back to print if no error handler
        print("[MyAddon] Error:", err)
    end
    return ok
end
```

---

## !Mechanic (Development Hub)

The Mechanic addon serves as a centralized in-game console and monitoring hub for all addons that register through MechanicLib.

### Key Features
- **Console**: Unified log stream from all registered addons with source filtering.
- **Error Monitor**: Captures and formats Lua errors with local variable dumps and addon detection.
- **Tests**: In-game unit test runner for Busted-style tests.
- **Tools**: Extensible diagnostic hub for addon-specific diagnostic panels.
- **API Test Bench**: Centralized WoW API explorer with parameter presets and Midnight secret value detection.
- **Inspect**: Unified frame inspector with contextual tree view, detailed property/script monitor, and live watch list with pick mode.
- **Performance**: Real-time CPU and Memory monitoring with sub-metrics support.
- **Self-Monitoring**: !Mechanic uses "dogfooding" to monitor its own performance and internal health.

### Dogfooding (Self-Monitoring)
Toggle **"Register Mechanic"** in the main frame footer to enable !Mechanic to monitor itself. This populates its own entries in:
- **Performance**: Sub-metrics for Console buffer and Health log size.
- **Tools**: Self-diagnostic buttons (Health Log export, Reset UI).
- **Tests**: Integrity checks for the internal database and UI modules.

### Registration (MechanicLib)
Addons should integrate using `MechanicLib` to expose their debug state:
- **Console**: Register with `console = true` to enable source-specific log streams.
- **Performance**: Provide `getSubMetrics` to break down CPU/Memory usage by feature.
- **Tools**: Register a `createPanel` function to add custom diagnostic UIs.
- **Tests**: Provide an `getAll` and `run` implementation for in-game unit testing.

```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)
if MechanicLib then
    MechanicLib:Register("MyAddon", {
        version = "1.0.0",
        performance = { getSubMetrics = function() return MyAddon:GetPerf() end },
        tools = { createPanel = function(parent) MyAddon:CreateToolUI(parent) end },
        tests = {
            getAll = function() return MyAddon.Tests end,
            run = function(id) return MyAddon:RunTest(id) end,
        },
    })
end
```

---

## Logging Philosophy

### Print user-facing messages sparingly

```lua
-- BAD: Spammy
function OnUpdate()
    print("Updating frame...")  -- Every frame!
end

-- GOOD: Only on significant events
function OnEnable()
    print("[MyAddon] Enabled")  -- Once
end
```

### Structured debug output

For deep debugging, print structured lines for easy log parsing:

```lua
local function DebugLog(category, message, ...)
    if not DEBUG_ENABLED then return end
    local formatted = string.format(message, ...)
    print(string.format("[MyAddon:%s] %s", category, formatted))
end

-- Usage
DebugLog("SPELL", "Cooldown started: %d (%.1fs)", spellID, duration)
DebugLog("UI", "Frame repositioned to %d, %d", x, y)
DebugLog("MIDNIGHT", "Secret value detected, using passthrough")
```

---

## Script Errors

Enable Lua error display:

```
/console scriptErrors 1
```

Or in Interface Options → Display → Show Lua Errors.

---

## Common Debug Techniques

### Reading Mechanic Hub Data

Mechanic Desktop does not diff or inspect arbitrary addon SavedVariables. It reads the Mechanic hub data (`!Mechanic.lua`) and BugGrabber's log.

- **Action**: Run `mech call sv.parse` (or `mech addon.output`) after a `/reload`, passing a `target` from `diagnostic.targets` when several clients, accounts or profiles exist.
- **For your own SavedVariables**: open the file under `WTF/Account/<ACCOUNT>/SavedVariables/` directly, or use `/dump MyAddonDB` in game. To track how your database changes, copy the file before and after a session and diff it with your editor or `git diff --no-index`.

### Monitoring Dashboard

For a holistic view of the data, run the desktop dashboard.

- **Action**: Run `mech dashboard`.
- **Features**:
  - **Live Feedback**: Enable **Auto-Refresh** to keep the data current while you work.
  - **Command forms**: Run any registered command from schema-generated forms.
  - **Target selection**: Pick the client, account, character and profile to read.

The dashboard shows data from the last `/reload` or logout; it is not a live stream from the game.

### Atlas Icon Discovery

When you need to find the correct atlas name for a UI element:

- **Action**: Run `mech call atlas.search '{"query": "<keyword>"}'` (run `atlas.scan` once with a local `wow-ui-source` checkout first).
- **Benefit**: Instantly finds Blizzard atlas names indexed from the beta source (e.g., `gear`, `eye`, `heart`).

### Inspect frame state

```lua
/run local f = MyAddonFrame; print("Shown:", f:IsShown(), "Alpha:", f:GetAlpha(), "Points:", f:GetNumPoints())
```

### Check event registration

```lua
/run print(MyAddonFrame:IsEventRegistered("PLAYER_ENTERING_WORLD"))
```

### Dump SavedVariables

```lua
/dump MyAddonDB
```

### Check if addon loaded

```lua
/run print(C_AddOns.IsAddOnLoaded("MyAddon"))
```

### Test secret value detection (Midnight)

```lua
/run local info = C_Spell.GetSpellCharges(372608); if info then print("Secret:", issecretvalue and issecretvalue(info.currentCharges) or "N/A") end
```

---

## Global Debug Variables

Expose key state for easy inspection:

```lua
-- At end of Core.lua
_G.MyAddonDebug = {
    frame = MyFrame,
    db = AddonDB,
    cache = spellCache,
    IS_MIDNIGHT = IS_MIDNIGHT,
}
```

Then inspect in-game:

```lua
/dump MyAddonDebug.cache
/run print(MyAddonDebug.IS_MIDNIGHT)
```

---

## Blizzard Debug Tools

Use built-in debug tools:

```lua
-- Frame stack (shows frames under cursor)
/fstack

-- Event trace (shows all events)
/etrace

-- Dump table contents
/dump SomeTable

-- Run Lua code
/run print(GetTime())
```

---

## Error Handling Pattern

```lua
local function SafeUpdate()
    local ok, err = pcall(function()
        -- Risky operations
        UpdateCooldowns()
        RefreshDisplay()
    end)
    
    if not ok then
        -- Log error but don't crash
        if DEBUG_ENABLED then
            print("[MyAddon] Update error:", err)
        end
        -- Optionally disable problematic feature
        self:DisableFeature("cooldowns")
    end
end
```

---

## Midnight Debugging Tips

### 1. Test in different contexts

Secret values only appear in specific contexts:

| Context | Secret Values? |
|---------|---------------|
| Open world | No |
| Raid (in combat) | Yes |
| M+ (in combat) | Yes |
| PvP | Yes |
| Delves | Maybe |

### 2. Combat vs Out of Combat

```lua
-- Add to your debug dump
local function CheckMidnightState()
    if not IS_MIDNIGHT then return end
    
    local testSpell = 372608  -- Surge Forward
    
    print("--- Midnight API Test ---")
    print("In combat:", InCombatLockdown())
    
    local info = C_Spell.GetSpellCharges(testSpell)
    if info then
        print("GetSpellCharges returned:", info and "table" or "nil")
        if issecretvalue then
            print("currentCharges secret:", issecretvalue(info.currentCharges))
            print("maxCharges secret:", issecretvalue(info.maxCharges))
        end
    end
end
```

### 3. Test passthrough behavior

```lua
-- Test if StatusBar accepts the value
local function TestPassthrough()
    local info = C_Spell.GetSpellCharges(372608)
    if not info then return end
    
    local testBar = CreateFrame("StatusBar")
    local ok, err = pcall(function()
        testBar:SetMinMaxValues(0, info.maxCharges)
        testBar:SetValue(info.currentCharges)
    end)
    
    print("Passthrough test:", ok and "Success" or ("Failed: " .. err))
end
```

---

## Blizzard UI Source for Debug Examples

Study Blizzard's debug patterns:

```
wow-ui-source-live/Interface/AddOns/Blizzard_DebugTools/
├── Blizzard_DebugTools.lua    # /dump, /fstack, etc.
├── TableInspectorMixin.lua    # Table inspection UI
└── FrameStackTooltip.lua      # /fstack implementation
```

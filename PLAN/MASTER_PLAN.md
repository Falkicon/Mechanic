# !Mechanic - Master Plan

Centralized in-game development hub for World of Warcraft addon developers.

---

## Table of Contents

1. [Project Overview](#1-project-overview)
2. [Architecture](#2-architecture)
3. [MechanicLib API Specification](#3-mechaniclib-api-specification)
4. [UI Layout Specification](#4-ui-layout-specification)
5. [Copy System Specification](#5-copy-system-specification)
6. [File Structure](#6-file-structure)
7. [Settings Schema](#7-settings-schema)
8. [Slash Commands](#8-slash-commands)
9. [FenUI Widget Requirements](#9-fenui-widget-requirements)
10. [Standard Categories](#10-standard-categories)
11. [Load Order and Dependencies](#11-load-order-and-dependencies)
12. [Distribution](#12-distribution)
13. [Phase Overview](#13-phase-overview)

---

## 1. Project Overview

### Purpose

!Mechanic is a centralized in-game development console that complements the out-of-game ADDON_DEV tooling. It provides:

- **Console**: Aggregated debug output from all registered addons
- **Errors**: BugGrabber integration with pause/resume (solves BugSack's main UX problem)
- **Tests**: Unified view of test results across all addons
- **Performance**: Memory/CPU metrics with extended diagnostics

### Key Principles

1. **Universal Copyability**: Every piece of data can be copied with optional environment context
2. **Developer Mode Detection**: Replaces DevMarker.lua pattern across all addons
3. **Minimal Integration**: MechanicLib is ~150 lines, easy to embed
4. **Graceful Degradation**: Addons work regardless of whether !Mechanic is installed

### Target Users

Addon developers who want to:
- Consolidate debugging across multiple addons
- Get errors out of the game efficiently (pause, copy, paste to AI)
- Run and view test results without switching addons
- Monitor performance impact

---

## 2. Architecture

### System Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                    !Mechanic (loads early via ! prefix)         │
├─────────────────────────────────────────────────────────────────┤
│  Core.lua          │  UI/MainFrame.lua  │  Settings.lua         │
│  - Registration    │  - FenUI Panel     │  - AceConfig          │
│  - Slash commands  │  - Tab management  │  - Copy options       │
│  - Copy API        │                    │  - Addon settings     │
├─────────────────────────────────────────────────────────────────┤
│  UI/Console.lua    │  UI/Errors.lua     │  UI/Tests.lua         │
│  - Log aggregation │  - BugGrabber hook │  - Test tree view     │
│  - Filters/search  │  - Pause/resume    │  - Run controls       │
│  - Dedup options   │  - Navigation      │  - Results display    │
├─────────────────────────────────────────────────────────────────┤
│  UI/Performance.lua                                             │
│  - Memory/CPU per addon                                         │
│  - FPS, latency, GC metrics                                     │
│  - Optional event frequency tracking                            │
├─────────────────────────────────────────────────────────────────┤
│  Libs/MechanicLib/MechanicLib.lua (SOURCE - synced to addons)   │
│  - IsEnabled() - Developer mode detection                       │
│  - Register() / Unregister()                                    │
│  - Log() - Send to Mechanic console                             │
│  - Categories - Standard log categories                         │
└─────────────────────────────────────────────────────────────────┘
           │                    │                    │
           ▼                    ▼                    ▼
    ┌────────────┐      ┌────────────┐      ┌────────────┐
    │ WimpyAuras │      │ ActionHud  │      │ !BugGrabber│
    │ (embedded  │      │ (embedded  │      │ (callbacks)│
    │ MechanicLib│      │ MechanicLib│      │            │
    └────────────┘      └────────────┘      └────────────┘
```

### Load Order

| Order | Addon | Why |
|-------|-------|-----|
| 1 | `!BugGrabber` | Error capture ready first |
| 2 | `!Mechanic` | Ready to receive registrations |
| 3+ | Other addons | Can register immediately via MechanicLib |

The `!` prefix ensures alphabetical load order places Mechanic early.

### Data Flow

1. **Registration**: Addons call `MechanicLib:Register()` during their initialization
2. **Logging**: Addons call `MechanicLib:Log()` - if Mechanic is loaded, it receives the message
3. **Pull Model**: Mechanic queries addon buffers via capabilities when user opens tabs
4. **Errors**: BugGrabber fires callbacks, Mechanic listens and displays

---

## 3. MechanicLib API Specification

### Location

- **Source**: `!Mechanic/Libs/MechanicLib/MechanicLib.lua`
- **Deployed to**: Consuming addons via `lib_sync.ps1`
- **LibStub Version**: `MechanicLib-1.0`

### Core APIs

```lua
local MechanicLib = LibStub("MechanicLib-1.0", true) -- silent fail if missing

-- Developer mode detection (REPLACES DevMarker.lua)
if MechanicLib and MechanicLib:IsEnabled() then
    -- Show debug settings, register with Mechanic
end

-- Registration
MechanicLib:Register(addonName, capabilities)
MechanicLib:Unregister(addonName)

-- Logging
MechanicLib:Log(addonName, message, category)

-- Utility
MechanicLib:GetRegistered() -- Returns all registered addons
```

### Capabilities Interface

```lua
MechanicLib:Register("MyAddon", {
    -- Required
    version = "1.0.0",
    
    -- Logging (required for Console integration)
    getDebugBuffer = function() return MyAddon.debugBuffer end,
    clearDebugBuffer = function() wipe(MyAddon.debugBuffer) end,
    
    -- Testing (optional - for Tests tab)
    tests = {
        getAll = function() return TestRunner.testList end,
        getCategories = function() return TestRunner:GetCategories() end,
        run = function(id) return TestRunner:RunTest(id) end,
        runAll = function() return TestRunner:RunAll() end,
        getResult = function(id) return TestRunner:GetResult(id) end,
    },
    
    -- Settings (optional - exposed in Mechanic's settings)
    settings = {
        debugMode = {
            type = "toggle",
            name = "Debug Mode",
            get = function() return MyAddon.debugMode end,
            set = function(v) MyAddon.debugMode = v end,
        },
        -- AceConfig-style options table
    },

    -- Custom diagnostic tools (optional - for Tools tab)
    tools = {
        -- Called when addon selected in Tools tab left nav
        createPanel = function(container)
            -- Build custom diagnostic UI inside container (Frame)
        end,
        -- Optional cleanup
        destroyPanel = function(container)
            -- Clean up if needed
        end,
    },

    -- Performance sub-metrics (optional - for Performance tab)
    performance = {
        -- Returns array of { name, msPerSec, description? }
        getSubMetrics = function()
            return {
                { name = "UI Update", msPerSec = 0.45, description = "Frame updates" },
            }
        end,
    },
})
```

### Test Interface Contract

For addons providing tests, the following contract must be met:

```lua
-- getAll() returns:
{
    { id = "test-id", def = {
        id = "test-id",
        name = "Test Name",
        category = "CategoryName",
        type = "auto" or "manual",
        description = "Optional description",
    }},
    -- ...
}

-- run(id) returns:
passed, message  -- boolean/nil, string

-- getResult(id) returns:
{
    passed = true/false/nil,  -- nil = pending
    message = "Result message",
    duration = 0.003,  -- seconds
    logs = { "log line 1", "log line 2" },  -- captured during test
}
```

---

## 4. UI Layout Specification

### Main Window

```
┌─────────────────────────────────────────────────────────────┐
│ !Mechanic                                        [_][□][X]  │
├─────────────────────────────────────────────────────────────┤
│ [Console] [Errors] [Tests] [Performance]                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  (Tab Content Area - varies by tab)                         │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│ WoW 12.0.0 | Interface 120001 | Retail | 3 addons [Reload]  │
└─────────────────────────────────────────────────────────────┘
```

- **Size**: 800x600 default, resizable, position saved
- **Framework**: FenUI Panel with Tabs widget
- **Status Bar**: Environment info with Reload button (calls `ReloadUI()`)

### Console Tab

```
┌─────────────────────────────────────────────────────────────┐
│ Source: [All ▼]  Category: [All ▼]  🔍 [Search...        ]  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│ [WimpyAuras] [Trigger] Aura "Player Health" activated       │
│ [WimpyAuras] [Region] Icon frame shown                      │
│ [ActionHud] [Cooldown] Spell 12345 on cooldown              │
│ [ActionHud] [Cooldown] Spell 12345 on cooldown              │
│ [ActionHud] [Cooldown] Spell 12345 on cooldown              │
│ [System] /mech gc executed: 1.2MB freed                     │
│                                                             │
│ (MultiLineEditBox - selectable, directly copyable)          │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│ [Clear] [Dedup All] [Dedup Adjacent] [Pause]        │ 247   │
└─────────────────────────────────────────────────────────────┘
```

**Features**:
- **Source Filter**: Dropdown with "All" + each registered addon + "System"
- **Category Filter**: Dropdown with "All" + each category constant
- **Search**: Live text filter
- **Direct Copy**: Click in the display to focus, then use Ctrl+A / Ctrl+C
- **Dedup All**: Collapse identical lines to `message (x3)`
- **Dedup Adjacent**: Only collapse consecutive duplicates (preserves timeline)
- **Pause**: Stop accepting new entries (buffer continues accumulating in addons)
- **Line Count**: Shows filtered count

### Errors Tab

```
┌─────────────────────────────────────────────────────────────┐
│ Session: [Current ▼]  [◀ Prev] [3/12] [Next ▶]  [⏸ Pause]  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│ 3x ActionHud\Core.lua:142: attempt to index nil             │
│                                                             │
│ Stack:                                                      │
│   ActionHud\Core.lua:142: in function 'UpdateSlot'          │
│   ActionHud\Core.lua:89: in function <OnEvent>              │
│                                                             │
│ Locals:                                                     │
│   slot = 5                                                  │
│   button = nil                                              │
│                                                             │
│ (Colorized, directly selectable and copyable)               │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│ [→ Send to Console] [Wipe Session]                          │
└─────────────────────────────────────────────────────────────┘
```

**Features**:
- **Session Dropdown**: Current / Previous / All
- **Navigation**: Prev/Next buttons with count display
- **Pause Button**: KEY FEATURE - stops the flood so user can copy
- **Direct Copy**: Click in the display to focus, then use Ctrl+A / Ctrl+C
- **Colorized**: Stack traces colored like BugSack
- **Send to Console**: Copies formatted error to Console tab

### Tests Tab

```
┌─────────────────────────────────────────────────────────────┐
│ [Run Selected] [Run All Auto]         [Export] [Clear]      │
├─────────────────────┬───────────────────────────────────────┤
│ ▼ WimpyAuras        │ Secret Value Handling                 │
│   ▼ Triggers        │ Type: Auto | Category: Triggers       │
│     [✓] Aura Match  │ Status: PASSED                        │
│     [✓] Power Check │ Duration: 0.003s                      │
│   ▼ Regions         │                                       │
│     [✗] Icon Render │ Message:                              │
│     [~] Bar Update  │ All 3 assertions passed               │
│ ▼ ActionHud         │                                       │
│   ▼ Utils           │ Captured Logs:                        │
│     [✓] SafeCompare │ [Validation] Secret detected...       │
│     [✓] Throttle    │ [Validation] Using passthrough...     │
│                     │                                       │
├─────────────────────┴───────────────────────────────────────┤
│ Total: 12 | Passed: 10 | Failed: 1 | Pending: 1             │
└─────────────────────────────────────────────────────────────┘
```

**Features**:
- **Left Panel**: Tree view grouped by Addon → Category → Test
- **Right Panel**: Selected test details
- **Status Icons**: ✓ passed, ✗ failed, ~ pending, - not run
- **Run Controls**: Selected, All Auto
- **Export Toggle**: Replaces tree view with a copyable text report (Ctrl+A / Ctrl+C)
- **Summary Bar**: Aggregated counts

### Performance Tab

```
┌─────────────────────────────────────────────────────────────┐
│ [▶ Auto-Refresh] [Reset Stats] [CPU Profiling: OFF] [Export]│
├─────────────────────────────────────────────────────────────┤
│ FPS: 144 | Latency: 42ms / 68ms | Lua Memory: 45.2 MB       │
├─────────────────────────────────────────────────────────────┤
│ Addon              │ Memory   │ %     │ CPU ms/s │ %        │
│────────────────────│──────────│───────│──────────│──────────│
│ WeakAuras          │ 8,920 KB │ 45.1% │ 2.34     │ 27.1%    │
│ WimpyAuras         │ 2,450 KB │ 12.3% │ 0.45     │ 5.2%     │
│ ActionHud          │ 1,230 KB │ 6.2%  │ 0.23     │ 2.7%     │
│ !Mechanic          │ 890 KB   │ 4.5%  │ 0.12     │ 1.4%     │
├─────────────────────────────────────────────────────────────┤
│ Tracking: 5m 32s | Total Memory: 19,780 KB                  │
└─────────────────────────────────────────────────────────────┘
```

**Features**:
- **Auto-Refresh Toggle**: 1-second interval when enabled
- **Reset Stats**: Clears CPU tracking, restarts duration
- **CPU Profiling Toggle**: Enables `scriptProfile` CVar (requires reload)
- **Extended Metrics**: FPS, Home/World latency, total Lua memory
- **Sortable Columns**: Click headers to sort
- **Export Toggle**: Replaces table view with a copyable text report (Ctrl+A / Ctrl+C)

**APIs Used**:
- `GetFramerate()` - FPS
- `GetNetStats()` - latencyHome, latencyWorld
- `collectgarbage("count")` - Total Lua memory
- `GetAddOnMemoryUsage(index)` - Per-addon memory
- `GetAddOnCPUUsage(index)` - Per-addon CPU (requires scriptProfile)

---

## 5. Copy System Specification

### Principle: Direct Copy

Text displays (Console, Errors) use editable `MultiLineEditBox` widgets that support direct selection and copying. Users click in the display to focus, then use **Ctrl+A** (select all) and **Ctrl+C** to copy.

For complex views (Tests tree, Performance table), an **Export** toggle button switches between the interactive UI and a copyable text view.

### UX Rationale

The "Direct Copy" model eliminates the intermediate dialog pattern:
- **One less click** to copy data
- **Better focus handling** - no need to switch windows
- **Consistent with modern terminals and IDEs**

### Environment Header

When `includeEnvHeader` setting is enabled, copies prepend:

```
=== Mechanic Export ===
WoW: 12.0.0 (58234) | Client: Beta | Interface: 120001
Character: Fenris-Stormrage (Druid, Balance)
Exported: 2025-12-23 14:32:15
Registered: WimpyAuras 1.0.0, ActionHud 2.1.0
---
```

### Copy Formats

**Console Export**:
```
=== Mechanic Console Export ===
WoW: 12.0.0 | Client: Beta | Interface: 120001
Lines: 247 | Filters: Source=All, Category=[Trigger]
---
[WimpyAuras] [Trigger] Aura "Player Health" activated
[WimpyAuras] [Region] Icon frame shown
[ActionHud] [Cooldown] Spell 12345 on cooldown
```

**Error Export**:
```
=== Mechanic Error Export ===
WoW: 12.0.0 | Client: PTR | Interface: 120001
Session: 15 | Error: 3/12
---
3x ActionHud\Core.lua:142: attempt to index nil

Stack:
  ActionHud\Core.lua:142: in function 'UpdateSlot'
  ActionHud\Core.lua:89: in function <OnEvent>

Locals:
  slot = 5
  button = nil
```

**Test Export**:
```
=== Mechanic Test Export ===
WoW: 12.0.0 | Client: Retail | Interface: 120001
Run: 2025-12-23 14:35:00 | Result: 10/12 passed
---
WimpyAuras > Triggers
  [PASS] Aura Match (0.003s)
  [PASS] Power Check (0.002s)
WimpyAuras > Regions
  [FAIL] Icon Render - Expected frame to be visible
  [PENDING] Bar Update - Requires manual validation
ActionHud > Utils
  [PASS] SafeCompare (0.001s)
```

**Performance Export**:
```
=== Mechanic Performance Export ===
WoW: 12.0.0 | Client: Retail | Interface: 120001
FPS: 144 | Latency: 42ms / 68ms | Duration: 5m 32s
Total Memory: 19,780 KB | CPU Profiling: ON
---
Addon              | Memory   | %     | CPU ms/s | %
-------------------|----------|-------|----------|-------
WeakAuras          | 8,920 KB | 45.1% | 2.34     | 27.1%
WimpyAuras         | 2,450 KB | 12.3% | 0.45     | 5.2%
ActionHud          | 1,230 KB | 6.2%  | 0.23     | 2.7%
!Mechanic          | 890 KB   | 4.5%  | 0.12     | 1.4%
```

### Implementation Pattern

**Simple tabs** (Console, Errors) use `MultiLineEditBox` with `readOnly = true`:
- Users click to focus, then Ctrl+A / Ctrl+C
- Widget blocks character input but allows selection and copy

**Complex tabs** (Tests, Performance) implement Export Mode toggle:

```lua
function Module:ToggleExportMode()
    self.exportMode = not self.exportMode
    if self.exportMode then
        -- Hide interactive UI, show export text box
        self.treeContainer:Hide()
        self.exportBox:SetText(self:GetCopyText(true))
        self.exportBox:Show()
    else
        -- Hide export box, restore interactive UI
        self.exportBox:Hide()
        self.treeContainer:Show()
    end
end
```

Each module still implements `GetCopyText(includeHeader)` for generating the export content.

---

## 6. File Structure

```
!Mechanic/
├── !Mechanic.toc              # Addon manifest
├── Core.lua                   # Main addon, registration, slash commands
├── Settings.lua               # AceConfig settings panel
├── AGENTS.md                  # Agent documentation (points here)
├── README.md                  # User documentation
├── LICENSE                    # GPL-3.0
│
├── PLAN/                      # Specification documents
│   ├── MASTER_PLAN.md         # This file
│   ├── 01-foundation.plan.md       # Phase 1 spec
│   ├── 02-error-tests.plan.md      # Phase 2 spec
│   ├── 03-performance.plan.md      # Phase 3 spec
│   └── 04-migration.plan.md        # Phase 4 spec
│
├── UI/                        # UI modules
│   ├── MainFrame.lua          # FenUI Panel + tabs
│   ├── Console.lua            # Console tab module
│   ├── Errors.lua             # Errors tab module
│   ├── Tests.lua              # Tests tab module
│   └── Performance.lua        # Performance tab module
│
├── Libs/                      # Embedded libraries
│   ├── MechanicLib/
│   │   └── MechanicLib.lua    # SOURCE - synced to other addons
│   ├── FenUI/                 # UI framework
│   ├── CallbackHandler-1.0/
│   ├── LibStub/
│   └── Ace3 libs...
│
├── Locales/
│   └── enUS.lua               # English strings
│
└── embeds.xml                 # Library loading
```

---

## 7. Settings Schema

```lua
MechanicDB = {
    -- Window state
    position = { point = "CENTER", x = 0, y = 0 },
    size = { width = 800, height = 600 },
    activeTab = "console",
    
    -- Console settings
    bufferSize = 1000,           -- Max lines, default 1000, max 3000
    showTimestamps = false,      -- Prefix each line with time
    
    -- Copy behavior
    includeEnvHeader = true,     -- Add environment to all copies
    includeCharacterInfo = true, -- Include character name/class
    includeTimestamp = true,     -- Include export timestamp
    
    -- Errors settings
    errorsPaused = false,        -- Pause state persists
    
    -- Performance settings
    autoRefresh = true,          -- Auto-refresh when tab visible
    refreshInterval = 1.0,       -- Seconds between refreshes
    trackEventFrequency = false, -- Opt-in event tracking
    
    -- Per-addon settings (populated by registrations)
    addonSettings = {
        -- ["AddonName"] = { ... }
    },
}
```

---

## 8. Slash Commands

| Command | Action |
|---------|--------|
| `/mech` or `/mechanic` | Toggle main panel |
| `/mech console` | Open to Console tab |
| `/mech errors` | Open to Errors tab |
| `/mech tests` | Open to Tests tab |
| `/mech perf` | Open to Performance tab |
| `/mech reload` | ReloadUI() shortcut |
| `/mech gc` | Force garbage collection, log result |
| `/mech pause` | Toggle pause on current tab |
| `/mech copy` | Open copy dialog with current tab content |
| `/mech clear` | Clear current tab content |

---

## 9. FenUI Widget Requirements

### Existing Widgets (Use As-Is)

- **Panel**: Main window container
- **Tabs**: Tab switching
- **Grid**: Test list, addon list
- **Toolbar**: Button rows
- **Buttons**: Various actions

### New Widgets Required

#### MultiLineEditBox

Wrapper around native EditBox for copyable text areas.

```lua
local editBox = FenUI:CreateMultiLineEditBox(parent, {
    label = "Output",
    numLines = 20,
    readOnly = true,  -- Selectable but not editable
})

editBox:SetText("content")
editBox:GetText()
editBox:SelectAll()
editBox:HighlightText()
```

#### StatusRow

Key-value pair display for environment info.

```lua
local row = FenUI:CreateStatusRow(parent, {
    { label = "WoW", value = "12.0.0" },
    { label = "Interface", value = "120001" },
    { label = "Client", value = "Retail" },
})

row:SetValue("WoW", "12.0.1")  -- Update single value
```

### AceGUI Fallbacks

For widgets not yet available in FenUI, use AceGUI equivalents:

| Widget | FenUI | AceGUI Fallback |
|--------|-------|-----------------|
| **TreeView** | Not available | `AceGUI:Create("TreeGroup")` |
| **Dropdown** | Not available | `AceGUI:Create("Dropdown")` |
| **SearchBox** | Use EditBox | `AceGUI:Create("EditBox")` |

**Note**: The Tests module tree view (Phase 2) should use `AceGUI TreeGroup` until FenUI provides an equivalent. This is acceptable since AceGUI is already embedded.

---

## 10. Standard Categories

Addons should use these standard categories for consistent filtering:

```lua
MechanicLib.Categories = {
    TRIGGER    = "[Trigger]",    -- Trigger evaluation, activation
    REGION     = "[Region]",     -- Frame/visual updates
    API        = "[API]",        -- API calls, returns
    COOLDOWN   = "[Cooldown]",   -- Cooldown tracking
    EVENT      = "[Event]",      -- WoW event handling
    VALIDATION = "[Validation]", -- Test validation data
    SECRET     = "[Secret]",     -- Secret value handling
    PERF       = "[Perf]",       -- Performance notes
    LOAD       = "[Load]",       -- Load condition changes
    CORE       = "[Core]",       -- Core addon lifecycle
}
```

Usage:
```lua
MechanicLib:Log("MyAddon", "Trigger fired", MechanicLib.Categories.TRIGGER)
-- Results in: [MyAddon] [Trigger] Trigger fired
```

---

## 11. Load Order and Dependencies

### TOC Dependencies

```toc
## OptionalDeps: !BugGrabber
```

- **!BugGrabber**: Optional. If present, Errors tab works. If not, shows install message.
- **FenUI**: Embedded, not a dependency.

### Load Sequence

1. LibStub loads (via embeds.xml)
2. Ace3 libs load
3. FenUI loads
4. MechanicLib loads (creates library)
5. Core.lua loads (creates Mechanic addon, sets `_G.Mechanic`)
6. UI modules load
7. Settings.lua loads

Other addons loading after can immediately call:
```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)
if MechanicLib and MechanicLib:IsEnabled() then
    MechanicLib:Register("MyAddon", capabilities)
end
```

---

## 12. Distribution

### CurseForge

!Mechanic will be published on CurseForge as a development utility addon, similar to BugSack/BugGrabber.

- **Category**: Development Tools
- **Description**: Clearly labeled as a developer tool
- **Target Audience**: Addon developers

### MechanicLib Distribution

MechanicLib is embedded in consuming addons:
- Source of truth: `!Mechanic/Libs/MechanicLib/`
- Synced via: `lib_sync.ps1`
- End result: Addons include MechanicLib, work regardless of !Mechanic installation

---

## 13. Phase Overview

| Phase | Name | Deliverables | Status |
|-------|------|--------------|--------|
| 1 | Foundation | MechanicLib, Console module, Copy system, FenUI widgets | **COMPLETE** |
| 2 | Error & Test Integration | BugGrabber integration, Errors module, Tests module | **COMPLETE** |
| 3 | Performance & Polish | Performance module, Settings panel, Minimap button | **COMPLETE** |
| 4 | Migration | Update ActionHud, WimpyAuras to use MechanicLib | **COMPLETE** |
| 5 | Polish | Category colors, rich test results | **COMPLETE** |
| 6 | Extensibility | Tools tab, Performance sub-metrics, Split nav | **COMPLETE** |
| 7 | API Test Bench | API discovery, testing, Midnight readiness | **COMPLETE** |

See individual phase specs for detailed requirements:
- [01-foundation.plan.md](01-foundation.plan.md)
- [02-error-tests.plan.md](02-error-tests.plan.md)
- [03-performance.plan.md](03-performance.plan.md)
- [04-migration.plan.md](04-migration.plan.md)


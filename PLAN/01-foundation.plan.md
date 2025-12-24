# Phase 1: Foundation

Establishes the core addon structure, MechanicLib, Console module, and copy system.

---

## Prerequisites

- `!Mechanic` addon folder created (done)
- FenUI library available in `ADDON_DEV/Libs/FenUI/`
- `lib_sync.ps1` accessible for MechanicLib deployment

## Reference

- [MASTER_PLAN.md](MASTER_PLAN.md) - Full specification
- Sections 3, 4, 5, 6, 7, 8 are essential for this phase

---

## Scope

### In Scope
- MechanicLib implementation (full API)
- Main FenUI Panel with tab structure
- Console module (filters, dedup, pause, copy)
- Copy system with environment header
- FenUI MultiLineEditBox widget
- FenUI StatusRow widget
- Slash commands (basic set)
- lib_sync.ps1 configuration

### Out of Scope
- Errors module (Phase 2)
- Tests module (Phase 2)
- Performance module (Phase 3)
- Settings panel (Phase 3)
- ActionHud/WimpyAuras migration (Phase 4)

---

## Detailed Requirements

### 1. MechanicLib Implementation

**File**: `Libs/MechanicLib/MechanicLib.lua`

Complete the stub implementation with:

```lua
-- Full API per MASTER_PLAN Section 3
MechanicLib:IsEnabled()        -- Returns true if _G.Mechanic exists
MechanicLib:Register(name, capabilities)
MechanicLib:Unregister(name)
MechanicLib:Log(name, message, category)
MechanicLib:GetRegistered()
MechanicLib.Categories         -- Standard category constants
```

**Acceptance Criteria**:
- [x] All API methods functional
- [x] Categories table matches MASTER_PLAN Section 10
- [x] Registration stores capabilities correctly
- [x] Log forwards to Mechanic when available
- [x] Silent no-op when Mechanic not loaded

### 2. Core.lua Implementation

**File**: `Core.lua`

Implement the main addon:

```lua
local Mechanic = LibStub("AceAddon-3.0"):NewAddon(...)
_G.Mechanic = Mechanic  -- For MechanicLib:IsEnabled()

-- Database initialization
function Mechanic:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("MechanicDB", defaults)
    self:RegisterSlashCommands()
end

-- UI creation
function Mechanic:OnEnable()
    self:CreateMainFrame()
end

-- Registration handlers (called by MechanicLib)
function Mechanic:OnAddonRegistered(name, capabilities)
function Mechanic:OnAddonUnregistered(name)
function Mechanic:OnLog(addonName, message, category)

-- Copy API
function Mechanic:GetEnvironmentHeader()
function Mechanic:GetClientType()  -- "Retail" / "PTR" / "Beta"
```

**Database Defaults** (per MASTER_PLAN Section 7):
```lua
local defaults = {
    profile = {
        position = { point = "CENTER", x = 0, y = 0 },
        size = { width = 800, height = 600 },
        activeTab = "console",
        bufferSize = 1000,
        showTimestamps = false,
        includeEnvHeader = true,
        includeCharacterInfo = true,
        includeTimestamp = true,
    }
}
```

**Acceptance Criteria**:
- [x] Addon loads without errors
- [x] Global `Mechanic` available for MechanicLib check
- [x] Database persists across sessions
- [x] Slash commands functional

### 3. FenUI Widgets

#### MultiLineEditBox

**File**: `ADDON_DEV/Libs/FenUI/Widgets/MultiLineEditBox.lua`

Add to FenUI (will be synced to !Mechanic via lib_sync):

```lua
local MultiLineEditBoxMixin = {}

function MultiLineEditBoxMixin:Init(config)
    -- config.label, config.numLines, config.readOnly
end

function MultiLineEditBoxMixin:SetText(text)
function MultiLineEditBoxMixin:GetText()
function MultiLineEditBoxMixin:Clear()
function MultiLineEditBoxMixin:SelectAll()
function MultiLineEditBoxMixin:SetReadOnly(readOnly)

function FenUI:CreateMultiLineEditBox(parent, config)
```

**Implementation Notes**:
- Use native `EditBox` with `SetMultiLine(true)`
- Add scroll frame wrapper
- Support `SetNumLines()` for height calculation
- `readOnly` mode: selectable but not editable

**Acceptance Criteria**:
- [x] Text can be set and retrieved
- [x] Scroll works for overflow
- [x] Selection works (Ctrl+A)
- [x] Read-only mode prevents editing
- [x] Follows FenUI patterns (Mixin + Factory)

#### StatusRow

**File**: `ADDON_DEV/Libs/FenUI/Widgets/StatusRow.lua`

```lua
local StatusRowMixin = {}

function StatusRowMixin:Init(config)
    -- config = { {label, value}, {label, value}, ... }
end

function StatusRowMixin:SetValue(label, newValue)
function StatusRowMixin:SetValues(valuesTable)

function FenUI:CreateStatusRow(parent, config)
```

**Visual Design**:
```
┌────────────────────────────────────────────────────┐
│ Label1: Value1  |  Label2: Value2  |  Label3: Value3 │
└────────────────────────────────────────────────────┘
```

**Acceptance Criteria**:
- [x] Displays key-value pairs horizontally
- [x] Values can be updated individually
- [x] Uses FenUI tokens for styling
- [x] Separator between pairs

### 4. Main Frame (UI/MainFrame.lua)

**File**: `UI/MainFrame.lua`

Create the main panel using FenUI:

```lua
function Mechanic:CreateMainFrame()
    local frame = FenUI:CreatePanel(UIParent, {
        title = "!Mechanic",
        width = self.db.profile.size.width,
        height = self.db.profile.size.height,
        movable = true,
        resizable = true,
        closable = true,
    })
    
    -- Tab group
    local tabs = FenUI:CreateTabGroup(frame.content, {
        tabs = {
            { key = "console", text = "Console" },
            { key = "errors", text = "Errors" },
            { key = "tests", text = "Tests" },
            { key = "perf", text = "Performance" },
        },
        onChange = function(key) self:OnTabChanged(key) end,
    })
    
    -- Status bar with environment info
    local statusBar = FenUI:CreateStatusRow(frame, {...})
    
    -- Content container for modules
    self.contentFrame = ...
end
```

**Acceptance Criteria**:
- [x] Panel opens/closes correctly
- [x] Position and size saved
- [x] Tabs switch content
- [x] Status bar shows environment info
- [x] Close button works

### 5. Console Module (UI/Console.lua)

**File**: `UI/Console.lua`

The primary debug output display:

```lua
local ConsoleModule = {}
Mechanic.Console = ConsoleModule

ConsoleModule.buffer = {}      -- { {source, category, message, time}, ... }
ConsoleModule.paused = false
ConsoleModule.filters = {
    source = "All",
    category = "All",
    search = "",
}

function ConsoleModule:Initialize(parent)
    -- Create filter dropdowns
    -- Create search box
    -- Create MultiLineEditBox
    -- Create toolbar (Clear, Copy, Dedup All, Dedup Adjacent, Pause)
    -- Create line count label
end

function ConsoleModule:OnLog(addonName, message, category)
    -- Always buffer entries, even when paused
    table.insert(self.buffer, {
        source = addonName,
        category = category or "",
        message = message,
        time = GetTime(),
    })
    self:EnforceBufferLimit()
    
    -- Only refresh the view when not paused
    -- Pause freezes the VIEW, not the buffer accumulation
    if not self.paused then
        self:Refresh()
    end
end

function ConsoleModule:Refresh()
    -- Throttle: coalesce rapid refreshes via C_Timer.After(0)
    -- This prevents UI churn when many logs arrive in quick succession
    if self.refreshPending then return end
    self.refreshPending = true
    
    C_Timer.After(0, function()
        self.refreshPending = false
        if not self.visible then return end  -- Skip if tab not visible
        
        local filtered = self:ApplyFilters()
        local text = self:FormatEntries(filtered)
        self.editBox:SetText(text)
    end)
end

function ConsoleModule:ApplyFilters()
    -- Filter by source, category, search text
end

function ConsoleModule:DedupAll()
    -- Collapse identical lines with count
end

function ConsoleModule:DedupAdjacent()
    -- Collapse consecutive identical lines only
end

function ConsoleModule:GetCopyText(includeHeader)
    -- Format for copy dialog per MASTER_PLAN Section 5
end
```

**Buffer Management**:
- Default size: 1000 entries
- Maximum: 3000 entries
- FIFO eviction when limit reached

**Acceptance Criteria**:
- [x] Logs appear in console
- [x] Source filter works
- [x] Category filter works
- [x] Search filter works (live)
- [x] Dedup All collapses with count
- [x] Dedup Adjacent collapses consecutive only
- [x] Pause freezes view (buffer still accumulates)
- [x] Clear wipes buffer
- [x] Copy produces formatted text
- [x] Line count updates

### 6. Copy System

**Files**: `Core.lua` (helper methods)

```lua
function Mechanic:GetEnvironmentHeader()
    if not self.db.profile.includeEnvHeader then
        return nil
    end
    
    local lines = {
        "=== Mechanic Export ===",
    }
    
    -- WoW version + build
    local version, build = GetBuildInfo()
    local client = self:GetClientType()
    local interface = select(4, GetBuildInfo())
    table.insert(lines, string.format("WoW: %s (%s) | Client: %s | Interface: %d",
        version, build, client, interface))
    
    -- Character info (optional)
    if self.db.profile.includeCharacterInfo then
        local name = UnitName("player")
        local realm = GetRealmName()
        local _, class = UnitClass("player")
        local spec = GetSpecialization()
        local specName = spec and select(2, GetSpecializationInfo(spec)) or "None"
        table.insert(lines, string.format("Character: %s-%s (%s, %s)",
            name, realm, class, specName))
    end
    
    -- Timestamp (optional)
    if self.db.profile.includeTimestamp then
        table.insert(lines, "Exported: " .. date("%Y-%m-%d %H:%M:%S"))
    end
    
    -- Registered addons
    local registered = {}
    for name, caps in pairs(MechanicLib:GetRegistered()) do
        table.insert(registered, name .. " " .. (caps.version or "?"))
    end
    if #registered > 0 then
        table.insert(lines, "Registered: " .. table.concat(registered, ", "))
    end
    
    return table.concat(lines, "\n")
end

function Mechanic:GetClientType()
    -- Try API functions first (more reliable when available)
    if IsTestBuild and IsTestBuild() then return "PTR" end
    if IsBetaBuild and IsBetaBuild() then return "Beta" end
    
    -- Fallback to portal CVar
    local project = GetCVar("portal") or ""
    if project:find("test") then return "PTR"
    elseif project:find("beta") then return "Beta"
    else return "Retail"
    end
end
```

**Acceptance Criteria**:
- [x] Environment header generated correctly
- [x] Optional fields respect settings
- [x] Client type detection works (Retail/PTR/Beta)
- [x] Copy dialog opens with text selected

### 7. Slash Commands

**File**: `Core.lua`

```lua
function Mechanic:RegisterSlashCommands()
    self:RegisterChatCommand("mech", "SlashCommand")
    self:RegisterChatCommand("mechanic", "SlashCommand")
end

function Mechanic:SlashCommand(input)
    local cmd = strtrim(input or ""):lower()  -- Note: WoW provides strtrim(), not :trim()
    
    if cmd == "" then
        self:ToggleMainFrame()
    elseif cmd == "console" then
        self:ShowTab("console")
    elseif cmd == "errors" then
        self:ShowTab("errors")
    elseif cmd == "tests" then
        self:ShowTab("tests")
    elseif cmd == "perf" then
        self:ShowTab("perf")
    elseif cmd == "reload" then
        ReloadUI()
    elseif cmd == "gc" then
        local before = collectgarbage("count")
        collectgarbage("collect")
        local after = collectgarbage("count")
        local freed = before - after
        self:Print(string.format("GC: %.1f KB freed (%.1f MB -> %.1f MB)",
            freed, before/1024, after/1024))
        MechanicLib:Log("System", string.format("GC executed: %.1f KB freed", freed),
            MechanicLib.Categories.PERF)
    elseif cmd == "pause" then
        self:TogglePause()
    elseif cmd == "copy" then
        self:CopyCurrentTab()
    elseif cmd == "clear" then
        self:ClearCurrentTab()
    else
        self:Print("Unknown command: " .. cmd)
        self:Print("Commands: console, errors, tests, perf, reload, gc, pause, copy, clear")
    end
end
```

**Acceptance Criteria**:
- [x] `/mech` toggles panel
- [x] `/mech console` opens to Console tab
- [x] `/mech reload` calls ReloadUI()
- [x] `/mech gc` runs GC and logs result
- [x] Unknown commands show help

### 8. lib_sync Configuration

**File**: `ADDON_DEV/Tools/LibrarySync/lib_sync.ps1`

Add MechanicLib to the sync configuration:

```powershell
# Add to $Libraries array
@{
    Name = "MechanicLib"
    Source = "!Mechanic/Libs/MechanicLib"
    Targets = @("ActionHud", "WimpyAuras", "Weekly", "Strategy")
}
```

**Acceptance Criteria**:
- [x] MechanicLib syncs to target addons
- [x] Source folder correctly identified
- [x] Sync runs without errors

### 9. Update embeds.xml

**File**: `embeds.xml`

Ensure FenUI and MechanicLib are loaded:

```xml
<Ui xmlns="http://www.blizzard.com/wow/ui/">
    <Include file="Libs\LibStub\LibStub.lua"/>
    <Include file="Libs\CallbackHandler-1.0\CallbackHandler-1.0.xml"/>
    <Include file="Libs\AceAddon-3.0\AceAddon-3.0.xml"/>
    <Include file="Libs\AceDB-3.0\AceDB-3.0.xml"/>
    <Include file="Libs\AceConsole-3.0\AceConsole-3.0.xml"/>
    <Include file="Libs\AceEvent-3.0\AceEvent-3.0.xml"/>
    <Include file="Libs\AceConfig-3.0\AceConfig-3.0.xml"/>
    <Include file="Libs\AceGUI-3.0\AceGUI-3.0.xml"/>
    <Include file="Libs\FenUI\FenUI.xml"/>
</Ui>
```

Note: MechanicLib is loaded via TOC, not embeds.xml (it's after libs).

---

## Testing Checklist

### MechanicLib
- [x] `MechanicLib:IsEnabled()` returns true when Mechanic loaded
- [x] `MechanicLib:IsEnabled()` returns false when Mechanic not loaded
- [x] Registration stores and retrieves capabilities
- [x] Log calls reach Mechanic console

### UI
- [x] Panel opens with `/mech`
- [x] Panel remembers position after reload
- [x] Tabs switch correctly
- [x] Console receives log entries
- [x] Filters work as expected
- [x] Dedup functions work
- [x] Copy produces correct output

### Integration
- [x] lib_sync deploys MechanicLib to target addons
- [x] No Lua errors on load
- [x] No taint warnings

---

## Validation Workflow

Run these MCP tools after completing Phase 1:

```powershell
# After editing TOC or file lists
mcp_AddonDevTools_validate_tocs()

# Create/update junction links
mcp_AddonDevTools_sync_junctions("!Mechanic")

# Format code
mcp_AddonDevTools_format_addon({ addon_name = "!Mechanic" })

# Lint for errors
mcp_AddonDevTools_lint_addon({ name = "!Mechanic" })

# Check for deprecated APIs
mcp_AddonDevTools_scan_deprecations({ addon_name = "!Mechanic" })
```

---

## Handoff to Phase 2

Phase 2 requires:
- Working MechanicLib registration
- Main panel with tab structure
- Console module functional
- Copy system implemented

Phase 2 will add:
- Errors module (BugGrabber integration)
- Tests module (tree view, run controls)


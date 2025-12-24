# Phase 6: Extensibility Framework ✅ COMPLETE

Enables addons to extend !Mechanic with custom diagnostic tools and performance sub-metrics, and applies a consistent left-nav UI pattern across Console, Errors, Tools, and Performance tabs.

> **Status**: This phase has been fully implemented. See `UI/Shared/SplitNavLayout.lua`, `UI/Tools.lua`, and updates to Console.lua, Errors.lua, and Performance.lua.

---

## Prerequisites

- Phase 1-4 complete
- Phase 5 complete (category colors, rich test results)
- Console module functional (`UI/Console.lua`)
- Errors module functional (`UI/Errors.lua`)
- Performance module functional (`UI/Performance.lua`)
- MechanicLib registration working

## Reference

- [MASTER_PLAN.md](MASTER_PLAN.md) - Sections 3 (MechanicLib API), 4 (UI Layout)
- Phase 5 established visual patterns for status colors

---

## Scope

### In Scope
- Reusable left-nav split layout helper/pattern
- **Console tab refactor with left-nav by source**
- **Errors tab refactor with left-nav by source**
- New "Tools" top-level tab with left-nav
- MechanicLib `tools` capability interface
- Performance tab refactor with left-nav
- MechanicLib `performance` capability interface
- Sub-metrics display format
- Slash command extensions (`/mech tools`)

### Out of Scope
- API Test Bench tab (Phase 7)
- API-specific features (Phase 7)
- Integration with specific addons (separate migration work)

---

## Detailed Requirements

### 1. Shared UI Pattern: Left-Nav Split Layout

**Concept**: A reusable layout pattern used by Tools, Performance (and later API) tabs.

```
+---------------------------+---------------------------------------------+
| Left Nav (200px)          | Content Area                                |
|---------------------------|---------------------------------------------|
| > General                 |                                             |
| > AddonA                  |   (Content for selected nav item)           |
| > AddonB                  |                                             |
| > Category...             |                                             |
+---------------------------+---------------------------------------------+
```

**Implementation Option A: Shared Helper Module**

**File**: `UI/Shared/SplitNavLayout.lua`

```lua
local ADDON_NAME, ns = ...
local SplitNavLayout = {}
ns.SplitNavLayout = SplitNavLayout

-- Configuration defaults
local NAV_WIDTH = 200
local NAV_ITEM_HEIGHT = 24
local NAV_PADDING = 4

---@class SplitNavConfig
---@field navWidth number? Width of left nav (default 200)
---@field items table[] Array of {key, text, icon?} for nav items
---@field onSelect function Callback(key) when item selected
---@field defaultKey string? Initial selection

---Create a split navigation layout
---@param parent Frame Parent frame
---@param config SplitNavConfig
---@return table layout Layout controller object
function SplitNavLayout:Create(parent, config)
    local layout = {
        items = {},
        buttons = {},
        selectedKey = nil,
        contentFrames = {},
    }
    
    local navWidth = config.navWidth or NAV_WIDTH
    
    -- Left navigation panel
    local navPanel = CreateFrame("Frame", nil, parent)
    navPanel:SetWidth(navWidth)
    navPanel:SetPoint("TOPLEFT", 0, 0)
    navPanel:SetPoint("BOTTOMLEFT", 0, 0)
    layout.navPanel = navPanel
    
    -- Nav background
    local navBg = navPanel:CreateTexture(nil, "BACKGROUND")
    navBg:SetAllPoints()
    navBg:SetColorTexture(0, 0, 0, 0.3)
    
    -- Scrollable nav content
    local navScroll = CreateFrame("ScrollFrame", nil, navPanel, "UIPanelScrollFrameTemplate")
    navScroll:SetPoint("TOPLEFT", NAV_PADDING, -NAV_PADDING)
    navScroll:SetPoint("BOTTOMRIGHT", -NAV_PADDING - 16, NAV_PADDING)
    
    local navContent = CreateFrame("Frame", nil, navScroll)
    navContent:SetWidth(navWidth - NAV_PADDING * 2 - 16)
    navScroll:SetScrollChild(navContent)
    layout.navContent = navContent
    
    -- Content area (right side)
    local contentArea = CreateFrame("Frame", nil, parent)
    contentArea:SetPoint("TOPLEFT", navPanel, "TOPRIGHT", 4, 0)
    contentArea:SetPoint("BOTTOMRIGHT", 0, 0)
    layout.contentArea = contentArea
    
    -- Methods
    function layout:SetItems(items)
        self.items = items
        self:RefreshNav()
    end
    
    function layout:RefreshNav()
        -- Clear existing buttons
        for _, btn in ipairs(self.buttons) do
            btn:Hide()
        end
        wipe(self.buttons)
        
        local yOffset = 0
        for i, item in ipairs(self.items) do
            local btn = self:GetOrCreateButton(i)
            btn:SetPoint("TOPLEFT", self.navContent, "TOPLEFT", 0, -yOffset)
            btn:SetSize(self.navContent:GetWidth(), NAV_ITEM_HEIGHT)
            btn.text:SetText(item.text)
            btn.key = item.key
            btn:Show()
            
            -- Highlight if selected
            if item.key == self.selectedKey then
                btn.highlight:Show()
            else
                btn.highlight:Hide()
            end
            
            yOffset = yOffset + NAV_ITEM_HEIGHT + 2
        end
        
        self.navContent:SetHeight(yOffset)
    end
    
    function layout:GetOrCreateButton(index)
        if self.buttons[index] then
            return self.buttons[index]
        end
        
        local btn = CreateFrame("Button", nil, self.navContent)
        btn:SetHeight(NAV_ITEM_HEIGHT)
        
        -- Background highlight
        local highlight = btn:CreateTexture(nil, "BACKGROUND")
        highlight:SetAllPoints()
        highlight:SetColorTexture(1, 1, 1, 0.1)
        highlight:Hide()
        btn.highlight = highlight
        
        -- Hover highlight
        local hover = btn:CreateTexture(nil, "HIGHLIGHT")
        hover:SetAllPoints()
        hover:SetColorTexture(1, 1, 1, 0.05)
        
        -- Text
        local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        text:SetPoint("LEFT", 8, 0)
        text:SetJustifyH("LEFT")
        btn.text = text
        
        btn:SetScript("OnClick", function()
            self:Select(btn.key)
        end)
        
        self.buttons[index] = btn
        return btn
    end
    
    function layout:Select(key)
        if self.selectedKey == key then return end
        
        self.selectedKey = key
        self:RefreshNav()
        
        -- Hide all content frames
        for _, frame in pairs(self.contentFrames) do
            frame:Hide()
        end
        
        -- Show selected content frame
        if self.contentFrames[key] then
            self.contentFrames[key]:Show()
        end
        
        -- Callback
        if config.onSelect then
            config.onSelect(key)
        end
    end
    
    function layout:GetContentFrame(key)
        if not self.contentFrames[key] then
            local frame = CreateFrame("Frame", nil, self.contentArea)
            frame:SetAllPoints()
            frame:Hide()
            self.contentFrames[key] = frame
        end
        return self.contentFrames[key]
    end
    
    function layout:GetSelectedKey()
        return self.selectedKey
    end
    
    -- Initial setup
    if config.items then
        layout:SetItems(config.items)
    end
    if config.defaultKey then
        layout:Select(config.defaultKey)
    end
    
    return layout
end

return SplitNavLayout
```

**Acceptance Criteria**:
- [x] Left nav renders items correctly
- [x] Selection highlight works
- [x] Content frames swap on selection
- [x] Scroll works when many items
- [x] Reusable by Console, Errors, Tools, Performance, and future tabs

### 2. Console Tab Left-Nav Refactor

**File**: `UI/Console.lua`

Add left-nav to filter console output by source addon:

```
+---------------------------+---------------------------------------------+
| Sources                   | Console Output                              |
|---------------------------|---------------------------------------------|
| > All (247)               | [Flightsim] [API] Calling GetSpell... (x91) |
| > Flightsim (235)         | [Flightsim] [Core] surgeInfo obtained (x91) |
| > ActionHud (12)          | [Flightsim] [API] Raw charges: 6/6 (x91)   |
| > System (0)              | ...                                         |
+---------------------------+---------------------------------------------+
```

**Key Changes**:

```lua
function Mechanic:InitializeConsole()
    -- ... existing setup ...

    -- Create split nav layout
    local SplitNavLayout = ns.SplitNavLayout
    Console.layout = SplitNavLayout:Create(frame, {
        navWidth = 160,
        onSelect = function(key)
            Console:OnSourceSelected(key)
        end,
        defaultKey = "all",
    })

    -- Move existing console UI into the content area
    -- Filter bar, log display, toolbar go into layout:GetContentFrame("all")
end

function Console:RefreshSourceList()
    local items = {
        { key = "all", text = "All (" .. #self.buffer .. ")" },
    }

    -- Count entries per source
    local sourceCounts = {}
    for _, entry in ipairs(self.buffer) do
        sourceCounts[entry.source] = (sourceCounts[entry.source] or 0) + 1
    end

    -- Add registered addons
    local MechanicLib = LibStub("MechanicLib-1.0", true)
    if MechanicLib then
        for addonName in pairs(MechanicLib:GetRegistered()) do
            local count = sourceCounts[addonName] or 0
            table.insert(items, {
                key = addonName,
                text = addonName .. " (" .. count .. ")",
            })
        end
    end

    -- Add "System" for internal logs
    if sourceCounts["System"] then
        table.insert(items, {
            key = "System",
            text = "System (" .. sourceCounts["System"] .. ")",
        })
    end

    self.layout:SetItems(items)
end

function Console:OnSourceSelected(key)
    self.filters.source = key == "all" and "All" or key
    self:Refresh()
end
```

**Visual Enhancement**: The count in parentheses updates in real-time as logs arrive.

**Acceptance Criteria**:
- [x] Left nav shows "All" plus each registered addon
- [x] Counts update as logs arrive
- [x] Selecting a source filters the console
- [x] "All" shows combined view (default)
- [x] Category dropdown and Search remain functional
- [x] Existing toolbar (Clear, Copy, Dedup, Pause) still works

### 3. Errors Tab Left-Nav Refactor

**File**: `UI/Errors.lua`

Add left-nav to filter errors by source addon:

```
+---------------------------+---------------------------------------------+
| Sources                   | Error Details                               |
|---------------------------|---------------------------------------------|
| > All (12)                | 3x ActionHud\Core.lua:142                   |
| > ActionHud (8)           |    attempt to index nil                     |
| > WimpyAuras (3)          |                                             |
| > Unknown (1)             | Stack:                                      |
|                           |   ActionHud\Core.lua:142: in 'UpdateSlot'   |
|                           |   ...                                       |
+---------------------------+---------------------------------------------+
```

**Key Changes**:

```lua
function Mechanic:InitializeErrors()
    -- ... existing setup ...

    -- Create split nav layout
    local SplitNavLayout = ns.SplitNavLayout
    Errors.layout = SplitNavLayout:Create(frame, {
        navWidth = 160,
        onSelect = function(key)
            Errors:OnSourceSelected(key)
        end,
        defaultKey = "all",
    })
end

function Errors:RefreshSourceList()
    local items = {
        { key = "all", text = "All (" .. self:GetTotalErrorCount() .. ")" },
    }

    -- Group errors by detected addon
    local sourceCounts = {}
    for _, err in ipairs(self:GetErrors()) do
        local source = self:DetectErrorSource(err) or "Unknown"
        sourceCounts[source] = (sourceCounts[source] or 0) + 1
    end

    for source, count in pairs(sourceCounts) do
        table.insert(items, {
            key = source,
            text = source .. " (" .. count .. ")",
        })
    end

    -- Sort alphabetically (keep All first)
    table.sort(items, function(a, b)
        if a.key == "all" then return true end
        if b.key == "all" then return false end
        return a.text < b.text
    end)

    self.layout:SetItems(items)
end

function Errors:DetectErrorSource(errorObj)
    -- Parse error message/stack to identify source addon
    local msg = errorObj.message or ""
    
    -- Look for addon name in path (e.g., "ActionHud\Core.lua" or "ActionHud/Core.lua")
    local addon = msg:match("([%w_!]+)[/\\]")
    if addon then return addon end
    
    -- Look for Interface/AddOns path (forward slash)
    addon = msg:match("Interface/AddOns/([%w_!]+)/")
    if addon then return addon end
    
    return nil
end

function Errors:OnSourceSelected(key)
    self.selectedSource = key
    self:RefreshErrorList()
end
```

**Acceptance Criteria**:
- [x] Left nav shows "All" plus each addon with errors
- [x] Addon detection parses error paths correctly
- [x] Selecting a source filters the error list
- [x] "All" shows all errors (default)
- [x] Error navigation (Prev/Next) respects filter
- [x] Counts update when new errors arrive

### 4. MechanicLib Capability Extensions

**File**: `Libs/MechanicLib/MechanicLib.lua`

Extend the capabilities interface to support tools and performance:

```lua
-- Extended capabilities interface (addition to existing)
--
-- MechanicLib:Register("AddonName", {
--     version = "1.0.0",
--     
--     -- Existing capabilities...
--     getDebugBuffer = function() ... end,
--     clearDebugBuffer = function() ... end,
--     tests = { ... },
--     settings = { ... },
--     
--     -- NEW: Custom diagnostic tools
--     tools = {
--         -- Called when addon selected in Tools tab left nav
--         -- Container is a Frame to build UI inside
--         createPanel = function(container)
--             -- Build custom diagnostic UI
--             local btn = CreateFrame("Button", nil, container, "UIPanelButtonTemplate")
--             btn:SetText("Run Diagnostic")
--             btn:SetPoint("TOPLEFT", 10, -10)
--             -- etc.
--         end,
--         
--         -- Optional: Called when addon deselected (cleanup)
--         destroyPanel = function(container)
--             -- Clean up if needed
--         end,
--     },
--     
--     -- NEW: Performance sub-metrics
--     performance = {
--         -- Returns array of sub-metrics for this addon
--         getSubMetrics = function()
--             return {
--                 { name = "UI Update", msPerSec = 0.45, description = "Frame updates" },
--                 { name = "Trigger Eval", msPerSec = 0.23, description = "Condition checks" },
--                 { name = "Data Sync", msPerSec = 0.12, description = "SavedVariables" },
--             }
--         end,
--     },
-- })
```

**No code changes needed to MechanicLib itself** - it already stores arbitrary capability tables. The schema is enforced by convention and documentation.

**Update MASTER_PLAN.md Section 3** to document these new capabilities.

**Acceptance Criteria**:
- [x] Schema documented in MASTER_PLAN.md
- [x] Example implementation provided
- [x] Backwards compatible (existing registrations still work)

### 5. Tools Tab Implementation

**File**: `UI/Tools.lua` (new file)

```lua
-- UI/Tools.lua
-- !Mechanic - Tools Tab Module (Phase 6)
--
-- Provides a centralized location for addon-registered diagnostic tools.
-- Uses left-nav pattern: addon list on left, custom UI on right.

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local ToolsModule = {}
Mechanic.Tools = ToolsModule

ToolsModule.layout = nil
ToolsModule.selectedAddon = nil
ToolsModule.activePanel = nil

function Mechanic:InitializeTools()
    if ToolsModule.frame then return end

    local parent = self.frame.moduleContent
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetAllPoints()
    ToolsModule.frame = frame

    -- Create split nav layout
    local SplitNavLayout = ns.SplitNavLayout
    ToolsModule.layout = SplitNavLayout:Create(frame, {
        navWidth = 200,
        onSelect = function(key)
            ToolsModule:OnAddonSelected(key)
        end,
    })

    -- Populate nav with registered addons
    ToolsModule:RefreshAddonList()
end

function ToolsModule:RefreshAddonList()
    local MechanicLib = LibStub("MechanicLib-1.0", true)
    if not MechanicLib then return end

    local items = {}
    for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
        if capabilities.tools and capabilities.tools.createPanel then
            table.insert(items, {
                key = addonName,
                text = addonName,
            })
        end
    end

    -- Sort alphabetically
    table.sort(items, function(a, b) return a.text < b.text end)

    if #items == 0 then
        -- Show empty state
        items = {{ key = "_empty", text = "(No tools registered)" }}
    end

    self.layout:SetItems(items)

    -- Select first real addon if available
    if #items > 0 and items[1].key ~= "_empty" then
        self.layout:Select(items[1].key)
    end
end

function ToolsModule:OnAddonSelected(addonName)
    -- Destroy previous panel if it exists
    if self.activePanel and self.selectedAddon then
        local MechanicLib = LibStub("MechanicLib-1.0", true)
        local prevCaps = MechanicLib and MechanicLib:GetRegistered()[self.selectedAddon]
        if prevCaps and prevCaps.tools and prevCaps.tools.destroyPanel then
            pcall(prevCaps.tools.destroyPanel, self.activePanel)
        end
    end

    self.selectedAddon = addonName

    -- Handle empty state
    if addonName == "_empty" then
        local contentFrame = self.layout:GetContentFrame("_empty")
        local emptyText = contentFrame.emptyText
        if not emptyText then
            emptyText = contentFrame:CreateFontString(nil, "OVERLAY", "GameFontDisableLarge")
            emptyText:SetPoint("CENTER")
            emptyText:SetText("No addons have registered diagnostic tools.\n\nAddons can register tools via:\nMechanicLib:Register(name, { tools = { ... } })")
            contentFrame.emptyText = emptyText
        end
        self.activePanel = nil
        return
    end

    -- Get addon capabilities
    local MechanicLib = LibStub("MechanicLib-1.0", true)
    local capabilities = MechanicLib and MechanicLib:GetRegistered()[addonName]
    if not capabilities or not capabilities.tools then return end

    -- Get or create content frame for this addon
    local contentFrame = self.layout:GetContentFrame(addonName)
    self.activePanel = contentFrame

    -- Clear previous content
    for _, child in ipairs({contentFrame:GetChildren()}) do
        child:Hide()
        child:SetParent(nil)
    end

    -- Let addon create its panel
    if capabilities.tools.createPanel then
        local ok, err = pcall(capabilities.tools.createPanel, contentFrame)
        if not ok then
            Mechanic:Print("Error creating tools panel for " .. addonName .. ": " .. tostring(err))
        end
    end
end

function ToolsModule:OnShow()
    self:RefreshAddonList()
end

function ToolsModule:OnHide()
    -- Optional: cleanup
end

function ToolsModule:GetCopyText(includeHeader)
    local lines = {}
    if includeHeader then
        local header = Mechanic:GetEnvironmentHeader()
        if header then
            table.insert(lines, header)
            table.insert(lines, "---")
        end
    end

    table.insert(lines, "Tools Tab")
    table.insert(lines, "Selected: " .. (self.selectedAddon or "None"))
    table.insert(lines, "")
    table.insert(lines, "Registered tool providers:")

    local MechanicLib = LibStub("MechanicLib-1.0", true)
    if MechanicLib then
        for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
            if capabilities.tools and capabilities.tools.createPanel then
                table.insert(lines, "  - " .. addonName)
            end
        end
    end

    return table.concat(lines, "\n")
end
```

**MainFrame.lua Updates**:

```lua
-- Add to tab group definition
tabs = {
    { key = "console", text = "Console" },
    { key = "errors", text = "Errors" },
    { key = "tests", text = "Tests" },
    { key = "tools", text = "Tools" },      -- NEW
    { key = "perf", text = "Performance" },
}

-- Add to OnTabChanged
elseif key == "tools" then
    if not self.Tools or not self.Tools.frame then
        self:InitializeTools()
    end
    if self.Tools and self.Tools.frame then
        self.Tools.frame:Show()
        self.Tools:OnShow()
    end
```

**Acceptance Criteria**:
- [x] Tools tab appears in tab bar
- [x] Left nav lists addons with tools capability
- [x] Selecting addon shows its custom panel
- [x] Empty state shown when no tools registered
- [x] Panel creation errors are caught and logged
- [x] Panel cleanup called on deselection

### 6. Performance Tab Refactor

**File**: `UI/Performance.lua`

Refactor to use left-nav pattern with "General" as default and addon sub-metrics:

```lua
-- Key changes to Performance.lua

function Mechanic:InitializePerformance()
    -- ... existing setup ...

    -- Replace current layout with split nav
    local SplitNavLayout = ns.SplitNavLayout
    PerformanceModule.layout = SplitNavLayout:Create(frame, {
        navWidth = 180,
        onSelect = function(key)
            PerformanceModule:OnNavSelected(key)
        end,
        defaultKey = "general",
    })

    -- Build nav items
    PerformanceModule:RefreshNavItems()
end

function PerformanceModule:RefreshNavItems()
    local items = {
        { key = "general", text = "General" },
    }

    -- Add addons with performance capability
    local MechanicLib = LibStub("MechanicLib-1.0", true)
    if MechanicLib then
        for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
            if capabilities.performance and capabilities.performance.getSubMetrics then
                table.insert(items, {
                    key = addonName,
                    text = addonName,
                })
            end
        end
    end

    -- Sort addons alphabetically (keep General first)
    table.sort(items, function(a, b)
        if a.key == "general" then return true end
        if b.key == "general" then return false end
        return a.text < b.text
    end)

    self.layout:SetItems(items)
end

function PerformanceModule:OnNavSelected(key)
    self.selectedNav = key
    
    if key == "general" then
        self:ShowGeneralView()
    else
        self:ShowAddonMetrics(key)
    end
end

function PerformanceModule:ShowGeneralView()
    -- Show existing performance UI (addon list, global metrics)
    local contentFrame = self.layout:GetContentFrame("general")
    -- Move existing UI elements to this content frame
    -- ... (refactor existing UI creation to target contentFrame)
end

function PerformanceModule:ShowAddonMetrics(addonName)
    local contentFrame = self.layout:GetContentFrame(addonName)
    
    -- Get sub-metrics from addon
    local MechanicLib = LibStub("MechanicLib-1.0", true)
    local capabilities = MechanicLib and MechanicLib:GetRegistered()[addonName]
    if not capabilities or not capabilities.performance then return end

    local subMetrics = capabilities.performance.getSubMetrics()
    if not subMetrics then return end

    -- Render sub-metrics table
    self:RenderSubMetrics(contentFrame, addonName, subMetrics)
end

function PerformanceModule:RenderSubMetrics(parent, addonName, metrics)
    -- Clear previous content
    for _, child in ipairs({parent:GetChildren()}) do
        child:Hide()
    end

    -- Header
    local header = parent.header or parent:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    header:SetPoint("TOPLEFT", 8, -8)
    header:SetText(addonName .. " - Performance Breakdown")
    parent.header = header

    -- Metrics table
    local yOffset = -40
    local totalMs = 0

    -- Calculate total for percentages
    for _, metric in ipairs(metrics) do
        totalMs = totalMs + (metric.msPerSec or 0)
    end

    for i, metric in ipairs(metrics) do
        local row = self:GetOrCreateMetricRow(parent, i)
        row:SetPoint("TOPLEFT", 8, yOffset)
        row:SetPoint("RIGHT", -8, 0)

        row.nameLabel:SetText(metric.name)
        row.valueLabel:SetText(string.format("%.2f ms/s", metric.msPerSec or 0))
        
        local pct = totalMs > 0 and ((metric.msPerSec or 0) / totalMs * 100) or 0
        row.pctLabel:SetText(string.format("%.1f%%", pct))
        
        if metric.description then
            row.descLabel:SetText("|cff888888" .. metric.description .. "|r")
        else
            row.descLabel:SetText("")
        end

        row:Show()
        yOffset = yOffset - 24
    end

    -- Total row
    local totalRow = parent.totalRow
    if not totalRow then
        totalRow = CreateFrame("Frame", nil, parent)
        totalRow:SetHeight(24)
        
        local sep = totalRow:CreateTexture(nil, "BACKGROUND")
        sep:SetPoint("TOPLEFT", 0, -2)
        sep:SetPoint("TOPRIGHT", 0, -2)
        sep:SetHeight(1)
        sep:SetColorTexture(1, 1, 1, 0.2)
        
        local label = totalRow:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        label:SetPoint("LEFT", 0, 0)
        label:SetText("Total:")
        totalRow.label = label
        
        local value = totalRow:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        value:SetPoint("LEFT", 150, 0)
        totalRow.value = value
        
        parent.totalRow = totalRow
    end
    
    totalRow:SetPoint("TOPLEFT", 8, yOffset - 8)
    totalRow:SetPoint("RIGHT", -8, 0)
    totalRow.value:SetText(string.format("%.2f ms/s", totalMs))
    totalRow:Show()
end

function PerformanceModule:GetOrCreateMetricRow(parent, index)
    parent.metricRows = parent.metricRows or {}
    
    if parent.metricRows[index] then
        return parent.metricRows[index]
    end

    local row = CreateFrame("Frame", nil, parent)
    row:SetHeight(22)

    local nameLabel = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameLabel:SetPoint("LEFT", 0, 0)
    nameLabel:SetWidth(140)
    nameLabel:SetJustifyH("LEFT")
    row.nameLabel = nameLabel

    local valueLabel = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    valueLabel:SetPoint("LEFT", 150, 0)
    valueLabel:SetWidth(80)
    valueLabel:SetJustifyH("RIGHT")
    row.valueLabel = valueLabel

    local pctLabel = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    pctLabel:SetPoint("LEFT", 240, 0)
    pctLabel:SetWidth(50)
    pctLabel:SetJustifyH("RIGHT")
    row.pctLabel = pctLabel

    local descLabel = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    descLabel:SetPoint("LEFT", 300, 0)
    descLabel:SetJustifyH("LEFT")
    row.descLabel = descLabel

    parent.metricRows[index] = row
    return row
end
```

**Visual Layout for Sub-Metrics**:
```
+---------------------------+---------------------------------------------+
| Performance               | Flightsim - Performance Breakdown           |
|---------------------------|---------------------------------------------|
| > General                 |                                             |
| > Flightsim               |  Name             | ms/s    | %    | Desc   |
| > ActionHud               |  UI Update        | 0.45    | 52%  | Frames |
|                           |  Trigger Eval     | 0.23    | 27%  | Conds  |
|                           |  Data Sync        | 0.12    | 14%  | SV     |
|                           |  Event Handling   | 0.06    | 7%   | Events |
|                           |  ────────────────────────────────────────── |
|                           |  Total:           | 0.86    |      |        |
+---------------------------+---------------------------------------------+
```

**Acceptance Criteria**:
- [x] "General" shows existing global performance view
- [x] Addons with performance capability appear in nav
- [x] Selecting addon shows its sub-metrics
- [x] Sub-metrics show name, ms/s, percentage, description
- [x] Total row sums sub-metrics
- [x] Auto-refresh updates sub-metrics when enabled

### 7. Slash Command Extensions

**File**: `Core.lua`

Add `/mech tools` command:

```lua
elseif cmd == "tools" then
    self:ShowTab("tools")
```

**Acceptance Criteria**:
- [x] `/mech tools` opens to Tools tab

### 8. File Loading Order

**File**: `!Mechanic.toc`

Add new files:

```toc
## LoadOrder
Libs\LibStub\LibStub.lua
...existing libs...

# Shared modules
UI\Shared\SplitNavLayout.lua

# UI modules (existing + new)
UI\MainFrame.lua
UI\Console.lua
UI\Errors.lua
UI\Tests.lua
UI\Tools.lua
UI\Performance.lua

Core.lua
Settings.lua
```

**Acceptance Criteria**:
- [x] SplitNavLayout loads before tabs that use it
- [x] Tools.lua loads after shared modules

---

## Testing Checklist

### SplitNavLayout
- [ ] Nav items render correctly
- [ ] Selection highlight updates
- [ ] Content frames swap on selection
- [ ] Scroll works with many items
- [ ] Works in Console, Errors, Tools, Performance tabs

### Console Left-Nav
- [ ] Left nav shows "All" plus each registered addon
- [ ] Counts in parentheses update as logs arrive
- [ ] Selecting a source filters console output
- [ ] "All" shows combined view (default)
- [ ] Category dropdown and Search remain functional
- [ ] Toolbar (Clear, Copy, Dedup, Pause) still works
- [ ] Dedup works correctly within filtered view

### Errors Left-Nav
- [ ] Left nav shows "All" plus each addon with errors
- [ ] Addon detection parses error paths correctly
- [ ] Selecting a source filters the error list
- [ ] "All" shows all errors (default)
- [ ] Error navigation (Prev/Next) respects filter
- [ ] Counts update when new errors arrive
- [ ] "Unknown" category for unparseable errors

### Tools Tab
- [ ] Tab appears in header
- [ ] Nav shows addons with tools capability
- [ ] Empty state when no tools registered
- [ ] Panel created when addon selected
- [ ] Panel destroyed when addon deselected
- [ ] Errors in panel creation are caught
- [ ] Copy includes tool providers list

### Performance Sub-Metrics
- [ ] "General" shows existing performance UI
- [ ] Nav shows addons with performance capability
- [ ] Sub-metrics render with name, value, percentage
- [ ] Total row sums correctly
- [ ] Auto-refresh updates sub-metrics
- [ ] Copy includes sub-metrics data

### Integration
- [ ] Tabs switch correctly
- [ ] No errors on load
- [ ] No taint warnings
- [ ] All four tabs use consistent left-nav pattern

---

## Validation Workflow

```powershell
# Validate TOC
mcp_AddonDevTools_validate_tocs()

# Lint for errors
mcp_AddonDevTools_lint_addon({ name = "!Mechanic" })

# Format code
mcp_AddonDevTools_format_addon({ addon_name = "!Mechanic" })
```

**Manual Testing**:
1. Load multiple addons that log to Mechanic
2. Verify Console left-nav shows all sources with counts
3. Select a source, verify filtering works
4. Trigger errors from multiple addons
5. Verify Errors left-nav groups by source correctly
6. Register a test addon with `tools` capability
7. Verify addon appears in Tools tab nav
8. Select addon, verify panel created
9. Register addon with `performance` capability
10. Verify addon appears in Performance nav
11. Select addon, verify sub-metrics display
12. Enable auto-refresh, verify updates

---

## Example: Addon Integration

```lua
-- Example addon registering both tools and performance
local MechanicLib = LibStub("MechanicLib-1.0", true)
if MechanicLib and MechanicLib:IsEnabled() then
    MechanicLib:Register("MyAddon", {
        version = "1.0.0",
        
        tools = {
            createPanel = function(container)
                local title = container:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
                title:SetPoint("TOPLEFT", 10, -10)
                title:SetText("MyAddon Diagnostics")
                
                local btn = CreateFrame("Button", nil, container, "UIPanelButtonTemplate")
                btn:SetSize(150, 24)
                btn:SetPoint("TOPLEFT", 10, -40)
                btn:SetText("Run Full Diagnostic")
                btn:SetScript("OnClick", function()
                    MyAddon:RunDiagnostic()
                end)
            end,
        },
        
        performance = {
            getSubMetrics = function()
                return {
                    { name = "UI Updates", msPerSec = MyAddon.Perf.uiMs, description = "Frame rendering" },
                    { name = "Data Processing", msPerSec = MyAddon.Perf.dataMs, description = "Event handling" },
                }
            end,
        },
    })
end
```

---

## Handoff to Phase 7

Phase 7 requires:
- SplitNavLayout helper functional
- Console left-nav by source working
- Errors left-nav by source working
- Tools tab pattern established
- Performance sub-metrics working

Phase 7 will add:
- API Test Bench tab (largest feature)
- API namespace organization
- Individual API testing
- Status reporting


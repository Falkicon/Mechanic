# Phase 3: Performance and Polish

Adds the Performance module, Settings panel, minimap button, and event frequency tracking.

---

## Prerequisites

- Phase 1 and 2 complete:
  - All tabs functional
  - Copy system working
  - MechanicLib deployed

## Reference

- [MASTER_PLAN.md](MASTER_PLAN.md) - Sections 4, 7, 9
- [01-foundation.plan.md](01-foundation.plan.md) - Copy system, Settings schema

---

## Scope

### In Scope
- Performance module with memory/CPU metrics
- Extended metrics (FPS, latency, GC)
- Optional event frequency tracking
- Settings panel (AceConfig)
- Minimap button (LibDBIcon)
- DataBroker support
- Localization (enUS)

### Out of Scope
- Migration of existing addons (Phase 4)

---

## Detailed Requirements

### 1. Performance Module (UI/Performance.lua)

**File**: `UI/Performance.lua`

```lua
local PerformanceModule = {}
Mechanic.Performance = PerformanceModule

PerformanceModule.autoRefresh = true
PerformanceModule.refreshTimer = nil
PerformanceModule.trackingStart = nil
PerformanceModule.eventCounts = {}  -- For optional event tracking

function PerformanceModule:Initialize(parent)
    -- Toolbar: Auto-Refresh toggle, Reset, CPU Profiling toggle, Copy
    -- Extended metrics row: FPS, Latency, Lua Memory
    -- Addon list (Grid or ScrollFrame)
    -- Footer: Duration, Total Memory
end
```

#### Extended Metrics

```lua
function PerformanceModule:GetExtendedMetrics()
    local fps = GetFramerate()
    local _, _, latencyHome, latencyWorld = GetNetStats()
    local luaMemory = collectgarbage("count")  -- KB
    
    return {
        fps = fps,
        latencyHome = latencyHome,
        latencyWorld = latencyWorld,
        luaMemory = luaMemory,
    }
end

function PerformanceModule:UpdateExtendedMetrics()
    local metrics = self:GetExtendedMetrics()
    
    self.fpsLabel:SetText(string.format("FPS: %.0f", metrics.fps))
    self.latencyLabel:SetText(string.format("Latency: %dms / %dms",
        metrics.latencyHome, metrics.latencyWorld))
    self.memoryLabel:SetText(string.format("Lua Memory: %.1f MB",
        metrics.luaMemory / 1024))
end
```

#### Addon Performance Data

```lua
function PerformanceModule:GetAddonData()
    -- Refresh data
    UpdateAddOnMemoryUsage()
    if GetCVarBool("scriptProfile") then
        UpdateAddOnCPUUsage()
    end
    
    local addons = {}
    local totalMemory = 0
    local totalCPU = 0
    local numAddons = C_AddOns.GetNumAddOns()
    local cpuEnabled = GetCVarBool("scriptProfile")
    local duration = GetTime() - (self.trackingStart or GetTime())
    
    for i = 1, numAddons do
        if C_AddOns.IsAddOnLoaded(i) then
            local name = C_AddOns.GetAddOnInfo(i)
            local memory = GetAddOnMemoryUsage(i)  -- KB
            local cpu = 0
            
            if cpuEnabled then
                cpu = GetAddOnCPUUsage(i)  -- ms total
                -- Convert to ms/s
                if duration > 0 then
                    cpu = cpu / duration
                end
            end
            
            totalMemory = totalMemory + memory
            totalCPU = totalCPU + cpu
            
            table.insert(addons, {
                name = name,
                memory = memory,
                cpu = cpu,
            })
        end
    end
    
    -- Calculate percentages
    for _, addon in ipairs(addons) do
        addon.memoryPercent = totalMemory > 0 and (addon.memory / totalMemory * 100) or 0
        addon.cpuPercent = totalCPU > 0 and (addon.cpu / totalCPU * 100) or 0
    end
    
    -- Sort by memory (default)
    table.sort(addons, function(a, b) return a.memory > b.memory end)
    
    return addons, totalMemory, totalCPU, duration
end
```

#### Addon List Display

```lua
function PerformanceModule:RefreshList()
    local addons, totalMemory, totalCPU, duration = self:GetAddonData()
    local cpuEnabled = GetCVarBool("scriptProfile")
    
    -- Clear and rebuild list
    self.listFrame:Clear()
    
    for _, addon in ipairs(addons) do
        local row = self.listFrame:AddRow()
        
        row:SetText(1, addon.name)
        row:SetText(2, self:FormatMemory(addon.memory))
        row:SetText(3, string.format("%.1f%%", addon.memoryPercent))
        
        if cpuEnabled then
            row:SetText(4, string.format("%.2f", addon.cpu))
            row:SetText(5, string.format("%.1f%%", addon.cpuPercent))
        else
            row:SetText(4, "-")
            row:SetText(5, "-")
        end
    end
    
    -- Update footer
    self.footerLabel:SetText(string.format(
        "Tracking: %s | Total Memory: %s",
        self:FormatDuration(duration),
        self:FormatMemory(totalMemory)))
end

function PerformanceModule:FormatMemory(kb)
    if kb >= 1024 then
        return string.format("%.1f MB", kb / 1024)
    else
        return string.format("%.0f KB", kb)
    end
end

function PerformanceModule:FormatDuration(seconds)
    local mins = math.floor(seconds / 60)
    local secs = seconds % 60
    return string.format("%dm %ds", mins, secs)
end
```

#### Auto-Refresh

```lua
function PerformanceModule:StartAutoRefresh()
    if self.refreshTimer then return end
    
    local interval = Mechanic.db.profile.refreshInterval or 1.0
    self.refreshTimer = C_Timer.NewTicker(interval, function()
        if self.visible then
            self:Refresh()
        end
    end)
end

function PerformanceModule:StopAutoRefresh()
    if self.refreshTimer then
        self.refreshTimer:Cancel()
        self.refreshTimer = nil
    end
end

function PerformanceModule:ToggleAutoRefresh()
    self.autoRefresh = not self.autoRefresh
    Mechanic.db.profile.autoRefresh = self.autoRefresh
    
    if self.autoRefresh then
        self:StartAutoRefresh()
        self.autoRefreshButton:SetText("▶ Auto-Refresh: ON")
    else
        self:StopAutoRefresh()
        self.autoRefreshButton:SetText("⏸ Auto-Refresh: OFF")
    end
end
```

#### CPU Profiling Toggle

```lua
function PerformanceModule:ToggleCPUProfiling()
    local current = GetCVarBool("scriptProfile")
    local new = not current
    
    -- Changing scriptProfile requires reload
    StaticPopup_Show("MECHANIC_CPU_PROFILING", nil, nil, {
        enable = new,
        callback = function()
            SetCVar("scriptProfile", new and "1" or "0")
            ReloadUI()
        end
    })
end

-- Register popup
StaticPopupDialogs["MECHANIC_CPU_PROFILING"] = {
    text = "CPU profiling requires a UI reload. Continue?",
    button1 = "Reload",
    button2 = "Cancel",
    OnAccept = function(self, data)
        data.callback()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
}
```

#### Reset Stats

```lua
function PerformanceModule:ResetStats()
    self.trackingStart = GetTime()
    ResetCPUUsage()
    collectgarbage("collect")
    self:Refresh()
    Mechanic:Print("Performance stats reset.")
end
```

#### Event Frequency Tracking (Optional)

```lua
-- Only enabled if setting is true (adds overhead)
function PerformanceModule:EnableEventTracking()
    if not Mechanic.db.profile.trackEventFrequency then return end
    
    self.eventCounts = {}
    self.eventTrackingStart = GetTime()
    
    -- Hook event registration
    local originalRegister = self.frame.RegisterEvent
    self.frame.RegisterEvent = function(frame, event)
        self.eventCounts[event] = self.eventCounts[event] or { count = 0, sources = {} }
        originalRegister(frame, event)
    end
    
    -- Track event fires
    self.eventFrame = CreateFrame("Frame")
    self.eventFrame:SetScript("OnEvent", function(_, event)
        if self.eventCounts[event] then
            self.eventCounts[event].count = self.eventCounts[event].count + 1
        end
    end)
    
    -- Register for common high-frequency events
    local events = {
        "UNIT_HEALTH", "UNIT_POWER_UPDATE", "UNIT_AURA",
        "COMBAT_LOG_EVENT_UNFILTERED", "SPELL_UPDATE_COOLDOWN",
    }
    for _, event in ipairs(events) do
        self.eventCounts[event] = { count = 0 }
        self.eventFrame:RegisterEvent(event)
    end
end

function PerformanceModule:GetEventFrequency()
    local duration = GetTime() - (self.eventTrackingStart or GetTime())
    if duration < 1 then duration = 1 end
    
    local events = {}
    for event, data in pairs(self.eventCounts) do
        table.insert(events, {
            event = event,
            count = data.count,
            perMinute = (data.count / duration) * 60,
        })
    end
    
    table.sort(events, function(a, b) return a.count > b.count end)
    return events
end
```

#### Copy

```lua
function PerformanceModule:GetCopyText(includeHeader)
    local lines = {}
    
    if includeHeader then
        lines = { Mechanic:GetEnvironmentHeader() }
        local metrics = self:GetExtendedMetrics()
        table.insert(lines, string.format(
            "FPS: %.0f | Latency: %dms / %dms | Duration: %s",
            metrics.fps, metrics.latencyHome, metrics.latencyWorld,
            self:FormatDuration(GetTime() - self.trackingStart)))
        
        local _, totalMemory = self:GetAddonData()
        local cpuEnabled = GetCVarBool("scriptProfile")
        table.insert(lines, string.format(
            "Total Memory: %s | CPU Profiling: %s",
            self:FormatMemory(totalMemory),
            cpuEnabled and "ON" or "OFF"))
        table.insert(lines, "---")
    end
    
    -- Addon table
    local addons = self:GetAddonData()
    local cpuEnabled = GetCVarBool("scriptProfile")
    
    if cpuEnabled then
        table.insert(lines, "Addon              | Memory   | %     | CPU ms/s | %")
        table.insert(lines, "-------------------|----------|-------|----------|-------")
    else
        table.insert(lines, "Addon              | Memory   | %")
        table.insert(lines, "-------------------|----------|------")
    end
    
    for _, addon in ipairs(addons) do
        if cpuEnabled then
            table.insert(lines, string.format("%-18s | %8s | %5.1f%% | %8.2f | %5.1f%%",
                addon.name:sub(1, 18),
                self:FormatMemory(addon.memory),
                addon.memoryPercent,
                addon.cpu,
                addon.cpuPercent))
        else
            table.insert(lines, string.format("%-18s | %8s | %5.1f%%",
                addon.name:sub(1, 18),
                self:FormatMemory(addon.memory),
                addon.memoryPercent))
        end
    end
    
    return table.concat(lines, "\n")
end
```

**Acceptance Criteria**:
- [x] Extended metrics display (FPS, latency, memory)
- [x] Addon list with memory data
- [x] CPU data shows when profiling enabled
- [x] Auto-refresh toggles correctly
- [x] Reset clears stats
- [x] CPU profiling toggle prompts for reload
- [x] Copy produces formatted table
- [x] Event tracking works when enabled (opt-in)

---

### 2. Settings Panel (Settings.lua)

**File**: `Settings.lua`

```lua
local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

function Mechanic:SetupOptions()
    local options = {
        type = "group",
        name = "!Mechanic",
        args = {
            general = {
                type = "group",
                name = "General",
                order = 1,
                args = {
                    header = {
                        type = "header",
                        name = "General Settings",
                        order = 1,
                    },
                    bufferSize = {
                        type = "range",
                        name = "Console Buffer Size",
                        desc = "Maximum number of log entries to keep",
                        min = 100, max = 3000, step = 100,
                        order = 2,
                        get = function() return self.db.profile.bufferSize end,
                        set = function(_, v) self.db.profile.bufferSize = v end,
                    },
                    showTimestamps = {
                        type = "toggle",
                        name = "Show Timestamps",
                        desc = "Prefix console entries with time",
                        order = 3,
                        get = function() return self.db.profile.showTimestamps end,
                        set = function(_, v) self.db.profile.showTimestamps = v end,
                    },
                },
            },
            copy = {
                type = "group",
                name = "Copy Options",
                order = 2,
                args = {
                    header = {
                        type = "header",
                        name = "Copy Behavior",
                        order = 1,
                    },
                    includeEnvHeader = {
                        type = "toggle",
                        name = "Include Environment Header",
                        desc = "Add WoW version, character info to copies",
                        order = 2,
                        get = function() return self.db.profile.includeEnvHeader end,
                        set = function(_, v) self.db.profile.includeEnvHeader = v end,
                    },
                    includeCharacterInfo = {
                        type = "toggle",
                        name = "Include Character Info",
                        desc = "Add character name and class to header",
                        order = 3,
                        disabled = function() return not self.db.profile.includeEnvHeader end,
                        get = function() return self.db.profile.includeCharacterInfo end,
                        set = function(_, v) self.db.profile.includeCharacterInfo = v end,
                    },
                    includeTimestamp = {
                        type = "toggle",
                        name = "Include Timestamp",
                        desc = "Add export timestamp to header",
                        order = 4,
                        disabled = function() return not self.db.profile.includeEnvHeader end,
                        get = function() return self.db.profile.includeTimestamp end,
                        set = function(_, v) self.db.profile.includeTimestamp = v end,
                    },
                },
            },
            performance = {
                type = "group",
                name = "Performance",
                order = 3,
                args = {
                    header = {
                        type = "header",
                        name = "Performance Settings",
                        order = 1,
                    },
                    autoRefresh = {
                        type = "toggle",
                        name = "Auto-Refresh",
                        desc = "Automatically refresh performance data",
                        order = 2,
                        get = function() return self.db.profile.autoRefresh end,
                        set = function(_, v)
                            self.db.profile.autoRefresh = v
                            -- Update module if visible
                        end,
                    },
                    refreshInterval = {
                        type = "range",
                        name = "Refresh Interval",
                        desc = "Seconds between auto-refreshes",
                        min = 0.5, max = 5, step = 0.5,
                        order = 3,
                        get = function() return self.db.profile.refreshInterval end,
                        set = function(_, v) self.db.profile.refreshInterval = v end,
                    },
                    trackEventFrequency = {
                        type = "toggle",
                        name = "Track Event Frequency",
                        desc = "Monitor event fire rates (adds overhead)",
                        order = 4,
                        get = function() return self.db.profile.trackEventFrequency end,
                        set = function(_, v) self.db.profile.trackEventFrequency = v end,
                    },
                },
            },
            registeredAddons = {
                type = "group",
                name = "Registered Addons",
                order = 10,
                args = {
                    -- Dynamically populated from MechanicLib:GetRegistered()
                },
            },
        },
    }
    
    -- Add registered addon settings
    self:PopulateRegisteredAddonSettings(options.args.registeredAddons.args)
    
    AceConfig:RegisterOptionsTable("Mechanic", options)
    AceConfigDialog:AddToBlizOptions("Mechanic", "!Mechanic")
end

function Mechanic:PopulateRegisteredAddonSettings(args)
    local order = 1
    for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
        if capabilities.settings then
            args[addonName] = {
                type = "group",
                name = addonName .. " " .. (capabilities.version or ""),
                order = order,
                args = capabilities.settings,
            }
            order = order + 1
        end
    end
    
    if order == 1 then
        args.noAddons = {
            type = "description",
            name = "No addons have registered settings with Mechanic.",
            order = 1,
        }
    end
end
```

**Acceptance Criteria**:
- [x] Settings panel accessible from game options
- [x] All settings persist correctly
- [x] Copy options affect copy output
- [x] Performance options work
- [x] Registered addon settings appear

---

### 3. Minimap Button (LibDBIcon)

**Files**: `Core.lua` (additions)

```lua
local LDB = LibStub("LibDataBroker-1.1")
local LDBIcon = LibStub("LibDBIcon-1.0")

function Mechanic:SetupDataBroker()
    local dataObj = LDB:NewDataObject("Mechanic", {
        type = "launcher",
        icon = "Interface\\Icons\\Trade_Engineering",
        label = "Mechanic",
        OnClick = function(_, button)
            if button == "LeftButton" then
                self:ToggleMainFrame()
            elseif button == "RightButton" then
                Settings.OpenToCategory("!Mechanic")
            end
        end,
        OnTooltipShow = function(tooltip)
            tooltip:AddLine("!Mechanic")
            tooltip:AddLine("|cffffffffLeft-click:|r Toggle window")
            tooltip:AddLine("|cffffffffRight-click:|r Settings")
            
            -- Show registered addon count
            local count = 0
            for _ in pairs(MechanicLib:GetRegistered()) do
                count = count + 1
            end
            tooltip:AddLine(" ")
            tooltip:AddLine(string.format("%d addons registered", count))
        end,
    })
    
    LDBIcon:Register("Mechanic", dataObj, self.db.profile.minimap)
end

function Mechanic:ToggleMinimapIcon()
    local minimap = self.db.profile.minimap
    minimap.hide = not minimap.hide
    
    if minimap.hide then
        LDBIcon:Hide("Mechanic")
    else
        LDBIcon:Show("Mechanic")
    end
end
```

**Add to database defaults**:
```lua
minimap = {
    hide = false,
},
```

**Add to settings**:
```lua
minimapIcon = {
    type = "toggle",
    name = "Show Minimap Icon",
    order = 10,
    get = function() return not self.db.profile.minimap.hide end,
    set = function(_, v)
        self.db.profile.minimap.hide = not v
        if v then LDBIcon:Show("Mechanic") else LDBIcon:Hide("Mechanic") end
    end,
},
```

**Acceptance Criteria**:
- [x] Minimap button shows by default
- [x] Left-click toggles panel
- [x] Right-click opens settings
- [x] Tooltip shows info
- [x] Can be hidden via settings

---

### 4. Localization (Locales/enUS.lua)

**File**: `Locales/enUS.lua`

```lua
local L = LibStub("AceLocale-3.0"):NewLocale("Mechanic", "enUS", true)
if not L then return end

-- UI
L["Console"] = true
L["Errors"] = true
L["Tests"] = true
L["Performance"] = true

-- Console
L["Source"] = true
L["Category"] = true
L["Search"] = true
L["Clear"] = true
L["Copy"] = true
L["Dedup All"] = true
L["Dedup Adjacent"] = true
L["Pause"] = true
L["Resume"] = true

-- Errors
L["Session"] = true
L["Current Session"] = true
L["Previous Session"] = true
L["All Sessions"] = true
L["Send to Console"] = true
L["Copy Error"] = true
L["Wipe Session"] = true
L["!BugGrabber Required"] = true

-- Tests
L["Run Selected"] = true
L["Run All Auto"] = true
L["Validate"] = true
L["Clear Results"] = true
L["Total"] = true
L["Passed"] = true
L["Failed"] = true
L["Pending"] = true

-- Performance
L["Auto-Refresh"] = true
L["Reset Stats"] = true
L["CPU Profiling"] = true
L["FPS"] = true
L["Latency"] = true
L["Memory"] = true
L["Addon"] = true

-- Settings
L["General"] = true
L["Copy Options"] = true
L["Registered Addons"] = true
L["Console Buffer Size"] = true
L["Show Timestamps"] = true
L["Include Environment Header"] = true
L["Include Character Info"] = true
L["Include Timestamp"] = true
L["Refresh Interval"] = true
L["Track Event Frequency"] = true
L["Show Minimap Icon"] = true
```

**Acceptance Criteria**:
- [x] All UI strings in locale file
- [x] L["Key"] pattern used throughout
- [ ] No hardcoded strings in UI code (Note: Some hardcoded strings remain for clarity)

---

## Testing Checklist

### Performance Module
- [x] FPS updates
- [x] Latency updates
- [x] Memory per addon correct
- [x] CPU shows when profiling enabled
- [x] Auto-refresh works
- [x] Reset clears stats
- [x] Copy produces table

### Settings
- [x] All options work
- [x] Registered addons appear
- [x] Settings persist

### Minimap
- [x] Icon shows
- [x] Clicks work
- [x] Tooltip correct

---

## Validation Workflow

Run these MCP tools after completing Phase 3:

```powershell
# Validate TOC
mcp_AddonDevTools_validate_tocs()

# Format code
mcp_AddonDevTools_format_addon({ addon_name = "!Mechanic" })

# Lint for errors
mcp_AddonDevTools_lint_addon({ name = "!Mechanic" })

# Check for deprecated APIs (especially performance APIs)
mcp_AddonDevTools_scan_deprecations({ addon_name = "!Mechanic" })

# Extract locale strings
mcp_AddonDevTools_extract_locale_strings({ addon_name = "!Mechanic" })

# Validate locale coverage
mcp_AddonDevTools_validate_locale_coverage({ addon_name = "!Mechanic" })
```

---

## Handoff to Phase 4

Phase 4 requires:
- !Mechanic fully functional
- MechanicLib API stable
- lib_sync working

Phase 4 will:
- Update ActionHud to use MechanicLib
- Update WimpyAuras to use MechanicLib
- Remove DevMarker.lua pattern


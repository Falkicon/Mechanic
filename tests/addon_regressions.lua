-- Run from the repository root: lua tests/addon_regressions.lua
-- Offline contract/lifecycle checks; no WoW client or vendor changes required.
local function noop() end
local function newFrame()
    return setmetatable({ shown = true, scripts = {} }, { __index = function(_, key)
        if key == "HookScript" or key == "SetScript" then
            return function(self, event, fn) self.scripts[event] = fn end
        elseif key == "IsShown" then
            return function(self) return self.shown end
        elseif key == "Hide" or key == "Show" then
            return function(self)
                self.shown = key == "Show"
                local fn = self.scripts[self.shown and "OnShow" or "OnHide"]
                if fn then fn(self) end
            end
        end
        return noop
    end })
end

CreateFrame = newFrame
C_AddOns = { GetAddOnMetadata = function() return "test" end }
date = function() return "2026-09-05 12:00:00" end
local bootstrapNS = {}
assert(loadfile("!Mechanic/Bootstrap.lua"))("!Mechanic", bootstrapNS)
bootstrapNS.rawDB = {}
MECHANIC_LUA_QUEUE = {
    { label = "duplicate", code = "1 + 2" },
    { label = "duplicate", code = "local t = {}; t.self = t; return t" },
    { label = "bad_compile", code = "local =" },
    { label = "bad_runtime", code = "error('expected')" },
    { label = "empty", code = "" },
    { label = "invalid" },
    { label = "function", code = "function() end" },
}
Mechanic:ProcessLuaEvalQueue()
local saved = bootstrapNS.rawDB.luaEvalResults
assert(MECHANIC_LUA_QUEUE == nil, "queue must be consumed")
assert(saved.lastRun == date() and #saved.results == 7, "desktop result envelope/order")
assert(saved.results[1].result == "3" and saved.results[1].success)
assert(saved.results[2].success and saved.results[2].resultType == "table")
assert(type(saved.results[2].result) == "string", "cyclic tables must not enter SavedVariables")
for i = 3, 6 do assert(saved.results[i].success == false and saved.results[i].error) end
assert(saved.results[7].success and type(saved.results[7].result) == "string")

local addon = { db = { profile = {
    autoRefresh = false, refreshInterval = 1, activeTab = "perf",
    position = { point = "CENTER", x = 0, y = 0 }, size = { width = 1000, height = 650 },
} } }
local locale = setmetatable({}, { __index = function(_, key) return key end })
LibStub = function(name)
    if name == "AceAddon-3.0" then return { GetAddon = function() return addon end } end
    if name == "AceLocale-3.0" then return { GetLocale = function() return locale end } end
end
StaticPopupDialogs = {}
local created, cancelled = 0, 0
C_Timer = { NewTicker = function()
    created = created + 1
    return { Cancel = function() cancelled = cancelled + 1 end }
end }
assert(loadfile("Mechanic/UI/Performance.lua"))("Mechanic", {})
local perf = addon.Perf
-- Sorting must preserve every row and order ties consistently in either direction.
local originalColumn, originalDesc = perf.sortColumn, perf.sortDesc
for _, column in ipairs({ "name", "memory", "memoryPercent", "cpu", "cpuPercent" }) do
    for _, descending in ipairs({ true, false }) do
        for _, count in ipairs({ 0, 1, 2, 64 }) do
            for _, pattern in ipairs({ "ascending", "descending", "mixed", "equal" }) do
                local rows, remaining = {}, {}
                for i = 1, count do
                    local value = i
                    if pattern == "descending" then value = count - i end
                    if pattern == "mixed" then value = (i * 17) % 23 end
                    if pattern == "equal" then value = 7 end
                    local row = { [column] = column == "name" and string.format("Addon%03d", value) or value }
                    rows[i], remaining[row] = row, true
                end
                perf.sortColumn, perf.sortDesc = column, descending
                perf:SortAddonData(rows)
                assert(#rows == count, "sort must preserve row count")
                for i, row in ipairs(rows) do
                    assert(remaining[row], "sort must preserve each row exactly once")
                    remaining[row] = nil
                    if i > 1 then
                        local previous, current = rows[i - 1][column], row[column]
                        if descending then
                            assert(previous >= current, "descending " .. column .. " sort: " .. pattern)
                        else
                            assert(previous <= current, "ascending " .. column .. " sort: " .. pattern)
                        end
                    end
                end
                assert(next(remaining) == nil, "sort must not lose rows")
            end
        end
    end
end
perf.sortColumn, perf.sortDesc = originalColumn, originalDesc
perf.RefreshNavItems, perf.UpdateDisplay, perf.UpdateCPUButtonState = noop, noop, noop
perf.layout = { GetSelectedKey = function() return "general" end }
perf:OnShow()
assert(created == 0, "persisted auto-refresh=false must be respected")
perf:ToggleAutoRefresh()
assert(created == 1 and addon.db.profile.autoRefresh)
perf:OnHide()
assert(cancelled == 1 and not perf.visible and not perf.refreshTimer)
perf:OnShow()
assert(created == 2 and perf.visible, "reopening resumes enabled refresh")
perf:ToggleAutoRefresh()
perf:OnHide()
perf:OnShow()
assert(created == 2, "disabled refresh must remain disabled across tab visits")

FenUI = {
    CreatePanel = function() local f = newFrame(); f.safeZone = newFrame(); return f end,
    CreateStatusRow = function() local f = newFrame(); f.items = {}; return f end,
    CreateTabGroup = function() local f = newFrame(); f.hooks = {}; return f end,
    CreateImageButton = newFrame,
    CreateCheckbox = function()
        local f = newFrame()
        f.label, f.checkmark = newFrame(), newFrame()
        f.boxBg = false
        return f
    end,
    GetColorRGB = function() return 1, 1, 1 end,
    GetColor = function() return 1, 1, 1 end,
}
assert(loadfile("Mechanic/UI/MainFrame.lua"))("Mechanic", {})
addon.GetStatusItems = function() return {} end
addon.UpdateErrorBadge = noop
addon.OnTabChanged = noop -- UI construction is separate from module lifecycle.
perf.frame = newFrame()
local shown, hidden = 0, 0
local onShow, onHide = perf.OnShow, perf.OnHide
perf.OnShow = function(self) shown = shown + 1; onShow(self) end
perf.OnHide = function(self) hidden = hidden + 1; onHide(self) end
addon:CreateMainFrame()
addon.db.profile.autoRefresh = true
perf:OnShow()
addon.frame:Hide()
assert(hidden == 1 and not perf.refreshTimer and not perf.visible, "close must stop selected module")
addon.frame:Show()
assert(shown == 2 and perf.refreshTimer and perf.visible, "reopen must resume selected module")
perf.frame:Hide()
addon.frame:Hide()
assert(hidden == 1, "hidden tabs must not receive parent lifecycle callbacks")
print("Addon regression checks passed")

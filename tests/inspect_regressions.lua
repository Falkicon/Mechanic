-- Run from the repository root: lua tests/inspect_regressions.lua
-- Offline regressions for the in-game Inspect/Console/Errors/Tools/MainFrame modules.
-- Uses recording stubs only; no WoW client required.

local created = 0
local SECRET = setmetatable({}, { __tostring = function() error("secret values must never be stringified") end })

issecretvalue = function(value)
    return value == SECRET
end
unpack = unpack or table.unpack
function wipe(t)
    for k in pairs(t) do t[k] = nil end
    return t
end

---------------------------------------------------------------------------
-- Frame stub: uppercase keys are methods; parents track their children
---------------------------------------------------------------------------
local function newFrame(parent)
    created = created + 1
    local f = { shown = true, scripts = {}, children = {}, text = "" }
    local methods = {
        SetScript = function(self, event, fn) self.scripts[event] = fn end,
        HookScript = function(self, event, fn) self.scripts[event] = fn end,
        Show = function(self) self.shown = true end,
        Hide = function(self) self.shown = false end,
        SetShown = function(self, v) self.shown = v and true or false end,
        IsShown = function(self) return self.shown end,
        IsVisible = function(self) return self.shown end,
        GetWidth = function() return 100 end,
        GetHeight = function() return 20 end,
        GetStringHeight = function() return 10 end,
        GetTextColor = function() return 1, 1, 1, 1 end,
        SetText = function(self, text) self.text = text end,
        GetText = function(self) return self.text end,
        GetParent = function(self) return self.parent end,
        SetParent = function(self, p)
            if self.parent then
                for i, c in ipairs(self.parent.children) do
                    if c == self then table.remove(self.parent.children, i) break end
                end
            end
            self.parent = p
            if p then table.insert(p.children, self) end
        end,
        GetChildren = function(self) return unpack(self.children) end,
        CreateTexture = function(self) return newFrame(self) end,
        CreateFontString = function(self) return newFrame(self) end,
    }
    setmetatable(f, { __index = function(_, key)
        if methods[key] then return methods[key] end
        if type(key) == "string" and key:match("^%u") then return function() end end
    end })
    if parent then
        f.parent = parent
        table.insert(parent.children, f)
    end
    return f
end

CreateFrame = function(_, _, parent) return newFrame(parent) end
UIParent, WorldFrame = newFrame(), newFrame()
GetTime = function() return 0 end
GetMouseFoci = function() return {} end
InCombatLockdown = function() return false end
date = function() return "2026-01-01 00:00:00" end
time = function() return 100 end
IsShiftKeyDown = function() return false end
GameTooltip = newFrame()
ColorPickerFrame = newFrame()

local timers = {}
C_Timer = {
    After = function(_, fn) table.insert(timers, fn) end,
    NewTicker = function()
        local ticker = { cancelled = false }
        ticker.Cancel = function(self) self.cancelled = true end
        return ticker
    end,
}
local function flushTimers()
    local pending = timers
    timers = {}
    for _, fn in ipairs(pending) do fn() end
end

local hooks = {}
hooksecurefunc = function(name, fn) hooks[name] = fn end

FenUI = {
    GetColor = function() return 1, 1, 1, 1 end,
    GetColorRGB = function() return 1, 1, 1 end,
    GetColorHex = function() return "ffffff" end,
    GetFont = function(_, token) return token end,
    GetPixelSize = function() return 1 end,
    SkinScrollFrame = function() end,
    CreateChevron = function() return newFrame() end,
    CreateImageButton = function(_, parent, config)
        local f = newFrame(parent)
        f.config = config
        return f
    end,
    CreateInput = function(_, parent)
        local f = newFrame(parent)
        f.editBox = newFrame(f)
        f.SetText = function(self, text) self.editBox.text = text end
        return f
    end,
    CreateCheckbox = function(_, parent, config)
        local f = newFrame(parent)
        f.label = newFrame(f)
        f.SetLabel = function(self, text) self.label.text = text end
        f.SetChecked = function(self, value) self.checked = value end
        f.config = config
        return f
    end,
    CreateDropdown = function(_, parent)
        local f = newFrame(parent)
        f.button = newFrame(f)
        f.button.text = newFrame(f.button)
        f.SetItems = function(self, items) self.items = items end
        return f
    end,
    CreateToolbar = function(_, parent)
        local f = newFrame(parent)
        for _, name in ipairs({ "AddButton", "AddImageButton", "AddFrame", "AddSpacer" }) do
            f[name] = function() return newFrame(f) end
        end
        return f
    end,
    CreateMultiLineEditBox = function(_, parent) return newFrame(parent) end,
    CreateTree = function(_, parent, config)
        local f = newFrame(parent)
        f.config = config
        f.SetData = function(self, data) self.data = data end
        return f
    end,
    CreateDropdownStub = nil,
}

---------------------------------------------------------------------------
-- Addon/library stubs
---------------------------------------------------------------------------
local prints, logs = {}, {}
local Mechanic = {
    db = { profile = { bufferSize = 5, showTimestamps = false, consoleBufferMax = 3, includeEnvHeader = false } },
    Print = function(_, msg) table.insert(prints, msg) end,
    OnLog = function(_, source, message) table.insert(logs, { source, message }) end,
    UpdateMinimapIcon = function() end,
    Utils = {
        Colors = { Categories = {}, Status = { default = "|cffffffff" } },
        GetOrCreateWidget = function(_, parent, key, creator)
            if parent[key] then return parent[key] end
            parent[key] = creator(parent)
            return parent[key]
        end,
        FormatValue = function() return "" end,
        DetectErrorSource = function(_, msg) return msg:match("^(%w+)") end,
        ShowExportDialog = function() end,
        FormatError = function(_, err) return "error: " .. tostring(err.message) end,
    },
}
local registry = {}
local MechanicLib = {
    GetRegistered = function() return registry end,
    HasCapability = function(_, name, cap) return registry[name] ~= nil and registry[name][cap] ~= nil end,
    GetCapability = function(_, name, cap) return registry[name] and registry[name][cap] end,
    GetWatchList = function() return {} end,
}
local locale = setmetatable({}, { __index = function(_, key) return key end })
LibStub = function(name)
    if name == "AceAddon-3.0" then return { GetAddon = function() return Mechanic end } end
    if name == "AceLocale-3.0" then return { GetLocale = function() return locale end } end
    if name == "MechanicLib-1.0" then return MechanicLib end
end
Mechanic.Utils.ResolveFrameOrTable = function(_, input)
    return input and _G.Holder and require_ns.FrameResolver:ResolvePath(input) or nil
end

local ns = {}
require_ns = ns
local function load(path)
    local chunk = assert(loadfile(path))
    return chunk("Mechanic", ns)
end

load("Mechanic/UI/Shared/FrameResolver.lua")
local FrameResolver, SafeValue = ns.FrameResolver, ns.SafeValue

---------------------------------------------------------------------------
-- FrameResolver: array members round-trip through GetFramePath/ResolvePath
---------------------------------------------------------------------------
local function namedFrame(name, parent, objType)
    local f = { name = name, parent = parent }
    f.GetObjectType = function() return objType or "Frame" end
    f.GetName = function(self) return self.name end
    f.GetParent = function(self) return self.parent end
    return f
end

Holder = namedFrame("Holder")
local arrayChild = namedFrame(nil, Holder)
local keyedChild = namedFrame(nil, Holder)
Holder[3] = arrayChild
Holder.button = keyedChild

assert(FrameResolver:GetFramePath(arrayChild) == "Holder.3", "array member path")
assert(FrameResolver:ResolvePath("Holder.3") == arrayChild, "numeric segment must resolve to the array member")
assert(FrameResolver:ResolvePath("Holder.button") == keyedChild)
assert(FrameResolver:ResolvePath("Holder.missing") == nil)
assert(FrameResolver:GetFramePath(keyedChild) == "Holder.button")
-- A string key shadows the numeric fallback
Holder["4"], Holder[4] = keyedChild, arrayChild
assert(FrameResolver:ResolvePath("Holder.4") == keyedChild)

-- Cached and uncached scans agree, and the cache is released even when the callback fails
local cached = FrameResolver:WithCache(function()
    return FrameResolver:GetFramePath(arrayChild), FrameResolver:GetFramePath(keyedChild)
end)
assert(cached == "Holder.3")
assert(FrameResolver.memberCache == nil)
local ok = pcall(FrameResolver.WithCache, FrameResolver, function() error("boom") end)
assert(not ok and FrameResolver.memberCache == nil, "cache must be released after an error")
assert(FrameResolver:GetDisplayName(arrayChild) == "3")
assert(FrameResolver:GetDisplayName(Holder) == "Holder")
assert(FrameResolver:GetDisplayName({}) == "<table>")

---------------------------------------------------------------------------
-- SafeValue never formats or stringifies secrets
---------------------------------------------------------------------------
assert(SafeValue.ToString(SECRET) == "[secret]")
assert(SafeValue.FormatNumber(SECRET, "%.1f") == "[secret]")
assert(SafeValue.FormatNumber(2.5, "%.1f") == "2.5" and SafeValue.FormatNumber("x", "%d", "?") == "?")
assert(SafeValue.ToString(nil) == "nil" and SafeValue.ToString(3, { numberFormat = "%.1f" }) == "3.0")
local v1, v2, secret = SafeValue.Get({ GetAlpha = function() return SECRET end }, "GetAlpha")
assert(v1 == nil and v2 == nil and secret == true)

---------------------------------------------------------------------------
-- Inspect: SetSelectedFrame isolation, path handling, secret-safe export
---------------------------------------------------------------------------
local Inspect = load("Mechanic/UI/Inspect.lua")
Mechanic.Inspect = Inspect
load("Mechanic/UI/InspectTree.lua")
load("Mechanic/UI/InspectDetails.lua")
load("Mechanic/UI/InspectWatch.lua")

local function inspectableFrame()
    local f = newFrame()
    f.GetObjectType = function() return "Frame" end
    f.GetName = function() return "InspectMe" end
    f.IsObjectType = function() return true end
    f.IsMouseEnabled = function() return true end
    f.GetSize = function() return SECRET, SECRET end
    f.GetEffectiveScale = function() return SECRET end
    f.GetScale = function() return SECRET end
    f.GetAlpha = function() return SECRET end
    f.GetFrameLevel = function() return SECRET end
    f.GetFrameStrata = function() return "MEDIUM" end
    f.GetNumPoints = function() return 1 end
    f.GetPoint = function() return "CENTER", nil, "CENTER", SECRET, 0 end
    f.GetRegions = function()
        local region = newFrame()
        region.GetObjectType = function() return "FontString" end
        region.GetName = function() return nil end
        region.GetText = function() return SECRET end
        return region
    end
    f.GetAttribute = function() return SECRET end
    f.HasScript = function() return true end
    f.GetScript = function() return function() end end
    f.GetText = function() return SECRET end
    return f
end

local selected = inspectableFrame()
Inspect.selectedFrame = selected
local copy = Inspect:GetCopyText(false)
assert(type(copy) == "string" and copy:find("%[secret%]"), "export must survive and mark secret values")

-- One failing panel must not stop the others, and a string path is kept as text
local updated, pathText = {}, nil
Inspect.pathInput = { SetText = function(_, text) pathText = text end }
Inspect.UpdateTree = function() error("tree failed") end
Inspect.Properties = { Update = function() table.insert(updated, "properties") end }
Inspect.UpdateDetails = function() table.insert(updated, "details") end
Inspect:SetSelectedFrame(arrayChild)
assert(#updated == 2 and updated[1] == "properties" and updated[2] == "details", "panels update in isolation")
assert(logs[#logs][2]:find("Tree update failed"), "panel failure must be reported")
Inspect:SetSelectedFrame("Holder.3")
assert(pathText == "Holder.3", "string path must be displayed as text, not as the resolved table")
local stale
Inspect.selectedFrame = nil
Inspect.Properties.Update = function(_, frame) stale = frame end
Inspect:SetSelectedFrame("Holder.button")
assert(stale == keyedChild)

-- Combat guard: protected frames are not editable during lockdown
InCombatLockdown = function() return true end
assert(Inspect:CanModify({ IsProtected = function() return true end }) == false)
assert(Inspect:CanModify({ IsProtected = function() return false end }) == true)
InCombatLockdown = function() return false end
assert(Inspect:CanModify({ IsProtected = function() return true end }) == true)

-- Pick mode stops from OnHide even right after another pick exited
Inspect.pickMode, Inspect.pickBtn = true, { SetActive = function(self, v) self.active = v end }
Inspect.pickExitTime = GetTime()
Inspect:OnHide()
assert(Inspect.pickMode == false and Inspect.pickBtn.active == false)

---------------------------------------------------------------------------
-- InspectDetails: stale sections are hidden when the selection changes
---------------------------------------------------------------------------
Inspect.UpdateDetails = nil
load("Mechanic/UI/InspectDetails.lua")
Inspect:InitializeDetails(newFrame())
local function shownSections()
    local n = 0
    for _, section in ipairs(Inspect.detailSections) do
        if section.shown then n = n + 1 end
    end
    return n
end
Inspect:UpdateDetails(selected)
local fullCount = shownSections()
assert(fullCount >= 6, "a full frame shows many sections, got " .. fullCount)
assert(#Inspect.detailSections >= fullCount, "every created section is tracked in the array")
Inspect:UpdateDetails({})
assert(shownSections() == 2, "a plain table shows only Header and Properties, got " .. shownSections())
Inspect:UpdateDetails(selected)
assert(shownSections() == fullCount, "sections are reused, not duplicated")

---------------------------------------------------------------------------
-- InspectWatch: live updates start and stop with visibility
---------------------------------------------------------------------------
local refreshes = 0
Inspect.watchContent, Inspect.watchParent = newFrame(), newFrame()
Inspect.RefreshWatchList = function() refreshes = refreshes + 1 end
Inspect:StartWatchTicker()
local ticker = Inspect.watchTicker
Inspect:StartWatchTicker()
assert(Inspect.watchTicker == ticker and refreshes == 2, "a single ticker; refresh on every show")
Inspect:StopWatchTicker()
assert(ticker.cancelled and Inspect.watchTicker == nil)

---------------------------------------------------------------------------
-- InspectProperties: rebuilding rows reuses pooled frames
---------------------------------------------------------------------------
local Properties = load("Mechanic/UI/InspectProperties.lua")
Inspect.Properties = Properties
local function editable(alpha)
    local f = newFrame()
    f.IsObjectType = function() return true end
    f.GetObjectType = function() return "Frame" end
    f.GetWidth = function() return 100 end
    f.GetHeight = function() return 50 end
    f.GetAlpha = function() return alpha end
    f.IsShown = function() return true end
    f.GetFrameLevel = function() return 3 end
    f.GetFrameStrata = function() return "HIGH" end
    f.GetScale = function() return SECRET end
    f.SetWidth = function(self, v) self.width = v end
    f.SetAlpha = function(self, v) self.alpha = v end
    return f
end
Properties:Initialize(newFrame())
local a, b = editable(0.5), editable(0.8)
Properties:Update(a)
local afterFirst = created
for _ = 1, 25 do
    Properties:Update(b)
    Properties:Update(a)
end
assert(created == afterFirst, "rebuilding property rows must not create frames (" .. (created - afterFirst) .. " leaked)")
assert(Properties.originalValues.scale == nil, "secret values are left untracked")

-- Edits apply and track; protected frames are refused in combat
Properties:Update(a)
local row = Properties.editBoxRegistry.width
assert(row, "width entry is registered")
InCombatLockdown = function() return true end
a.IsProtected = function() return true end
local before = #prints
Properties:Apply(a, a.SetWidth, 200)
assert(a.width == nil and #prints == before + 1, "protected frame edit refused in combat")
InCombatLockdown = function() return false end
assert(Properties:Apply(a, a.SetWidth, 200) and a.width == 200)
assert(Properties:Apply(a, function() error("invalid") end) == false, "setter errors are caught")

-- Reset clears pending changes
Properties:TrackChange("width", 200)
assert(Properties.pendingChanges.width)
Properties:ResetChanges()
assert(next(Properties.pendingChanges) == nil and a.width == 100, "reset restores and clears tracking")

---------------------------------------------------------------------------
-- Console
---------------------------------------------------------------------------
load("Mechanic/UI/Console.lua")
local Console = Mechanic.Console
Console:OnLog("Addon", 42)
Console:OnLog(nil, SECRET, SECRET)
Console:OnLog("Addon", "hello")
Console:OnLog("Addon", "hello")
Console:OnLog("Other", "hello")
assert(Console.count == 5)
local first = Console.buffer[1]
assert(first.message == "42" and type(first.category) == "string", "non-string logs are coerced")
assert(Console.buffer[2].message == "[secret]" and Console.buffer[2].source == "Unknown")

Console.filters.search = "4"
assert(#Console:ApplyFilters() == 1, "search must not throw on coerced entries")
Console.filters.search = ""
Console.dedupMode = "all"
assert(#Console:ApplyFilters() == 4, "dedup all keeps first of identical source/message")
Console.dedupMode = "adjacent"
local adjacent = Console:ApplyFilters()
assert(#adjacent == 4 and adjacent[3].count == 2, "adjacent dedup folds repeats")
Console.dedupMode = nil
for i = 1, Console.count do
    assert(Console.buffer[i].count == nil, "dedup must not mutate shared buffer entries")
end
assert(not Console:FormatEntries(Console:ApplyFilters()):find("%(x"), "no stale repeat counts")

-- Ring buffer wraps, resizes and persists in chronological order
for i = 1, 7 do Console:OnLog("Ring", "m" .. i) end
assert(Console.count == 5)
local seen = {}
Console:IterateBuffer(function(entry) table.insert(seen, entry.message) end)
assert(table.concat(seen, ",") == "m3,m4,m5,m6,m7")
Console:SetBufferSize(3)
seen = {}
Console:IterateBuffer(function(entry) table.insert(seen, entry.message) end)
assert(table.concat(seen, ",") == "m5,m6,m7" and Mechanic.db.profile.bufferSize == 3)
Mechanic.db.profile.consoleBufferMax = 2
Console:PersistBuffer()
assert(#Mechanic.db.profile.consoleBuffer == 2 and Mechanic.db.profile.consoleBuffer[1].message == "m6")
Console:Clear()
Console:RestoreBuffer()
seen = {}
Console:IterateBuffer(function(entry) table.insert(seen, entry.message) end)
assert(table.concat(seen, ",") == "m6,m7", "restore replays saved entries")

-- print capture uses a post-hook, parses the [Source] prefix, and never raises
Console:Clear()
local originalPrint = print
Console:OnEnable()
assert(print == originalPrint, "print must not be replaced")
assert(hooks.print, "print is hooked with hooksecurefunc")
hooks.print("|cff00ff00[MyAddon]|r hello", 5, SECRET)
local entry = Console.buffer[1]
assert(entry.source == "MyAddon" and entry.message == "hello 5 [secret]" and entry.category == "[Print]")
hooks.print("plain text")
assert(Console.buffer[2].source == "Print")
Console:OnDisable()
hooks.print("muted")
assert(Console.count == 2, "disabled console ignores print")

-- Refreshes are coalesced
Console.frame = newFrame()
Console.logDisplay = newFrame()
flushTimers() -- settle refreshes scheduled by the earlier log calls
timers = {}
Console:OnLog("Burst", "a")
Console:OnLog("Burst", "b")
Console:OnLog("Burst", "c")
assert(#timers == 1, "one scheduled redraw for a burst of log lines")
flushTimers()

---------------------------------------------------------------------------
-- Errors: session dropdown, source list, hidden-tab updates
---------------------------------------------------------------------------
local errorList = {
    { session = 1, message = "Alpha\\core.lua:1: boom" },
    { session = 1, message = "Alpha\\core.lua:2: boom" },
    { session = 1, message = "Beta\\core.lua:3: boom" },
}
BugGrabber = {
    GetSessionId = function() return 1 end,
    GetDB = function() return errorList end,
}
EventRegistry = { RegisterCallback = function() end }
load("Mechanic/UI/Errors.lua")
local Errors = Mechanic.Errors

-- Core enables the module before any UI exists
Errors:OnEnable()
assert(Errors.enabled)
local sessionItems
local layoutItems
local tabContent = newFrame()
Mechanic.frame = { moduleContent = tabContent }
local baseDropdown = FenUI.CreateDropdown
FenUI.CreateDropdown = function(...)
    local d = baseDropdown(...)
    d.SetValue = function() end
    d.SetItems = function(_, items) sessionItems = items end
    return d
end
ns.SplitNavLayout = {
    Create = function()
        return { contentArea = newFrame(), SetItems = function(_, items) layoutItems = items end }
    end,
}
Mechanic:InitializeErrors()
assert(sessionItems and #sessionItems >= 2, "session dropdown is filled even when enabled before the UI existed")
assert(#Errors.errors == 3)

local function labels(items)
    local out = {}
    for _, item in ipairs(items) do out[item.key] = item.text end
    return out
end
Errors.selectedSource = "Alpha"
Errors:RefreshErrors()
assert(#Errors.errors == 2)
Errors:RefreshSourceList()
local listed = labels(layoutItems)
assert(listed.Alpha and listed.Beta and listed.all:find("3"), "other sources stay listed while one is selected")

-- Hidden tab: a new error must not format/redraw
Errors.frame.shown = false
Errors.editBox.text = "unchanged"
Errors:OnBugGrabbed("BugGrabber.BugGrabbed", {})
assert(Errors.editBox.text == "unchanged", "hidden Errors tab is not redrawn")

-- Missing BugGrabber keeps the install hint instead of "no errors"
BugGrabber = nil
_G.BugGrabber = nil
Errors:UpdateDisplay()
assert(Errors.editBox.text:find("BugGrabber"), "install message survives OnShow/UpdateDisplay")

---------------------------------------------------------------------------
-- Tools: panels are built once and rebuilt only when the provider changes
---------------------------------------------------------------------------
load("Mechanic/UI/Tools.lua")
local Tools = Mechanic.Tools
local contentFrames = {}
Tools.layout = {
    GetContentFrame = function(_, key)
        contentFrames[key] = contentFrames[key] or newFrame()
        return contentFrames[key]
    end,
}
local builds, destroys = 0, 0
local toolsV1 = {
    createPanel = function(parent) builds = builds + 1 newFrame(parent) end,
    destroyPanel = function() destroys = destroys + 1 end,
}
registry.Provider = { tools = toolsV1 }
Tools:OnAddonSelected("Provider")
Tools:OnAddonSelected("Provider")
Tools:OnAddonSelected("Provider")
assert(builds == 1 and destroys == 0, "re-selecting a tool panel must not rebuild it")
local toolsV2 = { createPanel = toolsV1.createPanel, destroyPanel = toolsV1.destroyPanel }
registry.Provider = { tools = toolsV2 }
Tools:OnAddonSelected("Provider")
assert(builds == 2 and destroys == 1, "a changed registration replaces the panel")
assert(#contentFrames.Provider.children == 1, "old panel frames are detached")

---------------------------------------------------------------------------
-- MainFrame: table-driven tab switching
---------------------------------------------------------------------------
load("Mechanic/UI/MainFrame.lua")
local events = {}
local function module(name)
    local m = { frame = newFrame() }
    m.OnShow = function() table.insert(events, name .. ":show") end
    m.OnHide = function() table.insert(events, name .. ":hide") end
    return m
end
Mechanic.db.profile.activeTab = "console"
Mechanic.Console = module("console")
Mechanic.Tests = nil
Mechanic.InitializeTests = function(self)
    table.insert(events, "init:tests")
    self.Tests = module("tests")
end
Mechanic:OnTabChanged("tests")
assert(events[#events] == "tests:show" and events[1] == "console:hide")
local initCount = 0
for _, e in ipairs(events) do if e == "init:tests" then initCount = initCount + 1 end end
assert(initCount == 1 and Mechanic.db.profile.activeTab == "tests")
Mechanic:OnTabChanged("tests") -- same tab: no-op
Mechanic:OnTabChanged("unknown") -- unknown tab hides modules but must not error
assert(Mechanic.Tests.frame.shown == false and Mechanic.Console.frame.shown == false)

---------------------------------------------------------------------------
-- Tests tab: third-party providers are untrusted
---------------------------------------------------------------------------
load("Mechanic/UI/Tests.lua")
local Tests = Mechanic.Tests
Mechanic.SyncAllAddonData = function() end
Mechanic.GetEnvironmentHeader = function() return "ENV" end
Mechanic.Utils.ShowHelpDialog = function() end
for _, color in ipairs({ "not_run", "pass", "fail", "pending", "warn", "default" }) do
    Mechanic.Utils.Colors.Status[color] = "|cffffffff"
end

registry = {} -- providers from the Tools section are unrelated to this one
local getAllCalls = 0
local ranIds = {}
registry.Zeta = {
    tests = {
        getCategories = function() return { "Core" } end,
        getAll = function()
            getAllCalls = getAllCalls + 1
            return {
                { id = "sync:fast", name = "colon id", category = "Core" },
                { def = { id = "plain", name = "wrapped", category = "Core", type = "manual" } },
                "not a table",
            }
        end,
        getResult = function(id) return id == "plain" and { passed = true, duration = 0.5 } or nil end,
        run = function(id) table.insert(ranIds, id) return { passed = true } end,
    },
}
registry.Alpha = {
    tests = {
        getCategories = function() error("provider exploded") end,
        getAll = function() error("provider exploded") end,
        getResult = function() error("provider exploded") end,
        runAll = function() error("runAll exploded") end,
        clearResults = function() error("clear exploded") end,
    },
}
registry.Mid = {
    tests = {
        getCategories = function() return { "Sync" } end,
        getAll = function() return { { id = "a", name = "A", category = "Sync" } } end,
        runAll = function() return 2, 3 end,
    },
}

Mechanic.frame = { moduleContent = newFrame() }
Mechanic:InitializeTests()
local tree = Tests.tree.data
assert(#tree == 3 and tree[1].text == "Alpha" and tree[2].text == "Mid" and tree[3].text == "Zeta", "stable alphabetical order")
assert(#tree[1].children == 0, "a throwing provider yields an empty node, not an error")

-- getAll runs once per addon per tree build, however many categories it has
getAllCalls = 0
Tests:BuildTree()
assert(getAllCalls == 1, "getAll called once per pass, got " .. getAllCalls)

-- Ids containing ":" select correctly; categories and addon nodes are inert
local zeta = tree[3]
assert(zeta.children[1].children[1].value == "t:Zeta:sync:fast")
local onSelect = Tests.tree.config.onSelect
onSelect("t:Zeta:sync:fast")
assert(Tests.selectedAddon == "Zeta" and Tests.selectedTest == "sync:fast")
onSelect("c:Zeta:Core")
onSelect("a:Zeta")
assert(Tests.selectedTest == "sync:fast", "category/addon nodes must not change the selection")
Tests:OnTestSelected("Zeta", "missing")
assert(Tests.selectedTest == "sync:fast", "unknown ids must not become the selection")
Tests:RunSelected()
assert(ranIds[1] == "sync:fast")

-- Summary and export tolerate failing providers and stay deterministic
Tests:UpdateSummary()
assert(Tests.summaryLabel.text:find("Total: 3"), "summary counts tests from healthy providers")
local report = Tests:GetCopyText(true)
assert(report:find("Result: 1/3 passed"), "header summary reuses the same totals")
assert(report:find("Zeta > Core") and report:find("%[PASS%] wrapped"))
assert(report == Tests:GetCopyText(true), "export output is stable")
local exportedTitle
Mechanic.Utils.ShowExportDialog = function(_, title) exportedTitle = title end
Tests.selectedAddon = "Zeta"
Tests:Export()
assert(exportedTitle:find("All") and not exportedTitle:find("Zeta"), "export title reflects the full export")

-- Run All: a throwing runAll is reported, others still count; clearing survives errors
local before = #prints
Tests:RunAllAuto()
assert(prints[before + 1]:find("runAll exploded"), "provider error surfaced to the user")
assert(prints[#prints]:find("3/4"), "healthy providers' totals still counted")
assert(#ranIds >= 2 and ranIds[#ranIds] == "sync:fast", "fallback runs auto tests only")
Tests:ClearResults()

print("inspect regressions passed")

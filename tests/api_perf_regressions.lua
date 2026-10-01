-- Run from the repository root: lua tests/api_perf_regressions.lua
-- Offline checks for the API test bench and Performance tab logic; no WoW client required.
local function noop() end

wipe = function(t)
    for k in pairs(t) do t[k] = nil end
    return t
end
date = function() return "2026-09-30 12:00:00" end
GetTime = function() return 1000 end
local clock = 0
debugprofilestop = function() clock = clock + 3; return clock end

local addon = { db = { profile = {} } }
addon.Utils = {
    SafeCall = function(_, func, ...)
        local results = { pcall(func, ...) }
        local ok = table.remove(results, 1)
        return ok, results
    end,
    CountSecrets = function() return 0 end,
}
addon.GetEnvironmentHeader = function() return nil end
local locale = setmetatable({}, { __index = function(_, key) return key end })
LibStub = function(name)
    if name == "AceAddon-3.0" then return { GetAddon = function() return addon end } end
    if name == "AceLocale-3.0" then return { GetLocale = function() return locale end } end
end
StaticPopupDialogs = {}
local popups = {}
StaticPopup_Show = function(which, text, _, data) popups[#popups + 1] = { which = which, text = text, data = data } end
local timers = {}
C_Timer = {
    After = function(_, fn) timers[#timers + 1] = fn end,
    NewTicker = function() return { Cancel = noop } end,
}

local calls = {}
local function tracked(name)
    return function() calls[name] = (calls[name] or 0) + 1; return name end
end

local ns = { APIDefinitions = {}, APICategoryLookup = {} }
local defs = ns.APIDefinitions
local function define(key, extra)
    local def = { key = key, name = key:match("([^%.]+)$"), funcPath = key, params = {}, returns = {}, category = "combat_midnight" }
    for k, v in pairs(extra or {}) do def[k] = v end
    defs[key] = def
    return def
end
local NS_FUNCS = {}
_G.T = NS_FUNCS
for i = 1, 40 do
    NS_FUNCS["GetThing" .. i] = tracked("T.GetThing" .. i)
    define("T.GetThing" .. i)
end
NS_FUNCS.SetThing, NS_FUNCS.Protected, NS_FUNCS.Logout = tracked("T.SetThing"), tracked("T.Protected"), tracked("T.Logout")
define("T.SetThing")
define("T.Protected", { protected = true })
define("T.Logout")
define("Other.GetElsewhere", { category = "combat_midnight" })

assert(loadfile("Mechanic/UI/API.lua"))("Mechanic", ns)
local api = addon.API

-- Namespace comes from the key; category is only a topic bucket shared across namespaces.
assert(api.GetAPINamespace("C_Spell.GetSpellInfo") == "C_Spell")
assert(api.GetAPINamespace("UnitHealth") == "Global")
local report = api:GetCategoryReport("T")
assert(report:find("T.GetThing1", 1, true) and not report:find("Other.GetElsewhere", 1, true),
    "namespace report must not include other namespaces from the same category bucket")
addon.API.selectedAPI = "Other.GetElsewhere"
local copy = api:GetCopyText()
assert(copy:find("Other.GetElsewhere", 1, true) and not copy:find("T.GetThing1", 1, true), "copy text follows the namespace")

-- Search keys are lowercased once and cover both key and display name.
assert(api.BuildSearchKey("C_Spell.GetSpellInfo", "GetSpellInfo") == "c_spell.getspellinfo")
local widened = api.BuildSearchKey("Global.Foo", "Bar")
assert(widened:find("global.foo", 1, true) and widened:find("bar", 1, true))

-- Function resolution is lazy: eager func wins, otherwise funcPath is walked at call time.
local eager = function() end
assert(api.ResolveAPIFunc({ func = eager, funcPath = "Missing.Path" }) == eager)
assert(api.ResolveAPIFunc({ funcPath = "Late.Namespace.Fn" }) == nil, "namespace not loaded yet")
_G.Late = { Namespace = { Fn = eager } }
assert(api.ResolveAPIFunc({ funcPath = "Late.Namespace.Fn" }) == eager, "resolved once the namespace exists")
assert(api.ResolveAPIFunc({ key = "Late.Namespace.Fn" }) == eager, "falls back to key")
assert(api.ResolveAPIFunc({ funcPath = "Late.Namespace.Fn.Deeper" }) == nil)
assert(api.ResolveAPIFunc(nil) == nil)
_G.Late = nil

-- Batch runs only call read-only APIs.
for _, key in ipairs({ "Logout", "Quit", "ForceQuit", "DeleteCursorItem", "ReloadUI", "SetCVar", "C_PartyInfo.LeaveParty",
    "C_CVar.SetCVar", "UnitSetRole", "Getaway", "T.SetThing" }) do
    assert(not api.IsBatchSafeAPI(key), key .. " must not run in a batch")
end
for _, key in ipairs({ "UnitHealth", "C_Spell.GetSpellInfo", "IsLoggedIn", "C_Item.HasItem", "GetNumGroupMembers" }) do
    assert(api.IsBatchSafeAPI(key), key .. " is read-only")
end

-- Secret values are never indexed, measured, or stored.
local SECRET = setmetatable({}, { __len = function() error("measured a secret") end, __index = function() error("indexed a secret") end })
issecretvalue = function(value) return value == SECRET end
issecrettable = nil
local serialized = api.SerializeForSV({ plain = 1, hidden = SECRET, text = "ok", nested = { SECRET } })
assert(serialized.plain == 1 and serialized.text == "ok")
assert(serialized.hidden == "<secret>" and serialized.nested[1] == "<secret>")
assert(api.SerializeForSV(SECRET) == "<secret>")
assert(#api.SerializeForSV(string.rep("x", 5000)) < 1100, "long strings are truncated")
local secretTable = {}
issecrettable = function(value) return value == secretTable end
assert(api.SerializeForSV(secretTable) == "<secret>")
issecrettable = nil
-- A failing check must not escape SaveAPIResult
issecretvalue = function() error("boom") end
api:SaveAPIResult("T.GetThing1", { success = true, results = { 1, "a" }, duration = 1, timestamp = 1, params = {} })
assert(addon.db.profile.apiTests["T.GetThing1"].results[1] == 1, "erroring secret check degrades to normal serialization")
issecretvalue = function(value) return value == SECRET end
issecrettable = function() error("boom") end
api:SaveAPIResult("T.GetThing2", { success = true, results = { {} }, duration = 1, timestamp = 1, params = {} })
assert(addon.db.profile.apiTests["T.GetThing2"].results == "<unserializable>", "serializer failures are contained")
issecrettable = nil
-- CountSecrets failures are contained too
addon.Utils.CountSecrets = function() error("boom") end
api:SaveAPIResult("T.GetThing3", { success = true, results = { 1 }, duration = 1, timestamp = 1, params = {} })
assert(addon.db.profile.apiTests["T.GetThing3"].secretCount == 0)
addon.Utils.CountSecrets = function() return 0 end

-- Namespace runs need confirmation, skip unsafe/protected APIs, and are time-sliced.
api:RunNamespace("T")
assert(#popups == 1 and popups[1].which == "MECHANIC_API_RUN_NAMESPACE", "confirmation is required")
assert(next(calls) == nil, "nothing runs before confirmation")
local plan = popups[1].data
assert(#plan.keys == 40 and plan.protectedCount == 1 and plan.unsafeCount == 2 and plan.total == 43)
assert(popups[1].text:find("40 read-only", 1, true))
StaticPopupDialogs["MECHANIC_API_RUN_NAMESPACE"].OnAccept(nil, plan)
assert(api.nsRun, "run is in progress after accepting")
local steps = 0
while #timers > 0 do
    steps = steps + 1
    assert(steps < 200, "run must terminate")
    table.remove(timers, 1)()
end
assert(steps > 1, "a large batch is split across frames")
assert(api.nsRun == nil)
local executed = 0
for name in pairs(calls) do
    executed = executed + 1
    assert(name:find("^T%.GetThing"), name .. " must not be called by a batch")
end
assert(executed == 40, "every read-only API runs exactly once")
api:RunNamespace("T")
api:RunNamespace("T") -- second request while the popup is unanswered is just another confirmation
assert(#popups == 3)

-- Performance: CPU rates are per-interval deltas and row data is reused.
local perfAddon = addon
assert(loadfile("Mechanic/UI/Performance.lua"))("Mechanic", {})
local perf = perfAddon.Perf
assert(perf.EnableEventTracking and perf.DisableEventTracking, "legacy Core.lua call stays safe")
local entries = { { name = "A", cpuRaw = 100 }, { name = "B", cpuRaw = 0 } }
assert(perf:UpdateCPURates(entries, 10) == 0, "first sample only sets the baseline")
entries[1].cpuRaw, entries[2].cpuRaw = 150, 10
assert(perf:UpdateCPURates(entries, 11) == 60)
assert(entries[1].cpu == 50 and entries[2].cpu == 10, "ms/s over the sample window")
entries[1].cpuRaw = 400
assert(perf:UpdateCPURates(entries, 11.2) == 60 and entries[1].cpu == 50, "rapid samples reuse the last rates")
assert(perf:UpdateCPURates(entries, 12) == 250, "the window resumes from the last real sample")
entries[1].cpuRaw = 5
perf:UpdateCPURates(entries, 13)
assert(entries[1].cpu == 0, "a counter reset never yields a negative rate")
perf:ResetCPURates()
assert(perf:UpdateCPURates(entries, 14) == 0, "reset restarts the baseline")

local loaded = { true, true, true }
C_AddOns = {
    GetNumAddOns = function() return 3 end,
    IsAddOnLoaded = function(i) return loaded[i] end,
    GetAddOnInfo = function(i) return "Addon" .. i end,
}
UpdateAddOnMemoryUsage, UpdateAddOnCPUUsage = noop, noop
GetAddOnMemoryUsage = function(i) return i * 100 end
GetAddOnCPUUsage = function(i) return i end
GetCVarBool = function() return false end
local first = perf:CollectAddonData()
local firstRow = first[1]
assert(#first == 3 and first[3].memoryPercent > first[1].memoryPercent)
loaded[3] = false
local second = perf:CollectAddonData()
assert(second == first and second[1] == firstRow, "collection reuses its tables")
assert(#second == 2 and second[3] == nil, "unloaded addons are trimmed")
print("API/Performance regression checks passed")

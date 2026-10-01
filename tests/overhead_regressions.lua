-- Run from repo root: lua tests/overhead_regressions.lua
-- Main-addon target guards and passive owned-ticker snapshot; no live client.
local addon = {}
local registry = {}
local mechanicLib = {
    GetRegistered = function() return registry end,
    HasCapability = function() return false end,
    GetCapability = function() end,
    Categories = {PERF = "[Perf]"},
    Log = function() end,
}
local locale = setmetatable({}, {__index = function(_, key) return key end})
LibStub = function(name)
    if name == "AceAddon-3.0" then return {NewAddon = function() return addon end} end
    if name == "AceLocale-3.0" then return {GetLocale = function() return locale end} end
    if name == "MechanicLib-1.0" then return mechanicLib end
end
C_AddOns = {GetAddOnMetadata = function() return "test" end}
local pending = {}
local timers = 0
C_Timer = {
    After = function(_, callback) pending[#pending + 1] = callback end,
    NewTicker = function() timers = timers + 1; return {} end,
}
time = function() return 123 end
date = function() return "2026-09-05 12:00:00" end
GetTime = function() return 1 end
string.trim = function(s) return (s:gsub("^%s+", ""):gsub("%s+$", "")) end
debugprofilestop = function() return 5 end
UnitName = function() return "Player" end
GetRealmName = function() return "Realm" end
local ns = {
    Utils = {FormatMemory = function(_, kb) return string.format("%.1f KB", kb) end},
    APIDefinitions = {KnownAPI = {}},
}
assert(loadfile("Mechanic/Core.lua"))("Mechanic", ns)
addon.Print = function() end
local profile = "Chosen"
addon.db = {profile = {}, GetCurrentProfile = function() return profile end}
addon.perf = {blocks = {hubSync = 2.5}}
addon.Perf = {blocks = {uiRefresh = 1.5}, refreshTimer = {IsCancelled = function() return false end}}
addon.Inspect = {watchTicker = {IsCancelled = function() return true end}}
local snapshot = addon:GetDiagnosticOverheadSnapshot()
assert(snapshot.active_tickers == 1 and snapshot.perf_ticker_active and not snapshot.inspect_ticker_active)
assert(snapshot.hub_sync_ms == 2.5 and snapshot.ui_refresh_ms == 1.5 and snapshot.captured_at == 123)
addon.Inspect.watchTicker = {}
assert(addon:GetDiagnosticOverheadSnapshot().active_tickers == 2)
addon:SyncAllAddonData()
assert(addon.db.profile.diagnosticOverhead.active_tickers == 2)
addon:OnPlayerLogout()
assert(addon.db.profile.diagnosticOverhead.captured_at == 123)
assert(timers == 0 and #pending == 0, "overhead snapshot must not schedule work")

local executed = 0
addon.API = {ExecuteAPITest = function() executed = executed + 1; return {success = true} end}
MECHANIC_DIAGNOSTIC_TARGET = {character = "Other - Realm", profile = "Chosen"}
MECHANIC_API_QUEUE = {{api = "KnownAPI"}}
MECHANIC_LUA_QUEUE = {{code = "1 + 1"}}
addon:ProcessAPITestQueue()
addon:ProcessLuaEvalQueue()
assert(#pending == 0 and MECHANIC_API_QUEUE == nil and MECHANIC_LUA_QUEUE == nil)
MECHANIC_DIAGNOSTIC_TARGET = {character = "Player - Realm", profile = "Chosen"}
MECHANIC_API_QUEUE = {{api = "KnownAPI"}}
MECHANIC_LUA_QUEUE = {{code = "1 + 1"}}
addon:ProcessAPITestQueue()
addon:ProcessLuaEvalQueue()
assert(#pending == 2)
profile = "OtherProfile"
pending[1](); pending[2]()
assert(executed == 0 and addon.db.profile.luaEvalResults == nil, "profile switch must block delayed queues")
profile = "Chosen"
addon:ExecuteAPITestQueue({{api = "KnownAPI"}}, MECHANIC_DIAGNOSTIC_TARGET)
assert(executed == 1)
UnitName = function() return nil end
assert(not addon:DiagnosticTargetMatches(MECHANIC_DIAGNOSTIC_TARGET), "unknown identity must fail closed")

-- A third-party callback that throws must not abort the hub sync (or PLAYER_LOGOUT).
local sharedResult = {passed = true}
registry.Good = {
    version = "1.0",
    getDebugBuffer = function() local b = {} for i = 1, 60 do b[i] = "l" .. i end return b end,
    tests = {
        getAll = function() return {{id = "t1", name = "T One", category = "Cat"}} end,
        getResult = function() return sharedResult end,
    },
}
registry.Bad = {
    version = "2.0",
    getDebugBuffer = function() error("boom") end,
    tests = {getAll = function() error("tests boom") end, getResult = function() end},
    performance = {getSubMetrics = function() error("perf boom") end},
}
mechanicLib.HasCapability = function(_, name, capability) return name == "Bad" and capability == "performance" end
mechanicLib.GetCapability = function(_, name) return registry[name].performance end
addon.db.profile.addonData = {Stale = {version = "0"}, Bad = {logs = {"kept"}}}
addon.db.profile.healthLog = {}
addon:SyncAllAddonData()
local hub = addon.db.profile.addonData
assert(#hub.Good.logs == 50 and hub.Good.logs[1] == "l11", "debug buffers keep the last 50 lines")
assert(hub.Good.tests.t1.category == "Cat" and hub.Good.tests.t1.name == "T One")
assert(sharedResult.category == nil and sharedResult.name == nil, "registered addon result tables must not be mutated")
assert(hub.Stale == nil, "addons that are no longer registered are pruned")
assert(hub.Bad.logs[1] == "kept" and hub.Bad.version == "2.0", "failed callbacks keep previous data")
assert(#addon.db.profile.healthLog == 3, "each failing callback is recorded in the health log")
addon:OnPlayerLogout()
registry.Good, registry.Bad = nil, nil

-- Slash commands: unknown input lists only real commands; gc formats numbers, not strings.
local printed = {}
addon.Print = function(_, message) printed[#printed + 1] = message end
addon:SlashCommand("bogus")
assert(printed[1]:find("bogus", 1, true), "unknown command is echoed")
local help = printed[2]
assert(help and help:find("gc", 1, true) and not help:find("copy", 1, true), "help must not advertise unhandled commands")
printed = {}
addon:SlashCommand("gc")
assert(printed[1]:match("^GC: %-?%d+%.%d KB freed"), "gc output must be formatted from numbers")
assert(addon.ToggleMainFrame and addon.Toggle == nil)

-- Keybinding bodies may only call methods that exist on the addon.
local bindings = assert(io.open("Mechanic/Bindings.xml", "rb")):read("*a")
for method in bindings:gmatch("Mechanic:(%w+)%(") do
    assert(type(addon[method]) == "function", "Bindings.xml calls missing Mechanic:" .. method)
end

-- Settings.OpenToCategory needs the category id AceConfigDialog stores on the panel frame.
local opened
ns.Utils.OpenSettings = function(_, category) opened = category end
addon.optionsFrame = {name = 42}
addon:OpenSettings()
assert(opened == 42)
addon.optionsFrame = nil
addon:OpenSettings()
assert(opened == "!Mechanic")

-- Lua eval fallback executor must survive secret values and hostile __tostring.
MECHANIC_DIAGNOSTIC_TARGET = nil
SECRETVAL = "s3cret"
issecretvalue = function(value) return value == SECRETVAL end
addon.db.profile.luaEvalResults = nil
addon:ExecuteLuaEvalQueue({
    {label = "secret", code = "SECRETVAL"},
    {label = "hostile", code = "{setmetatable({}, {__tostring = function() error('no') end})}"},
    {label = "raised", code = "error(setmetatable({}, {__tostring = function() error('no') end}))"},
})
local evalResults = addon.db.profile.luaEvalResults.results
assert(evalResults[1].success and evalResults[1].result == "[secret]")
assert(evalResults[2].success and evalResults[2].result == "{1=[unprintable]}")
assert(evalResults[3].success == false and evalResults[3].error == "Runtime error: [unprintable]")
issecretvalue = nil

-- The deferred API queue moves from the bootstrap namespace to the main addon exactly once.
local deferred = {{api = "KnownAPI"}}
Mechanic = {}
MechanicNS = {pendingAPIQueue = deferred}
assert(loadfile("Mechanic/Core.lua"))("Mechanic", ns)
assert(addon.pendingAPIQueue == deferred and MechanicNS.pendingAPIQueue == nil)
print("Overhead and main-addon queue guard regressions passed")

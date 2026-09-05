-- Run from repo root: lua tests/overhead_regressions.lua
-- Main-addon target guards and passive owned-ticker snapshot; no live client.
local addon = {}
LibStub = function(name)
    if name == "AceAddon-3.0" then return {NewAddon = function() return addon end} end
    if name == "AceLocale-3.0" then return {GetLocale = function() return {} end} end
    if name == "MechanicLib-1.0" then return {GetRegistered = function() return {} end} end
end
C_AddOns = {GetAddOnMetadata = function() return "test" end}
local pending = {}
local timers = 0
C_Timer = {
    After = function(_, callback) pending[#pending + 1] = callback end,
    NewTicker = function() timers = timers + 1; return {} end,
}
time = function() return 123 end
debugprofilestop = function() return 5 end
UnitName = function() return "Player" end
GetRealmName = function() return "Realm" end
local ns = {Utils = {}, APIDefinitions = {KnownAPI = {}}}
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
print("Overhead and main-addon queue guard regressions passed")

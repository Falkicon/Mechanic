-- MechanicLib.lua
-- Minimal library for addon integration with !Mechanic
--
-- This library is embedded in consuming addons via lib_sync.
-- See PLAN/MASTER_PLAN.md for full API specification.
--
-- Implementation: Phase 1 (PLAN/01-foundation.plan.md)

local MAJOR, MINOR = "MechanicLib-1.0", 2
local MechanicLib = LibStub:NewLibrary(MAJOR, MINOR)
if not MechanicLib then return end

-- Storage
MechanicLib.registered = MechanicLib.registered or {}
MechanicLib.watchList = MechanicLib.watchList or {}

--------------------------------------------------------------------------------
-- Developer Mode Detection (replaces DevMarker.lua pattern)
--------------------------------------------------------------------------------

--- Check if !Mechanic is installed and loaded.
--- Use this instead of DevMarker.lua for showing debug UI.
---@return boolean enabled True if !Mechanic is available
function MechanicLib:IsEnabled()
    return _G.Mechanic ~= nil
end

--------------------------------------------------------------------------------
-- Registration API
--------------------------------------------------------------------------------

-- Capabilities Interface Contract:
-- {
--     version = "1.0.0",
--     getDebugBuffer = function(),
--     clearDebugBuffer = function(),
--     tests = {
--         getAll = function(),        -- returns { {id, def}, ... }
--         getCategories = function(), -- returns { "cat", ... }
--         run = function(id),
--         runAll = function(),
--         getResult = function(id),   -- returns test result table
--     },
--     settings = { ... }
-- }

-- Test Result Contract (Phase 5):
-- {
--     passed = true/false/nil,
--     message = "Summary",
--     duration = 0.003,
--     logs = { "line", ... },
--     details = { -- Optional structured diagnostics
--         {
--             label = "API Name",
--             value = "Result",
--             status = "pass" | "warn" | "fail" | nil
--         },
--         ...
--     }
-- }

--- Register an addon with Mechanic.
--- See PLAN/MASTER_PLAN.md for capabilities interface.
---@param addonName string The addon's name
---@param capabilities table Registration capabilities
function MechanicLib:Register(addonName, capabilities)
    self.registered[addonName] = capabilities
    if _G.Mechanic and _G.Mechanic.OnAddonRegistered then
        _G.Mechanic:OnAddonRegistered(addonName, capabilities)
    end
end

--- Unregister an addon.
---@param addonName string The addon's name
function MechanicLib:Unregister(addonName)
    self.registered[addonName] = nil
    if _G.Mechanic and _G.Mechanic.OnAddonUnregistered then
        _G.Mechanic:OnAddonUnregistered(addonName)
    end
end

--------------------------------------------------------------------------------
-- Inspect & Watch API (Phase 8)
--------------------------------------------------------------------------------

--- Add a frame or path to the Mechanic watch list.
---@param frameOrPath Frame|string The frame reference or a path string (e.g. "PlayerFrame.health")
---@param label string? A descriptive label for the watch item
---@param options table? Optional configuration (e.g. { source = "MyAddon" })
function MechanicLib:AddToWatchList(frameOrPath, label, options)
    local key = tostring(frameOrPath)
    self.watchList[key] = {
        target = frameOrPath,
        label = label or key,
        source = options and options.source or "Manual",
        timestamp = GetTime(),
    }

    if _G.Mechanic and _G.Mechanic.OnWatchListChanged then
        _G.Mechanic:OnWatchListChanged()
    end
end

--- Remove a frame or path from the watch list.
---@param frameOrPath Frame|string The frame reference or path string to remove
function MechanicLib:RemoveFromWatchList(frameOrPath)
    local key = tostring(frameOrPath)
    if self.watchList[key] then
        self.watchList[key] = nil
        if _G.Mechanic and _G.Mechanic.OnWatchListChanged then
            _G.Mechanic:OnWatchListChanged()
        end
    end
end

--- Get the current watch list.
---@return table watchList The internal watch list table
function MechanicLib:GetWatchList()
    return self.watchList
end

--------------------------------------------------------------------------------
-- Logging API
--------------------------------------------------------------------------------

--- Standard log categories
MechanicLib.Categories = {
    TRIGGER = "[Trigger]",
    REGION = "[Region]",
    API = "[API]",
    COOLDOWN = "[Cooldown]",
    EVENT = "[Event]",
    VALIDATION = "[Validation]",
    SECRET = "[Secret]",
    PERF = "[Perf]",
    LOAD = "[Load]",
    CORE = "[Core]",
}

--- Log a message to Mechanic's console.
--- If Mechanic isn't loaded, this is a no-op.
---@param addonName string Source addon name
---@param message string The log message
---@param category string|nil Optional category (use MechanicLib.Categories)
function MechanicLib:Log(addonName, message, category)
    if _G.Mechanic and _G.Mechanic.OnLog then
        _G.Mechanic:OnLog(addonName, message, category)
    end
end

--------------------------------------------------------------------------------
-- Utility
--------------------------------------------------------------------------------

--- Get list of registered addons.
---@return table registered Map of addonName -> capabilities
function MechanicLib:GetRegistered()
    return self.registered
end


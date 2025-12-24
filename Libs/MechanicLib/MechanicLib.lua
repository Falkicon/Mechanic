-- MechanicLib.lua
-- Minimal library for addon integration with !Mechanic
--
-- This library is embedded in consuming addons via lib_sync.
-- See PLAN/MASTER_PLAN.md for full API specification.
--
-- Implementation: Phase 1 (PLAN/01-foundation.plan.md)

local MAJOR, MINOR = "MechanicLib-1.0", 1
local MechanicLib = LibStub:NewLibrary(MAJOR, MINOR)
if not MechanicLib then return end

-- Storage
MechanicLib.registered = MechanicLib.registered or {}

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


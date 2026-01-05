-- Bootstrap.lua
-- !Mechanic Bootstrap - Minimal early loader
--
-- This addon loads FIRST (via ! prefix) to provide:
-- 1. MechanicLib registration API for other addons
-- 2. Global Mechanic namespace
-- 3. CLI queue processing (lua.queue, api.queue)
-- 4. SavedVariables initialization
--
-- The main Mechanic addon loads later with all UI and features.

local ADDON_NAME, ns = ...

--------------------------------------------------------------------------------
-- Global Namespace (Available immediately for other addons)
--------------------------------------------------------------------------------

local Mechanic = {}
_G.Mechanic = Mechanic
_G.MechanicNS = ns  -- Shared namespace for main addon

-- Version from metadata
Mechanic.version = C_AddOns.GetAddOnMetadata(ADDON_NAME, "Version") or "1.3.0"
Mechanic.isBootstrap = true  -- Flag indicating main addon not yet loaded

-- Placeholder for main addon to populate
Mechanic.db = nil
Mechanic.API = nil
Mechanic.Console = nil

--------------------------------------------------------------------------------
-- SavedVariables Initialization
--------------------------------------------------------------------------------

-- Database defaults (minimal - main addon extends these)
local defaults = {
    profile = {
        -- Core settings preserved across sessions
        position = { point = "CENTER", x = 0, y = 0 },
        size = { width = 1000, height = 650 },
        activeTab = "inspect",
        
        -- Diagnostic Hub data (persisted for desktop sync)
        addonData = {},
        lastSync = 0,
        
        -- API/Lua queue results (written by in-game, read by desktop)
        apiTests = {},
        luaEvalResults = {},
        
        -- Console buffer for desktop
        consoleBuffer = {},
        consoleBufferMax = 100,
        
        -- Health log for agent auditing
        healthLog = {},
        
        -- Test results
        testResults = {},
    },
}

--------------------------------------------------------------------------------
-- Event Frame
--------------------------------------------------------------------------------

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGOUT")

frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == ADDON_NAME then
        -- Initialize minimal database for queue results
        -- Main addon will use same SavedVariables and extend it
        if not MechanicDB then
            MechanicDB = {}
        end
        if not MechanicDB.profiles then
            MechanicDB.profiles = {}
        end
        if not MechanicDB.profiles.Default then
            MechanicDB.profiles.Default = {}
        end
        
        -- Store reference for queue processing
        ns.rawDB = MechanicDB.profiles.Default
        
        -- Apply defaults for keys we need
        for key, value in pairs(defaults.profile) do
            if ns.rawDB[key] == nil then
                if type(value) == "table" then
                    ns.rawDB[key] = {}
                else
                    ns.rawDB[key] = value
                end
            end
        end
        
        -- Process queues immediately (before main addon loads)
        Mechanic:ProcessLuaEvalQueue()
        Mechanic:ProcessAPITestQueue()
        
        -- Fire event for any listeners
        if Mechanic.callbacks then
            Mechanic.callbacks:Fire("MECHANIC_BOOTSTRAP_READY")
        end
        
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

--------------------------------------------------------------------------------
-- Lua Eval Queue Processing
--------------------------------------------------------------------------------

function Mechanic:ProcessLuaEvalQueue()
    local queue = _G.MECHANIC_LUA_QUEUE
    
    if not queue or #queue == 0 then
        return
    end
    
    -- Clear global immediately
    _G.MECHANIC_LUA_QUEUE = nil
    
    local results = {}
    
    for i, item in ipairs(queue) do
        local code = item.code
        local label = item.label or ("snippet_" .. i)
        
        -- Execute the code
        local fn, loadErr = loadstring("return " .. code)
        if not fn then
            -- Try without return wrapper
            fn, loadErr = loadstring(code)
        end
        
        if fn then
            local success, result = pcall(fn)
            if success then
                results[label] = {
                    success = true,
                    value = result,
                    code = code,
                }
            else
                results[label] = {
                    success = false,
                    error = tostring(result),
                    code = code,
                }
            end
        else
            results[label] = {
                success = false,
                error = "Load error: " .. tostring(loadErr),
                code = code,
            }
        end
    end
    
    -- Store results in SavedVariables for desktop to read
    ns.rawDB.luaEvalResults = results
    
    -- Print summary
    local passed, failed = 0, 0
    for _, r in pairs(results) do
        if r.success then passed = passed + 1 else failed = failed + 1 end
    end
    print(string.format("|cFF00FFFF[!Mechanic] Lua Eval: %d passed, %d failed|r", passed, failed))
end

--------------------------------------------------------------------------------
-- API Test Queue Processing
--------------------------------------------------------------------------------

function Mechanic:ProcessAPITestQueue()
    local queue = _G.MECHANIC_API_QUEUE
    
    if not queue or #queue == 0 then
        return
    end
    
    -- Clear global immediately
    _G.MECHANIC_API_QUEUE = nil
    
    -- Store queue for main addon to process (needs APIDefs)
    ns.pendingAPIQueue = queue
    
    print(string.format("|cFF00FFFF[!Mechanic] API Queue: %d test(s) queued for main addon|r", #queue))
end

--------------------------------------------------------------------------------
-- Registration Callbacks (for main addon)
--------------------------------------------------------------------------------

function Mechanic:OnAddonRegistered(addonName, capabilities)
    -- Called by MechanicLib when an addon registers
    -- Main addon will override this
    if not ns.pendingRegistrations then
        ns.pendingRegistrations = {}
    end
    ns.pendingRegistrations[addonName] = capabilities
end

function Mechanic:OnAddonUnregistered(addonName)
    if ns.pendingRegistrations then
        ns.pendingRegistrations[addonName] = nil
    end
end

--------------------------------------------------------------------------------
-- Utility: Print (available early)
--------------------------------------------------------------------------------

function Mechanic:Print(msg)
    print("|cFF00FF00[Mechanic]|r " .. tostring(msg))
end

--------------------------------------------------------------------------------
-- Main Addon Integration
--------------------------------------------------------------------------------

--- Called by main Mechanic addon when it loads
--- Transfers control and pending data
---@param mainAddon table The main Mechanic addon object
function Mechanic:OnMainAddonLoaded(mainAddon)
    -- Transfer pending registrations
    if ns.pendingRegistrations then
        for addonName, capabilities in pairs(ns.pendingRegistrations) do
            if mainAddon.OnAddonRegistered then
                mainAddon:OnAddonRegistered(addonName, capabilities)
            end
        end
        ns.pendingRegistrations = nil
    end
    
    -- Transfer pending API queue
    if ns.pendingAPIQueue then
        mainAddon.pendingAPIQueue = ns.pendingAPIQueue
        ns.pendingAPIQueue = nil
    end
    
    -- Mark bootstrap complete
    Mechanic.isBootstrap = false
    
    print("|cFF00FF00[!Mechanic] Bootstrap complete, main addon loaded.|r")
end

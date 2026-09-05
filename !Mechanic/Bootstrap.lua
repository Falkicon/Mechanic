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
Mechanic.version = C_AddOns.GetAddOnMetadata(ADDON_NAME, "Version") or "1.4.2"
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
        apiNotes = {},
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
        local name = UnitName and UnitName("player")
        local realm = GetRealmName and GetRealmName()
        local character = name and realm and (name .. " - " .. realm)
        MechanicDB.profileKeys = MechanicDB.profileKeys or {}
        local profile = character and MechanicDB.profileKeys[character] or "Default"
        local target = _G.MECHANIC_DIAGNOSTIC_TARGET
        -- Queue files are shared by every account on this client. Never execute
        -- a character-bound request on another character or unknown identity.
        local matches = not target or (not target.character or target.character == character)
        if target and target.profile and target.profile ~= profile then
            matches = false
        end
        if not matches then
            _G.MECHANIC_LUA_QUEUE = nil
            _G.MECHANIC_API_QUEUE = nil
        end
        MechanicDB.profiles[profile] = MechanicDB.profiles[profile] or {}
        ns.rawDB = MechanicDB.profiles[profile]
        ns.profileName = profile
        if character then
            MechanicDB.profileKeys[character] = profile
        end

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
--
-- SECURITY NOTE: This feature uses loadstring() to execute arbitrary Lua code.
-- This is an INTENTIONAL DEVELOPMENT TOOL for addon developers to:
--   - Test API calls in-game via the Mechanic CLI (lua.queue command)
--   - Inspect runtime values during development
--   - Debug addon behavior without modifying source files
--
-- The code queue is populated ONLY by the local Mechanic desktop tool via
-- SavedVariables, not by any network or external source. The feature is
-- sandboxed within WoW's addon environment which already restricts dangerous
-- operations (file I/O, network access, etc.).
--
-- If distributing Mechanic to end users, consider disabling this feature
-- by removing or commenting out this function.
--------------------------------------------------------------------------------

function Mechanic:ProcessLuaEvalQueue()
    local queue = _G.MECHANIC_LUA_QUEUE
    
    if not queue or #queue == 0 then
        return
    end
    
    -- Clear global immediately
    _G.MECHANIC_LUA_QUEUE = nil
    
    local results = {}
    local lastRun = date("%Y-%m-%d %H:%M:%S")

    -- SavedVariables cannot safely store arbitrary return values (functions,
    -- frames, or cyclic tables). Keep the same textual result contract as Core.
    local function describe(value)
        if issecretvalue and issecretvalue(value) then
            return "[secret]"
        end
        local ok, text = pcall(tostring, value)
        return ok and text or "[unprintable]"
    end

    local function serialize(value)
        if issecretvalue and issecretvalue(value) then
            return "[secret]"
        end
        if type(value) ~= "table" then
            return describe(value)
        end
        local parts, count = {}, 0
        for key, entry in pairs(value) do
            count = count + 1
            if count > 10 then
                table.insert(parts, "...")
                break
            end
            table.insert(parts, describe(key) .. "=" .. describe(entry))
        end
        return "{" .. table.concat(parts, ", ") .. "}"
    end
    
    for i, item in ipairs(queue) do
        local code = item.code
        local label = item.label or ("snippet_" .. i)
        
        -- Execute the code
        local fn, loadErr
        if type(code) ~= "string" or code == "" then
            loadErr = "Empty or invalid code snippet"
        else
            fn, loadErr = loadstring("return " .. code, label)
        end
        if not fn and type(code) == "string" and code ~= "" then
            -- Try without return wrapper
            fn, loadErr = loadstring(code, label)
        end

        local entry = { label = label, code = code, executedAt = lastRun }
        
        if fn then
            local success, result = pcall(fn)
            if success then
                entry.success = true
                entry.result = serialize(result)
                entry.resultType = type(result)
            else
                entry.success = false
                entry.error = describe(result)
            end
        else
            entry.success = false
            entry.error = "Load error: " .. describe(loadErr)
        end
        table.insert(results, entry)
    end
    
    -- Store results in SavedVariables for desktop to read
    ns.rawDB.luaEvalResults = { results = results, lastRun = lastRun }
    
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

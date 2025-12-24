--------------------------------------------------------------------------------
-- FenUI v2 - Blizzard-First UI Widget Library
-- 
-- A progressive enhancement layer built on Blizzard's native UI system.
-- Uses NineSliceUtil, Atlas system, and textureKit theming.
--
-- Copyright (c) 2024 Fen (Falkicon)
-- Licensed under GPL-3.0
--------------------------------------------------------------------------------

-- Create the global FenUI namespace
FenUI = FenUI or {}

--------------------------------------------------------------------------------
-- Version and Metadata
--------------------------------------------------------------------------------

FenUI.VERSION = "2.4.0"
FenUI.AUTHOR = "Fen"
FenUI.NAME = "FenUI"

--------------------------------------------------------------------------------
-- Addon Path Detection (works when embedded or standalone)
--------------------------------------------------------------------------------

-- Detect the addon path by looking at where this file was loaded from
-- Uses debugstack to find the actual path
local function DetectAddonPath()
    local path = debugstack(1, 1, 0)
    -- debugstack returns something like: "Interface/AddOns/Weekly/Libs/FenUI/Core/FenUI.lua:123: ..."
    -- We need to extract up to and including FenUI
    local addonPath = path:match("(Interface[/\\]AddOns[/\\][^/\\]+[/\\]Libs[/\\]FenUI)[/\\]")
    if addonPath then
        return addonPath:gsub("/", "\\")
    end
    -- Fallback: standalone addon
    addonPath = path:match("(Interface[/\\]AddOns[/\\]FenUI)[/\\]")
    if addonPath then
        return addonPath:gsub("/", "\\")
    end
    -- Last resort fallback
    return "Interface\\AddOns\\FenUI"
end

FenUI.ADDON_PATH = DetectAddonPath()

--------------------------------------------------------------------------------
-- Debug Mode
--------------------------------------------------------------------------------

FenUI.debugMode = false

--- Print a message with FenUI prefix
---@param ... any Values to print
function FenUI:Print(...)
    print("|cff88ccff[FenUI]|r", ...)
end

--- Print a debug message (only when debug mode is enabled)
---@param ... any Values to print
function FenUI:Debug(...)
    if self.debugMode then
        print("|cff88ccff[FenUI Debug]|r", ...)
    end
end

--- Enable or disable debug mode
---@param enabled boolean
function FenUI:SetDebugMode(enabled)
    self.debugMode = enabled
    self:Print("Debug mode", enabled and "enabled" or "disabled")
end

--------------------------------------------------------------------------------
-- Frame Registry (for global theme changes)
--------------------------------------------------------------------------------

FenUI.registeredFrames = {}
FenUI.frameCount = 0

--- Register a frame for global theme updates
---@param frame Frame The frame to register
---@param frameType string Type of frame ("panel", "tabs", "button", etc.)
---@return number frameId Unique identifier for the frame
function FenUI:RegisterFrame(frame, frameType)
    self.frameCount = self.frameCount + 1
    local frameId = self.frameCount
    
    self.registeredFrames[frameId] = {
        frame = frame,
        frameType = frameType or "unknown",
        theme = nil,  -- Will be set when theme is applied
    }
    
    -- Store the ID on the frame for easy lookup
    frame.fenUIFrameId = frameId
    
    self:Debug("Registered frame", frameId, "type:", frameType)
    return frameId
end

--- Unregister a frame from global theme updates
---@param frameOrId Frame|number The frame or its ID
function FenUI:UnregisterFrame(frameOrId)
    local frameId = type(frameOrId) == "number" and frameOrId or frameOrId.fenUIFrameId
    
    if frameId and self.registeredFrames[frameId] then
        self.registeredFrames[frameId] = nil
        self:Debug("Unregistered frame", frameId)
    end
end

--- Get all registered frames
---@return table<number, table> The registered frames
function FenUI:GetRegisteredFrames()
    return self.registeredFrames
end

--------------------------------------------------------------------------------
-- Global Theme State
--------------------------------------------------------------------------------

FenUI.currentGlobalTheme = "Default"
FenUI.themeChangeCallbacks = {}

--- Register a callback for global theme changes
---@param callback function Callback function(themeName)
---@return number callbackId
function FenUI:OnThemeChanged(callback)
    local callbackId = #self.themeChangeCallbacks + 1
    self.themeChangeCallbacks[callbackId] = callback
    return callbackId
end

--- Remove a theme change callback
---@param callbackId number
function FenUI:RemoveThemeChangedCallback(callbackId)
    self.themeChangeCallbacks[callbackId] = nil
end

--- Fire theme change callbacks
---@param themeName string
local function FireThemeChangeCallbacks(themeName)
    for _, callback in pairs(FenUI.themeChangeCallbacks) do
        local ok, err = pcall(callback, themeName)
        if not ok then
            FenUI:Debug("Theme callback error:", err)
        end
    end
end

--------------------------------------------------------------------------------
-- Initialization
--------------------------------------------------------------------------------

local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "FenUI" then
        -- Initialize saved variables
        FenUIDB = FenUIDB or {
            globalTheme = "Default",
            showValidationWarnings = false,
            debugMode = false,
        }
        
        -- Restore settings
        FenUI.currentGlobalTheme = FenUIDB.globalTheme or "Default"
        FenUI.debugMode = FenUIDB.debugMode or false
        
        -- Run validation if available (loaded later in TOC)
        if FenUI.Validation and FenUI.Validation.OnLoad then
            C_Timer.After(0, function()
                FenUI.Validation:OnLoad(FenUIDB.showValidationWarnings)
            end)
        end
        
        FenUI:Debug("FenUI v" .. FenUI.VERSION .. " initialized")
        
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

--------------------------------------------------------------------------------
-- Slash Commands
--------------------------------------------------------------------------------

SLASH_FENUI1 = "/fenui"
SlashCmdList["FENUI"] = function(msg)
    local cmd, arg = strsplit(" ", strlower(msg or ""), 2)
    
    if cmd == "validate" or cmd == "check" then
        if FenUI.Validation then
            local verbose = arg == "verbose"
            local results = FenUI.Validation:Run(verbose)
            FenUI.Validation:PrintReport(results, verbose)
        else
            FenUI:Print("Validation module not loaded")
        end
        
    elseif cmd == "theme" then
        if arg then
            FenUI:SetGlobalTheme(arg)
        else
            FenUI:Print("Current theme:", FenUI.currentGlobalTheme)
            FenUI:Print("Available themes:", table.concat(FenUI:GetThemeList(), ", "))
        end
        
    elseif cmd == "themes" then
        FenUI:Print("Available themes:")
        for _, theme in ipairs(FenUI:GetThemeList()) do
            local marker = (theme == FenUI.currentGlobalTheme) and " |cff00ff00(active)|r" or ""
            FenUI:Print("  -", theme .. marker)
        end
        
    elseif cmd == "debug" then
        FenUI:SetDebugMode(not FenUI.debugMode)
        FenUIDB.debugMode = FenUI.debugMode
        
    elseif cmd == "version" then
        FenUI:Print("Version", FenUI.VERSION, "by", FenUI.AUTHOR)
        
    elseif cmd == "tokens" then
        FenUI:Print("Current Tokens (Resolution):")
        FenUI:Print("  marginPanel:", FenUI:GetSpacing("marginPanel"))
        FenUI:Print("  panelPadding:", FenUI:GetLayout("panelPadding"))
        FenUI:Print("  headerHeight:", FenUI:GetLayout("headerHeight"))
        FenUI:Print("  footerHeight:", FenUI:GetLayout("footerHeight"))
        
    elseif cmd == "frames" then
        local count = 0
        for _ in pairs(FenUI.registeredFrames) do count = count + 1 end
        FenUI:Print("Registered frames:", count)
        if FenUI.debugMode then
            for id, data in pairs(FenUI.registeredFrames) do
                FenUI:Print("  -", id, "(" .. data.frameType .. ")", "theme:", data.theme or "none")
            end
        end
        
    else
        FenUI:Print("FenUI v" .. FenUI.VERSION .. " Commands:")
        FenUI:Print("  /fenui validate [verbose] - Check Blizzard dependencies")
        FenUI:Print("  /fenui theme [name] - Get/set global theme")
        FenUI:Print("  /fenui themes - List available themes")
        FenUI:Print("  /fenui frames - Show registered frame count")
        FenUI:Print("  /fenui tokens - Show current spacing tokens")
        FenUI:Print("  /fenui debug - Toggle debug mode")
        FenUI:Print("  /fenui version - Show version info")
    end
end

--------------------------------------------------------------------------------
-- Utility Functions
--------------------------------------------------------------------------------

--- Mixin: Copy methods from source tables to a target object
---@param object table The target object
---@param ... table One or more source tables
---@return table The modified object
function FenUI.Mixin(object, ...)
    for i = 1, select("#", ...) do
        local mixin = select(i, ...)
        for k, v in pairs(mixin) do
            object[k] = v
        end
    end
    return object
end

--- CreateFromMixins: Create a new table with methods from mixins
---@param ... table One or more source tables
---@return table A new table with all mixin methods
function FenUI.CreateFromMixins(...)
    return FenUI.Mixin({}, ...)
end

--- Safe call: Execute a function with error handling
---@param func function The function to call
---@param ... any Arguments to pass
---@return boolean success, any result
function FenUI.SafeCall(func, ...)
    return pcall(func, ...)
end

--------------------------------------------------------------------------------
-- Placeholder functions (implemented in other modules)
--------------------------------------------------------------------------------

--- Get list of available themes (implemented in ThemeManager.lua)
---@return table<number, string>
function FenUI:GetThemeList()
    if self.Themes then
        local list = {}
        for name in pairs(self.Themes) do
            table.insert(list, name)
        end
        table.sort(list)
        return list
    end
    return { "Default" }
end

--- Set global theme (implemented in ThemeManager.lua)
---@param themeName string
function FenUI:SetGlobalTheme(themeName)
    if self.ThemeManager and self.ThemeManager.SetGlobalTheme then
        self.ThemeManager:SetGlobalTheme(themeName)
    else
        self.currentGlobalTheme = themeName
        FenUIDB.globalTheme = themeName
        FireThemeChangeCallbacks(themeName)
        self:Print("Global theme set to:", themeName)
    end
end

--- Get current global theme
---@return string
function FenUI:GetGlobalTheme()
    return self.currentGlobalTheme
end

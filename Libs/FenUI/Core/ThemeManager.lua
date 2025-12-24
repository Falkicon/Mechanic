--------------------------------------------------------------------------------
-- FenUI v2 - Theme Manager
-- 
-- Theme registration and switching with token overrides.
-- Themes can override semantic tokens and specify Blizzard textureKits.
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- Theme Definitions
--------------------------------------------------------------------------------

FenUI.Themes = {
    -- Default theme - uses base semantic tokens
    Default = {
        name = "Default",
        description = "Standard WoW UI appearance",
        textureKit = nil,
        layout = "Panel",  -- FenUI layout alias
        tokens = {},       -- No overrides
    },
    
    -- The War Within theme
    TWW = {
        name = "The War Within",
        description = "The War Within expansion theme",
        textureKit = "warwithin",
        layout = "Panel",
        tokens = {
            -- Slightly warmer gold for TWW
            interactiveDefault = "gold600",
            textHeading = "gold600",
        },
    },
    
    -- Dragonflight theme
    Dragonflight = {
        name = "Dragonflight",
        description = "Dragonflight expansion theme",
        textureKit = "dragonflight",
        layout = "Dragonflight",
        tokens = {
            -- Dragon blue accents
            interactiveDefault = "blue500",
            interactiveHover = "blue400",
            interactiveActive = "blue600",
            borderFocus = "blue500",
            textHeading = "blue400",
        },
    },
    
    -- Shadowlands theme
    Shadowlands = {
        name = "Shadowlands",
        description = "Shadowlands expansion theme",
        textureKit = "oribos",
        layout = "Shadowlands",
        tokens = {
            -- Muted, ethereal colors
            surfacePanel = "gray950",
            surfaceElevated = "gray900",
            textDefault = "gray200",
            interactiveDefault = "gray300",
            interactiveHover = "gray200",
        },
    },
    
    -- BFA Horde theme
    Horde = {
        name = "Horde",
        description = "For the Horde!",
        textureKit = "horde",
        layout = "BFA_Horde",
        tokens = {
            interactiveDefault = "red500",
            interactiveHover = "red400",
            interactiveActive = "red600",
            borderFocus = "red500",
            textHeading = "red400",
        },
    },
    
    -- BFA Alliance theme
    Alliance = {
        name = "Alliance",
        description = "For the Alliance!",
        textureKit = "alliance",
        layout = "BFA_Alliance",
        tokens = {
            interactiveDefault = "blue500",
            interactiveHover = "blue400",
            interactiveActive = "blue600",
            borderFocus = "blue500",
            textHeading = "blue400",
        },
    },
    
    -- Dark minimal theme
    Dark = {
        name = "Dark",
        description = "Clean, dark minimal appearance",
        textureKit = nil,
        layout = "Simple",
        tokens = {
            surfacePanel = "gray950",
            surfaceElevated = "gray900",
            surfaceInset = "black",
            borderDefault = "gray800",
            borderSubtle = "gray900",
            textDefault = "gray200",
            textMuted = "gray600",
        },
    },
    
    -- Metal theme
    Metal = {
        name = "Metal",
        description = "Classic metallic WoW style",
        textureKit = nil,
        layout = "Metal",
        tokens = {
            interactiveDefault = "gold500",
            borderDefault = "gray500",
        },
    },
}

--------------------------------------------------------------------------------
-- Theme Manager Module
--------------------------------------------------------------------------------

FenUI.ThemeManager = {}

--- Register a new theme
---@param name string Theme identifier
---@param config table Theme configuration
function FenUI.ThemeManager:Register(name, config)
    if FenUI.Themes[name] then
        FenUI:Debug("Overwriting existing theme:", name)
    end
    
    FenUI.Themes[name] = {
        name = config.name or name,
        description = config.description or "",
        textureKit = config.textureKit,
        layout = config.layout or "Panel",
        tokens = config.tokens or {},
    }
    
    FenUI:Debug("Registered theme:", name)
end

--- Unregister a theme
---@param name string Theme identifier
function FenUI.ThemeManager:Unregister(name)
    if name ~= "Default" then
        FenUI.Themes[name] = nil
        FenUI:Debug("Unregistered theme:", name)
    end
end

--- Get a theme configuration
---@param name string Theme identifier
---@return table|nil theme
function FenUI.ThemeManager:Get(name)
    return FenUI.Themes[name]
end

--- Check if a theme exists
---@param name string Theme identifier
---@return boolean exists
function FenUI.ThemeManager:Exists(name)
    return FenUI.Themes[name] ~= nil
end

--- Get list of theme names
---@return table<number, string> themeNames
function FenUI.ThemeManager:GetList()
    local list = {}
    for name in pairs(FenUI.Themes) do
        table.insert(list, name)
    end
    table.sort(list)
    return list
end

--- Get theme info for UI display
---@return table<string, table> themes { name = { name, description } }
function FenUI.ThemeManager:GetThemeInfo()
    local info = {}
    for name, theme in pairs(FenUI.Themes) do
        info[name] = {
            name = theme.name,
            description = theme.description,
        }
    end
    return info
end

--------------------------------------------------------------------------------
-- Theme Application
--------------------------------------------------------------------------------

--- Apply a theme to a specific frame
---@param frame Frame The frame to theme
---@param themeName string Theme identifier
---@return boolean success
function FenUI.ThemeManager:ApplyToFrame(frame, themeName)
    local theme = FenUI.Themes[themeName]
    if not theme then
        FenUI:Debug("Theme not found:", themeName)
        return false
    end
    
    -- Apply the Blizzard layout if frame supports it
    if theme.layout and frame.fenUISupportsLayout then
        local layoutName = FenUI:ResolveLayoutName(theme.layout)
        FenUI:ApplyLayout(frame, layoutName, theme.textureKit)
    end
    
    -- Store theme info on frame
    frame.fenUITheme = themeName
    
    -- Update frame registry
    if frame.fenUIFrameId and FenUI.registeredFrames[frame.fenUIFrameId] then
        FenUI.registeredFrames[frame.fenUIFrameId].theme = themeName
    end
    
    -- Call frame's theme update method if it exists
    if frame.OnFenUIThemeChanged then
        frame:OnFenUIThemeChanged(themeName, theme)
    end
    
    FenUI:Debug("Applied theme", themeName, "to frame")
    return true
end

--- Set the global theme (updates all registered frames)
---@param themeName string Theme identifier
---@return boolean success
function FenUI.ThemeManager:SetGlobalTheme(themeName)
    local theme = FenUI.Themes[themeName]
    if not theme then
        FenUI:Print("Theme not found:", themeName)
        return false
    end
    
    -- Update global state
    FenUI.currentGlobalTheme = themeName
    if FenUIDB then
        FenUIDB.globalTheme = themeName
    end
    
    -- Apply token overrides
    FenUI:ApplyTokenOverrides(theme.tokens)
    
    -- Update all registered frames
    local updatedCount = 0
    for frameId, data in pairs(FenUI.registeredFrames) do
        if data.frame and data.frame:IsObjectType("Frame") then
            self:ApplyToFrame(data.frame, themeName)
            updatedCount = updatedCount + 1
        end
    end
    
    -- Fire callbacks
    for _, callback in pairs(FenUI.themeChangeCallbacks) do
        local ok, err = pcall(callback, themeName)
        if not ok then
            FenUI:Debug("Theme callback error:", err)
        end
    end
    
    FenUI:Print("Global theme set to:", theme.name, "(" .. updatedCount .. " frames updated)")
    return true
end

--- Get the current global theme name
---@return string themeName
function FenUI.ThemeManager:GetGlobalTheme()
    return FenUI.currentGlobalTheme
end

--- Get the current global theme configuration
---@return table theme
function FenUI.ThemeManager:GetGlobalThemeConfig()
    return FenUI.Themes[FenUI.currentGlobalTheme] or FenUI.Themes.Default
end

--------------------------------------------------------------------------------
-- Override FenUI's placeholder functions
--------------------------------------------------------------------------------

-- Override GetThemeList to use ThemeManager
function FenUI:GetThemeList()
    return self.ThemeManager:GetList()
end

-- Override SetGlobalTheme to use ThemeManager
function FenUI:SetGlobalTheme(themeName)
    return self.ThemeManager:SetGlobalTheme(themeName)
end

--------------------------------------------------------------------------------
-- Convenience Functions
--------------------------------------------------------------------------------

--- Register a custom theme (convenience wrapper)
---@param name string Theme identifier
---@param config table Theme configuration
function FenUI:RegisterTheme(name, config)
    self.ThemeManager:Register(name, config)
end

--- Apply theme to a frame (convenience wrapper)
---@param frame Frame The frame to theme
---@param themeName string|nil Theme name (defaults to global theme)
function FenUI:ApplyTheme(frame, themeName)
    themeName = themeName or self.currentGlobalTheme
    return self.ThemeManager:ApplyToFrame(frame, themeName)
end

--- Get theme configuration (convenience wrapper)
---@param themeName string|nil Theme name (defaults to global theme)
---@return table theme
function FenUI:GetTheme(themeName)
    themeName = themeName or self.currentGlobalTheme
    return self.ThemeManager:Get(themeName)
end

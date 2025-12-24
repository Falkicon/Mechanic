--------------------------------------------------------------------------------
-- FenUI v2 - Blizzard Bridge
-- 
-- Wrapper around Blizzard's NineSliceUtil and NineSliceLayouts.
-- Provides easy access to native UI frame styles.
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- Curated Layout Registry
-- These are the recommended Blizzard layouts for common use cases
--------------------------------------------------------------------------------

FenUI.Layouts = {
    -- Standard frames
    Panel = "ButtonFrameTemplateNoPortrait",
    PanelMinimizable = "ButtonFrameTemplateNoPortraitMinimizable",
    Simple = "SimplePanelTemplate",
    Portrait = "PortraitFrameTemplate",
    PortraitMinimizable = "PortraitFrameTemplateMinimizable",
    
    -- Content sections
    Inset = "InsetFrameTemplate",
    
    -- Dialogs and modals
    Dialog = "Dialog",
    
    -- Generic styles
    Metal = "GenericMetal",
    
    -- Expansion-themed
    Dragonflight = "DragonflightMissionFrame",
    Shadowlands = "CovenantMissionFrame",
    BFA_Horde = "BFAMissionHorde",
    BFA_Alliance = "BFAMissionAlliance",
}

-- Reverse lookup: Blizzard name -> FenUI name
FenUI.LayoutAliases = {}
for fenUIName, blizzardName in pairs(FenUI.Layouts) do
    FenUI.LayoutAliases[blizzardName] = fenUIName
end

--------------------------------------------------------------------------------
-- Layout Validation
--------------------------------------------------------------------------------

--- Check if a layout exists in Blizzard's NineSliceLayouts
---@param layoutName string The layout name (FenUI alias or Blizzard name)
---@return boolean exists
function FenUI:LayoutExists(layoutName)
    if not NineSliceLayouts then
        return false
    end
    
    -- Check if it's a FenUI alias
    local blizzardName = self.Layouts[layoutName] or layoutName
    
    return NineSliceLayouts[blizzardName] ~= nil
end

--- Get the Blizzard layout name from a FenUI alias
---@param layoutName string FenUI alias or Blizzard name
---@return string blizzardLayoutName
function FenUI:ResolveLayoutName(layoutName)
    return self.Layouts[layoutName] or layoutName
end

--- Get all available layouts (both FenUI aliases and Blizzard names)
---@param includeBlizzard boolean Include raw Blizzard layout names
---@return table<number, string> layoutNames
function FenUI:GetAvailableLayouts(includeBlizzard)
    local layouts = {}
    
    -- Add FenUI aliases
    for name in pairs(self.Layouts) do
        table.insert(layouts, name)
    end
    
    -- Optionally add all Blizzard layouts
    if includeBlizzard and NineSliceLayouts then
        for name in pairs(NineSliceLayouts) do
            if not self.LayoutAliases[name] then
                table.insert(layouts, name)
            end
        end
    end
    
    table.sort(layouts)
    return layouts
end

--------------------------------------------------------------------------------
-- NineSlice Application
--------------------------------------------------------------------------------

--- Apply a NineSlice layout to a frame
---@param frame Frame The frame to apply the layout to
---@param layoutName string The layout name (FenUI alias or Blizzard name)
---@param textureKit string|nil Optional texture kit for themed layouts
---@return boolean success
function FenUI:ApplyLayout(frame, layoutName, textureKit)
    if not NineSliceUtil or not NineSliceLayouts then
        self:Debug("NineSliceUtil not available")
        return false
    end
    
    local blizzardLayoutName = self:ResolveLayoutName(layoutName)
    local layout = NineSliceLayouts[blizzardLayoutName]
    
    if not layout then
        self:Debug("Layout not found:", blizzardLayoutName)
        return false
    end
    
    -- Apply the layout
    NineSliceUtil.ApplyLayout(frame, layout, textureKit)
    
    -- Store layout info on the frame
    frame.fenUILayout = blizzardLayoutName
    frame.fenUITextureKit = textureKit
    
    self:Debug("Applied layout:", blizzardLayoutName, textureKit and ("with kit: " .. textureKit) or "")
    return true
end

--- Apply a layout by Blizzard name directly (bypasses alias lookup)
---@param frame Frame The frame to apply the layout to
---@param blizzardLayoutName string The exact Blizzard layout name
---@param textureKit string|nil Optional texture kit
---@return boolean success
function FenUI:ApplyLayoutDirect(frame, blizzardLayoutName, textureKit)
    if not NineSliceUtil or not NineSliceLayouts then
        return false
    end
    
    local layout = NineSliceLayouts[blizzardLayoutName]
    if not layout then
        return false
    end
    
    NineSliceUtil.ApplyLayout(frame, layout, textureKit)
    frame.fenUILayout = blizzardLayoutName
    frame.fenUITextureKit = textureKit
    
    return true
end

--------------------------------------------------------------------------------
-- Layout Utilities
--------------------------------------------------------------------------------

--- Get the NineSlice pieces from a frame (if it has them)
---@param frame Frame The frame with a NineSlice layout
---@return table|nil pieces Table of piece names -> textures
function FenUI:GetLayoutPieces(frame)
    local pieceNames = {
        "TopLeftCorner", "TopRightCorner",
        "BottomLeftCorner", "BottomRightCorner",
        "TopEdge", "BottomEdge",
        "LeftEdge", "RightEdge",
        "Center"
    }
    
    local pieces = {}
    local found = false
    
    for _, name in ipairs(pieceNames) do
        if frame[name] then
            pieces[name] = frame[name]
            found = true
        end
    end
    
    return found and pieces or nil
end

--- Set the vertex color on all NineSlice pieces of a frame
---@param frame Frame The frame with a NineSlice layout
---@param r number Red (0-1)
---@param g number Green (0-1)
---@param b number Blue (0-1)
---@param a number|nil Alpha (0-1, defaults to 1)
function FenUI:SetLayoutColor(frame, r, g, b, a)
    a = a or 1
    
    local pieces = self:GetLayoutPieces(frame)
    if pieces then
        for _, texture in pairs(pieces) do
            texture:SetVertexColor(r, g, b, a)
        end
    end
end

--- Set the center color only (for backgrounds)
---@param frame Frame The frame with a NineSlice layout
---@param r number Red (0-1)
---@param g number Green (0-1)
---@param b number Blue (0-1)
---@param a number|nil Alpha (0-1, defaults to 1)
function FenUI:SetLayoutCenterColor(frame, r, g, b, a)
    if frame.Center then
        frame.Center:SetVertexColor(r, g, b, a or 1)
    end
end

--- Set the border color only (excludes center)
---@param frame Frame The frame with a NineSlice layout
---@param r number Red (0-1)
---@param g number Green (0-1)
---@param b number Blue (0-1)
---@param a number|nil Alpha (0-1, defaults to 1)
function FenUI:SetLayoutBorderColor(frame, r, g, b, a)
    a = a or 1
    
    local borderPieces = {
        "TopLeftCorner", "TopRightCorner",
        "BottomLeftCorner", "BottomRightCorner",
        "TopEdge", "BottomEdge",
        "LeftEdge", "RightEdge"
    }
    
    for _, name in ipairs(borderPieces) do
        if frame[name] then
            frame[name]:SetVertexColor(r, g, b, a)
        end
    end
end

--- Hide the NineSlice layout on a frame
---@param frame Frame The frame with a NineSlice layout
function FenUI:HideLayout(frame)
    if NineSliceUtil and NineSliceUtil.HideLayout then
        NineSliceUtil.HideLayout(frame)
    else
        local pieces = self:GetLayoutPieces(frame)
        if pieces then
            for _, texture in pairs(pieces) do
                texture:Hide()
            end
        end
    end
end

--- Show the NineSlice layout on a frame
---@param frame Frame The frame with a NineSlice layout
function FenUI:ShowLayout(frame)
    if NineSliceUtil and NineSliceUtil.ShowLayout then
        NineSliceUtil.ShowLayout(frame)
    else
        local pieces = self:GetLayoutPieces(frame)
        if pieces then
            for _, texture in pairs(pieces) do
                texture:Show()
            end
        end
    end
end

--------------------------------------------------------------------------------
-- Frame Creation Helpers
--------------------------------------------------------------------------------

--- Create a frame with a NineSlice layout already applied
---@param frameType string The frame type (e.g., "Frame", "Button")
---@param name string|nil The frame name
---@param parent Frame The parent frame
---@param layoutName string The layout name (FenUI alias or Blizzard name)
---@param textureKit string|nil Optional texture kit
---@return Frame frame The created frame
function FenUI:CreateFrameWithLayout(frameType, name, parent, layoutName, textureKit)
    local frame = CreateFrame(frameType, name, parent)
    self:ApplyLayout(frame, layoutName, textureKit)
    return frame
end

--- Create a simple panel frame with Inset layout
---@param name string|nil The frame name
---@param parent Frame The parent frame
---@return Frame frame The created frame
function FenUI:CreateInsetFrame(name, parent)
    return self:CreateFrameWithLayout("Frame", name, parent, "Inset")
end

--------------------------------------------------------------------------------
-- TextureKit Utilities
--------------------------------------------------------------------------------

-- Known texture kits that work with expansion-themed layouts
FenUI.TextureKits = {
    warwithin = true,
    dragonflight = true,
    oribos = true,
    horde = true,
    alliance = true,
}

--- Check if a texture kit is known to work
---@param textureKit string The texture kit name
---@return boolean isKnown
function FenUI:IsKnownTextureKit(textureKit)
    return self.TextureKits[textureKit] == true
end

--- Get list of known texture kits
---@return table<number, string> textureKits
function FenUI:GetKnownTextureKits()
    local kits = {}
    for kit in pairs(self.TextureKits) do
        table.insert(kits, kit)
    end
    table.sort(kits)
    return kits
end

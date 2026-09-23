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
	-- Standard frames (Legacy)
	Panel = "ButtonFrameTemplateNoPortrait",
	PanelMinimizable = "ButtonFrameTemplateNoPortraitMinimizable",
	Simple = "SimplePanelTemplate",
	Portrait = "PortraitFrameTemplate",
	PortraitMinimizable = "PortraitFrameTemplateMinimizable",

	-- Modern frames (11.0+ Dark Mode style)
	Modern = "GenericMetal", -- Clean, modern dark border
	Metal = "GenericMetal", -- Alias for backward compatibility

	-- Content sections
	Inset = "InsetFrameTemplate",

	-- Dialogs and modals
	Dialog = "Dialog",

	-- Tooltips (modern dark style)
	Tooltip = "TooltipGluesLayout", -- Using TooltipGluesLayout as a general tooltip style
	TooltipDefault = "TooltipDefaultLayout",
	TooltipGlues = "TooltipGluesLayout",

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
-- Custom Border Engine (Intentional Custom)
--
-- Simple solid-color border system using 4 edge textures.
-- Provides clean, maintainable borders without complex texture assets.
--------------------------------------------------------------------------------

local BORDER_EDGES = { "Top", "Bottom", "Left", "Right" }

-- Frames with a custom border, re-snapped when the UI scale changes (weak keys)
local borderedFrames = setmetatable({}, { __mode = "k" })

--- Snap a UI-unit size to whole physical pixels at the frame's effective scale.
--- Without this, a 1-unit edge renders 0-2px wide (or blurry) depending on UI scale.
---@param frame Frame
---@param size number UI units
---@param minPixels number|nil Minimum physical pixels (for non-zero sizes)
---@return number
local function SnapToPixels(frame, size, minPixels)
	if not size or size == 0 or not PixelUtil or not frame.GetEffectiveScale then
		return size or 0
	end
	return PixelUtil.GetNearestPixelSize(size, frame:GetEffectiveScale(), minPixels)
end

--- Snap a size to whole physical pixels for a frame (public helper for widgets
--- that draw their own hairline borders).
---@param frame Frame
---@param size number|nil UI units (default 1)
---@return number
function FenUI:GetPixelSize(frame, size)
	return SnapToPixels(frame, size or 1, 1)
end

--- Resolve a border key to its pack definition
---@param borderKey string The border pack name (e.g., "ModernDark")
---@return table|nil pack
function FenUI:GetBorderPack(borderKey)
	return self.Tokens.borders and self.Tokens.borders[borderKey]
end

--- Apply a solid-color border to a frame
---@param frame Frame The target frame
---@param borderKey string The border pack key from Tokens.lua
---@param colorToken string|nil Optional color token to override the pack's default
---@param margin table|nil Optional margin {top, bottom, left, right}
function FenUI:ApplyBorder(frame, borderKey, colorToken, margin)
	local pack = self:GetBorderPack(borderKey)
	if not pack then
		FenUI:Debug("Border pack not found:", borderKey)
		return false
	end

	local rawMargin = margin or { top = 0, bottom = 0, left = 0, right = 0 }
	local edgeSize = pack.edgeSize or 1

	-- Handle "None" border or zero-size edge
	if edgeSize == 0 then
		self:HideCustomBorder(frame)
		frame.borderApplied = true
		frame.fenUIBorderKey = borderKey
		borderedFrames[frame] = nil
		return true
	end

	-- Snap thickness and margins to whole physical pixels for crisp lines
	edgeSize = SnapToPixels(frame, edgeSize, 1)
	local m = {
		top = SnapToPixels(frame, rawMargin.top or 0),
		bottom = SnapToPixels(frame, rawMargin.bottom or 0),
		left = SnapToPixels(frame, rawMargin.left or 0),
		right = SnapToPixels(frame, rawMargin.right or 0),
	}

	-- Get border color
	local r, g, b, a = self:GetColor(colorToken or pack.colorToken or "borderDefault")

	-- Rounded packs: a rounded box on the background layer draws both the
	-- border ring and the fill (the square background texture is hidden)
	local radius = pack.radius and self:GetRadius(pack.radius) or 0
	if radius > 0 and self.CreateRoundedBox then
		if frame.customBorder then
			for _, tex in pairs(frame.customBorder) do
				tex:Hide()
			end
		end
		local host = frame.bgFrame or frame
		-- Sublevels -7/-6: above a drop shadow drawn on the same host at -8
		frame.roundBox = frame.roundBox or self:CreateRoundedBox(host, frame, radius, -7)
		frame.roundBox:SetLayout(radius, { left = m.left, right = m.right, top = m.top, bottom = m.bottom })
		frame.roundBox:SetBorderColor(r, g, b, a)
		local fill = frame.lastBgColor
		if fill then
			frame.roundBox:SetFillColor(fill[1], fill[2], fill[3], fill[4])
			if frame.bgTexture then
				frame.bgTexture:Hide()
			end
		else
			frame.roundBox:SetFillColor(0, 0, 0, 0)
		end
		frame.roundBox:Show()
		frame.cornerRadius = radius

		frame.borderApplied = true
		frame.fenUIBorderKey = borderKey
		frame.fenUIBorderColorToken = colorToken
		frame.fenUIBorderMargin = margin
		borderedFrames[frame] = true
		return true
	end
	if frame.roundBox then
		frame.roundBox:Hide()
		frame.cornerRadius = nil
	end

	-- Create or reuse border textures
	frame.customBorder = frame.customBorder or {}
	local edges = frame.customBorder

	-- Create/update each edge
	for _, edge in ipairs(BORDER_EDGES) do
		if not edges[edge] then
			edges[edge] = frame:CreateTexture(nil, "BORDER", nil, 5)
		end
		local tex = edges[edge]
		tex:SetColorTexture(r, g, b, a)
		tex:ClearAllPoints()
		tex:Show()
	end

	-- Position edges (simple 4-edge layout)
	-- Top edge
	edges.Top:SetPoint("TOPLEFT", m.left, -m.top)
	edges.Top:SetPoint("TOPRIGHT", -m.right, -m.top)
	edges.Top:SetHeight(edgeSize)

	-- Bottom edge
	edges.Bottom:SetPoint("BOTTOMLEFT", m.left, m.bottom)
	edges.Bottom:SetPoint("BOTTOMRIGHT", -m.right, m.bottom)
	edges.Bottom:SetHeight(edgeSize)

	-- Left edge
	edges.Left:SetPoint("TOPLEFT", m.left, -m.top - edgeSize)
	edges.Left:SetPoint("BOTTOMLEFT", m.left, m.bottom + edgeSize)
	edges.Left:SetWidth(edgeSize)

	-- Right edge
	edges.Right:SetPoint("TOPRIGHT", -m.right, -m.top - edgeSize)
	edges.Right:SetPoint("BOTTOMRIGHT", -m.right, m.bottom + edgeSize)
	edges.Right:SetWidth(edgeSize)

	-- Store state
	frame.borderApplied = true
	frame.fenUIBorderKey = borderKey
	frame.fenUIBorderColorToken = colorToken
	frame.fenUIBorderMargin = margin
	borderedFrames[frame] = true

	return true
end

-- Re-snap borders when the UI scale or resolution changes, otherwise edges
-- sized for the old scale drift to 0px/2px.
local scaleWatcher = CreateFrame("Frame")
scaleWatcher:RegisterEvent("UI_SCALE_CHANGED")
scaleWatcher:RegisterEvent("DISPLAY_SIZE_CHANGED")
scaleWatcher:SetScript("OnEvent", function()
	for frame in pairs(borderedFrames) do
		if frame.borderApplied and frame.fenUIBorderKey then
			FenUI:ApplyBorder(frame, frame.fenUIBorderKey, frame.fenUIBorderColorToken, frame.fenUIBorderMargin)
		end
	end
end)

--- Update the color of an existing border
---@param frame Frame The frame with a border
---@param colorToken string The color token to apply
function FenUI:SetBorderColor(frame, colorToken)
	if not frame.customBorder and not frame.roundBox then
		return
	end

	frame.fenUIBorderColorToken = colorToken
	local r, g, b, a = self:GetColor(colorToken)
	if frame.roundBox and frame.cornerRadius then
		frame.roundBox:SetBorderColor(r, g, b, a)
	end
	for _, tex in pairs(frame.customBorder or {}) do
		if tex.SetColorTexture then
			tex:SetColorTexture(r, g, b, a)
		elseif tex.SetVertexColor then
			tex:SetVertexColor(r, g, b, a)
		end
	end
end

--- Hide the custom border
---@param frame Frame
function FenUI:HideCustomBorder(frame)
	if frame.customBorder then
		for _, tex in pairs(frame.customBorder) do
			tex:Hide()
		end
	end
	-- Rounded box: hide it and hand the fill back to the square background
	if frame.roundBox then
		frame.roundBox:Hide()
		frame.cornerRadius = nil
		local fill = frame.lastBgColor
		if fill and frame.bgTexture then
			frame.bgTexture:SetColorTexture(fill[1], fill[2], fill[3], fill[4])
			frame.bgTexture:Show()
		end
	end
	frame.borderApplied = false
	borderedFrames[frame] = nil
end

--------------------------------------------------------------------------------
-- Rounded Shapes
--
-- WoW has no border-radius. A rounded rectangle is drawn from 4 corner textures
-- (one anti-aliased quarter-disc asset, mirrored per corner with tex coords)
-- plus 3 non-overlapping rects, all white and tinted with SetVertexColor, so
-- translucent colors never double up. A "box" is a border-colored shape with
-- the fill shape inset by one physical pixel on top of it.
--------------------------------------------------------------------------------

local CORNER_TEXCOORDS = {
	TopLeft = { 0, 1, 0, 1 },
	TopRight = { 1, 0, 0, 1 },
	BottomLeft = { 0, 1, 1, 0 },
	BottomRight = { 1, 0, 1, 0 },
}

local function GetCornerAsset()
	return (FenUI.ADDON_PATH or "Interface\\AddOns\\FenUI") .. "\\Assets\\corner-disc-64.png" -- Explicit extension: some clients only resolve extensionless .blp/.tga
end

local ShapeMixin = {}

--- Lay the shape out inside its anchor region
---@param radius number Corner radius in UI units
---@param insets table|number|nil Inset from the anchor edges ({left,right,top,bottom} or a number)
---@param corners table|nil Which corners are rounded ({TopLeft=true,...}); default all
function ShapeMixin:SetLayout(radius, insets, corners)
	local a = self.anchor
	if type(insets) ~= "table" then
		local n = insets or 0
		insets = { left = n, right = n, top = n, bottom = n }
	end
	local l, r, t, b = insets.left or 0, insets.right or 0, insets.top or 0, insets.bottom or 0
	radius = math.max(0, SnapToPixels(a, radius or 0))
	self.radius = radius

	local p = self.parts
	for key, coords in pairs(CORNER_TEXCOORDS) do
		local tex = p[key]
		local rounded = radius > 0 and (not corners or corners[key])
		if rounded then
			tex:SetTexture(GetCornerAsset())
			tex:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
		else
			tex:SetColorTexture(1, 1, 1, 1)
		end
		tex:SetSize(math.max(radius, 0.01), math.max(radius, 0.01))
		tex:ClearAllPoints()
		tex:SetShown(radius > 0 and self.shown)
	end
	p.TopLeft:SetPoint("TOPLEFT", a, "TOPLEFT", l, -t)
	p.TopRight:SetPoint("TOPRIGHT", a, "TOPRIGHT", -r, -t)
	p.BottomLeft:SetPoint("BOTTOMLEFT", a, "BOTTOMLEFT", l, b)
	p.BottomRight:SetPoint("BOTTOMRIGHT", a, "BOTTOMRIGHT", -r, b)

	-- Top strip between the top corners, bottom strip between the bottom corners,
	-- and the middle band spanning the full width
	p.Top:ClearAllPoints()
	p.Top:SetPoint("TOPLEFT", a, "TOPLEFT", l + radius, -t)
	p.Top:SetPoint("BOTTOMRIGHT", a, "TOPRIGHT", -(r + radius), -(t + radius))
	p.Bottom:ClearAllPoints()
	p.Bottom:SetPoint("TOPLEFT", a, "BOTTOMLEFT", l + radius, b + radius)
	p.Bottom:SetPoint("BOTTOMRIGHT", a, "BOTTOMRIGHT", -(r + radius), b)
	p.Middle:ClearAllPoints()
	p.Middle:SetPoint("TOPLEFT", a, "TOPLEFT", l, -(t + radius))
	p.Middle:SetPoint("BOTTOMRIGHT", a, "BOTTOMRIGHT", -r, b + radius)
	p.Top:SetShown(radius > 0 and self.shown)
	p.Bottom:SetShown(radius > 0 and self.shown)
	p.Middle:SetShown(self.shown)
end

function ShapeMixin:SetColor(r, g, b, a)
	for _, tex in pairs(self.parts) do
		tex:SetVertexColor(r, g, b, a or 1)
	end
end

function ShapeMixin:SetShown(shown)
	self.shown = shown and true or false
	for key, tex in pairs(self.parts) do
		tex:SetShown(self.shown and (key == "Middle" or self.radius > 0))
	end
end

function ShapeMixin:Show()
	self:SetShown(true)
end

function ShapeMixin:Hide()
	self:SetShown(false)
end

--- Create a rounded rectangle shape
---@param host Frame Frame that owns the textures (controls draw order)
---@param anchor Region|nil Region the shape fills (defaults to host)
---@param layer string|nil Draw layer (default "BACKGROUND")
---@param sublevel number|nil Draw sublevel (default -8)
---@return table shape
function FenUI:CreateRoundedShape(host, anchor, layer, sublevel)
	local shape = FenUI.Mixin({ host = host, anchor = anchor or host, parts = {}, shown = true, radius = 0 }, ShapeMixin)
	for _, key in ipairs({ "TopLeft", "TopRight", "BottomLeft", "BottomRight", "Top", "Bottom", "Middle" }) do
		local tex = host:CreateTexture(nil, layer or "BACKGROUND", nil, sublevel or -8)
		tex:SetColorTexture(1, 1, 1, 1)
		shape.parts[key] = tex
	end
	return shape
end

local RoundedBoxMixin = {}

--- Lay out the box: border shape at the edges, fill inset by one pixel
---@param radius number
---@param insets table|number|nil Outer inset from the anchor
---@param corners table|nil Rounded corner flags
function RoundedBoxMixin:SetLayout(radius, insets, corners)
	if type(insets) ~= "table" then
		local n = insets or 0
		insets = { left = n, right = n, top = n, bottom = n }
	end
	local px = self.borderShown and SnapToPixels(self.anchor, 1, 1) or 0
	self.border:SetLayout(radius, insets, corners)
	self.fill:SetLayout(math.max(0, (radius or 0) - px), {
		left = (insets.left or 0) + px,
		right = (insets.right or 0) + px,
		top = (insets.top or 0) + px,
		bottom = (insets.bottom or 0) + px,
	}, corners)
	self.layoutArgs = { radius, insets, corners }
end

function RoundedBoxMixin:SetFillColor(r, g, b, a)
	self.fill:SetColor(r, g, b, a)
end

function RoundedBoxMixin:SetBorderColor(r, g, b, a)
	self.border:SetColor(r, g, b, a)
end

--- Show or hide the border ring (the fill then extends to the edges)
function RoundedBoxMixin:SetBorderShown(shown)
	self.borderShown = shown and true or false
	self.border:SetShown(self.borderShown and self.shown)
	if self.layoutArgs then
		self:SetLayout(unpack(self.layoutArgs))
	end
end

function RoundedBoxMixin:SetShown(shown)
	self.shown = shown and true or false
	self.fill:SetShown(self.shown)
	self.border:SetShown(self.shown and self.borderShown)
end

function RoundedBoxMixin:Show()
	self:SetShown(true)
end

function RoundedBoxMixin:Hide()
	self:SetShown(false)
end

--- Create a rounded box (1px border ring + fill)
---@param host Frame Frame that owns the textures
---@param anchor Region|nil Region the box fills (defaults to host)
---@param radius number|string|nil Radius in UI units or a radius token (default "radiusControl")
---@param sublevel number|nil BACKGROUND sublevel for the border (fill draws one above; default -8)
---@return table box
function FenUI:CreateRoundedBox(host, anchor, radius, sublevel)
	sublevel = sublevel or -8
	local box = FenUI.Mixin({ anchor = anchor or host, shown = true, borderShown = true }, RoundedBoxMixin)
	box.border = FenUI:CreateRoundedShape(host, box.anchor, "BACKGROUND", sublevel)
	box.fill = FenUI:CreateRoundedShape(host, box.anchor, "BACKGROUND", sublevel + 1)
	box:SetLayout(FenUI:GetRadius(radius or "radiusControl"), 0)
	return box
end

--------------------------------------------------------------------------------
-- Chevron glyph (WoW fonts have no arrow glyphs; two rotated bars instead)
--------------------------------------------------------------------------------

-- Per direction: bar offsets (x, y) and rotations (degrees, counter-clockwise)
local CHEVRON_LAYOUT = {
	down = { { -2, 0, -45 }, { 2, 0, 45 } },
	up = { { -2, 0, 45 }, { 2, 0, -45 } },
	right = { { 0, 2, -45 }, { 0, -2, 45 } },
	left = { { 0, 2, 45 }, { 0, -2, -45 } },
}

local ChevronMixin = {}

---@param direction string "down" | "up" | "right" | "left"
function ChevronMixin:SetDirection(direction)
	local layout = CHEVRON_LAYOUT[direction] or CHEVRON_LAYOUT.down
	self.direction = direction
	for i, bar in ipairs(self.bars) do
		local spec = layout[i]
		bar:ClearAllPoints()
		bar:SetPoint("CENTER", self, "CENTER", spec[1], spec[2])
		bar:SetRotation(math.rad(spec[3]))
	end
end

function ChevronMixin:SetColor(r, g, b, a)
	for _, bar in ipairs(self.bars) do
		bar:SetColorTexture(r, g, b, a or 1)
	end
end

--- Create a small chevron (v, ^, >, <) drawn from two rotated bars
---@param parent Frame
---@param direction string|nil Default "down"
---@param colorToken string|nil Default "textMuted"
---@return Frame chevron
function FenUI:CreateChevron(parent, direction, colorToken)
	local chevron = FenUI.Mixin(CreateFrame("Frame", nil, parent), ChevronMixin)
	chevron:SetSize(10, 10)
	chevron.bars = {}
	for i = 1, 2 do
		local bar = chevron:CreateTexture(nil, "OVERLAY")
		bar:SetSize(6, SnapToPixels(chevron, 1.5, 1))
		if bar.SetSnapToPixelGrid then
			bar:SetSnapToPixelGrid(false)
			bar:SetTexelSnappingBias(0)
		end
		chevron.bars[i] = bar
	end
	chevron:SetDirection(direction or "down")
	chevron:SetColor(FenUI:GetColor(colorToken or "textMuted"))
	return chevron
end

--------------------------------------------------------------------------------
-- NineSlice Application
--------------------------------------------------------------------------------

--- Apply a NineSlice layout to a frame
---@param frame Frame The frame to apply the layout to
---@param layoutName string The layout name (FenUI alias or Blizzard name)
---@param textureKit string|nil Optional texture kit for themed layouts
---@param margin table|nil Optional margin {top, bottom, left, right}
---@return boolean success
function FenUI:ApplyLayout(frame, layoutName, textureKit, margin)
	if not NineSliceUtil or not NineSliceLayouts then
		FenUI:Debug("NineSliceUtil not available")
		return false
	end

	local blizzardLayoutName = self:ResolveLayoutName(layoutName)
	local layout = NineSliceLayouts[blizzardLayoutName]

	if not layout then
		FenUI:Debug("Layout not found:", blizzardLayoutName)
		return false
	end

	-- Apply the layout
	NineSliceUtil.ApplyLayout(frame, layout, textureKit)

	-- Apply margins if provided
	if margin then
		local m = margin
		if frame.TopLeftCorner then
			frame.TopLeftCorner:ClearAllPoints()
			frame.TopLeftCorner:SetPoint("TOPLEFT", m.left, -m.top)
		end
		if frame.TopRightCorner then
			frame.TopRightCorner:ClearAllPoints()
			frame.TopRightCorner:SetPoint("TOPRIGHT", -m.right, -m.top)
		end
		if frame.BottomLeftCorner then
			frame.BottomLeftCorner:ClearAllPoints()
			frame.BottomLeftCorner:SetPoint("BOTTOMLEFT", m.left, m.bottom)
		end
		if frame.BottomRightCorner then
			frame.BottomRightCorner:ClearAllPoints()
			frame.BottomRightCorner:SetPoint("BOTTOMRIGHT", -m.right, m.bottom)
		end
		-- Note: Edges are usually anchored to corners by NineSliceUtil,
		-- so they should follow automatically.
	end

	-- Store layout info on the frame
	frame.fenUILayout = blizzardLayoutName
	frame.fenUITextureKit = textureKit

	FenUI:Debug("Applied layout:", blizzardLayoutName, textureKit and ("with kit: " .. textureKit) or "")
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
		"TopLeftCorner",
		"TopRightCorner",
		"BottomLeftCorner",
		"BottomRightCorner",
		"TopEdge",
		"BottomEdge",
		"LeftEdge",
		"RightEdge",
		"Center",
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
		"TopLeftCorner",
		"TopRightCorner",
		"BottomLeftCorner",
		"BottomRightCorner",
		"TopEdge",
		"BottomEdge",
		"LeftEdge",
		"RightEdge",
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
	-- Modern (11.0+)
	warwithin = true,
	midnight = true,

	-- Previous expansions
	dragonflight = true,
	oribos = true,

	-- Faction
	horde = true,
	alliance = true,
	neutral = true,
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

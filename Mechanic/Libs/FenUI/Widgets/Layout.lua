--------------------------------------------------------------------------------
-- FenUI v2 - Layout Widget
--
-- Foundational container primitive that unifies:
-- - Borders (NineSlice)
-- - Backgrounds (color, image, gradient, conditional)
-- - Shadows (inner using Blizzard textures, drop shadows when available)
-- - Cell-based structure (single-cell or multi-row)
--
-- All other containers (Panel, Inset, Dialog, Card) build on this.
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- Shadow Textures
--------------------------------------------------------------------------------

-- Blizzard assets for inner shadow
local INNER_SHADOW_TEXTURES = {
	corner = "Interface\\Common\\ShadowOverlay-Corner",
	top = "Interface\\Common\\ShadowOverlay-Top",
	bottom = "Interface\\Common\\ShadowOverlay-Bottom",
	left = "Interface\\Common\\ShadowOverlay-Left",
	right = "Interface\\Common\\ShadowOverlay-Right",
}

-- Custom FenUI assets for drop shadows and glows
-- Paths are resolved at runtime using FenUI.ADDON_PATH
local DROP_SHADOW_TEXTURES -- Will be populated on first use

local function GetDropShadowTextures()
	if not DROP_SHADOW_TEXTURES then
		local basePath = (FenUI.ADDON_PATH or "Interface\\AddOns\\FenUI") .. "\\Assets\\"
		DROP_SHADOW_TEXTURES = {
			soft = basePath .. "shadow-soft-64",
			hard = basePath .. "shadow-hard-64",
			glowSoft = basePath .. "glow-soft-64",
			glowHard = basePath .. "glow-hard-24",
		}
	end
	return DROP_SHADOW_TEXTURES
end

-- Default sizes
local INNER_SHADOW_SIZE = 24 -- Blizzard default
local DROP_SHADOW_SIZE = 16 -- Default drop shadow offset
local GLOW_SIZE = 12 -- Default glow size

--------------------------------------------------------------------------------
-- Background Helper Functions
--------------------------------------------------------------------------------

--- Resolve a background config to its type and values
---@param bgConfig string|table Background configuration
---@return string type ("color"|"image"|"gradient"|"conditional")
---@return table values Resolved values for the background type
local function ResolveBackgroundConfig(bgConfig)
	if type(bgConfig) == "string" then
		-- Simple token string = color
		return "color", { token = bgConfig }
	end

	if type(bgConfig) == "table" then
		if bgConfig.gradient then
			return "gradient", bgConfig.gradient
		elseif bgConfig.image then
			return "image", bgConfig
		elseif bgConfig.condition or bgConfig.variants then
			return "conditional", bgConfig
		elseif bgConfig.color then
			return "color", { token = bgConfig.color, alpha = bgConfig.alpha }
		end
	end

	return "none", {}
end

--------------------------------------------------------------------------------
-- Layout Mixin
--------------------------------------------------------------------------------

local LayoutMixin = {}

function LayoutMixin:Init(config)
	self.config = config or {}
	self.cells = {}

	-- Create layers in order (bottom to top)
	self:CreateBackgroundLayer()
	self:CreateBorderLayer()
	self:CreateShadowLayer()
	self:CreateContentLayer()

	-- Unified resizing hook
	-- This handles deferred sizing from anchor-based positioning and child-driven auto-sizing.
	self:HookScript("OnSizeChanged", function(frame, width, height)
		if width > 0 and height > 0 then
			if frame.bgFrame then
				frame:ApplyBackgroundAnchors()
			end
			if frame.cells and #frame.cells > 0 then
				frame:LayoutCells()
			end
		end
	end)

	-- Apply size (supports responsive strings like "50%" and "auto", and constraints)
	if
		config.width
		or config.height
		or config.minWidth
		or config.maxWidth
		or config.minHeight
		or config.maxHeight
		or config.aspectRatio
	then
		self:ApplySize(config.width, config.height, {
			minWidth = config.minWidth,
			maxWidth = config.maxWidth,
			minHeight = config.minHeight,
			maxHeight = config.maxHeight,
			aspectRatio = config.aspectRatio,
			aspectBase = config.aspectBase,
		})
	end

	-- Apply border FIRST (sets background inset for chamfered corners)
	if config.border then
		self:SetBorder(config.border)
	end

	-- Apply background AFTER border (so inset is already set)
	if config.background then
		self:SetBackground(config.background)
	end

	-- Apply shadow
	if config.shadow then
		self:SetShadow(config.shadow)
	end

	-- Create cells if multi-row or multi-column mode
	if config.rows or config.cols then
		self:CreateCells()
	end

	-- Hook content for auto-sizing
	if self.isAutoSizing then
		FenUI.Utils:ObserveIntrinsicSize(self, self:GetContentFrame())
	end

	-- Setup animations and transitions
	if config.transitions then
		FenUI.Animation:ApplyTransitions(self, config.transitions)
	end

	if config.showAnimation or config.hideAnimation then
		self:SetupLifecycleAnimations()
	end
end

--------------------------------------------------------------------------------
-- Background Layer
--------------------------------------------------------------------------------
--
-- ARCHITECTURE: NineSlice Compatibility
-- -------------------------------------
-- In WoW 9.1.5+, frames using NineSlice borders cannot reliably render textures
-- created directly on them. The NineSlice system takes over texture management.
--
-- SOLUTION: Create a dedicated child frame (bgFrame) at frameLevel 0.
-- The background texture lives on bgFrame, which renders BELOW the NineSlice
-- border pieces. This follows Blizzard's pattern in FlatPanelBackgroundTemplate.
--
-- Frame Hierarchy:
--   Layout Frame (NineSlice border at level 1+)
--     └── bgFrame (frameLevel 0)
--           └── bgTexture (fills bgFrame)
--
-- DEFERRED SIZING FIX:
-- Frames positioned via anchor points (TOPLEFT + BOTTOMRIGHT) have 0x0 size
-- at Init() time. The OnSizeChanged handler reapplies background anchors
-- when the frame receives its actual size.
--

-- Default inset for backgrounds when borders are applied
-- We use a small 2px inset by default to ensure the background stays within
-- the border's visual edge without leaving large transparent gaps.
local DEFAULT_BG_INSET = 2

--- Set the size of the layout (supports responsive units)
---@param width number|string
---@param height number|string
---@param constraints table|nil { minWidth, maxWidth, minHeight, maxHeight, aspectRatio, aspectBase }
function LayoutMixin:ApplySize(width, height, constraints)
	FenUI.Utils:ApplySize(self, width, height, constraints)
end

--- Internal method called when parent resizes (for responsive units)
function LayoutMixin:UpdateDynamicSize()
	FenUI.Utils:UpdateDynamicSize(self)
end

function LayoutMixin:CreateBackgroundLayer()
	-- Create a dedicated background frame
	-- We don't set a fixed frame level of 0, as that can put it behind the parent
	-- frame's background if the parent is at a high frame level.
	-- Instead, we let it inherit and we'll manage layering via draw layers
	-- or a slightly lower frame level than the parent.
	self.bgFrame = CreateFrame("Frame", nil, self)

	-- INSPECT SUPPORT: Enable mouse to be visible to GetMouseFoci(),
	-- but disable clicking so it remains transparent to user interaction.
	self.bgFrame:EnableMouse(true)
	if self.bgFrame.SetMouseClickEnabled then
		self.bgFrame:SetMouseClickEnabled(false)
	end

	-- Ensure it's at the bottom of the parent's internal stack
	local parentLevel = self:GetFrameLevel()
	self.bgFrame:SetFrameLevel(math.max(0, parentLevel - 1))

	-- Create the background texture on bgFrame (not self)
	self.bgTexture = self.bgFrame:CreateTexture(nil, "BACKGROUND", nil, -8)
	self.bgTexture:SetAllPoints(self.bgFrame)
	self.bgTexture:Hide()

	-- Image background frame (for Image component)
	self.bgImageFrame = nil

	-- Background inset (applied when border is set)
	-- Supports both number (symmetric) and table (asymmetric) values
	self.bgInset = 0
end

--- Set background inset
---@param inset number Pixels to inset from edges
function LayoutMixin:SetBackgroundInset(inset)
	self.bgInset = inset or 0
	self:ApplyBackgroundAnchors()
end

--- Apply background anchors with inset
function LayoutMixin:ApplyBackgroundAnchors()
	-- NOTE: Systematic Background Anchoring (NineSlice Compatible)
	-- We position bgFrame (not bgTexture) inside the border area.
	-- bgTexture fills bgFrame via SetAllPoints.
	-- This avoids NineSlice conflicts by using a dedicated child frame.

	-- GUARD: Prevent re-entrancy during anchor updates which might trigger OnSizeChanged
	if self.isApplyingBackgroundAnchors then return end
	self.isApplyingBackgroundAnchors = true

	-- Support both single-value inset (number) and asymmetric inset (table)
	local inset = self.bgInset or 0
	local left, right, top, bottom

	if type(inset) == "table" then
		left = inset.left or 0
		right = inset.right or 0
		top = inset.top or 0
		bottom = inset.bottom or 0
	else
		left, right, top, bottom = inset, inset, inset, inset
	end

	-- Incorporate margins
	local m = self:GetMargin()
	left = left + m.left
	right = right + m.right
	top = top + m.top
	bottom = bottom + m.bottom

	-- Position the background frame inside the border (asymmetric)
	self.bgFrame:ClearAllPoints()
	self.bgFrame:SetPoint("TOPLEFT", self, "TOPLEFT", left, -top)
	self.bgFrame:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -right, bottom)

	-- bgTexture already fills bgFrame via SetAllPoints in CreateBackgroundLayer

	-- Also apply to image background if present
	if self.bgImageFrame then
		self.bgImageFrame:ClearAllPoints()
		self.bgImageFrame:SetPoint("TOPLEFT", self, "TOPLEFT", left, -top)
		self.bgImageFrame:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -right, bottom)
	end

	self.isApplyingBackgroundAnchors = nil
end

--- Set the background
---@param bgConfig string|table Background configuration
function LayoutMixin:SetBackground(bgConfig)
	if not bgConfig or bgConfig == false then
		self.bgTexture:Hide()
		if self.bgImageFrame then
			self.bgImageFrame:Hide()
		end
		-- Restore NineSlice center if we have one
		if self.Center then
			self.Center:Show()
		end
		return
	end

	-- Hide NineSlice's built-in center when we use custom background
	-- This prevents double-layering and edge bleeding
	if self.Center then
		self.Center:Hide()
	end

	local bgType, values = ResolveBackgroundConfig(bgConfig)

	if bgType == "color" then
		self:ApplyColorBackground(values)
	elseif bgType == "gradient" then
		self:ApplyGradientBackground(values)
	elseif bgType == "image" or bgType == "conditional" then
		self:ApplyImageBackground(bgConfig)
	end
end

function LayoutMixin:ApplyColorBackground(values)
	-- Hide image background if present
	if self.bgImageFrame then
		self.bgImageFrame:Hide()
	end

	-- Resolve the background color using FenUI's token system.
	-- FenUI:GetColor(token) handles the multi-tier resolution:
	-- 1. Active Theme overrides -> 2. Semantic token -> 3. Primitive value.
	local r, g, b, a = FenUI:GetColor(values.token)

	-- If a specific alpha was provided in the config, it overrides the token's alpha.
	if values.alpha then
		a = values.alpha
	end

	-- Applying the final color to the dedicated bgFrame texture.
	-- Using a dedicated child frame at level 0 avoids rendering conflicts with NineSlice borders.
	self.bgTexture:SetColorTexture(r, g, b, a)
	self:ApplyBackgroundAnchors()
	self.bgTexture:Show()
end

function LayoutMixin:ApplyGradientBackground(values)
	-- Hide image background if present
	if self.bgImageFrame then
		self.bgImageFrame:Hide()
	end

	-- Use white texture as base for gradient
	self.bgTexture:SetColorTexture(1, 1, 1, 1)

	-- Resolve colors
	local fromR, fromG, fromB, fromA = FenUI:GetColor(values.from)
	local toR, toG, toB, toA = FenUI:GetColor(values.to)

	local orientation = values.orientation or "VERTICAL"
	self.bgTexture:SetGradient(
		orientation,
		CreateColor(fromR, fromG, fromB, fromA or 1),
		CreateColor(toR, toG, toB, toA or 1)
	)

	self:ApplyBackgroundAnchors()
	self.bgTexture:Show()
end

function LayoutMixin:ApplyImageBackground(bgConfig)
	-- Hide color texture
	self.bgTexture:Hide()

	-- Create Image component if needed
	if not self.bgImageFrame then
		self.bgImageFrame = FenUI:CreateImage(self, {
			fill = true,
			drawLayer = "BACKGROUND",
		})
		self.bgImageFrame:SetFrameLevel(self:GetFrameLevel())
	end

	-- Configure the image
	if bgConfig.condition or bgConfig.variants then
		self.bgImageFrame.config.condition = bgConfig.condition
		self.bgImageFrame.config.variants = bgConfig.variants
		self.bgImageFrame.config.fallback = bgConfig.fallback
	elseif bgConfig.image then
		self.bgImageFrame.config.texture = bgConfig.image
		self.bgImageFrame.config.condition = nil
		self.bgImageFrame.config.variants = nil
	end

	if bgConfig.alpha then
		self.bgImageFrame:SetImageAlpha(bgConfig.alpha)
	end

	self.bgImageFrame:Refresh()
	self.bgImageFrame:Show()
end

--------------------------------------------------------------------------------
-- Border Layer
--------------------------------------------------------------------------------

function LayoutMixin:CreateBorderLayer()
	-- Border will be applied via NineSlice
	self.borderApplied = false
end

--------------------------------------------------------------------------------
-- Background Insets for Border Types
--------------------------------------------------------------------------------
--
-- WHY ASYMMETRIC INSETS:
-- NineSlice borders like ButtonFrameTemplateNoPortrait have chamfered (angled)
-- corners. The background must be inset far enough to not "bleed" outside
-- these chamfers, but not so far that it creates visible gaps on straight edges.
--
-- Blizzard uses this same pattern in FlatPanelBackgroundTemplate:
--   TOPLEFT x="6" y="-20", BOTTOMRIGHT x="-2" y="2"
--
-- HOW TO ADD NEW BORDER TYPES:
-- 1. Find the NineSlice layout name (e.g., "Panel", "Inset", "Dialog")
-- 2. Test in-game to find the minimum inset that prevents bleeding
-- 3. Add an entry: BorderName = { left = N, right = N, top = N, bottom = N }
--
-- HOW TO OVERRIDE FOR A SPECIFIC LAYOUT:
-- Pass `backgroundInset` in the config table:
--   FenUI:CreateLayout(parent, {
--       border = "Panel",
--       backgroundInset = { left = 8, right = 4, top = 8, bottom = 4 },
--   })
--
local BORDER_INSETS = {
	-- Legacy borders
	Panel = { left = 6, right = 2, top = 6, bottom = 2 }, -- ButtonFrameTemplateNoPortrait (chamfered corners)
	Inset = { left = 2, right = 2, top = 2, bottom = 2 }, -- InsetFrameTemplate (small uniform edges)
	Dialog = { left = 6, right = 6, top = 6, bottom = 6 }, -- DialogBorderTemplate (symmetric chamfers)

	-- Modern borders (11.0+ style)
	Modern = { left = 6, right = 6, top = 6, bottom = 6 }, -- GenericMetal (clean symmetric edges)
	Metal = { left = 6, right = 6, top = 6, bottom = 6 }, -- Alias for Modern

	-- Tooltip borders
	Tooltip = { left = 8, right = 8, top = 10, bottom = 7 }, -- TooltipGluesLayout
}

--- Set the border
---@param borderKey string|false Border pack name or false to remove
function LayoutMixin:SetBorder(borderKey)
	if not borderKey or borderKey == false then
		if self.borderApplied then
			FenUI:HideCustomBorder(self)
			-- Also check for legacy NineSlice hide if we support both
			if FenUI.HideLayout then
				FenUI:HideLayout(self)
			end
		end
		self.borderApplied = false
		self:SetBackgroundInset(0)
		return
	end

	-- 1. Try Custom Border Engine First (Intentional Custom)
	local pack = FenUI:GetBorderPack(borderKey)
	local margin = self:GetMargin()
	if pack then
		if FenUI:ApplyBorder(self, borderKey, self.config.borderToken, margin) then
			self.borderApplied = true

			-- Apply pack-specific insets
			local bgInset = self.config.backgroundInset or pack.bgInset or 0
			self:SetBackgroundInset(bgInset)

			-- Store padding adjustment if contentInset is provided
			self.contentInset = pack.contentInset or 0
			return true
		end
	end

	-- 2. Legacy Fallback: Blizzard NineSlice (if key is in FenUI.Layouts)
	if FenUI.ApplyLayout and (FenUI.Layouts[borderKey] or NineSliceLayouts[borderKey]) then
		FenUI:ApplyLayout(self, borderKey, self.config.textureKit, margin)
		self.borderApplied = true

		local inset = self.config.backgroundInset
		if inset == nil then
			inset = BORDER_INSETS[borderKey] or DEFAULT_BG_INSET
		end
		self:SetBackgroundInset(inset)
		return true
	end

	FenUI:Debug("SetBorder failed: unknown border key", borderKey)
	return false
end

--- Get whether a border is applied
---@return boolean
function LayoutMixin:HasBorder()
	return self.borderApplied
end

--------------------------------------------------------------------------------
-- Shadow Layer (Inner Shadow using Blizzard textures)
--------------------------------------------------------------------------------

function LayoutMixin:CreateShadowLayer()
	self.shadowTextures = nil
	self.shadowType = nil
end

--- Set shadow
---@param shadowConfig string|table|boolean Shadow configuration
function LayoutMixin:SetShadow(shadowConfig)
	if not shadowConfig or shadowConfig == false then
		self:HideShadow()
		return
	end

	-- Normalize config
	local config = shadowConfig
	if type(shadowConfig) == "string" then
		config = { type = shadowConfig }
	elseif shadowConfig == true then
		config = { type = "inner" }
	end

	local shadowType = config.type or "inner"

	if shadowType == "inner" then
		self:ApplyInnerShadow(config)
	elseif shadowType == "soft" or shadowType == "hard" or shadowType == "glow" then
		-- Drop shadows - requires custom textures (placeholder for now)
		self:ApplyDropShadow(config)
	end

	self.shadowType = shadowType
end

function LayoutMixin:ApplyInnerShadow(config)
	-- Create shadow textures if needed
	if not self.shadowTextures then
		self.shadowTextures = {}

		-- Create 8 textures: 4 corners + 4 edges
		local size = config.size or INNER_SHADOW_SIZE
		local alpha = config.alpha or 0.5

		-- Top-left corner
		self.shadowTextures.topLeft = self:CreateTexture(nil, "OVERLAY")
		self.shadowTextures.topLeft:SetTexture(INNER_SHADOW_TEXTURES.corner)
		self.shadowTextures.topLeft:SetSize(size, size)
		self.shadowTextures.topLeft:SetPoint("TOPLEFT")
		self.shadowTextures.topLeft:SetAlpha(alpha)

		-- Top-right corner (rotated)
		self.shadowTextures.topRight = self:CreateTexture(nil, "OVERLAY")
		self.shadowTextures.topRight:SetTexture(INNER_SHADOW_TEXTURES.corner)
		self.shadowTextures.topRight:SetSize(size, size)
		self.shadowTextures.topRight:SetPoint("TOPRIGHT")
		self.shadowTextures.topRight:SetTexCoord(0, 1, 1, 1, 0, 0, 1, 0)
		self.shadowTextures.topRight:SetAlpha(alpha)

		-- Bottom-left corner (rotated)
		self.shadowTextures.bottomLeft = self:CreateTexture(nil, "OVERLAY")
		self.shadowTextures.bottomLeft:SetTexture(INNER_SHADOW_TEXTURES.corner)
		self.shadowTextures.bottomLeft:SetSize(size, size)
		self.shadowTextures.bottomLeft:SetPoint("BOTTOMLEFT")
		self.shadowTextures.bottomLeft:SetTexCoord(1, 0, 0, 0, 1, 1, 0, 1)
		self.shadowTextures.bottomLeft:SetAlpha(alpha)

		-- Bottom-right corner (rotated)
		self.shadowTextures.bottomRight = self:CreateTexture(nil, "OVERLAY")
		self.shadowTextures.bottomRight:SetTexture(INNER_SHADOW_TEXTURES.corner)
		self.shadowTextures.bottomRight:SetSize(size, size)
		self.shadowTextures.bottomRight:SetPoint("BOTTOMRIGHT")
		self.shadowTextures.bottomRight:SetTexCoord(1, 1, 1, 0, 0, 1, 0, 0)
		self.shadowTextures.bottomRight:SetAlpha(alpha)

		-- Top edge
		self.shadowTextures.top = self:CreateTexture(nil, "OVERLAY")
		self.shadowTextures.top:SetTexture(INNER_SHADOW_TEXTURES.top)
		self.shadowTextures.top:SetHeight(size)
		self.shadowTextures.top:SetPoint("TOPLEFT", self.shadowTextures.topLeft, "TOPRIGHT")
		self.shadowTextures.top:SetPoint("TOPRIGHT", self.shadowTextures.topRight, "TOPLEFT")
		self.shadowTextures.top:SetAlpha(alpha)

		-- Bottom edge
		self.shadowTextures.bottom = self:CreateTexture(nil, "OVERLAY")
		self.shadowTextures.bottom:SetTexture(INNER_SHADOW_TEXTURES.bottom)
		self.shadowTextures.bottom:SetHeight(size)
		self.shadowTextures.bottom:SetPoint("BOTTOMLEFT", self.shadowTextures.bottomLeft, "BOTTOMRIGHT")
		self.shadowTextures.bottom:SetPoint("BOTTOMRIGHT", self.shadowTextures.bottomRight, "BOTTOMLEFT")
		self.shadowTextures.bottom:SetAlpha(alpha)

		-- Left edge
		self.shadowTextures.left = self:CreateTexture(nil, "OVERLAY")
		self.shadowTextures.left:SetTexture(INNER_SHADOW_TEXTURES.left)
		self.shadowTextures.left:SetWidth(size)
		self.shadowTextures.left:SetPoint("TOPLEFT", self.shadowTextures.topLeft, "BOTTOMLEFT")
		self.shadowTextures.left:SetPoint("BOTTOMLEFT", self.shadowTextures.bottomLeft, "TOPLEFT")
		self.shadowTextures.left:SetAlpha(alpha)

		-- Right edge
		self.shadowTextures.right = self:CreateTexture(nil, "OVERLAY")
		self.shadowTextures.right:SetTexture(INNER_SHADOW_TEXTURES.right)
		self.shadowTextures.right:SetWidth(size)
		self.shadowTextures.right:SetPoint("TOPRIGHT", self.shadowTextures.topRight, "BOTTOMRIGHT")
		self.shadowTextures.right:SetPoint("BOTTOMRIGHT", self.shadowTextures.bottomRight, "TOPRIGHT")
		self.shadowTextures.right:SetAlpha(alpha)
	end

	-- Show all shadow textures
	for _, tex in pairs(self.shadowTextures) do
		tex:Show()
	end
end

function LayoutMixin:ApplyDropShadow(config)
	local shadowType = config.type or "soft"
	local isGlow = shadowType == "glow" or shadowType == "glowHard"
	local textures = GetDropShadowTextures()

	-- Select texture based on type
	local texture
	local size
	if shadowType == "soft" then
		texture = textures.soft
		size = config.size or 16
	elseif shadowType == "hard" then
		texture = textures.hard
		size = config.size or 12
	elseif shadowType == "glow" then
		texture = textures.glowSoft
		size = config.size or 16
	elseif shadowType == "glowHard" then
		texture = textures.glowHard
		size = config.size or 8
	else
		texture = textures.soft
		size = config.size or 16
	end

	local alpha = config.alpha or (isGlow and 0.8 or 0.6)
	local offsetX = config.offsetX or (isGlow and 0 or 4)
	local offsetY = config.offsetY or (isGlow and 0 or -4)

	-- Create shadow frame if needed (sits behind the main frame)
	if not self.dropShadowFrame then
		self.dropShadowFrame = CreateFrame("Frame", nil, self:GetParent())
		self.dropShadowFrame:SetFrameLevel(math.max(1, self:GetFrameLevel() - 1))

		-- Create 9 textures for proper scaling: 4 corners, 4 edges, 1 center
		self.dropShadowTextures = {}

		-- Corners (use full texture, positioned at corners)
		for _, corner in ipairs({ "TopLeft", "TopRight", "BottomLeft", "BottomRight" }) do
			local tex = self.dropShadowFrame:CreateTexture(nil, "BACKGROUND")
			tex:SetBlendMode(isGlow and "ADD" or "BLEND")
			self.dropShadowTextures[corner] = tex
		end

		-- Edges (stretched)
		for _, edge in ipairs({ "Top", "Bottom", "Left", "Right" }) do
			local tex = self.dropShadowFrame:CreateTexture(nil, "BACKGROUND")
			tex:SetBlendMode(isGlow and "ADD" or "BLEND")
			self.dropShadowTextures[edge] = tex
		end

		-- Center (optional, for very soft shadows)
		self.dropShadowTextures.Center = self.dropShadowFrame:CreateTexture(nil, "BACKGROUND")
		self.dropShadowTextures.Center:SetBlendMode(isGlow and "ADD" or "BLEND")
	end

	-- Update frame position relative to main frame
	local m = self:GetMargin()
	self.dropShadowFrame:ClearAllPoints()
	self.dropShadowFrame:SetPoint("TOPLEFT", self, "TOPLEFT", m.left - size + offsetX, -(m.top - size + offsetY))
	self.dropShadowFrame:SetPoint(
		"BOTTOMRIGHT",
		self,
		"BOTTOMRIGHT",
		-(m.right - size + offsetX),
		m.bottom - size + offsetY
	)

	-- Apply tint color for glows
	local r, g, b = 0, 0, 0 -- Default black for shadows
	if isGlow and config.color then
		r, g, b = FenUI:GetColorRGB(config.color)
	elseif isGlow then
		r, g, b = FenUI:GetColorRGB("gold500") -- Default gold glow
	end

	-- Configure all textures
	for name, tex in pairs(self.dropShadowTextures) do
		tex:SetTexture(texture)
		tex:SetVertexColor(r, g, b, alpha)
		tex:SetSize(size, size)
	end

	-- Position corners
	self.dropShadowTextures.TopLeft:SetPoint("TOPLEFT", 0, 0)
	self.dropShadowTextures.TopLeft:SetTexCoord(0, 0.5, 0, 0.5)

	self.dropShadowTextures.TopRight:SetPoint("TOPRIGHT", 0, 0)
	self.dropShadowTextures.TopRight:SetTexCoord(0.5, 1, 0, 0.5)

	self.dropShadowTextures.BottomLeft:SetPoint("BOTTOMLEFT", 0, 0)
	self.dropShadowTextures.BottomLeft:SetTexCoord(0, 0.5, 0.5, 1)

	self.dropShadowTextures.BottomRight:SetPoint("BOTTOMRIGHT", 0, 0)
	self.dropShadowTextures.BottomRight:SetTexCoord(0.5, 1, 0.5, 1)

	-- Position edges (stretched between corners)
	self.dropShadowTextures.Top:SetPoint("TOPLEFT", self.dropShadowTextures.TopLeft, "TOPRIGHT", 0, 0)
	self.dropShadowTextures.Top:SetPoint("TOPRIGHT", self.dropShadowTextures.TopRight, "TOPLEFT", 0, 0)
	self.dropShadowTextures.Top:SetHeight(size)
	self.dropShadowTextures.Top:SetTexCoord(0.5, 0.5, 0, 0.5) -- Vertical slice from center

	self.dropShadowTextures.Bottom:SetPoint("BOTTOMLEFT", self.dropShadowTextures.BottomLeft, "BOTTOMRIGHT", 0, 0)
	self.dropShadowTextures.Bottom:SetPoint("BOTTOMRIGHT", self.dropShadowTextures.BottomRight, "BOTTOMLEFT", 0, 0)
	self.dropShadowTextures.Bottom:SetHeight(size)
	self.dropShadowTextures.Bottom:SetTexCoord(0.5, 0.5, 0.5, 1)

	self.dropShadowTextures.Left:SetPoint("TOPLEFT", self.dropShadowTextures.TopLeft, "BOTTOMLEFT", 0, 0)
	self.dropShadowTextures.Left:SetPoint("BOTTOMLEFT", self.dropShadowTextures.BottomLeft, "TOPLEFT", 0, 0)
	self.dropShadowTextures.Left:SetWidth(size)
	self.dropShadowTextures.Left:SetTexCoord(0, 0.5, 0.5, 0.5) -- Horizontal slice from center

	self.dropShadowTextures.Right:SetPoint("TOPRIGHT", self.dropShadowTextures.TopRight, "BOTTOMRIGHT", 0, 0)
	self.dropShadowTextures.Right:SetPoint("BOTTOMRIGHT", self.dropShadowTextures.BottomRight, "TOPRIGHT", 0, 0)
	self.dropShadowTextures.Right:SetWidth(size)
	self.dropShadowTextures.Right:SetTexCoord(0.5, 1, 0.5, 0.5)

	-- Center fill (very subtle, optional)
	self.dropShadowTextures.Center:SetPoint("TOPLEFT", self.dropShadowTextures.TopLeft, "BOTTOMRIGHT", 0, 0)
	self.dropShadowTextures.Center:SetPoint("BOTTOMRIGHT", self.dropShadowTextures.BottomRight, "TOPLEFT", 0, 0)
	self.dropShadowTextures.Center:SetTexCoord(0.45, 0.55, 0.45, 0.55) -- Center slice
	self.dropShadowTextures.Center:SetAlpha(alpha * 0.3) -- Much more subtle

	self.dropShadowFrame:Show()
end

function LayoutMixin:HideShadow()
	-- Hide inner shadow textures
	if self.shadowTextures then
		for _, tex in pairs(self.shadowTextures) do
			tex:Hide()
		end
	end
	-- Hide drop shadow frame
	if self.dropShadowFrame then
		self.dropShadowFrame:Hide()
	end
	self.shadowType = nil
end

--- Set shadow alpha
---@param alpha number 0-1
function LayoutMixin:SetShadowAlpha(alpha)
	-- Inner shadow textures
	if self.shadowTextures then
		for _, tex in pairs(self.shadowTextures) do
			tex:SetAlpha(alpha)
		end
	end
	-- Drop shadow textures
	if self.dropShadowTextures then
		for name, tex in pairs(self.dropShadowTextures) do
			if name == "Center" then
				tex:SetAlpha(alpha * 0.3) -- Center stays more subtle
			else
				tex:SetAlpha(alpha)
			end
		end
	end
end

--------------------------------------------------------------------------------
-- Content Layer (Single-cell or Multi-row)
--------------------------------------------------------------------------------

function LayoutMixin:CreateContentLayer()
	-- Content frame for single-cell mode
	self.contentFrame = nil
end

--- Get the content frame (creates if needed for single-cell mode)
---@return Frame
function LayoutMixin:GetContentFrame()
	if not self.contentFrame then
		self.contentFrame = CreateFrame("Frame", nil, self)

		local p = self:GetPadding()
		local m = self:GetMargin()
		self.contentFrame:SetPoint("TOPLEFT", m.left + p.left, -(m.top + p.top))

		-- In auto-sizing mode, we don't anchor the bottom-right to the parent,
		-- as that would create a circular dependency.
		if self.dynamicSize and (self.dynamicSize.width == "auto" or self.dynamicSize.height == "auto") then
			-- Let children define the size
		else
			self.contentFrame:SetPoint("BOTTOMRIGHT", -(m.right + p.right), m.bottom + p.bottom)
		end
	end
	return self.contentFrame
end

--- Set content for single-cell mode
---@param frame Frame Frame to place in content area
function LayoutMixin:SetContent(frame)
	if not frame then
		return
	end

	local content = self:GetContentFrame()
	frame:SetParent(content)
	frame:ClearAllPoints()
	frame:SetAllPoints()
	frame:Show()
end

function LayoutMixin:SetupLifecycleAnimations()
	local config = self.config

	if config.showAnimation then
		self:HookScript("OnShow", function()
			FenUI.Animation:Play(self, config.showAnimation)
		end)
	end

	if config.hideAnimation then
		local originalHide = self.Hide
		self.Hide = function(f)
			FenUI.Animation:Play(f, config.hideAnimation, {
				onComplete = function()
					originalHide(f)
				end,
			})
		end
	end
end

--- Get margin values (from config or tokens)
--- Supports: number (symmetric), string (token), table { top, bottom, left, right }
--- Individual overrides: marginTop, marginBottom, marginLeft, marginRight
---@return table { top, bottom, left, right }
function LayoutMixin:GetMargin()
	local config = self.config
	local margin = config.margin
	local base = { top = 0, bottom = 0, left = 0, right = 0 }

	if margin then
		if type(margin) == "number" then
			base = { top = margin, bottom = margin, left = margin, right = margin }
		elseif type(margin) == "string" then
			local val = FenUI:GetSpacing(margin)
			if val == 0 then
				val = FenUI:GetLayout(margin)
			end
			base = { top = val, bottom = val, left = val, right = val }
		elseif type(margin) == "table" then
			base = {
				top = margin.top or 0,
				bottom = margin.bottom or 0,
				left = margin.left or 0,
				right = margin.right or 0,
			}
		end
	end

	-- Apply individual side overrides
	if config.marginTop then
		base.top = FenUI:GetSpacing(config.marginTop)
	end
	if config.marginBottom then
		base.bottom = FenUI:GetSpacing(config.marginBottom)
	end
	if config.marginLeft then
		base.left = FenUI:GetSpacing(config.marginLeft)
	end
	if config.marginRight then
		base.right = FenUI:GetSpacing(config.marginRight)
	end

	return base
end

--- Get padding values (from config or tokens)
--- Supports: number (symmetric), string (token), table { top, bottom, left, right }
--- Individual overrides: paddingTop, paddingBottom, paddingLeft, paddingRight
---@return table { top, bottom, left, right }
function LayoutMixin:GetPadding()
	local config = self.config
	local padding = config.padding
	local base = { top = 0, bottom = 0, left = 0, right = 0 }

	if padding then
		if type(padding) == "number" then
			base = { top = padding, bottom = padding, left = padding, right = padding }
		elseif type(padding) == "string" then
			local val = FenUI:GetSpacing(padding)
			if val == 0 then
				val = FenUI:GetLayout(padding)
			end
			base = { top = val, bottom = val, left = val, right = val }
		elseif type(padding) == "table" then
			base = {
				top = padding.top or 0,
				bottom = padding.bottom or 0,
				left = padding.left or 0,
				right = padding.right or 0,
			}
		end
	end

	-- Apply individual side overrides
	if config.paddingTop then
		base.top = FenUI:GetSpacing(config.paddingTop)
	end
	if config.paddingBottom then
		base.bottom = FenUI:GetSpacing(config.paddingBottom)
	end
	if config.paddingLeft then
		base.left = FenUI:GetSpacing(config.paddingLeft)
	end
	if config.paddingRight then
		base.right = FenUI:GetSpacing(config.paddingRight)
	end

	-- Add border-mandated content inset
	local offset = self.contentInset or 0
	return {
		top = base.top + offset,
		bottom = base.bottom + offset,
		left = base.left + offset,
		right = base.right + offset,
	}
end

--------------------------------------------------------------------------------
-- Multi-Row Cell System
--------------------------------------------------------------------------------

function LayoutMixin:CreateCells()
	local rowDefs = self.config.rows
	local colDefs = self.config.cols
	local defs = rowDefs or colDefs

	if not defs then
		return
	end

	-- Handle numeric defs by creating an array of "1fr"
	if type(defs) == "number" then
		local num = defs
		defs = {}
		for i = 1, num do
			table.insert(defs, "1fr")
		end
	end

	if #defs == 0 then
		return
	end

	self.orientation = rowDefs and "VERTICAL" or "HORIZONTAL"

	local cellConfigs = self.config.cells or {}
	local gap = self:ResolveGap()
	local padding = self:GetPadding()

	-- Parse definitions
	local parsedDefs = {}
	local totalFr = 0
	local fixedSize = 0

	for i, def in ipairs(defs) do
		if def == "auto" then
			parsedDefs[i] = { type = "auto", value = 0 }
		elseif type(def) == "number" then
			parsedDefs[i] = { type = "fixed", value = def }
			fixedSize = fixedSize + def
		elseif type(def) == "string" and def:find("px$") then
			local val = tonumber(def:match("^(%d+)")) or 0
			parsedDefs[i] = { type = "fixed", value = val }
			fixedSize = fixedSize + val
		elseif type(def) == "string" and def:find("fr$") then
			local val = tonumber(def:match("^(%d+)")) or 1
			parsedDefs[i] = { type = "fr", value = val }
			totalFr = totalFr + val
		else
			-- Default to 1fr
			parsedDefs[i] = { type = "fr", value = 1 }
			totalFr = totalFr + 1
		end
	end

	-- Create cell frames
	for i = 1, #defs do
		local cell = CreateFrame("Frame", nil, self)
		cell.index = i
		cell.def = parsedDefs[i]

		-- INSPECT SUPPORT: Cells are structural, but we want them pickable
		cell:EnableMouse(true)
		if cell.SetMouseClickEnabled then
			cell:SetMouseClickEnabled(false)
		end

		-- Apply cell-specific background
		local cellConfig = cellConfigs[i]
		if cellConfig and cellConfig.background then
			cell.bgTexture = cell:CreateTexture(nil, "BACKGROUND")
			cell.bgTexture:SetAllPoints()

			local bgType, values = ResolveBackgroundConfig(cellConfig.background)
			if bgType == "color" then
				local r, g, b, a = FenUI:GetColor(values.token)
				cell.bgTexture:SetColorTexture(r, g, b, values.alpha or a)
			end
		end

		self.cells[i] = cell
	end

	-- Initial layout
	self:LayoutCells()
end

--- Alias for LayoutCells
function LayoutMixin:UpdateLayout()
	self:LayoutCells()
end

function LayoutMixin:LayoutCells()
	if #self.cells == 0 then
		return
	end

	local p = self:GetPadding()
	local gap = self:ResolveGap()
	local isVertical = self.orientation == "VERTICAL"

	local width = self:GetWidth()
	local height = self:GetHeight()

	if width <= 0 or height <= 0 then
		return
	end

	local totalSize = isVertical and (height - (p.top + p.bottom)) or (width - (p.left + p.right))
	totalSize = math.max(1, totalSize)

	local totalGaps = gap * (#self.cells - 1)
	local availableSize = math.max(0, totalSize - totalGaps)

	-- Calculate fixed and fr sizes
	local fixedSize = 0
	local totalFr = 0

	for _, cell in ipairs(self.cells) do
		if cell.def.type == "fixed" then
			fixedSize = fixedSize + cell.def.value
		elseif cell.def.type == "fr" then
			totalFr = totalFr + cell.def.value
		end
	end

	local frSize = totalFr > 0 and (availableSize - fixedSize) / totalFr or 0

	-- Position cells
	local offset = isVertical and p.top or p.left
	for i, cell in ipairs(self.cells) do
		local cellSize
		if cell.def.type == "fixed" then
			cellSize = cell.def.value
		elseif cell.def.type == "fr" then
			cellSize = frSize * cell.def.value
		else
			cellSize = frSize -- auto defaults to 1fr for now
		end

		cell:ClearAllPoints()
		if isVertical then
			cell:SetPoint("TOPLEFT", p.left, -offset)
			cell:SetPoint("TOPRIGHT", -p.right, -offset)
			cell:SetHeight(math.max(1, cellSize), true)
		else
			cell:SetPoint("TOPLEFT", offset, -p.top)
			cell:SetPoint("BOTTOMLEFT", offset, p.bottom)
			cell:SetWidth(math.max(1, cellSize), true)
		end

		offset = offset + cellSize + gap
	end
end

--- Get a cell by index
---@param index number Cell index (1-based)
---@return Frame|nil
function LayoutMixin:GetCell(index)
	return self.cells[index]
end

--- Set content for a specific cell
---@param index number|table Cell index or {row, col}
---@param col number|nil Column index (if index is row)
---@param frame Frame Frame to place in cell
function LayoutMixin:SetCellContent(index, col, frame)
	-- If called as (row, col, frame)
	if frame then
		-- In 1D layout, we just use the index if col is 1 or nil
		-- This is a compatibility shim for tests expecting 2D
		local cell = self:GetCell(index)
		if cell then
			frame:SetParent(cell)
			frame:ClearAllPoints()
			frame:SetAllPoints()
			frame:Show()
		end
		return
	end

	-- If called as (index, frame)
	frame = col
	local cell = self:GetCell(index)
	if cell then
		frame:SetParent(cell)
		frame:ClearAllPoints()
		frame:SetAllPoints()
		frame:Show()
	end
end

--- Resolve gap value
---@return number
function LayoutMixin:ResolveGap()
	local gap = self.config.gap
	if type(gap) == "string" then
		return FenUI:GetSpacing(gap)
	elseif type(gap) == "number" then
		return gap
	elseif type(gap) == "table" then
		return gap.row or 0
	end
	return 0
end

--------------------------------------------------------------------------------
-- Animation & Transitions
--------------------------------------------------------------------------------

function LayoutMixin:SetupLifecycleAnimations()
	local config = self.config
	local showAnim = config.showAnimation
	local hideAnim = config.hideAnimation

	if showAnim then
		local anim = type(showAnim) == "string" and FenUI.Animation.Presets[showAnim] or FenUI.Animation:Define(showAnim)
		if anim then
			self:HookScript("OnShow", function()
				anim:Play(self)
			end)
		end
	end

	if hideAnim then
		local anim = type(hideAnim) == "string" and FenUI.Animation.Presets[hideAnim] or FenUI.Animation:Define(hideAnim)
		if anim then
			local originalHide = self.Hide
			self.Hide = function(this)
				anim:Play(this, {
					onComplete = function()
						originalHide(this)
					end,
				})
			end
		end
	end
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

--- Create a layout container
---@param parent Frame Parent frame
---@param config table Configuration
---@return Frame layout
function FenUI:CreateLayout(parent, config)
	config = config or {}

	-- NOTE: Don't use BackdropTemplate when using NineSlice
	-- NineSlice and BackdropTemplate conflict in WoW 9.1.5+.
	-- We use a dedicated bgFrame child at frameLevel 0 for backgrounds instead.
	local layout = CreateFrame("Frame", config.name, parent or UIParent)

	-- Apply mixin
	FenUI.Mixin(layout, LayoutMixin)

	-- Initialize
	layout:Init(config)

	return layout
end

--------------------------------------------------------------------------------
-- Convenience Aliases
--------------------------------------------------------------------------------

--- Create a card container (subtle border + optional shadow)
---@param parent Frame Parent frame
---@param config table Configuration
---@return Frame card
function FenUI:CreateCard(parent, config)
	config = config or {}
	return self:CreateLayout(parent, {
		width = config.width,
		height = config.height,
		border = config.border or "Inset", -- Use our custom Inset border pack
		background = config.background or "surfaceInset", -- Use inset (recessed) background
		shadow = config.shadow,
		padding = config.padding or 0,
		paddingTop = config.paddingTop,
		paddingBottom = config.paddingBottom,
		paddingLeft = config.paddingLeft,
		paddingRight = config.paddingRight,
		rows = config.rows,
		cells = config.cells,
		gap = config.gap,
	})
end

--- Create a dialog container (Modern border + drop shadow)
---@param parent Frame Parent frame
---@param config table Configuration
---@return Frame dialog
function FenUI:CreateDialog(parent, config)
	config = config or {}
	return self:CreateLayout(parent, {
		width = config.width or 400,
		height = config.height or 300,
		border = config.border or "ModernDark", -- Use our custom ModernDark border pack
		background = config.background or "surfacePanel",
		shadow = config.shadow or "inner",
		padding = config.padding or 0,
		paddingTop = config.paddingTop,
		paddingBottom = config.paddingBottom,
		paddingLeft = config.paddingLeft,
		paddingRight = config.paddingRight,
		rows = config.rows,
		cells = config.cells,
		gap = config.gap,
	})
end

--------------------------------------------------------------------------------
-- Export Mixin
--------------------------------------------------------------------------------

FenUI.LayoutMixin = LayoutMixin

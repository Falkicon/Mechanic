--------------------------------------------------------------------------------
-- FenUI v2 - Container Widgets
--
-- Common container patterns:
-- - Inset: Styled content area with optional scroll
-- - ScrollPanel: Scrollable content with proper styling
--
-- NOTE: These are convenience wrappers. Inset now uses Layout internally
-- when available for consistent background/border handling.
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- Layout Helper (reads from FenUI.Tokens.layout)
--------------------------------------------------------------------------------

local function GetLayout(name)
	return FenUI:GetLayout(name)
end

local function GetSpacing(val)
	if not val then
		return 0
	end
	if type(val) == "string" then
		return FenUI:GetSpacing(val)
	elseif type(val) == "number" then
		return val
	end
	return 0
end

--------------------------------------------------------------------------------
-- Inset Container
-- A styled content area typically used inside panels
--------------------------------------------------------------------------------

local InsetMixin = {}

function InsetMixin:Init(config)
	self.config = config or {}

	-- Apply backdrop
	self:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8X8",
		edgeFile = "Interface\\Buttons\\WHITE8X8",
		edgeSize = 1,
		insets = { left = 1, right = 1, top = 1, bottom = 1 },
	})

	-- Use token colors
	local bgR, bgG, bgB = FenUI:GetColorRGB("surfaceInset")
	local borderR, borderG, borderB = FenUI:GetColorRGB("borderSubtle")
	self:SetBackdropColor(bgR, bgG, bgB, config.alpha or 0.95)
	self:SetBackdropBorderColor(borderR, borderG, borderB, 1)
end

function InsetMixin:SetInsetAlpha(alpha)
	local bgR, bgG, bgB = FenUI:GetColorRGB("surfaceInset")
	self:SetBackdropColor(bgR, bgG, bgB, alpha)
end

--- Create an inset container (styled content area)
---@param parent Frame Parent frame
---@param config table|nil Configuration { padding, alpha, background, shadow }
---@return Frame inset
function FenUI:CreateInset(parent, config)
	config = config or {}

	local inset

	-- Use Layout component if available (preferred)
	if FenUI.CreateLayout then
		-- Determine background config
		local bgConfig = config.background
		if not bgConfig then
			-- Default to surfaceInset with alpha
			if config.alpha then
				bgConfig = { color = "surfaceInset", alpha = config.alpha }
			else
				bgConfig = "surfaceInset"
			end
		end

		inset = FenUI:CreateLayout(parent, {
			border = "Inset",
			background = bgConfig,
			shadow = config.shadow,
		})
	else
		-- Fallback to original implementation
		inset = CreateFrame("Frame", nil, parent, "BackdropTemplate")
		FenUI.Mixin(inset, InsetMixin)
		inset:Init(config)
	end

	-- Position using layout constants or config
	-- NOTE: Systematic Margin Application
	-- By default, insets are positioned with 0 padding unless specified.
	local padding = GetSpacing(config.padding or 0)
	local topOffset = config.topOffset or 0
	local bottomOffset = config.bottomOffset or 0

	inset:ClearAllPoints()
	inset:SetPoint("TOPLEFT", parent, "TOPLEFT", padding, -topOffset)
	inset:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -padding, bottomOffset)

	-- Add convenience method for backwards compatibility
	if not inset.SetInsetAlpha then
		function inset:SetInsetAlpha(alpha)
			if self.bgTexture then
				local r, g, b = FenUI:GetColorRGB("surfaceInset")
				self.bgTexture:SetColorTexture(r, g, b, alpha)
			end
		end
	end

	return inset
end

--------------------------------------------------------------------------------
-- Scroll Panel
-- A scrollable content container with proper styling
--------------------------------------------------------------------------------

local ScrollPanelMixin = {}

function ScrollPanelMixin:Init(config)
	self.config = config or {}
end

function ScrollPanelMixin:GetScrollChild()
	return self.scrollChild
end

function ScrollPanelMixin:GetContentWidth()
	return self.scrollChild:GetWidth()
end

function ScrollPanelMixin:SetContentHeight(height)
	self.scrollChild:SetHeight(height)
	self:UpdateScrollBar()
end

function ScrollPanelMixin:ScrollToTop()
	self.scrollFrame:SetVerticalScroll(0)
end

function ScrollPanelMixin:ScrollToBottom()
	local maxScroll = self.scrollFrame:GetVerticalScrollRange()
	self.scrollFrame:SetVerticalScroll(maxScroll)
end

function ScrollPanelMixin:UpdateScrollBar()
	if not self.scrollBar then
		return
	end

	local visibleHeight = self.scrollFrame:GetHeight()
	local totalHeight = self.scrollChild:GetHeight()

	-- If height is 0, we might be in the first frame.
	-- Retry in next frame to ensure layout is done.
	if visibleHeight <= 0 or totalHeight <= 0 then
		if not self.initRetry then
			self.initRetry = true
			C_Timer.After(0.1, function()
				self.initRetry = false
				self:UpdateScrollBar()
			end)
		end
		return
	end

	self.scrollBar:UpdateThumbSize(visibleHeight, totalHeight)
end

--- Create a scroll panel (scrollable content area)
---@param parent Frame Parent frame
---@param config table|nil Configuration { padding, showScrollBar }
---@return Frame scrollPanel
function FenUI:CreateScrollPanel(parent, config)
	config = config or {}

	local container = CreateFrame("Frame", nil, parent)
	FenUI.Mixin(container, ScrollPanelMixin)

	local padding = GetSpacing(config.padding or 0)
	local scrollBarWidth = config.showScrollBar ~= false and GetLayout("scrollBarWidth") or 0

	-- 1. Create native ScrollFrame (no template)
	local scrollFrame = CreateFrame("ScrollFrame", nil, container)
	scrollFrame:SetPoint("TOPLEFT", padding, -padding)
	scrollFrame:SetPoint("BOTTOMRIGHT", -(padding + scrollBarWidth), padding)
	container.scrollFrame = scrollFrame

	-- 2. Create custom ScrollBar
	if config.showScrollBar ~= false then
		local scrollBar = self:CreateScrollBar(container, {
			width = scrollBarWidth,
		})
		scrollBar:SetPoint("TOPRIGHT", -padding, -padding)
		scrollBar:SetPoint("BOTTOMRIGHT", -padding, padding)

		-- Link scrollBar and scrollFrame
		scrollBar:SetScript("OnValueChanged", function(_, value)
			scrollFrame:SetVerticalScroll(value)
		end)

		scrollFrame:SetScript("OnScrollRangeChanged", function(_, xrange, yrange)
			container:UpdateScrollBar()
		end)

		scrollFrame:SetScript("OnVerticalScroll", function(_, offset)
			scrollBar:SetValue(offset)
		end)

		-- Mouse wheel support
		scrollFrame:EnableMouseWheel(true)
		scrollFrame:SetScript("OnMouseWheel", function(_, delta)
			local current = scrollBar:GetValue()
			scrollBar:SetValue(current - (delta * 20)) -- 20px per scroll step
		end)

		container.scrollBar = scrollBar
	end

	-- 3. Create scroll child
	local scrollChild = CreateFrame("Frame", nil, scrollFrame)
	scrollChild:SetWidth(1) -- Set by OnSizeChanged
	scrollChild:SetHeight(1) -- Will be set by content

	-- INSPECT SUPPORT: Enable picking for the content area
	scrollChild:EnableMouse(true)
	if scrollChild.SetMouseClickEnabled then
		scrollChild:SetMouseClickEnabled(false)
	end

	scrollFrame:SetScrollChild(scrollChild)
	container.scrollChild = scrollChild

	-- Update scroll child width and scrollbar when container resizes
	container:SetScript("OnSizeChanged", function(self, width, height)
		local innerWidth = width - (padding * 2) - scrollBarWidth
		scrollChild:SetWidth(math.max(1, innerWidth))
		self:UpdateScrollBar()
	end)

	container:Init(config)

	return container
end

--------------------------------------------------------------------------------
-- Inset with Scroll (Combined convenience widget)
--------------------------------------------------------------------------------

--- Create an inset container with built-in scroll functionality
---@param parent Frame Parent frame
---@param config table|nil Configuration { padding, topOffset, bottomOffset, alpha, scrollPadding }
---@return Frame inset, Frame scrollChild
function FenUI:CreateScrollInset(parent, config)
	config = config or {}

	-- Create the inset container
	local inset = self:CreateInset(parent, config)

	-- Create scroll panel inside it
	local scrollPanel = self:CreateScrollPanel(inset, {
		padding = config.scrollPadding or 0,
		showScrollBar = config.showScrollBar ~= false,
	})
	scrollPanel:SetAllPoints()

	-- Attach scroll panel to inset for easy access
	inset.scrollPanel = scrollPanel
	inset.scrollChild = scrollPanel.scrollChild

	-- Convenience methods
	function inset:GetScrollChild()
		return self.scrollChild
	end

	function inset:SetContentHeight(height)
		self.scrollPanel:SetContentHeight(height)
	end

	function inset:ScrollToTop()
		self.scrollPanel:ScrollToTop()
	end

	return inset, scrollPanel.scrollChild
end

--------------------------------------------------------------------------------
-- Export
--------------------------------------------------------------------------------

FenUI.InsetMixin = InsetMixin
FenUI.ScrollPanelMixin = ScrollPanelMixin

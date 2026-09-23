--------------------------------------------------------------------------------
-- FenUI v2 - ScrollBar Widget
--
-- A custom scrollbar with FenUI styling (tokens).
-- Features track background, thumb with padding, and hover states.
--------------------------------------------------------------------------------

local FenUI = FenUI

local ScrollBarMixin = {}

function ScrollBarMixin:Init(config)
	config = config or {}
	self.config = config

	local scrollBarWidth = config.width or FenUI:GetLayout("scrollBarWidth")

	-- Setup Slider properties
	self:SetOrientation("VERTICAL")
	self:SetSize(scrollBarWidth, 0) -- Height set by anchors

	-- 1. Track (Background) - fills entire scrollbar
	self.track = self:CreateTexture(nil, "BACKGROUND")
	self.track:SetAllPoints()
	local r, g, b, a = FenUI:GetColor(config.trackToken or "surfaceScrollTrack")
	self.track:SetColorTexture(r, g, b, a)

	-- 2. Thumb - a thin bar centered in the gutter (modern overlay style)
	local thumbWidth = math.min(scrollBarWidth, config.thumbWidth or FenUI:GetLayout("scrollThumbWidth"))
	thumbWidth = FenUI:GetPixelSize(self, thumbWidth)
	local thumb = self:CreateTexture(nil, "ARTWORK")
	local tr, tg, tb, ta = FenUI:GetColor(config.thumbToken or "interactiveScrollThumb")
	thumb:SetColorTexture(tr, tg, tb, ta)
	thumb:SetSize(thumbWidth, 32) -- Initial height, will be updated
	self:SetThumbTexture(thumb)
	self.thumb = thumb
	self.thumbWidth = thumbWidth

	-- 3. Scripts for hover state (held while dragging, even off the bar)
	local function UpdateThumbColor()
		local active = self.isDragging or self:IsMouseOver()
		local token = active and (config.thumbHoverToken or "interactiveScrollThumbHover")
			or (config.thumbToken or "interactiveScrollThumb")
		self.thumb:SetColorTexture(FenUI:GetColor(token))
	end

	self:SetScript("OnEnter", UpdateThumbColor)
	self:SetScript("OnLeave", UpdateThumbColor)
	self:SetScript("OnMouseDown", function()
		self.isDragging = true
		UpdateThumbColor()
	end)
	self:SetScript("OnMouseUp", function()
		self.isDragging = false
		UpdateThumbColor()
	end)
end

function ScrollBarMixin:UpdateThumbSize(visibleHeight, totalHeight)
	-- Handle initial/empty state
	if totalHeight <= 0 or visibleHeight <= 0 or visibleHeight >= totalHeight then
		if self.thumb then
			self.thumb:SetHeight(0.1)
		end -- Use minimal height instead of 0
		-- Collapse the range so mouse-wheel input can't scroll into blank space
		-- (SetValue still fires OnValueChanged on a hidden slider).
		self:SetMinMaxValues(0, 0)
		self:SetValue(0)
		self:Hide()
		return
	end

	self:Show()
	local trackHeight = self:GetHeight()

	-- If track hasn't layout yet, skip update (will trigger again on resize)
	if trackHeight <= 0 then
		return
	end

	local ratio = visibleHeight / totalHeight
	-- Account for padding in minimum thumb height
	local thumbHeight = math.floor(math.max(20, trackHeight * ratio) + 0.5)

	-- Update thumb size (width already set in Init, respecting padding)
	self.thumb:SetSize(self.thumbWidth, thumbHeight)
	self.thumb:Show() -- Ensure thumb is visible

	-- Update slider range
	self:SetMinMaxValues(0, totalHeight - visibleHeight)

	-- Force a redraw of the thumb position
	local current = self:GetValue()
	self:SetValue(current)
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

function FenUI:CreateScrollBar(parent, config)
	local scrollBar = CreateFrame("Slider", nil, parent)
	FenUI.Mixin(scrollBar, ScrollBarMixin)
	scrollBar:Init(config)
	return scrollBar
end

FenUI.ScrollBarMixin = ScrollBarMixin

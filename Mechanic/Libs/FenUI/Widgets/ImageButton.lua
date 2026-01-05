--------------------------------------------------------------------------------
-- FenUI v2 - ImageButton Widget
--
-- High-performance icon button built on the Image component logic.
-- Features:
-- - All Image logic (sizing, masking, conditional textures)
-- - Interaction states (hover, pressed/dimmed, disabled)
-- - Toggle mode support
-- - Token-based tinting
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- ImageButton Mixin
--------------------------------------------------------------------------------

local ImageButtonMixin = {}

function ImageButtonMixin:Init(config)
	self.config = config or {}

	-- Initialize Image logic (creates texture, handles sizing/masking/conditions)
	-- We use the exported ImageMixin:InitImage to avoid potential Init() recursion
	self:InitImage(config)

	-- Interaction states
	self.isToggle = config.isToggle or false
	self.isActive = config.active or false

	-- Default size
	local size = config.size or 32
	self:SetSize(config.width or size, config.height or size)

	-- Initial visuals
	self:UpdateStateVisuals()

	-- Tooltip
	if config.tooltip then
		self:SetScript("OnEnter", function(s)
			s.isHovered = true
			s:UpdateStateVisuals()
			if s.config.onEnter then
				s.config.onEnter(s)
			end

			GameTooltip:SetOwner(s, config.tooltipAnchor or "ANCHOR_RIGHT")
			if type(config.tooltip) == "function" then
				config.tooltip(GameTooltip)
			else
				GameTooltip:SetText(config.tooltip)
			end
			GameTooltip:Show()
		end)
		self:SetScript("OnLeave", function(s)
			s.isHovered = false
			s:UpdateStateVisuals()
			if s.config.onLeave then
				s.config.onLeave(s)
			end
			GameTooltip:Hide()
		end)
	else
		self:SetScript("OnEnter", function(s)
			s.isHovered = true
			s:UpdateStateVisuals()
			if s.config.onEnter then
				s.config.onEnter(s)
			end
		end)
		self:SetScript("OnLeave", function(s)
			s.isHovered = false
			s:UpdateStateVisuals()
			if s.config.onLeave then
				s.config.onLeave(s)
			end
		end)
	end

	-- Click logic
	self:SetScript("OnMouseDown", function(s, button)
		if button == "LeftButton" and s:IsEnabled() then
			s.isPressed = true
			s:UpdateStateVisuals()
		end
	end)

	self:SetScript("OnMouseUp", function(s, button)
		if button == "LeftButton" then
			s.isPressed = false
			s:UpdateStateVisuals()
		end
	end)

	self:SetScript("OnClick", function(s, button, down)
		if not s:IsEnabled() then
			return
		end

		if s.isToggle and button == "LeftButton" then
			s:SetActive(not s.isActive)
		end

		if s.config.onClick then
			s.config.onClick(s, button, down)
		end
	end)
end

function ImageButtonMixin:UpdateStateVisuals()
	if not self:IsEnabled() then
		self:SetImageAlpha(0.3)
		self:SetTint("interactiveDisabled")
		return
	end

	local alpha = 1.0
	local tint = self.config.tint or "white"

	-- Priority: Pressed > Active Toggle > Hover > Normal
	if self.isPressed then
		alpha = 0.5 -- Darker when pressed
		tint = self.config.pressedTint or "interactiveActive"
		-- Slight texture shift effect for tactile feel
		self.texture:SetPoint("TOPLEFT", 1, -1)
		self.texture:SetPoint("BOTTOMRIGHT", 1, -1)
	elseif self.isToggle and self.isActive then
		alpha = 1.0
		tint = self.config.activeTint or "interactiveActive"
		self.texture:SetAllPoints()
	elseif self.isHovered then
		alpha = 1.0
		tint = self.config.hoverTint or "interactiveHover"
		self.texture:SetAllPoints()
	else
		self.texture:SetAllPoints()
	end

	self:SetImageAlpha(alpha)
	self:SetTint(tint)
end

function ImageButtonMixin:SetActive(active)
	self.isActive = active
	self:UpdateStateVisuals()
	if self.config.onToggle then
		self.config.onToggle(self, active)
	end
end

function ImageButtonMixin:GetActive()
	return self.isActive
end

function ImageButtonMixin:Toggle()
	self:SetActive(not self.isActive)
end

function ImageButtonMixin:SetEnabled(enabled)
	local wasEnabled = self:IsEnabled()
	if enabled then
		self:Enable()
	else
		self:Disable()
	end

	if wasEnabled ~= enabled then
		self:UpdateStateVisuals()
	end
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

function FenUI:CreateImageButton(parent, config)
	local button = CreateFrame("Button", nil, parent)

	-- Order matters: ImageMixin provides texture/sizing/masking,
	-- ImageButtonMixin provides interaction logic.
	FenUI.Mixin(button, FenUI.ImageMixin)
	FenUI.Mixin(button, ImageButtonMixin)

	button:Init(config or {})
	return button
end

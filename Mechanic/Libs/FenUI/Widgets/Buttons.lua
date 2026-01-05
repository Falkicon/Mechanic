--------------------------------------------------------------------------------
-- FenUI v2 - Buttons Widget
--
-- Themed button creation with:
-- - Standard buttons (custom styled, no Blizzard template)
-- - Close buttons
-- - Lifecycle hooks (onClick, onEnter, onLeave)
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- Button Mixin
--------------------------------------------------------------------------------

local ButtonMixin = {}

function ButtonMixin:Init(config)
	self.config = config or {}
	self.hooks = {
		onClick = config.onClick,
		onEnter = config.onEnter,
		onLeave = config.onLeave,
	}

	-- Create visual elements
	self:CreateVisuals()

	-- Set up text
	if config.text then
		self:SetText(config.text)
	end

	-- Set size (with defaults if not provided)
	local width = config.width or 100
	local height = config.height or FenUI:GetLayout("buttonHeight")

	self:ApplySize(width, height, {
		minWidth = config.minWidth or FenUI:GetLayout("buttonMinWidth"),
		maxWidth = config.maxWidth,
		minHeight = config.minHeight,
		maxHeight = config.maxHeight,
		aspectRatio = config.aspectRatio,
		aspectBase = config.aspectBase,
	})

	-- Auto-sizing support for buttons (hooks text changes)
	if self.isAutoSizing then
		hooksecurefunc(self, "SetText", function()
			self:UpdateDynamicSize()
		end)
	end

	-- Apply initial visual
	self:UpdateVisual("normal")
end

--- Create the button's visual elements (background, border, text)
function ButtonMixin:CreateVisuals()
	-- Background texture
	self.bg = self:CreateTexture(nil, "BACKGROUND")
	self.bg:SetAllPoints()

	-- Border textures (4 edges)
	self.border = {}
	self.border.Top = self:CreateTexture(nil, "BORDER")
	self.border.Bottom = self:CreateTexture(nil, "BORDER")
	self.border.Left = self:CreateTexture(nil, "BORDER")
	self.border.Right = self:CreateTexture(nil, "BORDER")

	-- Position borders
	self.border.Top:SetPoint("TOPLEFT", 0, 0)
	self.border.Top:SetPoint("TOPRIGHT", 0, 0)
	self.border.Top:SetHeight(1)

	self.border.Bottom:SetPoint("BOTTOMLEFT", 0, 0)
	self.border.Bottom:SetPoint("BOTTOMRIGHT", 0, 0)
	self.border.Bottom:SetHeight(1)

	self.border.Left:SetPoint("TOPLEFT", 0, -1)
	self.border.Left:SetPoint("BOTTOMLEFT", 0, 1)
	self.border.Left:SetWidth(1)

	self.border.Right:SetPoint("TOPRIGHT", 0, -1)
	self.border.Right:SetPoint("BOTTOMRIGHT", 0, 1)
	self.border.Right:SetWidth(1)

	-- Text (FontString)
	self.text = self:CreateFontString(nil, "OVERLAY")
	self.text:SetFontObject(FenUI:GetFont("fontButton"))
	self.text:SetPoint("CENTER", 0, 0)
	self.text:SetJustifyH("CENTER")
	self.text:SetJustifyV("MIDDLE")
end

--- Update visual state based on interaction
---@param state string "normal", "hover", "pressed", "disabled"
function ButtonMixin:UpdateVisual(state)
	state = state or "normal"

	local bgColor, borderColor, textColor

	if state == "disabled" or not self:IsEnabled() then
		bgColor = "surfaceInset"
		borderColor = "borderSubtle"
		textColor = "interactiveDisabled"
	elseif state == "pressed" then
		bgColor = "surfaceDeep"
		borderColor = "interactiveActive"
		textColor = "interactiveActive"
	elseif state == "hover" then
		bgColor = "surfaceElevated"
		borderColor = "interactiveHover"
		textColor = "interactiveHover"
	else -- normal
		bgColor = "surfaceInset"
		borderColor = "borderInteractive"
		textColor = "interactiveDefault"
	end

	-- Apply background
	local bgR, bgG, bgB, bgA = FenUI:GetColor(bgColor)
	self.bg:SetColorTexture(bgR, bgG, bgB, bgA)

	-- Apply border
	local brR, brG, brB, brA = FenUI:GetColor(borderColor)
	for _, edge in pairs(self.border) do
		edge:SetColorTexture(brR, brG, brB, brA)
	end

	-- Apply text color
	local tR, tG, tB = FenUI:GetColor(textColor)
	self.text:SetTextColor(tR, tG, tB)

	self.currentState = state
end

--- Override SetText to use our custom text element
function ButtonMixin:SetText(text)
	if self.text then
		self.text:SetText(text or "")
	end
end

--- Override GetText
function ButtonMixin:GetText()
	return self.text and self.text:GetText() or ""
end

--- Override GetFontString for compatibility
function ButtonMixin:GetFontString()
	return self.text
end

function ButtonMixin:SetOnClick(callback)
	self.hooks.onClick = callback
end

function ButtonMixin:SetOnEnter(callback)
	self.hooks.onEnter = callback
end

function ButtonMixin:SetOnLeave(callback)
	self.hooks.onLeave = callback
end

--- Set the size of the button (supports responsive units and constraints)
---@param width number|string
---@param height number|string
---@param constraints table|nil
function ButtonMixin:ApplySize(width, height, constraints)
	FenUI.Utils:ApplySize(self, width, height, constraints)
end

--- Internal method called when parent resizes (for responsive units)
function ButtonMixin:UpdateDynamicSize()
	FenUI.Utils:UpdateDynamicSize(self)
end

function ButtonMixin:GetContentFrame()
	return self.text
end

function ButtonMixin:GetPadding()
	return { left = 12, right = 12, top = 0, bottom = 0 }
end

function ButtonMixin:GetMargin()
	return { left = 0, right = 0, top = 0, bottom = 0 }
end

--------------------------------------------------------------------------------
-- Button Factory
--------------------------------------------------------------------------------

--- Create a themed button
---@param parent Frame Parent frame
---@param config table|string Configuration table or just text
---@return Button button
function FenUI:CreateButton(parent, config)
	-- Allow simple string as text
	if type(config) == "string" then
		config = { text = config }
	end
	config = config or {}

	-- Create button (no template - fully custom styled)
	local button = CreateFrame("Button", config.name, parent)

	-- Apply mixin
	FenUI.Mixin(button, ButtonMixin)

	-- Initialize
	button:Init(config)

	-- Set up scripts
	button:SetScript("OnClick", function(self, mouseButton, down)
		if self.hooks.onClick then
			self.hooks.onClick(self, mouseButton, down)
		end
	end)

	button:SetScript("OnEnter", function(self)
		if self:IsEnabled() then
			self:UpdateVisual("hover")
		end
		if self.hooks.onEnter then
			self.hooks.onEnter(self)
		end
	end)

	button:SetScript("OnLeave", function(self)
		if self:IsEnabled() then
			self:UpdateVisual("normal")
		else
			self:UpdateVisual("disabled")
		end
		if self.hooks.onLeave then
			self.hooks.onLeave(self)
		end
	end)

	button:SetScript("OnMouseDown", function(self)
		if self:IsEnabled() then
			self:UpdateVisual("pressed")
		end
	end)

	button:SetScript("OnMouseUp", function(self)
		if self:IsMouseOver() and self:IsEnabled() then
			self:UpdateVisual("hover")
		elseif self:IsEnabled() then
			self:UpdateVisual("normal")
		else
			self:UpdateVisual("disabled")
		end
	end)

	-- Handle enable/disable state changes
	button:SetScript("OnEnable", function(self)
		self:UpdateVisual("normal")
	end)

	button:SetScript("OnDisable", function(self)
		self:UpdateVisual("disabled")
	end)

	return button
end

--------------------------------------------------------------------------------
-- Close Button Factory
--------------------------------------------------------------------------------

--- Create a close button
---@param parent Frame Parent frame
---@param config table|nil Configuration
---@return Button closeButton
function FenUI:CreateCloseButton(parent, config)
	config = config or {}

	local button = CreateFrame("Button", config.name, parent, "UIPanelCloseButton")

	-- Position
	if config.point then
		button:SetPoint(unpack(config.point))
	else
		button:SetPoint("TOPRIGHT", config.xOffset or -2, config.yOffset or -2)
	end

	-- Set up click handler
	if config.onClose then
		button:SetScript("OnClick", function()
			config.onClose()
		end)
	elseif parent then
		button:SetScript("OnClick", function()
			parent:Hide()
		end)
	end

	return button
end

--------------------------------------------------------------------------------
-- Icon Button Factory
--------------------------------------------------------------------------------

--- Create an icon button (no text, just icon)
---@param parent Frame Parent frame
---@param config table Configuration
---@return Button iconButton
function FenUI:CreateIconButton(parent, config)
	config = config or {}

	local button = CreateFrame("Button", config.name, parent)
	button:SetSize(config.size or 24, config.size or 24)

	-- Create icon texture
	button.icon = button:CreateTexture(nil, "ARTWORK")
	button.icon:SetAllPoints()
	if config.icon then
		button.icon:SetTexture(config.icon)
	end
	if config.atlas then
		button.icon:SetAtlas(config.atlas)
	end

	-- Create highlight
	button.highlight = button:CreateTexture(nil, "HIGHLIGHT")
	button.highlight:SetAllPoints()
	button.highlight:SetColorTexture(1, 1, 1, 0.2)

	-- Set up click handler
	if config.onClick then
		button:SetScript("OnClick", function(self, mouseButton, down)
			config.onClick(self, mouseButton, down)
		end)
	end

	-- Tooltip
	if config.tooltip then
		button:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:SetText(config.tooltip)
			GameTooltip:Show()
		end)
		button:SetScript("OnLeave", function()
			GameTooltip:Hide()
		end)
	end

	return button
end

--------------------------------------------------------------------------------
-- Checkbox Factory
--------------------------------------------------------------------------------

local CheckboxMixin = {}

function CheckboxMixin:SetChecked(checked, silent)
	self.checked = checked

	if self.config.checkedTexture and self.config.uncheckedTexture then
		self.boxBg:SetTexture(checked and self.config.checkedTexture or self.config.uncheckedTexture)
		-- In texture mode, we hide the default checkmark and border
		self.checkmark:Hide()
		for _, edge in pairs(self.boxBorder) do
			edge:Hide()
		end
		self.boxBg:SetVertexColor(1, 1, 1, 1) -- Reset any tinting for the texture
	else
		self.checkmark:SetShown(checked)
		for _, edge in pairs(self.boxBorder) do
			edge:Show()
		end
	end

	if not silent and self.hooks.onChange then
		self.hooks.onChange(self, checked)
	end
end

function CheckboxMixin:UpdateVisual(state)
	state = state or "normal"

	if self.config.checkedTexture and self.config.uncheckedTexture then
		self.boxBg:SetTexture(self.checked and self.config.checkedTexture or self.config.uncheckedTexture)
		self.boxBg:SetVertexColor(1, 1, 1, 1)
		return
	end

	-- Update checkmark visibility
	self.checkmark:SetShown(self.checked)

	-- Determine colors based on state
	local borderColor
	if state == "hover" then
		borderColor = "interactiveHover"
	else
		borderColor = "borderInteractive"
	end

	-- Apply border color
	local r, g, b, a = FenUI:GetColor(borderColor)
	for _, edge in pairs(self.boxBorder) do
		edge:SetColorTexture(r, g, b, a)
	end

	-- Update checkmark color when checked
	if self.checked then
		local cr, cg, cb = FenUI:GetColor("interactiveDefault")
		self.checkmark:SetTextColor(cr, cg, cb)
	end
end

function CheckboxMixin:GetChecked()
	return self.checked
end

function CheckboxMixin:Toggle(silent)
	self:SetChecked(not self.checked, silent)
end

function CheckboxMixin:SetLabel(text)
	self.label:SetText(text)
end

--- Create a checkbox
---@param parent Frame Parent frame
---@param config table Configuration
---@return Frame checkbox
function FenUI:CreateCheckbox(parent, config)
	config = config or {}

	local checkbox = CreateFrame("Frame", config.name, parent)
	FenUI.Mixin(checkbox, CheckboxMixin)

	checkbox.hooks = {
		onChange = config.onChange,
	}
	checkbox.config = config
	checkbox.checked = config.checked or false

	local boxSize = config.boxSize or 16

	-- Box (button for interaction)
	checkbox.box = CreateFrame("Button", nil, checkbox)
	checkbox.box:SetSize(boxSize, boxSize)
	checkbox.box:SetPoint("LEFT")

	-- Box background (deep inset color)
	checkbox.boxBg = checkbox.box:CreateTexture(nil, "BACKGROUND")
	checkbox.boxBg:SetPoint("TOPLEFT", 1, -1)
	checkbox.boxBg:SetPoint("BOTTOMRIGHT", -1, 1)

	-- Box border (4 edges for clean 1px border)
	checkbox.boxBorder = {}
	checkbox.boxBorder.Top = checkbox.box:CreateTexture(nil, "BORDER")
	checkbox.boxBorder.Bottom = checkbox.box:CreateTexture(nil, "BORDER")
	checkbox.boxBorder.Left = checkbox.box:CreateTexture(nil, "BORDER")
	checkbox.boxBorder.Right = checkbox.box:CreateTexture(nil, "BORDER")

	-- Position border edges
	checkbox.boxBorder.Top:SetPoint("TOPLEFT", 0, 0)
	checkbox.boxBorder.Top:SetPoint("TOPRIGHT", 0, 0)
	checkbox.boxBorder.Top:SetHeight(1)

	checkbox.boxBorder.Bottom:SetPoint("BOTTOMLEFT", 0, 0)
	checkbox.boxBorder.Bottom:SetPoint("BOTTOMRIGHT", 0, 0)
	checkbox.boxBorder.Bottom:SetHeight(1)

	checkbox.boxBorder.Left:SetPoint("TOPLEFT", 0, -1)
	checkbox.boxBorder.Left:SetPoint("BOTTOMLEFT", 0, 1)
	checkbox.boxBorder.Left:SetWidth(1)

	checkbox.boxBorder.Right:SetPoint("TOPRIGHT", 0, -1)
	checkbox.boxBorder.Right:SetPoint("BOTTOMRIGHT", 0, 1)
	checkbox.boxBorder.Right:SetWidth(1)

	-- Apply initial border color
	local br, bg, bb, ba = FenUI:GetColor("borderInteractive")
	for _, edge in pairs(checkbox.boxBorder) do
		edge:SetColorTexture(br, bg, bb, ba)
	end

	-- Checkmark
	checkbox.checkmark = checkbox.box:CreateFontString(nil, "OVERLAY")
	checkbox.checkmark:SetFontObject("GameFontNormal")
	checkbox.checkmark:SetText("✓")
	checkbox.checkmark:SetPoint("CENTER", 0, 1)
	local cr, cg, cb = FenUI:GetColor("interactiveDefault")
	checkbox.checkmark:SetTextColor(cr, cg, cb)

	-- Initial visual state
	if config.checkedTexture and config.uncheckedTexture then
		checkbox.boxBg:SetTexture(checkbox.checked and config.checkedTexture or config.uncheckedTexture)
		for _, edge in pairs(checkbox.boxBorder) do
			edge:Hide()
		end
		checkbox.checkmark:Hide()
	else
		-- Use surfaceDeep for the inner box background
		local bgR, bgG, bgB, bgA = FenUI:GetColor("surfaceDeep")
		checkbox.boxBg:SetColorTexture(bgR, bgG, bgB, bgA)
		checkbox.checkmark:SetShown(checkbox.checked)
	end

	-- Label
	checkbox.label = checkbox:CreateFontString(nil, "OVERLAY")
	checkbox.label:SetFontObject(FenUI:GetFont("fontBody"))
	checkbox.label:SetPoint("LEFT", checkbox.box, "RIGHT", 8, 0)
	local tr, tg, tb = FenUI:GetColor("textDefault")
	checkbox.label:SetTextColor(tr, tg, tb)
	if config.label then
		checkbox:SetLabel(config.label)
	end

	-- Size
	checkbox:SetHeight(boxSize + 4)
	if config.width then
		checkbox:SetWidth(config.width)
	else
		checkbox:SetWidth(200)
	end

	-- Click handler
	checkbox.box:SetScript("OnClick", function()
		checkbox:Toggle()
	end)

	-- Hover effect
	checkbox.box:SetScript("OnEnter", function()
		checkbox:UpdateVisual("hover")
	end)

	checkbox.box:SetScript("OnLeave", function()
		checkbox:UpdateVisual("normal")
	end)

	return checkbox
end

--------------------------------------------------------------------------------
-- Export Mixins
--------------------------------------------------------------------------------

FenUI.ButtonMixin = ButtonMixin
FenUI.CheckboxMixin = CheckboxMixin

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
	else
		-- Fixed width: keep the label inside the padding and truncate with "..."
		-- instead of spilling past the border
		local pad = self:GetPadding()
		self.text:SetPoint("LEFT", self, "LEFT", pad.left, 0)
		self.text:SetPoint("RIGHT", self, "RIGHT", -pad.right, 0)
		self.text:SetWordWrap(false)
	end

	-- Apply initial visual
	self:UpdateVisual("normal")
end

--- Create the button's visual elements (background, border, text)
function ButtonMixin:CreateVisuals()
	-- Rounded control: 1px border ring + fill (radiusControl corners)
	self.box = FenUI:CreateRoundedBox(self, self, "radiusControl")

	-- Legacy fields kept for compatibility (hidden; the box draws the visuals)
	self.bg = self:CreateTexture(nil, "BACKGROUND")
	self.bg:Hide()
	self.border = {}

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
	local isPrimary = self.config.variant == "primary"
	local isDanger = self.config.variant == "danger"

	if state == "disabled" or not self:IsEnabled() then
		bgColor = "surfacePanel"
		borderColor = "borderSubtle"
		textColor = "textDisabled"
	elseif isDanger then
		-- Danger: neutral control with a red label and edge (destructive actions)
		if state == "pressed" then
			bgColor, borderColor = "surfaceControlPressed", "feedbackError"
		elseif state == "hover" then
			bgColor, borderColor = "surfaceControlHover", "feedbackError"
		else
			bgColor, borderColor = "surfaceControl", "feedbackErrorSubtle"
		end
		textColor = "textDanger"
	elseif isPrimary then
		-- Primary: gold fill, dark label. One per view.
		if state == "pressed" then
			bgColor, borderColor = "interactiveActive", "interactiveActive"
		elseif state == "hover" then
			bgColor, borderColor = "interactiveHover", "interactiveHover"
		else
			bgColor, borderColor = "interactiveDefault", "interactiveDefault"
		end
		textColor = "textOnAccent"
	else
		-- Secondary (default): neutral control, light label
		if state == "pressed" then
			bgColor, borderColor, textColor = "surfaceControlPressed", "borderInteractive", "textDefault"
		elseif state == "hover" then
			bgColor, borderColor, textColor = "surfaceControlHover", "borderInteractiveHover", "textStrong"
		else
			bgColor, borderColor, textColor = "surfaceControl", "borderInteractive", "textDefault"
		end
	end

	-- Apply fill and border ring
	self.box:SetFillColor(FenUI:GetColor(bgColor))
	self.box:SetBorderColor(FenUI:GetColor(borderColor))

	-- Apply text color
	local tR, tG, tB = FenUI:GetColor(textColor)
	self.text:SetTextColor(tR, tG, tB)

	self.currentState = state
end

--- Switch between "secondary" (default), "primary" (gold fill) and "danger" styles
---@param variant string|nil
function ButtonMixin:SetVariant(variant)
	self.config.variant = variant
	self:UpdateVisual(self:IsEnabled() and (self:IsMouseOver() and "hover" or "normal") or "disabled")
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
	local pad = FenUI:GetSpacing("reg")
	return { left = pad, right = pad, top = 0, bottom = 0 }
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
		self.roundBox:Hide()
		self.boxBg:SetVertexColor(1, 1, 1, 1) -- Reset any tinting for the texture
	else
		self.checkmark:SetShown(checked)
		self.roundBox:Show()
		self:UpdateVisual(self:IsMouseOver() and "hover" or "normal")
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

	-- Determine colors based on state: gold edge when checked, lighter edge on hover
	local borderColor
	if self.checked then
		borderColor = state == "hover" and "interactiveHover" or "interactiveDefault"
	elseif state == "hover" then
		borderColor = "borderInteractiveHover"
	else
		borderColor = "borderInteractive"
	end

	-- Apply border color
	self.roundBox:SetBorderColor(FenUI:GetColor(borderColor))

	-- Update checkmark color when checked
	if self.checked then
		self.checkmark:SetVertexColor(FenUI:GetColorRGB(state == "hover" and "interactiveHover" or "interactiveDefault"))
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

	-- Rounded box (1px ring + recessed fill) for the default look; boxBg is
	-- used instead when checkedTexture/uncheckedTexture are provided
	checkbox.roundBox = FenUI:CreateRoundedBox(checkbox.box, checkbox.box, "radiusControl")
	checkbox.roundBox:SetFillColor(FenUI:GetColor("surfaceInset"))
	checkbox.roundBox:SetBorderColor(FenUI:GetColor("borderInteractive"))
	checkbox.boxBorder = {} -- Legacy field (square edges replaced by roundBox)

	-- Checkmark (atlas, not a "✓" glyph: WoW's default fonts don't include it)
	checkbox.checkmark = checkbox.box:CreateTexture(nil, "OVERLAY")
	checkbox.checkmark:SetAtlas("common-icon-checkmark")
	checkbox.checkmark:SetPoint("TOPLEFT", 2, -2)
	checkbox.checkmark:SetPoint("BOTTOMRIGHT", -2, 2)
	checkbox.checkmark:SetVertexColor(FenUI:GetColorRGB("interactiveDefault"))

	-- Compatibility: the checkmark used to be a FontString, and consumers call
	-- FontString methods on it (e.g. !Mechanic's status bar calls SetFontObject).
	-- Keep those calls working on the texture.
	local checkmark = checkbox.checkmark
	checkmark.SetFontObject = function() end
	checkmark.SetText = function() end
	checkmark.SetTextColor = function(_, r, g, b, a)
		checkmark:SetVertexColor(r, g, b, a or 1)
	end

	-- Initial visual state
	if config.checkedTexture and config.uncheckedTexture then
		checkbox.boxBg:SetTexture(checkbox.checked and config.checkedTexture or config.uncheckedTexture)
		checkbox.roundBox:Hide()
		checkbox.checkmark:Hide()
	else
		checkbox.boxBg:Hide()
		checkbox.checkmark:SetShown(checkbox.checked)
	end

	-- Label
	checkbox.label = checkbox:CreateFontString(nil, "OVERLAY")
	checkbox.label:SetFontObject(FenUI:GetFont("fontBody"))
	checkbox.label:SetPoint("LEFT", checkbox.box, "RIGHT", FenUI:GetSpacing("spacingElement"), 0)
	checkbox.label:SetJustifyH("LEFT")
	checkbox.label:SetWordWrap(false)
	if config.width then
		-- Explicit width: truncate long labels instead of overflowing
		checkbox.label:SetPoint("RIGHT", checkbox, "RIGHT", 0, 0)
	end
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

	-- Click handler (box or label row)
	checkbox.box:SetScript("OnClick", function()
		checkbox:Toggle()
	end)
	checkbox:EnableMouse(true)
	checkbox:SetScript("OnMouseUp", function(_, button)
		if button == "LeftButton" and checkbox:IsMouseOver() then
			checkbox:Toggle()
		end
	end)

	-- Hover effect across the whole row. Moving between the row and the box
	-- fires OnLeave on one and OnEnter on the other, so resolve from IsMouseOver.
	local function UpdateHover()
		checkbox:UpdateVisual(checkbox:IsMouseOver() and "hover" or "normal")
	end
	checkbox.box:SetScript("OnEnter", UpdateHover)
	checkbox.box:SetScript("OnLeave", UpdateHover)
	checkbox:SetScript("OnEnter", UpdateHover)
	checkbox:SetScript("OnLeave", UpdateHover)

	checkbox:UpdateVisual("normal")
	return checkbox
end

--------------------------------------------------------------------------------
-- Export Mixins
--------------------------------------------------------------------------------

FenUI.ButtonMixin = ButtonMixin
FenUI.CheckboxMixin = CheckboxMixin

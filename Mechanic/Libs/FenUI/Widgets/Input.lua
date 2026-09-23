--------------------------------------------------------------------------------
-- FenUI - Input Widget
--
-- A standard text input field with styling.
-- Features focus state with highlighted border.
--------------------------------------------------------------------------------

local FenUI = FenUI
local WidgetMixin = {}

function WidgetMixin:Init(config)
	self.config = config or {}

	-- Create visual elements directly (no Layout dependency for simpler border control)
	self:CreateVisuals()

	-- EditBox
	local editBox = CreateFrame("EditBox", nil, self)
	editBox:SetPoint("TOPLEFT", 2, -2)
	editBox:SetPoint("BOTTOMRIGHT", -2, 2)
	editBox:SetFontObject(FenUI:GetFont("fontMono"))
	editBox:SetTextColor(FenUI:GetColorRGB("textDefault"))
	editBox:SetAutoFocus(false)
	editBox:SetTextInsets(6, 6, 0, 0)

	if self.config.placeholder then
		local placeholder = editBox:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontMono"))
		placeholder:SetPoint("LEFT", 6, 0)
		placeholder:SetPoint("RIGHT", -6, 0)
		placeholder:SetJustifyH("LEFT")
		placeholder:SetWordWrap(false)

		local U = FenUI.Utils
		local placeholderText = U and U:SanitizeText(self.config.placeholder, "Enter text...")
			or (self.config.placeholder == true and "Enter text..." or self.config.placeholder)

		placeholder:SetText(placeholderText)
		local pr, pg, pb = FenUI:GetColorRGB("textDisabled")
		placeholder:SetTextColor(pr, pg, pb)
		self.placeholder = placeholder

		editBox:SetScript("OnTextChanged", function(eb)
			placeholder:SetShown(eb:GetText() == "")
			if self.config.onChange then
				self.config.onChange(eb:GetText())
			end
		end)
	else
		editBox:SetScript("OnTextChanged", function(eb)
			if self.config.onChange then
				self.config.onChange(eb:GetText())
			end
		end)
	end

	if self.config.readOnly then
		editBox:SetEnabled(false)
	end

	-- Hover handlers (focus takes precedence; see RefreshBorderState)
	editBox:SetScript("OnEnter", function()
		self:RefreshBorderState()
	end)
	editBox:SetScript("OnLeave", function()
		self:RefreshBorderState()
	end)

	-- Focus handlers
	editBox:SetScript("OnEditFocusGained", function(eb)
		self:UpdateBorderState("focus")
		if self.config.onFocus then
			self.config.onFocus(eb)
		end
	end)

	editBox:SetScript("OnEditFocusLost", function(eb)
		self:UpdateBorderState(eb:IsMouseOver() and "hover" or "normal")
		if self.config.onBlur then
			self.config.onBlur(eb)
		end
	end)

	-- Enter/Escape handlers
	editBox:SetScript("OnEnterPressed", function(eb)
		if self.config.onEnter then
			self.config.onEnter(eb:GetText())
		end
		eb:ClearFocus()
	end)

	editBox:SetScript("OnEscapePressed", function(eb)
		if self.config.onEscape then
			self.config.onEscape(eb:GetText())
		end
		eb:ClearFocus()
	end)

	self.editBox = editBox
end

--- Create the input's visual elements (background, border)
function WidgetMixin:CreateVisuals()
	-- Rounded field: 1px border ring + recessed fill (radiusControl corners)
	self.box = FenUI:CreateRoundedBox(self, self, "radiusControl")
	self.box:SetFillColor(FenUI:GetColor("surfaceInset"))

	-- Legacy fields kept for compatibility (hidden; the box draws the visuals)
	self.bg = self:CreateTexture(nil, "BACKGROUND")
	self.bg:Hide()
	self.border = {}

	-- Apply initial border color (normal state)
	self:UpdateBorderState("normal")
end

--- Update border color based on state
---@param state string "normal" or "focus"
function WidgetMixin:UpdateBorderState(state)
	local borderColor
	if state == "focus" then
		borderColor = "borderFocus" -- gold500
	elseif state == "hover" then
		borderColor = "borderInteractiveHover"
	else
		borderColor = "borderInteractive"
	end

	self.box:SetBorderColor(FenUI:GetColor(borderColor))
end

--- Re-derive the border state from focus and hover
function WidgetMixin:RefreshBorderState()
	local eb = self.editBox
	if eb and eb:HasFocus() then
		self:UpdateBorderState("focus")
	elseif eb and eb:IsEnabled() and eb:IsMouseOver() then
		self:UpdateBorderState("hover")
	else
		self:UpdateBorderState("normal")
	end
end

function WidgetMixin:SetText(text)
	self.editBox:SetText(text or "")
end

function WidgetMixin:GetText()
	return self.editBox:GetText()
end

function WidgetMixin:SetFocus()
	self.editBox:SetFocus()
end

function WidgetMixin:ClearFocus()
	self.editBox:ClearFocus()
end

-- Factory function
function FenUI:CreateInput(parent, config)
	config = config or {}
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetSize(config.width or 200, config.height or FenUI:GetLayout("buttonHeight"))

	FenUI.Mixin(frame, WidgetMixin)
	frame:Init(config)

	return frame
end

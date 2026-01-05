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
	editBox:SetFontObject("ChatFontNormal")
	editBox:SetAutoFocus(false)
	editBox:SetTextInsets(6, 6, 0, 0)

	if self.config.placeholder then
		local placeholder = editBox:CreateFontString(nil, "OVERLAY", "ChatFontNormal")
		placeholder:SetPoint("LEFT", 6, 0)

		local U = FenUI.Utils
		local placeholderText = U and U:SanitizeText(self.config.placeholder, "Enter text...")
			or (self.config.placeholder == true and "Enter text..." or self.config.placeholder)

		placeholder:SetText(placeholderText)
		local pr, pg, pb = FenUI:GetColorRGB("textMuted")
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

	-- Focus handlers
	editBox:SetScript("OnEditFocusGained", function(eb)
		self:UpdateBorderState("focus")
		if self.config.onFocus then
			self.config.onFocus(eb)
		end
	end)

	editBox:SetScript("OnEditFocusLost", function(eb)
		self:UpdateBorderState("normal")
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
	-- Background texture
	self.bg = self:CreateTexture(nil, "BACKGROUND")
	self.bg:SetPoint("TOPLEFT", 1, -1)
	self.bg:SetPoint("BOTTOMRIGHT", -1, 1)
	local bgR, bgG, bgB, bgA = FenUI:GetColor("surfaceInset")
	self.bg:SetColorTexture(bgR, bgG, bgB, bgA)

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

	-- Apply initial border color (normal state)
	self:UpdateBorderState("normal")
end

--- Update border color based on state
---@param state string "normal" or "focus"
function WidgetMixin:UpdateBorderState(state)
	local borderColor
	if state == "focus" then
		borderColor = "borderFocus" -- gold500
	else
		borderColor = "borderSubtle"
	end

	local r, g, b, a = FenUI:GetColor(borderColor)
	for _, edge in pairs(self.border) do
		edge:SetColorTexture(r, g, b, a)
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
	frame:SetSize(config.width or 200, config.height or 24)

	FenUI.Mixin(frame, WidgetMixin)
	frame:Init(config)

	return frame
end

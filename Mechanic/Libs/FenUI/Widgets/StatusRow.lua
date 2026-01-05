--------------------------------------------------------------------------------
-- FenUI v2 - StatusRow Widget
--
-- Horizontal layout for displaying key-value pairs (e.g., status bars).
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- StatusRow Mixin
--------------------------------------------------------------------------------

local StatusRowMixin = {}

function StatusRowMixin:Init(config)
	self.config = config or {}
	self.items = {} -- { { label, value, labelFS, valueFS, divider }, ... }

	self:SetHeight(config.height or 24)

	if config.items then
		self:SetValues(config.items)
	end

	self:SetScript("OnSizeChanged", function()
		self:UpdateLayout()
	end)
end

function StatusRowMixin:SetValues(valuesTable)
	-- valuesTable = { { label, value }, ... }
	self:Clear()

	for i, item in ipairs(valuesTable) do
		local entry = {}

		-- Label
		local labelFS = self:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
		labelFS:SetFormattedText("%s:", item.label)
		labelFS:SetTextColor(FenUI:GetColorRGB("textMuted"))
		entry.labelFS = labelFS

		-- Value
		local valueFS = self:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
		valueFS:SetText(item.value)
		entry.valueFS = valueFS

		-- Divider (except for last item)
		if i < #valuesTable then
			local divider = self:CreateTexture(nil, "ARTWORK")
			divider:SetColorTexture(FenUI:GetColorRGB("borderSubtle"))
			divider:SetSize(1, self:GetHeight() * 0.6)
			entry.divider = divider
		end

		entry.label = item.label
		entry.value = item.value

		table.insert(self.items, entry)
	end

	self:UpdateLayout()
end

function StatusRowMixin:SetValue(label, newValue)
	for _, item in ipairs(self.items) do
		if item.label == label then
			item.value = newValue
			item.valueFS:SetText(newValue)
			self:UpdateLayout()
			return
		end
	end
end

function StatusRowMixin:Clear()
	for _, item in ipairs(self.items) do
		item.labelFS:Hide()
		item.valueFS:Hide()
		if item.divider then
			item.divider:Hide()
		end
	end
	wipe(self.items)
end

function StatusRowMixin:UpdateLayout()
	local xOffset = 8
	local gap = self.config.gap or 12
	local internalGap = 4

	for i, item in ipairs(self.items) do
		item.labelFS:ClearAllPoints()
		item.labelFS:SetPoint("LEFT", self, "LEFT", xOffset, 0)
		item.labelFS:Show()
		xOffset = xOffset + item.labelFS:GetWidth() + internalGap

		item.valueFS:ClearAllPoints()
		item.valueFS:SetPoint("LEFT", self, "LEFT", xOffset, 0)
		item.valueFS:Show()
		xOffset = xOffset + item.valueFS:GetWidth()

		if item.divider then
			xOffset = xOffset + (gap / 2)
			item.divider:ClearAllPoints()
			item.divider:SetPoint("LEFT", self, "LEFT", xOffset, 0)
			item.divider:Show()
			xOffset = xOffset + (gap / 2)
		end

		xOffset = xOffset + gap
	end
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

function FenUI:CreateStatusRow(parent, config)
	local statusRow = CreateFrame("Frame", nil, parent)
	FenUI.Mixin(statusRow, StatusRowMixin)
	statusRow:Init(config)
	return statusRow
end

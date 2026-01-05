--------------------------------------------------------------------------------
-- FenUI - SearchablePicker Widget
--
-- A dropdown-style button that opens a searchable popup with VirtualList.
-- Ideal for large lists (50+ items) where a standard dropdown is impractical.
--
-- Usage:
--   local picker = FenUI:CreateSearchablePicker(parent, {
--       width = 140,
--       height = 24,
--       popupWidth = 220,
--       popupHeight = 300,
--       defaultText = "Select...",
--       items = { {key="a", text="Item A", value="a"}, ... },
--       onSelect = function(value, item) ... end,
--   })
--------------------------------------------------------------------------------

local FenUI = FenUI
local WidgetMixin = {}

function WidgetMixin:Init(config)
	self.config = config or {}
	self.items = config.items or {}
	self.selectedValue = nil
	self.popupWidth = config.popupWidth or 220
	self.popupHeight = config.popupHeight or 300

	-- Create button
	self:CreateButton()
end

function WidgetMixin:CreateButton()
	local config = self.config

	-- Background
	local bg = self:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	bg:SetColorTexture(0.15, 0.15, 0.15, 0.9)
	self.bg = bg

	-- Border
	local border = CreateFrame("Frame", nil, self, "BackdropTemplate")
	border:SetAllPoints()
	border:SetBackdrop({
		edgeFile = "Interface\\Buttons\\WHITE8X8",
		edgeSize = 1,
	})
	border:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
	self.border = border

	-- Text
	local text = self:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	text:SetPoint("LEFT", 6, 0)
	text:SetPoint("RIGHT", -18, 0)
	text:SetJustifyH("LEFT")
	text:SetText(config.defaultText or "Select...")
	self.text = text

	-- Arrow (use simple "v" instead of unicode character)
	local arrow = self:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	arrow:SetPoint("RIGHT", -4, 0)
	arrow:SetText("v")
	arrow:SetTextColor(0.6, 0.6, 0.6)
	self.arrow = arrow

	-- Hover state
	self:SetScript("OnEnter", function()
		bg:SetColorTexture(0.2, 0.2, 0.2, 0.9)
		border:SetBackdropBorderColor(0.6, 0.5, 0.2, 1)
	end)
	self:SetScript("OnLeave", function()
		bg:SetColorTexture(0.15, 0.15, 0.15, 0.9)
		border:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
	end)

	-- Click handler
	self:SetScript("OnClick", function()
		self:TogglePopup()
	end)
end

function WidgetMixin:CreatePopup()
	local popup = CreateFrame("Frame", nil, UIParent)
	popup:SetSize(self.popupWidth, self.popupHeight)
	popup:SetFrameStrata("DIALOG")
	popup:SetClampedToScreen(true)
	popup:Hide()

	-- Background
	local bg = popup:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	bg:SetColorTexture(0.1, 0.1, 0.1, 0.98)

	-- Border
	local border = CreateFrame("Frame", nil, popup, "BackdropTemplate")
	border:SetAllPoints()
	border:SetBackdrop({
		edgeFile = "Interface\\Buttons\\WHITE8X8",
		edgeSize = 1,
	})
	border:SetBackdropBorderColor(0.6, 0.5, 0.2, 1)

	-- Filter handler (defined before input so we can pass onChange)
	local function onFilterChange(text)
		local filter = strlower(text or "")
		if filter == "" then
			self.list:ClearFilter()
		else
			self.list:SetFilter(function(item)
				local searchText = strlower(item.text or item.key or "")
				return searchText:find(filter, 1, true) ~= nil
			end)
		end
	end

	-- Search input
	local searchInput = FenUI:CreateInput(popup, {
		width = self.popupWidth - 20,
		height = 24,
		placeholder = "Filter...",
		onChange = onFilterChange,
	})
	searchInput:SetPoint("TOPLEFT", 10, -10)
	searchInput:SetPoint("TOPRIGHT", -10, -10)
	self.searchInput = searchInput

	-- VirtualList (leave more room on right for scrollbar)
	local list = FenUI:CreateVirtualList(popup, {
		itemHeight = 22,
		items = self.items,
		onSelect = function(key, item)
			self:SelectItem(item)
			self:HidePopup()
		end,
	})
	list:SetPoint("TOPLEFT", searchInput, "BOTTOMLEFT", -8, -8)
	list:SetPoint("BOTTOMRIGHT", -4, 10)  -- Less margin on right for scrollbar
	self.list = list

	-- ESC to close
	popup:EnableKeyboard(true)
	popup:SetScript("OnKeyDown", function(self, key)
		if key == "ESCAPE" then
			self:SetPropagateKeyboardInput(false)
			popup:Hide()
		else
			self:SetPropagateKeyboardInput(true)
		end
	end)

	-- Click outside to close
	popup:SetScript("OnUpdate", function()
		if popup:IsShown() and not popup:IsMouseOver() and not self:IsMouseOver() then
			if IsMouseButtonDown("LeftButton") then
				popup:Hide()
			end
		end
	end)

	self.popup = popup
end

function WidgetMixin:TogglePopup()
	if self.popup and self.popup:IsShown() then
		self:HidePopup()
	else
		self:ShowPopup()
	end
end

function WidgetMixin:ShowPopup()
	if not self.popup then
		self:CreatePopup()
	end

	-- Refresh list items
	self.list:SetItems(self.items)

	-- Position below button
	self.popup:ClearAllPoints()
	self.popup:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 0, -2)
	self.popup:Show()

	-- Focus search and clear it
	if self.searchInput and self.searchInput.editBox then
		self.searchInput.editBox:SetText("")
		self.searchInput.editBox:SetFocus()
	end
end

function WidgetMixin:HidePopup()
	if self.popup then
		self.popup:Hide()
	end
end

function WidgetMixin:SelectItem(item)
	self.selectedValue = item.value
	local displayText = item.text or item.key or ""
	-- Strip color codes for cleaner display
	displayText = displayText:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
	self.text:SetText(displayText)

	if self.config.onSelect then
		self.config.onSelect(item.value, item)
	end
end

function WidgetMixin:SetItems(items)
	self.items = items or {}
	if self.list then
		self.list:SetItems(self.items)
	end
end

function WidgetMixin:GetValue()
	return self.selectedValue
end

function WidgetMixin:SetValue(value)
	self.selectedValue = value
	for _, item in ipairs(self.items) do
		if item.value == value then
			local displayText = item.text or item.key or ""
			displayText = displayText:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
			self.text:SetText(displayText)
			return
		end
	end
end

function WidgetMixin:Reset()
	self.selectedValue = nil
	self.text:SetText(self.config.defaultText or "Select...")
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

function FenUI:CreateSearchablePicker(parent, config)
	local frame = CreateFrame("Button", nil, parent)
	frame:SetSize(config.width or 140, config.height or 24)

	FenUI.Mixin(frame, WidgetMixin)
	frame:Init(config)

	return frame
end

FenUI.SearchablePickerMixin = WidgetMixin

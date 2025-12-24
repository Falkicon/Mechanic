-- UI/Shared/SplitNavLayout.lua
-- !Mechanic - Reusable Split Navigation Layout Helper (Phase 6)
--
-- Provides a standard left-nav / right-content split layout pattern
-- used by Console, Errors, Tools, and Performance modules.

local ADDON_NAME, ns = ...
local SplitNavLayout = {}
ns.SplitNavLayout = SplitNavLayout

-- Configuration defaults
local NAV_WIDTH = 200
local NAV_ITEM_HEIGHT = 24
local NAV_PADDING = 4

---@class SplitNavConfig
---@field navWidth number? Width of left nav (default 200)
---@field items table[]? Array of {key, text, icon?} for nav items
---@field onSelect function? Callback(key) when item selected
---@field defaultKey string? Initial selection

---Create a split navigation layout
---@param parent Frame Parent frame
---@param config SplitNavConfig
---@return table layout Layout controller object
function SplitNavLayout:Create(parent, config)
	local layout = {
		items = {},
		buttons = {},
		selectedKey = nil,
		contentFrames = {},
	}

	local navWidth = config.navWidth or NAV_WIDTH

	-- Left navigation panel
	local navPanel = CreateFrame("Frame", nil, parent)
	navPanel:SetWidth(navWidth)
	navPanel:SetPoint("TOPLEFT", 0, 0)
	navPanel:SetPoint("BOTTOMLEFT", 0, 0)
	layout.navPanel = navPanel

	-- Nav background
	local navBg = navPanel:CreateTexture(nil, "BACKGROUND")
	navBg:SetAllPoints()
	navBg:SetColorTexture(0, 0, 0, 0.3)

	-- Scrollable nav content
	local navScroll = CreateFrame("ScrollFrame", nil, navPanel, "UIPanelScrollFrameTemplate")
	navScroll:SetPoint("TOPLEFT", NAV_PADDING, -NAV_PADDING)
	navScroll:SetPoint("BOTTOMRIGHT", -NAV_PADDING - 16, NAV_PADDING)

	local navContent = CreateFrame("Frame", nil, navScroll)
	navContent:SetWidth(navWidth - NAV_PADDING * 2 - 16)
	navScroll:SetScrollChild(navContent)
	layout.navContent = navContent

	-- Content area (right side)
	local contentArea = CreateFrame("Frame", nil, parent)
	contentArea:SetPoint("TOPLEFT", navPanel, "TOPRIGHT", 4, 0)
	contentArea:SetPoint("BOTTOMRIGHT", 0, 0)
	layout.contentArea = contentArea

	-- Methods
	function layout:SetItems(items)
		self.items = items
		self:RefreshNav()
	end

	function layout:RefreshNav()
		-- Clear existing buttons
		for _, btn in ipairs(self.buttons) do
			btn:Hide()
		end

		local yOffset = 0
		for i, item in ipairs(self.items) do
			local btn = self:GetOrCreateButton(i)
			btn:SetPoint("TOPLEFT", self.navContent, "TOPLEFT", 0, -yOffset)
			btn:SetSize(self.navContent:GetWidth(), NAV_ITEM_HEIGHT)
			btn.text:SetText(item.text)
			btn.key = item.key
			btn:Show()

			-- Highlight if selected
			if item.key == self.selectedKey then
				btn.highlight:Show()
			else
				btn.highlight:Hide()
			end

			yOffset = yOffset + NAV_ITEM_HEIGHT + 2
		end

		self.navContent:SetHeight(yOffset)
	end

	function layout:GetOrCreateButton(index)
		if self.buttons[index] then
			return self.buttons[index]
		end

		local btn = CreateFrame("Button", nil, self.navContent)
		btn:SetHeight(NAV_ITEM_HEIGHT)

		-- Background highlight
		local highlight = btn:CreateTexture(nil, "BACKGROUND")
		highlight:SetAllPoints()
		highlight:SetColorTexture(1, 1, 1, 0.1)
		highlight:Hide()
		btn.highlight = highlight

		-- Hover highlight
		local hover = btn:CreateTexture(nil, "HIGHLIGHT")
		hover:SetAllPoints()
		hover:SetColorTexture(1, 1, 1, 0.05)

		-- Text
		local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		text:SetPoint("LEFT", 8, 0)
		text:SetJustifyH("LEFT")
		btn.text = text

		btn:SetScript("OnClick", function()
			self:Select(btn.key)
		end)

		self.buttons[index] = btn
		return btn
	end

	function layout:Select(key)
		if self.selectedKey == key then
			return
		end

		self.selectedKey = key
		self:RefreshNav()

		-- Hide all content frames
		for _, frame in pairs(self.contentFrames) do
			frame:Hide()
		end

		-- Show selected content frame
		if self.contentFrames[key] then
			self.contentFrames[key]:Show()
		end

		-- Callback
		if config.onSelect then
			config.onSelect(key)
		end
	end

	function layout:GetContentFrame(key)
		if not self.contentFrames[key] then
			local frame = CreateFrame("Frame", nil, self.contentArea)
			frame:SetAllPoints()
			frame:Hide()
			self.contentFrames[key] = frame
		end
		return self.contentFrames[key]
	end

	function layout:GetSelectedKey()
		return self.selectedKey
	end

	-- Initial setup
	if config.items then
		layout:SetItems(config.items)
	end
	if config.defaultKey then
		layout:Select(config.defaultKey)
	end

	return layout
end

return SplitNavLayout

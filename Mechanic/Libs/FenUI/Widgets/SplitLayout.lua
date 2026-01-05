--------------------------------------------------------------------------------
-- FenUI v2 - Split Layout Widget
--
-- A specialized layout with a navigation sidebar and a content area.
--------------------------------------------------------------------------------

local FenUI = FenUI

local SplitLayoutMixin = {}

function SplitLayoutMixin:InitSplit(config)
	self.config = config or {}

	-- SplitLayout is a 2-column Layout
	-- Cell 1: Navigation
	-- Cell 2: Content

	local navWidth = config.navWidth or 200

	-- Content Area (Cell 2)
	self.contentArea = self:GetCell(2)

	-- Navigation Area (Cell 1)
	local navCell = self:GetCell(1)
	self.navPanel = navCell

	-- Navigation Background
	-- We use a dedicated texture on the navigation cell to provide visual depth.
	-- FenUI:GetColor resolves the "surfaceInset" semantic token to its primitive RGBA values.
	-- Alpha at 0.6 provides a clear visual distinction for the sidebar
	-- that matches modern Blizzard UI (e.g., Settings Panel) without needing an explicit border.
	self.navBackground = navCell:CreateTexture(nil, "BACKGROUND")
	self.navBackground:SetAllPoints()
	local r, g, b, a = FenUI:GetColor("surfaceInset")
	self.navBackground:SetColorTexture(r, g, b, 0.6)

	-- Navigation Border (Right edge separator)
	self.navSeparator = navCell:CreateTexture(nil, "BORDER")
	self.navSeparator:SetPoint("TOPRIGHT")
	self.navSeparator:SetPoint("BOTTOMRIGHT")
	self.navSeparator:SetWidth(1)
	self.navSeparator:SetColorTexture(FenUI:GetColorRGB("borderSubtle"))

	-- Navigation Scroll Frame
	local navScrollPanel = FenUI:CreateScrollPanel(navCell, {
		padding = 2,
	})
	navScrollPanel:SetAllPoints()
	self.navScrollPanel = navScrollPanel
	self.navScroll = navScrollPanel.scrollFrame
	self.navContent = navScrollPanel.scrollChild

	-- Sync navContent width
	self.navScroll:SetScript("OnSizeChanged", function(frame, width)
		self.navContent:SetWidth(width, true)
		self:RefreshNav()
	end)

	-- State
	self.items = {}
	self.buttons = {}
	self.headers = {}
	self.selectedKey = config.defaultKey
	self.contentFrames = {}
	self.onSelect = config.onSelect

	-- Methods (Ensure they are on the instance)
	self.SetItems = SplitLayoutMixin.SetItems
	self.RefreshNav = SplitLayoutMixin.RefreshNav
	self.GetOrCreateButton = SplitLayoutMixin.GetOrCreateButton
	self.GetOrCreateHeader = SplitLayoutMixin.GetOrCreateHeader
	self.UpdateButtonStates = SplitLayoutMixin.UpdateButtonStates
	self.Select = SplitLayoutMixin.Select
	self.GetContentFrame = SplitLayoutMixin.GetContentFrame
	self.GetSelectedKey = SplitLayoutMixin.GetSelectedKey

	if config.items then
		self:SetItems(config.items)
	end

	-- Trigger initial selection if requested
	if self.selectedKey then
		self:Select(self.selectedKey, true)
	end
end

function SplitLayoutMixin:SetItems(items)
	self.items = items or {}
	self:RefreshNav()
end

function SplitLayoutMixin:RefreshNav()
	if not self.navContent then
		return
	end

	-- Hide all existing buttons and headers
	for _, btn in ipairs(self.buttons) do
		btn:Hide()
	end
	for _, header in ipairs(self.headers) do
		header:Hide()
	end

	local yOffset = 0
	local buttonIndex = 1
	local headerIndex = 1

	for i, item in ipairs(self.items) do
		if item.isHeader or item.isCategory then
			local header = self:GetOrCreateHeader(headerIndex)
			header:SetPoint("TOPLEFT", self.navContent, "TOPLEFT", 0, -yOffset)
			header:SetPoint("TOPRIGHT", self.navContent, "TOPRIGHT", 0, -yOffset)
			header:SetText(item.text)
			header:Show()

			yOffset = yOffset + header:GetHeight() + 2
			headerIndex = headerIndex + 1
		else
			local btn = self:GetOrCreateButton(buttonIndex)
			btn:SetPoint("TOPLEFT", self.navContent, "TOPLEFT", 0, -yOffset)
			btn:SetPoint("TOPRIGHT", self.navContent, "TOPRIGHT", 0, -yOffset)
			btn.text:SetText(item.text)
			btn.key = item.key

			-- Handle icons
			if item.icon then
				btn.icon:SetTexture(item.icon)
				btn.icon:Show()
				btn.text:SetPoint("LEFT", 32, 0)
			else
				btn.icon:Hide()
				btn.text:SetPoint("LEFT", 8, 0)
			end

			btn:Show()
			yOffset = yOffset + 24 + 2
			buttonIndex = buttonIndex + 1
		end
	end

	self.navContent:SetHeight(math.max(1, yOffset))
	if self.navScrollPanel then
		self.navScrollPanel:UpdateScrollBar()
	end
	self:UpdateButtonStates()

	-- Ensure content frame for selected key is shown
	if self.selectedKey and self.contentFrames[self.selectedKey] then
		self.contentFrames[self.selectedKey]:Show()
	end
end

function SplitLayoutMixin:GetOrCreateButton(index)
	if self.buttons[index] then
		return self.buttons[index]
	end

	local btn = CreateFrame("Button", nil, self.navContent)
	btn:SetHeight(24)

	-- Background highlight (selected state)
	local highlight = btn:CreateTexture(nil, "BACKGROUND")
	highlight:SetAllPoints()
	local selR, selG, selB = FenUI:GetColorRGB("surfaceElevated")
	highlight:SetColorTexture(selR, selG, selB, 0.8)
	highlight:Hide()
	btn.highlight = highlight

	-- Hover highlight (stronger visibility)
	local hover = btn:CreateTexture(nil, "HIGHLIGHT")
	hover:SetAllPoints()
	local hoverR, hoverG, hoverB = FenUI:GetColorRGB("surfaceElevated")
	hover:SetColorTexture(hoverR, hoverG, hoverB, 0.4)

	-- Text
	local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	text:SetPoint("LEFT", 8, 0)
	text:SetPoint("RIGHT", -8, 0)
	text:SetJustifyH("LEFT")
	btn.text = text

	-- Icon
	local icon = btn:CreateTexture(nil, "OVERLAY")
	icon:SetSize(16, 16)
	icon:SetPoint("LEFT", 8, 0)
	btn.icon = icon

	btn:SetScript("OnClick", function()
		if btn.key then
			self:Select(btn.key)
		end
	end)

	self.buttons[index] = btn
	return btn
end

function SplitLayoutMixin:GetOrCreateHeader(index)
	if self.headers[index] then
		return self.headers[index]
	end

	local header = FenUI:CreateSectionHeader(self.navContent, {
		text = "Header",
		spacing = "md",
	})

	self.headers[index] = header
	return header
end

function SplitLayoutMixin:UpdateButtonStates()
	for _, btn in ipairs(self.buttons) do
		if btn:IsShown() then
			if btn.key == self.selectedKey then
				btn.highlight:Show()
				local r, g, b = FenUI:GetColorRGB("textDefault")
				btn.text:SetTextColor(r, g, b)
			else
				btn.highlight:Hide()
				local r, g, b = FenUI:GetColorRGB("interactiveDefault")
				btn.text:SetTextColor(r, g, b)
			end
		end
	end
end

function SplitLayoutMixin:Select(key, force)
	if self.selectedKey == key and not force then
		return
	end

	self.selectedKey = key
	self:UpdateButtonStates()

	-- Hide all content frames
	for _, frame in pairs(self.contentFrames) do
		frame:Hide()
	end

	-- Show selected content frame
	if self.contentFrames[key] then
		self.contentFrames[key]:Show()
	end

	-- Callback
	if self.onSelect then
		self.onSelect(key)
	end
end

function SplitLayoutMixin:GetContentFrame(key)
	if not self.contentFrames[key] then
		local frame = CreateFrame("Frame", nil, self.contentArea)
		frame:SetAllPoints()
		self.contentFrames[key] = frame

		-- If this is already the selected key, show it immediately
		if self.selectedKey == key then
			frame:Show()
		else
			frame:Hide()
		end
	end
	return self.contentFrames[key]
end

function SplitLayoutMixin:GetSelectedKey()
	return self.selectedKey
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

function FenUI:CreateSplitLayout(parent, config)
	config = config or {}

	-- SplitLayout is a 2-column Layout
	local layout = self:CreateLayout(parent, {
		name = config.name,
		width = config.width,
		height = config.height,
		minWidth = config.minWidth,
		maxWidth = config.maxWidth,
		minHeight = config.minHeight,
		maxHeight = config.maxHeight,
		aspectRatio = config.aspectRatio,
		aspectBase = config.aspectBase,
		cols = { config.navWidth or 200, "fr" },
		gap = config.gap or 4,
		padding = config.padding or 0,
		border = config.border,
		background = config.background or "surfacePanel",
	})

	FenUI.Mixin(layout, SplitLayoutMixin)
	layout:InitSplit(config)

	return layout
end

FenUI.SplitLayoutMixin = SplitLayoutMixin

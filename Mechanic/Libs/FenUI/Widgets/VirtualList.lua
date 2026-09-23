--------------------------------------------------------------------------------
-- FenUI v2 - VirtualList Widget
--
-- A virtualized scrolling list that only renders visible items.
-- Optimized for large datasets (1000+ items) with minimal memory footprint.
--
-- Usage:
--   local list = FenUI:CreateVirtualList(parent, {
--       itemHeight = 24,
--       items = { {key="a", text="Item A"}, ... },
--       onSelect = function(key, item) ... end,
--       renderItem = function(button, item, isSelected) ... end,  -- optional
--   })
--------------------------------------------------------------------------------

local FenUI = FenUI

local VirtualListMixin = {}

function VirtualListMixin:Init(config)
	self.config = config or {}
	self.itemHeight = config.itemHeight or FenUI:GetLayout("rowHeight")
	self.items = {}
	self.filteredItems = nil -- nil means use all items
	self.rowPool = {}
	self.visibleRows = {}
	self.selectedKey = nil
	self.scrollOffset = 0
	self.onSelect = config.onSelect
	self.renderItem = config.renderItem

	-- Create scroll frame container (reserve the scrollbar's full width so
	-- rows never run underneath it)
	local scrollBarWidth = FenUI:GetLayout("scrollBarWidth")
	self.scrollFrame = CreateFrame("ScrollFrame", nil, self)
	self.scrollFrame:SetPoint("TOPLEFT", 0, 0)
	self.scrollFrame:SetPoint("BOTTOMRIGHT", -scrollBarWidth, 0)

	-- Content frame (will be sized to fit all items virtually)
	self.content = CreateFrame("Frame", nil, self.scrollFrame)
	self.content:SetWidth(1) -- Will be updated
	self.content:SetHeight(1) -- Will be updated
	self.scrollFrame:SetScrollChild(self.content)

	-- Scrollbar
	self.scrollBar = FenUI:CreateScrollBar(self, { width = scrollBarWidth })
	self.scrollBar:SetPoint("TOPRIGHT", 0, 0)
	self.scrollBar:SetPoint("BOTTOMRIGHT", 0, 0)
	self.scrollBar:SetValue(0)

	-- Mouse wheel scrolling
	self.scrollFrame:EnableMouseWheel(true)
	self.scrollFrame:SetScript("OnMouseWheel", function(_, delta)
		local current = self.scrollBar:GetValue()
		local step = self.itemHeight * 3 -- Scroll 3 items at a time
		self.scrollBar:SetValue(current - (delta * step))
	end)

	-- Scrollbar value changed
	self.scrollBar:SetScript("OnValueChanged", function(bar, value)
		self.scrollOffset = value
		self.scrollFrame:SetVerticalScroll(value)
		self:UpdateVisibleRows()
	end)

	-- Size changed handler
	self:SetScript("OnSizeChanged", function()
		self:UpdateLayout()
	end)

	-- Initial items
	if config.items then
		self:SetItems(config.items)
	end
end

function VirtualListMixin:SetItems(items)
	self.items = items or {}
	self.filteredItems = nil -- Reset filter
	self:UpdateLayout()
end

function VirtualListMixin:GetItems()
	return self.filteredItems or self.items
end

function VirtualListMixin:GetItemCount()
	local items = self:GetItems()
	return #items
end

function VirtualListMixin:SetFilter(filterFn)
	if filterFn then
		self.filteredItems = {}
		for _, item in ipairs(self.items) do
			if filterFn(item) then
				table.insert(self.filteredItems, item)
			end
		end
	else
		self.filteredItems = nil
	end
	self:UpdateLayout()
end

function VirtualListMixin:ClearFilter()
	self.filteredItems = nil
	self:UpdateLayout()
end

function VirtualListMixin:Select(key, silent)
	self.selectedKey = key
	self:UpdateVisibleRows()

	if not silent and self.onSelect then
		local items = self:GetItems()
		for _, item in ipairs(items) do
			if item.key == key then
				self.onSelect(key, item)
				break
			end
		end
	end
end

function VirtualListMixin:GetSelectedKey()
	return self.selectedKey
end

function VirtualListMixin:ScrollToKey(key)
	local items = self:GetItems()
	for i, item in ipairs(items) do
		if item.key == key then
			local targetOffset = (i - 1) * self.itemHeight
			local visibleHeight = self.scrollFrame:GetHeight()
			local maxScroll = math.max(0, (#items * self.itemHeight) - visibleHeight)
			-- Center the item if possible
			targetOffset = math.max(0, math.min(maxScroll, targetOffset - (visibleHeight / 2) + (self.itemHeight / 2)))
			self.scrollBar:SetValue(targetOffset)
			return true
		end
	end
	return false
end

function VirtualListMixin:UpdateLayout()
	local items = self:GetItems()
	local totalHeight = #items * self.itemHeight
	local visibleHeight = self.scrollFrame:GetHeight()
	local contentWidth = self.scrollFrame:GetWidth()

	-- Update content frame size
	self.content:SetSize(contentWidth, math.max(totalHeight, 1))

	-- Update scrollbar
	self.scrollBar:UpdateThumbSize(visibleHeight, totalHeight)

	-- Clamp scroll offset if needed
	local maxOffset = math.max(0, totalHeight - visibleHeight)
	if self.scrollOffset > maxOffset then
		self.scrollOffset = maxOffset
		self.scrollBar:SetValue(maxOffset)
	end

	self:UpdateVisibleRows()
end

function VirtualListMixin:UpdateVisibleRows()
	local items = self:GetItems()
	local visibleHeight = self.scrollFrame:GetHeight()
	local contentWidth = self.scrollFrame:GetWidth()

	-- Calculate which items are visible
	local firstVisible = math.floor(self.scrollOffset / self.itemHeight) + 1
	local visibleCount = math.ceil(visibleHeight / self.itemHeight) + 2 -- +2 for partial rows
	local lastVisible = math.min(firstVisible + visibleCount - 1, #items)

	-- Hide all current visible rows
	for _, row in ipairs(self.visibleRows) do
		row:Hide()
		table.insert(self.rowPool, row)
	end
	wipe(self.visibleRows)

	-- Create/reuse rows for visible items
	for i = firstVisible, lastVisible do
		local item = items[i]
		if item then
			local row = self:GetRow()
			local yOffset = (i - 1) * self.itemHeight

			row:SetPoint("TOPLEFT", self.content, "TOPLEFT", 0, -yOffset)
			row:SetSize(contentWidth, self.itemHeight)
			row.itemIndex = i
			row.itemKey = item.key
			row.itemData = item

			-- Render the item (reset per-item state left over from pooling)
			row.hover:Show()
			row.accent:Hide()
			local isSelected = (item.key == self.selectedKey)
			if self.renderItem then
				self.renderItem(row, item, isSelected)
			else
				self:DefaultRenderItem(row, item, isSelected)
			end

			row:Show()
			table.insert(self.visibleRows, row)
		end
	end
end

function VirtualListMixin:DefaultRenderItem(row, item, isSelected)
	-- Update selection highlight
	if isSelected then
		row.bg:SetColorTexture(FenUI:GetColor("surfaceRowSelected"))
		row.bg:Show()
	else
		row.bg:Hide()
	end
	row.accent:SetShown(isSelected and true or false)

	-- Set text
	row.text:SetText(item.text or item.key or "")

	-- Handle category/header items
	local pad = FenUI:GetSpacing("spacingTight")
	if item.isCategory or item.isHeader then
		local r, g, b = FenUI:GetColorRGB("textMuted")
		row.text:SetTextColor(r, g, b)
		row.text:SetPoint("LEFT", pad, 0)
		row.hover:Hide() -- Headers aren't interactive
		row:Disable()
	else
		row.text:SetTextColor(FenUI:GetColorRGB(isSelected and "textStrong" or "textDefault"))
		row.text:SetPoint("LEFT", pad + (item.indent or 0) * FenUI:GetSpacing("spacingElement"), 0)
		row.hover:Show()
		row:Enable()
	end
end

function VirtualListMixin:GetRow()
	local row = table.remove(self.rowPool)
	if not row then
		row = CreateFrame("Button", nil, self.content)

		-- Background for selection
		row.bg = row:CreateTexture(nil, "BACKGROUND")
		row.bg:SetAllPoints()
		row.bg:Hide()

		-- Gold leading edge for the selected row (shown by DefaultRenderItem)
		row.accent = row:CreateTexture(nil, "ARTWORK")
		row.accent:SetPoint("TOPLEFT")
		row.accent:SetPoint("BOTTOMLEFT")
		row.accent:SetWidth(FenUI:GetPixelSize(row, 2))
		row.accent:SetColorTexture(FenUI:GetColor("accentBar"))
		row.accent:Hide()

		-- Hover highlight (token alpha keeps the selection visible underneath)
		row.hover = row:CreateTexture(nil, "HIGHLIGHT")
		row.hover:SetAllPoints()
		row.hover:SetColorTexture(FenUI:GetColor("surfaceRowHover"))

		-- Text
		local pad = FenUI:GetSpacing("spacingTight")
		row.text = row:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
		row.text:SetPoint("LEFT", pad, 0)
		row.text:SetPoint("RIGHT", -pad, 0)
		row.text:SetJustifyH("LEFT")
		row.text:SetWordWrap(false)
		row.text:SetMaxLines(1)

		-- Click handler
		row:SetScript("OnClick", function(r)
			if r.itemKey and not (r.itemData and (r.itemData.isCategory or r.itemData.isHeader)) then
				self:Select(r.itemKey)
			end
		end)
	end
	return row
end

function VirtualListMixin:Refresh()
	self:UpdateLayout()
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

function FenUI:CreateVirtualList(parent, config)
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetSize(config.width or 200, config.height or 300)

	FenUI.Mixin(frame, VirtualListMixin)
	frame:Init(config)

	return frame
end

FenUI.VirtualListMixin = VirtualListMixin

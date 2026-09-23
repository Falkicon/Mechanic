--------------------------------------------------------------------------------
-- FenUI - Tree Widget
--
-- A simple tree view for hierarchical data.
--------------------------------------------------------------------------------

local FenUI = FenUI
local WidgetMixin = {}

function WidgetMixin:Init(config)
	self.config = config or {}
	self.nodes = {}
	self.scrollFrame = FenUI:CreateScrollInset(self, {
		background = "surfaceInset",
	})
	self.scrollFrame:SetAllPoints()

	self.content = self.scrollFrame:GetScrollChild()
	self.content:SetWidth(self.scrollFrame:GetWidth())

	self.rows = {}
	self.rowPool = {}
end

function WidgetMixin:SetData(data)
	self.data = data
	self:Refresh()
end

function WidgetMixin:Refresh()
	-- Clear current rows
	for _, row in ipairs(self.rows) do
		row:Hide()
		table.insert(self.rowPool, row)
	end
	wipe(self.rows)

	local rowHeight = FenUI:GetLayout("rowHeight")
	local indent = FenUI:GetSpacing("spacingElement")
	local yOffset = 0
	local function addNode(node, depth)
		local row = self:GetRow()
		row:ClearAllPoints()
		row:SetPoint("TOPLEFT", 0, -yOffset)
		row:SetPoint("TOPRIGHT", 0, -yOffset)
		row:SetHeight(rowHeight)
		-- Indent the label only, so hover/selection span the full row width
		row.text:SetPoint("LEFT", FenUI:GetSpacing("spacingTight") + depth * indent, 0)
		row:SetText(node.text)
		row.value = node.value
		row.isHovered = row:IsMouseOver()
		self:UpdateRowBackground(row)
		row:Show()

		table.insert(self.rows, row)
		yOffset = yOffset + rowHeight

		local expanded = node.expanded
		if expanded == nil then
			expanded = true
		end -- Default to expanded

		if node.children and expanded then
			for _, child in ipairs(node.children) do
				addNode(child, depth + 1)
			end
		end
	end

	if self.data then
		for _, node in ipairs(self.data) do
			addNode(node, 0)
		end
	end

	self.content:SetHeight(math.max(1, yOffset))
end

--- Paint a row's background: selected > hovered > none
function WidgetMixin:UpdateRowBackground(row)
	local r, g, b, a = 0, 0, 0, 0
	local selected = row.value ~= nil and row.value == self.selectedValue
	if selected then
		r, g, b, a = FenUI:GetColor(row.isHovered and "surfaceRowSelectedHover" or "surfaceRowSelected")
	elseif row.isHovered then
		r, g, b, a = FenUI:GetColor("surfaceRowHover")
	end
	row.bg:SetColorTexture(r, g, b, a)
	row.accent:SetShown(selected)
	row.text:SetTextColor(FenUI:GetColorRGB(selected and "textStrong" or "textDefault"))
end

--- Select a node by value
---@param value any
---@param silent boolean|nil Skip the onSelect callback
function WidgetMixin:Select(value, silent)
	self.selectedValue = value
	for _, row in ipairs(self.rows) do
		self:UpdateRowBackground(row)
	end
	if not silent and self.config.onSelect then
		self.config.onSelect(value)
	end
end

function WidgetMixin:GetSelected()
	return self.selectedValue
end

function WidgetMixin:GetRow()
	local row = table.remove(self.rowPool)
	if not row then
		row = CreateFrame("Button", nil, self.content)

		-- Single background texture driven by UpdateRowBackground
		row.bg = row:CreateTexture(nil, "BACKGROUND")
		row.bg:SetAllPoints()

		-- Gold leading edge marks the selected row
		row.accent = row:CreateTexture(nil, "ARTWORK")
		row.accent:SetPoint("TOPLEFT")
		row.accent:SetPoint("BOTTOMLEFT")
		row.accent:SetWidth(FenUI:GetPixelSize(row, 2))
		row.accent:SetColorTexture(FenUI:GetColor("accentBar"))
		row.accent:Hide()

		-- Text
		local pad = FenUI:GetSpacing("spacingTight")
		row.text = row:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
		row.text:SetPoint("LEFT", pad, 0)
		row.text:SetPoint("RIGHT", -pad, 0)
		row.text:SetJustifyH("LEFT")
		row.text:SetWordWrap(false)
		row.text:SetMaxLines(1)
		local tR, tG, tB = FenUI:GetColorRGB("textDefault")
		row.text:SetTextColor(tR, tG, tB)

		row:SetScript("OnEnter", function(r)
			r.isHovered = true
			self:UpdateRowBackground(r)
		end)
		row:SetScript("OnLeave", function(r)
			r.isHovered = false
			self:UpdateRowBackground(r)
		end)
		row:SetScript("OnClick", function(r)
			-- Nodes without a value are group labels, not selectable items
			if r.value ~= nil then
				self:Select(r.value)
			end
		end)

		function row:SetText(t)
			self.text:SetText(t)
		end
	end
	return row
end

-- Factory function
function FenUI:CreateTree(parent, config)
	config = config or {}
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetSize(config.width or 200, config.height or 300)

	FenUI.Mixin(frame, WidgetMixin)
	frame:Init(config)

	return frame
end

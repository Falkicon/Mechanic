--------------------------------------------------------------------------------
-- FenUI v2 - Grid Widget
--
-- CSS Grid-inspired layout component with:
-- - Column definitions (auto, px, fr)
-- - Row pooling and recycling
-- - Manual and data-bound patterns
-- - Familiar mental model for modern developers
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- Grid Row Mixin
--------------------------------------------------------------------------------

local GridRowMixin = {}

function GridRowMixin:Init(grid, index)
	self.grid = grid
	self.index = index
	self.cells = {}

	-- Background for alternating colors and hover
	self.bg = self:CreateTexture(nil, "BACKGROUND")
	self.bg:SetAllPoints()
	self:UpdateBackground()

	-- Interaction
	self:SetScript("OnEnter", function()
		self.isHovered = true
		self:UpdateBackground()
		if self.grid.hooks.onRowEnter then
			self.grid.hooks.onRowEnter(self, self.data, self.index)
		end
	end)

	self:SetScript("OnLeave", function()
		self.isHovered = false
		self:UpdateBackground()
		if self.grid.hooks.onRowLeave then
			self.grid.hooks.onRowLeave(self, self.data, self.index)
		end
	end)

	self:SetScript("OnMouseDown", function()
		if self.grid.hooks.onRowClick then
			self.grid.hooks.onRowClick(self, self.data, self.index)
		end
	end)

	-- Create cells based on grid columns
	self:CreateCells()
end

function GridRowMixin:CreateCells()
	local colDefs = self.grid.config.columns
	for i, _ in ipairs(colDefs) do
		local cell = CreateFrame("Frame", nil, self)
		self.cells[i] = cell

		-- Cell content helper
		cell.SetContent = function(_, frame)
			if cell.content then
				cell.content:Hide()
			end
			cell.content = frame
			if frame then
				frame:SetParent(cell)
				frame:ClearAllPoints()
				frame:SetPoint("CENTER")
				frame:Show()
			end
		end

		-- Convenience text/icon helpers
		cell.SetText = function(_, text, fontToken)
			if not cell.fontString then
				cell.fontString = cell:CreateFontString(nil, "OVERLAY")
				cell.fontString:SetFontObject(FenUI:GetFont(fontToken or "fontBody"))
				cell.fontString:SetPoint("LEFT", 4, 0)
				cell.fontString:SetPoint("RIGHT", -4, 0)
				cell.fontString:SetJustifyH("LEFT")
			end
			cell.fontString:SetText(text)
			cell.fontString:Show()
			if cell.icon then
				cell.icon:Hide()
			end
		end

		cell.SetIcon = function(_, texture, size)
			if not cell.icon then
				cell.icon = cell:CreateTexture(nil, "ARTWORK")
				cell.icon:SetPoint("CENTER")
			end
			cell.icon:SetTexture(texture)
			cell.icon:SetSize(size or 20, size or 20)
			cell.icon:Show()
			if cell.fontString then
				cell.fontString:Hide()
			end
		end
	end
end

function GridRowMixin:UpdateBackground()
	local isAlt = (self.index % 2 == 0)
	local r, g, b, a = 0, 0, 0, 0

	if self.isSelected then
		r, g, b, a = FenUI:GetColor("surfaceRowSelected")
	elseif self.isHovered then
		r, g, b, a = FenUI:GetColor("surfaceRowHover")
	elseif isAlt then
		r, g, b, a = FenUI:GetColor("surfaceRowAlt")
	end

	self.bg:SetColorTexture(r, g, b, a)
end

function GridRowMixin:SetSelected(selected)
	self.isSelected = selected
	self:UpdateBackground()
end

function GridRowMixin:GetCell(index)
	return self.cells[index]
end

function GridRowMixin:Bind(data, index)
	self.data = data
	self.index = index
	self:UpdateBackground()
	self:Show()
end

--------------------------------------------------------------------------------
-- Grid Mixin
--------------------------------------------------------------------------------

local GridMixin = {}

function GridMixin:Init(config)
	self.config = config or {}
	self.config.columns = config.columns or { "1fr" }
	self.config.rowHeight = config.rowHeight or FenUI:GetLayout("rowHeight")
	self.config.gap = config.gap or 0

	self.rows = {}
	self.rowPool = {}
	self.data = {}
	self.hooks = {
		onRowBind = config.onRowBind,
		onRowClick = config.onRowClick,
		onRowEnter = config.onRowEnter,
		onRowLeave = config.onRowLeave,
	}

	-- Handle resizing to update fr units
	self:SetScript("OnSizeChanged", function()
		self:UpdateLayout()
	end)
end

function GridMixin:UpdateLayout()
	local width = self:GetWidth()
	local colDefs = self.config.columns
	local gap = type(self.config.gap) == "table" and self.config.gap.column or self.config.gap or 0
	local totalGap = gap * (#colDefs - 1)
	local availableWidth = width - totalGap

	-- Calculate column widths
	local colWidths = {}
	local totalFr = 0
	local usedWidth = 0

	-- Pass 1: Fixed and Auto
	for i, def in ipairs(colDefs) do
		if type(def) == "number" then
			colWidths[i] = def
			usedWidth = usedWidth + def
		elseif type(def) == "string" and def:find("px$") then
			local val = tonumber(def:match("^(%d+)"))
			colWidths[i] = val
			usedWidth = usedWidth + val
		elseif def == "auto" then
			-- For simplicity in WoW, auto behaves like 1fr for now unless content measured
			-- True CSS auto is hard without pre-measuring all content
			totalFr = totalFr + 1
		elseif type(def) == "string" and def:find("fr$") then
			local val = tonumber(def:match("^(%d+)")) or 1
			totalFr = totalFr + val
		end
	end

	-- Pass 2: Fractional
	local frWidth = totalFr > 0 and (availableWidth - usedWidth) / totalFr or 0
	for i, def in ipairs(colDefs) do
		if not colWidths[i] then
			local fr = 1
			if type(def) == "string" and def:find("fr$") then
				fr = tonumber(def:match("^(%d+)")) or 1
			end
			colWidths[i] = fr * frWidth
		end
	end

	-- Apply to all visible rows
	for _, row in ipairs(self.rows) do
		self:ApplyRowLayout(row, colWidths, gap)
	end

	self.colWidths = colWidths
	self.colGap = gap
end

function GridMixin:ApplyRowLayout(row, widths, gap)
	local xOffset = 0
	for i, cellWidth in ipairs(widths) do
		local cell = row:GetCell(i)
		cell:ClearAllPoints()
		cell:SetPoint("TOPLEFT", row, "TOPLEFT", xOffset, 0)
		cell:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", xOffset, 0)
		cell:SetWidth(math.max(1, cellWidth))
		xOffset = xOffset + cellWidth + gap
	end
end

function GridMixin:AddRow()
	local row = table.remove(self.rowPool)
	if not row then
		row = CreateFrame("Button", nil, self)
		FenUI.Mixin(row, GridRowMixin)
		row:Init(self, #self.rows + 1)
	end

	local rowHeight = self.config.rowHeight
	row:SetHeight(rowHeight)

	-- Position
	local prevRow = self.rows[#self.rows]
	local rowGap = type(self.config.gap) == "table" and self.config.gap.row or self.config.gap or 0

	row:ClearAllPoints()
	if prevRow then
		row:SetPoint("TOPLEFT", prevRow, "BOTTOMLEFT", 0, -rowGap)
		row:SetPoint("TOPRIGHT", prevRow, "BOTTOMRIGHT", 0, -rowGap)
	else
		row:SetPoint("TOPLEFT", 0, 0)
		row:SetPoint("TOPRIGHT", 0, 0)
	end

	table.insert(self.rows, row)

	if self.colWidths then
		self:ApplyRowLayout(row, self.colWidths, self.colGap)
	end

	row:Show()
	return row
end

function GridMixin:Clear()
	for _, row in ipairs(self.rows) do
		row:Hide()
		table.insert(self.rowPool, row)
	end
	wipe(self.rows)
end

--- Data Binding API
function GridMixin:SetData(data)
	self.data = data or {}
	self:Refresh()
end

function GridMixin:SetRowBinder(func)
	self.hooks.onRowBind = func
end

function GridMixin:Refresh()
	self:Clear()

	local rowGap = type(self.config.gap) == "table" and self.config.gap.row or self.config.gap or 0
	local totalHeight = 0

	for i, item in ipairs(self.data) do
		local row = self:AddRow()
		row:Bind(item, i)

		if self.hooks.onRowBind then
			self.hooks.onRowBind(row, item, i)
		end

		totalHeight = totalHeight + self.config.rowHeight + (i > 1 and rowGap or 0)
	end

	self:SetHeight(math.max(1, totalHeight))
end

function GridMixin:Sort(comparator)
	table.sort(self.data, comparator)
	self:Refresh()
end

function GridMixin:Filter(predicate)
	local filtered = {}
	for _, item in ipairs(self.data) do
		if predicate(item) then
			table.insert(filtered, item)
		end
	end
	self.data = filtered
	self:Refresh()
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

--- Create a grid component
---@param parent Frame Parent frame
---@param config table Configuration { columns, rowHeight, gap, onRowBind, onRowClick, etc }
---@return Frame grid
function FenUI:CreateGrid(parent, config)
	local grid = CreateFrame("Frame", nil, parent)
	FenUI.Mixin(grid, GridMixin)
	grid:Init(config)
	return grid
end

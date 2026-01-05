--------------------------------------------------------------------------------
-- FenUI v2 - Group Widget
--
-- Lightweight, skinless container for structural layout and semantics.
-- Equivalent to a <div> in HTML. No background, border, or shadows.
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- Group Mixin
--------------------------------------------------------------------------------

local GroupMixin = {}

function GroupMixin:Init(config)
	self.config = config or {}
	self.cells = {}

	-- Apply name for inspector UI identification
	if config.name then
		self:SetName(config.name)
	end

	-- Apply size (supports responsive strings like "50%" and "auto", and constraints)
	if
		config.width
		or config.height
		or config.minWidth
		or config.maxWidth
		or config.minHeight
		or config.maxHeight
		or config.aspectRatio
	then
		self:ApplySize(config.width, config.height, {
			minWidth = config.minWidth,
			maxWidth = config.maxWidth,
			minHeight = config.minHeight,
			maxHeight = config.maxHeight,
			aspectRatio = config.aspectRatio,
			aspectBase = config.aspectBase,
		})
	end

	-- Create content layer (placeholder for consistency with Layout)
	self.contentFrame = nil

	-- Hook content for auto-sizing
	if self.isAutoSizing then
		FenUI.Utils:ObserveIntrinsicSize(self, self:GetContentFrame())
	end

	-- Re-apply content anchors when size changes if margin/padding exist
	self:HookScript("OnSizeChanged", function(f, w, h)
		if f.contentFrame then
			local p = f:GetPadding()
			local m = f:GetMargin()
			f.contentFrame:ClearAllPoints()
			f.contentFrame:SetPoint("TOPLEFT", m.left + p.left, -(m.top + p.top))

			if not (f.dynamicSize and (f.dynamicSize.width == "auto" or f.dynamicSize.height == "auto")) then
				f.contentFrame:SetPoint("BOTTOMRIGHT", -(m.right + p.right), m.bottom + p.bottom)
			end
		end
		if f.cells and #f.cells > 0 then
			f:LayoutCells()
		end
	end)

	-- Create cells if multi-row or multi-column mode
	if config.rows or config.cols then
		self:CreateCells()
	end
end

--- Set the size of the group (supports responsive units)
---@param width number|string
---@param height number|string
---@param constraints table|nil { minWidth, maxWidth, minHeight, maxHeight, aspectRatio, aspectBase }
function GroupMixin:ApplySize(width, height, constraints)
	FenUI.Utils:ApplySize(self, width, height, constraints)
end

--- Internal method called when parent resizes (for responsive units)
function GroupMixin:UpdateDynamicSize()
	FenUI.Utils:UpdateDynamicSize(self)
end

--------------------------------------------------------------------------------
-- Margin, Padding & Content
--------------------------------------------------------------------------------

--- Get margin values (consistent with Layout principle)
---@return table { top, bottom, left, right }
function GroupMixin:GetMargin()
	local config = self.config
	local margin = config.margin
	local base = { top = 0, bottom = 0, left = 0, right = 0 }

	if margin then
		if type(margin) == "number" then
			base = { top = margin, bottom = margin, left = margin, right = margin }
		elseif type(margin) == "string" then
			local val = FenUI:GetSpacing(margin)
			if val == 0 then
				val = FenUI:GetLayout(margin)
			end
			base = { top = val, bottom = val, left = val, right = val }
		elseif type(margin) == "table" then
			base = {
				top = margin.top or 0,
				bottom = margin.bottom or 0,
				left = margin.left or 0,
				right = margin.right or 0,
			}
		end
	end

	-- Apply individual side overrides
	if config.marginTop then
		base.top = FenUI:GetSpacing(config.marginTop)
	end
	if config.marginBottom then
		base.bottom = FenUI:GetSpacing(config.marginBottom)
	end
	if config.marginLeft then
		base.left = FenUI:GetSpacing(config.marginLeft)
	end
	if config.marginRight then
		base.right = FenUI:GetSpacing(config.marginRight)
	end

	return base
end

--- Get padding values (consistent with Layout principle)
---@return table { top, bottom, left, right }
function GroupMixin:GetPadding()
	local config = self.config
	local padding = config.padding
	local base = { top = 0, bottom = 0, left = 0, right = 0 }

	if padding then
		if type(padding) == "number" then
			base = { top = padding, bottom = padding, left = padding, right = padding }
		elseif type(padding) == "string" then
			local val = FenUI:GetSpacing(padding)
			if val == 0 then
				val = FenUI:GetLayout(padding)
			end
			base = { top = val, bottom = val, left = val, right = val }
		elseif type(padding) == "table" then
			base = {
				top = padding.top or 0,
				bottom = padding.bottom or 0,
				left = padding.left or 0,
				right = padding.right or 0,
			}
		end
	end

	-- Apply individual side overrides
	if config.paddingTop then
		base.top = FenUI:GetSpacing(config.paddingTop)
	end
	if config.paddingBottom then
		base.bottom = FenUI:GetSpacing(config.paddingBottom)
	end
	if config.paddingLeft then
		base.left = FenUI:GetSpacing(config.paddingLeft)
	end
	if config.paddingRight then
		base.right = FenUI:GetSpacing(config.paddingRight)
	end

	return base
end

--- Get the content frame (creates if needed for single-cell mode)
---@return Frame
function GroupMixin:GetContentFrame()
	if not self.contentFrame then
		self.contentFrame = CreateFrame("Frame", nil, self)

		local p = self:GetPadding()
		local m = self:GetMargin()
		self.contentFrame:SetPoint("TOPLEFT", m.left + p.left, -(m.top + p.top))

		if self.dynamicSize and (self.dynamicSize.width == "auto" or self.dynamicSize.height == "auto") then
			-- Let children define the size
		else
			self.contentFrame:SetPoint("BOTTOMRIGHT", -(m.right + p.right), m.bottom + p.bottom)
		end
	end
	return self.contentFrame
end

--- Set content for single-cell mode
---@param frame Frame Frame to place in content area
function GroupMixin:SetContent(frame)
	if not frame then
		return
	end

	local content = self:GetContentFrame()
	frame:SetParent(content)
	frame:ClearAllPoints()
	frame:SetAllPoints()
	frame:Show()
end

--------------------------------------------------------------------------------
-- Grid System (Structural Only)
--------------------------------------------------------------------------------

function GroupMixin:CreateCells()
	local rowDefs = self.config.rows
	local colDefs = self.config.cols
	local defs = rowDefs or colDefs

	if not defs then
		return
	end

	-- Handle numeric defs by creating an array of "1fr"
	if type(defs) == "number" then
		local num = defs
		defs = {}
		for i = 1, num do
			table.insert(defs, "1fr")
		end
	end

	if #defs == 0 then
		return
	end

	self.orientation = rowDefs and "VERTICAL" or "HORIZONTAL"
	local parsedDefs = {}

	for i, def in ipairs(defs) do
		if def == "auto" then
			parsedDefs[i] = { type = "auto", value = 0 }
		elseif type(def) == "number" then
			parsedDefs[i] = { type = "fixed", value = def }
		elseif type(def) == "string" and def:find("px$") then
			local val = tonumber(def:match("^(%d+)")) or 0
			parsedDefs[i] = { type = "fixed", value = val }
		elseif type(def) == "string" and def:find("fr$") then
			local val = tonumber(def:match("^(%d+)")) or 1
			parsedDefs[i] = { type = "fr", value = val }
		else
			parsedDefs[i] = { type = "fr", value = 1 }
		end
	end

	for i = 1, #defs do
		local cell = CreateFrame("Frame", nil, self)
		cell.index = i
		cell.def = parsedDefs[i]
		self.cells[i] = cell
	end

	self:SetScript("OnSizeChanged", function()
		self:LayoutCells()
	end)

	self:LayoutCells()
end

function GroupMixin:LayoutCells()
	if #self.cells == 0 then
		return
	end

	local p = self:GetPadding()
	local m = self:GetMargin()
	local gap = self:ResolveGap()
	local isVertical = self.orientation == "VERTICAL"

	local totalSize = isVertical and (self:GetHeight() - (p.top + p.bottom + m.top + m.bottom))
		or (self:GetWidth() - (p.left + p.right + m.left + m.right))

	local totalGaps = gap * (#self.cells - 1)
	local availableSize = math.max(0, totalSize - totalGaps)

	local fixedSize = 0
	local totalFr = 0

	for _, cell in ipairs(self.cells) do
		if cell.def.type == "fixed" then
			fixedSize = fixedSize + cell.def.value
		elseif cell.def.type == "fr" then
			totalFr = totalFr + cell.def.value
		end
	end

	local frSize = totalFr > 0 and math.max(0, availableSize - fixedSize) / totalFr or 0

	local offset = isVertical and (p.top + m.top) or (p.left + m.left)
	for i, cell in ipairs(self.cells) do
		local cellSize
		if cell.def.type == "fixed" then
			cellSize = cell.def.value
		elseif cell.def.type == "fr" then
			cellSize = frSize * cell.def.value
		else
			cellSize = frSize
		end

		cell:ClearAllPoints()
		if isVertical then
			cell:SetPoint("TOPLEFT", p.left + m.left, -offset)
			cell:SetPoint("TOPRIGHT", -(p.right + m.right), -offset)
			cell:SetHeight(math.max(1, cellSize))
		else
			cell:SetPoint("TOPLEFT", offset, -(p.top + m.top))
			cell:SetPoint("BOTTOMLEFT", offset, p.bottom + m.bottom)
			cell:SetWidth(math.max(1, cellSize))
		end

		offset = offset + cellSize + gap
	end
end

function GroupMixin:GetCell(index)
	return self.cells[index]
end

function GroupMixin:ResolveGap()
	local gap = self.config.gap
	if type(gap) == "string" then
		return FenUI:GetSpacing(gap)
	elseif type(gap) == "number" then
		return gap
	elseif type(gap) == "table" then
		return gap.row or 0
	end
	return 0
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

--- Create a lightweight structural group
---@param parent Frame Parent frame
---@param config table Configuration { name, width, height, padding, gap, rows, cols }
---@return Frame group
function FenUI:CreateGroup(parent, config)
	config = config or {}

	-- Ensure predictable naming for inspector UI
	local frameName = config.name and ("FenUIGroup_" .. config.name) or nil
	local group = CreateFrame("Frame", frameName, parent or UIParent)

	FenUI.Mixin(group, GroupMixin)
	group:Init(config)

	return group
end

--------------------------------------------------------------------------------
-- Builder
--------------------------------------------------------------------------------

local GroupBuilder = {}
GroupBuilder.__index = GroupBuilder

function GroupBuilder:new(parent)
	local builder = setmetatable({}, GroupBuilder)
	builder._parent = parent or UIParent
	builder._config = {}
	return builder
end

function GroupBuilder:name(name)
	self._config.name = name
	return self
end
function GroupBuilder:size(w, h)
	self._config.width = w
	self._config.height = h
	return self
end
function GroupBuilder:width(w)
	self._config.width = w
	return self
end
function GroupBuilder:height(h)
	self._config.height = h
	return self
end
function GroupBuilder:minWidth(w)
	self._config.minWidth = w
	return self
end
function GroupBuilder:maxWidth(w)
	self._config.maxWidth = w
	return self
end
function GroupBuilder:minHeight(h)
	self._config.minHeight = h
	return self
end
function GroupBuilder:maxHeight(h)
	self._config.maxHeight = h
	return self
end
function GroupBuilder:aspectRatio(r, b)
	self._config.aspectRatio = r
	self._config.aspectBase = b or "width"
	return self
end
function GroupBuilder:padding(p)
	self._config.padding = p
	return self
end
function GroupBuilder:paddingTop(p)
	self._config.paddingTop = p
	return self
end
function GroupBuilder:paddingBottom(p)
	self._config.paddingBottom = p
	return self
end
function GroupBuilder:paddingLeft(p)
	self._config.paddingLeft = p
	return self
end
function GroupBuilder:paddingRight(p)
	self._config.paddingRight = p
	return self
end
function GroupBuilder:rows(r)
	self._config.rows = r
	return self
end
function GroupBuilder:cols(c)
	self._config.cols = c
	return self
end
function GroupBuilder:columns(c)
	return self:cols(c)
end
function GroupBuilder:gap(g)
	self._config.gap = g
	return self
end

function GroupBuilder:build()
	return FenUI:CreateGroup(self._parent, self._config)
end

function FenUI.Group(parent)
	return GroupBuilder:new(parent)
end

FenUI.GroupMixin = GroupMixin

--------------------------------------------------------------------------------
-- FenUI v2 - Toolbar Widget
--
-- Horizontal layout for buttons, spacers, and other controls.
-- Composable building block for footers, headers, and navigation.
--------------------------------------------------------------------------------

local FenUI = FenUI

--------------------------------------------------------------------------------
-- Toolbar Mixin
--------------------------------------------------------------------------------

local ToolbarMixin = {}

function ToolbarMixin:Init(config)
	config = config or {}
	self.config = config
	self.items = {}

	if config.width then
		self:SetWidth(config.width)
	end
	self:SetHeight(config.height or FenUI:GetLayout("buttonHeight") + 8)

	-- Handle resizing
	self:SetScript("OnSizeChanged", function()
		self:UpdateLayout()
	end)
end

function ToolbarMixin:AddButton(config)
	local btn = FenUI:CreateButton(self, config)
	table.insert(self.items, { type = "button", frame = btn })
	self:UpdateLayout()
	return btn
end

function ToolbarMixin:AddIconButton(config)
	local btn = FenUI:CreateIconButton(self, config)
	table.insert(self.items, { type = "iconButton", frame = btn })
	self:UpdateLayout()
	return btn
end

function ToolbarMixin:AddImageButton(config)
	local btn = FenUI:CreateImageButton(self, config)
	table.insert(self.items, { type = "imageButton", frame = btn })
	self:UpdateLayout()
	return btn
end

function ToolbarMixin:AddSpacer(width)
	local spacer = { type = "spacer", width = width or "flex" }
	table.insert(self.items, spacer)
	self:UpdateLayout()
end

function ToolbarMixin:AddFrame(frame)
	frame:SetParent(self)
	table.insert(self.items, { type = "frame", frame = frame })

	-- Reflow when an item is shown/hidden or resizes (e.g. auto-width button text)
	if not frame.fenUIToolbarHooked and frame.HookScript then
		frame.fenUIToolbarHooked = true
		local function Reflow()
			if frame:GetParent() == self then
				self:UpdateLayout()
			end
		end
		frame:HookScript("OnShow", Reflow)
		frame:HookScript("OnHide", Reflow)
		frame:HookScript("OnSizeChanged", Reflow)
	end

	self:UpdateLayout()
end

function ToolbarMixin:AddDivider()
	local divider = self:CreateTexture(nil, "ARTWORK")
	divider:SetColorTexture(FenUI:GetColorRGB("borderSubtle"))
	divider:SetWidth(FenUI:GetPixelSize(self))
	divider:SetHeight(math.floor(self:GetHeight() * 0.6 + 0.5))
	table.insert(self.items, { type = "divider", frame = divider })
	self:UpdateLayout()
end

function ToolbarMixin:Clear()
	for _, item in ipairs(self.items) do
		if item.frame then
			item.frame:Hide()
		end
	end
	wipe(self.items)
	self:UpdateLayout()
end

function ToolbarMixin:UpdateLayout()
	local width = self:GetWidth()
	local gap = self.config.gap or FenUI:GetSpacing("spacingTight")
	local padding = self.config.padding or { left = 0, right = 0 }
	if type(padding) == "number" then
		padding = { left = padding, right = padding }
	end

	local availableWidth = width - (padding.left or 0) - (padding.right or 0)

	-- Pass 1: Calculate fixed width and count flex spacers
	local fixedWidth = 0
	local flexCount = 0
	local visibleCount = 0

	for _, item in ipairs(self.items) do
		if item.type == "spacer" and item.width == "flex" then
			flexCount = flexCount + 1
		elseif item.frame and not item.frame:IsShown() then -- luacheck: ignore 542
			-- Hidden items take no space
		else
			if item.frame then
				fixedWidth = fixedWidth + item.frame:GetWidth()
			elseif item.type == "spacer" then
				fixedWidth = fixedWidth + (item.width or 0)
			end
			visibleCount = visibleCount + 1
		end
	end

	-- Add gaps
	fixedWidth = fixedWidth + (math.max(0, visibleCount + flexCount - 1) * gap)

	local flexWidth = flexCount > 0 and (availableWidth - fixedWidth) / flexCount or 0

	-- Pass 2: Position items
	local xOffset = padding.left or 0
	local align = self.config.align or "left"

	-- Alignment adjustments
	-- Whole pixels keep 1px borders and dividers crisp
	if align == "right" and flexCount == 0 then
		xOffset = math.floor(width - fixedWidth - (padding.right or 0) + 0.5)
	elseif align == "center" and flexCount == 0 then
		xOffset = math.floor((padding.left or 0) + (availableWidth - fixedWidth) / 2 + 0.5)
	end

	for _, item in ipairs(self.items) do
		if item.type == "spacer" and item.width == "flex" then
			xOffset = xOffset + flexWidth + gap
		elseif item.frame and not item.frame:IsShown() then -- luacheck: ignore 542
			-- Respect hidden items (previously they were force-shown every layout)
		else
			local itemWidth = 0
			if item.frame then
				item.frame:ClearAllPoints()
				item.frame:SetPoint("LEFT", self, "LEFT", math.floor(xOffset + 0.5), 0)
				itemWidth = item.frame:GetWidth()
			elseif item.type == "spacer" then
				itemWidth = item.width or 0
			end
			xOffset = xOffset + itemWidth + gap
		end
	end
end

--------------------------------------------------------------------------------
-- Factory
--------------------------------------------------------------------------------

--- Create a toolbar component
---@param parent Frame Parent frame
---@param config table|nil Configuration { height, align, gap, padding }
---@return Frame toolbar
function FenUI:CreateToolbar(parent, config)
	local toolbar = CreateFrame("Frame", nil, parent)
	FenUI.Mixin(toolbar, ToolbarMixin)
	toolbar:Init(config)
	return toolbar
end

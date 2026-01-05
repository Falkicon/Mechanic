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

	local yOffset = 0
	local function addNode(node, depth)
		local row = self:GetRow()
		row:SetPoint("TOPLEFT", depth * 16, -yOffset)
		row:SetPoint("TOPRIGHT", 0, -yOffset)
		row:SetText(node.text)
		row.value = node.value
		row:Show()

		table.insert(self.rows, row)
		yOffset = yOffset + 20

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

	self.content:SetHeight(yOffset)
end

function WidgetMixin:GetRow()
	local row = table.remove(self.rowPool)
	if not row then
		row = CreateFrame("Button", nil, self.content)
		row:SetHeight(20)

		-- Background for hover state
		row.bg = row:CreateTexture(nil, "BACKGROUND")
		row.bg:SetAllPoints()
		row.bg:Hide()

		-- Hover highlight using HIGHLIGHT layer (auto-shown on hover)
		row.hover = row:CreateTexture(nil, "HIGHLIGHT")
		row.hover:SetAllPoints()
		local hR, hG, hB = FenUI:GetColorRGB("surfaceRowHover")
		row.hover:SetColorTexture(hR, hG, hB, 1)

		-- Text
		row.text = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
		row.text:SetPoint("LEFT", 4, 0)
		row.text:SetPoint("RIGHT", -4, 0)
		row.text:SetJustifyH("LEFT")
		local tR, tG, tB = FenUI:GetColorRGB("textDefault")
		row.text:SetTextColor(tR, tG, tB)

		row:SetScript("OnClick", function(r)
			-- Update selected state
			if self.selectedRow and self.selectedRow ~= r then
				self.selectedRow.bg:Hide()
			end
			self.selectedRow = r
			local selR, selG, selB = FenUI:GetColorRGB("surfaceRowSelected")
			r.bg:SetColorTexture(selR, selG, selB, 1)
			r.bg:Show()

			if self.config.onSelect then
				self.config.onSelect(r.value)
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
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetSize(config.width or 200, config.height or 300)

	FenUI.Mixin(frame, WidgetMixin)
	frame:Init(config)

	return frame
end

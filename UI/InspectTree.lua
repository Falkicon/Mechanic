-- UI/InspectTree.lua
-- !Mechanic - Inspect Tab: Frame Tree Component (Phase 8)

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local InspectModule = Mechanic.Inspect

function InspectModule:InitializeTree(parent)
	local scrollFrame = CreateFrame("ScrollFrame", nil, parent, "UIPanelScrollFrameTemplate")
	scrollFrame:SetPoint("TOPLEFT", 4, -4)
	scrollFrame:SetPoint("BOTTOMRIGHT", -24, 4)
	self.treeScroll = scrollFrame

	local content = CreateFrame("Frame", nil, scrollFrame)
	content:SetWidth(parent:GetWidth() - 28)
	scrollFrame:SetScrollChild(content)
	self.treeContent = content

	self.treeNodes = {}
	self.expandedNodes = {} -- frame -> true
end

function InspectModule:UpdateTree(selectedFrame)
	-- For now, a simple list of parent -> self -> children
	-- A full tree would be more complex, but let's start with a "Contextual Tree"
	
	for _, node in ipairs(self.treeNodes) do
		node:Hide()
	end
	
	if not selectedFrame then return end

	local yOffset = 0
	local nodes = {}

	-- 1. Ancestors
	local ancestors = {}
	local current = selectedFrame:GetParent()
	while current and current ~= UIParent do
		table.insert(ancestors, 1, current)
		current = current:GetParent()
	end
	
	for _, frame in ipairs(ancestors) do
		table.insert(nodes, { frame = frame, indent = #nodes * 10, type = "ancestor" })
	end

	-- 2. Selected Frame
	local selectedIdx = #nodes + 1
	table.insert(nodes, { frame = selectedFrame, indent = #ancestors * 10, type = "selected" })

	-- 3. Children
	local children = { selectedFrame:GetChildren() }
	for _, child in ipairs(children) do
		table.insert(nodes, { frame = child, indent = (#ancestors + 1) * 10, type = "child" })
	end

	-- Render nodes
	for i, nodeData in ipairs(nodes) do
		local node = self:GetOrCreateTreeNode(i)
		node:SetPoint("TOPLEFT", self.treeContent, "TOPLEFT", nodeData.indent, -yOffset)
		node:SetPoint("RIGHT", self.treeContent, "RIGHT", 0, 0)
		
		local name = nodeData.frame:GetName() or ("<" .. nodeData.frame:GetObjectType() .. ">")
		node.text:SetText(name)
		
		if nodeData.type == "selected" then
			node.text:SetTextColor(1, 0.8, 0)
			node.bg:Show()
		elseif nodeData.type == "ancestor" then
			node.text:SetTextColor(0.6, 0.6, 0.6)
			node.bg:Hide()
		else
			node.text:SetTextColor(1, 1, 1)
			node.bg:Hide()
		end

		node.frame = nodeData.frame
		node:Show()
		yOffset = yOffset + 20
	end

	self.treeContent:SetHeight(yOffset)
end

function InspectModule:GetOrCreateTreeNode(index)
	if self.treeNodes[index] then return self.treeNodes[index] end

	local node = CreateFrame("Button", nil, self.treeContent)
	node:SetHeight(20)

	local bg = node:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	bg:SetColorTexture(1, 1, 1, 0.1)
	bg:Hide()
	node.bg = bg

	local text = node:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	text:SetPoint("LEFT", 4, 0)
	text:SetJustifyH("LEFT")
	node.text = text

	node:SetScript("OnClick", function(s)
		InspectModule:SetSelectedFrame(s.frame)
	end)

	self.treeNodes[index] = node
	return node
end


-- UI/InspectTree.lua
-- !Mechanic - Inspect Tab: Frame Tree Component (Phase 8)

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local InspectModule = Mechanic.Inspect
local ICON_PATH = [[Interface\AddOns\Mechanic\Assets\Icons\]]

-- Helper: Get a descriptive name for a frame
-- Priority: Global Name > Leaf from FrameResolver path > <ObjectType>
local function GetDescriptiveName(frame)
	if not frame or type(frame) ~= "table" then
		return tostring(frame or "<nil>")
	end

	-- 1. Check for global name first (safe pcall for WoW methods)
	if frame.GetName then
		local ok, name = pcall(frame.GetName, frame)
		if ok and name and type(name) == "string" and name ~= "" then
			return name
		end
	end

	-- 2. Try FrameResolver to get a path, then extract the leaf
	if ns.FrameResolver then
		local path = ns.FrameResolver:GetFramePath(frame)
		if path and type(path) == "string" and path ~= "<anonymous>" then
			-- Extract the leaf (last segment after last dot)
			local leaf = path:match("%.([^%.]+)$") or path
			if leaf and leaf ~= "?" then
				return leaf
			end
		end
	end

	-- 3. Fallback to object type
	if frame.GetObjectType then
		local ok, objType = pcall(frame.GetObjectType, frame)
		if ok and objType then
			return "<" .. objType .. ">"
		end
	end

	return "<table>"
end

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

	if not selectedFrame or type(selectedFrame) ~= "table" then
		return
	end

	local yOffset = 0
	local nodes = {}

	-- 1. Ancestors (Frames only)
	local ancestors = {}
	if selectedFrame.GetParent then
		local okP, current = pcall(selectedFrame.GetParent, selectedFrame)
		while okP and current do
			table.insert(ancestors, 1, current)
			-- Stop at WorldFrame to avoid infinite loops or going into nothingness
			if current == WorldFrame then
				break
			end

			if current.GetParent then
				okP, current = pcall(current.GetParent, current)
			else
				current = nil
			end
		end
	end

	for i, frame in ipairs(ancestors) do
		table.insert(nodes, { frame = frame, indent = (i - 1) * 5, type = "ancestor" })
	end

	-- 2. Selected Frame
	local selectedIdx = #nodes + 1
	table.insert(nodes, { frame = selectedFrame, indent = #ancestors * 5, type = "selected" })

	-- 3. Children (Frames only)
	if selectedFrame.GetChildren then
		local okC, children = pcall(function()
			return { selectedFrame:GetChildren() }
		end)
		if okC and children then
			for _, child in ipairs(children) do
				table.insert(nodes, { frame = child, indent = (#ancestors + 1) * 5, type = "child" })
			end
		end
	end

	-- Render nodes
	for i, nodeData in ipairs(nodes) do
		local node = self:GetOrCreateTreeNode(i)
		node:SetPoint("TOPLEFT", self.treeContent, "TOPLEFT", nodeData.indent, -yOffset)
		node:SetPoint("RIGHT", self.treeContent, "RIGHT", 0, 0)

		local name = GetDescriptiveName(nodeData.frame)
		node.text:SetText(name)

		-- Store the full path for tooltip
		local fullPath = ns.FrameResolver and ns.FrameResolver:GetFramePath(nodeData.frame) or name
		node.fullPath = fullPath

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

		-- Update visibility toggle state
		if node.visBtn and nodeData.frame.IsVisible then
			local ok, isVisible = pcall(nodeData.frame.IsVisible, nodeData.frame)
			if ok then
				node.visBtn:SetTexture(ICON_PATH .. (isVisible and "icon-visibility-on" or "icon-visibility-off"))
				node.visBtn:SetTint(isVisible and "white" or "interactiveDisabled")
			else
				node.visBtn:SetTexture(ICON_PATH .. "icon-visibility-off")
				node.visBtn:SetTint("interactiveDisabled")
			end
		end

		-- Update pin state
		if node.pinBtn then
			local isPinned = InspectModule.pinnedFrame == nodeData.frame
			node.pinBtn:SetActive(isPinned)
		end

		node:Show()
		yOffset = yOffset + 20
	end

	self.treeContent:SetHeight(yOffset)
end

function InspectModule:GetOrCreateTreeNode(index)
	if self.treeNodes[index] then
		return self.treeNodes[index]
	end

	local node = CreateFrame("Button", nil, self.treeContent)
	node:SetHeight(20)

	local bg = node:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	bg:SetColorTexture(1, 1, 1, 0.1)
	bg:Hide()
	node.bg = bg

	-- Pin button (assign to _G.f for console access)
	local pinBtn = FenUI:CreateImageButton(node, {
		texture = ICON_PATH .. "icon-pin",
		size = 16,
		isToggle = true,
		tooltip = function(tt)
			tt:AddLine("Assign to _G.f", 1, 1, 1)
			tt:AddLine("Use /run print(f) in console", 0.7, 0.7, 0.7)
		end,
		onClick = function(s)
			local targetFrame = s:GetParent().frame
			if targetFrame then
				_G.f = targetFrame
				InspectModule.pinnedFrame = targetFrame
				local name = GetDescriptiveName(targetFrame)
				Mechanic:Print("|cff00ff00Pinned:|r _G.f = " .. name)
				-- Refresh tree to update visual state of all pins
				InspectModule:UpdateTree(InspectModule.selectedFrame)
			end
		end,
	})
	pinBtn:SetPoint("RIGHT", -2, 0)
	node.pinBtn = pinBtn

	-- Visibility toggle button (small checkbox-like)
	local visBtn = FenUI:CreateImageButton(node, {
		texture = ICON_PATH .. "icon-visibility-on",
		size = 16,
		tooltip = "Toggle Visibility",
		onClick = function(s)
			local targetFrame = s:GetParent().frame
			if targetFrame then
				local isVisible = false
				if targetFrame.IsVisible then
					local okV, vis = pcall(targetFrame.IsVisible, targetFrame)
					if okV then
						isVisible = vis
					end
				end

				if targetFrame.SetShown then
					pcall(targetFrame.SetShown, targetFrame, not isVisible)
				end
				-- Refresh tree to update all visibility states
				InspectModule:UpdateTree(InspectModule.selectedFrame)
			end
		end,
	})
	visBtn:SetPoint("RIGHT", pinBtn, "LEFT", -2, 0)
	node.visBtn = visBtn

	local text = node:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	text:SetPoint("LEFT", 4, 0)
	text:SetPoint("RIGHT", visBtn, "LEFT", -2, 0)
	text:SetJustifyH("LEFT")
	node.text = text

	node:SetScript("OnClick", function(s)
		InspectModule:SetSelectedFrame(s.frame)
	end)

	node:SetScript("OnEnter", function(s)
		InspectModule:ShowHighlight(s.frame)
		-- Show tooltip with full path and object type
		if s.fullPath or s.frame then
			GameTooltip:SetOwner(s, "ANCHOR_RIGHT")
			GameTooltip:AddLine(s.fullPath or "<anonymous>", 1, 0.82, 0)
			if s.frame and s.frame.GetObjectType then
				local ok, objType = pcall(s.frame.GetObjectType, s.frame)
				if ok then
					GameTooltip:AddLine(objType, 0.7, 0.7, 0.7)
				end
			end
			if s.frame and s.frame.IsVisible then
				local ok, visible = pcall(s.frame.IsVisible, s.frame)
				if ok then
					GameTooltip:AddLine(visible and "Visible" or "Hidden", visible and 0 or 1, visible and 1 or 0, 0)
				end
			end
			GameTooltip:Show()
		end
	end)

	node:SetScript("OnLeave", function(s)
		if InspectModule.selectedFrame then
			InspectModule:ShowHighlight(InspectModule.selectedFrame)
		else
			InspectModule:HideHighlight()
		end
		GameTooltip:Hide()
	end)

	self.treeNodes[index] = node
	return node
end


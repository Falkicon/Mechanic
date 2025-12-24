-- UI/InspectWatch.lua
-- !Mechanic - Inspect Tab: Watch List Component (Phase 8)

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local InspectModule = Mechanic.Inspect

function InspectModule:InitializeWatch(parent)
	local title = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	title:SetPoint("TOPLEFT", 8, -8)
	title:SetText("Watch List")

	local scrollFrame = CreateFrame("ScrollFrame", nil, parent, "UIPanelScrollFrameTemplate")
	scrollFrame:SetPoint("TOPLEFT", 4, -30)
	scrollFrame:SetPoint("BOTTOMRIGHT", -24, 4)
	self.watchScroll = scrollFrame

	local content = CreateFrame("Frame", nil, scrollFrame)
	content:SetWidth(parent:GetWidth() - 28)
	scrollFrame:SetScrollChild(content)
	self.watchContent = content

	self.watchNodes = {}
	
	-- Live Update Timer
	self.watchTimer = 0
	parent:SetScript("OnUpdate", function(_, elapsed)
		InspectModule.watchTimer = InspectModule.watchTimer + elapsed
		if InspectModule.watchTimer > 0.5 then
			InspectModule.watchTimer = 0
			InspectModule:RefreshWatchList()
		end
	end)
end

function InspectModule:RefreshWatchList()
	if not self.watchContent then return end

	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if not MechanicLib then return end

	local watchList = MechanicLib:GetWatchList()
	local sortedKeys = {}
	for key in pairs(watchList) do
		table.insert(sortedKeys, key)
	end
	table.sort(sortedKeys)

	for _, node in ipairs(self.watchNodes) do
		node:Hide()
	end

	local yOffset = 0
	for i, key in ipairs(sortedKeys) do
		local data = watchList[key]
		local node = self:GetOrCreateWatchNode(i)
		node:SetPoint("TOPLEFT", self.watchContent, "TOPLEFT", 0, -yOffset)
		node:SetPoint("RIGHT", self.watchContent, "RIGHT", 0, 0)
		
		node.label:SetText(data.label)
		
		local frame = type(data.target) == "string" and ns.FrameResolver:ResolvePath(data.target) or data.target
		local value = "???"
		if frame then
			if frame.GetValue then
				value = string.format("%.1f", frame:GetValue())
			elseif frame.GetText then
				value = frame:GetText() or "nil"
			elseif frame.IsVisible then
				value = frame:IsVisible() and "Visible" or "Hidden"
			end
		end
		
		node.value:SetText(value)
		node.frame = frame
		node.path = type(data.target) == "string" and data.target or nil
		
		node:Show()
		yOffset = yOffset + 34
	end

	self.watchContent:SetHeight(yOffset)
end

function InspectModule:GetOrCreateWatchNode(index)
	if self.watchNodes[index] then return self.watchNodes[index] end

	local node = CreateFrame("Button", nil, self.watchContent)
	node:SetHeight(32)

	local bg = node:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	bg:SetColorTexture(1, 1, 1, 0.05)
	node.bg = bg

	local label = node:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	label:SetPoint("TOPLEFT", 4, -4)
	label:SetPoint("TOPRIGHT", -4, -4)
	label:SetJustifyH("LEFT")
	node.label = label

	local value = node:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	value:SetPoint("BOTTOMLEFT", 4, 4)
	value:SetPoint("BOTTOMRIGHT", -4, 4)
	value:SetJustifyH("RIGHT")
	node.value = value

	node:SetScript("OnClick", function(s)
		InspectModule:SetSelectedFrame(s.frame, s.path)
	end)

	self.watchNodes[index] = node
	return node
end


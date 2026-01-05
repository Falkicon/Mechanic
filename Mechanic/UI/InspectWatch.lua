-- UI/InspectWatch.lua
-- !Mechanic - Inspect Tab: Watch List Component (Phase 8)

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local InspectModule = Mechanic.Inspect
local ICON_PATH = [[Interface\AddOns\Mechanic\Assets\Icons\]]

function InspectModule:InitializeWatch(parent)
	local title = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	title:SetPoint("TOPLEFT", 8, -12)
	title:SetText(L["Watch List"])

	-- Clear All Button
	local clearAllBtn = FenUI:CreateImageButton(parent, {
		texture = ICON_PATH .. "icon-clear",
		size = 16,
		tooltip = L["Clear Watch List"] or "Clear Watch List",
		onClick = function()
			local MechanicLib = LibStub("MechanicLib-1.0", true)
			if MechanicLib then
				local watchList = MechanicLib:GetWatchList()
				local targets = {}
				for _, data in pairs(watchList) do
					if data.source == "Manual" then
						table.insert(targets, data.target)
					end
				end
				for _, target in ipairs(targets) do
					MechanicLib:RemoveFromWatchList(target)
				end
			end
		end,
	})
	clearAllBtn:SetPoint("TOPRIGHT", -8, -12)
	self.clearAllBtn = clearAllBtn

	-- Watch Button (moved from toolbar to watch list header)
	local watchBtn = FenUI:CreateImageButton(parent, {
		texture = ICON_PATH .. "icon-watch",
		size = 18,
		tooltip = L["+ Watch Current"],
		onClick = function()
			self:WatchCurrent()
		end,
	})
	watchBtn:SetPoint("RIGHT", clearAllBtn, "LEFT", -6, 0)
	self.watchBtn = watchBtn

	local scrollFrame = CreateFrame("ScrollFrame", nil, parent, "UIPanelScrollFrameTemplate")
	scrollFrame:SetPoint("TOPLEFT", 4, -40)
	scrollFrame:SetPoint("BOTTOMRIGHT", -24, 4)
	self.watchScroll = scrollFrame

	local content = CreateFrame("Frame", nil, scrollFrame)
	content:SetWidth(parent:GetWidth() - 28)
	scrollFrame:SetScrollChild(content)
	self.watchContent = content

	self.watchNodes = {}
	for i = 1, 20 do
		self:GetOrCreateWatchNode(i)
	end

	-- Live Update Timer
	self.watchTicker = C_Timer.NewTicker(0.5, function()
		if parent:IsVisible() then
			self:RefreshWatchList()
		end
	end)
end

function InspectModule:RefreshWatchList()
	if not self.watchContent then
		return
	end

	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if not MechanicLib then
		return
	end

	local watchList = MechanicLib:GetWatchList()
	local sortedKeys = {}
	local hasManual = false
	for key, data in pairs(watchList) do
		table.insert(sortedKeys, key)
		if data.source == "Manual" then
			hasManual = true
		end
	end
	table.sort(sortedKeys)

	-- Update Clear All button state
	if self.clearAllBtn then
		if hasManual then
			self.clearAllBtn:Enable()
			self.clearAllBtn:SetAlpha(1.0)
		else
			self.clearAllBtn:Disable()
			self.clearAllBtn:SetAlpha(0.3)
		end
	end

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
		node.label:SetPoint("TOPLEFT", 4, -4)

		-- Show source (Addon or Manual)
		if not node.source then
			node.source = node:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
			node.source:SetTextColor(0.5, 0.5, 0.5)
			node.source:SetJustifyH("LEFT")
		end
		node.source:SetText(data.source or "Manual")

		-- Add unwatch button
		if not node.removeBtn then
			node.removeBtn = FenUI:CreateImageButton(node, {
				texture = ICON_PATH .. "icon-clear",
				size = 10,
				tooltip = L["Remove from Watch List"] or "Remove from Watch List",
				onClick = function()
					local currentWatchList = MechanicLib:GetWatchList()
					local currentData = currentWatchList[key]
					if currentData then
						MechanicLib:RemoveFromWatchList(currentData.target)
					end
				end,
			})
		end

		node.source:ClearAllPoints()
		if data.source == "Manual" then
			node.removeBtn:Show()
			node.removeBtn:ClearAllPoints()
			node.removeBtn:SetPoint("BOTTOMLEFT", 4, 6)
			node.source:SetPoint("LEFT", node.removeBtn, "RIGHT", 4, 0)

			node.removeBtn:SetFrameLevel(node:GetFrameLevel() + 5)
			node.removeBtn.config.onClick = function()
				local currentWatchList = MechanicLib:GetWatchList()
				local currentData = currentWatchList[key]
				if currentData then
					MechanicLib:RemoveFromWatchList(currentData.target)
				end
			end
		else
			node.removeBtn:Hide()
			node.source:SetPoint("BOTTOMLEFT", 4, 4)
		end

		local frame = type(data.target) == "string" and ns.FrameResolver:ResolvePath(data.target) or data.target
		local value = "???"

		-- Helper for consistent value conversion
		local function safeToString(val)
			if val == nil then
				return "nil"
			end
			if issecretvalue and issecretvalue(val) then
				return "[secret]"
			end
			local ok, str = pcall(tostring, val)
			if ok then
				-- Handle numeric formatting for common properties
				if type(val) == "number" then
					return string.format("%.1f", val)
				end
				-- Clean up function addresses
				if type(val) == "function" then
					local addr = str:match(":(%s*0x%x+)") or str:match(":%s*(%x+)") or str:match("(%x+)") or "ptr"
					addr = addr:gsub("%s", ""):gsub("^0x", "")
					if #addr > 8 then
						addr = addr:sub(-8)
					end
					return "[" .. addr .. "]"
				end
				return str
			end
			return "[error]"
		end

		if frame then
			local property = data.property
			if property == "Visibility" then
				value = frame:IsVisible() and "Visible" or "Hidden"
			elseif property == "Text" and frame.GetText then
				value = safeToString(frame:GetText())
			elseif property == "Value" and frame.GetValue then
				value = safeToString(frame:GetValue())
			elseif property == "Width" and frame.GetWidth then
				value = safeToString(frame:GetWidth())
			elseif property == "Height" and frame.GetHeight then
				value = safeToString(frame:GetHeight())
			else
				-- Auto-detection fallback
				if frame.GetValue then
					value = safeToString(frame:GetValue())
				elseif frame.GetText then
					value = safeToString(frame:GetText())
				elseif frame.IsVisible then
					value = frame:IsVisible() and "Visible" or "Hidden"
				end
			end
		end

		node.value:SetText(value)
		node.value:SetPoint("BOTTOMRIGHT", -4, 4)
		-- Ensure value doesn't overlap with label
		node.value:SetWidth(node:GetWidth() - 80) -- Leave room for source
		node.value:SetWordWrap(false)

		node.label:SetWidth(node:GetWidth() - 8)
		node.label:SetWordWrap(false)
		node.frame = frame
		node.path = type(data.target) == "string" and data.target or nil

		node:Show()
		yOffset = yOffset + 34
	end

	self.watchContent:SetHeight(yOffset)
end

function InspectModule:GetOrCreateWatchNode(index)
	if self.watchNodes[index] then
		return self.watchNodes[index]
	end

	local node = CreateFrame("Button", nil, self.watchContent)
	node:SetHeight(32)

	local bg = node:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	bg:SetColorTexture(1, 1, 1, 0.05)
	node.bg = bg

	local label = node:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	label:SetPoint("TOPLEFT", 0, -4)
	label:SetPoint("TOPRIGHT", -4, -4)
	label:SetJustifyH("LEFT")
	node.label = label

	local value = node:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	value:SetTextColor(1, 1, 1) -- Keep it white
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


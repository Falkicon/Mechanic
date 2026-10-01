-- UI/InspectWatch.lua
-- !Mechanic - Inspect Tab: Watch List Component (Phase 8)

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local InspectModule = Mechanic.Inspect
local SafeValue = ns.SafeValue
local ICON_PATH = [[Interface\AddOns\Mechanic\Assets\Icons\]]

local WATCH_TICK_SECONDS = 0.5
local WATCH_NODE_HEIGHT = 32
local WATCH_NODE_STRIDE = 34
local WATCH_PREALLOCATED_NODES = 20
local VALUE_OPTS = { numberFormat = "%.1f" }

-- Reused every tick so polling does not allocate
local sortedKeys = {}

function InspectModule:InitializeWatch(parent)
	local header = self:CreateColumnHeader(parent, L["Watch List"])
	self.watchHeader = header
	self.watchParent = parent

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
	clearAllBtn:SetPoint("RIGHT", header, "RIGHT", -8, 0)
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
	scrollFrame:SetPoint("TOPLEFT", 4, -(self.COLUMN_HEADER_HEIGHT + 4))
	scrollFrame:SetPoint("BOTTOMRIGHT", -24, 4)
	FenUI:SkinScrollFrame(scrollFrame, { offset = 5 })
	self.watchScroll = scrollFrame

	local content = CreateFrame("Frame", nil, scrollFrame)
	content:SetWidth(parent:GetWidth() - 28)
	scrollFrame:SetScrollChild(content)
	self.watchContent = content

	-- Empty state: say how to fill the list instead of showing a blank column
	local empty = parent:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
	empty:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 10, -12)
	empty:SetPoint("TOPRIGHT", header, "BOTTOMRIGHT", -10, -12)
	empty:SetJustifyH("LEFT")
	empty:SetSpacing(3)
	empty:SetTextColor(FenUI:GetColorRGB("textMuted"))
	empty:SetText(L["No watched frames"])
	self.watchEmpty = empty

	self.watchNodes = {}
	for i = 1, WATCH_PREALLOCATED_NODES do
		self:GetOrCreateWatchNode(i)
	end
end

--- Live updates run only while the Inspect tab is shown (started/stopped from OnShow/OnHide).
function InspectModule:StartWatchTicker()
	if not self.watchContent then
		return
	end
	self:RefreshWatchList()
	if self.watchTicker then
		return
	end
	self.watchTicker = C_Timer.NewTicker(WATCH_TICK_SECONDS, function()
		if self.watchParent and self.watchParent:IsVisible() then
			self:RefreshWatchList()
		end
	end)
end

function InspectModule:StopWatchTicker()
	if self.watchTicker then
		self.watchTicker:Cancel()
		self.watchTicker = nil
	end
end

-- Current display value for a watched target
local function readWatchValue(frame, property)
	if type(frame) ~= "table" then
		return "???"
	end

	local function visibility()
		return SafeValue.Get(frame, "IsVisible") and "Visible" or "Hidden"
	end
	local function read(method)
		local ok, value = pcall(frame[method], frame)
		return ok and SafeValue.ToString(value, VALUE_OPTS) or "[error]"
	end

	if property == "Visibility" and frame.IsVisible then
		return visibility()
	elseif property == "Text" and frame.GetText then
		return read("GetText")
	elseif property == "Value" and frame.GetValue then
		return read("GetValue")
	elseif property == "Width" and frame.GetWidth then
		return read("GetWidth")
	elseif property == "Height" and frame.GetHeight then
		return read("GetHeight")
	end

	-- Auto-detection fallback
	if frame.GetValue then
		return read("GetValue")
	elseif frame.GetText then
		return read("GetText")
	elseif frame.IsVisible then
		return visibility()
	end
	return "???"
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
	wipe(sortedKeys)
	local hasManual = false
	for key, data in pairs(watchList) do
		table.insert(sortedKeys, key)
		if data.source == "Manual" then
			hasManual = true
		end
	end
	table.sort(sortedKeys)

	if self.watchEmpty then
		self.watchEmpty:SetShown(#sortedKeys == 0)
	end

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

		node.watchKey = key
		node.label:SetText(data.label)
		node.label:SetPoint("TOPLEFT", 4, -4)

		-- Show source (Addon or Manual)
		if not node.source then
			node.source = node:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
			node.source:SetTextColor(FenUI:GetColorRGB("textMuted"))
			node.source:SetJustifyH("LEFT")
		end
		node.source:SetText(data.source or "Manual")

		-- Add unwatch button (its handler reads the key from the pooled node)
		if not node.removeBtn then
			node.removeBtn = FenUI:CreateImageButton(node, {
				texture = ICON_PATH .. "icon-clear",
				size = 10,
				tooltip = L["Remove from Watch List"] or "Remove from Watch List",
				onClick = function()
					local currentData = MechanicLib:GetWatchList()[node.watchKey]
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
		else
			node.removeBtn:Hide()
			node.source:SetPoint("BOTTOMLEFT", 4, 4)
		end

		local frame = type(data.target) == "string" and ns.FrameResolver:ResolvePath(data.target) or data.target
		node.value:SetText(readWatchValue(frame, data.property))
		node.value:SetPoint("BOTTOMRIGHT", -4, 4)
		-- Ensure value doesn't overlap with label
		node.value:SetWidth(node:GetWidth() - 80) -- Leave room for source
		node.value:SetWordWrap(false)

		node.label:SetWidth(node:GetWidth() - 8)
		node.label:SetWordWrap(false)
		node.frame = frame
		node.path = type(data.target) == "string" and data.target or nil

		node:Show()
		yOffset = yOffset + WATCH_NODE_STRIDE
	end

	self.watchContent:SetHeight(yOffset)
end

function InspectModule:GetOrCreateWatchNode(index)
	if self.watchNodes[index] then
		return self.watchNodes[index]
	end

	local node = CreateFrame("Button", nil, self.watchContent)
	node:SetHeight(WATCH_NODE_HEIGHT)

	local bg = node:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	bg:SetColorTexture(FenUI:GetColor("surfaceControl"))
	node.bg = bg

	local label = node:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
	label:SetTextColor(FenUI:GetColorRGB("textDefault"))
	label:SetPoint("TOPLEFT", 0, -4)
	label:SetPoint("TOPRIGHT", -4, -4)
	label:SetJustifyH("LEFT")
	node.label = label

	local value = node:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
	value:SetTextColor(FenUI:GetColorRGB("textStrong"))
	value:SetPoint("BOTTOMLEFT", 4, 4)
	value:SetPoint("BOTTOMRIGHT", -4, 4)
	value:SetJustifyH("RIGHT")
	node.value = value

	node:SetScript("OnClick", function(s)
		if s.frame then
			InspectModule:SetSelectedFrame(s.frame, s.path)
		end
	end)

	self.watchNodes[index] = node
	return node
end

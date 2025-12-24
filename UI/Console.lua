-- UI/Console.lua
-- !Mechanic - Console Module

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local Console = {}
Mechanic.Console = Console

-- Category color constants per Phase 5 spec
local CATEGORY_COLORS = {
	["[Secret]"] = "|cffaa00ff", -- Purple - critical for Midnight
	["[Trigger]"] = "|cff00ccff", -- Cyan - action initiation
	["[Event]"] = "|cff88ff88", -- Light green - system events
	["[Validation]"] = "|cffffff00", -- Yellow - test validation
	["[Perf]"] = "|cffff8800", -- Orange - performance warnings
	["[Core]"] = "|cff8888ff", -- Light blue - core lifecycle
	["[Region]"] = "|cffaaaaaa", -- Grey - UI/Region updates
	["[API]"] = "|cff00ffcc", -- Teal - API calls
	["[Cooldown]"] = "|cffffcc00", -- Yellow-orange - Cooldowns
	["[Load]"] = "|cffccff00", -- Lime - Load conditions
	["[Error]"] = "|cffff4444", -- Soft red - captured errors
}
local DEFAULT_CATEGORY_COLOR = "|cffffffff"

Console.buffer = {} -- { {source, category, message, time}, ... }
Console.paused = false
Console.filters = {
	source = "All",
	category = "All",
	search = "",
}

function Console:Initialize(parent)
	if self.frame then
		return
	end

	local frame = CreateFrame("Frame", nil, parent)
	frame:SetAllPoints()
	self.frame = frame

	-- Create split nav layout
	local SplitNavLayout = ns.SplitNavLayout
	self.layout = SplitNavLayout:Create(frame, {
		navWidth = 160,
		onSelect = function(key)
			self:OnSourceSelected(key)
		end,
		defaultKey = "all",
	})

	-- Everything else goes into layout.contentArea
	local contentArea = self.layout.contentArea

	-- Filter Bar
	local filterBar = FenUI:CreateLayout(contentArea, {
		height = 30,
		background = "surfaceElevated",
	})
	filterBar:SetPoint("TOPLEFT", 0, 0)
	filterBar:SetPoint("TOPRIGHT", 0, 0)
	self.filterBar = filterBar

	-- Search Box
	local searchBox = CreateFrame("EditBox", nil, filterBar, "SearchBoxTemplate")
	searchBox:SetSize(200, 20)
	searchBox:SetPoint("LEFT", 8, 0)
	searchBox:SetAutoFocus(false)
	searchBox:SetScript("OnTextChanged", function(eb)
		self.filters.search = eb:GetText():lower()
		self:Refresh()
	end)
	self.searchBox = searchBox

	-- Main Display (MultiLineEditBox)
	local logDisplay = FenUI:CreateMultiLineEditBox(contentArea, {
		readOnly = true,
		background = "surfaceInset",
	})
	logDisplay:SetPoint("TOPLEFT", filterBar, "BOTTOMLEFT", 0, -4)
	logDisplay:SetPoint("BOTTOMRIGHT", 0, 34) -- Leave space for toolbar
	self.logDisplay = logDisplay

	-- Refresh on show
	frame:SetScript("OnShow", function()
		self:RefreshSourceList()
		self:Refresh()
	end)

	-- Toolbar
	local toolbar = FenUI:CreateToolbar(contentArea, {
		height = 30,
	})
	toolbar:SetPoint("BOTTOMLEFT", 0, 0)
	toolbar:SetPoint("BOTTOMRIGHT", 0, 0)
	self.toolbar = toolbar

	-- Clear Button
	toolbar:AddButton({
		text = "Clear",
		onClick = function()
			self:Clear()
		end,
	})

	-- Dedup All Button
	toolbar:AddButton({
		text = "Dedup All",
		onClick = function()
			self:SetDedupMode("all")
		end,
	})

	-- Dedup Adjacent Button
	toolbar:AddButton({
		text = "Dedup Adj",
		onClick = function()
			self:SetDedupMode("adjacent")
		end,
	})

	-- Pause Button
	self.pauseBtn = toolbar:AddButton({
		text = "Pause",
		onClick = function()
			self:TogglePause()
		end,
	})

	-- Line Count Label
	self.lineCount = toolbar:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	self.lineCount:SetPoint("RIGHT", -8, 0)
	self.lineCount:SetText("Lines: 0")
end

function Console:RefreshSourceList()
	local items = {
		{ key = "all", text = string.format("All (%d)", #self.buffer) },
	}

	-- Count entries per source
	local sourceCounts = {}
	for _, entry in ipairs(self.buffer) do
		sourceCounts[entry.source] = (sourceCounts[entry.source] or 0) + 1
	end

	-- Add registered addons
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib then
		local registered = MechanicLib:GetRegistered()
		local sortedNames = {}
		for name in pairs(registered) do
			table.insert(sortedNames, name)
		end
		table.sort(sortedNames)

		for _, addonName in ipairs(sortedNames) do
			local count = sourceCounts[addonName] or 0
			table.insert(items, {
				key = addonName,
				text = string.format("%s (%d)", addonName, count),
			})
		end
	end

	-- Add "System" for internal logs if it has entries and isn't a registered addon
	if sourceCounts["System"] then
		local isRegistered = MechanicLib and MechanicLib:GetRegistered()["System"]
		if not isRegistered then
			table.insert(items, {
				key = "System",
				text = string.format("System (%d)", sourceCounts["System"]),
			})
		end
	end

	if self.layout then
		self.layout:SetItems(items)
	end
end

function Console:OnSourceSelected(key)
	self.filters.source = key == "all" and "All" or key
	self:Refresh()
end

function Console:OnLog(addonName, message, category)
	table.insert(self.buffer, {
		source = addonName,
		category = category or "",
		message = message,
		time = time(),
	})

	-- Enforce buffer limit
	local maxLimit = Mechanic.db.profile.bufferSize or 1000
	if #self.buffer > maxLimit then
		table.remove(self.buffer, 1)
	end

	if not self.paused then
		if self.frame and self.frame:IsVisible() then
			self:RefreshSourceList()
		end
		self:Refresh()
	end
end

function Console:Refresh()
	if self.refreshPending then
		return
	end
	self.refreshPending = true

	C_Timer.After(0.1, function()
		self.refreshPending = false
		if not self.frame or not self.frame:IsVisible() then
			return
		end

		local filtered = self:ApplyFilters()
		local text = self:FormatEntries(filtered)
		if self.logDisplay then
			self.logDisplay:SetText(text)
		end
		if self.lineCount then
			self.lineCount:SetText("Lines: " .. #filtered)
		end
	end)
end

function Console:ApplyFilters()
	local filtered = {}
	local search = self.filters.search

	for _, entry in ipairs(self.buffer) do
		local match = true

		-- Source filter
		if self.filters.source ~= "All" and entry.source ~= self.filters.source then
			match = false
		end

		-- Category filter
		if match and self.filters.category ~= "All" and entry.category ~= self.filters.category then
			match = false
		end

		-- Search filter
		if match and search ~= "" then
			if
				not entry.message:lower():find(search, 1, true)
				and not entry.source:lower():find(search, 1, true)
				and not (entry.category or ""):lower():find(search, 1, true)
			then
				match = false
			end
		end

		if match then
			table.insert(filtered, entry)
		end
	end

	-- Apply Dedup
	if self.dedupMode == "all" then
		filtered = self:DedupAll(filtered)
	elseif self.dedupMode == "adjacent" then
		filtered = self:DedupAdjacent(filtered)
	end

	return filtered
end

function Console:FormatEntries(entries, stripColors)
	local lines = {}
	local showTimestamps = Mechanic.db.profile.showTimestamps
	for _, entry in ipairs(entries) do
		local timestamp = ""
		if showTimestamps then
			timestamp = date("[%H:%M:%S] ", entry.time)
		end

		local category = ""
		if entry.category ~= "" then
			if stripColors then
				category = string.format(" %s", entry.category)
			else
				local color = CATEGORY_COLORS[entry.category] or DEFAULT_CATEGORY_COLOR
				category = string.format(" %s%s|r", color, entry.category)
			end
		end

		local count = ""
		if entry.count and entry.count > 1 then
			count = string.format(" (x%d)", entry.count)
		end

		table.insert(lines, string.format("%s[%s]%s %s%s", timestamp, entry.source, category, entry.message, count))
	end
	return table.concat(lines, "\n")
end

function Console:DedupAll(entries)
	local deduped = {}
	local seen = {} -- key -> index in deduped
	local keyParts = {}

	for _, entry in ipairs(entries) do
		wipe(keyParts)
		table.insert(keyParts, entry.source)
		table.insert(keyParts, entry.category or "")
		table.insert(keyParts, entry.message)
		local key = table.concat(keyParts)

		if seen[key] then
			local idx = seen[key]
			deduped[idx].count = (deduped[idx].count or 1) + 1
			deduped[idx].time = entry.time -- Update time to latest
		else
			local newEntry = {}
			for k, v in pairs(entry) do
				newEntry[k] = v
			end
			newEntry.count = 1
			table.insert(deduped, newEntry)
			seen[key] = #deduped
		end
	end
	return deduped
end

function Console:DedupAdjacent(entries)
	local deduped = {}
	local lastEntry = nil
	local keyParts = {}

	for _, entry in ipairs(entries) do
		wipe(keyParts)
		table.insert(keyParts, entry.source)
		table.insert(keyParts, entry.category or "")
		table.insert(keyParts, entry.message)
		local key = table.concat(keyParts)

		local lastKey = nil
		if lastEntry then
			wipe(keyParts)
			table.insert(keyParts, lastEntry.source)
			table.insert(keyParts, lastEntry.category or "")
			table.insert(keyParts, lastEntry.message)
			lastKey = table.concat(keyParts)
		end

		if lastEntry and lastKey == key then
			lastEntry.count = (lastEntry.count or 1) + 1
			lastEntry.time = entry.time
		else
			local newEntry = {}
			for k, v in pairs(entry) do
				newEntry[k] = v
			end
			newEntry.count = 1
			table.insert(deduped, newEntry)
			lastEntry = newEntry
		end
	end
	return deduped
end

function Console:TogglePause()
	self.paused = not self.paused
	if self.pauseBtn then
		self.pauseBtn:SetText(self.paused and "Resume" or "Pause")
	end
	if not self.paused then
		self:Refresh()
	end
end

function Console:Clear()
	wipe(self.buffer)
	self:Refresh()
end

function Console:SetDedupMode(mode)
	if self.dedupMode == mode then
		self.dedupMode = nil
	else
		self.dedupMode = mode
	end
	self:Refresh()
end

function Console:GetCopyText(includeHeader)
	local lines = {}
	if includeHeader then
		local header = Mechanic:GetEnvironmentHeader()
		if header then
			table.insert(lines, header)
			table.insert(lines, "---")
		end
	end

	local filtered = self:ApplyFilters()
	table.insert(lines, self:FormatEntries(filtered, true))

	return table.concat(lines, "\n")
end

-- Initialize the console when called from Core
function Mechanic:InitializeConsole()
	if not self.frame then
		self:CreateMainFrame()
	end
	self.Console:Initialize(self.frame.moduleContent)
end

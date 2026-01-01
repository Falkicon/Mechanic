-- UI/Console.lua
-- !Mechanic - Console Module
--
-- Aggregated debug output from all registered addons.

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local Console = {}
Mechanic.Console = Console
local ICON_PATH = [[Interface\AddOns\!Mechanic\Assets\Icons\]]

local CATEGORY_COLORS = Mechanic.Utils.Colors.Categories
local DEFAULT_CATEGORY_COLOR = Mechanic.Utils.Colors.Status.default

Console.buffer = {} -- { {source, category, message, time}, ... }
Console.head = 1
Console.count = 0
Console.paused = false
Console.filters = {
	source = "all",
	category = "all",
	search = "",
}
Console.selectedSource = "all"
Console.navDirty = true

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
		items = self:GetSourceList(),
		storageKey = "console",
		onSelect = function(key)
			self:OnSourceSelected(key)
		end,
		defaultKey = "all",
	})

	-- Everything else goes into layout.contentArea
	local contentArea = self.layout.contentArea

	-- Toolbar
	local toolbar = FenUI:CreateToolbar(contentArea, {
		height = 32,
		padding = 4,
	})
	toolbar:SetPoint("TOPLEFT", 0, 0)
	toolbar:SetPoint("TOPRIGHT", 0, 0)
	self.toolbar = toolbar

	-- Filter Bar
	local filterBar = FenUI:CreateLayout(contentArea, {
		height = 30,
		background = "surfaceElevated",
	})
	filterBar:SetPoint("TOPLEFT", toolbar, "BOTTOMLEFT", 0, -4)
	filterBar:SetPoint("TOPRIGHT", toolbar, "BOTTOMRIGHT", 0, -4)
	self.filterBar = filterBar

	-- Search Box
	local searchBox = FenUI:CreateInput(filterBar, {
		placeholder = L["Search"],
	})
	searchBox:SetSize(200, 24)
	searchBox:SetPoint("LEFT", 8, 0)
	searchBox.editBox:SetScript("OnTextChanged", function(eb)
		self.filters.search = eb:GetText():lower()
		self:Refresh()
	end)
	self.searchBox = searchBox

	-- Line Count Label
	self.lineCount = filterBar:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	self.lineCount:SetPoint("RIGHT", -12, 0)
	self.lineCount:SetTextColor(FenUI:GetColorRGB("textMuted"))
	self.lineCount:SetText((L["Lines: %d"] or "Lines: %d"):format(0):gsub("(%d+)", "|cffffffff%1|r"))

	-- Main Display (MultiLineEditBox)
	local logDisplay = FenUI:CreateMultiLineEditBox(contentArea, {
		readOnly = true,
		background = "surfaceInset",
		font = "fontMono",
	})
	logDisplay:SetPoint("TOPLEFT", filterBar, "BOTTOMLEFT", 0, -4)
	logDisplay:SetPoint("BOTTOMRIGHT", 0, 0)
	self.logDisplay = logDisplay

	-- Clear Button
	toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-clear",
		size = 24,
		tooltip = L["Clear"],
		onClick = function()
			self:Clear()
		end,
	})

	-- Dedup All Button
	self.dedupAllBtn = toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-dedup-all",
		size = 24,
		isToggle = true,
		tooltip = L["Dedup All"],
		onClick = function()
			self:SetDedupMode("all")
		end,
	})

	-- Dedup Adjacent Button
	self.dedupAdjBtn = toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-dedup-adjacent",
		size = 24,
		isToggle = true,
		tooltip = L["Dedup Adjacent"],
		onClick = function()
			self:SetDedupMode("adjacent")
		end,
	})

	-- Pause Button
	self.pauseBtn = toolbar:AddImageButton({
		texture = ICON_PATH .. (Console.paused and "icon-play" or "icon-pause"),
		size = 24,
		isToggle = true,
		active = self.paused,
		tooltip = function(tt)
			tt:SetText(self.paused and L["Resume"] or L["Pause"])
		end,
		onClick = function()
			self:TogglePause()
		end,
	})

	toolbar:AddSpacer("flex")

	-- Export Button
	toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-export",
		size = 24,
		tooltip = L["Export Button"],
		onClick = function()
			self:Export()
		end,
	})

	-- Help Button
	toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-help",
		size = 24,
		tooltip = L["Help"],
		onClick = function()
			Mechanic.Utils:ShowHelpDialog("console")
		end,
	})

	-- Manually trigger initial selection now that ALL UI elements are created
	local initialKey = self.layout:GetSelectedKey()
	if initialKey then
		self:OnSourceSelected(initialKey)
	end
end

function Console:OnShow()
	if self.navDirty then
		self:RefreshSourceList()
	end
	self:Refresh()
end

function Console:OnHide()
	-- Intentionally empty: Console continues to buffer logs while hidden.
	-- No cleanup needed as refresh is gated by visibility check.
end

function Console:IterateBuffer(callback)
	local maxLimit = Mechanic.db.profile.bufferSize or 1000
	if self.count == 0 then
		return
	end

	local start = self.head - self.count
	if start < 1 then
		start = start + maxLimit
	end

	for i = 0, self.count - 1 do
		local idx = ((start + i - 1) % maxLimit) + 1
		local entry = self.buffer[idx]
		if entry then
			callback(entry)
		end
	end
end

function Console:GetSourceList()
	local items = {
		{ key = "all", text = string.format("%s (%d)", L["All"] or "All", self.count or 0) },
	}

	-- Count entries per source
	local sourceCounts = {}
	self:IterateBuffer(function(entry)
		sourceCounts[entry.source] = (sourceCounts[entry.source] or 0) + 1
	end)

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
				text = string.format("%s (%d)", tostring(addonName or "Unknown"), count or 0),
			})
		end
	end

	-- Add "System" for internal logs if it has entries and isn't a registered addon
	if sourceCounts["System"] then
		local isRegistered = MechanicLib and MechanicLib:HasCapability("System", "performance") -- Just a check for existence
		if not isRegistered then
			table.insert(items, {
				key = "System",
				text = string.format("%s (%d)", L["System"] or "System", sourceCounts["System"] or 0),
			})
		end
	end

	return items
end

function Console:RefreshSourceList()
	if self.layout then
		self.layout:SetItems(self:GetSourceList())
		self.navDirty = false
	end
end

function Console:OnSourceSelected(key)
	-- Guard: layout might not be assigned yet during initialization
	if not self.layout then
		return
	end

	self.selectedSource = key
	self.filters.source = key
	self:Refresh()
end

function Console:OnLog(source, message, category)
	if self.paused then
		return
	end

	local maxLimit = Mechanic.db.profile.bufferSize or 1000

	-- Circular buffer logic
	self.buffer[self.head] = {
		source = source,
		message = message,
		category = category or "",
		time = GetTime(),
	}

	self.head = (self.head % maxLimit) + 1
	if self.count < maxLimit then
		self.count = self.count + 1
	end

	-- Mark nav as dirty to refresh source list on next show
	self.navDirty = true

	-- Only refresh display if visible
	if self.frame and self.frame:IsVisible() then
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
			local countText = string.format(L["Lines: %d"] or "Lines: %d", #filtered)
			-- Colorize the number part to white to match footer values
			countText = countText:gsub("(%d+)", "|cffffffff%1|r")
			self.lineCount:SetText(countText)
		end
	end)
end

function Console:ApplyFilters()
	local filtered = {}
	local search = self.filters.search

	self:IterateBuffer(function(entry)
		local match = true

		-- Source filter
		if self.filters.source ~= "all" and entry.source ~= self.filters.source then
			match = false
		end

		-- Category filter
		if match and self.filters.category ~= "all" and entry.category ~= self.filters.category then
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
	end)

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
				category = string.format(" %s", tostring(entry.category or ""))
			else
				local color = CATEGORY_COLORS[entry.category] or DEFAULT_CATEGORY_COLOR
				category = string.format(" %s%s|r", tostring(color or "|cffffffff"), tostring(entry.category or ""))
			end
		end

		local count = ""
		if entry.count and entry.count > 1 then
			count = string.format(" (x%d)", entry.count or 1)
		end

		table.insert(
			lines,
			string.format(
				"%s[%s]%s %s%s",
				tostring(timestamp or ""),
				tostring(entry.source or "Unknown"),
				tostring(category or ""),
				tostring(entry.message or ""),
				tostring(count or "")
			)
		)
	end
	return table.concat(lines, "\n")
end

function Console:DedupAll(entries)
	local seen = {}
	local deduped = {}
	for _, entry in ipairs(entries) do
		local key = entry.source .. (entry.category or "") .. entry.message
		if not seen[key] then
			seen[key] = true
			table.insert(deduped, entry)
		end
	end
	return deduped
end

function Console:DedupAdjacent(entries)
	local deduped = {}
	local lastEntry = nil
	for _, entry in ipairs(entries) do
		if
			lastEntry
			and lastEntry.source == entry.source
			and lastEntry.category == entry.category
			and lastEntry.message == entry.message
		then
			lastEntry.count = (lastEntry.count or 1) + 1
		else
			entry.count = 1
			table.insert(deduped, entry)
			lastEntry = entry
		end
	end
	return deduped
end

function Console:TogglePause()
	self.paused = not self.paused
	if self.pauseBtn then
		self.pauseBtn:SetActive(self.paused)
		self.pauseBtn:SetTexture(ICON_PATH .. (self.paused and "icon-play" or "icon-pause"))
	end
	if not self.paused then
		self:Refresh()
	end
end

function Console:Clear()
	wipe(self.buffer)
	self.head = 1
	self.count = 0
	self:Refresh()
	self:RefreshSourceList()
end

function Console:Export()
	local navName = self.selectedSource or "all"
	if navName == "all" then
		navName = L["All"] or "All"
	end

	local title = string.format(
		"%s : %s : %s",
		tostring(L["Console"] or "Console"),
		tostring(navName or "All"),
		tostring(L["Export"] or "Export")
	)
	local text = self:GetCopyText(Mechanic.db.profile.includeEnvHeader)
	Mechanic.Utils:ShowExportDialog(title, text)
end

function Console:SetDedupMode(mode)
	if self.dedupMode == mode then
		self.dedupMode = nil
	else
		self.dedupMode = mode
	end

	-- Update toggle states
	if self.dedupAllBtn then
		self.dedupAllBtn:SetActive(self.dedupMode == "all")
	end
	if self.dedupAdjBtn then
		self.dedupAdjBtn:SetActive(self.dedupMode == "adjacent")
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

function Console:OnEnable()
	if self.enabled then
		return
	end

	self.enabled = true
end

function Console:OnDisable()
	self.enabled = false
end

-- Initialize the console when called from Core
function Mechanic:InitializeConsole()
	if not self.frame then
		self:CreateMainFrame()
	end
	self.Console:Initialize(self.frame.moduleContent)
end

--------------------------------------------------------------------------------
-- Console Persistence (AFD - for Mechanic Desktop)
--------------------------------------------------------------------------------

--- Persist console buffer to SavedVariables for desktop agent access.
--- Called on PLAYER_LOGOUT. Desktop can then parse MechanicDB.lua.
function Console:PersistBuffer()
	local maxEntries = Mechanic.db.profile.consoleBufferMax or 100
	local entries = {}

	-- Extract last N entries from ring buffer in chronological order
	local count = math.min(self.count, maxEntries)
	local maxLimit = Mechanic.db.profile.bufferSize or 1000

	-- Calculate starting position (oldest entry we want to save)
	local start = self.head - count
	if start < 1 then
		start = start + maxLimit
	end

	for i = 0, count - 1 do
		local idx = ((start + i - 1) % maxLimit) + 1
		local entry = self.buffer[idx]
		if entry then
			table.insert(entries, {
				source = entry.source,
				category = entry.category,
				message = entry.message,
				time = entry.time,
			})
		end
	end

	Mechanic.db.profile.consoleBuffer = entries
end

--- Restore console buffer from SavedVariables on load.
--- Called during OnEnable to recover previous session's logs.
function Console:RestoreBuffer()
	local saved = Mechanic.db.profile.consoleBuffer
	if not saved or #saved == 0 then
		return
	end

	local maxLimit = Mechanic.db.profile.bufferSize or 1000

	for _, entry in ipairs(saved) do
		-- Add to ring buffer without triggering UI refresh
		self.buffer[self.head] = {
			source = entry.source,
			category = entry.category,
			message = entry.message,
			time = entry.time,
		}
		self.head = (self.head % maxLimit) + 1
		if self.count < maxLimit then
			self.count = self.count + 1
		end
	end

	-- Mark nav as dirty to refresh on next show
	self.navDirty = true
end

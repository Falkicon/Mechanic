-- UI/Performance.lua
-- !Mechanic - Performance Tab Module (Phase 3)
--
-- Provides memory/CPU metrics per addon, extended metrics (FPS, latency),
-- and optional event frequency tracking.

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale("!Mechanic", true) or {}
local PerformanceModule = {}
Mechanic.Perf = PerformanceModule

PerformanceModule.autoRefresh = true
PerformanceModule.refreshTimer = nil
PerformanceModule.trackingStart = nil
PerformanceModule.eventCounts = {}
PerformanceModule.sortColumn = "memory"
PerformanceModule.sortDesc = true
PerformanceModule.visible = false
PerformanceModule.exportMode = false

-- Column definitions for addon list
local COLUMNS = {
	{ key = "name", label = "Addon", width = 180 },
	{ key = "memory", label = "Memory", width = 80 },
	{ key = "memoryPercent", label = "%", width = 50 },
	{ key = "cpu", label = "CPU ms/s", width = 80 },
	{ key = "cpuPercent", label = "%", width = 50 },
}

--------------------------------------------------------------------------------
-- Initialization
--------------------------------------------------------------------------------

function Mechanic:InitializePerformance()
	if PerformanceModule.frame then
		return
	end

	local parent = self.frame.moduleContent
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetAllPoints()
	PerformanceModule.frame = frame

	-- Create split nav layout
	local SplitNavLayout = ns.SplitNavLayout
	PerformanceModule.layout = SplitNavLayout:Create(frame, {
		navWidth = 180,
		onSelect = function(key)
			PerformanceModule:OnNavSelected(key)
		end,
		defaultKey = "general",
	})

	-- Everything else goes into layout.contentArea or specific content frames
	local contentArea = PerformanceModule.layout.contentArea
	local generalFrame = PerformanceModule.layout:GetContentFrame("general")

	-- Toolbar (shared, in contentArea)
	local toolbar = FenUI:CreateToolbar(contentArea, {
		height = 32,
		padding = 4,
	})
	toolbar:SetPoint("TOPLEFT", 0, 0)
	toolbar:SetPoint("TOPRIGHT", 0, 0)
	PerformanceModule.toolbar = toolbar

	-- Auto-Refresh Toggle
	local autoRefreshBtn = toolbar:AddButton({
		text = "▶ Auto-Refresh: ON",
		width = 140,
		onClick = function()
			PerformanceModule:ToggleAutoRefresh()
		end,
	})
	PerformanceModule.autoRefreshButton = autoRefreshBtn

	-- Reset Stats
	local resetBtn = toolbar:AddButton({
		text = "Reset Stats",
		width = 90,
		onClick = function()
			PerformanceModule:ResetStats()
		end,
	})

	-- CPU Profiling Toggle
	local cpuBtn = toolbar:AddButton({
		text = "CPU Profiling: OFF",
		width = 130,
		onClick = function()
			PerformanceModule:ToggleCPUProfiling()
		end,
	})
	PerformanceModule.cpuButton = cpuBtn

	toolbar:AddSpacer("flex")

	-- Export Button
	local exportBtn = toolbar:AddButton({
		text = "Export",
		width = 70,
		onClick = function()
			PerformanceModule:ToggleExportMode()
		end,
	})
	PerformanceModule.exportButton = exportBtn

	-- --- General View UI ---

	-- Extended Metrics Row
	local metricsRow = CreateFrame("Frame", nil, generalFrame)
	metricsRow:SetHeight(28)
	metricsRow:SetPoint("TOPLEFT", toolbar, "BOTTOMLEFT", 0, -4)
	metricsRow:SetPoint("TOPRIGHT", toolbar, "BOTTOMRIGHT", 0, -4)

	local fpsLabel = metricsRow:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	fpsLabel:SetPoint("LEFT", 8, 0)
	fpsLabel:SetText("FPS: --")
	PerformanceModule.fpsLabel = fpsLabel

	local latencyLabel = metricsRow:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	latencyLabel:SetPoint("LEFT", fpsLabel, "RIGHT", 32, 0)
	latencyLabel:SetText("Latency: --ms / --ms")
	PerformanceModule.latencyLabel = latencyLabel

	local memoryLabel = metricsRow:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	memoryLabel:SetPoint("LEFT", latencyLabel, "RIGHT", 32, 0)
	memoryLabel:SetText("Lua Memory: -- MB")
	PerformanceModule.memoryLabel = memoryLabel

	-- Footer bar
	local footerBar = CreateFrame("Frame", nil, generalFrame)
	footerBar:SetHeight(24)
	footerBar:SetPoint("BOTTOMLEFT", 0, 0)
	footerBar:SetPoint("BOTTOMRIGHT", 0, 0)

	local footerLabel = footerBar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	footerLabel:SetPoint("LEFT", 8, 0)
	footerLabel:SetText("Tracking: 0m 0s | Total Memory: 0 KB")
	PerformanceModule.footerLabel = footerLabel

	-- Header row for addon list
	local headerRow = CreateFrame("Frame", nil, generalFrame)
	headerRow:SetHeight(24)
	headerRow:SetPoint("TOPLEFT", metricsRow, "BOTTOMLEFT", 0, -4)
	headerRow:SetPoint("TOPRIGHT", metricsRow, "BOTTOMRIGHT", 0, -4)
	PerformanceModule:CreateHeaderRow(headerRow)
	PerformanceModule.headerRow = headerRow

	-- Addon list (scrollable)
	local scrollFrame = CreateFrame("ScrollFrame", nil, generalFrame, "UIPanelScrollFrameTemplate")
	scrollFrame:SetPoint("TOPLEFT", headerRow, "BOTTOMLEFT", 0, -2)
	scrollFrame:SetPoint("BOTTOMRIGHT", footerBar, "TOPRIGHT", -24, 4)

	local listContent = CreateFrame("Frame", nil, scrollFrame)
	listContent:SetSize(1, 1)
	scrollFrame:SetScrollChild(listContent)
	PerformanceModule.listContent = listContent
	PerformanceModule.scrollFrame = scrollFrame

	-- Pre-create row pool
	PerformanceModule.rowPool = {}

	-- Store references to table UI for export toggle
	PerformanceModule.metricsRow = metricsRow
	PerformanceModule.headerRowFrame = headerRow
	PerformanceModule.footerBarFrame = footerBar

	-- Export Mode: Full-tab text display (hidden by default)
	-- This should probably be in contentArea so it covers everything
	local exportBox = FenUI:CreateMultiLineEditBox(contentArea, {
		readOnly = true,
		background = "surfaceInset",
		autoScroll = false,
	})
	exportBox:SetPoint("TOPLEFT", toolbar, "BOTTOMLEFT", 0, -4)
	exportBox:SetPoint("BOTTOMRIGHT", 0, 0)
	exportBox:Hide()
	PerformanceModule.exportBox = exportBox

	-- Initialize state
	PerformanceModule.trackingStart = GetTime()
	PerformanceModule:UpdateCPUButtonState()

	-- Start auto-refresh if enabled
	if Mechanic.db.profile.autoRefresh then
		PerformanceModule.autoRefresh = true
	end

	frame:SetScript("OnShow", function()
		PerformanceModule:RefreshNavItems()
		PerformanceModule:OnShow()
	end)
end

function PerformanceModule:RefreshNavItems()
	local items = {
		{ key = "general", text = "General" },
	}

	-- Add addons with performance capability
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib then
		local registered = MechanicLib:GetRegistered()
		local sortedNames = {}
		for name in pairs(registered) do
			table.insert(sortedNames, name)
		end
		table.sort(sortedNames)

		for _, addonName in ipairs(sortedNames) do
			local capabilities = registered[addonName]
			if capabilities.performance and capabilities.performance.getSubMetrics then
				table.insert(items, {
					key = addonName,
					text = addonName,
				})
			end
		end
	end

	self.layout:SetItems(items)
end

function PerformanceModule:OnNavSelected(key)
	self.selectedNav = key

	if key == "general" then
		self:Refresh()
	else
		self:ShowAddonMetrics(key)
	end
end

function PerformanceModule:ShowAddonMetrics(addonName)
	local contentFrame = self.layout:GetContentFrame(addonName)

	-- Get sub-metrics from addon
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	local capabilities = MechanicLib and MechanicLib:GetRegistered()[addonName]
	if not capabilities or not capabilities.performance then
		return
	end

	local ok, subMetrics = pcall(capabilities.performance.getSubMetrics)
	if not ok or not subMetrics then
		return
	end

	-- Render sub-metrics table
	self:RenderSubMetrics(contentFrame, addonName, subMetrics)
end

function PerformanceModule:RenderSubMetrics(parent, addonName, metrics)
	-- Clear previous content
	for _, child in ipairs({ parent:GetChildren() }) do
		child:Hide()
	end

	-- Header
	local header = parent.header
	if not header then
		header = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
		header:SetPoint("TOPLEFT", 8, -40) -- Below toolbar area
		parent.header = header
	end
	header:SetText(string.format("%s - Performance Breakdown", addonName))
	header:Show()

	-- Metrics table
	local yOffset = -72
	local totalMs = 0

	-- Calculate total for percentages
	for _, metric in ipairs(metrics) do
		totalMs = totalMs + (metric.msPerSec or 0)
	end

	for i, metric in ipairs(metrics) do
		local row = self:GetOrCreateMetricRow(parent, i)
		row:SetPoint("TOPLEFT", 8, yOffset)
		row:SetPoint("RIGHT", -8, 0)

		row.nameLabel:SetText(metric.name)
		row.valueLabel:SetText(string.format("%.2f ms/s", metric.msPerSec or 0))

		local pct = totalMs > 0 and ((metric.msPerSec or 0) / totalMs * 100) or 0
		row.pctLabel:SetText(string.format("%.1f%%", pct))

		if metric.description then
			row.descLabel:SetText(string.format("|cff888888%s|r", metric.description))
		else
			row.descLabel:SetText("")
		end

		row:Show()
		yOffset = yOffset - 24
	end

	-- Hide remaining rows in pool for this parent if any
	if parent.metricRows then
		for i = #metrics + 1, #parent.metricRows do
			parent.metricRows[i]:Hide()
		end
	end

	-- Total row
	local totalRow = parent.totalRow
	if not totalRow then
		totalRow = CreateFrame("Frame", nil, parent)
		totalRow:SetHeight(24)

		local sep = totalRow:CreateTexture(nil, "BACKGROUND")
		sep:SetPoint("TOPLEFT", 0, -2)
		sep:SetPoint("TOPRIGHT", 0, -2)
		sep:SetHeight(1)
		sep:SetColorTexture(1, 1, 1, 0.2)

		local label = totalRow:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
		label:SetPoint("LEFT", 0, 0)
		label:SetText("Total:")
		totalRow.label = label

		local value = totalRow:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
		value:SetPoint("LEFT", 150, 0)
		totalRow.value = value

		parent.totalRow = totalRow
	end

	totalRow:SetPoint("TOPLEFT", 8, yOffset - 8)
	totalRow:SetPoint("RIGHT", -8, 0)
	totalRow.value:SetText(string.format("%.2f ms/s", totalMs))
	totalRow:Show()
end

function PerformanceModule:GetOrCreateMetricRow(parent, index)
	parent.metricRows = parent.metricRows or {}

	if parent.metricRows[index] then
		return parent.metricRows[index]
	end

	local row = CreateFrame("Frame", nil, parent)
	row:SetHeight(22)

	local nameLabel = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	nameLabel:SetPoint("LEFT", 0, 0)
	nameLabel:SetWidth(140)
	nameLabel:SetJustifyH("LEFT")
	row.nameLabel = nameLabel

	local valueLabel = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	valueLabel:SetPoint("LEFT", 150, 0)
	valueLabel:SetWidth(80)
	valueLabel:SetJustifyH("RIGHT")
	row.valueLabel = valueLabel

	local pctLabel = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	pctLabel:SetPoint("LEFT", 240, 0)
	pctLabel:SetWidth(50)
	pctLabel:SetJustifyH("RIGHT")
	row.pctLabel = pctLabel

	local descLabel = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	descLabel:SetPoint("LEFT", 300, 0)
	descLabel:SetJustifyH("LEFT")
	row.descLabel = descLabel

	parent.metricRows[index] = row
	return row
end

function PerformanceModule:CreateHeaderRow(parent)
	local xOffset = 8
	for _, col in ipairs(COLUMNS) do
		local btn = CreateFrame("Button", nil, parent)
		btn:SetSize(col.width, 20)
		btn:SetPoint("LEFT", xOffset, 0)

		local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
		text:SetPoint("LEFT")
		text:SetText(col.label)
		btn.text = text

		btn:SetScript("OnClick", function()
			self:OnColumnHeaderClick(col.key)
		end)

		btn:SetScript("OnEnter", function(self)
			self.text:SetTextColor(1, 1, 1)
		end)
		btn:SetScript("OnLeave", function(self)
			self.text:SetTextColor(1, 0.82, 0)
		end)

		xOffset = xOffset + col.width + 8
	end
end

function PerformanceModule:OnColumnHeaderClick(columnKey)
	if self.sortColumn == columnKey then
		self.sortDesc = not self.sortDesc
	else
		self.sortColumn = columnKey
		self.sortDesc = true
	end
	self:RefreshList()
end

--------------------------------------------------------------------------------
-- Tab Visibility
--------------------------------------------------------------------------------

function PerformanceModule:OnShow()
	self.visible = true
	self.trackingStart = self.trackingStart or GetTime()
	self:Refresh()
	if self.autoRefresh then
		self:StartAutoRefresh()
	end
end

function PerformanceModule:OnHide()
	self.visible = false
	self:StopAutoRefresh()
end

--------------------------------------------------------------------------------
-- Extended Metrics
--------------------------------------------------------------------------------

function PerformanceModule:GetExtendedMetrics()
	local fps = GetFramerate()
	local _, _, latencyHome, latencyWorld = GetNetStats()
	local luaMemory = collectgarbage("count") -- KB

	return {
		fps = fps,
		latencyHome = latencyHome,
		latencyWorld = latencyWorld,
		luaMemory = luaMemory,
	}
end

function PerformanceModule:UpdateExtendedMetrics()
	-- Guard: UI elements may not exist yet during early initialization
	if not self.fpsLabel then
		return
	end

	local metrics = self:GetExtendedMetrics()

	self.fpsLabel:SetText(string.format("FPS: %.0f", metrics.fps))
	self.latencyLabel:SetText(string.format("Latency: %dms / %dms", metrics.latencyHome, metrics.latencyWorld))
	self.memoryLabel:SetText(string.format("Lua Memory: %.1f MB", metrics.luaMemory / 1024))
end

--------------------------------------------------------------------------------
-- Addon Performance Data
--------------------------------------------------------------------------------

function PerformanceModule:GetAddonData()
	-- Refresh memory data
	UpdateAddOnMemoryUsage()

	local cpuEnabled = GetCVarBool("scriptProfile")
	if cpuEnabled then
		UpdateAddOnCPUUsage()
	end

	local addons = {}
	local totalMemory = 0
	local totalCPU = 0
	local numAddons = C_AddOns.GetNumAddOns()
	local duration = GetTime() - (self.trackingStart or GetTime())

	for i = 1, numAddons do
		if C_AddOns.IsAddOnLoaded(i) then
			local name = C_AddOns.GetAddOnInfo(i)
			local memory = GetAddOnMemoryUsage(i) -- KB
			local cpu = 0

			if cpuEnabled then
				cpu = GetAddOnCPUUsage(i) -- ms total
				-- Convert to ms/s
				if duration > 0 then
					cpu = cpu / duration
				end
			end

			totalMemory = totalMemory + memory
			totalCPU = totalCPU + cpu

			table.insert(addons, {
				name = name,
				memory = memory,
				cpu = cpu,
			})
		end
	end

	-- Calculate percentages
	for _, addon in ipairs(addons) do
		addon.memoryPercent = totalMemory > 0 and (addon.memory / totalMemory * 100) or 0
		addon.cpuPercent = totalCPU > 0 and (addon.cpu / totalCPU * 100) or 0
	end

	-- Sort by current column
	local sortKey = self.sortColumn
	local sortDesc = self.sortDesc
	table.sort(addons, function(a, b)
		local valA = a[sortKey] or 0
		local valB = b[sortKey] or 0
		if type(valA) == "string" then
			if sortDesc then
				return valA > valB
			else
				return valA < valB
			end
		else
			if sortDesc then
				return valA > valB
			else
				return valA < valB
			end
		end
	end)

	return addons, totalMemory, totalCPU, duration
end

--------------------------------------------------------------------------------
-- List Display
--------------------------------------------------------------------------------

function PerformanceModule:RefreshList()
	-- Guard: UI elements may not exist yet during early initialization
	if not self.rowPool or not self.scrollFrame then
		return
	end

	local addons, totalMemory, totalCPU, duration = self:GetAddonData()
	local cpuEnabled = GetCVarBool("scriptProfile")

	-- Clear existing rows
	for _, row in ipairs(self.rowPool) do
		row:Hide()
	end

	-- Create rows
	local yOffset = 0
	local contentWidth = self.scrollFrame:GetWidth() - 24
	for i, addon in ipairs(addons) do
		local row = self:GetOrCreateRow(i)
		row:SetPoint("TOPLEFT", self.listContent, "TOPLEFT", 0, -yOffset)
		row:SetSize(contentWidth, 20)
		row:Show()

		-- Update row data
		self:UpdateRow(row, addon, cpuEnabled)

		yOffset = yOffset + 22
	end

	-- Update scroll content size
	self.listContent:SetSize(contentWidth, yOffset)

	-- Update footer
	self.footerLabel:SetText(
		string.format("Tracking: %s | Total Memory: %s", self:FormatDuration(duration), self:FormatMemory(totalMemory))
	)
end

function PerformanceModule:GetOrCreateRow(index)
	if self.rowPool[index] then
		return self.rowPool[index]
	end

	local row = CreateFrame("Frame", nil, self.listContent)
	row:SetHeight(20)

	-- Alternate background
	local bg = row:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	if index % 2 == 0 then
		bg:SetColorTexture(1, 1, 1, 0.03)
	else
		bg:SetColorTexture(0, 0, 0, 0)
	end

	-- Create labels for each column
	row.labels = {}
	local xOffset = 8
	for _, col in ipairs(COLUMNS) do
		local label = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
		label:SetPoint("LEFT", xOffset, 0)
		label:SetWidth(col.width)
		label:SetJustifyH("LEFT")
		row.labels[col.key] = label
		xOffset = xOffset + col.width + 8
	end

	self.rowPool[index] = row
	return row
end

function PerformanceModule:UpdateRow(row, addon, cpuEnabled)
	row.labels.name:SetText(addon.name)
	row.labels.memory:SetText(self:FormatMemory(addon.memory))
	row.labels.memoryPercent:SetText(string.format("%.1f%%", addon.memoryPercent))

	if cpuEnabled then
		row.labels.cpu:SetText(string.format("%.2f", addon.cpu))
		row.labels.cpuPercent:SetText(string.format("%.1f%%", addon.cpuPercent))
	else
		row.labels.cpu:SetText("-")
		row.labels.cpuPercent:SetText("-")
	end
end

--------------------------------------------------------------------------------
-- Formatting Helpers
--------------------------------------------------------------------------------

function PerformanceModule:FormatMemory(kb)
	if kb >= 1024 then
		return string.format("%.1f MB", kb / 1024)
	else
		return string.format("%.0f KB", kb)
	end
end

function PerformanceModule:FormatDuration(seconds)
	local mins = math.floor(seconds / 60)
	local secs = math.floor(seconds % 60)
	return string.format("%dm %ds", mins, secs)
end

--------------------------------------------------------------------------------
-- Refresh & Auto-Refresh
--------------------------------------------------------------------------------

function PerformanceModule:Refresh()
	if self.selectedNav == "general" then
		self:UpdateExtendedMetrics()
		self:RefreshList()
	else
		self:ShowAddonMetrics(self.selectedNav)
	end
end

function PerformanceModule:StartAutoRefresh()
	if self.refreshTimer then
		return
	end

	local interval = Mechanic.db.profile.refreshInterval or 1.0
	self.refreshTimer = C_Timer.NewTicker(interval, function()
		if self.visible then
			self:Refresh()
		end
	end)
end

function PerformanceModule:StopAutoRefresh()
	if self.refreshTimer then
		self.refreshTimer:Cancel()
		self.refreshTimer = nil
	end
end

function PerformanceModule:ToggleAutoRefresh()
	self.autoRefresh = not self.autoRefresh
	Mechanic.db.profile.autoRefresh = self.autoRefresh

	if self.autoRefresh then
		self:StartAutoRefresh()
		self.autoRefreshButton:SetText("▶ Auto-Refresh: ON")
	else
		self:StopAutoRefresh()
		self.autoRefreshButton:SetText("⏸ Auto-Refresh: OFF")
	end
end

--------------------------------------------------------------------------------
-- CPU Profiling
--------------------------------------------------------------------------------

function PerformanceModule:UpdateCPUButtonState()
	local cpuEnabled = GetCVarBool("scriptProfile")
	if cpuEnabled then
		self.cpuButton:SetText("CPU Profiling: ON")
	else
		self.cpuButton:SetText("CPU Profiling: OFF")
	end
end

function PerformanceModule:ToggleCPUProfiling()
	local current = GetCVarBool("scriptProfile")
	local new = not current

	-- Changing scriptProfile requires reload
	StaticPopup_Show("MECHANIC_CPU_PROFILING", nil, nil, {
		enable = new,
	})
end

--------------------------------------------------------------------------------
-- Reset Stats
--------------------------------------------------------------------------------

function PerformanceModule:ResetStats()
	self.trackingStart = GetTime()
	ResetCPUUsage()
	collectgarbage("collect")
	self:Refresh()
	Mechanic:Print("Performance stats reset.")
end

--------------------------------------------------------------------------------
-- Event Frequency Tracking (Optional)
--------------------------------------------------------------------------------

function PerformanceModule:EnableEventTracking()
	if not Mechanic.db.profile.trackEventFrequency then
		return
	end

	self.eventCounts = {}
	self.eventTrackingStart = GetTime()

	-- Create tracking frame
	if not self.eventFrame then
		self.eventFrame = CreateFrame("Frame")
		self.eventFrame:SetScript("OnEvent", function(_, event)
			if self.eventCounts[event] then
				self.eventCounts[event].count = self.eventCounts[event].count + 1
			end
		end)
	end

	-- Register for common high-frequency events
	local events = {
		"UNIT_HEALTH",
		"UNIT_POWER_UPDATE",
		"UNIT_AURA",
		"COMBAT_LOG_EVENT_UNFILTERED",
		"SPELL_UPDATE_COOLDOWN",
	}
	for _, event in ipairs(events) do
		self.eventCounts[event] = { count = 0 }
		self.eventFrame:RegisterEvent(event)
	end
end

function PerformanceModule:DisableEventTracking()
	if self.eventFrame then
		self.eventFrame:UnregisterAllEvents()
	end
	self.eventCounts = {}
end

function PerformanceModule:GetEventFrequency()
	local duration = GetTime() - (self.eventTrackingStart or GetTime())
	if duration < 1 then
		duration = 1
	end

	local events = {}
	for event, data in pairs(self.eventCounts) do
		table.insert(events, {
			event = event,
			count = data.count,
			perMinute = (data.count / duration) * 60,
		})
	end

	table.sort(events, function(a, b)
		return a.count > b.count
	end)
	return events
end

--------------------------------------------------------------------------------
-- Export Mode Toggle
--------------------------------------------------------------------------------

function PerformanceModule:ToggleExportMode()
	self.exportMode = not self.exportMode

	if self.exportMode then
		-- Hide table UI, show export box
		if self.metricsRow then
			self.metricsRow:Hide()
		end
		if self.headerRowFrame then
			self.headerRowFrame:Hide()
		end
		if self.scrollFrame then
			self.scrollFrame:Hide()
		end
		if self.footerBarFrame then
			self.footerBarFrame:Hide()
		end
		if self.exportBox then
			local text = self:GetCopyText(Mechanic.db.profile.includeEnvHeader)
			self.exportBox:SetText(text)
			self.exportBox:Show()
			self.exportBox:ScrollToTop()
		end
		if self.exportButton then
			self.exportButton:SetText("Table View")
		end
	else
		-- Hide export box, show table UI
		if self.exportBox then
			self.exportBox:Hide()
		end
		if self.metricsRow then
			self.metricsRow:Show()
		end
		if self.headerRowFrame then
			self.headerRowFrame:Show()
		end
		if self.scrollFrame then
			self.scrollFrame:Show()
		end
		if self.footerBarFrame then
			self.footerBarFrame:Show()
		end
		if self.exportButton then
			self.exportButton:SetText("Export")
		end
	end
end

--------------------------------------------------------------------------------
-- Copy Text Generation
--------------------------------------------------------------------------------

function PerformanceModule:GetCopyText(includeHeader)
	local lines = {}

	if includeHeader then
		local header = Mechanic:GetEnvironmentHeader()
		if header then
			table.insert(lines, header)
		end
		local metrics = self:GetExtendedMetrics()
		table.insert(
			lines,
			string.format(
				"FPS: %.0f | Latency: %dms / %dms | Duration: %s",
				metrics.fps,
				metrics.latencyHome,
				metrics.latencyWorld,
				self:FormatDuration(GetTime() - (self.trackingStart or GetTime()))
			)
		)

		local _, totalMemory = self:GetAddonData()
		local cpuEnabled = GetCVarBool("scriptProfile")
		table.insert(
			lines,
			string.format(
				"Total Memory: %s | CPU Profiling: %s",
				self:FormatMemory(totalMemory),
				cpuEnabled and "ON" or "OFF"
			)
		)
		table.insert(lines, "---")
	end

	-- Addon table
	local addons = self:GetAddonData()
	local cpuEnabled = GetCVarBool("scriptProfile")

	if cpuEnabled then
		table.insert(lines, "Addon              | Memory   | %     | CPU ms/s | %")
		table.insert(lines, "-------------------|----------|-------|----------|-------")
	else
		table.insert(lines, "Addon              | Memory   | %")
		table.insert(lines, "-------------------|----------|------")
	end

	for _, addon in ipairs(addons) do
		if cpuEnabled then
			table.insert(
				lines,
				string.format(
					"%-18s | %8s | %5.1f%% | %8.2f | %5.1f%%",
					addon.name:sub(1, 18),
					self:FormatMemory(addon.memory),
					addon.memoryPercent,
					addon.cpu,
					addon.cpuPercent
				)
			)
		else
			table.insert(
				lines,
				string.format(
					"%-18s | %8s | %5.1f%%",
					addon.name:sub(1, 18),
					self:FormatMemory(addon.memory),
					addon.memoryPercent
				)
			)
		end
	end

	return table.concat(lines, "\n")
end

--------------------------------------------------------------------------------
-- Static Popup for CPU Profiling
--------------------------------------------------------------------------------

StaticPopupDialogs["MECHANIC_CPU_PROFILING"] = {
	text = "CPU profiling requires a UI reload. Continue?",
	button1 = "Reload",
	button2 = "Cancel",
	OnAccept = function(self, data)
		SetCVar("scriptProfile", data.enable and "1" or "0")
		ReloadUI()
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3,
}

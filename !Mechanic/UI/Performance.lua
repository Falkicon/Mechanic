-- UI/Performance.lua
-- !Mechanic - Performance Tab Module (Phase 3)
--
-- Provides memory/CPU metrics per addon, extended metrics (FPS, latency),
-- and optional event frequency tracking.

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local ICON_PATH = [[Interface\AddOns\!Mechanic\Assets\Icons\]]
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
PerformanceModule.navDirty = true
PerformanceModule.selectedAddon = "general"

-- Register static popup for CPU profiling
_G.StaticPopupDialogs["MECHANIC_CPU_PROFILING"] = {
	text = L["CPU profiling requires a UI reload. Continue?"],
	button1 = L["Reload"],
	button2 = L["Cancel"],
	OnAccept = function(_, data)
		_G.SetCVar("scriptProfile", data.enable and "1" or "0")
		_G.ReloadUI()
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3,
}

-- Column definitions for addon list
local COLUMNS = {
	{ key = "name", label = L["Addon"], width = 180 },
	{ key = "memory", label = L["Memory"], width = 80 },
	{ key = "memoryPercent", label = L["%"], width = 50 },
	{ key = "cpu", label = L["CPU ms/s"], width = 80 },
	{ key = "cpuPercent", label = L["%"], width = 50 },
}

-- Column definitions for sub-metrics
local SUB_COLUMNS = {
	{ key = "name", label = L["Metric"], width = 180 },
	{ key = "ms", label = L["ms/s"], width = 80 },
	{ key = "percent", label = L["%"], width = 50 },
	{ key = "description", label = L["Description"], width = 200 },
}

--------------------------------------------------------------------------------
-- Initialization
--------------------------------------------------------------------------------

function Mechanic:InitializePerformance()
	if PerformanceModule.frame then
		return
	end

	-- Initialize state tables early to prevent nil errors during restored selection
	PerformanceModule.addonRows = {}
	PerformanceModule.addonDetailFrames = {}

	local parent = self.frame.moduleContent
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetAllPoints()
	PerformanceModule.frame = frame

	-- Create split nav layout
	local SplitNavLayout = ns.SplitNavLayout
	PerformanceModule.layout = SplitNavLayout:Create(frame, {
		navWidth = 180,
		items = PerformanceModule:GetNavItems(),
		storageKey = "perf",
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

	-- Reset Stats
	local resetBtn = toolbar:AddButton({
		text = L["Reset Button"],
		width = 60,
		onClick = function()
			PerformanceModule:ResetStats()
		end,
	})

	toolbar:AddSpacer(8)

	-- Auto-Refresh Checkbox
	local autoRefreshCheck = FenUI:CreateCheckbox(toolbar, {
		label = L["Auto-Refresh"],
		checked = PerformanceModule.autoRefresh,
		width = 120,
		boxSize = 20,
		checkedTexture = ICON_PATH .. "icon-checkbox-checked",
		uncheckedTexture = ICON_PATH .. "icon-checkbox-unchecked",
		onChange = function(_, checked)
			PerformanceModule:ToggleAutoRefresh()
		end,
	})
	toolbar:AddFrame(autoRefreshCheck)
	PerformanceModule.autoRefreshCheck = autoRefreshCheck

	toolbar:AddSpacer(8)

	-- CPU Profiling Checkbox
	local cpuProfilingCheck = FenUI:CreateCheckbox(toolbar, {
		label = L["CPU Profiling"],
		checked = GetCVarBool("scriptProfile"),
		width = 120,
		boxSize = 20,
		checkedTexture = ICON_PATH .. "icon-checkbox-checked",
		uncheckedTexture = ICON_PATH .. "icon-checkbox-unchecked",
		onChange = function(_, checked)
			PerformanceModule:ToggleCPUProfiling()
		end,
	})
	toolbar:AddFrame(cpuProfilingCheck)
	PerformanceModule.cpuProfilingCheck = cpuProfilingCheck

	toolbar:AddSpacer("flex")

	-- Export Button
	local exportBtn = toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-export",
		size = 24,
		tooltip = L["Export Button"],
		onClick = function()
			PerformanceModule:Export()
		end,
	})
	PerformanceModule.exportButton = exportBtn

	-- Help Button
	toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-help",
		size = 24,
		tooltip = L["Help"],
		onClick = function()
			Mechanic.Utils:ShowHelpDialog("performance")
		end,
	})

	-- --- General View UI ---

	-- Metrics Container (to ensure visibility and proper layering)
	local generalContent = CreateFrame("Frame", nil, generalFrame)
	generalContent:SetAllPoints()
	PerformanceModule.generalContent = generalContent

	-- Extended Metrics Row
	local metricsRow = CreateFrame("Frame", nil, generalContent)
	metricsRow:SetHeight(28)
	metricsRow:SetPoint("TOPLEFT", generalContent, "TOPLEFT", 8, -40)
	metricsRow:SetPoint("TOPRIGHT", generalContent, "TOPRIGHT", -8, -40)

	local fpsLabel = metricsRow:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	fpsLabel:SetPoint("LEFT", 0, 0)
	fpsLabel:SetText(L["FPS: --"])
	PerformanceModule.fpsLabel = fpsLabel

	local latencyLabel = metricsRow:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	latencyLabel:SetPoint("LEFT", fpsLabel, "RIGHT", 32, 0)
	latencyLabel:SetText(L["Latency: --ms / --ms"])
	PerformanceModule.latencyLabel = latencyLabel

	local memoryLabel = metricsRow:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	memoryLabel:SetPoint("LEFT", latencyLabel, "RIGHT", 32, 0)
	memoryLabel:SetText(L["Lua Memory: -- MB"])
	PerformanceModule.memoryLabel = memoryLabel

	-- Footer bar
	local footerBar = CreateFrame("Frame", nil, generalContent)
	footerBar:SetHeight(24)
	footerBar:SetPoint("BOTTOMLEFT", generalContent, "BOTTOMLEFT", 8, 4)
	footerBar:SetPoint("BOTTOMRIGHT", generalContent, "BOTTOMRIGHT", -8, 4)

	local footerLabel = footerBar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	footerLabel:SetPoint("LEFT", 0, 0)
	footerLabel:SetText(
		string.format(L["Tracking: %s | Total Memory: %s"] or "Tracking: %s | Total Memory: %s", "0m 0s", "0 KB")
	)
	PerformanceModule.footerLabel = footerLabel

	-- Header row for addon list
	local headerRow = CreateFrame("Frame", nil, generalContent)
	headerRow:SetHeight(24)
	headerRow:SetPoint("TOPLEFT", metricsRow, "BOTTOMLEFT", 0, -4)
	headerRow:SetPoint("TOPRIGHT", -27, 0) -- Adjusted for scrollbar
	PerformanceModule:CreateHeaderRow(headerRow, COLUMNS)
	PerformanceModule.headerRow = headerRow

	-- Addon List (ScrollFrame)
	local scrollFrame = CreateFrame("ScrollFrame", nil, generalContent, "UIPanelScrollFrameTemplate")
	scrollFrame:SetPoint("TOPLEFT", headerRow, "BOTTOMLEFT", 0, -4)
	scrollFrame:SetPoint("BOTTOMRIGHT", footerBar, "TOPRIGHT", -27, 4) -- Adjusted for scrollbar
	PerformanceModule.scrollFrame = scrollFrame

	local content = CreateFrame("Frame", nil, scrollFrame)
	content:SetSize(scrollFrame:GetWidth(), 1)
	scrollFrame:SetScrollChild(content)
	PerformanceModule.content = content

	-- Sync width
	scrollFrame:SetScript("OnSizeChanged", function(_, w, h)
		content:SetWidth(w)
	end)

	-- Addon list rows
	for i = 1, 20 do -- Pre-create some rows
		local row = PerformanceModule:CreateAddonRow(content, COLUMNS)
		row:Hide()
		table.insert(PerformanceModule.addonRows, row)
	end

	-- --- Addon Details View UI ---

	-- Initial state
	PerformanceModule:OnEnable()
end

function PerformanceModule:OnShow()
	self.visible = true
	self:RefreshNavItems()

	-- Sync selected addon with layout's restored selection
	local layoutKey = self.layout:GetSelectedKey()
	if layoutKey and layoutKey ~= self.selectedAddon then
		self.selectedAddon = layoutKey
	end

	-- Update display for current selection (general or addon detail)
	self:UpdateDisplay()
	self:StartAutoRefresh()
	self:UpdateCPUButtonState()
	self:EnableEventTracking()
end

function PerformanceModule:OnHide()
	self.visible = false
	self:StopAutoRefresh()
	self:DisableEventTracking()
end

function PerformanceModule:GetNavItems()
	local items = {
		{ key = "general", text = L["General"] or "General" },
	}

	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib then
		local registered = MechanicLib:GetRegistered()
		local sortedNames = {}
		for name in pairs(registered) do
			table.insert(sortedNames, name)
		end
		table.sort(sortedNames)

		local hasAddonItems = false
		for _, addonName in ipairs(sortedNames) do
			-- Only add if addon has performance metrics AND is currently loaded
			if C_AddOns.IsAddOnLoaded(addonName) and MechanicLib:HasCapability(addonName, "performance") then
				if not hasAddonItems then
					table.insert(items, { key = "header_addons", text = L["Addons Tab"], isHeader = true })
					hasAddonItems = true
				end
				table.insert(items, {
					key = addonName,
					text = addonName,
				})
			end
		end
	end

	return items
end

function PerformanceModule:RefreshNavItems()
	self.layout:SetItems(self:GetNavItems())
	self.navDirty = false
end

function PerformanceModule:OnNavSelected(key)
	-- Guard: layout might not be assigned yet during initialization
	if not self.layout then
		return
	end

	self.selectedAddon = key
	self:UpdateDisplay()
end

function PerformanceModule:CreateAddonRow(parent, columns)
	local row = CreateFrame("Frame", nil, parent)
	row:SetHeight(20)

	local labels = {}
	local xOffset = 0
	for _, col in ipairs(columns) do
		local font = FenUI:GetFont("fontMono")
		local label = row:CreateFontString(nil, "OVERLAY", font)
		if not label:GetFont() then
			label:SetFontObject("ChatFontNormal")
		end
		label:SetPoint("LEFT", xOffset, 0)
		label:SetWidth(col.width)
		label:SetJustifyH("LEFT")
		labels[col.key] = label
		xOffset = xOffset + col.width + 4
	end
	row.labels = labels

	-- Only main list rows handle sorting via click
	if columns == COLUMNS then
		row:SetScript("OnMouseDown", function(_, button)
			if button == "LeftButton" then
				local x = GetCursorPosition()
				local currentX = row:GetLeft()
				for _, col in ipairs(columns) do
					if x >= currentX and x < currentX + col.width then
						PerformanceModule:SortBy(col.key)
						break
					end
					currentX = currentX + col.width + 4
				end
			end
		end)
	end

	return row
end

function PerformanceModule:CreateHeaderRow(parent, columns)
	parent.labels = {}
	local xOffset = 0
	local font = FenUI:GetFont("fontMono")

	for _, col in ipairs(columns) do
		local headerLabel = parent:CreateFontString(nil, "OVERLAY", font)

		-- Defensive check: if font failed to set during creation, fallback explicitly
		if not headerLabel:GetFont() then
			headerLabel:SetFontObject("ChatFontNormal")
		end

		headerLabel:SetPoint("LEFT", xOffset, 0)
		headerLabel:SetWidth(col.width)
		headerLabel:SetJustifyH("LEFT")
		headerLabel:SetText(col.label or "")
		parent.labels[col.key] = headerLabel
		xOffset = xOffset + col.width + 4
	end
end

function PerformanceModule:UpdateDisplay()
	-- Hide all managed content frames
	if self.layout and self.layout.contentFrames then
		for _, frame in pairs(self.layout.contentFrames) do
			frame:Hide()
		end
	end

	-- Hide all addon detail frames (which are managed locally)
	if self.addonDetailFrames then
		for _, frame in pairs(self.addonDetailFrames) do
			frame:Hide()
		end
	end

	-- Show selected content frame
	local currentContentFrame = self.layout:GetContentFrame(self.selectedAddon)
	if currentContentFrame then
		currentContentFrame:Show()
	end

	if self.selectedAddon == "general" then
		self.generalContent:Show()
		self.toolbar:Show()
		self:Refresh()
	else
		self.generalContent:Hide()
		self.toolbar:Show()
		self:ShowAddonDetails(self.selectedAddon)
	end
end

function PerformanceModule:Export()
	local navName = self.selectedAddon
	if not navName or navName == "general" then
		navName = L["General"] or "General"
	end

	local title = string.format(
		"%s : %s : %s",
		tostring(L["Performance"] or "Performance"),
		tostring(navName or "General"),
		tostring(L["Export"] or "Export")
	)

	local text = self:GetCopyText(Mechanic.db.profile.includeEnvHeader)
	Mechanic.Utils:ShowExportDialog(title, text)
end

function PerformanceModule:Refresh()
	if not self.visible then
		return
	end

	local metrics = Mechanic.Utils:GetExtendedMetrics()
	self.fpsLabel:SetText(string.format(L["FPS: %.0f"] or "FPS: %.0f", metrics.fps or 0))
	self.latencyLabel:SetText(
		string.format(
			L["Latency: %dms / %dms"] or "Latency: %dms / %dms",
			metrics.latencyHome or 0,
			metrics.latencyWorld or 0
		)
	)
	self.memoryLabel:SetText(
		string.format(L["Lua Memory: %s"] or "Lua Memory: %s", Mechanic.Utils:FormatMemory(metrics.luaMemory or 0))
	)

	local elapsed = GetTime() - (self.trackingStart or GetTime())
	local formattedElapsed = Mechanic.Utils:FormatDuration(elapsed)
	self.footerLabel:SetText(
		string.format(
			L["Tracking: %s | Total Memory: %s | CPU Profiling: %s"]
				or "Tracking: %s | Total Memory: %s | CPU Profiling: %s",
			tostring(formattedElapsed or "0s"),
			Mechanic.Utils:FormatMemory(metrics.luaMemory or 0),
			GetCVarBool("scriptProfile") and (L["ON"] or "ON") or (L["OFF"] or "OFF")
		)
	)

	self:UpdateAddonList()
	self:UpdateCPUButtonState()
end

function PerformanceModule:UpdateAddonList()
	local addonMemory = {}
	local totalMemory = 0
	local numAddons = C_AddOns.GetNumAddOns()

	UpdateAddOnMemoryUsage()
	for i = 1, numAddons do
		if C_AddOns.IsAddOnLoaded(i) then
			local name = C_AddOns.GetAddOnInfo(i)
			local mem = GetAddOnMemoryUsage(i)
			addonMemory[name] = mem
			totalMemory = totalMemory + mem
		end
	end

	local addonCPU = {}
	local totalCPU = 0
	if GetCVarBool("scriptProfile") then
		UpdateAddOnCPUUsage()
		for i = 1, numAddons do
			if C_AddOns.IsAddOnLoaded(i) then
				local name = C_AddOns.GetAddOnInfo(i)
				local cpu = GetAddOnCPUUsage(i)
				addonCPU[name] = cpu
				totalCPU = totalCPU + cpu
			end
		end
	end

	local data = {}
	for addonName, mem in pairs(addonMemory) do
		local cpu = addonCPU[addonName] or 0
		table.insert(data, {
			name = addonName,
			memory = mem,
			memoryPercent = totalMemory > 0 and (mem / totalMemory) * 100 or 0,
			cpu = cpu,
			cpuPercent = totalCPU > 0 and (cpu / totalCPU) * 100 or 0,
		})
	end

	-- Sort data
	table.sort(data, function(a, b)
		local valA = a[self.sortColumn]
		local valB = b[self.sortColumn]

		if valA == valB then
			return false
		end

		local aGreater
		if type(valA) == "string" then
			valB = tostring(valB or "")
			aGreater = valA > valB
		else
			valA = tonumber(valA) or 0
			valB = tonumber(valB) or 0
			aGreater = valA > valB
		end

		if self.sortDesc then
			return aGreater
		else
			return not aGreater
		end
	end)

	for _, col in ipairs(COLUMNS) do
		local headerLabel = self.headerRow and self.headerRow.labels and self.headerRow.labels[col.key]
		if headerLabel then
			local sortIndicator = ""
			if self.sortColumn == col.key then
				sortIndicator = self.sortDesc and " |A:common-icon-downarrow:14:14|a"
					or " |A:common-icon-uparrow:14:14|a"
			end
			headerLabel:SetText(tostring(col.label or "") .. sortIndicator)
		end
	end

	-- Update rows
	local yOffset = 0
	for i, rowData in ipairs(data) do
		local row = self.addonRows[i]
		if not row then
			row = self:CreateAddonRow(self.content, COLUMNS)
			table.insert(self.addonRows, row)
		end
		row:SetPoint("TOPLEFT", 0, -yOffset)
		row:SetPoint("TOPRIGHT", 0, -yOffset)
		row.labels.name:SetText(tostring(rowData.name or "Unknown"))
		row.labels.memory:SetText(Mechanic.Utils:FormatMemory(rowData.memory or 0))
		row.labels.memoryPercent:SetText(string.format("%.1f%%", tonumber(rowData.memoryPercent) or 0))
		if GetCVarBool("scriptProfile") then
			row.labels.cpu:SetText(string.format("%.2f", tonumber(rowData.cpu) or 0))
			row.labels.cpuPercent:SetText(string.format("%.1f%%", tonumber(rowData.cpuPercent) or 0))
		else
			row.labels.cpu:SetText(L["-"] or "-")
			row.labels.cpuPercent:SetText(L["-"] or "-")
		end
		row:Show()
		yOffset = yOffset + 20
	end

	-- Hide unused rows
	for i = #data + 1, #self.addonRows do
		self.addonRows[i]:Hide()
	end

	self.content:SetHeight(yOffset)
end

function PerformanceModule:SortBy(column)
	if self.sortColumn == column then
		self.sortDesc = not self.sortDesc
	else
		self.sortColumn = column
		self.sortDesc = true -- Default to descending for new column
	end
	self:UpdateAddonList()
end

function PerformanceModule:ShowAddonDetails(addonName)
	local detailFrame = self.layout:GetContentFrame(addonName)
	if not self.addonDetailFrames[addonName] then
		self.addonDetailFrames[addonName] = detailFrame

		local title = detailFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
		title:SetPoint("TOPLEFT", 8, -40)
		title:SetText(
			string.format(
				L["%s - Performance Breakdown"] or "%s - Performance Breakdown",
				tostring(addonName or "Unknown")
			)
		)

		local infoText = detailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
		infoText:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)
		infoText:SetText(L["No sub-metrics available for this addon."])
		detailFrame.infoText = infoText

		-- Sub-metrics table setup
		local headerRow = CreateFrame("Frame", nil, detailFrame)
		headerRow:SetHeight(24)
		headerRow:SetPoint("TOPLEFT", infoText, "BOTTOMLEFT", 0, -8)
		headerRow:SetPoint("TOPRIGHT", -27, 0) -- Adjusted for scrollbar
		self:CreateHeaderRow(headerRow, SUB_COLUMNS)
		detailFrame.headerRow = headerRow

		local scrollFrame = CreateFrame("ScrollFrame", nil, detailFrame, "UIPanelScrollFrameTemplate")
		scrollFrame:SetPoint("TOPLEFT", headerRow, "BOTTOMLEFT", 0, -4)
		scrollFrame:SetPoint("BOTTOMRIGHT", -27, 8) -- Adjusted for scrollbar
		detailFrame.scrollFrame = scrollFrame

		local content = CreateFrame("Frame", nil, scrollFrame)
		content:SetSize(scrollFrame:GetWidth(), 1)
		scrollFrame:SetScrollChild(content)
		detailFrame.content = content
		detailFrame.rows = {}

		-- Sync width
		scrollFrame:SetScript("OnSizeChanged", function(_, w)
			content:SetWidth(w)
		end)

		detailFrame.totalLabel = detailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
		detailFrame.totalLabel:SetPoint("BOTTOMLEFT", 8, 8)
	end

	-- Request sub-metrics from addon if it supports it
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib and MechanicLib:HasCapability(addonName, "performance") then
		local perf = MechanicLib:GetCapability(addonName, "performance")
		if perf and perf.getSubMetrics then
			local breakdown = perf.getSubMetrics()
			if breakdown and #breakdown > 0 then
				detailFrame.infoText:SetText("") -- Clear default message
				detailFrame.headerRow:Show()
				detailFrame.scrollFrame:Show()
				detailFrame.infoText:Hide()

				-- Calculate total
				local totalMs = 0
				for _, metric in ipairs(breakdown) do
					totalMs = totalMs + (metric.ms or metric.msPerSec or metric.cpu or 0)
				end

				-- Update rows
				local yOffset = 0
				for i, metric in ipairs(breakdown) do
					local row = detailFrame.rows[i]
					if not row then
						row = self:CreateAddonRow(detailFrame.content, SUB_COLUMNS)
						table.insert(detailFrame.rows, row)
					end
					row:SetPoint("TOPLEFT", 0, -yOffset)
					row:SetPoint("TOPRIGHT", 0, -yOffset)

					local ms = tonumber(metric.ms or metric.msPerSec or metric.cpu) or 0
					local percent = totalMs > 0 and (ms / totalMs) * 100 or 0

					row.labels.name:SetText(tostring(metric.name or "Unknown"))
					row.labels.ms:SetText(string.format("%.2f", ms))
					row.labels.percent:SetText(string.format("%.1f%%", percent))
					row.labels.description:SetText(tostring(metric.description or ""))
					row:Show()
					yOffset = yOffset + 20
				end

				-- Hide unused rows
				for i = #breakdown + 1, #detailFrame.rows do
					detailFrame.rows[i]:Hide()
				end

				detailFrame.content:SetHeight(yOffset)
				detailFrame.totalLabel:SetText(string.format(L["Total: %.2f ms/s"] or "Total: %.2f ms/s", totalMs or 0))
				detailFrame.totalLabel:Show()
			else
				detailFrame.headerRow:Hide()
				detailFrame.scrollFrame:Hide()
				detailFrame.totalLabel:Hide()
				detailFrame.infoText:Show()
				detailFrame.infoText:SetText(L["No sub-metrics available for this addon."] or "No metrics available")
			end
		else
			detailFrame.headerRow:Hide()
			detailFrame.scrollFrame:Hide()
			detailFrame.totalLabel:Hide()
			detailFrame.infoText:Show()
			detailFrame.infoText:SetText(L["Addon does not provide sub-metrics."] or "No sub-metrics available")
		end
	else
		detailFrame.headerRow:Hide()
		detailFrame.scrollFrame:Hide()
		detailFrame.totalLabel:Hide()
		detailFrame.infoText:Show()
		local msg = L["Addon performance tracking not available."] or "Addon performance tracking not available."
		if addonName == "!Mechanic" then
			msg = (L["!Mechanic is initializing..."] or "!Mechanic is initializing...") .. "\n" .. msg
		end
		detailFrame.infoText:SetText(msg)
	end

	detailFrame:Show()
end

function PerformanceModule:FormatBreakdown(breakdown)
	local lines = {}
	table.insert(lines, L["Metric             | ms/s     | %     | Description"])
	table.insert(lines, L["-------------------|----------|-------|-----------------------------"])

	local totalMs = 0
	for _, metric in ipairs(breakdown) do
		totalMs = totalMs + (metric.ms or metric.msPerSec or metric.cpu or 0)
	end

	for _, metric in ipairs(breakdown) do
		local ms = metric.ms or metric.msPerSec or metric.cpu or 0
		local percent = totalMs > 0 and (ms / totalMs) * 100 or 0
		table.insert(
			lines,
			string.format(
				"%-18s | %-8.2f | %-5.1f | %s",
				tostring(metric.name or "Unknown"),
				ms,
				percent,
				tostring(metric.description or "")
			)
		)
	end

	table.insert(
		lines,
		L["-------------------|----------|-------|-----------------------------"]
			or "-------------------|----------|-------|-----------------------------"
	)
	table.insert(lines, string.format(L["Total: %.2f ms/s"] or "Total: %.2f ms/s", totalMs or 0))

	return table.concat(lines, "\n")
end

function PerformanceModule:GetCopyText(includeHeader)
	local lines = {}

	if includeHeader then
		local header = Mechanic:GetEnvironmentHeader()
		if header then
			table.insert(lines, header)
			table.insert(
				lines,
				string.format(
					L["Tracking: %s | Total Memory: %s | CPU Profiling: %s"]
						or "Tracking: %s | Total Memory: %s | CPU Profiling: %s",
					tostring(Mechanic.Utils:FormatDuration(GetTime() - (self.trackingStart or GetTime()))),
					tostring(Mechanic.Utils:FormatMemory(collectgarbage("count"))),
					GetCVarBool("scriptProfile") and (L["ON"] or "ON") or (L["OFF"] or "OFF")
				)
			)
			table.insert(lines, "---")
		end
	end

	-- Handle specific addon export if selected
	if self.selectedAddon and self.selectedAddon ~= "general" then
		local MechanicLib = LibStub("MechanicLib-1.0", true)
		if MechanicLib and MechanicLib:HasCapability(self.selectedAddon, "performance") then
			local perf = MechanicLib:GetCapability(self.selectedAddon, "performance")
			if perf and perf.getSubMetrics then
				local breakdown = perf.getSubMetrics()
				if breakdown and #breakdown > 0 then
					table.insert(
						lines,
						string.format(
							L["%s - Performance Breakdown"] or "%s - Performance Breakdown",
							tostring(self.selectedAddon)
						)
					)
					table.insert(lines, "")
					table.insert(lines, self:FormatBreakdown(breakdown))
					return table.concat(lines, "\n")
				end
			end
		end
	end

	-- Default global export
	local addonMemory = {}
	local totalMemory = 0
	local numAddons = C_AddOns.GetNumAddOns()
	UpdateAddOnMemoryUsage()
	for i = 1, numAddons do
		if C_AddOns.IsAddOnLoaded(i) then
			local name = C_AddOns.GetAddOnInfo(i)
			local mem = GetAddOnMemoryUsage(i)
			addonMemory[name] = mem
			totalMemory = totalMemory + mem
		end
	end

	local addonCPU = {}
	local totalCPU = 0
	local cpuEnabled = GetCVarBool("scriptProfile")
	if cpuEnabled then
		UpdateAddOnCPUUsage()
		for i = 1, numAddons do
			if C_AddOns.IsAddOnLoaded(i) then
				local name = C_AddOns.GetAddOnInfo(i)
				local cpu = GetAddOnCPUUsage(i)
				addonCPU[name] = cpu
				totalCPU = totalCPU + cpu
			end
		end
	end

	local data = {}
	for addonName, mem in pairs(addonMemory) do
		local cpu = addonCPU[addonName] or 0
		table.insert(data, {
			name = addonName,
			memory = mem,
			memoryPercent = totalMemory > 0 and (mem / totalMemory) * 100 or 0,
			cpu = cpu,
			cpuPercent = totalCPU > 0 and (cpu / totalCPU) * 100 or 0,
		})
	end

	-- Sort data using current UI sort
	table.sort(data, function(a, b)
		local valA = a[self.sortColumn]
		local valB = b[self.sortColumn]

		if valA == valB then
			return false
		end

		local aGreater
		if type(valA) == "string" then
			valB = tostring(valB or "")
			aGreater = valA > valB
		else
			valA = tonumber(valA) or 0
			valB = tonumber(valB) or 0
			aGreater = valA > valB
		end

		if self.sortDesc then
			return aGreater
		else
			return not aGreater
		end
	end)

	if cpuEnabled then
		table.insert(
			lines,
			L["Addon              | Memory   | %     | CPU ms/s | %"]
				or "Addon              | Memory   | %     | CPU ms/s | %"
		)
		table.insert(
			lines,
			L["-------------------|----------|-------|----------|-------"]
				or "-------------------|----------|-------|----------|-------"
		)
		for _, rowData in ipairs(data) do
			table.insert(
				lines,
				string.format(
					"%-18s | %-8s | %-5.1f | %-8.2f | %-5.1f",
					tostring(rowData.name or "Unknown"),
					tostring(Mechanic.Utils:FormatMemory(rowData.memory or 0)),
					rowData.memoryPercent or 0,
					rowData.cpu or 0,
					rowData.cpuPercent or 0
				)
			)
		end
	else
		table.insert(lines, L["Addon              | Memory   | %"] or "Addon              | Memory   | %")
		table.insert(lines, L["-------------------|----------|------"] or "-------------------|----------|------")
		for _, rowData in ipairs(data) do
			table.insert(
				lines,
				string.format(
					"%-18s | %-8s | %-5.1f",
					tostring(rowData.name or "Unknown"),
					tostring(Mechanic.Utils:FormatMemory(rowData.memory or 0)),
					rowData.memoryPercent or 0
				)
			)
		end
	end

	return table.concat(lines, "\n")
end

--------------------------------------------------------------------------------
-- Auto-Refresh
--------------------------------------------------------------------------------

function PerformanceModule:StartAutoRefresh()
	if self.refreshTimer then
		return
	end
	self.refreshTimer = C_Timer.NewTicker(Mechanic.db.profile.refreshInterval or 1, function()
		self:Refresh()
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
	else
		self:StopAutoRefresh()
	end

	if self.autoRefreshCheck then
		self.autoRefreshCheck:SetChecked(self.autoRefresh, true)
	end
end

--------------------------------------------------------------------------------
-- CPU Profiling
--------------------------------------------------------------------------------

function PerformanceModule:UpdateCPUButtonState()
	local cpuEnabled = GetCVarBool("scriptProfile")
	if self.cpuProfilingCheck then
		self.cpuProfilingCheck:SetChecked(cpuEnabled, true)
	end
end

function PerformanceModule:ToggleCPUProfiling()
	local current = GetCVarBool("scriptProfile")
	local new = not current

	-- Changing scriptProfile requires reload
	StaticPopup_Show("MECHANIC_CPU_PROFILING", nil, nil, {
		enable = new,
	})

	-- Revert checkbox state until reload
	if self.cpuProfilingCheck then
		self.cpuProfilingCheck:SetChecked(current, true)
	end
end

--------------------------------------------------------------------------------
-- Reset Stats
--------------------------------------------------------------------------------

function PerformanceModule:ResetStats()
	self.trackingStart = GetTime()
	ResetCPUUsage()
	collectgarbage("collect")
	self:Refresh()
	Mechanic:Print(L["Performance stats reset."])
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
end

function PerformanceModule:OnEnable()
	-- Initial registration or setup if needed
end

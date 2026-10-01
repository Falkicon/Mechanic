-- UI/Performance.lua
-- !Mechanic - Performance Tab Module (Phase 3)
--
-- Provides memory/CPU metrics per addon, extended metrics (FPS, latency),
-- and per-addon CPU rates.

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local ICON_PATH = [[Interface\AddOns\Mechanic\Assets\Icons\]]
local PerformanceModule = {}
Mechanic.Perf = PerformanceModule

PerformanceModule.autoRefresh = true
PerformanceModule.refreshTimer = nil
PerformanceModule.trackingStart = nil
PerformanceModule.sortColumn = "memory"
PerformanceModule.sortDesc = true
PerformanceModule.visible = false
PerformanceModule.selectedAddon = "general"
PerformanceModule.cpuEnabled = false
PerformanceModule.cpuPrev = nil -- name -> cumulative ms at the previous sample
PerformanceModule.cpuPrevTime = nil
PerformanceModule.cpuRate = {} -- name -> ms/s over the last sample window
PerformanceModule.collected = {} -- reused per-tick row data

-- CPU samples closer together than this reuse the previous rates (manual refresh spam)
local MIN_CPU_SAMPLE_SECONDS = 0.5

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

	PerformanceModule.trackingStart = GetTime()

	-- Initialize state tables early to prevent nil errors during restored selection
	PerformanceModule.addonRows = {}
	PerformanceModule.addonDetailFrames = {}
	PerformanceModule.blocks = { uiRefresh = 0 }

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

	-- Manual Refresh Button
	local refreshBtn = toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-reload",
		size = 24,
		tooltip = L["Refresh"],
		onClick = function()
			PerformanceModule:Refresh()
		end,
	})
	toolbar:AddSpacer(8)

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
			Mechanic.Utils:ShowHelpDialog("perf")
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

	local fpsLabel = metricsRow:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontBody"))
	fpsLabel:SetPoint("LEFT", 0, 0)
	fpsLabel:SetText(L["FPS: --"])
	PerformanceModule.fpsLabel = fpsLabel

	local latencyLabel = metricsRow:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontBody"))
	latencyLabel:SetPoint("LEFT", fpsLabel, "RIGHT", 32, 0)
	latencyLabel:SetText(L["Latency: --ms / --ms"])
	PerformanceModule.latencyLabel = latencyLabel

	local memoryLabel = metricsRow:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontBody"))
	memoryLabel:SetPoint("LEFT", latencyLabel, "RIGHT", 32, 0)
	memoryLabel:SetText(L["Lua Memory: -- MB"])
	PerformanceModule.memoryLabel = memoryLabel

	-- Footer bar
	local footerBar = CreateFrame("Frame", nil, generalContent)
	footerBar:SetHeight(24)
	footerBar:SetPoint("BOTTOMLEFT", generalContent, "BOTTOMLEFT", 8, 4)
	footerBar:SetPoint("BOTTOMRIGHT", generalContent, "BOTTOMRIGHT", -8, 4)

	local footerLabel = footerBar:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
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
	PerformanceModule:CreateHeaderRow(headerRow, COLUMNS, true)
	PerformanceModule.headerRow = headerRow

	-- Addon List (ScrollFrame)
	local scrollFrame = CreateFrame("ScrollFrame", nil, generalContent, "UIPanelScrollFrameTemplate")
	scrollFrame:SetPoint("TOPLEFT", headerRow, "BOTTOMLEFT", 0, -4)
	scrollFrame:SetPoint("BOTTOMRIGHT", footerBar, "TOPRIGHT", -27, 4) -- Adjusted for scrollbar
	FenUI:SkinScrollFrame(scrollFrame, { offset = 6 })
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

end

function PerformanceModule:OnShow()
	self.visible = true
	self.autoRefresh = Mechanic.db.profile.autoRefresh ~= false
	if self.autoRefreshCheck then
		self.autoRefreshCheck:SetChecked(self.autoRefresh, true)
	end
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
end

function PerformanceModule:OnHide()
	self.visible = false
	self:StopAutoRefresh()
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

	return row
end

function PerformanceModule:CreateHeaderRow(parent, columns, sortable)
	parent.labels = {}
	local xOffset = 0
	local font = FenUI:GetFont("fontMono")

	for _, col in ipairs(columns) do
		local labelParent = parent
		if sortable then
			-- Sortable headers are buttons so clicks need no cursor/scale math
			local button = CreateFrame("Button", nil, parent)
			button:SetSize(col.width, parent:GetHeight())
			button:SetPoint("LEFT", xOffset, 0)
			button:RegisterForClicks("LeftButtonUp")
			button:SetScript("OnClick", function()
				PerformanceModule:SortBy(col.key)
			end)
			labelParent = button
		end
		local headerLabel = labelParent:CreateFontString(nil, "OVERLAY", font)

		-- Defensive check: if font failed to set during creation, fallback explicitly
		if not headerLabel:GetFont() then
			headerLabel:SetFontObject("ChatFontNormal")
		end

		headerLabel:SetPoint("LEFT", sortable and 0 or xOffset, 0)
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
	local refreshStart = debugprofilestop()
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

	-- Smart refresh: Update the active view
	if self.selectedAddon == "general" then
		self:UpdateAddonList()
	else
		self:ShowAddonDetails(self.selectedAddon)
	end

	self.blocks.uiRefresh = debugprofilestop() - refreshStart
end

--- Convert each entry's cumulative CPU ms (`cpuRaw`) into ms/s over the window since the
--- previous sample and store it in `cpu`. Returns the total rate. Samples closer than
--- MIN_CPU_SAMPLE_SECONDS reuse the last rates so manual refreshes do not add noise.
function PerformanceModule:UpdateCPURates(entries, now)
	local prev, rate = self.cpuPrev, self.cpuRate
	if not prev then
		prev = {}
		self.cpuPrev = prev
	end

	local baseline = self.cpuPrevTime == nil
	local dt = baseline and 0 or (now - self.cpuPrevTime)
	local resample = baseline or dt >= MIN_CPU_SAMPLE_SECONDS

	local total = 0
	for i = 1, #entries do
		local entry = entries[i]
		local name = entry.name
		if resample then
			local last = prev[name]
			local delta = last and (entry.cpuRaw - last) or 0
			if baseline or delta < 0 or dt <= 0 then
				rate[name] = 0 -- first sample or counter reset: no window yet
			else
				rate[name] = delta / dt
			end
			prev[name] = entry.cpuRaw
		end
		entry.cpu = rate[name] or 0
		total = total + entry.cpu
	end
	if resample then
		self.cpuPrevTime = now
	end
	return total
end

function PerformanceModule:ResetCPURates()
	self.cpuPrevTime = nil
	if self.cpuPrev then
		wipe(self.cpuPrev)
	end
	wipe(self.cpuRate)
end

function PerformanceModule:CollectAddonData()
	-- Row tables are reused every tick instead of reallocated
	local data = self.collected
	local count, totalMemory = 0, 0
	local cpuEnabled = GetCVarBool("scriptProfile")
	self.cpuEnabled = cpuEnabled

	UpdateAddOnMemoryUsage()
	if cpuEnabled then
		UpdateAddOnCPUUsage()
	end
	for i = 1, C_AddOns.GetNumAddOns() do
		if C_AddOns.IsAddOnLoaded(i) then
			count = count + 1
			local entry = data[count]
			if not entry then
				entry = {}
				data[count] = entry
			end
			local mem = GetAddOnMemoryUsage(i)
			entry.name = C_AddOns.GetAddOnInfo(i)
			entry.memory = mem
			entry.cpuRaw = cpuEnabled and GetAddOnCPUUsage(i) or 0
			totalMemory = totalMemory + mem
		end
	end
	for i = #data, count + 1, -1 do
		data[i] = nil
	end

	local totalCPU = 0
	if cpuEnabled then
		totalCPU = self:UpdateCPURates(data, GetTime())
	else
		self:ResetCPURates()
		for i = 1, count do
			data[i].cpu = 0
		end
	end
	for i = 1, count do
		local entry = data[i]
		entry.memoryPercent = totalMemory > 0 and (entry.memory / totalMemory) * 100 or 0
		entry.cpuPercent = totalCPU > 0 and (entry.cpu / totalCPU) * 100 or 0
	end
	return data, cpuEnabled
end

function PerformanceModule:SortAddonData(data)
	table.sort(data, function(a, b)
		local valA = a[self.sortColumn]
		local valB = b[self.sortColumn]

		if valA == valB then
			return false
		end

		if type(valA) == "string" then
			valA = tostring(valA or "")
			valB = tostring(valB or "")
		else
			valA = tonumber(valA) or 0
			valB = tonumber(valB) or 0
		end

		if self.sortDesc then
			return valA > valB
		end
		return valA < valB
	end)
end

-- Avoid re-laying out a FontString when the text did not change between ticks
local function SetLabelText(label, text)
	if label.lastText ~= text then
		label.lastText = text
		label:SetText(text)
	end
end

function PerformanceModule:UpdateAddonList()
	self:RenderAddonList((self:CollectAddonData()))
end

function PerformanceModule:RenderAddonList(data)
	self:SortAddonData(data)

	for _, col in ipairs(COLUMNS) do
		local headerLabel = self.headerRow and self.headerRow.labels and self.headerRow.labels[col.key]
		if headerLabel then
			local sortIndicator = ""
			if self.sortColumn == col.key then
				sortIndicator = self.sortDesc and " |A:common-icon-downarrow:14:14|a"
					or " |A:common-icon-uparrow:14:14|a"
			end
			SetLabelText(headerLabel, tostring(col.label or "") .. sortIndicator)
		end
	end

	-- Update rows
	local cpuEnabled = self.cpuEnabled
	local dash = L["-"] or "-"
	local yOffset = 0
	for i, rowData in ipairs(data) do
		local row = self.addonRows[i]
		if not row then
			row = self:CreateAddonRow(self.content, COLUMNS)
			table.insert(self.addonRows, row)
		end
		if row.layoutY ~= yOffset then
			row.layoutY = yOffset
			row:SetPoint("TOPLEFT", 0, -yOffset)
			row:SetPoint("TOPRIGHT", 0, -yOffset)
		end
		local labels = row.labels
		SetLabelText(labels.name, tostring(rowData.name or "Unknown"))
		SetLabelText(labels.memory, Mechanic.Utils:FormatMemory(rowData.memory or 0))
		SetLabelText(labels.memoryPercent, string.format("%.1f%%", tonumber(rowData.memoryPercent) or 0))
		if cpuEnabled then
			SetLabelText(labels.cpu, string.format("%.2f", tonumber(rowData.cpu) or 0))
			SetLabelText(labels.cpuPercent, string.format("%.1f%%", tonumber(rowData.cpuPercent) or 0))
		else
			SetLabelText(labels.cpu, dash)
			SetLabelText(labels.cpuPercent, dash)
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
	-- Re-sort the last sample; re-collecting would perturb the CPU rate window
	if #self.collected > 0 then
		self:RenderAddonList(self.collected)
	else
		self:UpdateAddonList()
	end
end

function PerformanceModule:ShowAddonDetails(addonName)
	local detailFrame = self.layout:GetContentFrame(addonName)
	if not self.addonDetailFrames[addonName] then
		self.addonDetailFrames[addonName] = detailFrame

		local title = detailFrame:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontTitle"))
		title:SetTextColor(FenUI:GetColorRGB("textHeading"))
		title:SetPoint("TOPLEFT", 8, -40)
		title:SetText(
			string.format(
				L["%s - Performance Breakdown"] or "%s - Performance Breakdown",
				tostring(addonName or "Unknown")
			)
		)

		local infoText = detailFrame:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
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
		FenUI:SkinScrollFrame(scrollFrame, { offset = 6 })
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

		detailFrame.totalLabel = detailFrame:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
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
	local data, cpuEnabled = self:CollectAddonData()
	self:SortAddonData(data)

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
	if self.refreshTimer or not self.visible or not self.autoRefresh then
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
	self:ResetCPURates()
	-- Full collection only on this explicit user action, so memory reads restart from a clean baseline
	collectgarbage("collect")
	self:Refresh()
	Mechanic:Print(L["Performance stats reset."])
end

--------------------------------------------------------------------------------
-- Deprecated
--------------------------------------------------------------------------------

-- Event frequency tracking was removed (its counts were never displayed). Core.lua still
-- calls EnableEventTracking when an old profile has trackEventFrequency set; these no-ops
-- keep that call safe until the call site is dropped.
function PerformanceModule:EnableEventTracking() end
function PerformanceModule:DisableEventTracking() end

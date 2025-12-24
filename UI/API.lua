-- UI/API.lua
-- !Mechanic - API Test Bench (Phase 7)
--
-- Centralized API exploration, testing, and documentation.

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local APIModule = {}
Mechanic.API = APIModule

APIModule.layout = nil
APIModule.selectedAPI = nil
APIModule.paramInputs = {}
APIModule.lastResults = {}

-- Import definitions
local API_DEFINITIONS = ns.APIDefinitions
local API_CATEGORIES = ns.APICategories

--------------------------------------------------------------------------------
-- Initialization
--------------------------------------------------------------------------------

function Mechanic:InitializeAPI()
	if APIModule.frame then
		return
	end

	local parent = self.frame.moduleContent
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetAllPoints()
	APIModule.frame = frame

	-- Build nav tree from categories
	local navItems = APIModule:BuildNavTree()

	-- Create split nav layout
	local SplitNavLayout = ns.SplitNavLayout
	APIModule.layout = SplitNavLayout:Create(frame, {
		navWidth = 220,
		items = navItems,
		onSelect = function(key)
			APIModule:OnAPISelected(key)
		end,
	})

	-- Select first API by default
	if navItems[1] then
		-- Find first actual API (not category)
		for _, item in ipairs(navItems) do
			if not item.isCategory then
				APIModule.layout:Select(item.key)
				break
			end
		end
	end
end

function APIModule:BuildNavTree()
	local items = {}

	for _, category in ipairs(API_CATEGORIES) do
		-- Add category header
		table.insert(items, {
			key = "cat_" .. category.key,
			text = category.name,
			isCategory = true,
		})

		-- Add APIs in this category
		local apis = {}
		for apiKey, apiDef in pairs(API_DEFINITIONS) do
			if apiDef.category == category.key then
				table.insert(apis, apiDef)
			end
		end

		-- Sort APIs by name
		table.sort(apis, function(a, b)
			return a.name < b.name
		end)

		for _, apiDef in ipairs(apis) do
			local impactColor = self:GetImpactColor(apiDef.midnightImpact)
			table.insert(items, {
				key = apiDef.key,
				text = string.format("  %s%s|r", impactColor, apiDef.name),
				isAPI = true,
			})
		end
	end

	return items
end

function APIModule:GetImpactColor(impact)
	if impact == "HIGH" then
		return "|cffff4444" -- Red
	elseif impact == "MEDIUM" then
		return "|cffffaa00" -- Orange
	elseif impact == "LOW" then
		return "|cffffff00" -- Yellow
	else
		return "|cff00ff00" -- Green
	end
end

--------------------------------------------------------------------------------
-- API Selection & Details
--------------------------------------------------------------------------------

function APIModule:OnAPISelected(key)
	-- Skip category headers
	if key:find("^cat_") then
		return
	end

	local apiDef = API_DEFINITIONS[key]
	if not apiDef then
		return
	end

	self.selectedAPI = key

	-- Get or create content frame
	local contentFrame = self.layout:GetContentFrame(key)
	self:BuildAPIPanel(contentFrame, apiDef)
end

function APIModule:BuildAPIPanel(parent, apiDef)
	-- Clear previous content
	for _, child in ipairs({ parent:GetChildren() }) do
		child:Hide()
	end
	wipe(self.paramInputs)

	local yOffset = -8

	-- Header: API name and path
	local nameLabel = self:GetOrCreateLabel(parent, "nameLabel", "GameFontNormalHuge")
	nameLabel:SetPoint("TOPLEFT", 8, yOffset)
	nameLabel:SetText(apiDef.funcPath)
	yOffset = yOffset - 24

	-- Namespace and category
	local infoLabel = self:GetOrCreateLabel(parent, "infoLabel", "GameFontHighlight")
	infoLabel:SetPoint("TOPLEFT", 8, yOffset)
	local catName = ns.APICategoryLookup[apiDef.category] and ns.APICategoryLookup[apiDef.category].name
		or apiDef.category
	infoLabel:SetText("Category: " .. catName)
	yOffset = yOffset - 18

	-- Midnight impact
	local impactColor = self:GetImpactColor(apiDef.midnightImpact)
	local impactLabel = self:GetOrCreateLabel(parent, "impactLabel", "GameFontHighlight")
	impactLabel:SetPoint("TOPLEFT", 8, yOffset)
	impactLabel:SetText("Midnight Impact: " .. impactColor .. apiDef.midnightImpact .. "|r")
	yOffset = yOffset - 18

	-- Midnight note
	if apiDef.midnightNote then
		local noteLabel = self:GetOrCreateLabel(parent, "noteLabel", "GameFontHighlightSmall")
		noteLabel:SetPoint("TOPLEFT", 8, yOffset)
		noteLabel:SetPoint("RIGHT", -8, 0)
		noteLabel:SetText(string.format("|cffaaaaaa%s|r", apiDef.midnightNote))
		noteLabel:SetJustifyH("LEFT")
		noteLabel:SetWordWrap(true)
		yOffset = yOffset - (noteLabel:GetStringHeight() + 8)
	end

	-- Separator
	yOffset = yOffset - 8
	local sep1 = self:GetOrCreateSeparator(parent, "sep1")
	sep1:SetPoint("TOPLEFT", 8, yOffset)
	sep1:SetPoint("RIGHT", -8, 0)
	yOffset = yOffset - 12

	-- Parameters section
	local paramsHeader = self:GetOrCreateLabel(parent, "paramsHeader", "GameFontNormal")
	paramsHeader:SetPoint("TOPLEFT", 8, yOffset)
	paramsHeader:SetText("Parameters:")
	yOffset = yOffset - 20

	for i, param in ipairs(apiDef.params) do
		local paramRow = self:CreateParamInput(parent, param, i, yOffset)
		yOffset = yOffset - 28
	end

	-- Buttons
	yOffset = yOffset - 8
	local buttonRow = self:GetOrCreateFrame(parent, "buttonRow")
	buttonRow:SetPoint("TOPLEFT", 8, yOffset)
	buttonRow:SetSize(400, 30)

	local runBtn = self:GetOrCreateButton(buttonRow, "runBtn", "Run")
	runBtn:SetPoint("LEFT", 0, 0)
	runBtn:SetSize(80, 24)
	runBtn:SetScript("OnClick", function()
		self:RunAPI(apiDef)
	end)

	local runCatBtn = self:GetOrCreateButton(buttonRow, "runCatBtn", "Run Category")
	runCatBtn:SetPoint("LEFT", runBtn, "RIGHT", 8, 0)
	runCatBtn:SetSize(110, 24)
	runCatBtn:SetScript("OnClick", function()
		self:RunCategory(apiDef.category)
	end)

	local copyBtn = self:GetOrCreateButton(buttonRow, "copyBtn", "Copy Report")
	copyBtn:SetPoint("LEFT", runCatBtn, "RIGHT", 8, 0)
	copyBtn:SetSize(100, 24)
	copyBtn:SetScript("OnClick", function()
		self:CopyAPIReport(apiDef)
	end)

	yOffset = yOffset - 40

	-- Separator
	local sep2 = self:GetOrCreateSeparator(parent, "sep2")
	sep2:SetPoint("TOPLEFT", 8, yOffset)
	sep2:SetPoint("RIGHT", -8, 0)
	yOffset = yOffset - 12

	-- Results section
	local resultsHeader = self:GetOrCreateLabel(parent, "resultsHeader", "GameFontNormal")
	resultsHeader:SetPoint("TOPLEFT", 8, yOffset)
	resultsHeader:SetText("Results:")
	yOffset = yOffset - 20

	-- Status line
	local statusLabel = self:GetOrCreateLabel(parent, "statusLabel", "GameFontHighlight")
	statusLabel:SetPoint("TOPLEFT", 8, yOffset)
	statusLabel:SetText("Not yet run")
	parent.statusLabel = statusLabel
	yOffset = yOffset - 20

	-- Results display (MultiLineEditBox)
	local resultsBox = FenUI:CreateMultiLineEditBox(parent, {
		readOnly = true,
		background = "surfaceInset",
	})
	resultsBox:SetPoint("TOPLEFT", 8, yOffset)
	resultsBox:SetPoint("BOTTOMRIGHT", -8, 80)
	parent.resultsBox = resultsBox

	-- Notes section (at bottom)
	local notesHeader = self:GetOrCreateLabel(parent, "notesHeader", "GameFontNormal")
	notesHeader:SetPoint("BOTTOMLEFT", 8, 70)
	notesHeader:SetText("Notes:")

	local notesBox = self:GetOrCreateEditBox(parent, "notesBox")
	notesBox:SetPoint("BOTTOMLEFT", 8, 8)
	notesBox:SetPoint("BOTTOMRIGHT", -8, 8)
	notesBox:SetHeight(55)
	notesBox:SetMultiLine(true)
	notesBox:SetAutoFocus(false)

	-- Load saved notes
	local savedNotes = Mechanic.db.profile.apiTests
			and Mechanic.db.profile.apiTests[apiDef.key]
			and Mechanic.db.profile.apiTests[apiDef.key].notes
		or ""
	notesBox:SetText(savedNotes)

	notesBox:SetScript("OnTextChanged", function(self)
		APIModule:SaveNotes(apiDef.key, self:GetText())
	end)
	parent.notesBox = notesBox

	-- Restore last results if available
	if self.lastResults[apiDef.key] then
		self:DisplayResults(parent, apiDef, self.lastResults[apiDef.key])
	end
end

function APIModule:CreateParamInput(parent, param, index, yOffset)
	local row = self:GetOrCreateFrame(parent, "param_" .. index)
	row:SetPoint("TOPLEFT", 16, yOffset)
	row:SetSize(500, 24)

	local label = row.label or row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	label:SetPoint("LEFT", 0, 0)
	label:SetWidth(120)
	label:SetJustifyH("LEFT")
	label:SetText(param.name .. ":")
	row.label = label

	local input = row.input or CreateFrame("EditBox", nil, row, "InputBoxTemplate")
	input:SetPoint("LEFT", label, "RIGHT", 8, 0)
	input:SetSize(150, 20)
	input:SetAutoFocus(false)
	input:SetText(tostring(param.default or ""))
	row.input = input

	local typeLabel = row.typeLabel or row:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
	typeLabel:SetPoint("LEFT", input, "RIGHT", 8, 0)
	typeLabel:SetText("(" .. param.type .. ")")
	row.typeLabel = typeLabel

	-- Examples dropdown (if examples provided)
	if param.examples and #param.examples > 0 then
		local examplesBtn = row.examplesBtn or CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
		examplesBtn:SetPoint("LEFT", typeLabel, "RIGHT", 8, 0)
		examplesBtn:SetSize(24, 20)
		examplesBtn:SetText("▼")
		examplesBtn:SetScript("OnClick", function()
			self:ShowExamplesMenu(param, input)
		end)
		row.examplesBtn = examplesBtn

		-- Quick example buttons for common cases (show first 3)
		local xOffset = 36
		for i, example in ipairs(param.examples) do
			if i > 3 then
				break
			end -- Limit to 3 quick buttons
			local quickBtn = row["quickBtn" .. i] or CreateFrame("Button", nil, row)
			quickBtn:SetPoint("LEFT", typeLabel, "RIGHT", xOffset, 0)

			-- Create text first so we can measure it
			local btnText = quickBtn.btnText or quickBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
			btnText:SetPoint("CENTER")
			btnText:SetText("|cff88ccff" .. example.label .. "|r")
			quickBtn.btnText = btnText

			-- Size button based on text width (now that text exists)
			local textWidth = btnText:GetStringWidth()
			quickBtn:SetSize(math.max(textWidth + 16, 40), 18)

			quickBtn:SetScript("OnClick", function()
				input:SetText(tostring(example.value))
			end)
			quickBtn:SetScript("OnEnter", function(self)
				self.btnText:SetText("|cffffffff" .. example.label .. "|r")
			end)
			quickBtn:SetScript("OnLeave", function(self)
				self.btnText:SetText("|cff88ccff" .. example.label .. "|r")
			end)

			row["quickBtn" .. i] = quickBtn
			xOffset = xOffset + quickBtn:GetWidth() + 4
		end
	end

	-- Store reference for value retrieval
	self.paramInputs[param.name] = input

	row:Show()
	return row
end

function APIModule:ShowExamplesMenu(param, inputBox)
	-- Create dropdown menu for all examples
	local menu = {}
	for _, example in ipairs(param.examples) do
		table.insert(menu, {
			text = example.label .. " (" .. tostring(example.value) .. ")",
			func = function()
				inputBox:SetText(tostring(example.value))
				CloseDropDownMenus()
			end,
			notCheckable = true,
		})
	end

	-- EasyMenu is a Blizzard global available in Retail
	local menuFrame = self.examplesMenuFrame
	if not menuFrame then
		menuFrame = CreateFrame("Frame", "MechanicAPIExamplesMenu", UIParent, "UIDropDownMenuTemplate")
		self.examplesMenuFrame = menuFrame
	end
	EasyMenu(menu, menuFrame, "cursor", 0, 0, "MENU")
end

--------------------------------------------------------------------------------
-- API Execution
--------------------------------------------------------------------------------

function APIModule:RunAPI(apiDef)
	if apiDef.protected then
		self:DisplayProtectedError(apiDef)
		return
	end

	if not apiDef.func then
		self:DisplayMissingFuncError(apiDef)
		return
	end

	-- Gather parameters
	local params = {}
	for _, paramDef in ipairs(apiDef.params) do
		local input = self.paramInputs[paramDef.name]
		local value = input and input:GetText() or paramDef.default

		-- Type conversion
		if paramDef.type == "number" then
			value = tonumber(value)
		elseif paramDef.type == "boolean" then
			value = value == "true" or value == "1"
		end

		table.insert(params, value)
	end

	-- Execute API
	local startTime = debugprofilestop()
	local success, results = self:SafeCallAPI(apiDef.func, unpack(params))
	local endTime = debugprofilestop()
	local duration = (endTime - startTime)

	-- Store results
	local resultData = {
		success = success,
		results = results,
		duration = duration,
		timestamp = GetTime(),
		params = params,
	}
	self.lastResults[apiDef.key] = resultData

	-- Save to DB
	self:SaveAPIResult(apiDef.key, resultData)

	-- Display
	local contentFrame = self.layout:GetContentFrame(apiDef.key)
	self:DisplayResults(contentFrame, apiDef, resultData)
end

function APIModule:SafeCallAPI(func, ...)
	local results = { pcall(func, ...) }
	local success = table.remove(results, 1)
	return success, results
end

function APIModule:DisplayResults(parent, apiDef, resultData)
	local statusLabel = parent.statusLabel
	local resultsBox = parent.resultsBox

	if not statusLabel or not resultsBox then
		return
	end

	-- Status line
	local timeStr = date("%H:%M:%S")
	local statusText
	local secretCount = 0

	if not resultData.success then
		statusText = "|cffff0000ERROR|r"
	else
		-- Check for secrets in results
		secretCount = self:CountSecrets(resultData.results)
		if secretCount > 0 then
			statusText = string.format("|cffaa00ffSECRET|r (%d secret values)", secretCount)
		else
			statusText = "|cff00ff00PASS|r"
		end
	end

	statusLabel:SetText(
		string.format("Last Run: %s | Status: %s | Duration: %.2fms", timeStr, statusText, resultData.duration)
	)

	-- Results display
	local lines = {}

	if not resultData.success then
		table.insert(lines, "Error: " .. tostring(resultData.results[1]))
	else
		table.insert(lines, "Returns:")
		for i, retDef in ipairs(apiDef.returns) do
			local value = resultData.results[i]
			local valueStr = self:FormatValue(value, retDef)
			table.insert(lines, string.format("  %s = %s", retDef.name, valueStr))
		end
	end

	resultsBox:SetText(table.concat(lines, "\n"))
end

function APIModule:FormatValue(value, retDef)
	if value == nil then
		return "nil"
	end

	-- Check if secret
	local isSecret = issecretvalue and issecretvalue(value)
	local secretTag = isSecret and " |cffaa00ff(SECRET)|r" or ""

	if type(value) == "table" then
		local parts = {}
		table.insert(parts, "{")

		if retDef and retDef.fields then
			for _, fieldName in ipairs(retDef.fields) do
				local fieldValue = value[fieldName]
				local fieldSecret = issecretvalue and issecretvalue(fieldValue)
				local fieldSecretTag = fieldSecret and " |cffaa00ff(SECRET)|r" or ""
				table.insert(parts, string.format("  .%s = %s%s", fieldName, tostring(fieldValue), fieldSecretTag))
			end
		else
			for k, v in pairs(value) do
				local fieldSecret = issecretvalue and issecretvalue(v)
				local fieldSecretTag = fieldSecret and " |cffaa00ff(SECRET)|r" or ""
				table.insert(parts, string.format("  .%s = %s%s", tostring(k), tostring(v), fieldSecretTag))
			end
		end

		table.insert(parts, "}")
		return table.concat(parts, "\n")
	end

	return string.format("%s%s", tostring(value), secretTag)
end

function APIModule:CountSecrets(results)
	local count = 0
	if not results then
		return 0
	end
	for _, value in ipairs(results) do
		if issecretvalue and issecretvalue(value) then
			count = count + 1
		elseif type(value) == "table" then
			for _, v in pairs(value) do
				if issecretvalue and issecretvalue(v) then
					count = count + 1
				end
			end
		end
	end
	return count
end

--------------------------------------------------------------------------------
-- Category Batch Testing
--------------------------------------------------------------------------------

function APIModule:RunCategory(categoryKey)
	local count = 0

	for apiKey, apiDef in pairs(API_DEFINITIONS) do
		if apiDef.category == categoryKey and not apiDef.protected then
			self:RunAPI(apiDef)
			count = count + 1
		end
	end

	Mechanic:Print(string.format("Ran %d APIs in category", count))
end

--------------------------------------------------------------------------------
-- Copy Report
--------------------------------------------------------------------------------

function APIModule:CopyAPIReport(apiDef)
	local lines = {}

	-- Header
	table.insert(lines, "=== Mechanic API Report: " .. apiDef.funcPath .. " ===")
	local header = Mechanic:GetEnvironmentHeader()
	if header then
		table.insert(lines, header)
	end
	table.insert(lines, "---")

	-- API info
	table.insert(lines, "API: " .. apiDef.funcPath)
	table.insert(lines, "Category: " .. apiDef.category)
	table.insert(lines, "Midnight Impact: " .. apiDef.midnightImpact)
	if apiDef.midnightNote then
		table.insert(lines, "Note: " .. apiDef.midnightNote)
	end
	table.insert(lines, "")

	-- Results
	local resultData = self.lastResults[apiDef.key]
	if resultData then
		table.insert(lines, "Last Test:")
		table.insert(lines, string.format("  Duration: %.2fms", resultData.duration))
		table.insert(lines, string.format("  Status: %s", (resultData.success and "SUCCESS" or "ERROR")))
		table.insert(lines, string.format("  Secret Values: %d", self:CountSecrets(resultData.results or {})))
		table.insert(lines, "")
		table.insert(lines, "Results:")
		table.insert(lines, self:FormatResultsPlainText(apiDef, resultData))
	else
		table.insert(lines, "Not yet tested.")
	end

	-- Notes
	local notes = Mechanic.db.profile.apiTests
		and Mechanic.db.profile.apiTests[apiDef.key]
		and Mechanic.db.profile.apiTests[apiDef.key].notes
	if notes and notes ~= "" then
		table.insert(lines, "")
		table.insert(lines, "Notes:")
		table.insert(lines, notes)
	end

	Mechanic:ShowCopyDialog(table.concat(lines, "\n"))
end

function APIModule:FormatResultsPlainText(apiDef, resultData)
	local lines = {}

	if not resultData.success then
		table.insert(lines, "  Error: " .. tostring(resultData.results[1]))
	else
		for i, retDef in ipairs(apiDef.returns) do
			local value = resultData.results[i]
			local valueStr = self:FormatValuePlainText(value, retDef)
			table.insert(lines, string.format("  %s = %s", retDef.name, valueStr))
		end
	end

	return table.concat(lines, "\n")
end

function APIModule:FormatValuePlainText(value, retDef)
	if value == nil then
		return "nil"
	end

	local isSecret = issecretvalue and issecretvalue(value)
	local secretTag = isSecret and " (SECRET)" or ""

	if type(value) == "table" then
		local parts = {}
		if retDef and retDef.fields then
			for _, fieldName in ipairs(retDef.fields) do
				local fieldValue = value[fieldName]
				local fieldSecret = issecretvalue and issecretvalue(fieldValue)
				local fieldSecretTag = fieldSecret and " (SECRET)" or ""
				table.insert(parts, string.format("    .%s = %s%s", fieldName, tostring(fieldValue), fieldSecretTag))
			end
		else
			for k, v in pairs(value) do
				local fieldSecret = issecretvalue and issecretvalue(v)
				local fieldSecretTag = fieldSecret and " (SECRET)" or ""
				table.insert(parts, string.format("    .%s = %s%s", tostring(k), tostring(v), fieldSecretTag))
			end
		end
		return "{\n" .. table.concat(parts, "\n") .. "\n  }"
	end

	return string.format("%s%s", tostring(value), secretTag)
end

function APIModule:GetCategoryReport(categoryKey)
	local lines = {}
	local catName = ns.APICategoryLookup[categoryKey] and ns.APICategoryLookup[categoryKey].name or categoryKey

	table.insert(lines, "=== Mechanic API Report: " .. catName .. " ===")
	local header = Mechanic:GetEnvironmentHeader()
	if header then
		table.insert(lines, header)
	end
	table.insert(lines, "---")

	local passCount, secretCount, errorCount, untestedCount = 0, 0, 0, 0

	-- Get APIs in this category
	local apis = {}
	for apiKey, apiDef in pairs(API_DEFINITIONS) do
		if apiDef.category == categoryKey then
			table.insert(apis, apiDef)
		end
	end

	-- Sort APIs by name
	table.sort(apis, function(a, b)
		return a.name < b.name
	end)

	for _, apiDef in ipairs(apis) do
		local resultData = self.lastResults[apiDef.key]
		local status

		if not resultData then
			status = "----"
			untestedCount = untestedCount + 1
		elseif not resultData.success then
			status = "FAIL"
			errorCount = errorCount + 1
		elseif self:CountSecrets(resultData.results or {}) > 0 then
			status = "SCRT"
			secretCount = secretCount + 1
		else
			status = "PASS"
			passCount = passCount + 1
		end

		table.insert(lines, string.format("[%s] %s", status, apiDef.funcPath))
	end

	table.insert(lines, "---")
	table.insert(
		lines,
		string.format(
			"Summary: %d PASS, %d SECRET, %d FAIL, %d untested",
			passCount,
			secretCount,
			errorCount,
			untestedCount
		)
	)

	return table.concat(lines, "\n")
end

--------------------------------------------------------------------------------
-- Persistence
--------------------------------------------------------------------------------

function APIModule:SaveAPIResult(apiKey, resultData)
	Mechanic.db.profile.apiTests = Mechanic.db.profile.apiTests or {}
	Mechanic.db.profile.apiTests[apiKey] = Mechanic.db.profile.apiTests[apiKey] or {}

	local saved = Mechanic.db.profile.apiTests[apiKey]
	saved.lastRun = resultData.timestamp
	saved.lastResult = resultData.success and (self:CountSecrets(resultData.results or {}) > 0 and "secret" or "pass")
		or "error"
	saved.lastParams = resultData.params
end

function APIModule:SaveNotes(apiKey, notes)
	Mechanic.db.profile.apiTests = Mechanic.db.profile.apiTests or {}
	Mechanic.db.profile.apiTests[apiKey] = Mechanic.db.profile.apiTests[apiKey] or {}
	Mechanic.db.profile.apiTests[apiKey].notes = notes
end

--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

function APIModule:GetOrCreateLabel(parent, key, font)
	if parent[key] then
		return parent[key]
	end
	local label = parent:CreateFontString(nil, "OVERLAY", font or "GameFontNormal")
	parent[key] = label
	return label
end

function APIModule:GetOrCreateSeparator(parent, key)
	if parent[key] then
		return parent[key]
	end
	local sep = parent:CreateTexture(nil, "BACKGROUND")
	sep:SetHeight(1)
	sep:SetColorTexture(1, 1, 1, 0.2)
	parent[key] = sep
	return sep
end

function APIModule:GetOrCreateFrame(parent, key)
	if parent[key] then
		return parent[key]
	end
	local frame = CreateFrame("Frame", nil, parent)
	parent[key] = frame
	return frame
end

function APIModule:GetOrCreateButton(parent, key, text)
	if parent[key] then
		parent[key]:SetText(text)
		return parent[key]
	end
	local btn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	btn:SetText(text)
	parent[key] = btn
	return btn
end

function APIModule:GetOrCreateEditBox(parent, key)
	if parent[key] then
		return parent[key]
	end
	local box = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
	parent[key] = box
	return box
end

function APIModule:DisplayProtectedError(apiDef)
	local contentFrame = self.layout:GetContentFrame(apiDef.key)
	if contentFrame and contentFrame.statusLabel then
		contentFrame.statusLabel:SetText("|cffff0000PROTECTED|r - Cannot call from addon code")
	end
	if contentFrame and contentFrame.resultsBox then
		contentFrame.resultsBox:SetText(
			"This API is protected and cannot be called from addon code in Midnight.\n\nConsider using the reskin strategy with Blizzard frames."
		)
	end
end

function APIModule:DisplayMissingFuncError(apiDef)
	local contentFrame = self.layout:GetContentFrame(apiDef.key)
	if contentFrame and contentFrame.statusLabel then
		contentFrame.statusLabel:SetText("|cffff8800MISSING|r - Function not found")
	end
	if contentFrame and contentFrame.resultsBox then
		contentFrame.resultsBox:SetText(
			"Function not available: "
				.. apiDef.funcPath
				.. "\n\nThis may be a newer API not yet available in this WoW version."
		)
	end
end

--------------------------------------------------------------------------------
-- Tab Lifecycle
--------------------------------------------------------------------------------

function APIModule:OnShow()
	-- Refresh current selection if any
	if self.selectedAPI then
		local contentFrame = self.layout:GetContentFrame(self.selectedAPI)
		local apiDef = API_DEFINITIONS[self.selectedAPI]
		if contentFrame and apiDef then
			self:BuildAPIPanel(contentFrame, apiDef)
		end
	end
end

function APIModule:OnHide()
	-- Cleanup if needed
end

function APIModule:GetCopyText(includeHeader)
	if self.selectedAPI then
		local apiDef = API_DEFINITIONS[self.selectedAPI]
		if apiDef then
			return self:GetCategoryReport(apiDef.category)
		end
	end
	return "No API selected."
end

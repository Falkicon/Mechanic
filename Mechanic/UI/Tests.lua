-- UI/Tests.lua
-- !Mechanic - Tests Tab Module (Phase 2)

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local ICON_PATH = [[Interface\AddOns\Mechanic\Assets\Icons\]]
local TestsModule = {}
Mechanic.Tests = TestsModule

local STATUS_COLORS = Mechanic.Utils.Colors.Status

-- Tree values are prefixed by node kind so ids and categories containing ":" stay unambiguous.
local TEST_NODE_PATTERN = "^t:([^:]+):(.+)$"

--------------------------------------------------------------------------------
-- Provider access
--
-- Test providers are other addons' callbacks: every call is protected, and the
-- definition list is fetched once per pass (getAll can be expensive).
--------------------------------------------------------------------------------

local function protectedCall(fn, ...)
	if type(fn) ~= "function" then
		return nil
	end
	local ok, result = pcall(fn, ...)
	if ok then
		return result
	end
	return nil
end

-- Registered addons that expose tests, in a stable (alphabetical) order.
local function getProviders()
	local providers = {}
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if not MechanicLib then
		return providers
	end
	for addonName in pairs(MechanicLib:GetRegistered()) do
		if MechanicLib:HasCapability(addonName, "tests") then
			local tests = MechanicLib:GetCapability(addonName, "tests")
			if tests then
				table.insert(providers, { name = addonName, tests = tests })
			end
		end
	end
	table.sort(providers, function(a, b)
		return a.name < b.name
	end)
	return providers
end

-- Definitions from getAll(), accepting both {def = {...}} and direct {...} entries.
local function getDefinitions(tests)
	local definitions = {}
	local all = protectedCall(tests.getAll)
	if type(all) == "table" then
		for _, entry in ipairs(all) do
			local test = type(entry) == "table" and (entry.def or entry)
			if type(test) == "table" and test.id then
				table.insert(definitions, test)
			end
		end
	end
	return definitions
end

local function getResult(tests, id)
	return tests.getResult and protectedCall(tests.getResult, id) or nil
end

-- Totals across all providers
local function summarize()
	local total, passed, failed, pending = 0, 0, 0, 0
	for _, provider in ipairs(getProviders()) do
		local tests = provider.tests
		for _, test in ipairs(getDefinitions(tests)) do
			total = total + 1
			local result = getResult(tests, test.id)
			if result then
				if result.passed == true then
					passed = passed + 1
				elseif result.passed == false then
					failed = failed + 1
				else
					pending = pending + 1
				end
			end
		end
	end
	return total, passed, failed, pending
end

TestsModule.selectedAddon = nil
TestsModule.selectedTest = nil

function Mechanic:InitializeTests()
	if TestsModule.frame then
		return
	end

	local parent = self.frame.moduleContent
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetAllPoints()
	TestsModule.frame = frame

	-- Toolbar
	local toolbar = FenUI:CreateToolbar(frame, {
		height = 32,
		padding = 4,
	})
	toolbar:SetPoint("TOPLEFT", 0, 0)
	toolbar:SetPoint("TOPRIGHT", 0, 0)

	local runSelectedBtn = toolbar:AddButton({
		text = L["Run Selected"],
		width = 110,
		onClick = function()
			TestsModule:RunSelected()
		end,
	})

	local runAllBtn = toolbar:AddButton({
		text = L["Run All Auto"],
		width = 110,
		onClick = function()
			TestsModule:RunAllAuto()
		end,
	})

	toolbar:AddSpacer("flex")

	toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-export",
		size = 24,
		tooltip = L["Export Button"],
		onClick = function()
			TestsModule:Export()
		end,
	})

	local clearBtn = toolbar:AddButton({
		text = L["Clear"],
		width = 60,
		onClick = function()
			TestsModule:ClearResults()
		end,
	})

	-- Help Button
	toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-help",
		size = 24,
		tooltip = L["Help"],
		onClick = function()
			Mechanic.Utils:ShowHelpDialog("tests")
		end,
	})

	-- Summary Bar
	local testSummaryBar = CreateFrame("Frame", nil, frame)
	testSummaryBar:SetHeight(24)
	testSummaryBar:SetPoint("BOTTOMLEFT", 8, 4)
	testSummaryBar:SetPoint("BOTTOMRIGHT", -8, 4)
	TestsModule.summaryBar = testSummaryBar

	local summaryLabel = testSummaryBar:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
	summaryLabel:SetPoint("LEFT", 0, 0)
	TestsModule.summaryLabel = summaryLabel

	-- Tree Panel (replacing AceGUI-TreeGroup)
	local tree = FenUI:CreateTree(frame, {
		onSelect = function(value)
			-- Only test nodes ("t:<addon>:<id>") are selectable; ids may contain ":"
			local addonName, testId = value:match(TEST_NODE_PATTERN)
			if addonName then
				TestsModule:OnTestSelected(addonName, testId)
			end
		end,
	})
	tree:SetPoint("TOPLEFT", toolbar, "BOTTOMLEFT", 0, -4)
	tree:SetPoint("BOTTOMLEFT", testSummaryBar, "TOPLEFT", 0, 4)
	tree:SetWidth(200)
	TestsModule.tree = tree

	-- Right Panel: Details
	local detailsFrame = CreateFrame("Frame", nil, frame)
	detailsFrame:SetPoint("TOPLEFT", tree, "TOPRIGHT", 4, 0)
	detailsFrame:SetPoint("BOTTOMRIGHT", testSummaryBar, "TOPRIGHT", 0, 4)
	TestsModule.detailsFrame = detailsFrame

	local nameLabel = detailsFrame:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontTitle"))
	nameLabel:SetTextColor(FenUI:GetColorRGB("textHeading"))
	nameLabel:SetPoint("TOPLEFT", 8, -8)
	nameLabel:SetText(L["Select a test"])
	TestsModule.nameLabel = nameLabel

	local categoryLabel = detailsFrame:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
	categoryLabel:SetPoint("TOPLEFT", nameLabel, "BOTTOMLEFT", 0, -4)
	TestsModule.categoryLabel = categoryLabel

	local statusLabel = detailsFrame:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontBody"))
	statusLabel:SetPoint("TOPLEFT", categoryLabel, "BOTTOMLEFT", 0, -8)
	TestsModule.statusLabel = statusLabel

	local durationLabel = detailsFrame:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
	durationLabel:SetPoint("LEFT", statusLabel, "RIGHT", 16, 0)
	TestsModule.durationLabel = durationLabel

	local descriptionLabel = detailsFrame:CreateFontString(nil, "OVERLAY", FenUI:GetFont("fontSmall"))
	descriptionLabel:SetPoint("TOPLEFT", statusLabel, "BOTTOMLEFT", 0, -8)
	descriptionLabel:SetWidth(400)
	descriptionLabel:SetJustifyH("LEFT")
	TestsModule.descriptionLabel = descriptionLabel

	local detailsBox = FenUI:CreateMultiLineEditBox(detailsFrame, {
		readOnly = true,
		background = "surfaceInset",
		font = "fontMono",
	})
	detailsBox:SetPoint("TOPLEFT", descriptionLabel, "BOTTOMLEFT", 0, -12)
	detailsBox:SetPoint("BOTTOMRIGHT", -8, 8)
	TestsModule.detailsBox = detailsBox

	-- Export Mode: Removed internal exportBox in favor of global dialog
	TestsModule:RefreshTree()
	TestsModule:UpdateSummary()
end

function TestsModule:OnShow()
	self:RefreshTree()
	self:UpdateSummary()
end

function TestsModule:OnHide() end

function TestsModule:RefreshTree()
	if not self.frame or not self.tree then
		return
	end
	local tree = self:BuildTree()
	self.tree:SetData(tree)
end

function TestsModule:BuildTree()
	local tree = {}
	local textParts = {}

	for _, provider in ipairs(getProviders()) do
		local addonName, tests = provider.name, provider.tests
		local addonNode = {
			text = addonName,
			value = "a:" .. addonName,
			children = {},
			expanded = true,
		}

		local categories = protectedCall(tests.getCategories)
		if type(categories) == "table" then
			-- One getAll() per addon, grouped by category
			local byCategory = {}
			for _, test in ipairs(getDefinitions(tests)) do
				byCategory[test.category] = byCategory[test.category] or {}
				table.insert(byCategory[test.category], test)
			end

			for _, category in ipairs(categories) do
				local categoryNode = {
					text = category,
					value = string.format("c:%s:%s", addonName, category),
					children = {},
					expanded = true,
				}

				for _, test in ipairs(byCategory[category] or {}) do
					wipe(textParts)
					table.insert(textParts, self:GetStatusIcon(getResult(tests, test.id)))
					table.insert(textParts, " ")
					table.insert(textParts, tostring(test.name or test.id))

					table.insert(categoryNode.children, {
						text = table.concat(textParts),
						value = string.format("t:%s:%s", addonName, test.id),
					})
				end

				table.insert(addonNode.children, categoryNode)
			end
		end

		table.insert(tree, addonNode)
	end

	return tree
end

function TestsModule:GetStatusIcon(result)
	if not result then
		return string.format("%s[-]|r", STATUS_COLORS.not_run) -- Not run
	elseif result.passed == true then
		return string.format("%s[+]|r", STATUS_COLORS.pass) -- Passed
	elseif result.passed == false then
		return string.format("%s[x]|r", STATUS_COLORS.fail) -- Failed
	else
		return string.format("%s[?]|r", STATUS_COLORS.pending) -- Pending
	end
end

function TestsModule:OnTestSelected(addonName, testId)
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if not MechanicLib or not MechanicLib:HasCapability(addonName, "tests") then
		return
	end

	local tests = MechanicLib:GetCapability(addonName, "tests")
	if not tests then
		return
	end

	-- Find test definition
	local testDef = nil
	for _, test in ipairs(getDefinitions(tests)) do
		if test.id == testId then
			testDef = test
			break
		end
	end

	if not testDef then
		return
	end

	-- Only a real test becomes the selection that "Run Selected" acts on
	self.selectedAddon = addonName
	self.selectedTest = testId

	-- Update display
	self:UpdateDetailsPanel(testDef, getResult(tests, testId))
end

function TestsModule:UpdateDetailsPanel(testDef, result)
	local typeTag = testDef.type == "manual" and "|cff888888(Manual)|r" or "|cff88ff88(Auto)|r"
	self.nameLabel:SetText(string.format("%s %s", testDef.name, typeTag))
	self.categoryLabel:SetText(string.format(L["Category: %s"], testDef.category))

	if result then
		local statusColor = result.passed == true and STATUS_COLORS.pass
			or (result.passed == false and STATUS_COLORS.fail or STATUS_COLORS.pending)
		local statusText = result.passed == true and L["PASSED"]
			or (result.passed == false and L["FAILED"] or L["PENDING"])
		self.statusLabel:SetText(string.format(L["Status: %s%s|r"], statusColor, statusText))

		if result.duration then
			self.durationLabel:SetText(string.format(L["Duration: %.3fs"], result.duration))
		else
			self.durationLabel:SetText("")
		end

		local details = {}
		if result.message then
			table.insert(details, string.format(L["Message: %s"], result.message))
			table.insert(details, "")
		end

		-- NEW: Details array rendering per Phase 5
		if result.details and #result.details > 0 then
			table.insert(details, L["Details:"])
			for _, detail in ipairs(result.details) do
				local statusColor = STATUS_COLORS[detail.status] or STATUS_COLORS.default
				local statusIcon = self:GetDetailStatusIcon(detail.status)
				table.insert(
					details,
					string.format(L["  %s %s: %s%s|r"], statusIcon, detail.label, statusColor, detail.value)
				)
			end
			table.insert(details, "")
		end

		if result.logs and #result.logs > 0 then
			table.insert(details, L["Captured Logs:"])
			for _, log in ipairs(result.logs) do
				table.insert(details, string.format(L["  %s"], log))
			end
		end

		if self.detailsBox then
			self.detailsBox:SetText(table.concat(details, "\n"))
		end
	else
		self.statusLabel:SetText(L["Status: |cff888888Not run|r"])
		self.durationLabel:SetText("")
		if self.detailsBox then
			self.detailsBox:SetText("")
		end
	end

	if testDef.description then
		self.descriptionLabel:SetText(testDef.description)
	else
		self.descriptionLabel:SetText("")
	end
end

-- Helper for status icons per Phase 5
function TestsModule:GetDetailStatusIcon(status)
	if status == "pass" then
		return string.format("%s[+]|r", STATUS_COLORS.pass)
	elseif status == "warn" then
		return string.format("%s[!]|r", STATUS_COLORS.warn)
	elseif status == "fail" then
		return string.format("%s[x]|r", STATUS_COLORS.fail)
	else
		return string.format("%s[-]|r", STATUS_COLORS.default)
	end
end

function TestsModule:RunSelected()
	if not self.selectedAddon or not self.selectedTest then
		Mechanic:Print(L["No test selected."])
		return
	end

	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib and MechanicLib:HasCapability(self.selectedAddon, "tests") then
		local tests = MechanicLib:GetCapability(self.selectedAddon, "tests")
		if tests and tests.run then
			local ok, err = pcall(tests.run, self.selectedTest)
			if not ok then
				Mechanic:Print(string.format("%s: %s", tostring(self.selectedTest), tostring(err)))
			end

			-- PERSISTENCE: Use central hub sync
			Mechanic:SyncAllAddonData()

			self:RefreshTree()
			self:OnTestSelected(self.selectedAddon, self.selectedTest)
			self:UpdateSummary()
		end
	end
end

function TestsModule:RunAllAuto()
	local totalPassed, totalTests = 0, 0
	for _, provider in ipairs(getProviders()) do
		local tests = provider.tests
		if tests.runAll then
			local ok, passed, total = pcall(tests.runAll)
			if ok then
				totalPassed = totalPassed + (tonumber(passed) or 0)
				totalTests = totalTests + (tonumber(total) or 0)
			else
				Mechanic:Print(string.format("%s: %s", provider.name, tostring(passed)))
			end
		elseif tests.getAll and tests.run then
			-- Fallback: iterate over all tests and run the ones that are 'auto'
			for _, test in ipairs(getDefinitions(tests)) do
				if test.type ~= "manual" then
					totalTests = totalTests + 1
					local success, result = pcall(tests.run, test.id)
					local isPassed = success and ((type(result) == "table" and result.passed) or (result == true))
					if isPassed then
						totalPassed = totalPassed + 1
					end
				end
			end
		end
	end

	-- PERSISTENCE: One big sync after running all tests
	Mechanic:SyncAllAddonData()

	Mechanic:Print(string.format(L["Tests complete: %d/%d passed"], totalPassed, totalTests))
	self:RefreshTree()
	self:UpdateSummary()
end

function TestsModule:ClearResults()
	for _, provider in ipairs(getProviders()) do
		protectedCall(provider.tests.clearResults)
	end
	self:RefreshTree()
	self:UpdateSummary()
	self.statusLabel:SetText(L["Status: |cff888888Not run|r"])
	if self.detailsBox then
		self.detailsBox:SetText("")
	end
end

function TestsModule:UpdateSummary()
	if not self.summaryLabel then
		return
	end
	local total, passed, failed, pending = summarize()

	self.summaryLabel:SetText(
		string.format(L["Total: %d | Passed: %d | Failed: %d | Pending: %d"], total, passed, failed, pending)
	)
end

function TestsModule:Export()
	-- The export always covers every registered addon, so the title says so
	local title = string.format(
		"%s : %s : %s",
		tostring(L["Tests"] or "Tests"),
		tostring(L["All"] or "All"),
		tostring(L["Export"] or "Export")
	)
	local text = self:GetCopyText(Mechanic.db.profile.includeEnvHeader)
	Mechanic.Utils:ShowExportDialog(title, text)
end

-- "[PASS]"/"[FAIL]"/"[PEND]"/"[----]" tag plus the trailing detail text for one result
local function describeResult(result)
	if not result then
		return "[----]", ""
	end
	if result.passed == true then
		return "[PASS]", result.duration and string.format(" (%.3fs)", result.duration) or ""
	end
	local status = result.passed == false and "[FAIL]" or "[PEND]"
	local fallback = result.passed == false and "Unknown Error" or "Pending"
	return status, result.message and string.format(" - %s", tostring(result.message or fallback)) or ""
end

function TestsModule:GetCopyText(includeHeader)
	local lines = {}

	if includeHeader then
		local header = Mechanic:GetEnvironmentHeader()
		if header then
			table.insert(lines, header)
			local total, passed, failed, pending = summarize()
			table.insert(
				lines,
				string.format(
					L["Result: %d/%d passed, %d failed, %d pending"] or "Result: %d/%d passed, %d failed, %d pending",
					passed,
					total,
					failed,
					pending
				)
			)
			table.insert(lines, "---")
		end
	end

	for _, provider in ipairs(getProviders()) do
		local tests = provider.tests
		local categories = protectedCall(tests.getCategories)
		if type(categories) == "table" then
			local definitions = getDefinitions(tests)
			for _, category in ipairs(categories) do
				table.insert(
					lines,
					string.format(L["%s > %s"] or "%s > %s", tostring(provider.name), tostring(category or "Unknown"))
				)

				for _, test in ipairs(definitions) do
					if test.category == category then
						local result = getResult(tests, test.id)
						local status, detail = describeResult(result)
						table.insert(
							lines,
							string.format("  %s %s%s", status, tostring(test.name or "Unknown"), detail)
						)

						-- Include details array in copy per Phase 5
						if result and result.details and #result.details > 0 then
							for _, d in ipairs(result.details) do
								local statusTag = d.status and string.upper(d.status) or "INFO"
								table.insert(
									lines,
									string.format(
										"    [%s] %s: %s",
										tostring(statusTag),
										tostring(d.label or "Detail"),
										tostring(d.value or "nil")
									)
								)
							end
						end
					end
				end
			end
		end
	end

	return table.concat(lines, "\n")
end


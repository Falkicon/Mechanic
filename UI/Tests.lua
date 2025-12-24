-- UI/Tests.lua
-- !Mechanic - Tests Tab Module (Phase 2)

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local TestsModule = {}
Mechanic.Tests = TestsModule

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
		text = "Run Selected",
		width = 110,
		onClick = function()
			TestsModule:RunSelected()
		end,
	})

	local runAllBtn = toolbar:AddButton({
		text = "Run All Auto",
		width = 110,
		onClick = function()
			TestsModule:RunAllAuto()
		end,
	})

	toolbar:AddSpacer("flex")

	local clearBtn = toolbar:AddButton({
		text = "Clear",
		width = 60,
		onClick = function()
			TestsModule:ClearResults()
		end,
	})

	-- Summary Bar
	local summaryBar = CreateFrame("Frame", nil, frame)
	summaryBar:SetHeight(24)
	summaryBar:SetPoint("BOTTOMLEFT", 0, 0)
	summaryBar:SetPoint("BOTTOMRIGHT", 0, 0)
	local summaryText = summaryBar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	summaryText:SetPoint("LEFT", 8, 0)
	summaryText:SetText("Total: 0 | Passed: 0 | Failed: 0 | Pending: 0")
	TestsModule.summaryLabel = summaryText

	-- Split Container using AceGUI (since FenUI doesn't have a tree/split yet)
	local AceGUI = LibStub("AceGUI-3.0")
	local container = AceGUI:Create("SimpleGroup")
	container:SetLayout("Fill")
	container.frame:SetParent(frame)
	container.frame:SetPoint("TOPLEFT", toolbar, "BOTTOMLEFT", 0, -4)
	container.frame:SetPoint("BOTTOMRIGHT", summaryBar, "TOPRIGHT", 0, 4)
	container.frame:Show()

	local treeGroup = AceGUI:Create("TreeGroup")
	treeGroup:SetLayout("Fill")
	treeGroup:SetCallback("OnGroupSelected", function(widget, event, value)
		local parts = { strsplit(":", value) }
		if #parts == 2 then
			TestsModule:OnTestSelected(parts[1], parts[2])
		end
	end)
	container:AddChild(treeGroup)
	TestsModule.treeGroup = treeGroup

	-- Right Panel: Details (Using FenUI inside the AceGUI TreeGroup content)
	local detailsFrame = CreateFrame("Frame", nil, treeGroup.content)
	detailsFrame:SetAllPoints()

	local nameLabel = detailsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	nameLabel:SetPoint("TOPLEFT", 8, -8)
	nameLabel:SetText("Select a test")
	TestsModule.nameLabel = nameLabel

	local categoryLabel = detailsFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	categoryLabel:SetPoint("TOPLEFT", nameLabel, "BOTTOMLEFT", 0, -4)
	TestsModule.categoryLabel = categoryLabel

	local statusLabel = detailsFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	statusLabel:SetPoint("TOPLEFT", categoryLabel, "BOTTOMLEFT", 0, -8)
	TestsModule.statusLabel = statusLabel

	local durationLabel = detailsFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	durationLabel:SetPoint("LEFT", statusLabel, "RIGHT", 16, 0)
	TestsModule.durationLabel = durationLabel

	local descriptionLabel = detailsFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	descriptionLabel:SetPoint("TOPLEFT", statusLabel, "BOTTOMLEFT", 0, -8)
	descriptionLabel:SetWidth(400)
	descriptionLabel:SetJustifyH("LEFT")
	TestsModule.descriptionLabel = descriptionLabel

	local detailsBox = FenUI:CreateMultiLineEditBox(detailsFrame, {
		readOnly = true,
		background = "surfaceInset",
	})
	detailsBox:SetPoint("TOPLEFT", descriptionLabel, "BOTTOMLEFT", 0, -12)
	detailsBox:SetPoint("BOTTOMRIGHT", -8, 8)
	TestsModule.detailsBox = detailsBox

	TestsModule:RefreshTree()
	TestsModule:UpdateSummary()
end

function TestsModule:RefreshTree()
	local tree = self:BuildTree()
	self.treeGroup:SetTree(tree)
end

function TestsModule:BuildTree()
	local tree = {}
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if not MechanicLib then
		return tree
	end

	local textParts = {}

	for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
		if capabilities.tests then
			local addonNode = {
				text = addonName,
				value = addonName,
				children = {},
			}

			-- Get categories
			if capabilities.tests.getCategories then
				local categories = capabilities.tests.getCategories()
				for _, category in ipairs(categories) do
					local categoryNode = {
						text = category,
						value = string.format("%s:%s", addonName, category),
						children = {},
					}

					-- Get tests in category
					if capabilities.tests.getAll then
						local allTests = capabilities.tests.getAll()
						for _, entry in ipairs(allTests) do
							local test = entry.def
							if test.category == category then
								local result = capabilities.tests.getResult and capabilities.tests.getResult(test.id)
								local icon = self:GetStatusIcon(result)

								wipe(textParts)
								table.insert(textParts, icon)
								table.insert(textParts, " ")
								table.insert(textParts, test.name)

								table.insert(categoryNode.children, {
									text = table.concat(textParts),
									value = string.format("%s:%s", addonName, test.id),
								})
							end
						end
					end

					table.insert(addonNode.children, categoryNode)
				end
			end

			table.insert(tree, addonNode)
		end
	end

	return tree
end

function TestsModule:GetStatusIcon(result)
	if not result then
		return "|cff888888[-]|r" -- Not run
	elseif result.passed == true then
		return "|cff00ff00[✓]|r" -- Passed
	elseif result.passed == false then
		return "|cffff0000[✗]|r" -- Failed
	else
		return "|cff88ccff[~]|r" -- Pending
	end
end

function TestsModule:OnTestSelected(addonName, testId)
	self.selectedAddon = addonName
	self.selectedTest = testId

	local MechanicLib = LibStub("MechanicLib-1.0", true)
	local capabilities = MechanicLib and MechanicLib:GetRegistered()[addonName]
	if not capabilities or not capabilities.tests then
		return
	end

	-- Find test definition
	local testDef = nil
	if capabilities.tests.getAll then
		for _, entry in ipairs(capabilities.tests.getAll()) do
			if entry.def.id == testId then
				testDef = entry.def
				break
			end
		end
	end

	if not testDef then
		return
	end

	-- Get result
	local result = capabilities.tests.getResult and capabilities.tests.getResult(testId)

	-- Update display
	self:UpdateDetailsPanel(testDef, result)
end

function TestsModule:UpdateDetailsPanel(testDef, result)
	local typeTag = testDef.type == "manual" and "|cff888888(Manual)|r" or "|cff88ff88(Auto)|r"
	self.nameLabel:SetText(testDef.name .. " " .. typeTag)
	self.categoryLabel:SetText("Category: " .. testDef.category)

	if result then
		local statusColor = result.passed == true and "|cff00ff00"
			or (result.passed == false and "|cffff0000" or "|cffffcc00")
		local statusText = result.passed == true and "PASSED" or (result.passed == false and "FAILED" or "PENDING")
		self.statusLabel:SetText("Status: " .. statusColor .. statusText .. "|r")

		if result.duration then
			self.durationLabel:SetText(string.format("Duration: %.3fs", result.duration))
		else
			self.durationLabel:SetText("")
		end

		local details = {}
		if result.message then
			table.insert(details, "Message: " .. result.message)
		end
		if result.logs and #result.logs > 0 then
			table.insert(details, "")
			table.insert(details, "Captured Logs:")
			for _, log in ipairs(result.logs) do
				table.insert(details, "  " .. log)
			end
		end
		if self.detailsBox then
			self.detailsBox:SetText(table.concat(details, "\n"))
		end
	else
		self.statusLabel:SetText("Status: |cff888888Not run|r")
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

function TestsModule:RunSelected()
	if not self.selectedAddon or not self.selectedTest then
		Mechanic:Print("No test selected.")
		return
	end

	local MechanicLib = LibStub("MechanicLib-1.0", true)
	local capabilities = MechanicLib and MechanicLib:GetRegistered()[self.selectedAddon]
	if capabilities and capabilities.tests and capabilities.tests.run then
		capabilities.tests.run(self.selectedTest)
		self:RefreshTree()
		self:OnTestSelected(self.selectedAddon, self.selectedTest)
		self:UpdateSummary()
	end
end

function TestsModule:RunAllAuto()
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if not MechanicLib then
		return
	end

	local totalPassed, totalTests = 0, 0
	for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
		if capabilities.tests and capabilities.tests.runAll then
			local passed, total = capabilities.tests.runAll()
			totalPassed = totalPassed + passed
			totalTests = totalTests + total
		end
	end

	Mechanic:Print(string.format("Tests complete: %d/%d passed", totalPassed, totalTests))
	self:RefreshTree()
	self:UpdateSummary()
end

function TestsModule:ClearResults()
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if not MechanicLib then
		return
	end

	for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
		if capabilities.tests and capabilities.tests.clearResults then
			capabilities.tests.clearResults()
		end
	end
	self:RefreshTree()
	self:UpdateSummary()
	self.statusLabel:SetText("Status: |cff888888Not run|r")
	if self.detailsBox then
		self.detailsBox:SetText("")
	end
end

function TestsModule:UpdateSummary()
	local total, passed, failed, pending = 0, 0, 0, 0
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if not MechanicLib then
		return
	end

	for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
		if capabilities.tests and capabilities.tests.getAll then
			for _, entry in ipairs(capabilities.tests.getAll()) do
				total = total + 1
				local result = capabilities.tests.getResult and capabilities.tests.getResult(entry.def.id)
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
	end

	self.summaryLabel:SetText(
		string.format("Total: %d | Passed: %d | Failed: %d | Pending: %d", total, passed, failed, pending)
	)
end

function TestsModule:GetCopyText(includeHeader)
	local lines = {}

	if includeHeader then
		local header = Mechanic:GetEnvironmentHeader()
		if header then
			table.insert(lines, header)
			local total, passed, failed, pending = 0, 0, 0, 0
			-- Recalculate for summary
			local MechanicLib = LibStub("MechanicLib-1.0", true)
			if MechanicLib then
				for _, caps in pairs(MechanicLib:GetRegistered()) do
					if caps.tests and caps.tests.getAll then
						for _, entry in ipairs(caps.tests.getAll()) do
							total = total + 1
							local res = caps.tests.getResult and caps.tests.getResult(entry.def.id)
							if res then
								if res.passed == true then
									passed = passed + 1
								elseif res.passed == false then
									failed = failed + 1
								else
									pending = pending + 1
								end
							end
						end
					end
				end
			end
			table.insert(
				lines,
				string.format("Result: %d/%d passed, %d failed, %d pending", passed, total, failed, pending)
			)
			table.insert(lines, "---")
		end
	end

	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib then
		for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
			if capabilities.tests and capabilities.tests.getCategories then
				local categories = capabilities.tests.getCategories()
				for _, category in ipairs(categories) do
					table.insert(lines, string.format("%s > %s", addonName, category))

					if capabilities.tests.getAll then
						for _, entry in ipairs(capabilities.tests.getAll()) do
							local test = entry.def
							if test.category == category then
								local result = capabilities.tests.getResult and capabilities.tests.getResult(test.id)
								local status = "[----]"
								local detail = ""

								if result then
									if result.passed == true then
										status = "[PASS]"
										detail = result.duration and string.format(" (%.3fs)", result.duration) or ""
									elseif result.passed == false then
										status = "[FAIL]"
										detail = result.message and (" - " .. result.message) or ""
									else
										status = "[PEND]"
										detail = result.message and (" - " .. result.message) or ""
									end
								end

								table.insert(lines, string.format("  %s %s%s", status, test.name, detail))
							end
						end
					end
				end
			end
		end
	end

	return table.concat(lines, "\n")
end

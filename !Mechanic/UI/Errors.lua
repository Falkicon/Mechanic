-- UI/Errors.lua
-- !Mechanic - Errors Tab Module (Phase 2)

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local ICON_PATH = [[Interface\AddOns\!Mechanic\Assets\Icons\]]
local ErrorsModule = {}
Mechanic.Errors = ErrorsModule

ErrorsModule.paused = false
ErrorsModule.currentSession = nil -- BugGrabber session ID
ErrorsModule.currentIndex = 0 -- Current error index
ErrorsModule.errors = {} -- Filtered error list
ErrorsModule.selectedSource = "all"

function Mechanic:InitializeErrors()
	if ErrorsModule.frame then
		return
	end

	local parent = self.frame.moduleContent
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetAllPoints()
	ErrorsModule.frame = frame

	-- Create split nav layout
	local SplitNavLayout = ns.SplitNavLayout
	ErrorsModule.layout = SplitNavLayout:Create(frame, {
		navWidth = 160,
		storageKey = "errors",
		onSelect = function(key)
			ErrorsModule:OnSourceSelected(key)
		end,
		defaultKey = "all",
	})

	local contentArea = ErrorsModule.layout.contentArea

	-- Toolbar
	local toolbar = FenUI:CreateToolbar(contentArea, {
		height = 32,
		padding = 4,
	})
	toolbar:SetPoint("TOPLEFT", 0, 0)
	toolbar:SetPoint("TOPRIGHT", 0, 0)

	-- Session Dropdown
	local sessionDropdown = FenUI:CreateDropdown(toolbar, {
		width = 150,
		height = 24,
		onSelect = function(value)
			ErrorsModule:OnSessionChanged(value)
		end,
	})
	toolbar:AddFrame(sessionDropdown)
	ErrorsModule.sessionDropdown = sessionDropdown

	-- Navigation
	local prevBtn = toolbar:AddButton({
		text = L["<"],
		width = 30,
		onClick = function()
			ErrorsModule:Navigate(-1)
		end,
	})
	ErrorsModule.prevButton = prevBtn

	local countLabel = toolbar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	-- We'll add this via AddFrame to keep layout consistent
	local countContainer = CreateFrame("Frame", nil, toolbar)
	countContainer:SetSize(50, 20)
	countLabel:SetParent(countContainer)
	countLabel:SetAllPoints()
	toolbar:AddFrame(countContainer)
	ErrorsModule.countLabel = countLabel

	local nextBtn = toolbar:AddButton({
		text = L[">"],
		width = 30,
		onClick = function()
			ErrorsModule:Navigate(1)
		end,
	})
	ErrorsModule.nextButton = nextBtn

	toolbar:AddSpacer(8)

	-- Pause Button
	local pauseBtn = toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-pause",
		size = 24,
		isToggle = true,
		tooltip = L["Pause"] or "Pause",
		onClick = function()
			ErrorsModule:TogglePause()
		end,
	})
	ErrorsModule.pauseButton = pauseBtn

	toolbar:AddSpacer("flex")

	-- Actions
	local consoleBtn = toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-record",
		size = 24,
		tooltip = L["To Console"],
		onClick = function()
			ErrorsModule:SendToConsole()
		end,
	})

	local wipeBtn = toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-clear",
		size = 24,
		tooltip = L["Wipe"],
		onClick = function()
			ErrorsModule:WipeSession()
		end,
	})

	toolbar:AddSpacer(8)

	local exportBtn = toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-export",
		size = 24,
		tooltip = L["Export All"] or "Export All",
		onClick = function()
			ErrorsModule:Export()
		end,
	})

	-- Help Button
	toolbar:AddImageButton({
		texture = ICON_PATH .. "icon-help",
		size = 24,
		tooltip = L["Help"],
		onClick = function()
			Mechanic.Utils:ShowHelpDialog("errors")
		end,
	})

	-- Error Display
	local editBox = FenUI:CreateMultiLineEditBox(contentArea, {
		readOnly = true,
		background = "surfaceInset",
		font = "fontMono",
	})
	editBox:SetPoint("TOPLEFT", toolbar, "BOTTOMLEFT", 0, -4)
	editBox:SetPoint("BOTTOMRIGHT", 0, 0)
	ErrorsModule.editBox = editBox

	-- Initial state
	ErrorsModule:OnEnable()
end

function ErrorsModule:OnShow()
	self:RefreshSourceList()
	self:UpdateDisplay()
end

function ErrorsModule:OnHide() end

function ErrorsModule:RefreshSourceList()
	local items = {
		{ key = "all", text = string.format("%s (%d)", L["All Sessions"] or "All Sessions", #self.errors) },
	}

	-- Group errors by detected addon
	local sourceCounts = {}
	for _, err in ipairs(self.errors) do
		local source = Mechanic.Utils:DetectErrorSource(err.message) or "Unknown"
		sourceCounts[source] = (sourceCounts[source] or 0) + 1
	end

	local sources = {}
	for source in pairs(sourceCounts) do
		table.insert(sources, source)
	end
	table.sort(sources)

	for _, source in ipairs(sources) do
		table.insert(items, {
			key = source,
			text = string.format("%s (%d)", tostring(source or "Unknown"), sourceCounts[source] or 0),
		})
	end

	self.layout:SetItems(items)
end

function ErrorsModule:OnSourceSelected(key)
	self.selectedSource = key
	self:RefreshErrors() -- This will now need to respect self.selectedSource
	self.currentIndex = #self.errors
	self:UpdateDisplay()
	Mechanic:UpdateMinimapIcon()
end

function ErrorsModule:OnEnable()
	if self.enabled then
		return
	end

	if not _G.BugGrabber then
		if self.editBox then
			self:ShowInstallMessage()
		end
		return
	end

	-- BugGrabber uses CallbackHandler
	_G.BugGrabber.RegisterCallback(self, "BugGrabber_BugGrabbed", "OnBugGrabbed")

	-- Get current session
	self.currentSession = _G.BugGrabber:GetSessionId()
	if self.sessionDropdown then
		self:UpdateSessionList()
	end

	self:RefreshErrors()
	self.currentIndex = #self.errors
	self:UpdateDisplay()

	local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
	Mechanic:UpdateMinimapIcon()

	self.enabled = true
end

function ErrorsModule:UpdateSessionList()
	if not self.sessionDropdown or not _G.BugGrabber then
		return
	end

	local currentId = _G.BugGrabber:GetSessionId()
	local items = {
		{ text = L["Current Session"], value = currentId },
		{ text = L["All Sessions"], value = "all" },
	}

	if currentId > 1 then
		table.insert(items, { text = L["Previous Session"], value = currentId - 1 })
	end

	self.sessionDropdown:SetItems(items)
	self.sessionDropdown:SetValue(self.currentSession)
end

function ErrorsModule:OnSessionChanged(session)
	self.currentSession = session
	self:RefreshErrors()
	self.currentIndex = #self.errors
	self:UpdateDisplay()
	Mechanic:UpdateMinimapIcon()
end

function ErrorsModule:OnBugGrabbed(event, errorObject)
	if self.paused then
		return
	end

	self:RefreshErrors()

	if self.frame and self.frame:IsVisible() then
		self:RefreshSourceList()
	end

	-- Auto-navigate to newest if we were already at the end
	if self.currentIndex == #self.errors - 1 or self.currentIndex == 0 then
		self.currentIndex = #self.errors
	end

	self:UpdateDisplay()
	Mechanic:UpdateMinimapIcon()
end

function ErrorsModule:RefreshErrors()
	if not _G.BugGrabber then
		return
	end

	local session = self.currentSession
	local allErrors = _G.BugGrabber:GetDB()
	self.errors = {}

	local filterSource = self.selectedSource and self.selectedSource ~= "all" and self.selectedSource

	for _, err in ipairs(allErrors) do
		local match = true

		-- Session filter
		if session ~= "all" and err.session ~= session then
			match = false
		end

		-- Source filter (Phase 6)
		if match and filterSource then
			local source = Mechanic.Utils:DetectErrorSource(err.message) or "Unknown"
			if source ~= filterSource then
				match = false
			end
		end

		if match then
			table.insert(self.errors, err)
		end
	end
end

function ErrorsModule:Navigate(delta)
	local newIndex = self.currentIndex + delta
	if newIndex >= 1 and newIndex <= #self.errors then
		self.currentIndex = newIndex
		self:UpdateDisplay()
	end

	-- Ensure dropdown text updates on navigation if session changed
	if self.sessionDropdown then
		self.sessionDropdown:SetValue(self.currentSession)
	end
end

function ErrorsModule:UpdateDisplay()
	if not self.editBox then
		return
	end

	local err = self.errors[self.currentIndex]
	if not err then
		self.editBox:SetText(L["No errors in this session."])
		self.countLabel:SetText(L["0/0"])
		self.prevButton:SetEnabled(false)
		self.nextButton:SetEnabled(false)
		return
	end

	local text = Mechanic.Utils:FormatError(err)
	self.editBox:SetText(text)

	-- Update navigation
	self.countLabel:SetText(string.format(L["%d/%d"] or "%d/%d", self.currentIndex or 0, #self.errors))
	self.prevButton:SetEnabled(self.currentIndex > 1)
	self.nextButton:SetEnabled(self.currentIndex < #self.errors)
end

function ErrorsModule:TogglePause()
	self.paused = not self.paused
	self.pauseButton:SetTexture(ICON_PATH .. (self.paused and "icon-play" or "icon-pause"))
	self.pauseButton:SetActive(self.paused)

	if not self.paused then
		self:RefreshErrors()
		self:UpdateDisplay()
		Mechanic:UpdateMinimapIcon()
	end
end

function ErrorsModule:WipeSession()
	if _G.BugGrabber then
		_G.BugGrabber:Reset()
		self:RefreshErrors()
		self.currentIndex = 0
		self:UpdateDisplay()
		Mechanic:UpdateMinimapIcon()
		Mechanic:Print(L["Error database wiped."])
	end
end

function ErrorsModule:SendToConsole()
	local err = self.errors[self.currentIndex]
	if not err then
		return
	end

	local text = Mechanic.Utils:FormatError(err)
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib then
		MechanicLib:Log("BugGrabber", text, L["[Error]"])
	end
end

function ErrorsModule:Export()
	local navName = self.selectedSource or "all"
	if navName == "all" then
		navName = L["All Sessions"] or "All Sessions"
	end

	local title = string.format(
		"%s : %s : %s",
		tostring(L["Errors"] or "Errors"),
		tostring(navName or "All Sessions"),
		tostring(L["Export All"] or "Export All")
	)
	local text = self:GetCopyText(Mechanic.db.profile.includeEnvHeader, true)
	Mechanic.Utils:ShowExportDialog(title, text)
end

function ErrorsModule:GetCopyText(includeHeader, allErrors)
	local lines = {}

	if includeHeader then
		local header = Mechanic:GetEnvironmentHeader()
		if header then
			table.insert(lines, header)
			table.insert(
				lines,
				string.format(
					L["Session: %s | Errors: %d"] or "Session: %s | Errors: %d",
					tostring(self.currentSession or "all"),
					#self.errors
				)
			)
			table.insert(lines, "---")
		end
	end

	if allErrors then
		for i, err in ipairs(self.errors) do
			table.insert(lines, string.format("Error %d/%d:", i, #self.errors))
			table.insert(lines, Mechanic.Utils:FormatError(err))
			if i < #self.errors then
				table.insert(lines, "\n" .. string.rep("=", 40) .. "\n")
			end
		end
	else
		local err = self.errors[self.currentIndex]
		if err then
			table.insert(lines, Mechanic.Utils:FormatError(err))
		end
	end

	return table.concat(lines, "\n")
end

function ErrorsModule:ShowInstallMessage()
	if not self.editBox then
		return
	end

	local message = string.format(
		"|cffff4411%s|r\n\n%s\n\n%s\n- CurseForge: curseforge.com/wow/addons/bug-grabber\n- WoWInterface: wowinterface.com/downloads/info5883\n\n%s",
		tostring(L["!BugGrabber Required"] or "!BugGrabber Required"),
		tostring(
			L["The Errors module requires !BugGrabber to capture Lua errors."]
				or "The Errors module requires !BugGrabber to capture Lua errors."
		),
		tostring(L["Download from:"] or "Download from:"),
		tostring(L["After installing, type /reload"] or "After installing, type /reload")
	)
	self.editBox:SetText(message)
end

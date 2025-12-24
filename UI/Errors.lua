-- UI/Errors.lua
-- !Mechanic - Errors Tab Module (Phase 2)

local ADDON_NAME, ns = ...
local Mechanic = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local ErrorsModule = {}
Mechanic.Errors = ErrorsModule

ErrorsModule.paused = false
ErrorsModule.currentSession = nil -- BugGrabber session ID
ErrorsModule.currentIndex = 0 -- Current error index
ErrorsModule.errors = {} -- Filtered error list

function Mechanic:InitializeErrors()
	if ErrorsModule.frame then
		return
	end

	local parent = self.frame.moduleContent
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetAllPoints()
	ErrorsModule.frame = frame

	-- Toolbar
	local toolbar = FenUI:CreateToolbar(frame, {
		height = 32,
		padding = 4,
	})
	toolbar:SetPoint("TOPLEFT", 0, 0)
	toolbar:SetPoint("TOPRIGHT", 0, 0)

	-- Session Dropdown
	local AceGUI = LibStub("AceGUI-3.0")
	local sessionDropdown = AceGUI:Create("Dropdown")
	sessionDropdown:SetWidth(150)
	sessionDropdown:SetCallback("OnValueChanged", function(widget, event, value)
		ErrorsModule:OnSessionChanged(value)
	end)

	-- We need to wrap AceGUI widget to add it to FenUI toolbar
	local dropdownContainer = CreateFrame("Frame", nil, toolbar)
	dropdownContainer:SetSize(150, 24)
	sessionDropdown.frame:SetParent(dropdownContainer)
	sessionDropdown.frame:SetAllPoints()
	sessionDropdown.frame:Show()

	toolbar:AddFrame(dropdownContainer)
	ErrorsModule.sessionDropdown = sessionDropdown

	-- Navigation
	local prevBtn = toolbar:AddButton({
		text = "<",
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
		text = ">",
		width = 30,
		onClick = function()
			ErrorsModule:Navigate(1)
		end,
	})
	ErrorsModule.nextButton = nextBtn

	toolbar:AddSpacer(8)

	-- Pause Button
	local pauseBtn = toolbar:AddButton({
		text = "⏸ Pause",
		width = 80,
		onClick = function()
			ErrorsModule:TogglePause()
		end,
	})
	ErrorsModule.pauseButton = pauseBtn

	toolbar:AddSpacer("flex")

	-- Actions
	local consoleBtn = toolbar:AddButton({
		text = "To Console",
		width = 90,
		onClick = function()
			ErrorsModule:SendToConsole()
		end,
	})

	local wipeBtn = toolbar:AddButton({
		text = "Wipe",
		width = 60,
		onClick = function()
			ErrorsModule:WipeSession()
		end,
	})

	-- Error Display
	local editBox = FenUI:CreateMultiLineEditBox(frame, {
		readOnly = true,
		background = "surfaceInset",
	})
	editBox:SetPoint("TOPLEFT", toolbar, "BOTTOMLEFT", 0, -4)
	editBox:SetPoint("BOTTOMRIGHT", 0, 0)
	ErrorsModule.editBox = editBox

	-- Initial state
	ErrorsModule:OnEnable()
end

function ErrorsModule:OnEnable()
	if not _G.BugGrabber then
		self:ShowInstallMessage()
		return
	end

	-- BugGrabber uses CallbackHandler
	_G.BugGrabber.RegisterCallback(self, "BugGrabber_BugGrabbed", "OnBugGrabbed")

	-- Get current session
	self.currentSession = _G.BugGrabber:GetSessionId()
	self:UpdateSessionList()
	self:RefreshErrors()
	self.currentIndex = #self.errors
	self:UpdateDisplay()
end

function ErrorsModule:UpdateSessionList()
	if not self.sessionDropdown or not _G.BugGrabber then
		return
	end

	local currentId = _G.BugGrabber:GetSessionId()
	local list = {
		[currentId] = "Current Session",
		["all"] = "All Sessions",
	}

	if currentId > 1 then
		list[currentId - 1] = "Previous Session"
	end

	self.sessionDropdown:SetList(list)
	self.sessionDropdown:SetValue(self.currentSession)
end

function ErrorsModule:OnSessionChanged(session)
	self.currentSession = session
	self:RefreshErrors()
	self.currentIndex = #self.errors
	self:UpdateDisplay()
end

function ErrorsModule:OnBugGrabbed(event, errorObject)
	if self.paused then
		return
	end

	self:RefreshErrors()

	-- Auto-navigate to newest if we were already at the end
	if self.currentIndex == #self.errors - 1 or self.currentIndex == 0 then
		self.currentIndex = #self.errors
	end

	self:UpdateDisplay()
end

function ErrorsModule:RefreshErrors()
	if not _G.BugGrabber then
		return
	end

	local session = self.currentSession
	local allErrors = _G.BugGrabber:GetDB()
	self.errors = {}

	if session == "all" then
		self.errors = allErrors
	else
		for _, err in ipairs(allErrors) do
			if err.session == session then
				table.insert(self.errors, err)
			end
		end
	end
end

function ErrorsModule:Navigate(delta)
	local newIndex = self.currentIndex + delta
	if newIndex >= 1 and newIndex <= #self.errors then
		self.currentIndex = newIndex
		self:UpdateDisplay()
	end
end

function ErrorsModule:UpdateDisplay()
	if not self.editBox then
		return
	end

	local err = self.errors[self.currentIndex]
	if not err then
		self.editBox:SetText("No errors in this session.")
		self.countLabel:SetText("0/0")
		self.prevButton:SetEnabled(false)
		self.nextButton:SetEnabled(false)
		return
	end

	local text = self:FormatError(err)
	self.editBox:SetText(text)

	-- Update navigation
	self.countLabel:SetText(string.format("%d/%d", self.currentIndex, #self.errors))
	self.prevButton:SetEnabled(self.currentIndex > 1)
	self.nextButton:SetEnabled(self.currentIndex < #self.errors)
end

function ErrorsModule:FormatError(err)
	local lines = {}

	-- Count and message
	table.insert(lines, string.format("|cffffffff%dx|r %s", err.counter or 1, err.message))
	table.insert(lines, "")

	-- Stack trace
	if err.stack then
		table.insert(lines, "|cff888888Stack:|r")
		for line in err.stack:gmatch("[^\n]+") do
			table.insert(lines, string.format("  %s", self:ColorizeStackLine(line)))
		end
		table.insert(lines, "")
	end

	-- Locals
	if err.locals then
		table.insert(lines, "|cff888888Locals:|r")
		table.insert(lines, self:ColorizeLocals(err.locals))
	end

	return table.concat(lines, "\n")
end

function ErrorsModule:ColorizeStackLine(line)
	-- Remove Interface/AddOns prefix for readability
	line = line:gsub("[%.I][%.n][%.t][%.e][%.r]face/", "")
	line = line:gsub("%.?%.?%.?/?AddOns/", "")

	-- Highlight line numbers
	line = line:gsub(":(%d+)", ":|cff00ff00%1|r")

	-- Highlight lua files
	line = line:gsub("([^/]+%.lua)", "|cffffffff%1|r")

	return line
end

function ErrorsModule:ColorizeLocals(locals)
	local result = locals
	-- Highlight variable names
	result = result:gsub("(%s-)([%a_][%a_%d]*) = ", "%1|cffffff80%2|r = ")
	-- Highlight nil
	result = result:gsub("= nil", "= |cffff7f7fnil|r")
	-- Highlight numbers
	result = result:gsub("= (%-?[%d%.]+)", "= |cffff7fff%1|r")
	return result
end

function ErrorsModule:TogglePause()
	self.paused = not self.paused
	self.pauseButton:SetText(self.paused and "▶ Resume" or "⏸ Pause")

	if not self.paused then
		self:RefreshErrors()
		self:UpdateDisplay()
	end
end

function ErrorsModule:WipeSession()
	if _G.BugGrabber then
		_G.BugGrabber:Reset()
		self:RefreshErrors()
		self.currentIndex = 0
		self:UpdateDisplay()
		Mechanic:Print("Error database wiped.")
	end
end

function ErrorsModule:SendToConsole()
	local err = self.errors[self.currentIndex]
	if not err then
		return
	end

	local text = self:FormatError(err)
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib then
		MechanicLib:Log("BugGrabber", text, "[Error]")
	end
end

function ErrorsModule:GetCopyText(includeHeader)
	local lines = {}

	if includeHeader then
		local header = Mechanic:GetEnvironmentHeader()
		if header then
			table.insert(lines, header)
			table.insert(
				lines,
				string.format(
					"Session: %s | Error: %d/%d",
					tostring(self.currentSession),
					self.currentIndex,
					#self.errors
				)
			)
			table.insert(lines, "---")
		end
	end

	local err = self.errors[self.currentIndex]
	if err then
		table.insert(lines, self:FormatError(err))
	end

	return table.concat(lines, "\n")
end

function ErrorsModule:ShowInstallMessage()
	local message = [[
|cffff4411!BugGrabber Required|r

The Errors module requires !BugGrabber to capture Lua errors.

Download from:
- CurseForge: curseforge.com/wow/addons/bug-grabber
- WoWInterface: wowinterface.com/downloads/info5883

After installing, type /reload
]]
	self.editBox:SetText(message)
end

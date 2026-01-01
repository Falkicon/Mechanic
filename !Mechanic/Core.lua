-- Core.lua
-- !Mechanic - In-Game Development Hub
--
-- See PLAN/MASTER_PLAN.md for full specification.
-- Implementation tracked in PLAN/01-foundation.plan.md through PLAN/04-migration.plan.md

local ADDON_NAME, ns = ...
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local ICON_PATH = [[Interface\AddOns\!Mechanic\Assets\Icons\]]

local Mechanic = LibStub("AceAddon-3.0"):NewAddon(ADDON_NAME, "AceConsole-3.0", "AceEvent-3.0")
_G.Mechanic = Mechanic -- luacheck: ignore W122 -- Global for MechanicLib:IsEnabled() check

-- Version from metadata
Mechanic.version = C_AddOns.GetAddOnMetadata(ADDON_NAME, "Version") or "1.2.4"

-- Shared Utils (defined in Utils.lua)
Mechanic.Utils = ns.Utils

-- Database defaults per MASTER_PLAN Section 7
local defaults = {
	profile = {
		position = { point = "CENTER", x = 0, y = 0 },
		size = { width = 1000, height = 650 },
		activeTab = "inspect",
		bufferSize = 1000,
		showTimestamps = false,
		includeEnvHeader = true,
		includeCharacterInfo = true,
		includeTimestamp = true,
		-- Performance settings (Phase 3)
		autoRefresh = true,
		refreshInterval = 1.0,
		trackEventFrequency = false,
		hiddenAddons = {},
		-- Minimap (Phase 3)
		minimap = {
			hide = false,
		},
		addonSettings = {},
		-- Sub-tab persistence
		activeSubTabs = {
			console = "all",
			errors = "all",
			tools = nil,
			api = nil,
			perf = "general",
		},
		-- NEW: API test data (Phase 7)
		apiTests = {},
		-- NEW: Inspect & Watch data (Phase 8)
		inspectWatch = {},
		-- NEW: Self-registration (dogfooding)
		registerSelf = true,
		-- NEW: Persistent Health Log for agent auditing
		healthLog = {},
		-- NEW: Test Results persistence for Mechanic Desktop
		testResults = {},
	},
}

function Mechanic:OnInitialize()
	-- Initialize database
	self.db = LibStub("AceDB-3.0"):New("MechanicDB", defaults, true)

	-- Register slash commands
	self:RegisterSlashCommands()

	-- Setup options panel (Phase 3)
	if self.SetupOptions then
		self:SetupOptions()
	end

	-- Setup minimap button (Phase 3)
	self:SetupDataBroker()

	self:Print("Mechanic initialized.")
end

function Mechanic:UpdateMinimapIcon()
	if not self.ldbObj then
		return
	end

	local hasErrors = false
	-- Check if we have the Errors module and it has errors for the CURRENT session
	if self.Errors and self.Errors.errors and #self.Errors.errors > 0 then
		-- Errors module already filters by current session by default
		hasErrors = true
	-- Fallback check for current session only
	elseif _G.BugGrabber and _G.BugGrabber.GetSessionId then
		local sessionId = _G.BugGrabber:GetSessionId()
		local db = _G.BugGrabber:GetDB()
		if db then
			for i = #db, 1, -1 do
				if db[i].session == sessionId then
					hasErrors = true
					break
				end
			end
		end
	end

	local icon = hasErrors and "Interface\\AddOns\\!Mechanic\\assets\\Icons\\icon-minimap-error-64"
		or "Interface\\AddOns\\!Mechanic\\assets\\Icons\\icon-minimap-normal-64"

	if self.ldbObj.icon ~= icon then
		self.ldbObj.icon = icon
	end

	-- Update tab badge if main frame is created
	self:UpdateErrorBadge()
end

function Mechanic:UpdateErrorBadge()
	if not self.frame or not self.frame.tabs then
		return
	end

	local errorCount = 0
	if self.Errors and self.Errors.errors then
		errorCount = #self.Errors.errors
	elseif _G.BugGrabber and _G.BugGrabber.GetSessionId then
		local sessionId = _G.BugGrabber:GetSessionId()
		local db = _G.BugGrabber:GetDB()
		if db then
			for i = 1, #db do
				if db[i].session == sessionId then
					errorCount = errorCount + 1
				end
			end
		end
	end

	local badgeText = string.format("(%d)", errorCount)
	if errorCount > 0 then
		self.frame.tabs:SetTabBadge("errors", badgeText, "feedbackError")
	else
		self.frame.tabs:SetTabBadge("errors", badgeText, "feedbackSuccess")
	end
end

function Mechanic:OnEnable()
	-- Self-registration (dogfooding) if enabled
	-- MUST happen before CreateMainFrame to avoid race conditions with persistence
	if self.db.profile.registerSelf then
		self:RegisterSelf()
	end

	-- Initialize background modules early to capture data before UI is shown
	if self.Errors and self.Errors.OnEnable then
		self.Errors:OnEnable()
	end
	if self.Console and self.Console.OnEnable then
		self.Console:OnEnable()
	end

	-- UI creation will happen here (Phase 1)
	-- Modules will also be initialized here
	if self.CreateMainFrame then
		self:CreateMainFrame()
	end

	-- Initialize event tracking if enabled (Phase 3)
	if self.db.profile.trackEventFrequency and self.Perf then
		self.Perf:EnableEventTracking()
	end
end

--------------------------------------------------------------------------------
-- Self-Registration (Dogfooding)
--------------------------------------------------------------------------------

--- Register !Mechanic with itself via MechanicLib.
--- This allows it to appear in Performance, Tools, and Tests tabs.
function Mechanic:RegisterSelf()
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if not MechanicLib then
		return
	end

	local version = C_AddOns.GetAddOnMetadata(ADDON_NAME, "Version") or "1.0.0"

	MechanicLib:Register("!Mechanic", {
		version = version,
		-- Performance sub-metrics
		performance = {
			getSubMetrics = function()
				return self:GetSelfPerformanceMetrics()
			end,
		},
		-- Diagnostic tools with createPanel
		tools = {
			createPanel = function(parent)
				self:CreateSelfToolsPanel(parent)
			end,
		},
		-- Unit tests
		tests = {
			getAll = function()
				return self:GetSelfTests()
			end,
			getCategories = function()
				return { "Database", "UI" }
			end,
			run = function(id)
				return self:RunSelfTest(id)
			end,
			runAll = function()
				return self:RunAllSelfTests()
			end,
		},
		-- Key frames for the Watch List (Inspect tool)
		inspect = {
			getWatchFrames = function()
				local frames = {}
				if self.frame then
					table.insert(frames, { label = "Main Window", frame = self.frame, property = "Visibility" })
					if self.frame.tabs then
						table.insert(frames, { label = "Tabs", frame = self.frame.tabs, property = "Selected" })
					end
					if self.frame.moduleContent then
						table.insert(
							frames,
							{ label = "Content Area", frame = self.frame.moduleContent, property = "Visibility" }
						)
					end
					if self.frame.statusBar then
						table.insert(
							frames,
							{ label = "Status Bar", frame = self.frame.statusBar, property = "Visibility" }
						)
					end
				end

				-- Module-specific frames
				if self.Console and self.Console.frame then
					table.insert(
						frames,
						{ label = "Console Module", frame = self.Console.frame, property = "Visibility" }
					)
				end
				if self.Errors and self.Errors.frame then
					table.insert(
						frames,
						{ label = "Errors Module", frame = self.Errors.frame, property = "Visibility" }
					)
				end
				if self.Perf and self.Perf.frame then
					table.insert(frames, { label = "Perf Module", frame = self.Perf.frame, property = "Visibility" })
				end
				if self.Inspect and self.Inspect.frame then
					table.insert(
						frames,
						{ label = "Inspect Module", frame = self.Inspect.frame, property = "Visibility" }
					)
				end

				return frames
			end,
		},
	})
end

--- Unregister !Mechanic from itself.
function Mechanic:UnregisterSelf()
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib then
		MechanicLib:Unregister("!Mechanic")
	end
end

--- Create the Tools panel UI for !Mechanic's self-registered tools.
---@param parent Frame The content frame to populate
function Mechanic:CreateSelfToolsPanel(parent)
	-- Define the tools
	local toolDefinitions = {
		{
			name = L["View Health Log"] or "View Health Log",
			description = L["Export persistent internal error log for agent auditing."]
				or "Export persistent internal error log for agent auditing.",
			action = function()
				self:ExportHealthLog()
			end,
		},
		{
			name = L["Clear Health Log"] or "Clear Health Log",
			description = L["Clear all entries from the persistent health log."]
				or "Clear all entries from the persistent health log.",
			action = function()
				wipe(self.db.profile.healthLog)
				self:Print(L["Health log cleared."] or "Health log cleared.")
			end,
		},
		{
			name = L["Reset UI Position"] or "Reset UI Position",
			description = L["Reset the main frame to default size and position."]
				or "Reset the main frame to default size and position.",
			action = function()
				self.db.profile.position = { point = "CENTER", x = 0, y = 0 }
				self.db.profile.size = { width = 1000, height = 650 }
				if self.frame then
					self.frame:ClearAllPoints()
					self.frame:SetPoint("CENTER", 0, 0)
					self.frame:SetSize(1000, 650)
				end
				self:Print(L["UI position reset."] or "UI position reset.")
			end,
		},
	}

	-- Title
	local title = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	title:SetPoint("TOPLEFT", 16, -16)
	title:SetText("!Mechanic " .. (L["Tools"] or "Tools"))

	-- Subtitle with health log count
	local subtitle = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)
	local logCount = #(self.db.profile.healthLog or {})
	subtitle:SetText(string.format("Health Log: %d entries", logCount))

	-- Create buttons for each tool
	local lastButton = nil
	for i, tool in ipairs(toolDefinitions) do
		local btn = FenUI:CreateButton(parent, {
			text = tool.name,
			width = 200,
			height = 28,
			onClick = tool.action,
		})

		if i == 1 then
			btn:SetPoint("TOPLEFT", subtitle, "BOTTOMLEFT", 0, -16)
		else
			btn:SetPoint("TOPLEFT", lastButton, "BOTTOMLEFT", 0, -8)
		end
		lastButton = btn

		-- Description label
		local desc = parent:CreateFontString(nil, "OVERLAY", "GameFontDisable")
		desc:SetPoint("LEFT", btn, "RIGHT", 12, 0)
		desc:SetText(tool.description)
		desc:SetWidth(350)
		desc:SetJustifyH("LEFT")
	end
end

--- Toggle self-registration state.
---@param enabled boolean Whether to enable self-registration
function Mechanic:SetRegisterSelf(enabled)
	self.db.profile.registerSelf = enabled
	if enabled then
		self:RegisterSelf()
	else
		self:UnregisterSelf()
	end
	-- Refresh all module nav lists
	self:RefreshAllModuleNav()
end

--- Refresh navigation in all modules after registration change.
function Mechanic:RefreshAllModuleNav()
	if self.Console then
		self.Console.navDirty = true
		if self.Console.frame and self.Console.frame:IsVisible() then
			self.Console:RefreshSourceList()
		end
	end
	if self.Tests and self.Tests.RefreshTree then
		self.Tests:RefreshTree()
		self.Tests:UpdateSummary()
	end
	if self.Tools then
		self.Tools.navDirty = true
		if self.Tools.frame and self.Tools.frame:IsVisible() then
			self.Tools:RefreshAddonList()
		end
	end
	if self.Perf then
		self.Perf.navDirty = true
		if self.Perf.frame and self.Perf.frame:IsVisible() then
			self.Perf:RefreshNavItems()
		end
	end
	self:UpdateStatusBar()
end

--- Get performance sub-metrics for !Mechanic itself.
---@return table metrics Array of {name, value, percent, description}
function Mechanic:GetSelfPerformanceMetrics()
	local metrics = {}

	-- Console buffer size
	if self.Console and self.Console.buffer then
		local bufferCount = self.Console.count or 0
		local bufferMax = self.db.profile.bufferSize or 1000
		table.insert(metrics, {
			name = "Console Buffer",
			ms = bufferCount, -- Using 'ms' key to match SUB_COLUMNS expectation
			percent = (bufferCount / bufferMax) * 100,
			description = string.format("%d / %d entries", bufferCount, bufferMax),
		})
	end

	-- Health log entries
	local healthCount = #(self.db.profile.healthLog or {})
	table.insert(metrics, {
		name = "Health Log",
		ms = healthCount,
		percent = 0,
		description = string.format("%d entries", healthCount),
	})

	-- Watch list size
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib then
		local watchCount = 0
		for _ in pairs(MechanicLib:GetWatchList()) do
			watchCount = watchCount + 1
		end
		table.insert(metrics, {
			name = "Watch List",
			ms = watchCount,
			percent = 0,
			description = string.format("%d items", watchCount),
		})
	end

	return metrics
end

--- Get self-test definitions.
---@return table tests Array of test definitions
function Mechanic:GetSelfTests()
	return {
		{
			id = "db_integrity",
			name = "Database Integrity",
			category = "Database",
			description = "Verify that MechanicDB has valid structure",
		},
		{
			id = "db_defaults",
			name = "Database Defaults",
			category = "Database",
			description = "Verify that all default keys exist in profile",
		},
		{
			id = "ui_modules",
			name = "UI Modules Loaded",
			category = "UI",
			description = "Verify that all UI modules are initialized",
		},
	}
end

--- Run a self-test by ID.
---@param id string The test ID
---@return table result Test result {passed, message, duration, logs}
function Mechanic:RunSelfTest(id)
	local startTime = debugprofilestop()
	local result = { passed = false, message = "", logs = {} }

	if id == "db_integrity" then
		-- Check that db and profile exist
		if self.db and self.db.profile then
			result.passed = true
			result.message = "Database and profile are valid"
			table.insert(result.logs, "self.db exists: true")
			table.insert(result.logs, "self.db.profile exists: true")
		else
			result.message = "Database or profile is nil"
			table.insert(result.logs, string.format("self.db exists: %s", tostring(self.db ~= nil)))
			table.insert(
				result.logs,
				string.format("self.db.profile exists: %s", tostring(self.db and self.db.profile ~= nil))
			)
		end
	elseif id == "db_defaults" then
		-- Check for essential keys
		local requiredKeys = { "position", "size", "activeTab", "bufferSize", "healthLog" }
		local missing = {}
		for _, key in ipairs(requiredKeys) do
			if self.db.profile[key] == nil then
				table.insert(missing, key)
			end
			table.insert(result.logs, string.format("%s: %s", key, tostring(self.db.profile[key] ~= nil)))
		end
		if #missing == 0 then
			result.passed = true
			result.message = "All required keys present"
		else
			result.message = "Missing keys: " .. table.concat(missing, ", ")
		end
	elseif id == "ui_modules" then
		-- Check that modules exist
		local modules = { "Console", "Errors", "Tests", "Tools", "API", "Inspect", "Perf" }
		local missing = {}
		for _, mod in ipairs(modules) do
			local exists = self[mod] ~= nil
			table.insert(result.logs, string.format("%s: %s", mod, tostring(exists)))
			if not exists then
				table.insert(missing, mod)
			end
		end
		if #missing == 0 then
			result.passed = true
			result.message = "All UI modules available"
		else
			result.message = "Missing modules: " .. table.concat(missing, ", ")
		end
	else
		result.message = "Unknown test ID: " .. tostring(id)
	end

	result.duration = (debugprofilestop() - startTime) / 1000

	-- Persist result for Mechanic Desktop
	if self.db and self.db.profile then
		if not self.db.profile.testResults then
			self.db.profile.testResults = {}
		end
		self.db.profile.testResults[id] = result
	end

	return result
end

--- Run all self-tests.
---@return number passed Number of passed tests
---@return number total Total number of tests
function Mechanic:RunAllSelfTests()
	local tests = self:GetSelfTests()
	local passed = 0
	for _, test in ipairs(tests) do
		local result = self:RunSelfTest(test.id)
		if result and result.passed then
			passed = passed + 1
		end
	end
	return passed, #tests
end

--------------------------------------------------------------------------------
-- Persistent Health Log (for Agent Auditing)
--------------------------------------------------------------------------------

--- Log an internal error or critical event to the persistent health log.
--- This data survives reloads and can be read by agents via SavedVariablesInspector.
---@param level string "ERROR" | "WARN" | "INFO"
---@param source string The source module or function name
---@param message string The log message
---@param stack string|nil Optional stack trace
function Mechanic:LogHealth(level, source, message, stack)
	if not self.db or not self.db.profile then
		return
	end
	if not self.db.profile.healthLog then
		self.db.profile.healthLog = {}
	end

	local entry = {
		timestamp = date("%Y-%m-%d %H:%M:%S"),
		gameTime = GetTime(),
		level = level or "INFO",
		source = source or "Unknown",
		message = message or "",
		stack = stack,
	}
	table.insert(self.db.profile.healthLog, entry)

	-- Cap at 100 entries to prevent bloat
	while #self.db.profile.healthLog > 100 do
		table.remove(self.db.profile.healthLog, 1)
	end
end

--- Export the health log to the clipboard via the export dialog.
function Mechanic:ExportHealthLog()
	local lines = {}
	local header = self:GetEnvironmentHeader()
	if header then
		table.insert(lines, header)
		table.insert(lines, "---")
	end

	table.insert(lines, "!Mechanic Internal Health Log")
	table.insert(lines, string.format("Entries: %d", #self.db.profile.healthLog))
	table.insert(lines, "")

	if #self.db.profile.healthLog == 0 then
		table.insert(lines, "No entries in health log.")
	else
		for i, entry in ipairs(self.db.profile.healthLog) do
			table.insert(
				lines,
				string.format(
					"[%d] %s [%s] %s: %s",
					i,
					tostring(entry.timestamp or "?"),
					tostring(entry.level or "?"),
					tostring(entry.source or "?"),
					tostring(entry.message or "")
				)
			)
			if entry.stack then
				table.insert(lines, "    Stack: " .. tostring(entry.stack))
			end
		end
	end

	local title = L["Tools : !Mechanic : View Health Log"] or "Tools : !Mechanic : View Health Log"
	self.Utils:ShowExportDialog(title, table.concat(lines, "\n"))
end

function Mechanic:OnAddonRegistered(name, capabilities)
	-- Global Filter
	if self.db.profile.hiddenAddons[name] then
		self:OnLog(
			"System",
			string.format("Addon %s registered but is currently HIDDEN by global filter.", name),
			"[Core]"
		)
		return
	end

	-- Notify UI modules if they are interested
	if self.Console then
		self.Console.navDirty = true
		if self.Console.frame and self.Console.frame:IsVisible() then
			self.Console:RefreshSourceList()
		end
	end

	if self.Tests and self.Tests.RefreshTree then
		self.Tests:RefreshTree()
		self.Tests:UpdateSummary()
	end

	if self.Tools then
		self.Tools.navDirty = true
		if self.Tools.frame and self.Tools.frame:IsVisible() then
			self.Tools:RefreshAddonList()
		end
	end

	if self.Perf then
		self.Perf.navDirty = true
		if self.Perf.frame and self.Perf.frame:IsVisible() then
			self.Perf:RefreshNavItems()
		end
	end

	-- Check for inspect capability (Phase 8)
	if capabilities and capabilities.inspect and capabilities.inspect.getWatchFrames then
		local MechanicLib = LibStub("MechanicLib-1.0", true)
		if MechanicLib then
			local frames = capabilities.inspect.getWatchFrames()
			if frames then
				for _, data in ipairs(frames) do
					MechanicLib:AddToWatchList(data.frame, data.label, {
						source = name,
						property = data.property,
					})
				end
			end
		end
	end

	-- Update status bar count
	self:UpdateStatusBar()

	-- Send registration log to console
	local version = capabilities and capabilities.version or "?.?.?"
	self:OnLog("System", string.format("Addon registered: %s v%s", name, version), "[Core]")
end

function Mechanic:OnAddonUnregistered(name)
	-- Send unregistration log to console
	self:OnLog("System", string.format("Addon unregistered: %s", name), "[Core]")
end

function Mechanic:OnLog(addonName, message, category)
	-- Global Filter
	if self.db.profile.hiddenAddons[addonName] then
		return
	end

	-- Forward to Console module
	if self.Console and self.Console.OnLog then
		self.Console:OnLog(addonName, message, category)
	end
end

function Mechanic:OnWatchListChanged()
	if self.Inspect and self.Inspect.RefreshWatchList then
		self.Inspect:RefreshWatchList()
	end
end

--------------------------------------------------------------------------------
-- Copy API
--------------------------------------------------------------------------------

--- Generates a header with environment information for copy/paste.
---@return string|nil header The formatted header, or nil if disabled
function Mechanic:GetEnvironmentHeader()
	return self.Utils:GetEnvironmentHeader(self.db.profile)
end

function Mechanic:GetClientType()
	return self.Utils:GetClientType()
end

--------------------------------------------------------------------------------
-- Slash Commands
--------------------------------------------------------------------------------

function Mechanic:RegisterSlashCommands()
	self:RegisterChatCommand("mech", "SlashCommand")
	self:RegisterChatCommand("mechanic", "SlashCommand")
end

function Mechanic:SlashCommand(input)
	local cmd = (input or ""):trim():lower()

	if cmd == "" then
		self:ToggleMainFrame()
	elseif cmd == "inspect" then
		self:ShowTab("inspect")
	elseif cmd == "console" then
		self:ShowTab("console")
	elseif cmd == "errors" then
		self:ShowTab("errors")
	elseif cmd == "tests" then
		self:ShowTab("tests")
	elseif cmd == "perf" then
		self:ShowTab("perf")
	elseif cmd == "tools" then
		self:ShowTab("tools")
	elseif cmd == "api" then
		self:ShowTab("api")
	elseif cmd == "reload" then
		ReloadUI()
	elseif cmd == "gc" then
		local before = collectgarbage("count")
		collectgarbage("collect")
		local after = collectgarbage("count")
		local freed = before - after
		self:Print(
			string.format(
				L["GC: %.1f KB freed (%.1f MB -> %.1f MB)"],
				self.Utils:FormatMemory(freed),
				self.Utils:FormatMemory(before),
				self.Utils:FormatMemory(after)
			)
		)

		local MechanicLib = LibStub("MechanicLib-1.0", true)
		if MechanicLib then
			MechanicLib:Log(
				"System",
				string.format(L["GC executed: %s freed"], self.Utils:FormatMemory(freed)),
				MechanicLib.Categories.PERF
			)
		end
	elseif cmd == "pause" then
		self:TogglePause()
	elseif cmd == "clear" then
		self:ClearCurrentTab()
	else
		self:Print(string.format(L["Unknown command: %s"], cmd))
		self:Print(L["Commands: inspect, console, errors, tests, perf, tools, api, reload, gc, pause, copy, clear"])
	end
end

function Mechanic:ToggleMainFrame()
	if self.frame and self.frame:IsVisible() then
		self.frame:Hide()
	else
		if not self.frame then
			self:CreateMainFrame()
		end
		self.frame:Show()
	end
end

function Mechanic:ShowTab(key)
	if not self.frame then
		self:CreateMainFrame()
	end
	self.frame:Show()
	if self.frame.tabs then
		self.frame.tabs:SelectTab(key)
	end
end

function Mechanic:TogglePause()
	local activeTab = self.db.profile.activeTab
	if activeTab == "console" and self.Console then
		self.Console:TogglePause()
	elseif activeTab == "errors" and self.Errors then
		self.Errors:TogglePause()
	end
end

function Mechanic:ClearCurrentTab()
	local activeTab = self.db.profile.activeTab
	if activeTab == "console" and self.Console then
		self.Console:Clear()
	elseif activeTab == "errors" and self.Errors then
		self.Errors:WipeSession()
	elseif activeTab == "tests" and self.Tests then
		self.Tests:ClearResults()
	elseif activeTab == "api" and self.API then
		wipe(self.db.profile.apiTests)
		self.API.lastResults = {}
		-- Refresh if visible
		if self.API.frame and self.API.frame:IsVisible() then
			self.API:OnShow()
		end
	elseif activeTab == "perf" and self.Perf then
		self.Perf:ResetStats()
	end
end

-- Helper to open settings panel (robust for 11.0+)
function Mechanic:OpenSettings()
	local category = self.optionsFrame or "!Mechanic"
	self.Utils:OpenSettings(category)
end

--------------------------------------------------------------------------------
-- DataBroker / Minimap Button (Phase 3)
--------------------------------------------------------------------------------

function Mechanic:SetupDataBroker()
	local LDB = LibStub("LibDataBroker-1.1", true)
	local LDBIcon = LibStub("LibDBIcon-1.0", true)

	if not LDB then
		return
	end

	local MechanicLib = LibStub("MechanicLib-1.0", true)

	self.ldbObj = LDB:NewDataObject("Mechanic", {
		type = "launcher",
		icon = "Interface\\AddOns\\!Mechanic\\assets\\Icons\\icon-minimap-normal-64",
		iconCoords = { 0, 1, 0, 1 },
		label = "Mechanic",
		OnClick = function(_, button)
			if button == "LeftButton" then
				self:ToggleMainFrame()
			elseif button == "RightButton" then
				self:OpenSettings()
			end
		end,
		OnTooltipShow = function(tooltip)
			tooltip:AddLine("|cff00ff00Mechanic|r")
			tooltip:AddLine("|cffffffffLeft-click:|r Toggle window")
			tooltip:AddLine("|cffffffffRight-click:|r Settings")

			-- Show registered addon count
			local count = 0
			if MechanicLib then
				for _ in pairs(MechanicLib:GetRegistered()) do
					count = count + 1
				end
			end
			tooltip:AddLine(" ")
			tooltip:AddLine(string.format("|cff888888%d addons registered|r", count))
		end,
	})

	if LDBIcon then
		LDBIcon:Register("Mechanic", self.ldbObj, self.db.profile.minimap)
	end

	-- Initial icon state
	self:UpdateMinimapIcon()
end

function Mechanic:ToggleMinimapIcon()
	local LDBIcon = LibStub("LibDBIcon-1.0", true)
	if not LDBIcon then
		return
	end

	local minimap = self.db.profile.minimap
	minimap.hide = not minimap.hide

	if minimap.hide then
		LDBIcon:Hide("Mechanic")
	else
		LDBIcon:Show("Mechanic")
	end
end

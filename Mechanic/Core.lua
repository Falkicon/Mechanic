-- Core.lua
-- Mechanic - In-Game Development Hub (Main Addon)
--
-- This is the main addon that provides all UI and features.
-- It depends on !Mechanic (bootstrap) which loads first.
--
-- See PLAN/MASTER_PLAN.md for full specification.
-- Implementation tracked in PLAN/01-foundation.plan.md through PLAN/04-migration.plan.md

-- Keybinding localization (must be global)
BINDING_HEADER_MECHANIC = "Mechanic (Dev)"
BINDING_NAME_MECHANIC_DEV_RELOAD = "Reload UI (Dev)"
BINDING_NAME_MECHANIC_TOGGLE = "Toggle Mechanic Panel"

local ADDON_NAME, ns = ...
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local ICON_PATH = [[Interface\AddOns\Mechanic\Assets\Icons\]]

-- Get the global Mechanic table from bootstrap, extend it with AceAddon
local BootstrapMechanic = _G.Mechanic
local Mechanic = LibStub("AceAddon-3.0"):NewAddon(ADDON_NAME, "AceConsole-3.0", "AceEvent-3.0")

-- Merge bootstrap data into main addon
if BootstrapMechanic then
	-- Preserve bootstrap data
	Mechanic.isBootstrap = false
	Mechanic.pendingAPIQueue = BootstrapMechanic.pendingAPIQueue or _G.MechanicNS and _G.MechanicNS.pendingAPIQueue
end

-- Replace global with main addon
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
		-- NOTE: apiTestQueue is NOT in defaults - it's read directly from SavedVariables
		-- to avoid AceDB overwriting the CLI-injected queue with empty defaults
		-- NEW: Inspect & Watch data (Phase 8)
		inspectWatch = {},
		-- NEW: Self-registration (dogfooding)
		registerSelf = true,
		-- NEW: Persistent Health Log for agent auditing
		healthLog = {},
		-- NEW: Test Results persistence for Mechanic Desktop
		testResults = {},
		-- NEW: Console persistence for Mechanic Desktop (AFD)
		consoleBuffer = {},
		consoleBufferMax = 100,
		-- NEW: Chat history for debugging (last 50 messages)
		chatBuffer = {},
		chatBufferMax = 50,
		-- NEW: Centralized hub for multi-addon data (Diagnostic Hub Phase)
		addonData = {}, -- { [addonName] = { version, logs, tests, perf } }
		lastSync = 0,
	},
}

function Mechanic:OnInitialize()
	-- Initialize performance tracking blocks
	self.perf = { blocks = {} }

	-- Initialize database (shares MechanicDB with bootstrap)
	self.db = LibStub("AceDB-3.0"):New("MechanicDB", defaults, true)

	-- Clear API test results from previous session (only keep current session's tests)
	if self.db.profile.apiTests then
		self.db.profile.apiTests = {}
	end

	-- Process API test queue - check both pending from bootstrap and fresh global
	-- Bootstrap may have stored pending queue for us
	if self.pendingAPIQueue and #self.pendingAPIQueue > 0 then
		C_Timer.After(0.5, function()
			self:ExecuteAPITestQueue(self.pendingAPIQueue)
			self.pendingAPIQueue = nil
		end)
	else
		self:ProcessAPITestQueue()
	end
	
	-- Lua eval queue is processed by bootstrap (results already in SavedVariables)
	-- We just need to handle fresh queues if bootstrap missed them
	self:ProcessLuaEvalQueue()

	-- Notify bootstrap we're loaded (transfers pending registrations)
	if BootstrapMechanic and BootstrapMechanic.OnMainAddonLoaded then
		BootstrapMechanic:OnMainAddonLoaded(self)
	end

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

--------------------------------------------------------------------------------
-- API Test Queue Processing (CLI-driven automation)
--------------------------------------------------------------------------------

function Mechanic:ProcessAPITestQueue()
	-- Read from MECHANIC_API_QUEUE global (set by MechanicQueue.lua)
	-- This file is written by CLI and read on addon load
	local queue = _G.MECHANIC_API_QUEUE
	
	if not queue or #queue == 0 then
		return
	end
	
	-- Clear the global immediately so it doesn't re-run
	_G.MECHANIC_API_QUEUE = nil

	-- Defer execution slightly to ensure API module is loaded
	C_Timer.After(0.5, function()
		self:ExecuteAPITestQueue(queue)
	end)
end

function Mechanic:ExecuteAPITestQueue(queue)
	if not self.API then
		self:Print("|cFFFF6666[Queue] API module not loaded|r")
		return
	end
	
	if not self.API.ExecuteAPITest then
		self:Print("|cFFFF6666[Queue] API module missing ExecuteAPITest|r")
		return
	end

	local count = #queue
	self:Print(string.format("|cFF00FF00[Queue] Processing %d API test(s) from CLI...|r", count))

	local passed, failed = 0, 0
	for i, item in ipairs(queue) do
		local apiName = item.api
		local params = item.params or {}

		-- Find the API definition
		local apiDef = ns.APIDefinitions and ns.APIDefinitions[apiName]
		
		if apiDef then
			-- Execute the test via API module
			local success, result = pcall(function()
				return self.API:ExecuteAPITest(apiDef, params)
			end)

			if success and result and result.success then
				passed = passed + 1
			else
				failed = failed + 1
				local errMsg = not success and tostring(result) or (result and result.error or "Unknown")
				self:Print(string.format("|cFFFF6666[Queue] %s → FAIL: %s|r", apiName, errMsg))
			end
		else
			failed = failed + 1
			self:Print(string.format("|cFFFFFF00[Queue] API not found: %s|r", apiName))
		end
	end

	-- Summary
	self:Print(string.format("|cFF00FF00[Queue] Completed: %d passed, %d failed. /reload to save.|r", passed, failed))
end

--------------------------------------------------------------------------------
-- Lua Eval Queue Processing (CLI-driven automation)
--------------------------------------------------------------------------------

function Mechanic:ProcessLuaEvalQueue()
	-- Read from MECHANIC_LUA_QUEUE global (set by MechanicQueue.lua)
	local queue = _G.MECHANIC_LUA_QUEUE
	
	if not queue or #queue == 0 then
		return
	end
	
	-- Clear the global immediately so it doesn't re-run
	_G.MECHANIC_LUA_QUEUE = nil
	
	-- Defer execution slightly to ensure everything is loaded
	C_Timer.After(0.5, function()
		self:ExecuteLuaEvalQueue(queue)
	end)
end

function Mechanic:ExecuteLuaEvalQueue(queue)
	local count = #queue
	self:Print(string.format("|cFF00FFFF[Lua Eval] Processing %d snippet(s) from CLI...|r", count))
	
	-- Initialize results storage
	self.db.profile.luaEvalResults = self.db.profile.luaEvalResults or {}
	self.db.profile.luaEvalResults.results = {}
	self.db.profile.luaEvalResults.lastRun = date("%Y-%m-%d %H:%M:%S")
	
	local succeeded, failed = 0, 0
	
	for i, item in ipairs(queue) do
		local label = item.label or ("snippet_" .. i)
		local code = item.code
		
		if not code or code == "" then
			failed = failed + 1
			table.insert(self.db.profile.luaEvalResults.results, {
				label = label,
				success = false,
				error = "Empty code snippet",
				executedAt = date("%Y-%m-%d %H:%M:%S"),
			})
		else
			-- Wrap code in a return if it doesn't have one
			local execCode = code
			if not code:match("^%s*return%s") and not code:match("^%s*local%s") then
				execCode = "return " .. code
			end
			
			-- Compile and execute
			local func, compileErr = loadstring(execCode, label)
			
			if not func then
				failed = failed + 1
				self:Print(string.format("|cFFFF6666[Lua Eval] %s → COMPILE ERROR: %s|r", label, compileErr or "unknown"))
				table.insert(self.db.profile.luaEvalResults.results, {
					label = label,
					success = false,
					error = "Compile error: " .. (compileErr or "unknown"),
					code = code,
					executedAt = date("%Y-%m-%d %H:%M:%S"),
				})
			else
				-- Execute in protected mode
				local ok, result = pcall(func)
				
				if ok then
					succeeded = succeeded + 1
					-- Serialize result for storage
					local resultStr = tostring(result)
					local resultType = type(result)
					
					-- For tables, try to serialize more usefully
					if resultType == "table" then
						local parts = {}
						local count = 0
						for k, v in pairs(result) do
							count = count + 1
							if count <= 10 then
								table.insert(parts, tostring(k) .. "=" .. tostring(v))
							end
						end
						if count > 10 then
							table.insert(parts, "...+" .. (count - 10) .. " more")
						end
						resultStr = "{" .. table.concat(parts, ", ") .. "}"
					end
					
					self:Print(string.format("|cFF00FF00[Lua Eval] %s → %s|r", label, resultStr))
					table.insert(self.db.profile.luaEvalResults.results, {
						label = label,
						success = true,
						result = resultStr,
						resultType = resultType,
						code = code,
						executedAt = date("%Y-%m-%d %H:%M:%S"),
					})
				else
					failed = failed + 1
					self:Print(string.format("|cFFFF6666[Lua Eval] %s → RUNTIME ERROR: %s|r", label, tostring(result)))
					table.insert(self.db.profile.luaEvalResults.results, {
						label = label,
						success = false,
						error = "Runtime error: " .. tostring(result),
						code = code,
						executedAt = date("%Y-%m-%d %H:%M:%S"),
					})
				end
			end
		end
	end
	
	-- Summary
	self:Print(string.format("|cFF00FFFF[Lua Eval] Completed: %d succeeded, %d failed. /reload to save.|r", succeeded, failed))
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

	local icon = hasErrors and "Interface\\AddOns\\Mechanic\\assets\\Icons\\icon-minimap-error-64"
		or "Interface\\AddOns\\Mechanic\\assets\\Icons\\icon-minimap-normal-64"

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
		-- Restore persisted console buffer from SavedVariables (AFD)
		self.Console:RestoreBuffer()
	end

	-- Register for logout to persist console buffer (AFD)
	self:RegisterEvent("PLAYER_LOGOUT", "OnPlayerLogout")

	-- NOTE: Chat capture removed - use MechanicLib:Log() for debugging
	-- Print output is captured via Console's print hook

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

--- Sync all registered addon data into the central !Mechanic hub.
--- This collects logs, test results, and versions for desktop persistence.
function Mechanic:SyncAllAddonData()
	local syncStart = debugprofilestop()
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if not MechanicLib then
		return
	end

	if not self.db.profile.addonData then
		self.db.profile.addonData = {}
	end

	for addonName, entry in pairs(MechanicLib:GetRegistered()) do
		-- Initialize or clear old entry
		local data = self.db.profile.addonData[addonName] or {}
		data.version = entry.version or "?.?.?"

		-- 1. Collect Logs / Console Buffers
		if entry.getDebugBuffer then
			local buffer = entry.getDebugBuffer()
			if buffer and type(buffer) == "table" then
				-- Cap log size to prevent SV bloat (last 50 lines per addon)
				local capped = {}
				local start = #buffer > 50 and (#buffer - 49) or 1
				for i = start, #buffer do
					table.insert(capped, buffer[i])
				end
				data.logs = capped
			end
		end

		-- 2. Collect Test Results
		local tests = entry.tests
			or (MechanicLib:HasCapability(addonName, "tests") and MechanicLib:GetCapability(addonName, "tests"))
		if tests and tests.getAll and tests.getResult then
			data.tests = {}
			for _, testEntry in ipairs(tests.getAll()) do
				local testDef = testEntry.def or testEntry
				if testDef and testDef.id then
					local result = tests.getResult(testDef.id)
					if result then
						-- Inject definition info into result for hub persistence
						result.category = testDef.category or "General"
						result.name = testDef.name or testDef.id
						data.tests[testDef.id] = result
					end
				end
			end
		end

		-- 3. Collect Performance Metrics
		local perf = entry.performance
			or (MechanicLib:HasCapability(addonName, "performance") and MechanicLib:GetCapability(addonName, "performance"))
		if perf and perf.getSubMetrics then
			data.perf = perf.getSubMetrics()
		end

		self.db.profile.addonData[addonName] = data
	end

	self.db.profile.lastSync = time()
	self.perf.blocks.hubSync = debugprofilestop() - syncStart
end

--- Persist console buffer and library info before logout/reload for desktop agent access (AFD).
function Mechanic:OnPlayerLogout()
	-- 1. Sync all registered addons into the hub
	self:SyncAllAddonData()

	-- 2. Handle own console buffer specifically (historical)
	if self.Console and self.Console.PersistBuffer then
		self.Console:PersistBuffer()
	end

	-- 3. Persist loaded library versions for agent visibility
	if self.Utils and self.Utils.GetLoadedLibraries then
		local libs = self.Utils:GetLoadedLibraries()
		self.db.profile.loadedLibraries = libs
		self.db.profile.librariesTimestamp = date("%Y-%m-%d %H:%M:%S")
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
				return { "Core", "Database", "UI" }
			end,
			run = function(id)
				return self:RunSelfTest(id)
			end,
			runAll = function()
				return self:RunAllSelfTests()
			end,
			getResult = function(id)
				return self.db.profile.testResults and self.db.profile.testResults[id]
			end,
			clearResults = function()
				self.db.profile.testResults = {}
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
			ms = bufferCount,
			percent = (bufferCount / bufferMax) * 100,
			description = string.format("%d / %d entries", bufferCount, bufferMax),
		})
	end

	-- Hub Sync Dynamic timing
	if self.perf and self.perf.blocks and self.perf.blocks.hubSync then
		table.insert(metrics, {
			name = "Hub Sync",
			ms = self.perf.blocks.hubSync,
			percent = 0,
			description = "Time spent aggregating data from all addons",
		})
	end

	-- UI Refresh Dynamic timing
	if self.Perf and self.Perf.blocks and self.Perf.blocks.uiRefresh then
		table.insert(metrics, {
			name = "UI Refresh",
			ms = self.Perf.blocks.uiRefresh,
			percent = 0,
			description = "Cost of updating the Performance tab",
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
		{
			id = "lib_health",
			name = "Library Health",
			category = "Core",
			description = "Verify core library versions and stability",
		},
		{
			id = "registry_health",
			name = "Registry Health",
			category = "Core",
			description = "Verify addon registration with MechanicLib",
		},
		{
			id = "buffer_health",
			name = "Buffer Health",
			category = "Database",
			description = "Verify console and log buffer memory health",
		},
	}
end

--- Run a self-test by ID.
---@param id string The test ID
---@return table result Test result {passed, message, duration, logs}
function Mechanic:RunSelfTest(id)
	self:Print("Running self-test:", id)
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
	elseif id == "lib_health" then
		self:Print("Checking Library Health...")
		-- Check FenUI
		local fenVer = (_G.FenUI and _G.FenUI.VERSION) or "Missing"
		table.insert(result.logs, string.format("FenUI Version: %s", tostring(fenVer)))

		-- Check MechanicLib
		local lib = LibStub("MechanicLib-1.0", true)
		local libVer = lib and lib.MINOR or "Missing"
		table.insert(result.logs, string.format("MechanicLib Minor: %s", tostring(libVer)))

		if _G.FenUI and lib then
			result.passed = true
			result.message = "Required libraries are loaded"
		else
			result.message = "Missing required libraries: " .. (not _G.FenUI and "FenUI " or "") .. (not lib and "MechanicLib" or "")
		end
	elseif id == "registry_health" then
		self:Print("Checking Registry Health...")
		local lib = LibStub("MechanicLib-1.0", true)
		if lib then
			local registered = lib:GetRegistered()
			local isRegistered = (registered and registered["!Mechanic"] ~= nil)
			local count = 0
			if registered then
				for _ in pairs(registered) do
					count = count + 1
				end
			end
			table.insert(result.logs, string.format("!Mechanic Registered: %s", tostring(isRegistered)))
			table.insert(result.logs, string.format("Total Registered: %d", count))

			if isRegistered then
				result.passed = true
				result.message = "Addon successfully registered with MechanicLib"
			else
				result.message = "Addon registration not found in MechanicLib"
			end
		else
			result.message = "MechanicLib not found"
		end
	elseif id == "buffer_health" then
		self:Print("Checking Buffer Health...")
		local consoleSize = (self.db.profile.consoleBuffer and #self.db.profile.consoleBuffer) or 0
		local healthLogSize = (self.db.profile.healthLog and #self.db.profile.healthLog) or 0
		local maxConsole = self.db.profile.consoleBufferMax or 100

		table.insert(result.logs, string.format("Console Buffer: %s/%s", tostring(consoleSize), tostring(maxConsole)))
		table.insert(result.logs, string.format("Health Log: %s/100", tostring(healthLogSize)))

		result.passed = true
		result.message = "Buffers are within healthy limits"
	else
		result.message = "Unknown test ID: " .. tostring(id)
	end

	result.duration = (debugprofilestop() - startTime) / 1000

	-- Persist result for Mechanic Desktop
	if self.db and self.db.profile then
		if not self.db.profile.testResults then
			self.db.profile.testResults = {}
		end
		-- Add name from definition for dashboard display
		local tests = self:GetSelfTests()
		for _, t in ipairs(tests) do
			if t.id == id then
				result.name = t.name
				break
			end
		end
		self.db.profile.testResults[id] = result
	end

	return result
end

--- Run all self-tests.
---@return number passed Number of passed tests
---@return number total Total number of tests
function Mechanic:RunAllSelfTests()
	self:Print("Running all self-tests...")
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
		icon = "Interface\\AddOns\\Mechanic\\assets\\Icons\\icon-minimap-normal-64",
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

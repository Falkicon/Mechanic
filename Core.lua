-- Core.lua
-- !Mechanic - In-Game Development Hub
--
-- See PLAN/MASTER_PLAN.md for full specification.
-- Implementation tracked in PLAN/01-foundation.plan.md through PLAN/04-migration.plan.md

local ADDON_NAME, ns = ...

local Mechanic = LibStub("AceAddon-3.0"):NewAddon(ADDON_NAME, "AceConsole-3.0", "AceEvent-3.0")
_G.Mechanic = Mechanic -- Global for MechanicLib:IsEnabled() check

-- Database defaults per MASTER_PLAN Section 7
local defaults = {
	profile = {
		position = { point = "CENTER", x = 0, y = 0 },
		size = { width = 800, height = 600 },
		activeTab = "console",
		bufferSize = 1000,
		showTimestamps = false,
		includeEnvHeader = true,
		includeCharacterInfo = true,
		includeTimestamp = true,
		-- Performance settings (Phase 3)
		autoRefresh = true,
		refreshInterval = 1.0,
		trackEventFrequency = false,
		-- Minimap (Phase 3)
		minimap = {
			hide = false,
		},
		addonSettings = {},
		-- NEW: API test data (Phase 7)
		apiTests = {},
		-- NEW: Inspect & Watch data (Phase 8)
		inspectWatch = {},
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

	self:Print("!Mechanic initialized.")
end

function Mechanic:OnEnable()
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
-- Registration Handlers (called by MechanicLib)
--------------------------------------------------------------------------------

function Mechanic:OnAddonRegistered(name, capabilities)
	-- Notify UI modules if they are interested
	if self.Console and self.Console.RefreshSourceList then
		self.Console:RefreshSourceList()
	end

	if self.Tests and self.Tests.RefreshTree then
		self.Tests:RefreshTree()
		self.Tests:UpdateSummary()
	end

	if self.Tools and self.Tools.RefreshAddonList then
		self.Tools:RefreshAddonList()
	end

	if self.Perf and self.Perf.RefreshNavItems then
		self.Perf:RefreshNavItems()
	end

	-- Check for inspect capability (Phase 8)
	if capabilities and capabilities.inspect and capabilities.inspect.getWatchFrames then
		local MechanicLib = LibStub("MechanicLib-1.0", true)
		if MechanicLib then
			local frames = capabilities.inspect.getWatchFrames()
			if frames then
				for _, data in ipairs(frames) do
					MechanicLib:AddToWatchList(data.frame, data.label, { source = name })
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
	if not self.db.profile.includeEnvHeader then
		return nil
	end

	local lines = {
		"=== Mechanic Export ===",
	}

	-- WoW version + build
	local version, build, _, interface = GetBuildInfo()
	local client = self:GetClientType()
	table.insert(lines, string.format("WoW: %s (%s) | Client: %s | Interface: %d", version, build, client, interface))

	-- Character info (optional)
	if self.db.profile.includeCharacterInfo then
		local name = UnitName("player")
		local realm = GetRealmName()
		local _, class = UnitClass("player")
		local spec = GetSpecialization()
		local specName = spec and select(2, GetSpecializationInfo(spec)) or "None"
		table.insert(lines, string.format("Character: %s-%s (%s, %s)", name, realm, class, specName))
	end

	-- Timestamp (optional)
	if self.db.profile.includeTimestamp then
		table.insert(lines, string.format("Exported: %s", date("%Y-%m-%d %H:%M:%S")))
	end

	-- Registered addons
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib then
		local registered = {}
		for name, caps in pairs(MechanicLib:GetRegistered()) do
			local ver = caps.version or "?"
			table.insert(registered, string.format("%s %s", name, ver))
		end
		if #registered > 0 then
			table.insert(lines, string.format("Registered: %s", table.concat(registered, ", ")))
		end
	end

	return table.concat(lines, "\n")
end

--- Detects the client type (Retail/PTR/Beta).
---@return string client "Retail", "PTR", or "Beta"
function Mechanic:GetClientType()
	-- Try API functions first
	if IsTestBuild and IsTestBuild() then
		return "PTR"
	end
	if IsBetaBuild and IsBetaBuild() then
		return "Beta"
	end

	-- Fallback to portal CVar
	local project = GetCVar("portal") or ""
	if project:find("test") then
		return "PTR"
	elseif project:find("beta") then
		return "Beta"
	else
		return "Retail"
	end
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
	elseif cmd == "console" then
		self:ShowTab("console")
	elseif cmd == "errors" then
		self:ShowTab("errors")
	elseif cmd == "tests" then
		self:ShowTab("tests")
	elseif cmd == "tools" then
		self:ShowTab("tools")
	elseif cmd == "api" then
		self:ShowTab("api")
	elseif cmd == "inspect" then
		self:ShowTab("inspect")
	elseif cmd == "perf" then
		self:ShowTab("perf")
	elseif cmd == "reload" then
		ReloadUI()
	elseif cmd == "gc" then
		local before = collectgarbage("count")
		collectgarbage("collect")
		local after = collectgarbage("count")
		local freed = before - after
		self:Print(string.format("GC: %.1f KB freed (%.1f MB -> %.1f MB)", freed, before / 1024, after / 1024))

		local MechanicLib = LibStub("MechanicLib-1.0", true)
		if MechanicLib then
			MechanicLib:Log("System", string.format("GC executed: %.1f KB freed", freed), MechanicLib.Categories.PERF)
		end
	elseif cmd == "pause" then
		self:TogglePause()
	elseif cmd == "clear" then
		self:ClearCurrentTab()
	else
		self:Print("Unknown command: " .. cmd)
		self:Print("Commands: console, errors, tests, perf, reload, gc, pause, clear")
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
	if InCombatLockdown() then
		self:Print("Settings cannot be opened while in combat.")
		return
	end

	if Settings and Settings.OpenToCategory then
		-- Prefer explicit category object if we have it (from AddToBlizOptions)
		if self.optionsFrame then
			Settings.OpenToCategory(self.optionsFrame)
		else
			-- Fallback to string if object not yet available
			Settings.OpenToCategory("!Mechanic")
		end
	elseif InterfaceOptionsFrame_OpenToCategory then
		InterfaceOptionsFrame_OpenToCategory("!Mechanic")
	end
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

	local dataObj = LDB:NewDataObject("Mechanic", {
		type = "launcher",
		icon = "Interface\\Icons\\Trade_Engineering",
		label = "Mechanic",
		OnClick = function(_, button)
			if button == "LeftButton" then
				self:ToggleMainFrame()
			elseif button == "RightButton" then
				self:OpenSettings()
			end
		end,
		OnTooltipShow = function(tooltip)
			tooltip:AddLine("|cff00ff00!Mechanic|r")
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
		LDBIcon:Register("Mechanic", dataObj, self.db.profile.minimap)
	end
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

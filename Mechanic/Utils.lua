--------------------------------------------------------------------------------
-- Utils.lua
-- !Mechanic - Shared Utility Functions
--
-- Pure functions for formatting, detection, and data manipulation.
-- These are stored in ns.Utils and exposed via Mechanic.Utils.
--------------------------------------------------------------------------------

local ADDON_NAME, ns = ...
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local Utils = {}
ns.Utils = Utils

-- Use shared FenUI utilities if available
local F = FenUI and FenUI.Utils

--------------------------------------------------------------------------------
-- Constants & Colors
--------------------------------------------------------------------------------

-- Inherit shared colors and provide local overrides/additions
Utils.Colors = setmetatable({}, {
	__index = function(_, k)
		local colors = (FenUI and FenUI.Utils and FenUI.Utils.Colors and FenUI.Utils.Colors[k])
		if colors then
			return colors
		end
		-- Return robust defaults if FenUI is missing
		if k == "Impact" then
			return { HIGH = "|cffff4444", CONDITIONAL = "|cffffaa00", RESTRICTED = "|cffffff00", LOW = "|cff00ff00" }
		elseif k == "Status" then
			return {
				pass = "|cff00ff00",
				warn = "|cffffff00",
				fail = "|cffff0000",
				pending = "|cffffcc00",
				default = "|cffffffff",
				not_run = "|cff888888",
			}
		end
		return {}
	end,
})

--------------------------------------------------------------------------------
-- Environment & System
--------------------------------------------------------------------------------

function Utils:GetClientType()
	return F and F:GetClientType() or "Retail"
end
function Utils:GetVersionString()
	return F and F:GetVersionString() or "Unknown"
end
function Utils:GetInterfaceString()
	return F and F:GetInterfaceString() or "Unknown"
end

--- Robustly opens the settings panel for an addon.
---@param categoryName string|table The category name or object
function Utils:OpenSettings(categoryName)
	if InCombatLockdown() then
		print("|cffff4444[Mechanic Error]|r Settings cannot be opened while in combat.")
		return
	end

	if Settings and Settings.OpenToCategory then
		Settings.OpenToCategory(categoryName)
	elseif InterfaceOptionsFrame_OpenToCategory then
		InterfaceOptionsFrame_OpenToCategory(categoryName)
	end
end

--------------------------------------------------------------------------------
-- UI Helpers
--------------------------------------------------------------------------------

--- Generic widget factory to ensure single instance per parent.
function Utils:GetOrCreateWidget(parent, key, creator)
	return F and F:GetOrCreateWidget(parent, key, creator) or creator(parent)
end

--- Returns the current mouse focus frame across all WoW versions.
function Utils:GetMouseFocus()
	return F and F:GetMouseFocus() or _G.GetMouseFocus()
end

--- Wrapper for Blizzard EasyMenu.
---@param menuList table Array of menu definitions
---@param anchor string|table Anchor point or frame (default: "cursor")
function Utils:ShowMenu(menuList, anchor)
	-- Delegate to FenUI.Utils.ShowMenu for cross-version compatibility
	local F = FenUI and FenUI.Utils
	if F and F.ShowMenu then
		F:ShowMenu(menuList, anchor)
		return
	end

	-- Fallback if FenUI.Utils is not available or ShowMenu is missing
	if _G.EasyMenu then
		if not self.menuFrame then
			self.menuFrame = CreateFrame("Frame", "MechanicUtilsMenu", UIParent, "UIDropDownMenuTemplate")
		end
		EasyMenu(menuList, self.menuFrame, anchor or "cursor", 0, 0, "MENU")
	else
		-- Last resort: log to console if no menu system is available
		print("|cffff4444[Mechanic Error]|r No menu system available (EasyMenu and MenuUtil both missing).")
	end
end

--- Resolves a string path to either a frame or a global table.
---@param input string|table The path or object reference
---@return any|nil resolved
function Utils:ResolveFrameOrTable(input)
	if type(input) ~= "string" then
		return input
	end

	-- Try FrameResolver first
	if ns.FrameResolver then
		local frame = ns.FrameResolver:ResolvePath(input)
		if frame then
			return frame
		end
	end

	-- Fallback to global traversal
	local parts = { strsplit(".", input) }
	local current = _G
	for _, part in ipairs(parts) do
		if type(current) ~= "table" then
			return nil
		end
		current = current[part]
		if not current then
			return nil
		end
	end

	return current
end

--------------------------------------------------------------------------------
-- Mechanic Export Header
--------------------------------------------------------------------------------
-- Library Version Detection
--------------------------------------------------------------------------------

--- Gets all loaded libraries with their versions for debugging and exports.
---@return table libraries List of {name, version} pairs
function Utils:GetLoadedLibraries()
	local libraries = {}

	-- FenUI (custom UI framework)
	if FenUI and FenUI.VERSION then
		table.insert(libraries, { name = "FenUI", version = FenUI.VERSION })
	end

	-- MechanicLib
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib and MechanicLib.version then
		table.insert(libraries, { name = "MechanicLib", version = MechanicLib.version })
	end

	-- LibStub-managed libraries (Ace3, etc.)
	if LibStub and LibStub.IterateLibraries then
		for major, lib in LibStub:IterateLibraries() do
			local minor = LibStub.minors and LibStub.minors[major]
			if minor then
				-- Skip showing every Ace library, just show key ones
				local isKeyLib = major:match("^Ace") or major:match("^Lib")
				if isKeyLib then
					-- Format minor version - could be number or string
					local verStr = type(minor) == "number" and ("r" .. minor) or tostring(minor)
					table.insert(libraries, { name = major, version = verStr })
				end
			end
		end
	end

	-- Sort by name for consistent output
	table.sort(libraries, function(a, b)
		return a.name < b.name
	end)

	return libraries
end

--- Formats loaded libraries as a single string for export headers.
---@param maxLibs number|nil Maximum number of libraries to show (default: 5)
---@return string|nil formatted Formatted string or nil if no libraries
function Utils:GetLibrariesString(maxLibs)
	local libraries = self:GetLoadedLibraries()
	if #libraries == 0 then
		return nil
	end

	maxLibs = maxLibs or 5
	local parts = {}
	for i, lib in ipairs(libraries) do
		if i <= maxLibs then
			table.insert(parts, string.format("%s %s", lib.name, lib.version))
		end
	end

	local result = table.concat(parts, ", ")
	if #libraries > maxLibs then
		result = result .. string.format(" (+%d more)", #libraries - maxLibs)
	end

	return result
end

--------------------------------------------------------------------------------
-- Environment Header
--------------------------------------------------------------------------------

--- Generates a header with environment information for copy/paste.
---@param profile table The addon profile containing inclusion settings
---@return string|nil header
function Utils:GetEnvironmentHeader(profile)
	if not profile or not profile.includeEnvHeader then
		return nil
	end

	local lines = {
		"=== Mechanic Export ===",
	}

	-- WoW version + build
	table.insert(
		lines,
		string.format(
			"WoW: %s | Interface: %s",
			tostring(self:GetVersionString() or "Unknown"),
			tostring(self:GetInterfaceString() or "Unknown")
		)
	)

	-- Character info (optional)
	if profile.includeCharacterInfo then
		local name = UnitName("player")
		local realm = GetRealmName()
		local _, class = UnitClass("player")
		local spec = C_SpecializationInfo.GetSpecialization()
		local specName = "None"
		if spec then
			local specInfo = C_SpecializationInfo.GetSpecializationInfo(spec)
			specName = specInfo and specInfo.name or "None"
		end
		table.insert(
			lines,
			string.format(
				"Character: %s-%s (%s, %s)",
				tostring(name or "Unknown"),
				tostring(realm or "Unknown"),
				tostring(class or "Unknown"),
				tostring(specName or "None")
			)
		)
	end

	-- Location info (Zone, Map ID, Coords, Instance state)
	local zone = _G.GetRealZoneText()
	local subzone = _G.GetSubZoneText()
	local mapID = _G.C_Map.GetBestMapForUnit("player")
	local coords = ""
	if mapID then
		local pos = _G.C_Map.GetPlayerMapPosition(mapID, "player")
		if pos then
			local x, y = pos:GetXY()
			coords = string.format(" @ %.1f, %.1f", (x or 0) * 100, (y or 0) * 100)
		end
	end

	local inInstance, _ = _G.IsInInstance()
	local instanceName, _, _, difficultyName, _, _, _, instanceID = _G.GetInstanceInfo()

	local locationInfo = string.format("Location: %s", tostring(zone or "Unknown"))
	if subzone and subzone ~= "" and subzone ~= zone then
		locationInfo = locationInfo .. string.format(" (%s)", tostring(subzone or ""))
	end
	if mapID then
		locationInfo = locationInfo .. string.format(" [Map %d]%s", mapID or 0, tostring(coords or ""))
	end
	table.insert(lines, locationInfo)

	if inInstance then
		table.insert(
			lines,
			string.format(
				"Instance: %s - %s (ID %s)",
				tostring(instanceName or "Unknown"),
				tostring(difficultyName or "Unknown"),
				tostring(instanceID or "?")
			)
		)
	end

	-- State info
	local state = {}
	if _G.InCombatLockdown() then
		table.insert(state, "COMBAT")
	end
	if _G.IsInRaid() then
		table.insert(state, "RAID")
	elseif _G.IsInGroup() then
		table.insert(state, "GROUP")
	end

	-- Add more specific state context
	if _G.UnitAffectingCombat("player") then
		table.insert(state, "AFFECTING_COMBAT")
	end
	if _G.UnitInVehicle("player") then
		table.insert(state, "IN_VEHICLE")
	end

	if #state > 0 then
		table.insert(lines, string.format("State: %s", tostring(table.concat(state, ", ") or "None")))
	end

	-- Timestamp (optional)
	if profile.includeTimestamp then
		table.insert(lines, string.format("Exported: %s", tostring(date("%Y-%m-%d %H:%M:%S") or "Unknown")))
	end

	-- Registered addons
	local MechanicLib = LibStub("MechanicLib-1.0", true)
	if MechanicLib then
		local registered = {}
		for name, caps in pairs(MechanicLib:GetRegistered()) do
			local ver = caps.version or "?"
			table.insert(registered, string.format("%s %s", tostring(name or "Unknown"), tostring(ver or "?")))
		end
		if #registered > 0 then
			table.sort(registered)
			table.insert(lines, string.format("Registered: %s", tostring(table.concat(registered, ", ") or "None")))
		end
	end

	-- Loaded libraries (NEW)
	local libsString = self:GetLibrariesString(6)
	if libsString then
		table.insert(lines, string.format("Libraries: %s", libsString))
	end

	return table.concat(lines, "\n")
end

--- Displays an export dialog with the provided content.
---@param title string The dialog title
---@param content string The content to display for copying
function Utils:ShowExportDialog(title, content)
	if not self.exportDialog then
		local dialog = FenUI:CreatePanel(UIParent, {
			name = "MechanicExportDialog",
			title = L["Export"],
			width = 600,
			height = 450,
			movable = true,
			resizable = true,
			closable = true,
		})
		-- mechanic:ignore-combat (export dialog must work during combat for debugging)
		dialog:SetFrameStrata("DIALOG")
		dialog:SetPoint("CENTER")

		-- Add instructions
		local help = dialog.safeZone:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
		help:SetPoint("TOPLEFT", 8, -4)
		help:SetText(L["Press Ctrl+C to copy the text below."])

		-- Multi-line edit box for content
		local editBox = FenUI:CreateMultiLineEditBox(dialog.safeZone, {
			readOnly = true,
			background = "surfaceInset",
			font = "fontMono",
			autoScroll = false,
		})
		editBox:SetPoint("TOPLEFT", 0, -24)
		editBox:SetPoint("BOTTOMRIGHT", 0, 36)
		dialog.editBox = editBox

		-- Close button at bottom
		local closeBtn = FenUI:CreateButton(dialog.safeZone, {
			text = L["Close"] or "Close",
			width = 100,
			onClick = function()
				dialog:Hide()
			end,
		})
		closeBtn:SetText(L["Close"] or "Close")
		closeBtn:SetPoint("BOTTOM", 0, 8)

		self.exportDialog = dialog
	end

	self.exportDialog:SetTitle(title)
	self.exportDialog.editBox:SetText(content)
	self.exportDialog.editBox:ScrollToTop()
	self.exportDialog:Show()

	-- Auto-focus the edit box for quick copying
	C_Timer.After(0.1, function()
		self.exportDialog.editBox.editBox:SetFocus()
		self.exportDialog.editBox.editBox:HighlightText()
	end)
end

--------------------------------------------------------------------------------
-- Help System
--------------------------------------------------------------------------------

-- Help content for each tab (structured for InfoPanel)
Utils.HelpContent = {
	inspect = {
		title = L["HELP_INSPECT_TITLE"],
		sections = {
			{ heading = L["HELP_INSPECT_OVERVIEW_HEADING"], body = L["HELP_INSPECT_OVERVIEW_BODY"] },
			{ heading = L["HELP_INSPECT_PICK_HEADING"], body = L["HELP_INSPECT_PICK_BODY"] },
			{ heading = L["HELP_INSPECT_PATH_HEADING"], body = L["HELP_INSPECT_PATH_BODY"] },
			{ heading = L["HELP_INSPECT_TREE_HEADING"], body = L["HELP_INSPECT_TREE_BODY"] },
			{ heading = L["HELP_INSPECT_PROPERTIES_HEADING"], body = L["HELP_INSPECT_PROPERTIES_BODY"] },
			{ heading = L["HELP_INSPECT_DETAILS_HEADING"], body = L["HELP_INSPECT_DETAILS_BODY"] },
			{ heading = L["HELP_INSPECT_WATCH_HEADING"], body = L["HELP_INSPECT_WATCH_BODY"] },
			{ heading = L["HELP_INSPECT_EXPORT_HEADING"], body = L["HELP_INSPECT_EXPORT_BODY"] },
		},
	},
	console = {
		title = L["HELP_CONSOLE_TITLE"],
		sections = {
			{ heading = L["HELP_CONSOLE_OVERVIEW_HEADING"], body = L["HELP_CONSOLE_OVERVIEW_BODY"] },
			{ heading = L["HELP_CONSOLE_SOURCE_HEADING"], body = L["HELP_CONSOLE_SOURCE_BODY"] },
			{ heading = L["HELP_CONSOLE_SEARCH_HEADING"], body = L["HELP_CONSOLE_SEARCH_BODY"] },
			{ heading = L["HELP_CONSOLE_DEDUP_HEADING"], body = L["HELP_CONSOLE_DEDUP_BODY"] },
			{ heading = L["HELP_CONSOLE_PAUSE_HEADING"], body = L["HELP_CONSOLE_PAUSE_BODY"] },
			{ heading = L["HELP_CONSOLE_CLEAR_HEADING"], body = L["HELP_CONSOLE_CLEAR_BODY"] },
			{ heading = L["HELP_CONSOLE_EXPORT_HEADING"], body = L["HELP_CONSOLE_EXPORT_BODY"] },
		},
	},
	errors = {
		title = L["HELP_ERRORS_TITLE"],
		sections = {
			{ heading = L["HELP_ERRORS_OVERVIEW_HEADING"], body = L["HELP_ERRORS_OVERVIEW_BODY"] },
			{ heading = L["HELP_ERRORS_SESSION_HEADING"], body = L["HELP_ERRORS_SESSION_BODY"] },
			{ heading = L["HELP_ERRORS_SOURCE_HEADING"], body = L["HELP_ERRORS_SOURCE_BODY"] },
			{ heading = L["HELP_ERRORS_NAV_HEADING"], body = L["HELP_ERRORS_NAV_BODY"] },
			{ heading = L["HELP_ERRORS_PAUSE_HEADING"], body = L["HELP_ERRORS_PAUSE_BODY"] },
			{ heading = L["HELP_ERRORS_WIPE_HEADING"], body = L["HELP_ERRORS_WIPE_BODY"] },
			{ heading = L["HELP_ERRORS_EXPORT_HEADING"], body = L["HELP_ERRORS_EXPORT_BODY"] },
			{ heading = L["HELP_ERRORS_BUGGRABBER_HEADING"], body = L["HELP_ERRORS_BUGGRABBER_BODY"] },
		},
	},
	tests = {
		title = L["HELP_TESTS_TITLE"],
		sections = {
			{ heading = L["HELP_TESTS_OVERVIEW_HEADING"], body = L["HELP_TESTS_OVERVIEW_BODY"] },
			{ heading = L["HELP_TESTS_TREE_HEADING"], body = L["HELP_TESTS_TREE_BODY"] },
			{ heading = L["HELP_TESTS_RUN_HEADING"], body = L["HELP_TESTS_RUN_BODY"] },
			{ heading = L["HELP_TESTS_AUTO_HEADING"], body = L["HELP_TESTS_AUTO_BODY"] },
			{ heading = L["HELP_TESTS_DETAILS_HEADING"], body = L["HELP_TESTS_DETAILS_BODY"] },
			{ heading = L["HELP_TESTS_STATUS_HEADING"], body = L["HELP_TESTS_STATUS_BODY"] },
			{ heading = L["HELP_TESTS_EXPORT_HEADING"], body = L["HELP_TESTS_EXPORT_BODY"] },
		},
	},
	perf = {
		title = L["HELP_PERF_TITLE"],
		sections = {
			{ heading = L["HELP_PERF_OVERVIEW_HEADING"], body = L["HELP_PERF_OVERVIEW_BODY"] },
			{ heading = L["HELP_PERF_GENERAL_HEADING"], body = L["HELP_PERF_GENERAL_BODY"] },
			{ heading = L["HELP_PERF_ADDONS_HEADING"], body = L["HELP_PERF_ADDONS_BODY"] },
			{ heading = L["HELP_PERF_CPU_HEADING"], body = L["HELP_PERF_CPU_BODY"] },
			{ heading = L["HELP_PERF_REFRESH_HEADING"], body = L["HELP_PERF_REFRESH_BODY"] },
			{ heading = L["HELP_PERF_SUBMETRICS_HEADING"], body = L["HELP_PERF_SUBMETRICS_BODY"] },
			{ heading = L["HELP_PERF_RESET_HEADING"], body = L["HELP_PERF_RESET_BODY"] },
			{ heading = L["HELP_PERF_EXPORT_HEADING"], body = L["HELP_PERF_EXPORT_BODY"] },
		},
	},
	tools = {
		title = L["HELP_TOOLS_TITLE"],
		sections = {
			{ heading = L["HELP_TOOLS_OVERVIEW_HEADING"], body = L["HELP_TOOLS_OVERVIEW_BODY"] },
			{ heading = L["HELP_TOOLS_ADDON_HEADING"], body = L["HELP_TOOLS_ADDON_BODY"] },
			{ heading = L["HELP_TOOLS_PANEL_HEADING"], body = L["HELP_TOOLS_PANEL_BODY"] },
			{ heading = L["HELP_TOOLS_REGISTER_HEADING"], body = L["HELP_TOOLS_REGISTER_BODY"] },
			{ heading = L["HELP_TOOLS_EXPORT_HEADING"], body = L["HELP_TOOLS_EXPORT_BODY"] },
		},
	},
	api = {
		title = L["HELP_API_TITLE"],
		sections = {
			{ heading = L["HELP_API_OVERVIEW_HEADING"], body = L["HELP_API_OVERVIEW_BODY"] },
			{ heading = L["HELP_API_BROWSER_HEADING"], body = L["HELP_API_BROWSER_BODY"] },
			{ heading = L["HELP_API_PARAMS_HEADING"], body = L["HELP_API_PARAMS_BODY"] },
			{ heading = L["HELP_API_RUN_HEADING"], body = L["HELP_API_RUN_BODY"] },
			{ heading = L["HELP_API_CATEGORY_HEADING"], body = L["HELP_API_CATEGORY_BODY"] },
			{ heading = L["HELP_API_MIDNIGHT_HEADING"], body = L["HELP_API_MIDNIGHT_BODY"] },
			{ heading = L["HELP_API_NOTES_HEADING"], body = L["HELP_API_NOTES_BODY"] },
			{ heading = L["HELP_API_EXPORT_HEADING"], body = L["HELP_API_EXPORT_BODY"] },
		},
	},
}

--- Displays a help dialog for a specific tab.
---@param tabKey string The tab key (e.g., "inspect", "console")
function Utils:ShowHelpDialog(tabKey)
	local content = self.HelpContent[tabKey]
	if not content then
		return
	end

	-- Destroy existing dialog to pick up code changes (development mode)
	if self.helpDialog then
		self.helpDialog:Hide()
		self.helpDialog:SetParent(nil)
		self.helpDialog = nil
	end

	-- Create fresh dialog
	self.helpDialog = FenUI:CreateInfoPanel(UIParent, {
		title = L["Help"],
		width = 600,
		height = 550,
		movable = true,
		closable = true,
	})

	-- Update content and show
	self.helpDialog:SetTitle(content.title)
	self.helpDialog:SetSections(content.sections)
	self.helpDialog:ScrollToTop()
	self.helpDialog:Show()
end

--------------------------------------------------------------------------------
-- Formatting & Metrics
--------------------------------------------------------------------------------

function Utils:FormatMemory(kb)
	return F and F:FormatMemory(kb) or tostring(kb)
end
function Utils:FormatDuration(seconds)
	return F and F:FormatDuration(seconds) or tostring(seconds)
end
function Utils:FormatValue(value, options)
	return F and F:FormatValue(value, options) or tostring(value)
end
function Utils:CountSecrets(results)
	return F and F:CountSecrets(results) or 0
end
function Utils:DeepCopy(orig)
	return F and F:DeepCopy(orig) or orig
end
function Utils:SafeCall(func, ...)
	return F and F:SafeCall(func, ...) or pcall(func, ...)
end

--- Returns standard performance metrics (FPS, Latency, Lua Memory).
---@return table metrics {fps, latencyHome, latencyWorld, luaMemory}
function Utils:GetExtendedMetrics()
	local fps = GetFramerate()
	local _, _, latencyHome, latencyWorld = GetNetStats()
	local luaMemory = collectgarbage("count") -- KB

	return {
		fps = fps,
		latencyHome = latencyHome,
		latencyWorld = latencyWorld,
		luaMemory = luaMemory,
	}
end

--------------------------------------------------------------------------------
-- Error Analysis (BugGrabber specific)
--------------------------------------------------------------------------------

--- Detects the source addon from an error message or stack trace
function Utils:DetectErrorSource(errorMsg)
	if not errorMsg then
		return nil
	end

	-- Look for addon name in path (e.g., "ActionHud\Core.lua" or "ActionHud/Core.lua")
	local addon = errorMsg:match("([%w_!]+)[/\\]")
	if addon then
		return addon
	end

	-- Look for Interface/AddOns path (forward slash)
	addon = errorMsg:match("Interface/AddOns/([%w_!]+)/")
	if addon then
		return addon
	end

	return nil
end

--- Colorizes a stack trace line for UI display
function Utils:ColorizeStackLine(line)
	-- Remove Interface/AddOns prefix for readability
	local cleanLine = line:gsub("[%.I][%.n][%.t][%.e][%.r]face/", "")
	cleanLine = cleanLine:gsub("%.?%.?%.?/?AddOns/", "")

	-- Highlight line numbers
	cleanLine = cleanLine:gsub(":(%d+)", ":|cff00ff00%1|r")

	-- Highlight lua files
	cleanLine = cleanLine:gsub("([^/]+%.lua)", "|cffffffff%1|r")

	return cleanLine
end

--- Colorizes Lua locals string for UI display
function Utils:ColorizeLocals(locals)
	if not locals then
		return ""
	end
	local result = locals
	-- Highlight variable names
	result = result:gsub("(%s-)([%a_][%a_%d]*) = ", "%1|cffffff80%2|r = ")
	-- Highlight nil
	result = result:gsub("= nil", "= |cffff7f7fnil|r")
	-- Highlight numbers
	result = result:gsub("= (%-?[%d%.]+)", "= |cffff7fff%1|r")
	return result
end

--- Formats a BugGrabber error object into a colorized string.
function Utils:FormatError(err)
	if not err then
		return "Unknown Error"
	end
	local lines = {}

	-- Count and message
	table.insert(lines, string.format("|cffffffff%dx|r %s", err.counter or 1, tostring(err.message or "Unknown Error")))
	table.insert(lines, "")

	-- Stack trace
	if err.stack then
		table.insert(lines, "|cff888888Stack:|r")
		for line in err.stack:gmatch("[^\n]+") do
			table.insert(lines, string.format("  %s", tostring(self:ColorizeStackLine(line) or line)))
		end
		table.insert(lines, "")
	end

	-- Locals
	if err.locals then
		table.insert(lines, "|cff888888Locals:|r")
		table.insert(lines, tostring(self:ColorizeLocals(err.locals) or ""))
	end

	return table.concat(lines, "\n")
end

return Utils

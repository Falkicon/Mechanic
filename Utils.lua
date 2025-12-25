-- Utils.lua
-- !Mechanic - Shared Utility Functions
--
-- Pure functions for formatting, detection, and data manipulation.
-- These are stored in ns.Utils and exposed via Mechanic.Utils.

local ADDON_NAME, ns = ...
local Utils = {}
ns.Utils = Utils

--------------------------------------------------------------------------------
-- Environment Detection
--------------------------------------------------------------------------------

--- Detects the client type (Retail/PTR/Beta).
---@return string client "Retail", "PTR", or "Beta"
function Utils:GetClientType()
	-- 1. Try native build type checks (standard WoW API globals)
	if _G.IsBetaBuild and _G.IsBetaBuild() then
		return "Beta"
	end
	if _G.IsTestBuild and _G.IsTestBuild() then
		return "PTR"
	end

	-- 2. Fallback to portal CVar (very reliable for developers)
	local project = GetCVar("portal") or ""
	if project:find("test") then
		return "PTR"
	elseif project:find("beta") then
		return "Beta"
	end

	-- 3. Final fallback based on interface version during transition
	local _, _, _, interface = GetBuildInfo()
	if interface >= 120000 then
		return "Retail"
	end

	return "Retail"
end

--- Returns a formatted version string: "11.0.5 (57212)"
---@return string versionString
function Utils:GetVersionString()
	local version, build = GetBuildInfo()
	return string.format("%s (%s)", version, build)
end

--- Returns a formatted interface string with client type: "110005 (Retail)"
---@return string interfaceString
function Utils:GetInterfaceString()
	local _, _, _, interface = GetBuildInfo()
	local client = self:GetClientType()
	return string.format("%d (%s)", interface, client)
end

--------------------------------------------------------------------------------
-- Formatting Helpers
--------------------------------------------------------------------------------

--- Formats memory usage in KB or MB
---@param kb number Memory in KB
---@return string formatted
function Utils:FormatMemory(kb)
	if kb >= 1024 then
		return string.format("%.1f MB", kb / 1024)
	else
		return string.format("%.0f KB", kb)
	end
end

--- Formats a duration in seconds to "Xm Ys"
---@param seconds number
---@return string formatted
function Utils:FormatDuration(seconds)
	local mins = math.floor(seconds / 60)
	local secs = math.floor(seconds % 60)
	return string.format("%dm %ds", mins, secs)
end

--------------------------------------------------------------------------------
-- Error Analysis & Formatting
--------------------------------------------------------------------------------

--- Detects the source addon from an error message or stack trace
---@param errorMsg string
---@return string|nil addonName
function Utils:DetectErrorSource(errorMsg)
	if not errorMsg then return nil end
	
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
---@param line string
---@return string colorizedLine
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
---@param locals string
---@return string colorizedLocals
function Utils:ColorizeLocals(locals)
	if not locals then return "" end
	local result = locals
	-- Highlight variable names
	result = result:gsub("(%s-)([%a_][%a_%d]*) = ", "%1|cffffff80%2|r = ")
	-- Highlight nil
	result = result:gsub("= nil", "= |cffff7f7fnil|r")
	-- Highlight numbers
	result = result:gsub("= (%-?[%d%.]+)", "= |cffff7fff%1|r")
	return result
end

return Utils


--------------------------------------------------------------------------------
-- FenUI.Utils.Environment
-- Client detection, version strings, and Midnight (12.0) flags.
--------------------------------------------------------------------------------

local Utils = FenUI.Utils

-- Midnight (12.0) compatibility flag
-- Threshold 120000 is for 12.0.0+ (PTR/Pre-patch).
local _, _, _, interface = GetBuildInfo()
Utils.IS_MIDNIGHT = (interface or 0) >= 120000

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
	if self.IS_MIDNIGHT then
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

-- Timer font helper - maps string values to Blizzard font names
local fontNameMap = {
	["small"] = "GameFontHighlightSmallOutline",
	["medium"] = "GameFontHighlightOutline",
	["large"] = "GameFontHighlightLargeOutline",
	["huge"] = "GameFontHighlightHugeOutline",
}

--- Maps a size string or number to a Blizzard font name.
---@param size string|number
---@return string fontName
function Utils:GetTimerFont(size)
	if type(size) == "string" then
		return fontNameMap[size] or "GameFontHighlightOutline"
	end
	size = size or 10
	if size <= 9 then
		return "GameFontHighlightSmallOutline"
	elseif size <= 12 then
		return "GameFontHighlightOutline"
	elseif size <= 15 then
		return "GameFontHighlightLargeOutline"
	else
		return "GameFontHighlightHugeOutline"
	end
end

-- Capability Detection (consolidated from ActionHud)
Utils.Cap = Utils.Cap or {}

function Utils:DetectCapabilities()
	local Cap = self.Cap

	Cap.HasSecondsFormatter = (type(_G.SecondsFormatter) ~= "nil")
	Cap.HasHealCalculator = (type(_G.CreateUnitHealPredictionCalculator) ~= "nil")

	if not self.IS_MIDNIGHT then
		Cap.IsAuraLegacy = true
	else
		Cap.IsAuraLegacy = (_G.C_UnitAuras and type(_G.C_UnitAuras.GetAuraDurationRemaining) ~= "nil")
	end

	Cap.HasBooleanColor = (_G.C_CurveUtil and type(_G.C_CurveUtil.EvaluateColorFromBoolean) ~= "nil")
	Cap.HasDurationUtil = (_G.C_DurationUtil and type(_G.C_DurationUtil.CreateDuration) ~= "nil")
	Cap.HasSecrecyQueries = (type(_G.GetSpellAuraSecrecy) ~= "nil")

	if not self.IS_MIDNIGHT then
		Cap.IsRoyal = false
	else
		Cap.IsRoyal = Cap.HasSecondsFormatter or not Cap.IsAuraLegacy or Cap.HasDurationUtil or Cap.HasSecrecyQueries
	end
end

-- Initialize capabilities
Utils:DetectCapabilities()

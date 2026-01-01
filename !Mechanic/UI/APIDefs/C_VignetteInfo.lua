-- Generated APIDefinitions for namespace: C_VignetteInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_VignetteInfo.FindBestUniqueVignette"] = {
	key = "C_VignetteInfo.FindBestUniqueVignette",
	name = "FindBestUniqueVignette",
	category = "combat_midnight",
	subcategory = "c_vignetteinfo",
	func = _G["C_VignetteInfo"] and _G["C_VignetteInfo"]["FindBestUniqueVignette"],
	funcPath = "C_VignetteInfo.FindBestUniqueVignette",
	params = { { name = "vignetteGUIDs", type = "table", default = nil } },
	returns = { { name = "bestUniqueVignetteIndex", type = "luaIndex", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VignetteInfo.GetHealthPercent"] = {
	key = "C_VignetteInfo.GetHealthPercent",
	name = "GetHealthPercent",
	category = "combat_midnight",
	subcategory = "c_vignetteinfo",
	func = _G["C_VignetteInfo"] and _G["C_VignetteInfo"]["GetHealthPercent"],
	funcPath = "C_VignetteInfo.GetHealthPercent",
	params = { { name = "vignetteGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "healthPct", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VignetteInfo.GetRecommendedGroupSize"] = {
	key = "C_VignetteInfo.GetRecommendedGroupSize",
	name = "GetRecommendedGroupSize",
	category = "combat_midnight",
	subcategory = "c_vignetteinfo",
	func = _G["C_VignetteInfo"] and _G["C_VignetteInfo"]["GetRecommendedGroupSize"],
	funcPath = "C_VignetteInfo.GetRecommendedGroupSize",
	params = { { name = "vignetteGUID", type = "WOWGUID", default = nil } },
	returns = {
		{ name = "minGroupSize", type = "number", canBeSecret = false },
		{ name = "maxGroupSize", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VignetteInfo.GetVignetteInfo"] = {
	key = "C_VignetteInfo.GetVignetteInfo",
	name = "GetVignetteInfo",
	category = "combat_midnight",
	subcategory = "c_vignetteinfo",
	func = _G["C_VignetteInfo"] and _G["C_VignetteInfo"]["GetVignetteInfo"],
	funcPath = "C_VignetteInfo.GetVignetteInfo",
	params = {
		{
			name = "vignetteGUID",
			type = "WOWGUID",
			default = nil,
			examples = { { value = "guid", label = "Plumber" } },
		},
	},
	returns = { { name = "vignetteInfo", type = "VignetteInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VignetteInfo.GetVignettePosition"] = {
	key = "C_VignetteInfo.GetVignettePosition",
	name = "GetVignettePosition",
	category = "combat_midnight",
	subcategory = "c_vignetteinfo",
	func = _G["C_VignetteInfo"] and _G["C_VignetteInfo"]["GetVignettePosition"],
	funcPath = "C_VignetteInfo.GetVignettePosition",
	params = {
		{ name = "vignetteGUID", type = "WOWGUID", default = nil },
		{ name = "uiMapID", type = "number", default = nil },
	},
	returns = {
		{ name = "vignettePosition", type = "vector2", canBeSecret = false },
		{ name = "vignetteFacing", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

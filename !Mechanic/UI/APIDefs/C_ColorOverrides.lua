-- Generated APIDefinitions for namespace: C_ColorOverrides
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ColorOverrides.GetColorForQuality"] = {
	key = "C_ColorOverrides.GetColorForQuality",
	name = "GetColorForQuality",
	category = "combat_midnight",
	subcategory = "c_coloroverrides",
	func = _G["C_ColorOverrides"] and _G["C_ColorOverrides"]["GetColorForQuality"],
	funcPath = "C_ColorOverrides.GetColorForQuality",
	params = { { name = "quality", type = "ItemQuality", default = nil } },
	returns = { { name = "color", type = "colorRGBA", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ColorOverrides.GetColorOverrideInfo"] = {
	key = "C_ColorOverrides.GetColorOverrideInfo",
	name = "GetColorOverrideInfo",
	category = "combat_midnight",
	subcategory = "c_coloroverrides",
	func = _G["C_ColorOverrides"] and _G["C_ColorOverrides"]["GetColorOverrideInfo"],
	funcPath = "C_ColorOverrides.GetColorOverrideInfo",
	params = { { name = "overrideType", type = "ColorOverride", default = nil } },
	returns = { { name = "overrideInfo", type = "ColorOverrideInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ColorOverrides.GetDefaultColorForQuality"] = {
	key = "C_ColorOverrides.GetDefaultColorForQuality",
	name = "GetDefaultColorForQuality",
	category = "combat_midnight",
	subcategory = "c_coloroverrides",
	func = _G["C_ColorOverrides"] and _G["C_ColorOverrides"]["GetDefaultColorForQuality"],
	funcPath = "C_ColorOverrides.GetDefaultColorForQuality",
	params = { { name = "quality", type = "ItemQuality", default = nil } },
	returns = { { name = "color", type = "colorRGBA", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ColorOverrides.RemoveColorOverride"] = {
	key = "C_ColorOverrides.RemoveColorOverride",
	name = "RemoveColorOverride",
	category = "combat_midnight",
	subcategory = "c_coloroverrides",
	func = _G["C_ColorOverrides"] and _G["C_ColorOverrides"]["RemoveColorOverride"],
	funcPath = "C_ColorOverrides.RemoveColorOverride",
	params = { { name = "overrideType", type = "ColorOverride", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ColorOverrides.SetColorOverride"] = {
	key = "C_ColorOverrides.SetColorOverride",
	name = "SetColorOverride",
	category = "combat_midnight",
	subcategory = "c_coloroverrides",
	func = _G["C_ColorOverrides"] and _G["C_ColorOverrides"]["SetColorOverride"],
	funcPath = "C_ColorOverrides.SetColorOverride",
	params = {
		{ name = "overrideType", type = "ColorOverride", default = nil },
		{ name = "color", type = "colorRGBA", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

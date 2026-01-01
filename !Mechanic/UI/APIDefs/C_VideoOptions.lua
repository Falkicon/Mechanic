-- Generated APIDefinitions for namespace: C_VideoOptions
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_VideoOptions.GetDefaultGameWindowSize"] = {
	key = "C_VideoOptions.GetDefaultGameWindowSize",
	name = "GetDefaultGameWindowSize",
	category = "combat_midnight",
	subcategory = "c_videooptions",
	func = _G["C_VideoOptions"] and _G["C_VideoOptions"]["GetDefaultGameWindowSize"],
	funcPath = "C_VideoOptions.GetDefaultGameWindowSize",
	params = { { name = "monitor", type = "number", default = nil } },
	returns = { { name = "size", type = "vector2", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VideoOptions.GetGameWindowSizes"] = {
	key = "C_VideoOptions.GetGameWindowSizes",
	name = "GetGameWindowSizes",
	category = "combat_midnight",
	subcategory = "c_videooptions",
	func = _G["C_VideoOptions"] and _G["C_VideoOptions"]["GetGameWindowSizes"],
	funcPath = "C_VideoOptions.GetGameWindowSizes",
	params = {
		{ name = "monitor", type = "number", default = nil },
		{ name = "fullscreen", type = "bool", default = nil },
	},
	returns = { { name = "sizes", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VideoOptions.SetGameWindowSize"] = {
	key = "C_VideoOptions.SetGameWindowSize",
	name = "SetGameWindowSize",
	category = "combat_midnight",
	subcategory = "c_videooptions",
	func = _G["C_VideoOptions"] and _G["C_VideoOptions"]["SetGameWindowSize"],
	funcPath = "C_VideoOptions.SetGameWindowSize",
	params = { { name = "x", type = "number", default = nil }, { name = "y", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

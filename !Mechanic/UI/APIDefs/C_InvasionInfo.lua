-- Generated APIDefinitions for namespace: C_InvasionInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_InvasionInfo.GetInvasionForUiMapID"] = {
	key = "C_InvasionInfo.GetInvasionForUiMapID",
	name = "GetInvasionForUiMapID",
	category = "combat_midnight",
	subcategory = "c_invasioninfo",
	func = _G["C_InvasionInfo"] and _G["C_InvasionInfo"]["GetInvasionForUiMapID"],
	funcPath = "C_InvasionInfo.GetInvasionForUiMapID",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "invasionID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_InvasionInfo.GetInvasionInfo"] = {
	key = "C_InvasionInfo.GetInvasionInfo",
	name = "GetInvasionInfo",
	category = "combat_midnight",
	subcategory = "c_invasioninfo",
	func = _G["C_InvasionInfo"] and _G["C_InvasionInfo"]["GetInvasionInfo"],
	funcPath = "C_InvasionInfo.GetInvasionInfo",
	params = { { name = "invasionID", type = "number", default = nil } },
	returns = { { name = "invasionInfo", type = "InvasionMapInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_InvasionInfo.GetInvasionTimeLeft"] = {
	key = "C_InvasionInfo.GetInvasionTimeLeft",
	name = "GetInvasionTimeLeft",
	category = "combat_midnight",
	subcategory = "c_invasioninfo",
	func = _G["C_InvasionInfo"] and _G["C_InvasionInfo"]["GetInvasionTimeLeft"],
	funcPath = "C_InvasionInfo.GetInvasionTimeLeft",
	params = { { name = "invasionID", type = "number", default = nil } },
	returns = { { name = "timeLeftMinutes", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

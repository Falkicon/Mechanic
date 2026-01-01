-- Generated APIDefinitions for namespace: C_DamageMeter
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_DamageMeter.GetCombatSessionFromID"] = {
	key = "C_DamageMeter.GetCombatSessionFromID",
	name = "GetCombatSessionFromID",
	category = "combat_midnight",
	subcategory = "c_damagemeter",
	func = _G["C_DamageMeter"] and _G["C_DamageMeter"]["GetCombatSessionFromID"],
	funcPath = "C_DamageMeter.GetCombatSessionFromID",
	params = {
		{ name = "sessionID", type = "number", default = nil },
		{ name = "type", type = "DamageMeterType", default = nil },
	},
	returns = { { name = "session", type = "DamageMeterCombatSession", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenInCombat",
}

APIDefs["C_DamageMeter.GetCombatSessionFromType"] = {
	key = "C_DamageMeter.GetCombatSessionFromType",
	name = "GetCombatSessionFromType",
	category = "combat_midnight",
	subcategory = "c_damagemeter",
	func = _G["C_DamageMeter"] and _G["C_DamageMeter"]["GetCombatSessionFromType"],
	funcPath = "C_DamageMeter.GetCombatSessionFromType",
	params = {
		{ name = "sessionType", type = "DamageMeterSessionType", default = nil },
		{ name = "type", type = "DamageMeterType", default = nil },
	},
	returns = { { name = "session", type = "DamageMeterCombatSession", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenInCombat",
}

APIDefs["C_DamageMeter.GetCombatSessionSourceFromID"] = {
	key = "C_DamageMeter.GetCombatSessionSourceFromID",
	name = "GetCombatSessionSourceFromID",
	category = "combat_midnight",
	subcategory = "c_damagemeter",
	func = _G["C_DamageMeter"] and _G["C_DamageMeter"]["GetCombatSessionSourceFromID"],
	funcPath = "C_DamageMeter.GetCombatSessionSourceFromID",
	params = {
		{ name = "sessionID", type = "number", default = nil },
		{ name = "type", type = "DamageMeterType", default = nil },
		{ name = "sourceGUID", type = "WOWGUID", default = nil },
	},
	returns = { { name = "sessionSource", type = "DamageMeterCombatSessionSource", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenInCombat",
}

APIDefs["C_DamageMeter.GetCombatSessionSourceFromType"] = {
	key = "C_DamageMeter.GetCombatSessionSourceFromType",
	name = "GetCombatSessionSourceFromType",
	category = "combat_midnight",
	subcategory = "c_damagemeter",
	func = _G["C_DamageMeter"] and _G["C_DamageMeter"]["GetCombatSessionSourceFromType"],
	funcPath = "C_DamageMeter.GetCombatSessionSourceFromType",
	params = {
		{ name = "sessionType", type = "DamageMeterSessionType", default = nil },
		{ name = "type", type = "DamageMeterType", default = nil },
		{ name = "sourceGUID", type = "WOWGUID", default = nil },
	},
	returns = { { name = "sessionSource", type = "DamageMeterCombatSessionSource", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenInCombat",
}

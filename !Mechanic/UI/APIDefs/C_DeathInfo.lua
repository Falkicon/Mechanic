-- Generated APIDefinitions for namespace: C_DeathInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_DeathInfo.GetCorpseMapPosition"] = {
	key = "C_DeathInfo.GetCorpseMapPosition",
	name = "GetCorpseMapPosition",
	category = "combat_midnight",
	subcategory = "c_deathinfo",
	func = _G["C_DeathInfo"] and _G["C_DeathInfo"]["GetCorpseMapPosition"],
	funcPath = "C_DeathInfo.GetCorpseMapPosition",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "position", type = "vector2", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DeathInfo.GetDeathReleasePosition"] = {
	key = "C_DeathInfo.GetDeathReleasePosition",
	name = "GetDeathReleasePosition",
	category = "combat_midnight",
	subcategory = "c_deathinfo",
	func = _G["C_DeathInfo"] and _G["C_DeathInfo"]["GetDeathReleasePosition"],
	funcPath = "C_DeathInfo.GetDeathReleasePosition",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "position", type = "vector2", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DeathInfo.GetGraveyardsForMap"] = {
	key = "C_DeathInfo.GetGraveyardsForMap",
	name = "GetGraveyardsForMap",
	category = "combat_midnight",
	subcategory = "c_deathinfo",
	func = _G["C_DeathInfo"] and _G["C_DeathInfo"]["GetGraveyardsForMap"],
	funcPath = "C_DeathInfo.GetGraveyardsForMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "graveyards", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DeathInfo.UseSelfResurrectOption"] = {
	key = "C_DeathInfo.UseSelfResurrectOption",
	name = "UseSelfResurrectOption",
	category = "combat_midnight",
	subcategory = "c_deathinfo",
	func = _G["C_DeathInfo"] and _G["C_DeathInfo"]["UseSelfResurrectOption"],
	funcPath = "C_DeathInfo.UseSelfResurrectOption",
	params = {
		{ name = "optionType", type = "SelfResurrectOptionType", default = nil },
		{ name = "id", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

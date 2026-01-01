-- Generated APIDefinitions for namespace: C_HouseExterior
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HouseExterior.GetCoreFixtureOptionsInfo"] = {
	key = "C_HouseExterior.GetCoreFixtureOptionsInfo",
	name = "GetCoreFixtureOptionsInfo",
	category = "combat_midnight",
	subcategory = "c_houseexterior",
	func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["GetCoreFixtureOptionsInfo"],
	funcPath = "C_HouseExterior.GetCoreFixtureOptionsInfo",
	params = { { name = "coreFixtureType", type = "HousingFixtureType", default = nil } },
	returns = { { name = "coreFixtureOptionsInfo", type = "HousingCoreFixtureInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HouseExterior.SelectCoreFixtureOption"] = {
	key = "C_HouseExterior.SelectCoreFixtureOption",
	name = "SelectCoreFixtureOption",
	category = "combat_midnight",
	subcategory = "c_houseexterior",
	func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["SelectCoreFixtureOption"],
	funcPath = "C_HouseExterior.SelectCoreFixtureOption",
	params = { { name = "fixtureID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HouseExterior.SelectFixtureOption"] = {
	key = "C_HouseExterior.SelectFixtureOption",
	name = "SelectFixtureOption",
	category = "combat_midnight",
	subcategory = "c_houseexterior",
	func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["SelectFixtureOption"],
	funcPath = "C_HouseExterior.SelectFixtureOption",
	params = { { name = "fixtureID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HouseExterior.SetHouseExteriorSize"] = {
	key = "C_HouseExterior.SetHouseExteriorSize",
	name = "SetHouseExteriorSize",
	category = "combat_midnight",
	subcategory = "c_houseexterior",
	func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["SetHouseExteriorSize"],
	funcPath = "C_HouseExterior.SetHouseExteriorSize",
	params = { { name = "size", type = "HousingFixtureSize", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HouseExterior.SetHouseExteriorType"] = {
	key = "C_HouseExterior.SetHouseExteriorType",
	name = "SetHouseExteriorType",
	category = "combat_midnight",
	subcategory = "c_houseexterior",
	func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["SetHouseExteriorType"],
	funcPath = "C_HouseExterior.SetHouseExteriorType",
	params = { { name = "houseExteriorTypeID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

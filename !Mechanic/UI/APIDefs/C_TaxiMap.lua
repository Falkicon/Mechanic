-- Generated APIDefinitions for namespace: C_TaxiMap
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_TaxiMap.GetAllTaxiNodes"] = {
	key = "C_TaxiMap.GetAllTaxiNodes",
	name = "GetAllTaxiNodes",
	category = "combat_midnight",
	subcategory = "c_taximap",
	func = _G["C_TaxiMap"] and _G["C_TaxiMap"]["GetAllTaxiNodes"],
	funcPath = "C_TaxiMap.GetAllTaxiNodes",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "taxiNodes", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TaxiMap.GetTaxiNodesForMap"] = {
	key = "C_TaxiMap.GetTaxiNodesForMap",
	name = "GetTaxiNodesForMap",
	category = "combat_midnight",
	subcategory = "c_taximap",
	func = _G["C_TaxiMap"] and _G["C_TaxiMap"]["GetTaxiNodesForMap"],
	funcPath = "C_TaxiMap.GetTaxiNodesForMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "mapTaxiNodes", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TaxiMap.ShouldMapShowTaxiNodes"] = {
	key = "C_TaxiMap.ShouldMapShowTaxiNodes",
	name = "ShouldMapShowTaxiNodes",
	category = "combat_midnight",
	subcategory = "c_taximap",
	func = _G["C_TaxiMap"] and _G["C_TaxiMap"]["ShouldMapShowTaxiNodes"],
	funcPath = "C_TaxiMap.ShouldMapShowTaxiNodes",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "shouldShowNodes", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

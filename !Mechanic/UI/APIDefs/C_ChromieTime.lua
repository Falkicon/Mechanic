-- Generated APIDefinitions for namespace: C_ChromieTime
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ChromieTime.GetChromieTimeExpansionOption"] = {
	key = "C_ChromieTime.GetChromieTimeExpansionOption",
	name = "GetChromieTimeExpansionOption",
	category = "combat_midnight",
	subcategory = "c_chromietime",
	func = _G["C_ChromieTime"] and _G["C_ChromieTime"]["GetChromieTimeExpansionOption"],
	funcPath = "C_ChromieTime.GetChromieTimeExpansionOption",
	params = { { name = "expansionRecID", type = "number", default = nil } },
	returns = { { name = "info", type = "ChromieTimeExpansionInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChromieTime.SelectChromieTimeOption"] = {
	key = "C_ChromieTime.SelectChromieTimeOption",
	name = "SelectChromieTimeOption",
	category = "combat_midnight",
	subcategory = "c_chromietime",
	func = _G["C_ChromieTime"] and _G["C_ChromieTime"]["SelectChromieTimeOption"],
	funcPath = "C_ChromieTime.SelectChromieTimeOption",
	params = { { name = "chromieTimeExpansionInfoId", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_HousingExpertMode
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HousingExpertMode.GetPrecisionSubmodeRestriction"] = {
	key = "C_HousingExpertMode.GetPrecisionSubmodeRestriction",
	name = "GetPrecisionSubmodeRestriction",
	category = "combat_midnight",
	subcategory = "c_housingexpertmode",
	func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["GetPrecisionSubmodeRestriction"],
	funcPath = "C_HousingExpertMode.GetPrecisionSubmodeRestriction",
	params = { { name = "subMode", type = "HousingPrecisionSubmode", default = nil } },
	returns = { { name = "restriction", type = "HousingExpertSubmodeRestriction", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingExpertMode.ResetPrecisionChanges"] = {
	key = "C_HousingExpertMode.ResetPrecisionChanges",
	name = "ResetPrecisionChanges",
	category = "combat_midnight",
	subcategory = "c_housingexpertmode",
	func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["ResetPrecisionChanges"],
	funcPath = "C_HousingExpertMode.ResetPrecisionChanges",
	params = { { name = "activeSubmodeOnly", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingExpertMode.SetGridVisible"] = {
	key = "C_HousingExpertMode.SetGridVisible",
	name = "SetGridVisible",
	category = "combat_midnight",
	subcategory = "c_housingexpertmode",
	func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["SetGridVisible"],
	funcPath = "C_HousingExpertMode.SetGridVisible",
	params = { { name = "gridVisible", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingExpertMode.SetPrecisionIncrementingActive"] = {
	key = "C_HousingExpertMode.SetPrecisionIncrementingActive",
	name = "SetPrecisionIncrementingActive",
	category = "combat_midnight",
	subcategory = "c_housingexpertmode",
	func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["SetPrecisionIncrementingActive"],
	funcPath = "C_HousingExpertMode.SetPrecisionIncrementingActive",
	params = {
		{ name = "incrementType", type = "HousingIncrementType", default = nil },
		{ name = "active", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingExpertMode.SetPrecisionSubmode"] = {
	key = "C_HousingExpertMode.SetPrecisionSubmode",
	name = "SetPrecisionSubmode",
	category = "combat_midnight",
	subcategory = "c_housingexpertmode",
	func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["SetPrecisionSubmode"],
	funcPath = "C_HousingExpertMode.SetPrecisionSubmode",
	params = { { name = "subMode", type = "HousingPrecisionSubmode", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

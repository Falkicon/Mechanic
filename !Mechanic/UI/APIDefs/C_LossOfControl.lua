-- Generated APIDefinitions for namespace: C_LossOfControl
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LossOfControl.GetActiveLossOfControlData"] = {
	key = "C_LossOfControl.GetActiveLossOfControlData",
	name = "GetActiveLossOfControlData",
	category = "combat_midnight",
	subcategory = "c_lossofcontrol",
	func = _G["C_LossOfControl"] and _G["C_LossOfControl"]["GetActiveLossOfControlData"],
	funcPath = "C_LossOfControl.GetActiveLossOfControlData",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "event", type = "LossOfControlData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LossOfControl.GetActiveLossOfControlDataByUnit"] = {
	key = "C_LossOfControl.GetActiveLossOfControlDataByUnit",
	name = "GetActiveLossOfControlDataByUnit",
	category = "combat_midnight",
	subcategory = "c_lossofcontrol",
	func = _G["C_LossOfControl"] and _G["C_LossOfControl"]["GetActiveLossOfControlDataByUnit"],
	funcPath = "C_LossOfControl.GetActiveLossOfControlDataByUnit",
	params = {
		{ name = "unitToken", type = "UnitToken", default = "player" },
		{ name = "index", type = "luaIndex", default = nil },
	},
	returns = { { name = "event", type = "LossOfControlData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LossOfControl.GetActiveLossOfControlDataCountByUnit"] = {
	key = "C_LossOfControl.GetActiveLossOfControlDataCountByUnit",
	name = "GetActiveLossOfControlDataCountByUnit",
	category = "combat_midnight",
	subcategory = "c_lossofcontrol",
	func = _G["C_LossOfControl"] and _G["C_LossOfControl"]["GetActiveLossOfControlDataCountByUnit"],
	funcPath = "C_LossOfControl.GetActiveLossOfControlDataCountByUnit",
	params = { { name = "unitToken", type = "UnitToken", default = "player" } },
	returns = { { name = "count", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

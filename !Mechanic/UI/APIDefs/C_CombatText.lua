-- Generated APIDefinitions for namespace: C_CombatText
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CombatText.GetCurrentEventInfo"] = {
	key = "C_CombatText.GetCurrentEventInfo",
	name = "GetCurrentEventInfo",
	category = "combat_midnight",
	subcategory = "c_combattext",
	func = _G["C_CombatText"] and _G["C_CombatText"]["GetCurrentEventInfo"],
	funcPath = "C_CombatText.GetCurrentEventInfo",
	params = {},
	returns = {},
	midnightImpact = "HIGH",
	midnightNote = "Secret behavior: SecretReturns",
}

APIDefs["C_CombatText.SetActiveUnit"] = {
	key = "C_CombatText.SetActiveUnit",
	name = "SetActiveUnit",
	category = "combat_midnight",
	subcategory = "c_combattext",
	func = _G["C_CombatText"] and _G["C_CombatText"]["SetActiveUnit"],
	funcPath = "C_CombatText.SetActiveUnit",
	params = { { name = "unitToken", type = "UnitToken", default = "player" } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

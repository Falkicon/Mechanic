-- Generated APIDefinitions for namespace: C_CombatText
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CombatText.GetActiveUnit"] = {
    key = "C_CombatText.GetActiveUnit",
    name = "GetActiveUnit",
    category = "general",
    subcategory = "c_combattext",
    funcPath = "C_CombatText.GetActiveUnit",
    params = {  },
    returns = { { name = "unitTarget", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CombatText.GetCurrentEventInfo"] = {
    key = "C_CombatText.GetCurrentEventInfo",
    name = "GetCurrentEventInfo",
    category = "combat_midnight",
    subcategory = "c_combattext",
    funcPath = "C_CombatText.GetCurrentEventInfo",
    params = {  },
    returns = {  },
    midnightImpact = "HIGH",
    midnightNote = "Secret behavior: SecretReturns",
}

APIDefs["C_CombatText.SetActiveUnit"] = {
    key = "C_CombatText.SetActiveUnit",
    name = "SetActiveUnit",
    category = "general",
    subcategory = "c_combattext",
    funcPath = "C_CombatText.SetActiveUnit",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

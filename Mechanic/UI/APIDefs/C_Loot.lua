-- Generated APIDefinitions for namespace: C_Loot
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Loot.GetLootRollDuration"] = {
    key = "C_Loot.GetLootRollDuration",
    name = "GetLootRollDuration",
    category = "item",
    subcategory = "c_loot",
    funcPath = "C_Loot.GetLootRollDuration",
    params = { { name = "rollID", type = "number", default = nil } },
    returns = { { name = "duration", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Loot.IsLegacyLootModeEnabled"] = {
    key = "C_Loot.IsLegacyLootModeEnabled",
    name = "IsLegacyLootModeEnabled",
    category = "item",
    subcategory = "c_loot",
    funcPath = "C_Loot.IsLegacyLootModeEnabled",
    params = {  },
    returns = { { name = "isLegacyLootModeEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

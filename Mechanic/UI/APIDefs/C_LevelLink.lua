-- Generated APIDefinitions for namespace: C_LevelLink
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LevelLink.IsActionLocked"] = {
    key = "C_LevelLink.IsActionLocked",
    name = "IsActionLocked",
    category = "general",
    subcategory = "c_levellink",
    funcPath = "C_LevelLink.IsActionLocked",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "isLocked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LevelLink.IsSpellLocked"] = {
    key = "C_LevelLink.IsSpellLocked",
    name = "IsSpellLocked",
    category = "general",
    subcategory = "c_levellink",
    funcPath = "C_LevelLink.IsSpellLocked",
    params = { { name = "spellID", type = "number", default = nil } },
    returns = { { name = "isLocked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

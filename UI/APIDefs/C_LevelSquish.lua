-- Generated APIDefinitions for namespace: C_LevelSquish
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LevelSquish.ConvertFollowerLevel"] = {
    key = "C_LevelSquish.ConvertFollowerLevel",
    name = "ConvertFollowerLevel",
    category = "combat_midnight",
    subcategory = "c_levelsquish",
    func = _G["C_LevelSquish"] and _G["C_LevelSquish"]["ConvertFollowerLevel"],
    funcPath = "C_LevelSquish.ConvertFollowerLevel",
    params = { { name = "level", type = "number", default = nil }, { name = "maxFollowerLevel", type = "number", default = nil } },
    returns = { { name = "squishedLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LevelSquish.ConvertPlayerLevel"] = {
    key = "C_LevelSquish.ConvertPlayerLevel",
    name = "ConvertPlayerLevel",
    category = "combat_midnight",
    subcategory = "c_levelsquish",
    func = _G["C_LevelSquish"] and _G["C_LevelSquish"]["ConvertPlayerLevel"],
    funcPath = "C_LevelSquish.ConvertPlayerLevel",
    params = { { name = "level", type = "number", default = nil } },
    returns = { { name = "squishedLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

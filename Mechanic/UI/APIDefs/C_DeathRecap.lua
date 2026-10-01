-- Generated APIDefinitions for namespace: C_DeathRecap
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_DeathRecap.GetRecapEvents"] = {
    key = "C_DeathRecap.GetRecapEvents",
    name = "GetRecapEvents",
    category = "general",
    subcategory = "c_deathrecap",
    funcPath = "C_DeathRecap.GetRecapEvents",
    params = { { name = "recapID", type = "number", default = nil } },
    returns = { { name = "events", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DeathRecap.GetRecapLink"] = {
    key = "C_DeathRecap.GetRecapLink",
    name = "GetRecapLink",
    category = "general",
    subcategory = "c_deathrecap",
    funcPath = "C_DeathRecap.GetRecapLink",
    params = { { name = "recapID", type = "number", default = nil } },
    returns = { { name = "link", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DeathRecap.HasRecapEvents"] = {
    key = "C_DeathRecap.HasRecapEvents",
    name = "HasRecapEvents",
    category = "general",
    subcategory = "c_deathrecap",
    funcPath = "C_DeathRecap.HasRecapEvents",
    params = { { name = "recapID", type = "number", default = nil } },
    returns = { { name = "hasEvents", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

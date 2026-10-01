-- Generated APIDefinitions for namespace: C_DeathInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_DeathInfo.GetCorpseMapPosition"] = {
    key = "C_DeathInfo.GetCorpseMapPosition",
    name = "GetCorpseMapPosition",
    category = "general",
    subcategory = "c_deathinfo",
    funcPath = "C_DeathInfo.GetCorpseMapPosition",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "position", type = "vector2", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DeathInfo.GetDeathReleasePosition"] = {
    key = "C_DeathInfo.GetDeathReleasePosition",
    name = "GetDeathReleasePosition",
    category = "general",
    subcategory = "c_deathinfo",
    funcPath = "C_DeathInfo.GetDeathReleasePosition",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "position", type = "vector2", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DeathInfo.GetGraveyardsForMap"] = {
    key = "C_DeathInfo.GetGraveyardsForMap",
    name = "GetGraveyardsForMap",
    category = "general",
    subcategory = "c_deathinfo",
    funcPath = "C_DeathInfo.GetGraveyardsForMap",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "graveyards", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DeathInfo.GetSelfResurrectOptions"] = {
    key = "C_DeathInfo.GetSelfResurrectOptions",
    name = "GetSelfResurrectOptions",
    category = "general",
    subcategory = "c_deathinfo",
    funcPath = "C_DeathInfo.GetSelfResurrectOptions",
    params = {  },
    returns = { { name = "options", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_DeathInfo.UseSelfResurrectOption"] = {
    key = "C_DeathInfo.UseSelfResurrectOption",
    name = "UseSelfResurrectOption",
    category = "general",
    subcategory = "c_deathinfo",
    funcPath = "C_DeathInfo.UseSelfResurrectOption",
    params = { { name = "optionType", type = "SelfResurrectOptionType", default = nil }, { name = "id", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

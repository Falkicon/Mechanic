-- Generated APIDefinitions for namespace: C_VignetteInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_VignetteInfo.FindBestUniqueVignette"] = {
    key = "C_VignetteInfo.FindBestUniqueVignette",
    name = "FindBestUniqueVignette",
    category = "map",
    subcategory = "c_vignetteinfo",
    funcPath = "C_VignetteInfo.FindBestUniqueVignette",
    params = { { name = "vignetteGUIDs", type = "table", default = nil } },
    returns = { { name = "bestUniqueVignetteIndex", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VignetteInfo.GetHealthPercent"] = {
    key = "C_VignetteInfo.GetHealthPercent",
    name = "GetHealthPercent",
    category = "map",
    subcategory = "c_vignetteinfo",
    funcPath = "C_VignetteInfo.GetHealthPercent",
    params = { { name = "vignetteGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "healthPct", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VignetteInfo.GetRecommendedGroupSize"] = {
    key = "C_VignetteInfo.GetRecommendedGroupSize",
    name = "GetRecommendedGroupSize",
    category = "map",
    subcategory = "c_vignetteinfo",
    funcPath = "C_VignetteInfo.GetRecommendedGroupSize",
    params = { { name = "vignetteGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "minGroupSize", type = "number", canBeSecret = false }, { name = "maxGroupSize", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VignetteInfo.GetVignetteInfo"] = {
    key = "C_VignetteInfo.GetVignetteInfo",
    name = "GetVignetteInfo",
    category = "map",
    subcategory = "c_vignetteinfo",
    funcPath = "C_VignetteInfo.GetVignetteInfo",
    params = { { name = "vignetteGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "vignetteInfo", type = "VignetteInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VignetteInfo.GetVignettePosition"] = {
    key = "C_VignetteInfo.GetVignettePosition",
    name = "GetVignettePosition",
    category = "map",
    subcategory = "c_vignetteinfo",
    funcPath = "C_VignetteInfo.GetVignettePosition",
    params = { { name = "vignetteGUID", type = "WOWGUID", default = nil }, { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "vignettePosition", type = "vector2", canBeSecret = false }, { name = "vignetteFacing", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VignetteInfo.GetVignettes"] = {
    key = "C_VignetteInfo.GetVignettes",
    name = "GetVignettes",
    category = "map",
    subcategory = "c_vignetteinfo",
    funcPath = "C_VignetteInfo.GetVignettes",
    params = {  },
    returns = { { name = "vignetteGUIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

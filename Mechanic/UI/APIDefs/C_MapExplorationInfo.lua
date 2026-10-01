-- Generated APIDefinitions for namespace: C_MapExplorationInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_MapExplorationInfo.GetExploredAreaIDsAtPosition"] = {
    key = "C_MapExplorationInfo.GetExploredAreaIDsAtPosition",
    name = "GetExploredAreaIDsAtPosition",
    category = "map",
    subcategory = "c_mapexplorationinfo",
    funcPath = "C_MapExplorationInfo.GetExploredAreaIDsAtPosition",
    params = { { name = "uiMapID", type = "number", default = nil }, { name = "normalizedPosition", type = "vector2", default = nil } },
    returns = { { name = "areaID", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MapExplorationInfo.GetExploredMapTextures"] = {
    key = "C_MapExplorationInfo.GetExploredMapTextures",
    name = "GetExploredMapTextures",
    category = "map",
    subcategory = "c_mapexplorationinfo",
    funcPath = "C_MapExplorationInfo.GetExploredMapTextures",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "overlayInfo", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

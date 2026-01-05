-- Generated APIDefinitions for namespace: C_ArdenwealdGardening
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ArdenwealdGardening.GetGardenData"] = {
    key = "C_ArdenwealdGardening.GetGardenData",
    name = "GetGardenData",
    category = "general",
    subcategory = "c_ardenwealdgardening",
    func = _G["C_ArdenwealdGardening"] and _G["C_ArdenwealdGardening"]["GetGardenData"],
    funcPath = "C_ArdenwealdGardening.GetGardenData",
    params = {  },
    returns = { { name = "data", type = "ArdenwealdGardenData", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArdenwealdGardening.IsGardenAccessible"] = {
    key = "C_ArdenwealdGardening.IsGardenAccessible",
    name = "IsGardenAccessible",
    category = "general",
    subcategory = "c_ardenwealdgardening",
    func = _G["C_ArdenwealdGardening"] and _G["C_ArdenwealdGardening"]["IsGardenAccessible"],
    funcPath = "C_ArdenwealdGardening.IsGardenAccessible",
    params = {  },
    returns = { { name = "accessible", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

-- Generated APIDefinitions for namespace: C_SeasonInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SeasonInfo.GetCurrentDisplaySeasonExpansion"] = {
    key = "C_SeasonInfo.GetCurrentDisplaySeasonExpansion",
    name = "GetCurrentDisplaySeasonExpansion",
    category = "general",
    subcategory = "c_seasoninfo",
    func = _G["C_SeasonInfo"] and _G["C_SeasonInfo"]["GetCurrentDisplaySeasonExpansion"],
    funcPath = "C_SeasonInfo.GetCurrentDisplaySeasonExpansion",
    params = {  },
    returns = { { name = "expansionID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SeasonInfo.GetCurrentDisplaySeasonID"] = {
    key = "C_SeasonInfo.GetCurrentDisplaySeasonID",
    name = "GetCurrentDisplaySeasonID",
    category = "general",
    subcategory = "c_seasoninfo",
    func = _G["C_SeasonInfo"] and _G["C_SeasonInfo"]["GetCurrentDisplaySeasonID"],
    funcPath = "C_SeasonInfo.GetCurrentDisplaySeasonID",
    params = {  },
    returns = { { name = "seasonID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

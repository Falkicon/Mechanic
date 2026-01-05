-- Generated APIDefinitions for namespace: C_TimerunningUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_TimerunningUI.GetActiveTimerunningSeasonID"] = {
    key = "C_TimerunningUI.GetActiveTimerunningSeasonID",
    name = "GetActiveTimerunningSeasonID",
    category = "general",
    subcategory = "c_timerunningui",
    func = _G["C_TimerunningUI"] and _G["C_TimerunningUI"]["GetActiveTimerunningSeasonID"],
    funcPath = "C_TimerunningUI.GetActiveTimerunningSeasonID",
    params = {  },
    returns = { { name = "activeTimerunningSeasonID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

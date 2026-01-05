-- Generated APIDefinitions for namespace: C_EndOfMatchUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_EndOfMatchUI.GetEndOfMatchDetails"] = {
    key = "C_EndOfMatchUI.GetEndOfMatchDetails",
    name = "GetEndOfMatchDetails",
    category = "general",
    subcategory = "c_endofmatchui",
    func = _G["C_EndOfMatchUI"] and _G["C_EndOfMatchUI"]["GetEndOfMatchDetails"],
    funcPath = "C_EndOfMatchUI.GetEndOfMatchDetails",
    params = {  },
    returns = { { name = "matchDetails", type = "MatchDetails", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

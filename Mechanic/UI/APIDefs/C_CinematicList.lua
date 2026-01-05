-- Generated APIDefinitions for namespace: C_CinematicList
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CinematicList.GetUICinematicList"] = {
    key = "C_CinematicList.GetUICinematicList",
    name = "GetUICinematicList",
    category = "general",
    subcategory = "c_cinematiclist",
    func = _G["C_CinematicList"] and _G["C_CinematicList"]["GetUICinematicList"],
    funcPath = "C_CinematicList.GetUICinematicList",
    params = {  },
    returns = { { name = "cinematics", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

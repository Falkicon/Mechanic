-- Generated APIDefinitions for namespace: C_InstanceLeaver
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_InstanceLeaver.IsPlayerLeaver"] = {
    key = "C_InstanceLeaver.IsPlayerLeaver",
    name = "IsPlayerLeaver",
    category = "general",
    subcategory = "c_instanceleaver",
    func = _G["C_InstanceLeaver"] and _G["C_InstanceLeaver"]["IsPlayerLeaver"],
    funcPath = "C_InstanceLeaver.IsPlayerLeaver",
    params = {  },
    returns = { { name = "isLeaver", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

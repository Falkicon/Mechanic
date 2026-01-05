-- Generated APIDefinitions for namespace: C_System
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_System.GetFrameStack"] = {
    key = "C_System.GetFrameStack",
    name = "GetFrameStack",
    category = "general",
    subcategory = "c_system",
    func = _G["C_System"] and _G["C_System"]["GetFrameStack"],
    funcPath = "C_System.GetFrameStack",
    params = {  },
    returns = { { name = "objects", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

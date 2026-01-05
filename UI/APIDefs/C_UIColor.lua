-- Generated APIDefinitions for namespace: C_UIColor
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_UIColor.GetColors"] = {
    key = "C_UIColor.GetColors",
    name = "GetColors",
    category = "general",
    subcategory = "c_uicolor",
    func = _G["C_UIColor"] and _G["C_UIColor"]["GetColors"],
    funcPath = "C_UIColor.GetColors",
    params = {  },
    returns = { { name = "colors", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

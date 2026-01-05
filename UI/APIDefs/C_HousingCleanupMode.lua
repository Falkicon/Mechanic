-- Generated APIDefinitions for namespace: C_HousingCleanupMode
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HousingCleanupMode.GetHoveredDecorInfo"] = {
    key = "C_HousingCleanupMode.GetHoveredDecorInfo",
    name = "GetHoveredDecorInfo",
    category = "general",
    subcategory = "c_housingcleanupmode",
    func = _G["C_HousingCleanupMode"] and _G["C_HousingCleanupMode"]["GetHoveredDecorInfo"],
    funcPath = "C_HousingCleanupMode.GetHoveredDecorInfo",
    params = {  },
    returns = { { name = "info", type = "HousingDecorInstanceInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCleanupMode.IsHoveringDecor"] = {
    key = "C_HousingCleanupMode.IsHoveringDecor",
    name = "IsHoveringDecor",
    category = "general",
    subcategory = "c_housingcleanupmode",
    func = _G["C_HousingCleanupMode"] and _G["C_HousingCleanupMode"]["IsHoveringDecor"],
    funcPath = "C_HousingCleanupMode.IsHoveringDecor",
    params = {  },
    returns = { { name = "isHoveringDecor", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCleanupMode.RemoveSelectedDecor"] = {
    key = "C_HousingCleanupMode.RemoveSelectedDecor",
    name = "RemoveSelectedDecor",
    category = "general",
    subcategory = "c_housingcleanupmode",
    func = _G["C_HousingCleanupMode"] and _G["C_HousingCleanupMode"]["RemoveSelectedDecor"],
    funcPath = "C_HousingCleanupMode.RemoveSelectedDecor",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

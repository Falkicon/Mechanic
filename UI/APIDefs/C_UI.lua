-- Generated APIDefinitions for namespace: C_UI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_UI.DoesAnyDisplayHaveNotch"] = {
    key = "C_UI.DoesAnyDisplayHaveNotch",
    name = "DoesAnyDisplayHaveNotch",
    category = "general",
    subcategory = "c_ui",
    func = _G["C_UI"] and _G["C_UI"]["DoesAnyDisplayHaveNotch"],
    funcPath = "C_UI.DoesAnyDisplayHaveNotch",
    params = {  },
    returns = { { name = "notchPresent", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_UI.GetTopLeftNotchSafeRegion"] = {
    key = "C_UI.GetTopLeftNotchSafeRegion",
    name = "GetTopLeftNotchSafeRegion",
    category = "general",
    subcategory = "c_ui",
    func = _G["C_UI"] and _G["C_UI"]["GetTopLeftNotchSafeRegion"],
    funcPath = "C_UI.GetTopLeftNotchSafeRegion",
    params = {  },
    returns = { { name = "left", type = "number", canBeSecret = false }, { name = "right", type = "number", canBeSecret = false }, { name = "top", type = "number", canBeSecret = false }, { name = "bottom", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_UI.GetTopRightNotchSafeRegion"] = {
    key = "C_UI.GetTopRightNotchSafeRegion",
    name = "GetTopRightNotchSafeRegion",
    category = "general",
    subcategory = "c_ui",
    func = _G["C_UI"] and _G["C_UI"]["GetTopRightNotchSafeRegion"],
    funcPath = "C_UI.GetTopRightNotchSafeRegion",
    params = {  },
    returns = { { name = "left", type = "number", canBeSecret = false }, { name = "right", type = "number", canBeSecret = false }, { name = "top", type = "number", canBeSecret = false }, { name = "bottom", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_UI.GetUIParent"] = {
    key = "C_UI.GetUIParent",
    name = "GetUIParent",
    category = "general",
    subcategory = "c_ui",
    func = _G["C_UI"] and _G["C_UI"]["GetUIParent"],
    funcPath = "C_UI.GetUIParent",
    params = {  },
    returns = { { name = "uiParent", type = "SimpleFrame", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_UI.GetWorldFrame"] = {
    key = "C_UI.GetWorldFrame",
    name = "GetWorldFrame",
    category = "general",
    subcategory = "c_ui",
    func = _G["C_UI"] and _G["C_UI"]["GetWorldFrame"],
    funcPath = "C_UI.GetWorldFrame",
    params = {  },
    returns = { { name = "worldFrame", type = "SimpleFrame", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_UI.Reload"] = {
    key = "C_UI.Reload",
    name = "Reload",
    category = "general",
    subcategory = "c_ui",
    func = _G["C_UI"] and _G["C_UI"]["Reload"],
    funcPath = "C_UI.Reload",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_UI.ShouldUIParentAvoidNotch"] = {
    key = "C_UI.ShouldUIParentAvoidNotch",
    name = "ShouldUIParentAvoidNotch",
    category = "general",
    subcategory = "c_ui",
    func = _G["C_UI"] and _G["C_UI"]["ShouldUIParentAvoidNotch"],
    funcPath = "C_UI.ShouldUIParentAvoidNotch",
    params = {  },
    returns = { { name = "willAvoidNotch", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

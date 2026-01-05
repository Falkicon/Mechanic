-- Generated APIDefinitions for namespace: C_Navigation
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Navigation.GetDistance"] = {
    key = "C_Navigation.GetDistance",
    name = "GetDistance",
    category = "map",
    subcategory = "c_navigation",
    func = _G["C_Navigation"] and _G["C_Navigation"]["GetDistance"],
    funcPath = "C_Navigation.GetDistance",
    params = {  },
    returns = { { name = "distance", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Navigation.GetFrame"] = {
    key = "C_Navigation.GetFrame",
    name = "GetFrame",
    category = "map",
    subcategory = "c_navigation",
    func = _G["C_Navigation"] and _G["C_Navigation"]["GetFrame"],
    funcPath = "C_Navigation.GetFrame",
    params = {  },
    returns = { { name = "frame", type = "ScriptRegion", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Navigation.GetNearestPartyMemberToken"] = {
    key = "C_Navigation.GetNearestPartyMemberToken",
    name = "GetNearestPartyMemberToken",
    category = "map",
    subcategory = "c_navigation",
    func = _G["C_Navigation"] and _G["C_Navigation"]["GetNearestPartyMemberToken"],
    funcPath = "C_Navigation.GetNearestPartyMemberToken",
    params = {  },
    returns = { { name = "unitToken", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Navigation.GetTargetState"] = {
    key = "C_Navigation.GetTargetState",
    name = "GetTargetState",
    category = "map",
    subcategory = "c_navigation",
    func = _G["C_Navigation"] and _G["C_Navigation"]["GetTargetState"],
    funcPath = "C_Navigation.GetTargetState",
    params = {  },
    returns = { { name = "state", type = "NavigationState", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Navigation.HasValidScreenPosition"] = {
    key = "C_Navigation.HasValidScreenPosition",
    name = "HasValidScreenPosition",
    category = "map",
    subcategory = "c_navigation",
    func = _G["C_Navigation"] and _G["C_Navigation"]["HasValidScreenPosition"],
    funcPath = "C_Navigation.HasValidScreenPosition",
    params = {  },
    returns = { { name = "hasValidScreenPosition", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Navigation.WasClampedToScreen"] = {
    key = "C_Navigation.WasClampedToScreen",
    name = "WasClampedToScreen",
    category = "map",
    subcategory = "c_navigation",
    func = _G["C_Navigation"] and _G["C_Navigation"]["WasClampedToScreen"],
    funcPath = "C_Navigation.WasClampedToScreen",
    params = {  },
    returns = { { name = "wasClamped", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

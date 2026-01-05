-- Generated APIDefinitions for namespace: C_EditMode
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_EditMode.ConvertLayoutInfoToString"] = {
    key = "C_EditMode.ConvertLayoutInfoToString",
    name = "ConvertLayoutInfoToString",
    category = "combat_midnight",
    subcategory = "c_editmode",
    func = _G["C_EditMode"] and _G["C_EditMode"]["ConvertLayoutInfoToString"],
    funcPath = "C_EditMode.ConvertLayoutInfoToString",
    params = { { name = "layoutInfo", type = "EditModeLayoutInfo", default = nil } },
    returns = { { name = "layoutInfoAsString", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EditMode.ConvertStringToLayoutInfo"] = {
    key = "C_EditMode.ConvertStringToLayoutInfo",
    name = "ConvertStringToLayoutInfo",
    category = "combat_midnight",
    subcategory = "c_editmode",
    func = _G["C_EditMode"] and _G["C_EditMode"]["ConvertStringToLayoutInfo"],
    funcPath = "C_EditMode.ConvertStringToLayoutInfo",
    params = { { name = "layoutInfoAsString", type = "string", default = nil } },
    returns = { { name = "layoutInfo", type = "EditModeLayoutInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EditMode.GetAccountSettings"] = {
    key = "C_EditMode.GetAccountSettings",
    name = "GetAccountSettings",
    category = "ui",
    subcategory = "c_editmode",
    func = _G["C_EditMode"] and _G["C_EditMode"]["GetAccountSettings"],
    funcPath = "C_EditMode.GetAccountSettings",
    params = {  },
    returns = { { name = "accountSettings", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_EditMode.GetLayouts"] = {
    key = "C_EditMode.GetLayouts",
    name = "GetLayouts",
    category = "ui",
    subcategory = "c_editmode",
    func = _G["C_EditMode"] and _G["C_EditMode"]["GetLayouts"],
    funcPath = "C_EditMode.GetLayouts",
    params = {  },
    returns = { { name = "layoutInfo", type = "EditModeLayouts", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_EditMode.IsValidLayoutName"] = {
    key = "C_EditMode.IsValidLayoutName",
    name = "IsValidLayoutName",
    category = "combat_midnight",
    subcategory = "c_editmode",
    func = _G["C_EditMode"] and _G["C_EditMode"]["IsValidLayoutName"],
    funcPath = "C_EditMode.IsValidLayoutName",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "isApproved", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EditMode.OnEditModeExit"] = {
    key = "C_EditMode.OnEditModeExit",
    name = "OnEditModeExit",
    category = "ui",
    subcategory = "c_editmode",
    func = _G["C_EditMode"] and _G["C_EditMode"]["OnEditModeExit"],
    funcPath = "C_EditMode.OnEditModeExit",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_EditMode.OnLayoutAdded"] = {
    key = "C_EditMode.OnLayoutAdded",
    name = "OnLayoutAdded",
    category = "combat_midnight",
    subcategory = "c_editmode",
    func = _G["C_EditMode"] and _G["C_EditMode"]["OnLayoutAdded"],
    funcPath = "C_EditMode.OnLayoutAdded",
    params = { { name = "addedLayoutIndex", type = "luaIndex", default = nil }, { name = "activateNewLayout", type = "bool", default = nil }, { name = "isLayoutImported", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EditMode.OnLayoutDeleted"] = {
    key = "C_EditMode.OnLayoutDeleted",
    name = "OnLayoutDeleted",
    category = "combat_midnight",
    subcategory = "c_editmode",
    func = _G["C_EditMode"] and _G["C_EditMode"]["OnLayoutDeleted"],
    funcPath = "C_EditMode.OnLayoutDeleted",
    params = { { name = "deletedLayoutIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EditMode.SaveLayouts"] = {
    key = "C_EditMode.SaveLayouts",
    name = "SaveLayouts",
    category = "combat_midnight",
    subcategory = "c_editmode",
    func = _G["C_EditMode"] and _G["C_EditMode"]["SaveLayouts"],
    funcPath = "C_EditMode.SaveLayouts",
    params = { { name = "saveInfo", type = "EditModeLayouts", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EditMode.SetAccountSetting"] = {
    key = "C_EditMode.SetAccountSetting",
    name = "SetAccountSetting",
    category = "combat_midnight",
    subcategory = "c_editmode",
    func = _G["C_EditMode"] and _G["C_EditMode"]["SetAccountSetting"],
    funcPath = "C_EditMode.SetAccountSetting",
    params = { { name = "setting", type = "EditModeAccountSetting", default = nil }, { name = "value", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EditMode.SetActiveLayout"] = {
    key = "C_EditMode.SetActiveLayout",
    name = "SetActiveLayout",
    category = "combat_midnight",
    subcategory = "c_editmode",
    func = _G["C_EditMode"] and _G["C_EditMode"]["SetActiveLayout"],
    funcPath = "C_EditMode.SetActiveLayout",
    params = { { name = "activeLayout", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

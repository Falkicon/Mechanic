-- Generated APIDefinitions for namespace: C_HousingExpertMode
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HousingExpertMode.CancelActiveEditing"] = {
    key = "C_HousingExpertMode.CancelActiveEditing",
    name = "CancelActiveEditing",
    category = "general",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["CancelActiveEditing"],
    funcPath = "C_HousingExpertMode.CancelActiveEditing",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingExpertMode.CommitDecorMovement"] = {
    key = "C_HousingExpertMode.CommitDecorMovement",
    name = "CommitDecorMovement",
    category = "general",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["CommitDecorMovement"],
    funcPath = "C_HousingExpertMode.CommitDecorMovement",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingExpertMode.CommitHouseExteriorPosition"] = {
    key = "C_HousingExpertMode.CommitHouseExteriorPosition",
    name = "CommitHouseExteriorPosition",
    category = "general",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["CommitHouseExteriorPosition"],
    funcPath = "C_HousingExpertMode.CommitHouseExteriorPosition",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingExpertMode.GetHoveredDecorInfo"] = {
    key = "C_HousingExpertMode.GetHoveredDecorInfo",
    name = "GetHoveredDecorInfo",
    category = "general",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["GetHoveredDecorInfo"],
    funcPath = "C_HousingExpertMode.GetHoveredDecorInfo",
    params = {  },
    returns = { { name = "info", type = "HousingDecorInstanceInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingExpertMode.GetPrecisionSubmode"] = {
    key = "C_HousingExpertMode.GetPrecisionSubmode",
    name = "GetPrecisionSubmode",
    category = "general",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["GetPrecisionSubmode"],
    funcPath = "C_HousingExpertMode.GetPrecisionSubmode",
    params = {  },
    returns = { { name = "activeSubMode", type = "HousingPrecisionSubmode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingExpertMode.GetPrecisionSubmodeRestriction"] = {
    key = "C_HousingExpertMode.GetPrecisionSubmodeRestriction",
    name = "GetPrecisionSubmodeRestriction",
    category = "combat_midnight",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["GetPrecisionSubmodeRestriction"],
    funcPath = "C_HousingExpertMode.GetPrecisionSubmodeRestriction",
    params = { { name = "subMode", type = "HousingPrecisionSubmode", default = nil } },
    returns = { { name = "restriction", type = "HousingExpertSubmodeRestriction", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingExpertMode.GetSelectedDecorInfo"] = {
    key = "C_HousingExpertMode.GetSelectedDecorInfo",
    name = "GetSelectedDecorInfo",
    category = "general",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["GetSelectedDecorInfo"],
    funcPath = "C_HousingExpertMode.GetSelectedDecorInfo",
    params = {  },
    returns = { { name = "info", type = "HousingDecorInstanceInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingExpertMode.IsDecorSelected"] = {
    key = "C_HousingExpertMode.IsDecorSelected",
    name = "IsDecorSelected",
    category = "general",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["IsDecorSelected"],
    funcPath = "C_HousingExpertMode.IsDecorSelected",
    params = {  },
    returns = { { name = "hasSelectedDecor", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingExpertMode.IsGridVisible"] = {
    key = "C_HousingExpertMode.IsGridVisible",
    name = "IsGridVisible",
    category = "general",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["IsGridVisible"],
    funcPath = "C_HousingExpertMode.IsGridVisible",
    params = {  },
    returns = { { name = "gridVisible", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingExpertMode.IsHouseExteriorHovered"] = {
    key = "C_HousingExpertMode.IsHouseExteriorHovered",
    name = "IsHouseExteriorHovered",
    category = "general",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["IsHouseExteriorHovered"],
    funcPath = "C_HousingExpertMode.IsHouseExteriorHovered",
    params = {  },
    returns = { { name = "isHouseExteriorHovered", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingExpertMode.IsHouseExteriorSelected"] = {
    key = "C_HousingExpertMode.IsHouseExteriorSelected",
    name = "IsHouseExteriorSelected",
    category = "general",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["IsHouseExteriorSelected"],
    funcPath = "C_HousingExpertMode.IsHouseExteriorSelected",
    params = {  },
    returns = { { name = "isHouseExteriorSelected", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingExpertMode.IsHoveringDecor"] = {
    key = "C_HousingExpertMode.IsHoveringDecor",
    name = "IsHoveringDecor",
    category = "general",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["IsHoveringDecor"],
    funcPath = "C_HousingExpertMode.IsHoveringDecor",
    params = {  },
    returns = { { name = "isHoveringDecor", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingExpertMode.RemoveSelectedDecor"] = {
    key = "C_HousingExpertMode.RemoveSelectedDecor",
    name = "RemoveSelectedDecor",
    category = "general",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["RemoveSelectedDecor"],
    funcPath = "C_HousingExpertMode.RemoveSelectedDecor",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingExpertMode.ResetPrecisionChanges"] = {
    key = "C_HousingExpertMode.ResetPrecisionChanges",
    name = "ResetPrecisionChanges",
    category = "combat_midnight",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["ResetPrecisionChanges"],
    funcPath = "C_HousingExpertMode.ResetPrecisionChanges",
    params = { { name = "activeSubmodeOnly", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingExpertMode.SelectNextRotationAxis"] = {
    key = "C_HousingExpertMode.SelectNextRotationAxis",
    name = "SelectNextRotationAxis",
    category = "general",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["SelectNextRotationAxis"],
    funcPath = "C_HousingExpertMode.SelectNextRotationAxis",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingExpertMode.SetGridVisible"] = {
    key = "C_HousingExpertMode.SetGridVisible",
    name = "SetGridVisible",
    category = "combat_midnight",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["SetGridVisible"],
    funcPath = "C_HousingExpertMode.SetGridVisible",
    params = { { name = "gridVisible", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingExpertMode.SetPrecisionIncrementingActive"] = {
    key = "C_HousingExpertMode.SetPrecisionIncrementingActive",
    name = "SetPrecisionIncrementingActive",
    category = "combat_midnight",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["SetPrecisionIncrementingActive"],
    funcPath = "C_HousingExpertMode.SetPrecisionIncrementingActive",
    params = { { name = "incrementType", type = "HousingIncrementType", default = nil }, { name = "active", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingExpertMode.SetPrecisionSubmode"] = {
    key = "C_HousingExpertMode.SetPrecisionSubmode",
    name = "SetPrecisionSubmode",
    category = "combat_midnight",
    subcategory = "c_housingexpertmode",
    func = _G["C_HousingExpertMode"] and _G["C_HousingExpertMode"]["SetPrecisionSubmode"],
    funcPath = "C_HousingExpertMode.SetPrecisionSubmode",
    params = { { name = "subMode", type = "HousingPrecisionSubmode", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

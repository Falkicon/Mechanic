-- Generated APIDefinitions for namespace: C_HousingBasicMode
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HousingBasicMode.CancelActiveEditing"] = {
    key = "C_HousingBasicMode.CancelActiveEditing",
    name = "CancelActiveEditing",
    category = "general",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["CancelActiveEditing"],
    funcPath = "C_HousingBasicMode.CancelActiveEditing",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingBasicMode.CommitDecorMovement"] = {
    key = "C_HousingBasicMode.CommitDecorMovement",
    name = "CommitDecorMovement",
    category = "general",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["CommitDecorMovement"],
    funcPath = "C_HousingBasicMode.CommitDecorMovement",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingBasicMode.CommitHouseExteriorPosition"] = {
    key = "C_HousingBasicMode.CommitHouseExteriorPosition",
    name = "CommitHouseExteriorPosition",
    category = "general",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["CommitHouseExteriorPosition"],
    funcPath = "C_HousingBasicMode.CommitHouseExteriorPosition",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingBasicMode.FinishPlacingNewDecor"] = {
    key = "C_HousingBasicMode.FinishPlacingNewDecor",
    name = "FinishPlacingNewDecor",
    category = "general",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["FinishPlacingNewDecor"],
    funcPath = "C_HousingBasicMode.FinishPlacingNewDecor",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingBasicMode.GetHoveredDecorInfo"] = {
    key = "C_HousingBasicMode.GetHoveredDecorInfo",
    name = "GetHoveredDecorInfo",
    category = "general",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["GetHoveredDecorInfo"],
    funcPath = "C_HousingBasicMode.GetHoveredDecorInfo",
    params = {  },
    returns = { { name = "info", type = "HousingDecorInstanceInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingBasicMode.GetSelectedDecorInfo"] = {
    key = "C_HousingBasicMode.GetSelectedDecorInfo",
    name = "GetSelectedDecorInfo",
    category = "general",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["GetSelectedDecorInfo"],
    funcPath = "C_HousingBasicMode.GetSelectedDecorInfo",
    params = {  },
    returns = { { name = "info", type = "HousingDecorInstanceInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingBasicMode.IsDecorSelected"] = {
    key = "C_HousingBasicMode.IsDecorSelected",
    name = "IsDecorSelected",
    category = "general",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["IsDecorSelected"],
    funcPath = "C_HousingBasicMode.IsDecorSelected",
    params = {  },
    returns = { { name = "hasSelectedDecor", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingBasicMode.IsFreePlaceEnabled"] = {
    key = "C_HousingBasicMode.IsFreePlaceEnabled",
    name = "IsFreePlaceEnabled",
    category = "general",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["IsFreePlaceEnabled"],
    funcPath = "C_HousingBasicMode.IsFreePlaceEnabled",
    params = {  },
    returns = { { name = "freePlaceEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingBasicMode.IsGridSnapEnabled"] = {
    key = "C_HousingBasicMode.IsGridSnapEnabled",
    name = "IsGridSnapEnabled",
    category = "general",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["IsGridSnapEnabled"],
    funcPath = "C_HousingBasicMode.IsGridSnapEnabled",
    params = {  },
    returns = { { name = "isGridSnapEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingBasicMode.IsGridVisible"] = {
    key = "C_HousingBasicMode.IsGridVisible",
    name = "IsGridVisible",
    category = "general",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["IsGridVisible"],
    funcPath = "C_HousingBasicMode.IsGridVisible",
    params = {  },
    returns = { { name = "gridVisible", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingBasicMode.IsHouseExteriorHovered"] = {
    key = "C_HousingBasicMode.IsHouseExteriorHovered",
    name = "IsHouseExteriorHovered",
    category = "general",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["IsHouseExteriorHovered"],
    funcPath = "C_HousingBasicMode.IsHouseExteriorHovered",
    params = {  },
    returns = { { name = "isHouseExteriorHovered", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingBasicMode.IsHouseExteriorSelected"] = {
    key = "C_HousingBasicMode.IsHouseExteriorSelected",
    name = "IsHouseExteriorSelected",
    category = "general",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["IsHouseExteriorSelected"],
    funcPath = "C_HousingBasicMode.IsHouseExteriorSelected",
    params = {  },
    returns = { { name = "isHouseExteriorSelected", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingBasicMode.IsHoveringDecor"] = {
    key = "C_HousingBasicMode.IsHoveringDecor",
    name = "IsHoveringDecor",
    category = "general",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["IsHoveringDecor"],
    funcPath = "C_HousingBasicMode.IsHoveringDecor",
    params = {  },
    returns = { { name = "isHoveringDecor", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingBasicMode.IsPlacingNewDecor"] = {
    key = "C_HousingBasicMode.IsPlacingNewDecor",
    name = "IsPlacingNewDecor",
    category = "general",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["IsPlacingNewDecor"],
    funcPath = "C_HousingBasicMode.IsPlacingNewDecor",
    params = {  },
    returns = { { name = "hasPendingDecor", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingBasicMode.RemoveSelectedDecor"] = {
    key = "C_HousingBasicMode.RemoveSelectedDecor",
    name = "RemoveSelectedDecor",
    category = "general",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["RemoveSelectedDecor"],
    funcPath = "C_HousingBasicMode.RemoveSelectedDecor",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingBasicMode.RotateDecor"] = {
    key = "C_HousingBasicMode.RotateDecor",
    name = "RotateDecor",
    category = "combat_midnight",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["RotateDecor"],
    funcPath = "C_HousingBasicMode.RotateDecor",
    params = { { name = "rotDegrees", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBasicMode.RotateHouseExterior"] = {
    key = "C_HousingBasicMode.RotateHouseExterior",
    name = "RotateHouseExterior",
    category = "combat_midnight",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["RotateHouseExterior"],
    funcPath = "C_HousingBasicMode.RotateHouseExterior",
    params = { { name = "rotDegrees", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBasicMode.SetFreePlaceEnabled"] = {
    key = "C_HousingBasicMode.SetFreePlaceEnabled",
    name = "SetFreePlaceEnabled",
    category = "combat_midnight",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["SetFreePlaceEnabled"],
    funcPath = "C_HousingBasicMode.SetFreePlaceEnabled",
    params = { { name = "freePlaceEnabled", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBasicMode.SetGridSnapEnabled"] = {
    key = "C_HousingBasicMode.SetGridSnapEnabled",
    name = "SetGridSnapEnabled",
    category = "combat_midnight",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["SetGridSnapEnabled"],
    funcPath = "C_HousingBasicMode.SetGridSnapEnabled",
    params = { { name = "isGridSnapEnabled", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBasicMode.SetGridVisible"] = {
    key = "C_HousingBasicMode.SetGridVisible",
    name = "SetGridVisible",
    category = "combat_midnight",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["SetGridVisible"],
    funcPath = "C_HousingBasicMode.SetGridVisible",
    params = { { name = "gridVisible", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBasicMode.StartPlacingNewDecor"] = {
    key = "C_HousingBasicMode.StartPlacingNewDecor",
    name = "StartPlacingNewDecor",
    category = "combat_midnight",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["StartPlacingNewDecor"],
    funcPath = "C_HousingBasicMode.StartPlacingNewDecor",
    params = { { name = "catalogEntryID", type = "HousingCatalogEntryID", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBasicMode.StartPlacingPreviewDecor"] = {
    key = "C_HousingBasicMode.StartPlacingPreviewDecor",
    name = "StartPlacingPreviewDecor",
    category = "combat_midnight",
    subcategory = "c_housingbasicmode",
    func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["StartPlacingPreviewDecor"],
    funcPath = "C_HousingBasicMode.StartPlacingPreviewDecor",
    params = { { name = "decorRecordID", type = "number", default = nil }, { name = "bundleCatalogShopProductID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

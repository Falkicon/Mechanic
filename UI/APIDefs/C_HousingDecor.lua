-- Generated APIDefinitions for namespace: C_HousingDecor
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HousingDecor.CancelActiveEditing"] = {
    key = "C_HousingDecor.CancelActiveEditing",
    name = "CancelActiveEditing",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["CancelActiveEditing"],
    funcPath = "C_HousingDecor.CancelActiveEditing",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.CommitDecorMovement"] = {
    key = "C_HousingDecor.CommitDecorMovement",
    name = "CommitDecorMovement",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["CommitDecorMovement"],
    funcPath = "C_HousingDecor.CommitDecorMovement",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.EnterPreviewState"] = {
    key = "C_HousingDecor.EnterPreviewState",
    name = "EnterPreviewState",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["EnterPreviewState"],
    funcPath = "C_HousingDecor.EnterPreviewState",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.ExitPreviewState"] = {
    key = "C_HousingDecor.ExitPreviewState",
    name = "ExitPreviewState",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["ExitPreviewState"],
    funcPath = "C_HousingDecor.ExitPreviewState",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.GetAllPlacedDecor"] = {
    key = "C_HousingDecor.GetAllPlacedDecor",
    name = "GetAllPlacedDecor",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["GetAllPlacedDecor"],
    funcPath = "C_HousingDecor.GetAllPlacedDecor",
    params = {  },
    returns = { { name = "placedDecor", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.GetDecorIcon"] = {
    key = "C_HousingDecor.GetDecorIcon",
    name = "GetDecorIcon",
    category = "combat_midnight",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["GetDecorIcon"],
    funcPath = "C_HousingDecor.GetDecorIcon",
    params = { { name = "decorID", type = "number", default = nil } },
    returns = { { name = "icon", type = "fileID", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingDecor.GetDecorInstanceInfoForGUID"] = {
    key = "C_HousingDecor.GetDecorInstanceInfoForGUID",
    name = "GetDecorInstanceInfoForGUID",
    category = "combat_midnight",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["GetDecorInstanceInfoForGUID"],
    funcPath = "C_HousingDecor.GetDecorInstanceInfoForGUID",
    params = { { name = "decorGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "info", type = "HousingDecorInstanceInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingDecor.GetDecorName"] = {
    key = "C_HousingDecor.GetDecorName",
    name = "GetDecorName",
    category = "combat_midnight",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["GetDecorName"],
    funcPath = "C_HousingDecor.GetDecorName",
    params = { { name = "decorID", type = "number", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingDecor.GetHoveredDecorInfo"] = {
    key = "C_HousingDecor.GetHoveredDecorInfo",
    name = "GetHoveredDecorInfo",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["GetHoveredDecorInfo"],
    funcPath = "C_HousingDecor.GetHoveredDecorInfo",
    params = {  },
    returns = { { name = "info", type = "HousingDecorInstanceInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.GetMaxPlacementBudget"] = {
    key = "C_HousingDecor.GetMaxPlacementBudget",
    name = "GetMaxPlacementBudget",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["GetMaxPlacementBudget"],
    funcPath = "C_HousingDecor.GetMaxPlacementBudget",
    params = {  },
    returns = { { name = "maxBudget", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.GetNumDecorPlaced"] = {
    key = "C_HousingDecor.GetNumDecorPlaced",
    name = "GetNumDecorPlaced",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["GetNumDecorPlaced"],
    funcPath = "C_HousingDecor.GetNumDecorPlaced",
    params = {  },
    returns = { { name = "numPlaced", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.GetNumPreviewDecor"] = {
    key = "C_HousingDecor.GetNumPreviewDecor",
    name = "GetNumPreviewDecor",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["GetNumPreviewDecor"],
    funcPath = "C_HousingDecor.GetNumPreviewDecor",
    params = {  },
    returns = { { name = "numDecor", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.GetSelectedDecorInfo"] = {
    key = "C_HousingDecor.GetSelectedDecorInfo",
    name = "GetSelectedDecorInfo",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["GetSelectedDecorInfo"],
    funcPath = "C_HousingDecor.GetSelectedDecorInfo",
    params = {  },
    returns = { { name = "info", type = "HousingDecorInstanceInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.GetSpentPlacementBudget"] = {
    key = "C_HousingDecor.GetSpentPlacementBudget",
    name = "GetSpentPlacementBudget",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["GetSpentPlacementBudget"],
    funcPath = "C_HousingDecor.GetSpentPlacementBudget",
    params = {  },
    returns = { { name = "totalCost", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.HasMaxPlacementBudget"] = {
    key = "C_HousingDecor.HasMaxPlacementBudget",
    name = "HasMaxPlacementBudget",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["HasMaxPlacementBudget"],
    funcPath = "C_HousingDecor.HasMaxPlacementBudget",
    params = {  },
    returns = { { name = "hasMaxBudget", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.IsDecorSelected"] = {
    key = "C_HousingDecor.IsDecorSelected",
    name = "IsDecorSelected",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["IsDecorSelected"],
    funcPath = "C_HousingDecor.IsDecorSelected",
    params = {  },
    returns = { { name = "hasSelectedDecor", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.IsGridVisible"] = {
    key = "C_HousingDecor.IsGridVisible",
    name = "IsGridVisible",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["IsGridVisible"],
    funcPath = "C_HousingDecor.IsGridVisible",
    params = {  },
    returns = { { name = "gridVisible", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.IsHouseExteriorDoorHovered"] = {
    key = "C_HousingDecor.IsHouseExteriorDoorHovered",
    name = "IsHouseExteriorDoorHovered",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["IsHouseExteriorDoorHovered"],
    funcPath = "C_HousingDecor.IsHouseExteriorDoorHovered",
    params = {  },
    returns = { { name = "isHouseExteriorDoorHovered", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.IsHouseExteriorHovered"] = {
    key = "C_HousingDecor.IsHouseExteriorHovered",
    name = "IsHouseExteriorHovered",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["IsHouseExteriorHovered"],
    funcPath = "C_HousingDecor.IsHouseExteriorHovered",
    params = {  },
    returns = { { name = "isHouseExteriorHovered", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.IsHoveringDecor"] = {
    key = "C_HousingDecor.IsHoveringDecor",
    name = "IsHoveringDecor",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["IsHoveringDecor"],
    funcPath = "C_HousingDecor.IsHoveringDecor",
    params = {  },
    returns = { { name = "isHoveringDecor", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.IsModeDisabledForPreviewState"] = {
    key = "C_HousingDecor.IsModeDisabledForPreviewState",
    name = "IsModeDisabledForPreviewState",
    category = "combat_midnight",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["IsModeDisabledForPreviewState"],
    funcPath = "C_HousingDecor.IsModeDisabledForPreviewState",
    params = { { name = "mode", type = "HouseEditorMode", default = nil } },
    returns = { { name = "isModeDisabled", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingDecor.IsPreviewState"] = {
    key = "C_HousingDecor.IsPreviewState",
    name = "IsPreviewState",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["IsPreviewState"],
    funcPath = "C_HousingDecor.IsPreviewState",
    params = {  },
    returns = { { name = "isPreviewState", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.RemovePlacedDecorEntry"] = {
    key = "C_HousingDecor.RemovePlacedDecorEntry",
    name = "RemovePlacedDecorEntry",
    category = "combat_midnight",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["RemovePlacedDecorEntry"],
    funcPath = "C_HousingDecor.RemovePlacedDecorEntry",
    params = { { name = "decorGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingDecor.RemoveSelectedDecor"] = {
    key = "C_HousingDecor.RemoveSelectedDecor",
    name = "RemoveSelectedDecor",
    category = "general",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["RemoveSelectedDecor"],
    funcPath = "C_HousingDecor.RemoveSelectedDecor",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingDecor.SetGridVisible"] = {
    key = "C_HousingDecor.SetGridVisible",
    name = "SetGridVisible",
    category = "combat_midnight",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["SetGridVisible"],
    funcPath = "C_HousingDecor.SetGridVisible",
    params = { { name = "gridVisible", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingDecor.SetPlacedDecorEntryHovered"] = {
    key = "C_HousingDecor.SetPlacedDecorEntryHovered",
    name = "SetPlacedDecorEntryHovered",
    category = "combat_midnight",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["SetPlacedDecorEntryHovered"],
    funcPath = "C_HousingDecor.SetPlacedDecorEntryHovered",
    params = { { name = "decorGUID", type = "WOWGUID", default = nil }, { name = "hovered", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingDecor.SetPlacedDecorEntrySelected"] = {
    key = "C_HousingDecor.SetPlacedDecorEntrySelected",
    name = "SetPlacedDecorEntrySelected",
    category = "combat_midnight",
    subcategory = "c_housingdecor",
    func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["SetPlacedDecorEntrySelected"],
    funcPath = "C_HousingDecor.SetPlacedDecorEntrySelected",
    params = { { name = "decorGUID", type = "WOWGUID", default = nil }, { name = "selected", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

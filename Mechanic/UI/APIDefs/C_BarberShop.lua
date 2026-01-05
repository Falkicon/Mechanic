-- Generated APIDefinitions for namespace: C_BarberShop
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_BarberShop.ApplyCustomizationChoices"] = {
    key = "C_BarberShop.ApplyCustomizationChoices",
    name = "ApplyCustomizationChoices",
    category = "general",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["ApplyCustomizationChoices"],
    funcPath = "C_BarberShop.ApplyCustomizationChoices",
    params = {  },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_BarberShop.Cancel"] = {
    key = "C_BarberShop.Cancel",
    name = "Cancel",
    category = "general",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["Cancel"],
    funcPath = "C_BarberShop.Cancel",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_BarberShop.ClearPreviewChoices"] = {
    key = "C_BarberShop.ClearPreviewChoices",
    name = "ClearPreviewChoices",
    category = "combat_midnight",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["ClearPreviewChoices"],
    funcPath = "C_BarberShop.ClearPreviewChoices",
    params = { { name = "clearSavedChoices", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.GetAvailableCustomizations"] = {
    key = "C_BarberShop.GetAvailableCustomizations",
    name = "GetAvailableCustomizations",
    category = "general",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["GetAvailableCustomizations"],
    funcPath = "C_BarberShop.GetAvailableCustomizations",
    params = {  },
    returns = { { name = "categories", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_BarberShop.GetCurrentCameraZoom"] = {
    key = "C_BarberShop.GetCurrentCameraZoom",
    name = "GetCurrentCameraZoom",
    category = "general",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["GetCurrentCameraZoom"],
    funcPath = "C_BarberShop.GetCurrentCameraZoom",
    params = {  },
    returns = { { name = "zoomLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_BarberShop.GetCurrentCharacterData"] = {
    key = "C_BarberShop.GetCurrentCharacterData",
    name = "GetCurrentCharacterData",
    category = "general",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["GetCurrentCharacterData"],
    funcPath = "C_BarberShop.GetCurrentCharacterData",
    params = {  },
    returns = { { name = "characterData", type = "PlayerInfoCharacterData", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_BarberShop.GetCurrentCost"] = {
    key = "C_BarberShop.GetCurrentCost",
    name = "GetCurrentCost",
    category = "general",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["GetCurrentCost"],
    funcPath = "C_BarberShop.GetCurrentCost",
    params = {  },
    returns = { { name = "cost", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_BarberShop.GetViewingChrModel"] = {
    key = "C_BarberShop.GetViewingChrModel",
    name = "GetViewingChrModel",
    category = "general",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["GetViewingChrModel"],
    funcPath = "C_BarberShop.GetViewingChrModel",
    params = {  },
    returns = { { name = "chrModelID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_BarberShop.HasAlteredForm"] = {
    key = "C_BarberShop.HasAlteredForm",
    name = "HasAlteredForm",
    category = "general",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["HasAlteredForm"],
    funcPath = "C_BarberShop.HasAlteredForm",
    params = {  },
    returns = { { name = "hasAlteredForm", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_BarberShop.HasAnyChanges"] = {
    key = "C_BarberShop.HasAnyChanges",
    name = "HasAnyChanges",
    category = "general",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["HasAnyChanges"],
    funcPath = "C_BarberShop.HasAnyChanges",
    params = {  },
    returns = { { name = "hasChanges", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_BarberShop.HasCustomizationFeature"] = {
    key = "C_BarberShop.HasCustomizationFeature",
    name = "HasCustomizationFeature",
    category = "combat_midnight",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["HasCustomizationFeature"],
    funcPath = "C_BarberShop.HasCustomizationFeature",
    params = { { name = "featureMask", type = "ChrModelFeatureFlags", default = nil } },
    returns = { { name = "hasCustomizationFeature", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.IsViewingAlteredForm"] = {
    key = "C_BarberShop.IsViewingAlteredForm",
    name = "IsViewingAlteredForm",
    category = "general",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["IsViewingAlteredForm"],
    funcPath = "C_BarberShop.IsViewingAlteredForm",
    params = {  },
    returns = { { name = "isViewingAlteredForm", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_BarberShop.MarkCustomizationChoiceAsSeen"] = {
    key = "C_BarberShop.MarkCustomizationChoiceAsSeen",
    name = "MarkCustomizationChoiceAsSeen",
    category = "combat_midnight",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["MarkCustomizationChoiceAsSeen"],
    funcPath = "C_BarberShop.MarkCustomizationChoiceAsSeen",
    params = { { name = "choiceID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.MarkCustomizationOptionAsSeen"] = {
    key = "C_BarberShop.MarkCustomizationOptionAsSeen",
    name = "MarkCustomizationOptionAsSeen",
    category = "combat_midnight",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["MarkCustomizationOptionAsSeen"],
    funcPath = "C_BarberShop.MarkCustomizationOptionAsSeen",
    params = { { name = "optionID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.PreviewCustomizationChoice"] = {
    key = "C_BarberShop.PreviewCustomizationChoice",
    name = "PreviewCustomizationChoice",
    category = "combat_midnight",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["PreviewCustomizationChoice"],
    funcPath = "C_BarberShop.PreviewCustomizationChoice",
    params = { { name = "optionID", type = "number", default = nil }, { name = "choiceID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.RandomizeCustomizationChoices"] = {
    key = "C_BarberShop.RandomizeCustomizationChoices",
    name = "RandomizeCustomizationChoices",
    category = "general",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["RandomizeCustomizationChoices"],
    funcPath = "C_BarberShop.RandomizeCustomizationChoices",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_BarberShop.ResetCameraRotation"] = {
    key = "C_BarberShop.ResetCameraRotation",
    name = "ResetCameraRotation",
    category = "general",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["ResetCameraRotation"],
    funcPath = "C_BarberShop.ResetCameraRotation",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_BarberShop.ResetCustomizationChoices"] = {
    key = "C_BarberShop.ResetCustomizationChoices",
    name = "ResetCustomizationChoices",
    category = "general",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["ResetCustomizationChoices"],
    funcPath = "C_BarberShop.ResetCustomizationChoices",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_BarberShop.RotateCamera"] = {
    key = "C_BarberShop.RotateCamera",
    name = "RotateCamera",
    category = "combat_midnight",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["RotateCamera"],
    funcPath = "C_BarberShop.RotateCamera",
    params = { { name = "diffDegrees", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SaveSeenChoices"] = {
    key = "C_BarberShop.SaveSeenChoices",
    name = "SaveSeenChoices",
    category = "general",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["SaveSeenChoices"],
    funcPath = "C_BarberShop.SaveSeenChoices",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_BarberShop.SetCameraDistanceOffset"] = {
    key = "C_BarberShop.SetCameraDistanceOffset",
    name = "SetCameraDistanceOffset",
    category = "combat_midnight",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetCameraDistanceOffset"],
    funcPath = "C_BarberShop.SetCameraDistanceOffset",
    params = { { name = "offset", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SetCameraZoomLevel"] = {
    key = "C_BarberShop.SetCameraZoomLevel",
    name = "SetCameraZoomLevel",
    category = "combat_midnight",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetCameraZoomLevel"],
    funcPath = "C_BarberShop.SetCameraZoomLevel",
    params = { { name = "zoomLevel", type = "number", default = nil }, { name = "keepCustomZoom", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SetCustomizationChoice"] = {
    key = "C_BarberShop.SetCustomizationChoice",
    name = "SetCustomizationChoice",
    category = "combat_midnight",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetCustomizationChoice"],
    funcPath = "C_BarberShop.SetCustomizationChoice",
    params = { { name = "optionID", type = "number", default = nil }, { name = "choiceID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SetModelDressState"] = {
    key = "C_BarberShop.SetModelDressState",
    name = "SetModelDressState",
    category = "combat_midnight",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetModelDressState"],
    funcPath = "C_BarberShop.SetModelDressState",
    params = { { name = "dressedState", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SetSelectedSex"] = {
    key = "C_BarberShop.SetSelectedSex",
    name = "SetSelectedSex",
    category = "combat_midnight",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetSelectedSex"],
    funcPath = "C_BarberShop.SetSelectedSex",
    params = { { name = "sex", type = "UnitSex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SetViewingAlteredForm"] = {
    key = "C_BarberShop.SetViewingAlteredForm",
    name = "SetViewingAlteredForm",
    category = "combat_midnight",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetViewingAlteredForm"],
    funcPath = "C_BarberShop.SetViewingAlteredForm",
    params = { { name = "isViewingAlteredForm", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SetViewingChrModel"] = {
    key = "C_BarberShop.SetViewingChrModel",
    name = "SetViewingChrModel",
    category = "combat_midnight",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetViewingChrModel"],
    funcPath = "C_BarberShop.SetViewingChrModel",
    params = { { name = "chrModelID", type = "number", default = nil }, { name = "spellShapeshiftFormID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SetViewingShapeshiftForm"] = {
    key = "C_BarberShop.SetViewingShapeshiftForm",
    name = "SetViewingShapeshiftForm",
    category = "combat_midnight",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetViewingShapeshiftForm"],
    funcPath = "C_BarberShop.SetViewingShapeshiftForm",
    params = { { name = "shapeshiftFormID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.ZoomCamera"] = {
    key = "C_BarberShop.ZoomCamera",
    name = "ZoomCamera",
    category = "combat_midnight",
    subcategory = "c_barbershop",
    func = _G["C_BarberShop"] and _G["C_BarberShop"]["ZoomCamera"],
    funcPath = "C_BarberShop.ZoomCamera",
    params = { { name = "zoomAmount", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

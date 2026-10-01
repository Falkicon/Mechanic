-- Generated APIDefinitions for namespace: C_HouseEditor
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HouseEditor.ActivateHouseEditorMode"] = {
    key = "C_HouseEditor.ActivateHouseEditorMode",
    name = "ActivateHouseEditorMode",
    category = "general",
    subcategory = "c_houseeditor",
    funcPath = "C_HouseEditor.ActivateHouseEditorMode",
    params = { { name = "editMode", type = "HouseEditorMode", default = nil } },
    returns = { { name = "result", type = "HousingResult", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HouseEditor.EnterHouseEditor"] = {
    key = "C_HouseEditor.EnterHouseEditor",
    name = "EnterHouseEditor",
    category = "general",
    subcategory = "c_houseeditor",
    funcPath = "C_HouseEditor.EnterHouseEditor",
    params = {  },
    returns = { { name = "result", type = "HousingResult", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HouseEditor.GetActiveHouseEditorMode"] = {
    key = "C_HouseEditor.GetActiveHouseEditorMode",
    name = "GetActiveHouseEditorMode",
    category = "general",
    subcategory = "c_houseeditor",
    funcPath = "C_HouseEditor.GetActiveHouseEditorMode",
    params = {  },
    returns = { { name = "editMode", type = "HouseEditorMode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HouseEditor.GetHouseEditorAvailability"] = {
    key = "C_HouseEditor.GetHouseEditorAvailability",
    name = "GetHouseEditorAvailability",
    category = "general",
    subcategory = "c_houseeditor",
    funcPath = "C_HouseEditor.GetHouseEditorAvailability",
    params = {  },
    returns = { { name = "result", type = "HousingResult", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HouseEditor.GetHouseEditorModeAvailability"] = {
    key = "C_HouseEditor.GetHouseEditorModeAvailability",
    name = "GetHouseEditorModeAvailability",
    category = "general",
    subcategory = "c_houseeditor",
    funcPath = "C_HouseEditor.GetHouseEditorModeAvailability",
    params = { { name = "editMode", type = "HouseEditorMode", default = nil } },
    returns = { { name = "result", type = "HousingResult", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HouseEditor.IsHouseEditorActive"] = {
    key = "C_HouseEditor.IsHouseEditorActive",
    name = "IsHouseEditorActive",
    category = "general",
    subcategory = "c_houseeditor",
    funcPath = "C_HouseEditor.IsHouseEditorActive",
    params = {  },
    returns = { { name = "isEditorActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HouseEditor.IsHouseEditorModeActive"] = {
    key = "C_HouseEditor.IsHouseEditorModeActive",
    name = "IsHouseEditorModeActive",
    category = "general",
    subcategory = "c_houseeditor",
    funcPath = "C_HouseEditor.IsHouseEditorModeActive",
    params = { { name = "editMode", type = "HouseEditorMode", default = nil } },
    returns = { { name = "isModeActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HouseEditor.IsHouseEditorStatusAvailable"] = {
    key = "C_HouseEditor.IsHouseEditorStatusAvailable",
    name = "IsHouseEditorStatusAvailable",
    category = "general",
    subcategory = "c_houseeditor",
    funcPath = "C_HouseEditor.IsHouseEditorStatusAvailable",
    params = {  },
    returns = { { name = "editorStatusAvailable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HouseEditor.LeaveHouseEditor"] = {
    key = "C_HouseEditor.LeaveHouseEditor",
    name = "LeaveHouseEditor",
    category = "general",
    subcategory = "c_houseeditor",
    funcPath = "C_HouseEditor.LeaveHouseEditor",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

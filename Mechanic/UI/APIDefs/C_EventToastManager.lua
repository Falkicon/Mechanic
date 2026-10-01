-- Generated APIDefinitions for namespace: C_EventToastManager
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_EventToastManager.GetLevelUpDisplayToastsFromLevel"] = {
    key = "C_EventToastManager.GetLevelUpDisplayToastsFromLevel",
    name = "GetLevelUpDisplayToastsFromLevel",
    category = "general",
    subcategory = "c_eventtoastmanager",
    funcPath = "C_EventToastManager.GetLevelUpDisplayToastsFromLevel",
    params = { { name = "level", type = "number", default = nil } },
    returns = { { name = "toastInfo", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EventToastManager.GetNextToastToDisplay"] = {
    key = "C_EventToastManager.GetNextToastToDisplay",
    name = "GetNextToastToDisplay",
    category = "general",
    subcategory = "c_eventtoastmanager",
    funcPath = "C_EventToastManager.GetNextToastToDisplay",
    params = {  },
    returns = { { name = "toastInfo", type = "EventToastInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_EventToastManager.RemoveCurrentToast"] = {
    key = "C_EventToastManager.RemoveCurrentToast",
    name = "RemoveCurrentToast",
    category = "general",
    subcategory = "c_eventtoastmanager",
    funcPath = "C_EventToastManager.RemoveCurrentToast",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

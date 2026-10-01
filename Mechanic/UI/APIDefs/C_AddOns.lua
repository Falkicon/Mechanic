-- Generated APIDefinitions for namespace: C_AddOns
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AddOns.DisableAddOn"] = {
    key = "C_AddOns.DisableAddOn",
    name = "DisableAddOn",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.DisableAddOn",
    params = { { name = "name", type = "uiAddon", default = nil }, { name = "character", type = "cstring", default = "0" } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.DisableAllAddOns"] = {
    key = "C_AddOns.DisableAllAddOns",
    name = "DisableAllAddOns",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.DisableAllAddOns",
    params = { { name = "character", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.DoesAddOnExist"] = {
    key = "C_AddOns.DoesAddOnExist",
    name = "DoesAddOnExist",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.DoesAddOnExist",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "exists", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.DoesAddOnHaveLoadError"] = {
    key = "C_AddOns.DoesAddOnHaveLoadError",
    name = "DoesAddOnHaveLoadError",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.DoesAddOnHaveLoadError",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "hadError", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.EnableAddOn"] = {
    key = "C_AddOns.EnableAddOn",
    name = "EnableAddOn",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.EnableAddOn",
    params = { { name = "name", type = "uiAddon", default = nil }, { name = "character", type = "cstring", default = "0" } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.EnableAllAddOns"] = {
    key = "C_AddOns.EnableAllAddOns",
    name = "EnableAllAddOns",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.EnableAllAddOns",
    params = { { name = "character", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnDependencies"] = {
    key = "C_AddOns.GetAddOnDependencies",
    name = "GetAddOnDependencies",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.GetAddOnDependencies",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "deps", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnEnableState"] = {
    key = "C_AddOns.GetAddOnEnableState",
    name = "GetAddOnEnableState",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.GetAddOnEnableState",
    params = { { name = "name", type = "uiAddon", default = nil }, { name = "character", type = "cstring", default = "0" } },
    returns = { { name = "state", type = "AddOnEnableState", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnInfo"] = {
    key = "C_AddOns.GetAddOnInfo",
    name = "GetAddOnInfo",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.GetAddOnInfo",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "title", type = "cstring", canBeSecret = false }, { name = "notes", type = "cstring", canBeSecret = false }, { name = "loadable", type = "bool", canBeSecret = false }, { name = "reason", type = "cstring", canBeSecret = false }, { name = "security", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnInterfaceVersion"] = {
    key = "C_AddOns.GetAddOnInterfaceVersion",
    name = "GetAddOnInterfaceVersion",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.GetAddOnInterfaceVersion",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "interfaceVersion", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnLocalTable"] = {
    key = "C_AddOns.GetAddOnLocalTable",
    name = "GetAddOnLocalTable",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.GetAddOnLocalTable",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "table", type = "LuaValueVariant", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnMetadata"] = {
    key = "C_AddOns.GetAddOnMetadata",
    name = "GetAddOnMetadata",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.GetAddOnMetadata",
    params = { { name = "name", type = "uiAddon", default = nil }, { name = "variable", type = "cstring", default = nil } },
    returns = { { name = "value", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnName"] = {
    key = "C_AddOns.GetAddOnName",
    name = "GetAddOnName",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.GetAddOnName",
    params = { { name = "index", type = "uiAddon", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnNotes"] = {
    key = "C_AddOns.GetAddOnNotes",
    name = "GetAddOnNotes",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.GetAddOnNotes",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "notes", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnOptionalDependencies"] = {
    key = "C_AddOns.GetAddOnOptionalDependencies",
    name = "GetAddOnOptionalDependencies",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.GetAddOnOptionalDependencies",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "deps", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnSecurity"] = {
    key = "C_AddOns.GetAddOnSecurity",
    name = "GetAddOnSecurity",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.GetAddOnSecurity",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "security", type = "AddOnSecurityStatus", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnTitle"] = {
    key = "C_AddOns.GetAddOnTitle",
    name = "GetAddOnTitle",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.GetAddOnTitle",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "title", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetNumAddOns"] = {
    key = "C_AddOns.GetNumAddOns",
    name = "GetNumAddOns",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.GetNumAddOns",
    params = {  },
    returns = { { name = "numAddOns", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AddOns.GetScriptsDisallowedForBeta"] = {
    key = "C_AddOns.GetScriptsDisallowedForBeta",
    name = "GetScriptsDisallowedForBeta",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.GetScriptsDisallowedForBeta",
    params = {  },
    returns = { { name = "disallowed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AddOns.IsAddOnDefaultEnabled"] = {
    key = "C_AddOns.IsAddOnDefaultEnabled",
    name = "IsAddOnDefaultEnabled",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.IsAddOnDefaultEnabled",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "defaultEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.IsAddOnLoadOnDemand"] = {
    key = "C_AddOns.IsAddOnLoadOnDemand",
    name = "IsAddOnLoadOnDemand",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.IsAddOnLoadOnDemand",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "loadOnDemand", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.IsAddOnLoadable"] = {
    key = "C_AddOns.IsAddOnLoadable",
    name = "IsAddOnLoadable",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.IsAddOnLoadable",
    params = { { name = "name", type = "uiAddon", default = nil }, { name = "character", type = "cstring", default = "0" }, { name = "demandLoaded", type = "bool", default = false } },
    returns = { { name = "loadable", type = "bool", canBeSecret = false }, { name = "reason", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.IsAddOnLoaded"] = {
    key = "C_AddOns.IsAddOnLoaded",
    name = "IsAddOnLoaded",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.IsAddOnLoaded",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "loadedOrLoading", type = "bool", canBeSecret = false }, { name = "loaded", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.IsAddonVersionCheckEnabled"] = {
    key = "C_AddOns.IsAddonVersionCheckEnabled",
    name = "IsAddonVersionCheckEnabled",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.IsAddonVersionCheckEnabled",
    params = {  },
    returns = { { name = "isEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AddOns.LoadAddOn"] = {
    key = "C_AddOns.LoadAddOn",
    name = "LoadAddOn",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.LoadAddOn",
    params = { { name = "name", type = "uiAddon", default = nil } },
    returns = { { name = "loaded", type = "bool", canBeSecret = false }, { name = "value", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.ResetAddOns"] = {
    key = "C_AddOns.ResetAddOns",
    name = "ResetAddOns",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.ResetAddOns",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_AddOns.ResetDisabledAddOns"] = {
    key = "C_AddOns.ResetDisabledAddOns",
    name = "ResetDisabledAddOns",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.ResetDisabledAddOns",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_AddOns.SaveAddOns"] = {
    key = "C_AddOns.SaveAddOns",
    name = "SaveAddOns",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.SaveAddOns",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_AddOns.SetAddonVersionCheck"] = {
    key = "C_AddOns.SetAddonVersionCheck",
    name = "SetAddonVersionCheck",
    category = "general",
    subcategory = "c_addons",
    funcPath = "C_AddOns.SetAddonVersionCheck",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

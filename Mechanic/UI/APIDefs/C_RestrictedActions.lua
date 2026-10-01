-- Generated APIDefinitions for namespace: C_RestrictedActions
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_RestrictedActions.CheckAllowProtectedFunctions"] = {
    key = "C_RestrictedActions.CheckAllowProtectedFunctions",
    name = "CheckAllowProtectedFunctions",
    category = "general",
    subcategory = "c_restrictedactions",
    funcPath = "C_RestrictedActions.CheckAllowProtectedFunctions",
    params = { { name = "object", type = "FrameScriptObject", default = nil }, { name = "silent", type = "bool", default = false } },
    returns = { { name = "protectedFunctionsAllowed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RestrictedActions.GetAddOnRestrictionState"] = {
    key = "C_RestrictedActions.GetAddOnRestrictionState",
    name = "GetAddOnRestrictionState",
    category = "general",
    subcategory = "c_restrictedactions",
    funcPath = "C_RestrictedActions.GetAddOnRestrictionState",
    params = { { name = "type", type = "AddOnRestrictionType", default = nil } },
    returns = { { name = "state", type = "AddOnRestrictionState", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RestrictedActions.InCombatLockdown"] = {
    key = "C_RestrictedActions.InCombatLockdown",
    name = "InCombatLockdown",
    category = "general",
    subcategory = "c_restrictedactions",
    funcPath = "C_RestrictedActions.InCombatLockdown",
    params = {  },
    returns = { { name = "inCombatLockdown", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_RestrictedActions.IsAddOnRestrictionActive"] = {
    key = "C_RestrictedActions.IsAddOnRestrictionActive",
    name = "IsAddOnRestrictionActive",
    category = "general",
    subcategory = "c_restrictedactions",
    funcPath = "C_RestrictedActions.IsAddOnRestrictionActive",
    params = { { name = "type", type = "AddOnRestrictionType", default = nil } },
    returns = { { name = "active", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

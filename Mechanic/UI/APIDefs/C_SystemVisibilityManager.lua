-- Generated APIDefinitions for namespace: C_SystemVisibilityManager
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SystemVisibilityManager.IsSystemVisible"] = {
    key = "C_SystemVisibilityManager.IsSystemVisible",
    name = "IsSystemVisible",
    category = "general",
    subcategory = "c_systemvisibilitymanager",
    funcPath = "C_SystemVisibilityManager.IsSystemVisible",
    params = { { name = "system", type = "UISystemType", default = nil } },
    returns = { { name = "visible", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

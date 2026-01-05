-- Generated APIDefinitions for namespace: C_SystemVisibilityManager
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SystemVisibilityManager.IsSystemVisible"] = {
    key = "C_SystemVisibilityManager.IsSystemVisible",
    name = "IsSystemVisible",
    category = "combat_midnight",
    subcategory = "c_systemvisibilitymanager",
    func = _G["C_SystemVisibilityManager"] and _G["C_SystemVisibilityManager"]["IsSystemVisible"],
    funcPath = "C_SystemVisibilityManager.IsSystemVisible",
    params = { { name = "system", type = "UISystemType", default = nil } },
    returns = { { name = "visible", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

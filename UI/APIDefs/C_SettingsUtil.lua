-- Generated APIDefinitions for namespace: C_SettingsUtil
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SettingsUtil.NotifySettingsLoaded"] = {
    key = "C_SettingsUtil.NotifySettingsLoaded",
    name = "NotifySettingsLoaded",
    category = "ui",
    subcategory = "c_settingsutil",
    func = _G["C_SettingsUtil"] and _G["C_SettingsUtil"]["NotifySettingsLoaded"],
    funcPath = "C_SettingsUtil.NotifySettingsLoaded",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_SettingsUtil.OpenSettingsPanel"] = {
    key = "C_SettingsUtil.OpenSettingsPanel",
    name = "OpenSettingsPanel",
    category = "combat_midnight",
    subcategory = "c_settingsutil",
    func = _G["C_SettingsUtil"] and _G["C_SettingsUtil"]["OpenSettingsPanel"],
    funcPath = "C_SettingsUtil.OpenSettingsPanel",
    params = { { name = "openToCategoryID", type = "number", default = nil }, { name = "scrollToElementName", type = "stringView", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

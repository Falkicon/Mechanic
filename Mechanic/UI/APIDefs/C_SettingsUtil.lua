-- Generated APIDefinitions for namespace: C_SettingsUtil
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SettingsUtil.NotifySettingsLoaded"] = {
    key = "C_SettingsUtil.NotifySettingsLoaded",
    name = "NotifySettingsLoaded",
    category = "ui",
    subcategory = "c_settingsutil",
    funcPath = "C_SettingsUtil.NotifySettingsLoaded",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_SettingsUtil.OpenSettingsPanel"] = {
    key = "C_SettingsUtil.OpenSettingsPanel",
    name = "OpenSettingsPanel",
    category = "ui",
    subcategory = "c_settingsutil",
    funcPath = "C_SettingsUtil.OpenSettingsPanel",
    params = { { name = "openToCategoryID", type = "number", default = nil }, { name = "scrollToElementName", type = "stringView", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

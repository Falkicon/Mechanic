-- Generated APIDefinitions for namespace: C_Log
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Log.LogErrorMessage"] = {
    key = "C_Log.LogErrorMessage",
    name = "LogErrorMessage",
    category = "combat_midnight",
    subcategory = "c_log",
    func = _G["C_Log"] and _G["C_Log"]["LogErrorMessage"],
    funcPath = "C_Log.LogErrorMessage",
    params = { { name = "message", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Log.LogMessage"] = {
    key = "C_Log.LogMessage",
    name = "LogMessage",
    category = "combat_midnight",
    subcategory = "c_log",
    func = _G["C_Log"] and _G["C_Log"]["LogMessage"],
    funcPath = "C_Log.LogMessage",
    params = { { name = "message", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Log.LogMessageWithPriority"] = {
    key = "C_Log.LogMessageWithPriority",
    name = "LogMessageWithPriority",
    category = "combat_midnight",
    subcategory = "c_log",
    func = _G["C_Log"] and _G["C_Log"]["LogMessageWithPriority"],
    funcPath = "C_Log.LogMessageWithPriority",
    params = { { name = "priority", type = "LogPriority", default = nil }, { name = "message", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Log.LogWarningMessage"] = {
    key = "C_Log.LogWarningMessage",
    name = "LogWarningMessage",
    category = "combat_midnight",
    subcategory = "c_log",
    func = _G["C_Log"] and _G["C_Log"]["LogWarningMessage"],
    funcPath = "C_Log.LogWarningMessage",
    params = { { name = "message", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

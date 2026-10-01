-- Generated APIDefinitions for namespace: C_EventUtils
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_EventUtils.IsCallbackEvent"] = {
    key = "C_EventUtils.IsCallbackEvent",
    name = "IsCallbackEvent",
    category = "general",
    subcategory = "c_eventutils",
    funcPath = "C_EventUtils.IsCallbackEvent",
    params = { { name = "eventName", type = "stringView", default = nil } },
    returns = { { name = "isCallbackEvent", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EventUtils.IsEventValid"] = {
    key = "C_EventUtils.IsEventValid",
    name = "IsEventValid",
    category = "general",
    subcategory = "c_eventutils",
    funcPath = "C_EventUtils.IsEventValid",
    params = { { name = "eventName", type = "stringView", default = nil } },
    returns = { { name = "valid", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

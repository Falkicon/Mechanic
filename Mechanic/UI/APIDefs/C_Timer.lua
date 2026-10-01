-- Generated APIDefinitions for namespace: C_Timer
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Timer.After"] = {
    key = "C_Timer.After",
    name = "After",
    category = "general",
    subcategory = "c_timer",
    funcPath = "C_Timer.After",
    params = { { name = "seconds", type = "number", default = nil }, { name = "callback", type = "TimerCallback", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Timer.NewTicker"] = {
    key = "C_Timer.NewTicker",
    name = "NewTicker",
    category = "general",
    subcategory = "c_timer",
    funcPath = "C_Timer.NewTicker",
    params = { { name = "seconds", type = "number", default = nil }, { name = "callback", type = "TickerCallback", default = nil }, { name = "iterations", type = "number", default = nil } },
    returns = { { name = "cbObject", type = "TickerCallback", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Timer.NewTimer"] = {
    key = "C_Timer.NewTimer",
    name = "NewTimer",
    category = "general",
    subcategory = "c_timer",
    funcPath = "C_Timer.NewTimer",
    params = { { name = "seconds", type = "number", default = nil }, { name = "callback", type = "TickerCallback", default = nil } },
    returns = { { name = "cbObject", type = "TickerCallback", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

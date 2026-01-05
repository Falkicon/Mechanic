-- Generated APIDefinitions for namespace: C_Timer
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Timer.After"] = {
    key = "C_Timer.After",
    name = "After",
    category = "combat_midnight",
    subcategory = "c_timer",
    func = _G["C_Timer"] and _G["C_Timer"]["After"],
    funcPath = "C_Timer.After",
    params = { { name = "seconds", type = "number", default = nil }, { name = "callback", type = "TimerCallback", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Timer.NewTicker"] = {
    key = "C_Timer.NewTicker",
    name = "NewTicker",
    category = "combat_midnight",
    subcategory = "c_timer",
    func = _G["C_Timer"] and _G["C_Timer"]["NewTicker"],
    funcPath = "C_Timer.NewTicker",
    params = { { name = "seconds", type = "number", default = nil }, { name = "callback", type = "TickerCallback", default = nil }, { name = "iterations", type = "number", default = nil } },
    returns = { { name = "cbObject", type = "TickerCallback", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Timer.NewTimer"] = {
    key = "C_Timer.NewTimer",
    name = "NewTimer",
    category = "combat_midnight",
    subcategory = "c_timer",
    func = _G["C_Timer"] and _G["C_Timer"]["NewTimer"],
    funcPath = "C_Timer.NewTimer",
    params = { { name = "seconds", type = "number", default = nil }, { name = "callback", type = "TickerCallback", default = nil } },
    returns = { { name = "cbObject", type = "TickerCallback", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

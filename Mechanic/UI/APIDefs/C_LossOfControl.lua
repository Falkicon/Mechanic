-- Generated APIDefinitions for namespace: C_LossOfControl
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LossOfControl.GetActiveLossOfControlData"] = {
    key = "C_LossOfControl.GetActiveLossOfControlData",
    name = "GetActiveLossOfControlData",
    category = "general",
    subcategory = "c_lossofcontrol",
    funcPath = "C_LossOfControl.GetActiveLossOfControlData",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "event", type = "LossOfControlData", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LossOfControl.GetActiveLossOfControlDataByUnit"] = {
    key = "C_LossOfControl.GetActiveLossOfControlDataByUnit",
    name = "GetActiveLossOfControlDataByUnit",
    category = "general",
    subcategory = "c_lossofcontrol",
    funcPath = "C_LossOfControl.GetActiveLossOfControlDataByUnit",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "event", type = "LossOfControlData", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LossOfControl.GetActiveLossOfControlDataCount"] = {
    key = "C_LossOfControl.GetActiveLossOfControlDataCount",
    name = "GetActiveLossOfControlDataCount",
    category = "general",
    subcategory = "c_lossofcontrol",
    funcPath = "C_LossOfControl.GetActiveLossOfControlDataCount",
    params = {  },
    returns = { { name = "count", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LossOfControl.GetActiveLossOfControlDataCountByUnit"] = {
    key = "C_LossOfControl.GetActiveLossOfControlDataCountByUnit",
    name = "GetActiveLossOfControlDataCountByUnit",
    category = "general",
    subcategory = "c_lossofcontrol",
    funcPath = "C_LossOfControl.GetActiveLossOfControlDataCountByUnit",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "count", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

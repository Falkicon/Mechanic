-- Generated APIDefinitions for namespace: C_TradeInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_TradeInfo.AddTradeMoney"] = {
    key = "C_TradeInfo.AddTradeMoney",
    name = "AddTradeMoney",
    category = "general",
    subcategory = "c_tradeinfo",
    funcPath = "C_TradeInfo.AddTradeMoney",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeInfo.PickupTradeMoney"] = {
    key = "C_TradeInfo.PickupTradeMoney",
    name = "PickupTradeMoney",
    category = "general",
    subcategory = "c_tradeinfo",
    funcPath = "C_TradeInfo.PickupTradeMoney",
    params = { { name = "amount", type = "WOWMONEY", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeInfo.SetTradeMoney"] = {
    key = "C_TradeInfo.SetTradeMoney",
    name = "SetTradeMoney",
    category = "general",
    subcategory = "c_tradeinfo",
    funcPath = "C_TradeInfo.SetTradeMoney",
    params = { { name = "amount", type = "WOWMONEY", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_WowTokenUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_WowTokenUI.StartTokenSell"] = {
    key = "C_WowTokenUI.StartTokenSell",
    name = "StartTokenSell",
    category = "general",
    subcategory = "c_wowtokenui",
    funcPath = "C_WowTokenUI.StartTokenSell",
    params = { { name = "tokenGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

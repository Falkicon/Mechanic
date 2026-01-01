-- Generated APIDefinitions for namespace: C_TradeInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_TradeInfo.PickupTradeMoney"] = {
	key = "C_TradeInfo.PickupTradeMoney",
	name = "PickupTradeMoney",
	category = "combat_midnight",
	subcategory = "c_tradeinfo",
	func = _G["C_TradeInfo"] and _G["C_TradeInfo"]["PickupTradeMoney"],
	funcPath = "C_TradeInfo.PickupTradeMoney",
	params = { { name = "amount", type = "WOWMONEY", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeInfo.SetTradeMoney"] = {
	key = "C_TradeInfo.SetTradeMoney",
	name = "SetTradeMoney",
	category = "combat_midnight",
	subcategory = "c_tradeinfo",
	func = _G["C_TradeInfo"] and _G["C_TradeInfo"]["SetTradeMoney"],
	funcPath = "C_TradeInfo.SetTradeMoney",
	params = { { name = "amount", type = "WOWMONEY", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

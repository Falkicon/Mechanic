-- Generated APIDefinitions for namespace: C_MerchantFrame
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_MerchantFrame.GetBuybackItemID"] = {
	key = "C_MerchantFrame.GetBuybackItemID",
	name = "GetBuybackItemID",
	category = "combat_midnight",
	subcategory = "c_merchantframe",
	func = _G["C_MerchantFrame"] and _G["C_MerchantFrame"]["GetBuybackItemID"],
	funcPath = "C_MerchantFrame.GetBuybackItemID",
	params = { { name = "buybackSlotIndex", type = "luaIndex", default = nil } },
	returns = { { name = "buybackItemID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MerchantFrame.GetItemInfo"] = {
	key = "C_MerchantFrame.GetItemInfo",
	name = "GetItemInfo",
	category = "combat_midnight",
	subcategory = "c_merchantframe",
	func = _G["C_MerchantFrame"] and _G["C_MerchantFrame"]["GetItemInfo"],
	funcPath = "C_MerchantFrame.GetItemInfo",
	params = {
		{
			name = "index",
			type = "luaIndex",
			default = nil,
			examples = {
				{ value = "itemId or 0", label = "WeakAuras" },
				{ value = "itemname or 0", label = "WeakAuras" },
				{ value = "trigger.itemName or 0", label = "WeakAuras" },
			},
		},
	},
	returns = { { name = "info", type = "MerchantItemInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MerchantFrame.IsMerchantItemRefundable"] = {
	key = "C_MerchantFrame.IsMerchantItemRefundable",
	name = "IsMerchantItemRefundable",
	category = "combat_midnight",
	subcategory = "c_merchantframe",
	func = _G["C_MerchantFrame"] and _G["C_MerchantFrame"]["IsMerchantItemRefundable"],
	funcPath = "C_MerchantFrame.IsMerchantItemRefundable",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "refundable", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_AccountStore
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AccountStore.BeginPurchase"] = {
	key = "C_AccountStore.BeginPurchase",
	name = "BeginPurchase",
	category = "combat_midnight",
	subcategory = "c_accountstore",
	func = _G["C_AccountStore"] and _G["C_AccountStore"]["BeginPurchase"],
	funcPath = "C_AccountStore.BeginPurchase",
	params = { { name = "itemID", type = "number", default = nil } },
	returns = { { name = "purchaseStarted", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetCategories"] = {
	key = "C_AccountStore.GetCategories",
	name = "GetCategories",
	category = "combat_midnight",
	subcategory = "c_accountstore",
	func = _G["C_AccountStore"] and _G["C_AccountStore"]["GetCategories"],
	funcPath = "C_AccountStore.GetCategories",
	params = { { name = "storeFrontID", type = "number", default = nil } },
	returns = { { name = "categories", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetCategoryInfo"] = {
	key = "C_AccountStore.GetCategoryInfo",
	name = "GetCategoryInfo",
	category = "combat_midnight",
	subcategory = "c_accountstore",
	func = _G["C_AccountStore"] and _G["C_AccountStore"]["GetCategoryInfo"],
	funcPath = "C_AccountStore.GetCategoryInfo",
	params = {
		{
			name = "categoryID",
			type = "number",
			default = nil,
			examples = {
				{ value = 15301, label = "AllTheThings" },
				{ value = 14941, label = "AllTheThings" },
				{ value = 15304, label = "AllTheThings" },
			},
		},
	},
	returns = { { name = "info", type = "AccountStoreCategoryInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetCategoryItems"] = {
	key = "C_AccountStore.GetCategoryItems",
	name = "GetCategoryItems",
	category = "combat_midnight",
	subcategory = "c_accountstore",
	func = _G["C_AccountStore"] and _G["C_AccountStore"]["GetCategoryItems"],
	funcPath = "C_AccountStore.GetCategoryItems",
	params = { { name = "categoryID", type = "number", default = nil } },
	returns = { { name = "itemIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetCurrencyAvailable"] = {
	key = "C_AccountStore.GetCurrencyAvailable",
	name = "GetCurrencyAvailable",
	category = "combat_midnight",
	subcategory = "c_accountstore",
	func = _G["C_AccountStore"] and _G["C_AccountStore"]["GetCurrencyAvailable"],
	funcPath = "C_AccountStore.GetCurrencyAvailable",
	params = { { name = "currencyID", type = "number", default = nil } },
	returns = { { name = "amount", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetCurrencyIDForStore"] = {
	key = "C_AccountStore.GetCurrencyIDForStore",
	name = "GetCurrencyIDForStore",
	category = "combat_midnight",
	subcategory = "c_accountstore",
	func = _G["C_AccountStore"] and _G["C_AccountStore"]["GetCurrencyIDForStore"],
	funcPath = "C_AccountStore.GetCurrencyIDForStore",
	params = { { name = "storeFrontID", type = "number", default = nil } },
	returns = { { name = "currencyID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetCurrencyInfo"] = {
	key = "C_AccountStore.GetCurrencyInfo",
	name = "GetCurrencyInfo",
	category = "combat_midnight",
	subcategory = "c_accountstore",
	func = _G["C_AccountStore"] and _G["C_AccountStore"]["GetCurrencyInfo"],
	funcPath = "C_AccountStore.GetCurrencyInfo",
	params = {
		{
			name = "currencyID",
			type = "number",
			default = nil,
			examples = {
				{ value = 1, label = "WeakAuras" },
				{ value = "id", label = "Weekly" },
				{ value = 3292, label = "Narcissus" },
			},
		},
	},
	returns = { { name = "info", type = "AccountStoreCurrencyInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetItemInfo"] = {
	key = "C_AccountStore.GetItemInfo",
	name = "GetItemInfo",
	category = "combat_midnight",
	subcategory = "c_accountstore",
	func = _G["C_AccountStore"] and _G["C_AccountStore"]["GetItemInfo"],
	funcPath = "C_AccountStore.GetItemInfo",
	params = {
		{
			name = "itemID",
			type = "number",
			default = nil,
			examples = {
				{ value = "itemId or 0", label = "WeakAuras" },
				{ value = "itemname or 0", label = "WeakAuras" },
				{ value = "trigger.itemName or 0", label = "WeakAuras" },
			},
		},
	},
	returns = { { name = "info", type = "AccountStoreItemInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetStoreFrontState"] = {
	key = "C_AccountStore.GetStoreFrontState",
	name = "GetStoreFrontState",
	category = "combat_midnight",
	subcategory = "c_accountstore",
	func = _G["C_AccountStore"] and _G["C_AccountStore"]["GetStoreFrontState"],
	funcPath = "C_AccountStore.GetStoreFrontState",
	params = { { name = "storeFrontID", type = "number", default = nil } },
	returns = { { name = "state", type = "AccountStoreState", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.RefundItem"] = {
	key = "C_AccountStore.RefundItem",
	name = "RefundItem",
	category = "combat_midnight",
	subcategory = "c_accountstore",
	func = _G["C_AccountStore"] and _G["C_AccountStore"]["RefundItem"],
	funcPath = "C_AccountStore.RefundItem",
	params = { { name = "itemID", type = "number", default = nil } },
	returns = { { name = "refundStarted", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.RequestStoreFrontInfoUpdate"] = {
	key = "C_AccountStore.RequestStoreFrontInfoUpdate",
	name = "RequestStoreFrontInfoUpdate",
	category = "combat_midnight",
	subcategory = "c_accountstore",
	func = _G["C_AccountStore"] and _G["C_AccountStore"]["RequestStoreFrontInfoUpdate"],
	funcPath = "C_AccountStore.RequestStoreFrontInfoUpdate",
	params = { { name = "storeFrontID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

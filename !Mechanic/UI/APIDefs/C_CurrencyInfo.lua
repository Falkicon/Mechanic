-- Generated APIDefinitions for namespace: C_CurrencyInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CurrencyInfo.CanTransferCurrency"] = {
	key = "C_CurrencyInfo.CanTransferCurrency",
	name = "CanTransferCurrency",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["CanTransferCurrency"],
	funcPath = "C_CurrencyInfo.CanTransferCurrency",
	params = { { name = "currencyID", type = "number", default = nil } },
	returns = {
		{ name = "canTransferCurrency", type = "bool", canBeSecret = false },
		{ name = "failureReason", type = "AccountCurrencyTransferResult", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.DoesWarModeBonusApply"] = {
	key = "C_CurrencyInfo.DoesWarModeBonusApply",
	name = "DoesWarModeBonusApply",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["DoesWarModeBonusApply"],
	funcPath = "C_CurrencyInfo.DoesWarModeBonusApply",
	params = { { name = "currencyID", type = "number", default = nil } },
	returns = {
		{ name = "warModeApplies", type = "bool", canBeSecret = false },
		{ name = "limitOncePerTooltip", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.ExpandCurrencyList"] = {
	key = "C_CurrencyInfo.ExpandCurrencyList",
	name = "ExpandCurrencyList",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["ExpandCurrencyList"],
	funcPath = "C_CurrencyInfo.ExpandCurrencyList",
	params = {
		{
			name = "index",
			type = "luaIndex",
			default = nil,
			examples = {
				{ value = "index", label = "WeakAuras" },
				{ value = "index", label = "Baganator" },
				{ value = "toCollapse[index]", label = "Syndicator" },
			},
		},
		{ name = "expand", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.FetchCurrencyDataFromAccountCharacters"] = {
	key = "C_CurrencyInfo.FetchCurrencyDataFromAccountCharacters",
	name = "FetchCurrencyDataFromAccountCharacters",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["FetchCurrencyDataFromAccountCharacters"],
	funcPath = "C_CurrencyInfo.FetchCurrencyDataFromAccountCharacters",
	params = { { name = "currencyID", type = "number", default = nil } },
	returns = { { name = "accountCurrencyData", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetBackpackCurrencyInfo"] = {
	key = "C_CurrencyInfo.GetBackpackCurrencyInfo",
	name = "GetBackpackCurrencyInfo",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetBackpackCurrencyInfo"],
	funcPath = "C_CurrencyInfo.GetBackpackCurrencyInfo",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "info", type = "BackpackCurrencyInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetBasicCurrencyInfo"] = {
	key = "C_CurrencyInfo.GetBasicCurrencyInfo",
	name = "GetBasicCurrencyInfo",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetBasicCurrencyInfo"],
	funcPath = "C_CurrencyInfo.GetBasicCurrencyInfo",
	params = {
		{ name = "currencyType", type = "number", default = nil },
		{ name = "quantity", type = "number", default = nil },
	},
	returns = { { name = "info", type = "CurrencyDisplayInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCoinIcon"] = {
	key = "C_CurrencyInfo.GetCoinIcon",
	name = "GetCoinIcon",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetCoinIcon"],
	funcPath = "C_CurrencyInfo.GetCoinIcon",
	params = { { name = "amount", type = "WOWMONEY", default = nil } },
	returns = { { name = "result", type = "fileID", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCoinText"] = {
	key = "C_CurrencyInfo.GetCoinText",
	name = "GetCoinText",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetCoinText"],
	funcPath = "C_CurrencyInfo.GetCoinText",
	params = {
		{ name = "amount", type = "WOWMONEY", default = nil },
		{ name = "separator", type = "cstring", default = ", " },
	},
	returns = { { name = "result", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCoinTextureString"] = {
	key = "C_CurrencyInfo.GetCoinTextureString",
	name = "GetCoinTextureString",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetCoinTextureString"],
	funcPath = "C_CurrencyInfo.GetCoinTextureString",
	params = {
		{ name = "amount", type = "WOWMONEY", default = nil },
		{ name = "fontHeight", type = "number", default = 14 },
	},
	returns = { { name = "result", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCostToTransferCurrency"] = {
	key = "C_CurrencyInfo.GetCostToTransferCurrency",
	name = "GetCostToTransferCurrency",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetCostToTransferCurrency"],
	funcPath = "C_CurrencyInfo.GetCostToTransferCurrency",
	params = {
		{ name = "currencyID", type = "number", default = nil },
		{ name = "quantity", type = "number", default = nil },
	},
	returns = { { name = "totalQuantityConsumed", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyContainerInfo"] = {
	key = "C_CurrencyInfo.GetCurrencyContainerInfo",
	name = "GetCurrencyContainerInfo",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetCurrencyContainerInfo"],
	funcPath = "C_CurrencyInfo.GetCurrencyContainerInfo",
	params = {
		{ name = "currencyType", type = "number", default = nil },
		{ name = "quantity", type = "number", default = nil },
	},
	returns = { { name = "info", type = "CurrencyDisplayInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyDescription"] = {
	key = "C_CurrencyInfo.GetCurrencyDescription",
	name = "GetCurrencyDescription",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetCurrencyDescription"],
	funcPath = "C_CurrencyInfo.GetCurrencyDescription",
	params = { { name = "type", type = "number", default = nil } },
	returns = { { name = "description", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyIDFromLink"] = {
	key = "C_CurrencyInfo.GetCurrencyIDFromLink",
	name = "GetCurrencyIDFromLink",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetCurrencyIDFromLink"],
	funcPath = "C_CurrencyInfo.GetCurrencyIDFromLink",
	params = { { name = "currencyLink", type = "cstring", default = nil } },
	returns = { { name = "currencyID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyInfo"] = {
	key = "C_CurrencyInfo.GetCurrencyInfo",
	name = "GetCurrencyInfo",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetCurrencyInfo"],
	funcPath = "C_CurrencyInfo.GetCurrencyInfo",
	params = {
		{
			name = "type",
			type = "number",
			default = nil,
			examples = {
				{ value = 1, label = "WeakAuras" },
				{ value = "id", label = "Weekly" },
				{ value = 3292, label = "Narcissus" },
			},
		},
	},
	returns = { { name = "info", type = "CurrencyInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyInfoFromLink"] = {
	key = "C_CurrencyInfo.GetCurrencyInfoFromLink",
	name = "GetCurrencyInfoFromLink",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetCurrencyInfoFromLink"],
	funcPath = "C_CurrencyInfo.GetCurrencyInfoFromLink",
	params = { { name = "link", type = "string", default = nil } },
	returns = { { name = "info", type = "CurrencyInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyLink"] = {
	key = "C_CurrencyInfo.GetCurrencyLink",
	name = "GetCurrencyLink",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetCurrencyLink"],
	funcPath = "C_CurrencyInfo.GetCurrencyLink",
	params = {
		{
			name = "type",
			type = "number",
			default = nil,
			examples = {
				{ value = "t.currencyID", label = "AllTheThings" },
				{ value = "details.currencyID", label = "Baganator" },
			},
		},
		{ name = "amount", type = "number", default = nil },
	},
	returns = { { name = "link", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyListInfo"] = {
	key = "C_CurrencyInfo.GetCurrencyListInfo",
	name = "GetCurrencyListInfo",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetCurrencyListInfo"],
	funcPath = "C_CurrencyInfo.GetCurrencyListInfo",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "info", type = "CurrencyInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyListLink"] = {
	key = "C_CurrencyInfo.GetCurrencyListLink",
	name = "GetCurrencyListLink",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetCurrencyListLink"],
	funcPath = "C_CurrencyInfo.GetCurrencyListLink",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "link", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetFactionGrantedByCurrency"] = {
	key = "C_CurrencyInfo.GetFactionGrantedByCurrency",
	name = "GetFactionGrantedByCurrency",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetFactionGrantedByCurrency"],
	funcPath = "C_CurrencyInfo.GetFactionGrantedByCurrency",
	params = { { name = "currencyID", type = "number", default = nil } },
	returns = { { name = "factionID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetMaxTransferableAmountFromQuantity"] = {
	key = "C_CurrencyInfo.GetMaxTransferableAmountFromQuantity",
	name = "GetMaxTransferableAmountFromQuantity",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetMaxTransferableAmountFromQuantity"],
	funcPath = "C_CurrencyInfo.GetMaxTransferableAmountFromQuantity",
	params = {
		{ name = "currencyID", type = "number", default = nil },
		{ name = "requestedQuantity", type = "number", default = nil },
	},
	returns = { { name = "maxTransferableAmount", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetPlayerCurrencyCategoryInfo"] = {
	key = "C_CurrencyInfo.GetPlayerCurrencyCategoryInfo",
	name = "GetPlayerCurrencyCategoryInfo",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["GetPlayerCurrencyCategoryInfo"],
	funcPath = "C_CurrencyInfo.GetPlayerCurrencyCategoryInfo",
	params = {
		{ name = "categoryID", type = "number", default = nil },
		{ name = "includeAccountWide", type = "bool", default = true },
	},
	returns = { { name = "info", type = "PlayerCurrencyCategoryInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.IsAccountTransferableCurrency"] = {
	key = "C_CurrencyInfo.IsAccountTransferableCurrency",
	name = "IsAccountTransferableCurrency",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["IsAccountTransferableCurrency"],
	funcPath = "C_CurrencyInfo.IsAccountTransferableCurrency",
	params = {
		{ name = "currencyID", type = "number", default = nil, examples = { { value = "id", label = "BagBrother" } } },
	},
	returns = { { name = "isAccountTransferableCurrency", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.IsAccountWideCurrency"] = {
	key = "C_CurrencyInfo.IsAccountWideCurrency",
	name = "IsAccountWideCurrency",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["IsAccountWideCurrency"],
	funcPath = "C_CurrencyInfo.IsAccountWideCurrency",
	params = {
		{ name = "currencyID", type = "number", default = nil, examples = { { value = "id", label = "BagBrother" } } },
	},
	returns = { { name = "isAccountWideCurrency", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.IsCurrencyContainer"] = {
	key = "C_CurrencyInfo.IsCurrencyContainer",
	name = "IsCurrencyContainer",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["IsCurrencyContainer"],
	funcPath = "C_CurrencyInfo.IsCurrencyContainer",
	params = {
		{ name = "currencyID", type = "number", default = nil },
		{ name = "quantity", type = "number", default = nil },
	},
	returns = { { name = "isCurrencyContainer", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.PickupCurrency"] = {
	key = "C_CurrencyInfo.PickupCurrency",
	name = "PickupCurrency",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["PickupCurrency"],
	funcPath = "C_CurrencyInfo.PickupCurrency",
	params = { { name = "type", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.PlayerHasMaxQuantity"] = {
	key = "C_CurrencyInfo.PlayerHasMaxQuantity",
	name = "PlayerHasMaxQuantity",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["PlayerHasMaxQuantity"],
	funcPath = "C_CurrencyInfo.PlayerHasMaxQuantity",
	params = { { name = "currencyID", type = "number", default = nil } },
	returns = { { name = "hasMaxQuantity", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.PlayerHasMaxWeeklyQuantity"] = {
	key = "C_CurrencyInfo.PlayerHasMaxWeeklyQuantity",
	name = "PlayerHasMaxWeeklyQuantity",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["PlayerHasMaxWeeklyQuantity"],
	funcPath = "C_CurrencyInfo.PlayerHasMaxWeeklyQuantity",
	params = { { name = "currencyID", type = "number", default = nil } },
	returns = { { name = "hasMaxWeeklyQuantity", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.RequestCurrencyFromAccountCharacter"] = {
	key = "C_CurrencyInfo.RequestCurrencyFromAccountCharacter",
	name = "RequestCurrencyFromAccountCharacter",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["RequestCurrencyFromAccountCharacter"],
	funcPath = "C_CurrencyInfo.RequestCurrencyFromAccountCharacter",
	params = {
		{ name = "sourceCharacterGUID", type = "WOWGUID", default = nil },
		{ name = "currencyID", type = "number", default = nil },
		{ name = "quantity", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.SetCurrencyBackpack"] = {
	key = "C_CurrencyInfo.SetCurrencyBackpack",
	name = "SetCurrencyBackpack",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["SetCurrencyBackpack"],
	funcPath = "C_CurrencyInfo.SetCurrencyBackpack",
	params = {
		{ name = "index", type = "luaIndex", default = nil, examples = { { value = "index", label = "Baganator" } } },
		{ name = "backpack", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.SetCurrencyBackpackByID"] = {
	key = "C_CurrencyInfo.SetCurrencyBackpackByID",
	name = "SetCurrencyBackpackByID",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["SetCurrencyBackpackByID"],
	funcPath = "C_CurrencyInfo.SetCurrencyBackpackByID",
	params = {
		{ name = "currencyType", type = "number", default = nil },
		{ name = "backpack", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.SetCurrencyFilter"] = {
	key = "C_CurrencyInfo.SetCurrencyFilter",
	name = "SetCurrencyFilter",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["SetCurrencyFilter"],
	funcPath = "C_CurrencyInfo.SetCurrencyFilter",
	params = { { name = "filterType", type = "CurrencyFilterType", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.SetCurrencyUnused"] = {
	key = "C_CurrencyInfo.SetCurrencyUnused",
	name = "SetCurrencyUnused",
	category = "combat_midnight",
	subcategory = "c_currencyinfo",
	func = _G["C_CurrencyInfo"] and _G["C_CurrencyInfo"]["SetCurrencyUnused"],
	funcPath = "C_CurrencyInfo.SetCurrencyUnused",
	params = { { name = "index", type = "luaIndex", default = nil }, { name = "unused", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

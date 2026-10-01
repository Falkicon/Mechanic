-- Generated APIDefinitions for namespace: C_CurrencyInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CurrencyInfo.CanTransferCurrency"] = {
    key = "C_CurrencyInfo.CanTransferCurrency",
    name = "CanTransferCurrency",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.CanTransferCurrency",
    params = { { name = "currencyID", type = "number", default = nil } },
    returns = { { name = "canTransferCurrency", type = "bool", canBeSecret = false }, { name = "failureReason", type = "AccountCurrencyTransferResult", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.DoesCurrentFilterRequireAccountCurrencyData"] = {
    key = "C_CurrencyInfo.DoesCurrentFilterRequireAccountCurrencyData",
    name = "DoesCurrentFilterRequireAccountCurrencyData",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.DoesCurrentFilterRequireAccountCurrencyData",
    params = {  },
    returns = { { name = "doesCurrentFilterRequireAccountCurrencyData", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CurrencyInfo.DoesWarModeBonusApply"] = {
    key = "C_CurrencyInfo.DoesWarModeBonusApply",
    name = "DoesWarModeBonusApply",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.DoesWarModeBonusApply",
    params = { { name = "currencyID", type = "number", default = nil } },
    returns = { { name = "warModeApplies", type = "bool", canBeSecret = false }, { name = "limitOncePerTooltip", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.ExpandCurrencyList"] = {
    key = "C_CurrencyInfo.ExpandCurrencyList",
    name = "ExpandCurrencyList",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.ExpandCurrencyList",
    params = { { name = "index", type = "luaIndex", default = nil }, { name = "expand", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.FetchCurrencyDataFromAccountCharacters"] = {
    key = "C_CurrencyInfo.FetchCurrencyDataFromAccountCharacters",
    name = "FetchCurrencyDataFromAccountCharacters",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.FetchCurrencyDataFromAccountCharacters",
    params = { { name = "currencyID", type = "number", default = nil } },
    returns = { { name = "accountCurrencyData", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.FetchCurrencyTransferTransactions"] = {
    key = "C_CurrencyInfo.FetchCurrencyTransferTransactions",
    name = "FetchCurrencyTransferTransactions",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.FetchCurrencyTransferTransactions",
    params = {  },
    returns = { { name = "currencyTransferTransactions", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CurrencyInfo.GetAzeriteCurrencyID"] = {
    key = "C_CurrencyInfo.GetAzeriteCurrencyID",
    name = "GetAzeriteCurrencyID",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetAzeriteCurrencyID",
    params = {  },
    returns = { { name = "azeriteCurrencyID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CurrencyInfo.GetBackpackCurrencyInfo"] = {
    key = "C_CurrencyInfo.GetBackpackCurrencyInfo",
    name = "GetBackpackCurrencyInfo",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetBackpackCurrencyInfo",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "info", type = "BackpackCurrencyInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetBasicCurrencyInfo"] = {
    key = "C_CurrencyInfo.GetBasicCurrencyInfo",
    name = "GetBasicCurrencyInfo",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetBasicCurrencyInfo",
    params = { { name = "currencyType", type = "number", default = nil }, { name = "quantity", type = "number", default = nil } },
    returns = { { name = "info", type = "CurrencyDisplayInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCoinIcon"] = {
    key = "C_CurrencyInfo.GetCoinIcon",
    name = "GetCoinIcon",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetCoinIcon",
    params = { { name = "amount", type = "WOWMONEY", default = nil } },
    returns = { { name = "result", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCoinText"] = {
    key = "C_CurrencyInfo.GetCoinText",
    name = "GetCoinText",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetCoinText",
    params = { { name = "amount", type = "WOWMONEY", default = nil }, { name = "separator", type = "cstring", default = ", " } },
    returns = { { name = "result", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCoinTextureString"] = {
    key = "C_CurrencyInfo.GetCoinTextureString",
    name = "GetCoinTextureString",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetCoinTextureString",
    params = { { name = "amount", type = "WOWMONEY", default = nil }, { name = "fontHeight", type = "number", default = 14 } },
    returns = { { name = "result", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCostToTransferCurrency"] = {
    key = "C_CurrencyInfo.GetCostToTransferCurrency",
    name = "GetCostToTransferCurrency",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetCostToTransferCurrency",
    params = { { name = "currencyID", type = "number", default = nil }, { name = "quantity", type = "number", default = nil } },
    returns = { { name = "totalQuantityConsumed", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyContainerInfo"] = {
    key = "C_CurrencyInfo.GetCurrencyContainerInfo",
    name = "GetCurrencyContainerInfo",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetCurrencyContainerInfo",
    params = { { name = "currencyType", type = "number", default = nil }, { name = "quantity", type = "number", default = nil } },
    returns = { { name = "info", type = "CurrencyDisplayInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyDescription"] = {
    key = "C_CurrencyInfo.GetCurrencyDescription",
    name = "GetCurrencyDescription",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetCurrencyDescription",
    params = { { name = "type", type = "number", default = nil } },
    returns = { { name = "description", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyFilter"] = {
    key = "C_CurrencyInfo.GetCurrencyFilter",
    name = "GetCurrencyFilter",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetCurrencyFilter",
    params = {  },
    returns = { { name = "filterType", type = "CurrencyFilterType", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CurrencyInfo.GetCurrencyIDFromLink"] = {
    key = "C_CurrencyInfo.GetCurrencyIDFromLink",
    name = "GetCurrencyIDFromLink",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetCurrencyIDFromLink",
    params = { { name = "currencyLink", type = "cstring", default = nil } },
    returns = { { name = "currencyID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyInfo"] = {
    key = "C_CurrencyInfo.GetCurrencyInfo",
    name = "GetCurrencyInfo",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetCurrencyInfo",
    params = { { name = "type", type = "number", default = nil } },
    returns = { { name = "info", type = "CurrencyInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyInfoFromLink"] = {
    key = "C_CurrencyInfo.GetCurrencyInfoFromLink",
    name = "GetCurrencyInfoFromLink",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetCurrencyInfoFromLink",
    params = { { name = "link", type = "string", default = nil } },
    returns = { { name = "info", type = "CurrencyInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyLink"] = {
    key = "C_CurrencyInfo.GetCurrencyLink",
    name = "GetCurrencyLink",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetCurrencyLink",
    params = { { name = "type", type = "number", default = nil }, { name = "amount", type = "number", default = nil } },
    returns = { { name = "link", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyListInfo"] = {
    key = "C_CurrencyInfo.GetCurrencyListInfo",
    name = "GetCurrencyListInfo",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetCurrencyListInfo",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "info", type = "CurrencyInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyListLink"] = {
    key = "C_CurrencyInfo.GetCurrencyListLink",
    name = "GetCurrencyListLink",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetCurrencyListLink",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "link", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetCurrencyListSize"] = {
    key = "C_CurrencyInfo.GetCurrencyListSize",
    name = "GetCurrencyListSize",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetCurrencyListSize",
    params = {  },
    returns = { { name = "currencyListSize", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CurrencyInfo.GetDragonIslesSuppliesCurrencyID"] = {
    key = "C_CurrencyInfo.GetDragonIslesSuppliesCurrencyID",
    name = "GetDragonIslesSuppliesCurrencyID",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetDragonIslesSuppliesCurrencyID",
    params = {  },
    returns = { { name = "dragonIslesSuppliesCurrencyID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CurrencyInfo.GetFactionGrantedByCurrency"] = {
    key = "C_CurrencyInfo.GetFactionGrantedByCurrency",
    name = "GetFactionGrantedByCurrency",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetFactionGrantedByCurrency",
    params = { { name = "currencyID", type = "number", default = nil } },
    returns = { { name = "factionID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetMaxTransferableAmountFromQuantity"] = {
    key = "C_CurrencyInfo.GetMaxTransferableAmountFromQuantity",
    name = "GetMaxTransferableAmountFromQuantity",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetMaxTransferableAmountFromQuantity",
    params = { { name = "currencyID", type = "number", default = nil }, { name = "requestedQuantity", type = "number", default = nil } },
    returns = { { name = "maxTransferableAmount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetPlayerCurrencyCategoryInfo"] = {
    key = "C_CurrencyInfo.GetPlayerCurrencyCategoryInfo",
    name = "GetPlayerCurrencyCategoryInfo",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetPlayerCurrencyCategoryInfo",
    params = { { name = "categoryID", type = "number", default = nil }, { name = "includeAccountWide", type = "bool", default = true } },
    returns = { { name = "info", type = "PlayerCurrencyCategoryInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.GetWarResourcesCurrencyID"] = {
    key = "C_CurrencyInfo.GetWarResourcesCurrencyID",
    name = "GetWarResourcesCurrencyID",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.GetWarResourcesCurrencyID",
    params = {  },
    returns = { { name = "warResourceCurrencyID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CurrencyInfo.IsAccountCharacterCurrencyDataReady"] = {
    key = "C_CurrencyInfo.IsAccountCharacterCurrencyDataReady",
    name = "IsAccountCharacterCurrencyDataReady",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.IsAccountCharacterCurrencyDataReady",
    params = {  },
    returns = { { name = "isReady", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CurrencyInfo.IsAccountTransferableCurrency"] = {
    key = "C_CurrencyInfo.IsAccountTransferableCurrency",
    name = "IsAccountTransferableCurrency",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.IsAccountTransferableCurrency",
    params = { { name = "currencyID", type = "number", default = nil } },
    returns = { { name = "isAccountTransferableCurrency", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.IsAccountWideCurrency"] = {
    key = "C_CurrencyInfo.IsAccountWideCurrency",
    name = "IsAccountWideCurrency",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.IsAccountWideCurrency",
    params = { { name = "currencyID", type = "number", default = nil } },
    returns = { { name = "isAccountWideCurrency", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.IsCurrencyContainer"] = {
    key = "C_CurrencyInfo.IsCurrencyContainer",
    name = "IsCurrencyContainer",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.IsCurrencyContainer",
    params = { { name = "currencyID", type = "number", default = nil }, { name = "quantity", type = "number", default = nil } },
    returns = { { name = "isCurrencyContainer", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.IsCurrencyTransferInProgress"] = {
    key = "C_CurrencyInfo.IsCurrencyTransferInProgress",
    name = "IsCurrencyTransferInProgress",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.IsCurrencyTransferInProgress",
    params = {  },
    returns = { { name = "currencyTransferInProgress", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CurrencyInfo.IsCurrencyTransferTransactionDataReady"] = {
    key = "C_CurrencyInfo.IsCurrencyTransferTransactionDataReady",
    name = "IsCurrencyTransferTransactionDataReady",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.IsCurrencyTransferTransactionDataReady",
    params = {  },
    returns = { { name = "isReady", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CurrencyInfo.PickupCurrency"] = {
    key = "C_CurrencyInfo.PickupCurrency",
    name = "PickupCurrency",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.PickupCurrency",
    params = { { name = "type", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.PlayerHasMaxQuantity"] = {
    key = "C_CurrencyInfo.PlayerHasMaxQuantity",
    name = "PlayerHasMaxQuantity",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.PlayerHasMaxQuantity",
    params = { { name = "currencyID", type = "number", default = nil } },
    returns = { { name = "hasMaxQuantity", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.PlayerHasMaxWeeklyQuantity"] = {
    key = "C_CurrencyInfo.PlayerHasMaxWeeklyQuantity",
    name = "PlayerHasMaxWeeklyQuantity",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.PlayerHasMaxWeeklyQuantity",
    params = { { name = "currencyID", type = "number", default = nil } },
    returns = { { name = "hasMaxWeeklyQuantity", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.RequestCurrencyDataForAccountCharacters"] = {
    key = "C_CurrencyInfo.RequestCurrencyDataForAccountCharacters",
    name = "RequestCurrencyDataForAccountCharacters",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.RequestCurrencyDataForAccountCharacters",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_CurrencyInfo.RequestCurrencyFromAccountCharacter"] = {
    key = "C_CurrencyInfo.RequestCurrencyFromAccountCharacter",
    name = "RequestCurrencyFromAccountCharacter",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.RequestCurrencyFromAccountCharacter",
    params = { { name = "sourceCharacterGUID", type = "WOWGUID", default = nil }, { name = "currencyID", type = "number", default = nil }, { name = "quantity", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.SetCurrencyBackpack"] = {
    key = "C_CurrencyInfo.SetCurrencyBackpack",
    name = "SetCurrencyBackpack",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.SetCurrencyBackpack",
    params = { { name = "index", type = "luaIndex", default = nil }, { name = "backpack", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.SetCurrencyBackpackByID"] = {
    key = "C_CurrencyInfo.SetCurrencyBackpackByID",
    name = "SetCurrencyBackpackByID",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.SetCurrencyBackpackByID",
    params = { { name = "currencyType", type = "number", default = nil }, { name = "backpack", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.SetCurrencyFilter"] = {
    key = "C_CurrencyInfo.SetCurrencyFilter",
    name = "SetCurrencyFilter",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.SetCurrencyFilter",
    params = { { name = "filterType", type = "CurrencyFilterType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CurrencyInfo.SetCurrencyUnused"] = {
    key = "C_CurrencyInfo.SetCurrencyUnused",
    name = "SetCurrencyUnused",
    category = "item",
    subcategory = "c_currencyinfo",
    funcPath = "C_CurrencyInfo.SetCurrencyUnused",
    params = { { name = "index", type = "luaIndex", default = nil }, { name = "unused", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

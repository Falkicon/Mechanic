-- Generated APIDefinitions for namespace: C_AccountStore
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AccountStore.BeginPurchase"] = {
    key = "C_AccountStore.BeginPurchase",
    name = "BeginPurchase",
    category = "general",
    subcategory = "c_accountstore",
    funcPath = "C_AccountStore.BeginPurchase",
    params = { { name = "itemID", type = "number", default = nil } },
    returns = { { name = "purchaseStarted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetCategories"] = {
    key = "C_AccountStore.GetCategories",
    name = "GetCategories",
    category = "general",
    subcategory = "c_accountstore",
    funcPath = "C_AccountStore.GetCategories",
    params = { { name = "storeFrontID", type = "number", default = nil } },
    returns = { { name = "categories", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetCategoryInfo"] = {
    key = "C_AccountStore.GetCategoryInfo",
    name = "GetCategoryInfo",
    category = "general",
    subcategory = "c_accountstore",
    funcPath = "C_AccountStore.GetCategoryInfo",
    params = { { name = "categoryID", type = "number", default = nil } },
    returns = { { name = "info", type = "AccountStoreCategoryInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetCategoryItems"] = {
    key = "C_AccountStore.GetCategoryItems",
    name = "GetCategoryItems",
    category = "general",
    subcategory = "c_accountstore",
    funcPath = "C_AccountStore.GetCategoryItems",
    params = { { name = "categoryID", type = "number", default = nil } },
    returns = { { name = "itemIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetCurrencyAvailable"] = {
    key = "C_AccountStore.GetCurrencyAvailable",
    name = "GetCurrencyAvailable",
    category = "general",
    subcategory = "c_accountstore",
    funcPath = "C_AccountStore.GetCurrencyAvailable",
    params = { { name = "currencyID", type = "number", default = nil } },
    returns = { { name = "amount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetCurrencyIDForStore"] = {
    key = "C_AccountStore.GetCurrencyIDForStore",
    name = "GetCurrencyIDForStore",
    category = "general",
    subcategory = "c_accountstore",
    funcPath = "C_AccountStore.GetCurrencyIDForStore",
    params = { { name = "storeFrontID", type = "number", default = nil } },
    returns = { { name = "currencyID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetCurrencyInfo"] = {
    key = "C_AccountStore.GetCurrencyInfo",
    name = "GetCurrencyInfo",
    category = "general",
    subcategory = "c_accountstore",
    funcPath = "C_AccountStore.GetCurrencyInfo",
    params = { { name = "currencyID", type = "number", default = nil } },
    returns = { { name = "info", type = "AccountStoreCurrencyInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetItemInfo"] = {
    key = "C_AccountStore.GetItemInfo",
    name = "GetItemInfo",
    category = "general",
    subcategory = "c_accountstore",
    funcPath = "C_AccountStore.GetItemInfo",
    params = { { name = "itemID", type = "number", default = nil } },
    returns = { { name = "info", type = "AccountStoreItemInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.GetStoreFrontState"] = {
    key = "C_AccountStore.GetStoreFrontState",
    name = "GetStoreFrontState",
    category = "general",
    subcategory = "c_accountstore",
    funcPath = "C_AccountStore.GetStoreFrontState",
    params = { { name = "storeFrontID", type = "number", default = nil } },
    returns = { { name = "state", type = "AccountStoreState", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.RefundItem"] = {
    key = "C_AccountStore.RefundItem",
    name = "RefundItem",
    category = "general",
    subcategory = "c_accountstore",
    funcPath = "C_AccountStore.RefundItem",
    params = { { name = "itemID", type = "number", default = nil } },
    returns = { { name = "refundStarted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AccountStore.RequestStoreFrontInfoUpdate"] = {
    key = "C_AccountStore.RequestStoreFrontInfoUpdate",
    name = "RequestStoreFrontInfoUpdate",
    category = "general",
    subcategory = "c_accountstore",
    funcPath = "C_AccountStore.RequestStoreFrontInfoUpdate",
    params = { { name = "storeFrontID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_CatalogShop
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CatalogShop.BulkPurchaseProducts"] = {
    key = "C_CatalogShop.BulkPurchaseProducts",
    name = "BulkPurchaseProducts",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["BulkPurchaseProducts"],
    funcPath = "C_CatalogShop.BulkPurchaseProducts",
    params = { { name = "productIDs", type = "table", default = nil } },
    returns = { { name = "canPurchaseProducts", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.CloseCatalogShopInteraction"] = {
    key = "C_CatalogShop.CloseCatalogShopInteraction",
    name = "CloseCatalogShopInteraction",
    category = "general",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["CloseCatalogShopInteraction"],
    funcPath = "C_CatalogShop.CloseCatalogShopInteraction",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.ConfirmHousingPurchase"] = {
    key = "C_CatalogShop.ConfirmHousingPurchase",
    name = "ConfirmHousingPurchase",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["ConfirmHousingPurchase"],
    funcPath = "C_CatalogShop.ConfirmHousingPurchase",
    params = { { name = "productIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetAvailableCategoryIDs"] = {
    key = "C_CatalogShop.GetAvailableCategoryIDs",
    name = "GetAvailableCategoryIDs",
    category = "general",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetAvailableCategoryIDs"],
    funcPath = "C_CatalogShop.GetAvailableCategoryIDs",
    params = {  },
    returns = { { name = "categoryIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.GetAvailableTransmogRaceInfos"] = {
    key = "C_CatalogShop.GetAvailableTransmogRaceInfos",
    name = "GetAvailableTransmogRaceInfos",
    category = "general",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetAvailableTransmogRaceInfos"],
    funcPath = "C_CatalogShop.GetAvailableTransmogRaceInfos",
    params = {  },
    returns = { { name = "raceIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.GetCatalogShopProductDisplayInfo"] = {
    key = "C_CatalogShop.GetCatalogShopProductDisplayInfo",
    name = "GetCatalogShopProductDisplayInfo",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetCatalogShopProductDisplayInfo"],
    funcPath = "C_CatalogShop.GetCatalogShopProductDisplayInfo",
    params = { { name = "catalogShopProductID", type = "number", default = nil } },
    returns = { { name = "item", type = "CatalogShopProductDisplayInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetCategoryInfo"] = {
    key = "C_CatalogShop.GetCategoryInfo",
    name = "GetCategoryInfo",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetCategoryInfo"],
    funcPath = "C_CatalogShop.GetCategoryInfo",
    params = { { name = "categoryID", type = "number", default = nil } },
    returns = { { name = "categoryInfo", type = "CatalogShopCategoryInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetCategorySectionInfo"] = {
    key = "C_CatalogShop.GetCategorySectionInfo",
    name = "GetCategorySectionInfo",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetCategorySectionInfo"],
    funcPath = "C_CatalogShop.GetCategorySectionInfo",
    params = { { name = "categoryID", type = "number", default = nil }, { name = "sectionID", type = "number", default = nil } },
    returns = { { name = "sectionInfo", type = "CatalogShopSectionInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetFailureInfo"] = {
    key = "C_CatalogShop.GetFailureInfo",
    name = "GetFailureInfo",
    category = "general",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetFailureInfo"],
    funcPath = "C_CatalogShop.GetFailureInfo",
    params = {  },
    returns = { { name = "errorResultEnum", type = "StoreError", canBeSecret = false }, { name = "errorResultRaw", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.GetFirstCategoryByProductID"] = {
    key = "C_CatalogShop.GetFirstCategoryByProductID",
    name = "GetFirstCategoryByProductID",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetFirstCategoryByProductID"],
    funcPath = "C_CatalogShop.GetFirstCategoryByProductID",
    params = { { name = "productID", type = "number", default = nil } },
    returns = { { name = "categoryInfo", type = "CatalogShopCategoryInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetNewProducts"] = {
    key = "C_CatalogShop.GetNewProducts",
    name = "GetNewProducts",
    category = "general",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetNewProducts"],
    funcPath = "C_CatalogShop.GetNewProducts",
    params = {  },
    returns = { { name = "newProducts", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.GetProductAvailabilityTimeRemainingSecs"] = {
    key = "C_CatalogShop.GetProductAvailabilityTimeRemainingSecs",
    name = "GetProductAvailabilityTimeRemainingSecs",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetProductAvailabilityTimeRemainingSecs"],
    funcPath = "C_CatalogShop.GetProductAvailabilityTimeRemainingSecs",
    params = { { name = "catalogShopProductID", type = "number", default = nil } },
    returns = { { name = "timeRemainingSecs", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetProductIDsForBundle"] = {
    key = "C_CatalogShop.GetProductIDsForBundle",
    name = "GetProductIDsForBundle",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetProductIDsForBundle"],
    funcPath = "C_CatalogShop.GetProductIDsForBundle",
    params = { { name = "bundleProductID", type = "number", default = nil } },
    returns = { { name = "childIDs", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetProductIDsForCategory"] = {
    key = "C_CatalogShop.GetProductIDsForCategory",
    name = "GetProductIDsForCategory",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetProductIDsForCategory"],
    funcPath = "C_CatalogShop.GetProductIDsForCategory",
    params = { { name = "categoryID", type = "number", default = nil } },
    returns = { { name = "productIDs", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetProductIDsForCategorySection"] = {
    key = "C_CatalogShop.GetProductIDsForCategorySection",
    name = "GetProductIDsForCategorySection",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetProductIDsForCategorySection"],
    funcPath = "C_CatalogShop.GetProductIDsForCategorySection",
    params = { { name = "categoryID", type = "number", default = nil }, { name = "sectionID", type = "number", default = nil } },
    returns = { { name = "productIDs", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetProductInfo"] = {
    key = "C_CatalogShop.GetProductInfo",
    name = "GetProductInfo",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetProductInfo"],
    funcPath = "C_CatalogShop.GetProductInfo",
    params = { { name = "productID", type = "number", default = nil } },
    returns = { { name = "productInfo", type = "CatalogShopProductInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetProductSortOrder"] = {
    key = "C_CatalogShop.GetProductSortOrder",
    name = "GetProductSortOrder",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetProductSortOrder"],
    funcPath = "C_CatalogShop.GetProductSortOrder",
    params = { { name = "categoryID", type = "number", default = nil }, { name = "sectionID", type = "number", default = nil }, { name = "productID", type = "number", default = nil } },
    returns = { { name = "sortOrder", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetRefundableDecors"] = {
    key = "C_CatalogShop.GetRefundableDecors",
    name = "GetRefundableDecors",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetRefundableDecors"],
    funcPath = "C_CatalogShop.GetRefundableDecors",
    params = { { name = "productIDOpt", type = "number", default = nil } },
    returns = { { name = "refundableDecorInfos", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetSectionIDsForCategory"] = {
    key = "C_CatalogShop.GetSectionIDsForCategory",
    name = "GetSectionIDsForCategory",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetSectionIDsForCategory"],
    funcPath = "C_CatalogShop.GetSectionIDsForCategory",
    params = { { name = "categoryID", type = "number", default = nil } },
    returns = { { name = "sectionIDs", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetSpellVisualInfoForMount"] = {
    key = "C_CatalogShop.GetSpellVisualInfoForMount",
    name = "GetSpellVisualInfoForMount",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetSpellVisualInfoForMount"],
    funcPath = "C_CatalogShop.GetSpellVisualInfoForMount",
    params = { { name = "spellVisualID", type = "number", default = nil } },
    returns = { { name = "spellVisualInfo", type = "CatalogShopSpellVisualInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetVirtualCurrencyBalance"] = {
    key = "C_CatalogShop.GetVirtualCurrencyBalance",
    name = "GetVirtualCurrencyBalance",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["GetVirtualCurrencyBalance"],
    funcPath = "C_CatalogShop.GetVirtualCurrencyBalance",
    params = { { name = "currencyCode", type = "string", default = nil } },
    returns = { { name = "balance", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.HasNewProducts"] = {
    key = "C_CatalogShop.HasNewProducts",
    name = "HasNewProducts",
    category = "general",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["HasNewProducts"],
    funcPath = "C_CatalogShop.HasNewProducts",
    params = {  },
    returns = { { name = "hasNewProducts", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.IsShop2Enabled"] = {
    key = "C_CatalogShop.IsShop2Enabled",
    name = "IsShop2Enabled",
    category = "general",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["IsShop2Enabled"],
    funcPath = "C_CatalogShop.IsShop2Enabled",
    params = {  },
    returns = { { name = "value", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.OnLegalDisclaimerClicked"] = {
    key = "C_CatalogShop.OnLegalDisclaimerClicked",
    name = "OnLegalDisclaimerClicked",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["OnLegalDisclaimerClicked"],
    funcPath = "C_CatalogShop.OnLegalDisclaimerClicked",
    params = { { name = "catalogShopProductID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.OpenCatalogShopInteractionFromHouse"] = {
    key = "C_CatalogShop.OpenCatalogShopInteractionFromHouse",
    name = "OpenCatalogShopInteractionFromHouse",
    category = "general",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["OpenCatalogShopInteractionFromHouse"],
    funcPath = "C_CatalogShop.OpenCatalogShopInteractionFromHouse",
    params = {  },
    returns = { { name = "shoppingSessionUUIDStr", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.OpenCatalogShopInteractionFromShop"] = {
    key = "C_CatalogShop.OpenCatalogShopInteractionFromShop",
    name = "OpenCatalogShopInteractionFromShop",
    category = "general",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["OpenCatalogShopInteractionFromShop"],
    funcPath = "C_CatalogShop.OpenCatalogShopInteractionFromShop",
    params = {  },
    returns = { { name = "shoppingSessionUUIDStr", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.ProductDisplayedTelemetry"] = {
    key = "C_CatalogShop.ProductDisplayedTelemetry",
    name = "ProductDisplayedTelemetry",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["ProductDisplayedTelemetry"],
    funcPath = "C_CatalogShop.ProductDisplayedTelemetry",
    params = { { name = "categoryId", type = "number", default = nil }, { name = "sectionId", type = "number", default = nil }, { name = "catalogShopProductID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.ProductSelectedTelemetry"] = {
    key = "C_CatalogShop.ProductSelectedTelemetry",
    name = "ProductSelectedTelemetry",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["ProductSelectedTelemetry"],
    funcPath = "C_CatalogShop.ProductSelectedTelemetry",
    params = { { name = "categoryId", type = "number", default = nil }, { name = "sectionId", type = "number", default = nil }, { name = "catalogShopProductID", type = "number", default = nil }, { name = "wasCodeSelection", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.PurchaseProduct"] = {
    key = "C_CatalogShop.PurchaseProduct",
    name = "PurchaseProduct",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["PurchaseProduct"],
    funcPath = "C_CatalogShop.PurchaseProduct",
    params = { { name = "productID", type = "number", default = nil } },
    returns = { { name = "canPurchase", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.RefreshRefundableDecors"] = {
    key = "C_CatalogShop.RefreshRefundableDecors",
    name = "RefreshRefundableDecors",
    category = "general",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["RefreshRefundableDecors"],
    funcPath = "C_CatalogShop.RefreshRefundableDecors",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.RefreshVirtualCurrencyBalance"] = {
    key = "C_CatalogShop.RefreshVirtualCurrencyBalance",
    name = "RefreshVirtualCurrencyBalance",
    category = "combat_midnight",
    subcategory = "c_catalogshop",
    func = _G["C_CatalogShop"] and _G["C_CatalogShop"]["RefreshVirtualCurrencyBalance"],
    funcPath = "C_CatalogShop.RefreshVirtualCurrencyBalance",
    params = { { name = "currencyCode", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

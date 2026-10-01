-- Generated APIDefinitions for namespace: C_CatalogShop
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CatalogShop.BulkPurchaseProducts"] = {
    key = "C_CatalogShop.BulkPurchaseProducts",
    name = "BulkPurchaseProducts",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.BulkPurchaseProducts",
    params = { { name = "productIDs", type = "table", default = nil } },
    returns = { { name = "canPurchaseProducts", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.CloseCatalogShopInteraction"] = {
    key = "C_CatalogShop.CloseCatalogShopInteraction",
    name = "CloseCatalogShopInteraction",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.CloseCatalogShopInteraction",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.ConfirmHousingPurchase"] = {
    key = "C_CatalogShop.ConfirmHousingPurchase",
    name = "ConfirmHousingPurchase",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.ConfirmHousingPurchase",
    params = { { name = "productIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetAvailableCategoryIDs"] = {
    key = "C_CatalogShop.GetAvailableCategoryIDs",
    name = "GetAvailableCategoryIDs",
    category = "general",
    subcategory = "c_catalogshop",
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
    funcPath = "C_CatalogShop.GetAvailableTransmogRaceInfos",
    params = {  },
    returns = { { name = "raceIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.GetCatalogShopProductDisplayInfo"] = {
    key = "C_CatalogShop.GetCatalogShopProductDisplayInfo",
    name = "GetCatalogShopProductDisplayInfo",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetCatalogShopProductDisplayInfo",
    params = { { name = "catalogShopProductID", type = "number", default = nil } },
    returns = { { name = "item", type = "CatalogShopProductDisplayInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetCategoryInfo"] = {
    key = "C_CatalogShop.GetCategoryInfo",
    name = "GetCategoryInfo",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetCategoryInfo",
    params = { { name = "categoryID", type = "number", default = nil } },
    returns = { { name = "categoryInfo", type = "CatalogShopCategoryInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetCategorySectionInfo"] = {
    key = "C_CatalogShop.GetCategorySectionInfo",
    name = "GetCategorySectionInfo",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetCategorySectionInfo",
    params = { { name = "categoryID", type = "number", default = nil }, { name = "sectionID", type = "number", default = nil } },
    returns = { { name = "sectionInfo", type = "CatalogShopSectionInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetFailureInfo"] = {
    key = "C_CatalogShop.GetFailureInfo",
    name = "GetFailureInfo",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetFailureInfo",
    params = {  },
    returns = { { name = "errorResultEnum", type = "StoreError", canBeSecret = false }, { name = "errorResultRaw", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.GetFirstCategoryByProductID"] = {
    key = "C_CatalogShop.GetFirstCategoryByProductID",
    name = "GetFirstCategoryByProductID",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetFirstCategoryByProductID",
    params = { { name = "productID", type = "number", default = nil } },
    returns = { { name = "categoryInfo", type = "CatalogShopCategoryInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetNewProducts"] = {
    key = "C_CatalogShop.GetNewProducts",
    name = "GetNewProducts",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetNewProducts",
    params = {  },
    returns = { { name = "newProducts", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.GetProductAvailabilityTimeRemainingSecs"] = {
    key = "C_CatalogShop.GetProductAvailabilityTimeRemainingSecs",
    name = "GetProductAvailabilityTimeRemainingSecs",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetProductAvailabilityTimeRemainingSecs",
    params = { { name = "catalogShopProductID", type = "number", default = nil } },
    returns = { { name = "timeRemainingSecs", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetProductIDsForBundle"] = {
    key = "C_CatalogShop.GetProductIDsForBundle",
    name = "GetProductIDsForBundle",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetProductIDsForBundle",
    params = { { name = "bundleProductID", type = "number", default = nil } },
    returns = { { name = "childIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetProductIDsForCategory"] = {
    key = "C_CatalogShop.GetProductIDsForCategory",
    name = "GetProductIDsForCategory",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetProductIDsForCategory",
    params = { { name = "categoryID", type = "number", default = nil } },
    returns = { { name = "productIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetProductIDsForCategorySection"] = {
    key = "C_CatalogShop.GetProductIDsForCategorySection",
    name = "GetProductIDsForCategorySection",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetProductIDsForCategorySection",
    params = { { name = "categoryID", type = "number", default = nil }, { name = "sectionID", type = "number", default = nil } },
    returns = { { name = "productIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetProductInfo"] = {
    key = "C_CatalogShop.GetProductInfo",
    name = "GetProductInfo",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetProductInfo",
    params = { { name = "productID", type = "number", default = nil } },
    returns = { { name = "productInfo", type = "CatalogShopProductInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetProductSortOrder"] = {
    key = "C_CatalogShop.GetProductSortOrder",
    name = "GetProductSortOrder",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetProductSortOrder",
    params = { { name = "categoryID", type = "number", default = nil }, { name = "sectionID", type = "number", default = nil }, { name = "productID", type = "number", default = nil } },
    returns = { { name = "sortOrder", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetRefundableDecors"] = {
    key = "C_CatalogShop.GetRefundableDecors",
    name = "GetRefundableDecors",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetRefundableDecors",
    params = { { name = "productIDOpt", type = "number", default = nil } },
    returns = { { name = "refundableDecorInfos", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetSectionIDsForCategory"] = {
    key = "C_CatalogShop.GetSectionIDsForCategory",
    name = "GetSectionIDsForCategory",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetSectionIDsForCategory",
    params = { { name = "categoryID", type = "number", default = nil } },
    returns = { { name = "sectionIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetSpellVisualInfoForMount"] = {
    key = "C_CatalogShop.GetSpellVisualInfoForMount",
    name = "GetSpellVisualInfoForMount",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetSpellVisualInfoForMount",
    params = { { name = "spellVisualID", type = "number", default = nil } },
    returns = { { name = "spellVisualInfo", type = "CatalogShopSpellVisualInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.GetVirtualCurrencyBalance"] = {
    key = "C_CatalogShop.GetVirtualCurrencyBalance",
    name = "GetVirtualCurrencyBalance",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.GetVirtualCurrencyBalance",
    params = { { name = "currencyCode", type = "string", default = nil } },
    returns = { { name = "balance", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.HasNewProducts"] = {
    key = "C_CatalogShop.HasNewProducts",
    name = "HasNewProducts",
    category = "general",
    subcategory = "c_catalogshop",
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
    funcPath = "C_CatalogShop.IsShop2Enabled",
    params = {  },
    returns = { { name = "value", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.OnLegalDisclaimerClicked"] = {
    key = "C_CatalogShop.OnLegalDisclaimerClicked",
    name = "OnLegalDisclaimerClicked",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.OnLegalDisclaimerClicked",
    params = { { name = "catalogShopProductID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.OpenCatalogShopInteractionFromHouse"] = {
    key = "C_CatalogShop.OpenCatalogShopInteractionFromHouse",
    name = "OpenCatalogShopInteractionFromHouse",
    category = "general",
    subcategory = "c_catalogshop",
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
    funcPath = "C_CatalogShop.OpenCatalogShopInteractionFromShop",
    params = {  },
    returns = { { name = "shoppingSessionUUIDStr", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.ProductDisplayedTelemetry"] = {
    key = "C_CatalogShop.ProductDisplayedTelemetry",
    name = "ProductDisplayedTelemetry",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.ProductDisplayedTelemetry",
    params = { { name = "categoryId", type = "number", default = nil }, { name = "sectionId", type = "number", default = nil }, { name = "catalogShopProductID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.ProductSelectedTelemetry"] = {
    key = "C_CatalogShop.ProductSelectedTelemetry",
    name = "ProductSelectedTelemetry",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.ProductSelectedTelemetry",
    params = { { name = "categoryId", type = "number", default = nil }, { name = "sectionId", type = "number", default = nil }, { name = "catalogShopProductID", type = "number", default = nil }, { name = "wasCodeSelection", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.PurchaseProduct"] = {
    key = "C_CatalogShop.PurchaseProduct",
    name = "PurchaseProduct",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.PurchaseProduct",
    params = { { name = "productID", type = "number", default = nil } },
    returns = { { name = "canPurchase", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.RefreshRefundableDecors"] = {
    key = "C_CatalogShop.RefreshRefundableDecors",
    name = "RefreshRefundableDecors",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.RefreshRefundableDecors",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_CatalogShop.RefreshVirtualCurrencyBalance"] = {
    key = "C_CatalogShop.RefreshVirtualCurrencyBalance",
    name = "RefreshVirtualCurrencyBalance",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.RefreshVirtualCurrencyBalance",
    params = { { name = "currencyCode", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CatalogShop.StartHousingVCPurchaseConfirmation"] = {
    key = "C_CatalogShop.StartHousingVCPurchaseConfirmation",
    name = "StartHousingVCPurchaseConfirmation",
    category = "general",
    subcategory = "c_catalogshop",
    funcPath = "C_CatalogShop.StartHousingVCPurchaseConfirmation",
    params = { { name = "productID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

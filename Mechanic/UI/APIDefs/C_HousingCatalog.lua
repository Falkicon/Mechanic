-- Generated APIDefinitions for namespace: C_HousingCatalog
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HousingCatalog.CanDestroyEntry"] = {
    key = "C_HousingCatalog.CanDestroyEntry",
    name = "CanDestroyEntry",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.CanDestroyEntry",
    params = { { name = "entryID", type = "HousingCatalogEntryID", default = nil } },
    returns = { { name = "canDelete", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.CreateCatalogSearcher"] = {
    key = "C_HousingCatalog.CreateCatalogSearcher",
    name = "CreateCatalogSearcher",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.CreateCatalogSearcher",
    params = {  },
    returns = { { name = "searcher", type = "HousingCatalogSearcher", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCatalog.DeletePreviewCartDecor"] = {
    key = "C_HousingCatalog.DeletePreviewCartDecor",
    name = "DeletePreviewCartDecor",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.DeletePreviewCartDecor",
    params = { { name = "decorGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.DestroyEntry"] = {
    key = "C_HousingCatalog.DestroyEntry",
    name = "DestroyEntry",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.DestroyEntry",
    params = { { name = "entryID", type = "HousingCatalogEntryID", default = nil }, { name = "destroyAll", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetAllFilterTagGroups"] = {
    key = "C_HousingCatalog.GetAllFilterTagGroups",
    name = "GetAllFilterTagGroups",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.GetAllFilterTagGroups",
    params = {  },
    returns = { { name = "filterTagGroups", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCatalog.GetBundleInfo"] = {
    key = "C_HousingCatalog.GetBundleInfo",
    name = "GetBundleInfo",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.GetBundleInfo",
    params = { { name = "bundleCatalogShopProductID", type = "number", default = nil } },
    returns = { { name = "bundleInfo", type = "HousingBundleInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetCartSizeLimit"] = {
    key = "C_HousingCatalog.GetCartSizeLimit",
    name = "GetCartSizeLimit",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.GetCartSizeLimit",
    params = {  },
    returns = { { name = "cartSizeLimit", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCatalog.GetCatalogCategoryInfo"] = {
    key = "C_HousingCatalog.GetCatalogCategoryInfo",
    name = "GetCatalogCategoryInfo",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.GetCatalogCategoryInfo",
    params = { { name = "categoryID", type = "number", default = nil } },
    returns = { { name = "info", type = "HousingCatalogCategoryInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetCatalogEntryInfo"] = {
    key = "C_HousingCatalog.GetCatalogEntryInfo",
    name = "GetCatalogEntryInfo",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.GetCatalogEntryInfo",
    params = { { name = "entryID", type = "HousingCatalogEntryID", default = nil } },
    returns = { { name = "info", type = "HousingCatalogEntryInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetCatalogEntryInfoByItem"] = {
    key = "C_HousingCatalog.GetCatalogEntryInfoByItem",
    name = "GetCatalogEntryInfoByItem",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.GetCatalogEntryInfoByItem",
    params = { { name = "itemInfo", type = "ItemInfo", default = nil }, { name = "tryGetOwnedInfo", type = "bool", default = nil } },
    returns = { { name = "info", type = "HousingCatalogEntryInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetCatalogEntryInfoByRecordID"] = {
    key = "C_HousingCatalog.GetCatalogEntryInfoByRecordID",
    name = "GetCatalogEntryInfoByRecordID",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.GetCatalogEntryInfoByRecordID",
    params = { { name = "entryType", type = "HousingCatalogEntryType", default = nil }, { name = "recordID", type = "number", default = nil }, { name = "tryGetOwnedInfo", type = "bool", default = nil } },
    returns = { { name = "info", type = "HousingCatalogEntryInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetCatalogEntryRefundTimeStampByRecordID"] = {
    key = "C_HousingCatalog.GetCatalogEntryRefundTimeStampByRecordID",
    name = "GetCatalogEntryRefundTimeStampByRecordID",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.GetCatalogEntryRefundTimeStampByRecordID",
    params = { { name = "entryType", type = "HousingCatalogEntryType", default = nil }, { name = "recordID", type = "number", default = nil } },
    returns = { { name = "refundTimeStamp", type = "time_t", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetCatalogSubcategoryInfo"] = {
    key = "C_HousingCatalog.GetCatalogSubcategoryInfo",
    name = "GetCatalogSubcategoryInfo",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.GetCatalogSubcategoryInfo",
    params = { { name = "subcategoryID", type = "number", default = nil } },
    returns = { { name = "info", type = "HousingCatalogSubcategoryInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetDecorMaxOwnedCount"] = {
    key = "C_HousingCatalog.GetDecorMaxOwnedCount",
    name = "GetDecorMaxOwnedCount",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.GetDecorMaxOwnedCount",
    params = {  },
    returns = { { name = "maxOwnedCount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCatalog.GetDecorTotalOwnedCount"] = {
    key = "C_HousingCatalog.GetDecorTotalOwnedCount",
    name = "GetDecorTotalOwnedCount",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.GetDecorTotalOwnedCount",
    params = {  },
    returns = { { name = "totalOwnedCount", type = "number", canBeSecret = false }, { name = "exemptDecorCount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCatalog.GetFeaturedBundles"] = {
    key = "C_HousingCatalog.GetFeaturedBundles",
    name = "GetFeaturedBundles",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.GetFeaturedBundles",
    params = {  },
    returns = { { name = "bundleInfos", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCatalog.GetFeaturedDecor"] = {
    key = "C_HousingCatalog.GetFeaturedDecor",
    name = "GetFeaturedDecor",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.GetFeaturedDecor",
    params = {  },
    returns = { { name = "entryInfos", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCatalog.HasFeaturedEntries"] = {
    key = "C_HousingCatalog.HasFeaturedEntries",
    name = "HasFeaturedEntries",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.HasFeaturedEntries",
    params = {  },
    returns = { { name = "hasEntries", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCatalog.IsPreviewCartItemShown"] = {
    key = "C_HousingCatalog.IsPreviewCartItemShown",
    name = "IsPreviewCartItemShown",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.IsPreviewCartItemShown",
    params = { { name = "decorGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "isShown", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.PromotePreviewDecor"] = {
    key = "C_HousingCatalog.PromotePreviewDecor",
    name = "PromotePreviewDecor",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.PromotePreviewDecor",
    params = { { name = "decorID", type = "number", default = nil }, { name = "previewDecorGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.RequestHousingMarketInfoRefresh"] = {
    key = "C_HousingCatalog.RequestHousingMarketInfoRefresh",
    name = "RequestHousingMarketInfoRefresh",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.RequestHousingMarketInfoRefresh",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCatalog.RequestHousingMarketRefundInfo"] = {
    key = "C_HousingCatalog.RequestHousingMarketRefundInfo",
    name = "RequestHousingMarketRefundInfo",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.RequestHousingMarketRefundInfo",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCatalog.SearchCatalogCategories"] = {
    key = "C_HousingCatalog.SearchCatalogCategories",
    name = "SearchCatalogCategories",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.SearchCatalogCategories",
    params = { { name = "searchParams", type = "HousingCategorySearchInfo", default = nil } },
    returns = { { name = "categoryIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.SearchCatalogSubcategories"] = {
    key = "C_HousingCatalog.SearchCatalogSubcategories",
    name = "SearchCatalogSubcategories",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.SearchCatalogSubcategories",
    params = { { name = "searchParams", type = "HousingCategorySearchInfo", default = nil } },
    returns = { { name = "subcategoryIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.SetPreviewCartItemShown"] = {
    key = "C_HousingCatalog.SetPreviewCartItemShown",
    name = "SetPreviewCartItemShown",
    category = "general",
    subcategory = "c_housingcatalog",
    funcPath = "C_HousingCatalog.SetPreviewCartItemShown",
    params = { { name = "decorGUID", type = "WOWGUID", default = nil }, { name = "shown", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_HousingCatalog
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HousingCatalog.CanDestroyEntry"] = {
    key = "C_HousingCatalog.CanDestroyEntry",
    name = "CanDestroyEntry",
    category = "combat_midnight",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["CanDestroyEntry"],
    funcPath = "C_HousingCatalog.CanDestroyEntry",
    params = { { name = "entryID", type = "HousingCatalogEntryID", default = nil } },
    returns = { { name = "canDelete", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.CreateCatalogSearcher"] = {
    key = "C_HousingCatalog.CreateCatalogSearcher",
    name = "CreateCatalogSearcher",
    category = "general",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["CreateCatalogSearcher"],
    funcPath = "C_HousingCatalog.CreateCatalogSearcher",
    params = {  },
    returns = { { name = "searcher", type = "HousingCatalogSearcher", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCatalog.DeletePreviewCartDecor"] = {
    key = "C_HousingCatalog.DeletePreviewCartDecor",
    name = "DeletePreviewCartDecor",
    category = "combat_midnight",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["DeletePreviewCartDecor"],
    funcPath = "C_HousingCatalog.DeletePreviewCartDecor",
    params = { { name = "decorGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.DestroyEntry"] = {
    key = "C_HousingCatalog.DestroyEntry",
    name = "DestroyEntry",
    category = "combat_midnight",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["DestroyEntry"],
    funcPath = "C_HousingCatalog.DestroyEntry",
    params = { { name = "entryID", type = "HousingCatalogEntryID", default = nil }, { name = "destroyAll", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetAllFilterTagGroups"] = {
    key = "C_HousingCatalog.GetAllFilterTagGroups",
    name = "GetAllFilterTagGroups",
    category = "general",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["GetAllFilterTagGroups"],
    funcPath = "C_HousingCatalog.GetAllFilterTagGroups",
    params = {  },
    returns = { { name = "filterTagGroups", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCatalog.GetBundleInfo"] = {
    key = "C_HousingCatalog.GetBundleInfo",
    name = "GetBundleInfo",
    category = "combat_midnight",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["GetBundleInfo"],
    funcPath = "C_HousingCatalog.GetBundleInfo",
    params = { { name = "bundleCatalogShopProductID", type = "number", default = nil } },
    returns = { { name = "bundleInfo", type = "HousingBundleInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetCatalogCategoryInfo"] = {
    key = "C_HousingCatalog.GetCatalogCategoryInfo",
    name = "GetCatalogCategoryInfo",
    category = "combat_midnight",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["GetCatalogCategoryInfo"],
    funcPath = "C_HousingCatalog.GetCatalogCategoryInfo",
    params = { { name = "categoryID", type = "number", default = nil } },
    returns = { { name = "info", type = "HousingCatalogCategoryInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetCatalogEntryInfo"] = {
    key = "C_HousingCatalog.GetCatalogEntryInfo",
    name = "GetCatalogEntryInfo",
    category = "combat_midnight",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["GetCatalogEntryInfo"],
    funcPath = "C_HousingCatalog.GetCatalogEntryInfo",
    params = { { name = "entryID", type = "HousingCatalogEntryID", default = nil } },
    returns = { { name = "info", type = "HousingCatalogEntryInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetCatalogEntryInfoByItem"] = {
    key = "C_HousingCatalog.GetCatalogEntryInfoByItem",
    name = "GetCatalogEntryInfoByItem",
    category = "combat_midnight",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["GetCatalogEntryInfoByItem"],
    funcPath = "C_HousingCatalog.GetCatalogEntryInfoByItem",
    params = { { name = "itemInfo", type = "ItemInfo", default = nil }, { name = "tryGetOwnedInfo", type = "bool", default = nil } },
    returns = { { name = "info", type = "HousingCatalogEntryInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetCatalogEntryInfoByRecordID"] = {
    key = "C_HousingCatalog.GetCatalogEntryInfoByRecordID",
    name = "GetCatalogEntryInfoByRecordID",
    category = "combat_midnight",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["GetCatalogEntryInfoByRecordID"],
    funcPath = "C_HousingCatalog.GetCatalogEntryInfoByRecordID",
    params = { { name = "entryType", type = "HousingCatalogEntryType", default = nil }, { name = "recordID", type = "number", default = nil }, { name = "tryGetOwnedInfo", type = "bool", default = nil } },
    returns = { { name = "info", type = "HousingCatalogEntryInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetCatalogEntryRefundTimeStampByRecordID"] = {
    key = "C_HousingCatalog.GetCatalogEntryRefundTimeStampByRecordID",
    name = "GetCatalogEntryRefundTimeStampByRecordID",
    category = "combat_midnight",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["GetCatalogEntryRefundTimeStampByRecordID"],
    funcPath = "C_HousingCatalog.GetCatalogEntryRefundTimeStampByRecordID",
    params = { { name = "entryType", type = "HousingCatalogEntryType", default = nil }, { name = "recordID", type = "number", default = nil } },
    returns = { { name = "refundTimeStamp", type = "time_t", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetCatalogSubcategoryInfo"] = {
    key = "C_HousingCatalog.GetCatalogSubcategoryInfo",
    name = "GetCatalogSubcategoryInfo",
    category = "combat_midnight",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["GetCatalogSubcategoryInfo"],
    funcPath = "C_HousingCatalog.GetCatalogSubcategoryInfo",
    params = { { name = "subcategoryID", type = "number", default = nil } },
    returns = { { name = "info", type = "HousingCatalogSubcategoryInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.GetDecorMaxOwnedCount"] = {
    key = "C_HousingCatalog.GetDecorMaxOwnedCount",
    name = "GetDecorMaxOwnedCount",
    category = "general",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["GetDecorMaxOwnedCount"],
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
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["GetDecorTotalOwnedCount"],
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
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["GetFeaturedBundles"],
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
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["GetFeaturedDecor"],
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
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["HasFeaturedEntries"],
    funcPath = "C_HousingCatalog.HasFeaturedEntries",
    params = {  },
    returns = { { name = "hasEntries", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCatalog.IsPreviewCartItemShown"] = {
    key = "C_HousingCatalog.IsPreviewCartItemShown",
    name = "IsPreviewCartItemShown",
    category = "combat_midnight",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["IsPreviewCartItemShown"],
    funcPath = "C_HousingCatalog.IsPreviewCartItemShown",
    params = { { name = "decorGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "isShown", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.PromotePreviewDecor"] = {
    key = "C_HousingCatalog.PromotePreviewDecor",
    name = "PromotePreviewDecor",
    category = "combat_midnight",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["PromotePreviewDecor"],
    funcPath = "C_HousingCatalog.PromotePreviewDecor",
    params = { { name = "decorID", type = "number", default = nil }, { name = "previewDecorGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.RequestHousingMarketInfoRefresh"] = {
    key = "C_HousingCatalog.RequestHousingMarketInfoRefresh",
    name = "RequestHousingMarketInfoRefresh",
    category = "general",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["RequestHousingMarketInfoRefresh"],
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
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["RequestHousingMarketRefundInfo"],
    funcPath = "C_HousingCatalog.RequestHousingMarketRefundInfo",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCatalog.SearchCatalogCategories"] = {
    key = "C_HousingCatalog.SearchCatalogCategories",
    name = "SearchCatalogCategories",
    category = "combat_midnight",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["SearchCatalogCategories"],
    funcPath = "C_HousingCatalog.SearchCatalogCategories",
    params = { { name = "searchParams", type = "HousingCategorySearchInfo", default = nil } },
    returns = { { name = "categoryIDs", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.SearchCatalogSubcategories"] = {
    key = "C_HousingCatalog.SearchCatalogSubcategories",
    name = "SearchCatalogSubcategories",
    category = "combat_midnight",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["SearchCatalogSubcategories"],
    funcPath = "C_HousingCatalog.SearchCatalogSubcategories",
    params = { { name = "searchParams", type = "HousingCategorySearchInfo", default = nil } },
    returns = { { name = "subcategoryIDs", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCatalog.SetPreviewCartItemShown"] = {
    key = "C_HousingCatalog.SetPreviewCartItemShown",
    name = "SetPreviewCartItemShown",
    category = "combat_midnight",
    subcategory = "c_housingcatalog",
    func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["SetPreviewCartItemShown"],
    funcPath = "C_HousingCatalog.SetPreviewCartItemShown",
    params = { { name = "decorGUID", type = "WOWGUID", default = nil }, { name = "shown", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

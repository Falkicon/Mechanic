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

APIDefs["C_HousingCatalog.DeletePreviewCartDecor"] = {
	key = "C_HousingCatalog.DeletePreviewCartDecor",
	name = "DeletePreviewCartDecor",
	category = "combat_midnight",
	subcategory = "c_housingcatalog",
	func = _G["C_HousingCatalog"] and _G["C_HousingCatalog"]["DeletePreviewCartDecor"],
	funcPath = "C_HousingCatalog.DeletePreviewCartDecor",
	params = { { name = "decorGUID", type = "WOWGUID", default = nil } },
	returns = {},
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
	params = {
		{ name = "entryID", type = "HousingCatalogEntryID", default = nil },
		{ name = "destroyAll", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
	params = {
		{ name = "itemInfo", type = "ItemInfo", default = nil },
		{ name = "tryGetOwnedInfo", type = "bool", default = nil },
	},
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
	params = {
		{
			name = "entryType",
			type = "HousingCatalogEntryType",
			default = nil,
			examples = {
				{ value = 1, label = "Plumber" },
				{ value = 1, label = "Plumber" },
				{ value = 1, label = "Plumber" },
			},
		},
		{ name = "recordID", type = "number", default = nil },
		{ name = "tryGetOwnedInfo", type = "bool", default = nil },
	},
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
	params = {
		{ name = "entryType", type = "HousingCatalogEntryType", default = nil },
		{ name = "recordID", type = "number", default = nil },
	},
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
	params = {
		{ name = "decorID", type = "number", default = nil },
		{ name = "previewDecorGUID", type = "WOWGUID", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
	params = {
		{ name = "decorGUID", type = "WOWGUID", default = nil },
		{ name = "shown", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

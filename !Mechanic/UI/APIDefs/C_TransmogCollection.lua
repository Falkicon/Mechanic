-- Generated APIDefinitions for namespace: C_TransmogCollection
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_TransmogCollection.AccountCanCollectSource"] = {
	key = "C_TransmogCollection.AccountCanCollectSource",
	name = "AccountCanCollectSource",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["AccountCanCollectSource"],
	funcPath = "C_TransmogCollection.AccountCanCollectSource",
	params = { { name = "sourceID", type = "number", default = nil } },
	returns = {
		{ name = "hasItemData", type = "bool", canBeSecret = false },
		{ name = "canCollect", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.CanAppearanceHaveIllusion"] = {
	key = "C_TransmogCollection.CanAppearanceHaveIllusion",
	name = "CanAppearanceHaveIllusion",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["CanAppearanceHaveIllusion"],
	funcPath = "C_TransmogCollection.CanAppearanceHaveIllusion",
	params = { { name = "appearanceID", type = "number", default = nil } },
	returns = { { name = "canHaveIllusion", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.ClearNewAppearance"] = {
	key = "C_TransmogCollection.ClearNewAppearance",
	name = "ClearNewAppearance",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["ClearNewAppearance"],
	funcPath = "C_TransmogCollection.ClearNewAppearance",
	params = { { name = "visualID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.ClearSearch"] = {
	key = "C_TransmogCollection.ClearSearch",
	name = "ClearSearch",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["ClearSearch"],
	funcPath = "C_TransmogCollection.ClearSearch",
	params = { { name = "searchType", type = "TransmogSearchType", default = nil } },
	returns = { { name = "completed", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.DeleteCustomSet"] = {
	key = "C_TransmogCollection.DeleteCustomSet",
	name = "DeleteCustomSet",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["DeleteCustomSet"],
	funcPath = "C_TransmogCollection.DeleteCustomSet",
	params = { { name = "customSetID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetAllAppearanceSources"] = {
	key = "C_TransmogCollection.GetAllAppearanceSources",
	name = "GetAllAppearanceSources",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetAllAppearanceSources"],
	funcPath = "C_TransmogCollection.GetAllAppearanceSources",
	params = { { name = "itemAppearanceID", type = "number", default = nil } },
	returns = { { name = "itemModifiedAppearanceIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetAppearanceCameraID"] = {
	key = "C_TransmogCollection.GetAppearanceCameraID",
	name = "GetAppearanceCameraID",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetAppearanceCameraID"],
	funcPath = "C_TransmogCollection.GetAppearanceCameraID",
	params = {
		{ name = "itemAppearanceID", type = "number", default = nil },
		{ name = "variation", type = "TransmogCameraVariation", default = nil },
	},
	returns = { { name = "cameraID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetAppearanceCameraIDBySource"] = {
	key = "C_TransmogCollection.GetAppearanceCameraIDBySource",
	name = "GetAppearanceCameraIDBySource",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetAppearanceCameraIDBySource"],
	funcPath = "C_TransmogCollection.GetAppearanceCameraIDBySource",
	params = {
		{ name = "itemModifiedAppearanceID", type = "number", default = nil },
		{ name = "variation", type = "TransmogCameraVariation", default = nil },
	},
	returns = { { name = "cameraID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetAppearanceInfoBySource"] = {
	key = "C_TransmogCollection.GetAppearanceInfoBySource",
	name = "GetAppearanceInfoBySource",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetAppearanceInfoBySource"],
	funcPath = "C_TransmogCollection.GetAppearanceInfoBySource",
	params = { { name = "itemModifiedAppearanceID", type = "number", default = nil } },
	returns = { { name = "info", type = "TransmogAppearanceInfoBySourceData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetAppearanceSourceDrops"] = {
	key = "C_TransmogCollection.GetAppearanceSourceDrops",
	name = "GetAppearanceSourceDrops",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetAppearanceSourceDrops"],
	funcPath = "C_TransmogCollection.GetAppearanceSourceDrops",
	params = { { name = "itemModifiedAppearanceID", type = "number", default = nil } },
	returns = { { name = "encounterInfo", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetAppearanceSourceInfo"] = {
	key = "C_TransmogCollection.GetAppearanceSourceInfo",
	name = "GetAppearanceSourceInfo",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetAppearanceSourceInfo"],
	funcPath = "C_TransmogCollection.GetAppearanceSourceInfo",
	params = { { name = "itemModifiedAppearanceID", type = "number", default = nil } },
	returns = { { name = "info", type = "TransmogAppearanceSourceInfoData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetAppearanceSources"] = {
	key = "C_TransmogCollection.GetAppearanceSources",
	name = "GetAppearanceSources",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetAppearanceSources"],
	funcPath = "C_TransmogCollection.GetAppearanceSources",
	params = {
		{
			name = "appearanceID",
			type = "number",
			default = nil,
			examples = { { value = "GetMouseFoci()[1].visualInfo.visualID", label = "Narcissus" } },
		},
		{ name = "categoryType", type = "TransmogCollectionType", default = nil },
		{ name = "transmogLocation", type = "TransmogLocation", default = nil },
	},
	returns = { { name = "sources", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetArtifactAppearanceStrings"] = {
	key = "C_TransmogCollection.GetArtifactAppearanceStrings",
	name = "GetArtifactAppearanceStrings",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetArtifactAppearanceStrings"],
	funcPath = "C_TransmogCollection.GetArtifactAppearanceStrings",
	params = { { name = "appearanceID", type = "number", default = nil } },
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "hyperlink", type = "cstring", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetCategoryAppearances"] = {
	key = "C_TransmogCollection.GetCategoryAppearances",
	name = "GetCategoryAppearances",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetCategoryAppearances"],
	funcPath = "C_TransmogCollection.GetCategoryAppearances",
	params = {
		{ name = "category", type = "TransmogCollectionType", default = nil },
		{ name = "transmogLocation", type = "TransmogLocation", default = nil },
	},
	returns = { { name = "appearances", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetCategoryCollectedCount"] = {
	key = "C_TransmogCollection.GetCategoryCollectedCount",
	name = "GetCategoryCollectedCount",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetCategoryCollectedCount"],
	funcPath = "C_TransmogCollection.GetCategoryCollectedCount",
	params = { { name = "category", type = "TransmogCollectionType", default = nil } },
	returns = { { name = "count", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetCategoryForItem"] = {
	key = "C_TransmogCollection.GetCategoryForItem",
	name = "GetCategoryForItem",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetCategoryForItem"],
	funcPath = "C_TransmogCollection.GetCategoryForItem",
	params = { { name = "itemModifiedAppearanceID", type = "number", default = nil } },
	returns = { { name = "collectionCategory", type = "TransmogCollectionType", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetCategoryInfo"] = {
	key = "C_TransmogCollection.GetCategoryInfo",
	name = "GetCategoryInfo",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetCategoryInfo"],
	funcPath = "C_TransmogCollection.GetCategoryInfo",
	params = {
		{
			name = "category",
			type = "TransmogCollectionType",
			default = nil,
			examples = {
				{ value = 15301, label = "AllTheThings" },
				{ value = 14941, label = "AllTheThings" },
				{ value = 15304, label = "AllTheThings" },
			},
		},
	},
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "isWeapon", type = "bool", canBeSecret = false },
		{ name = "canHaveIllusions", type = "bool", canBeSecret = false },
		{ name = "canMainHand", type = "bool", canBeSecret = false },
		{ name = "canOffHand", type = "bool", canBeSecret = false },
		{ name = "canRanged", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetCategoryTotal"] = {
	key = "C_TransmogCollection.GetCategoryTotal",
	name = "GetCategoryTotal",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetCategoryTotal"],
	funcPath = "C_TransmogCollection.GetCategoryTotal",
	params = { { name = "category", type = "TransmogCollectionType", default = nil } },
	returns = { { name = "total", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetCustomSetHyperlinkFromItemTransmogInfoList"] = {
	key = "C_TransmogCollection.GetCustomSetHyperlinkFromItemTransmogInfoList",
	name = "GetCustomSetHyperlinkFromItemTransmogInfoList",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetCustomSetHyperlinkFromItemTransmogInfoList"],
	funcPath = "C_TransmogCollection.GetCustomSetHyperlinkFromItemTransmogInfoList",
	params = { { name = "itemTransmogInfoList", type = "table", default = nil } },
	returns = { { name = "hyperlink", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetCustomSetInfo"] = {
	key = "C_TransmogCollection.GetCustomSetInfo",
	name = "GetCustomSetInfo",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetCustomSetInfo"],
	funcPath = "C_TransmogCollection.GetCustomSetInfo",
	params = { { name = "customSetID", type = "number", default = nil } },
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetCustomSetItemTransmogInfoList"] = {
	key = "C_TransmogCollection.GetCustomSetItemTransmogInfoList",
	name = "GetCustomSetItemTransmogInfoList",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetCustomSetItemTransmogInfoList"],
	funcPath = "C_TransmogCollection.GetCustomSetItemTransmogInfoList",
	params = { { name = "customSetID", type = "number", default = nil } },
	returns = { { name = "list", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetFilteredCategoryCollectedCount"] = {
	key = "C_TransmogCollection.GetFilteredCategoryCollectedCount",
	name = "GetFilteredCategoryCollectedCount",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetFilteredCategoryCollectedCount"],
	funcPath = "C_TransmogCollection.GetFilteredCategoryCollectedCount",
	params = { { name = "category", type = "TransmogCollectionType", default = nil } },
	returns = { { name = "count", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetFilteredCategoryTotal"] = {
	key = "C_TransmogCollection.GetFilteredCategoryTotal",
	name = "GetFilteredCategoryTotal",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetFilteredCategoryTotal"],
	funcPath = "C_TransmogCollection.GetFilteredCategoryTotal",
	params = { { name = "category", type = "TransmogCollectionType", default = nil } },
	returns = { { name = "total", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetIllusionInfo"] = {
	key = "C_TransmogCollection.GetIllusionInfo",
	name = "GetIllusionInfo",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetIllusionInfo"],
	funcPath = "C_TransmogCollection.GetIllusionInfo",
	params = { { name = "illusionID", type = "number", default = nil } },
	returns = { { name = "info", type = "TransmogIllusionInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetIllusionStrings"] = {
	key = "C_TransmogCollection.GetIllusionStrings",
	name = "GetIllusionStrings",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetIllusionStrings"],
	funcPath = "C_TransmogCollection.GetIllusionStrings",
	params = { { name = "illusionID", type = "number", default = nil } },
	returns = {
		{ name = "name", type = "string", canBeSecret = false },
		{ name = "hyperlink", type = "string", canBeSecret = false },
		{ name = "sourceText", type = "string", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetIsAppearanceFavorite"] = {
	key = "C_TransmogCollection.GetIsAppearanceFavorite",
	name = "GetIsAppearanceFavorite",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetIsAppearanceFavorite"],
	funcPath = "C_TransmogCollection.GetIsAppearanceFavorite",
	params = { { name = "itemAppearanceID", type = "number", default = nil } },
	returns = { { name = "isFavorite", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetItemInfo"] = {
	key = "C_TransmogCollection.GetItemInfo",
	name = "GetItemInfo",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetItemInfo"],
	funcPath = "C_TransmogCollection.GetItemInfo",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = {
				{ value = "itemId or 0", label = "WeakAuras" },
				{ value = "itemname or 0", label = "WeakAuras" },
				{ value = "trigger.itemName or 0", label = "WeakAuras" },
			},
		},
	},
	returns = {
		{ name = "itemAppearanceID", type = "number", canBeSecret = false },
		{ name = "itemModifiedAppearanceID", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetItemTransmogInfoListFromCustomSetHyperlink"] = {
	key = "C_TransmogCollection.GetItemTransmogInfoListFromCustomSetHyperlink",
	name = "GetItemTransmogInfoListFromCustomSetHyperlink",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetItemTransmogInfoListFromCustomSetHyperlink"],
	funcPath = "C_TransmogCollection.GetItemTransmogInfoListFromCustomSetHyperlink",
	params = { { name = "hyperlink", type = "cstring", default = nil } },
	returns = { { name = "list", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetPairedArtifactAppearance"] = {
	key = "C_TransmogCollection.GetPairedArtifactAppearance",
	name = "GetPairedArtifactAppearance",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetPairedArtifactAppearance"],
	funcPath = "C_TransmogCollection.GetPairedArtifactAppearance",
	params = { { name = "itemModifiedAppearanceID", type = "number", default = nil } },
	returns = { { name = "pairedItemModifiedAppearanceID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetSourceIcon"] = {
	key = "C_TransmogCollection.GetSourceIcon",
	name = "GetSourceIcon",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetSourceIcon"],
	funcPath = "C_TransmogCollection.GetSourceIcon",
	params = { { name = "itemModifiedAppearanceID", type = "number", default = nil } },
	returns = { { name = "icon", type = "fileID", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetSourceInfo"] = {
	key = "C_TransmogCollection.GetSourceInfo",
	name = "GetSourceInfo",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetSourceInfo"],
	funcPath = "C_TransmogCollection.GetSourceInfo",
	params = {
		{ name = "sourceID", type = "number", default = nil, examples = { { value = "item", label = "Narcissus" } } },
	},
	returns = { { name = "sourceInfo", type = "AppearanceSourceInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetSourceItemID"] = {
	key = "C_TransmogCollection.GetSourceItemID",
	name = "GetSourceItemID",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetSourceItemID"],
	funcPath = "C_TransmogCollection.GetSourceItemID",
	params = { { name = "itemModifiedAppearanceID", type = "number", default = nil } },
	returns = { { name = "itemID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetSourceRequiredHoliday"] = {
	key = "C_TransmogCollection.GetSourceRequiredHoliday",
	name = "GetSourceRequiredHoliday",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetSourceRequiredHoliday"],
	funcPath = "C_TransmogCollection.GetSourceRequiredHoliday",
	params = { { name = "itemModifiedAppearanceID", type = "number", default = nil } },
	returns = { { name = "holidayName", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.GetValidAppearanceSourcesForClass"] = {
	key = "C_TransmogCollection.GetValidAppearanceSourcesForClass",
	name = "GetValidAppearanceSourcesForClass",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["GetValidAppearanceSourcesForClass"],
	funcPath = "C_TransmogCollection.GetValidAppearanceSourcesForClass",
	params = {
		{ name = "appearanceID", type = "number", default = nil },
		{ name = "classID", type = "number", default = nil },
		{ name = "categoryType", type = "TransmogCollectionType", default = nil },
		{ name = "transmogLocation", type = "TransmogLocation", default = nil },
	},
	returns = { { name = "sources", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.IsAppearanceHiddenVisual"] = {
	key = "C_TransmogCollection.IsAppearanceHiddenVisual",
	name = "IsAppearanceHiddenVisual",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["IsAppearanceHiddenVisual"],
	funcPath = "C_TransmogCollection.IsAppearanceHiddenVisual",
	params = { { name = "appearanceID", type = "number", default = nil } },
	returns = { { name = "isHiddenVisual", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.IsCategoryValidForItem"] = {
	key = "C_TransmogCollection.IsCategoryValidForItem",
	name = "IsCategoryValidForItem",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["IsCategoryValidForItem"],
	funcPath = "C_TransmogCollection.IsCategoryValidForItem",
	params = {
		{ name = "category", type = "TransmogCollectionType", default = nil },
		{ name = "itemInfo", type = "ItemInfo", default = nil },
	},
	returns = { { name = "isValid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.IsNewAppearance"] = {
	key = "C_TransmogCollection.IsNewAppearance",
	name = "IsNewAppearance",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["IsNewAppearance"],
	funcPath = "C_TransmogCollection.IsNewAppearance",
	params = { { name = "visualID", type = "number", default = nil } },
	returns = { { name = "isNew", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.IsSearchInProgress"] = {
	key = "C_TransmogCollection.IsSearchInProgress",
	name = "IsSearchInProgress",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["IsSearchInProgress"],
	funcPath = "C_TransmogCollection.IsSearchInProgress",
	params = { { name = "searchType", type = "TransmogSearchType", default = nil } },
	returns = { { name = "inProgress", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.IsSourceTypeFilterChecked"] = {
	key = "C_TransmogCollection.IsSourceTypeFilterChecked",
	name = "IsSourceTypeFilterChecked",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["IsSourceTypeFilterChecked"],
	funcPath = "C_TransmogCollection.IsSourceTypeFilterChecked",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "checked", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.IsValidCustomSetName"] = {
	key = "C_TransmogCollection.IsValidCustomSetName",
	name = "IsValidCustomSetName",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["IsValidCustomSetName"],
	funcPath = "C_TransmogCollection.IsValidCustomSetName",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = { { name = "isApproved", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.IsValidTransmogSource"] = {
	key = "C_TransmogCollection.IsValidTransmogSource",
	name = "IsValidTransmogSource",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["IsValidTransmogSource"],
	funcPath = "C_TransmogCollection.IsValidTransmogSource",
	params = { { name = "source", type = "TransmogSource", default = nil } },
	returns = { { name = "valid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.ModifyCustomSet"] = {
	key = "C_TransmogCollection.ModifyCustomSet",
	name = "ModifyCustomSet",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["ModifyCustomSet"],
	funcPath = "C_TransmogCollection.ModifyCustomSet",
	params = {
		{ name = "customSetID", type = "number", default = nil },
		{ name = "itemTransmogInfoList", type = "table", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.NewCustomSet"] = {
	key = "C_TransmogCollection.NewCustomSet",
	name = "NewCustomSet",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["NewCustomSet"],
	funcPath = "C_TransmogCollection.NewCustomSet",
	params = {
		{ name = "name", type = "cstring", default = nil },
		{ name = "icon", type = "fileID", default = nil },
		{ name = "itemTransmogInfoList", type = "table", default = nil },
	},
	returns = { { name = "customSetID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.PlayerCanCollectSource"] = {
	key = "C_TransmogCollection.PlayerCanCollectSource",
	name = "PlayerCanCollectSource",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["PlayerCanCollectSource"],
	funcPath = "C_TransmogCollection.PlayerCanCollectSource",
	params = { { name = "sourceID", type = "number", default = nil } },
	returns = {
		{ name = "hasItemData", type = "bool", canBeSecret = false },
		{ name = "canCollect", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.PlayerHasTransmog"] = {
	key = "C_TransmogCollection.PlayerHasTransmog",
	name = "PlayerHasTransmog",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["PlayerHasTransmog"],
	funcPath = "C_TransmogCollection.PlayerHasTransmog",
	params = {
		{ name = "itemID", type = "number", default = nil, examples = { { value = "id", label = "BagBrother" } } },
		{ name = "itemAppearanceModID", type = "number", default = 0 },
	},
	returns = { { name = "hasTransmog", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.PlayerHasTransmogByItemInfo"] = {
	key = "C_TransmogCollection.PlayerHasTransmogByItemInfo",
	name = "PlayerHasTransmogByItemInfo",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["PlayerHasTransmogByItemInfo"],
	funcPath = "C_TransmogCollection.PlayerHasTransmogByItemInfo",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "hasTransmog", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.PlayerHasTransmogItemModifiedAppearance"] = {
	key = "C_TransmogCollection.PlayerHasTransmogItemModifiedAppearance",
	name = "PlayerHasTransmogItemModifiedAppearance",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["PlayerHasTransmogItemModifiedAppearance"],
	funcPath = "C_TransmogCollection.PlayerHasTransmogItemModifiedAppearance",
	params = { { name = "itemModifiedAppearanceID", type = "number", default = nil } },
	returns = { { name = "hasTransmog", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.PlayerKnowsSource"] = {
	key = "C_TransmogCollection.PlayerKnowsSource",
	name = "PlayerKnowsSource",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["PlayerKnowsSource"],
	funcPath = "C_TransmogCollection.PlayerKnowsSource",
	params = {
		{
			name = "sourceID",
			type = "number",
			default = nil,
			examples = { { value = "sourceIDs[1]", label = "Narcissus" } },
		},
	},
	returns = { { name = "isKnown", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.RenameCustomSet"] = {
	key = "C_TransmogCollection.RenameCustomSet",
	name = "RenameCustomSet",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["RenameCustomSet"],
	funcPath = "C_TransmogCollection.RenameCustomSet",
	params = {
		{ name = "customSetID", type = "number", default = nil },
		{ name = "name", type = "cstring", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.SearchProgress"] = {
	key = "C_TransmogCollection.SearchProgress",
	name = "SearchProgress",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["SearchProgress"],
	funcPath = "C_TransmogCollection.SearchProgress",
	params = { { name = "searchType", type = "TransmogSearchType", default = nil } },
	returns = { { name = "progress", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.SearchSize"] = {
	key = "C_TransmogCollection.SearchSize",
	name = "SearchSize",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["SearchSize"],
	funcPath = "C_TransmogCollection.SearchSize",
	params = { { name = "searchType", type = "TransmogSearchType", default = nil } },
	returns = { { name = "size", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.SetAllCollectionTypeFilters"] = {
	key = "C_TransmogCollection.SetAllCollectionTypeFilters",
	name = "SetAllCollectionTypeFilters",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["SetAllCollectionTypeFilters"],
	funcPath = "C_TransmogCollection.SetAllCollectionTypeFilters",
	params = { { name = "checked", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.SetAllFactionsShown"] = {
	key = "C_TransmogCollection.SetAllFactionsShown",
	name = "SetAllFactionsShown",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["SetAllFactionsShown"],
	funcPath = "C_TransmogCollection.SetAllFactionsShown",
	params = { { name = "shown", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.SetAllRacesShown"] = {
	key = "C_TransmogCollection.SetAllRacesShown",
	name = "SetAllRacesShown",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["SetAllRacesShown"],
	funcPath = "C_TransmogCollection.SetAllRacesShown",
	params = { { name = "shown", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.SetAllSourceTypeFilters"] = {
	key = "C_TransmogCollection.SetAllSourceTypeFilters",
	name = "SetAllSourceTypeFilters",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["SetAllSourceTypeFilters"],
	funcPath = "C_TransmogCollection.SetAllSourceTypeFilters",
	params = { { name = "checked", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.SetClassFilter"] = {
	key = "C_TransmogCollection.SetClassFilter",
	name = "SetClassFilter",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["SetClassFilter"],
	funcPath = "C_TransmogCollection.SetClassFilter",
	params = { { name = "classID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.SetCollectedShown"] = {
	key = "C_TransmogCollection.SetCollectedShown",
	name = "SetCollectedShown",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["SetCollectedShown"],
	funcPath = "C_TransmogCollection.SetCollectedShown",
	params = { { name = "shown", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.SetIsAppearanceFavorite"] = {
	key = "C_TransmogCollection.SetIsAppearanceFavorite",
	name = "SetIsAppearanceFavorite",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["SetIsAppearanceFavorite"],
	funcPath = "C_TransmogCollection.SetIsAppearanceFavorite",
	params = {
		{ name = "itemAppearanceID", type = "number", default = nil },
		{ name = "isFavorite", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.SetSearch"] = {
	key = "C_TransmogCollection.SetSearch",
	name = "SetSearch",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["SetSearch"],
	funcPath = "C_TransmogCollection.SetSearch",
	params = {
		{ name = "searchType", type = "TransmogSearchType", default = nil },
		{ name = "searchText", type = "string", default = nil },
	},
	returns = { { name = "completed", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.SetSearchAndFilterCategory"] = {
	key = "C_TransmogCollection.SetSearchAndFilterCategory",
	name = "SetSearchAndFilterCategory",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["SetSearchAndFilterCategory"],
	funcPath = "C_TransmogCollection.SetSearchAndFilterCategory",
	params = { { name = "category", type = "TransmogCollectionType", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.SetSourceTypeFilter"] = {
	key = "C_TransmogCollection.SetSourceTypeFilter",
	name = "SetSourceTypeFilter",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["SetSourceTypeFilter"],
	funcPath = "C_TransmogCollection.SetSourceTypeFilter",
	params = {
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "checked", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogCollection.SetUncollectedShown"] = {
	key = "C_TransmogCollection.SetUncollectedShown",
	name = "SetUncollectedShown",
	category = "combat_midnight",
	subcategory = "c_transmogcollection",
	func = _G["C_TransmogCollection"] and _G["C_TransmogCollection"]["SetUncollectedShown"],
	funcPath = "C_TransmogCollection.SetUncollectedShown",
	params = { { name = "shown", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

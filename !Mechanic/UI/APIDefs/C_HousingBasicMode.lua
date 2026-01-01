-- Generated APIDefinitions for namespace: C_HousingBasicMode
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HousingBasicMode.RotateDecor"] = {
	key = "C_HousingBasicMode.RotateDecor",
	name = "RotateDecor",
	category = "combat_midnight",
	subcategory = "c_housingbasicmode",
	func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["RotateDecor"],
	funcPath = "C_HousingBasicMode.RotateDecor",
	params = { { name = "rotDegrees", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBasicMode.RotateHouseExterior"] = {
	key = "C_HousingBasicMode.RotateHouseExterior",
	name = "RotateHouseExterior",
	category = "combat_midnight",
	subcategory = "c_housingbasicmode",
	func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["RotateHouseExterior"],
	funcPath = "C_HousingBasicMode.RotateHouseExterior",
	params = { { name = "rotDegrees", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBasicMode.SetFreePlaceEnabled"] = {
	key = "C_HousingBasicMode.SetFreePlaceEnabled",
	name = "SetFreePlaceEnabled",
	category = "combat_midnight",
	subcategory = "c_housingbasicmode",
	func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["SetFreePlaceEnabled"],
	funcPath = "C_HousingBasicMode.SetFreePlaceEnabled",
	params = { { name = "freePlaceEnabled", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBasicMode.SetGridSnapEnabled"] = {
	key = "C_HousingBasicMode.SetGridSnapEnabled",
	name = "SetGridSnapEnabled",
	category = "combat_midnight",
	subcategory = "c_housingbasicmode",
	func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["SetGridSnapEnabled"],
	funcPath = "C_HousingBasicMode.SetGridSnapEnabled",
	params = { { name = "isGridSnapEnabled", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBasicMode.SetGridVisible"] = {
	key = "C_HousingBasicMode.SetGridVisible",
	name = "SetGridVisible",
	category = "combat_midnight",
	subcategory = "c_housingbasicmode",
	func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["SetGridVisible"],
	funcPath = "C_HousingBasicMode.SetGridVisible",
	params = { { name = "gridVisible", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBasicMode.StartPlacingNewDecor"] = {
	key = "C_HousingBasicMode.StartPlacingNewDecor",
	name = "StartPlacingNewDecor",
	category = "combat_midnight",
	subcategory = "c_housingbasicmode",
	func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["StartPlacingNewDecor"],
	funcPath = "C_HousingBasicMode.StartPlacingNewDecor",
	params = { { name = "catalogEntryID", type = "HousingCatalogEntryID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBasicMode.StartPlacingPreviewDecor"] = {
	key = "C_HousingBasicMode.StartPlacingPreviewDecor",
	name = "StartPlacingPreviewDecor",
	category = "combat_midnight",
	subcategory = "c_housingbasicmode",
	func = _G["C_HousingBasicMode"] and _G["C_HousingBasicMode"]["StartPlacingPreviewDecor"],
	funcPath = "C_HousingBasicMode.StartPlacingPreviewDecor",
	params = {
		{ name = "decorRecordID", type = "number", default = nil },
		{ name = "bundleCatalogShopProductID", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

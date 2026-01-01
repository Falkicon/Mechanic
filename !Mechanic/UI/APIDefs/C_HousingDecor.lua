-- Generated APIDefinitions for namespace: C_HousingDecor
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HousingDecor.GetDecorIcon"] = {
	key = "C_HousingDecor.GetDecorIcon",
	name = "GetDecorIcon",
	category = "combat_midnight",
	subcategory = "c_housingdecor",
	func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["GetDecorIcon"],
	funcPath = "C_HousingDecor.GetDecorIcon",
	params = { { name = "decorID", type = "number", default = nil } },
	returns = { { name = "icon", type = "fileID", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingDecor.GetDecorInstanceInfoForGUID"] = {
	key = "C_HousingDecor.GetDecorInstanceInfoForGUID",
	name = "GetDecorInstanceInfoForGUID",
	category = "combat_midnight",
	subcategory = "c_housingdecor",
	func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["GetDecorInstanceInfoForGUID"],
	funcPath = "C_HousingDecor.GetDecorInstanceInfoForGUID",
	params = { { name = "decorGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "info", type = "HousingDecorInstanceInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingDecor.GetDecorName"] = {
	key = "C_HousingDecor.GetDecorName",
	name = "GetDecorName",
	category = "combat_midnight",
	subcategory = "c_housingdecor",
	func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["GetDecorName"],
	funcPath = "C_HousingDecor.GetDecorName",
	params = { { name = "decorID", type = "number", default = nil } },
	returns = { { name = "name", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingDecor.IsModeDisabledForPreviewState"] = {
	key = "C_HousingDecor.IsModeDisabledForPreviewState",
	name = "IsModeDisabledForPreviewState",
	category = "combat_midnight",
	subcategory = "c_housingdecor",
	func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["IsModeDisabledForPreviewState"],
	funcPath = "C_HousingDecor.IsModeDisabledForPreviewState",
	params = { { name = "mode", type = "HouseEditorMode", default = nil } },
	returns = { { name = "isModeDisabled", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingDecor.RemovePlacedDecorEntry"] = {
	key = "C_HousingDecor.RemovePlacedDecorEntry",
	name = "RemovePlacedDecorEntry",
	category = "combat_midnight",
	subcategory = "c_housingdecor",
	func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["RemovePlacedDecorEntry"],
	funcPath = "C_HousingDecor.RemovePlacedDecorEntry",
	params = { { name = "decorGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingDecor.SetGridVisible"] = {
	key = "C_HousingDecor.SetGridVisible",
	name = "SetGridVisible",
	category = "combat_midnight",
	subcategory = "c_housingdecor",
	func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["SetGridVisible"],
	funcPath = "C_HousingDecor.SetGridVisible",
	params = { { name = "gridVisible", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingDecor.SetPlacedDecorEntryHovered"] = {
	key = "C_HousingDecor.SetPlacedDecorEntryHovered",
	name = "SetPlacedDecorEntryHovered",
	category = "combat_midnight",
	subcategory = "c_housingdecor",
	func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["SetPlacedDecorEntryHovered"],
	funcPath = "C_HousingDecor.SetPlacedDecorEntryHovered",
	params = {
		{ name = "decorGUID", type = "WOWGUID", default = nil },
		{ name = "hovered", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingDecor.SetPlacedDecorEntrySelected"] = {
	key = "C_HousingDecor.SetPlacedDecorEntrySelected",
	name = "SetPlacedDecorEntrySelected",
	category = "combat_midnight",
	subcategory = "c_housingdecor",
	func = _G["C_HousingDecor"] and _G["C_HousingDecor"]["SetPlacedDecorEntrySelected"],
	funcPath = "C_HousingDecor.SetPlacedDecorEntrySelected",
	params = {
		{ name = "decorGUID", type = "WOWGUID", default = nil },
		{ name = "selected", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

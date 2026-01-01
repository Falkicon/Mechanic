-- Generated APIDefinitions for namespace: C_BarberShop
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_BarberShop.ClearPreviewChoices"] = {
	key = "C_BarberShop.ClearPreviewChoices",
	name = "ClearPreviewChoices",
	category = "combat_midnight",
	subcategory = "c_barbershop",
	func = _G["C_BarberShop"] and _G["C_BarberShop"]["ClearPreviewChoices"],
	funcPath = "C_BarberShop.ClearPreviewChoices",
	params = { { name = "clearSavedChoices", type = "bool", default = false } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.HasCustomizationFeature"] = {
	key = "C_BarberShop.HasCustomizationFeature",
	name = "HasCustomizationFeature",
	category = "combat_midnight",
	subcategory = "c_barbershop",
	func = _G["C_BarberShop"] and _G["C_BarberShop"]["HasCustomizationFeature"],
	funcPath = "C_BarberShop.HasCustomizationFeature",
	params = { { name = "featureMask", type = "ChrModelFeatureFlags", default = nil } },
	returns = { { name = "hasCustomizationFeature", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.MarkCustomizationChoiceAsSeen"] = {
	key = "C_BarberShop.MarkCustomizationChoiceAsSeen",
	name = "MarkCustomizationChoiceAsSeen",
	category = "combat_midnight",
	subcategory = "c_barbershop",
	func = _G["C_BarberShop"] and _G["C_BarberShop"]["MarkCustomizationChoiceAsSeen"],
	funcPath = "C_BarberShop.MarkCustomizationChoiceAsSeen",
	params = { { name = "choiceID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.MarkCustomizationOptionAsSeen"] = {
	key = "C_BarberShop.MarkCustomizationOptionAsSeen",
	name = "MarkCustomizationOptionAsSeen",
	category = "combat_midnight",
	subcategory = "c_barbershop",
	func = _G["C_BarberShop"] and _G["C_BarberShop"]["MarkCustomizationOptionAsSeen"],
	funcPath = "C_BarberShop.MarkCustomizationOptionAsSeen",
	params = { { name = "optionID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.PreviewCustomizationChoice"] = {
	key = "C_BarberShop.PreviewCustomizationChoice",
	name = "PreviewCustomizationChoice",
	category = "combat_midnight",
	subcategory = "c_barbershop",
	func = _G["C_BarberShop"] and _G["C_BarberShop"]["PreviewCustomizationChoice"],
	funcPath = "C_BarberShop.PreviewCustomizationChoice",
	params = {
		{ name = "optionID", type = "number", default = nil },
		{ name = "choiceID", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.RotateCamera"] = {
	key = "C_BarberShop.RotateCamera",
	name = "RotateCamera",
	category = "combat_midnight",
	subcategory = "c_barbershop",
	func = _G["C_BarberShop"] and _G["C_BarberShop"]["RotateCamera"],
	funcPath = "C_BarberShop.RotateCamera",
	params = { { name = "diffDegrees", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SetCameraDistanceOffset"] = {
	key = "C_BarberShop.SetCameraDistanceOffset",
	name = "SetCameraDistanceOffset",
	category = "combat_midnight",
	subcategory = "c_barbershop",
	func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetCameraDistanceOffset"],
	funcPath = "C_BarberShop.SetCameraDistanceOffset",
	params = { { name = "offset", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SetCameraZoomLevel"] = {
	key = "C_BarberShop.SetCameraZoomLevel",
	name = "SetCameraZoomLevel",
	category = "combat_midnight",
	subcategory = "c_barbershop",
	func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetCameraZoomLevel"],
	funcPath = "C_BarberShop.SetCameraZoomLevel",
	params = {
		{ name = "zoomLevel", type = "number", default = nil },
		{ name = "keepCustomZoom", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SetCustomizationChoice"] = {
	key = "C_BarberShop.SetCustomizationChoice",
	name = "SetCustomizationChoice",
	category = "combat_midnight",
	subcategory = "c_barbershop",
	func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetCustomizationChoice"],
	funcPath = "C_BarberShop.SetCustomizationChoice",
	params = {
		{
			name = "optionID",
			type = "number",
			default = nil,
			examples = { { value = "choicePairs[i][1]", label = "Narcissus_Barbershop" } },
		},
		{ name = "choiceID", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SetModelDressState"] = {
	key = "C_BarberShop.SetModelDressState",
	name = "SetModelDressState",
	category = "combat_midnight",
	subcategory = "c_barbershop",
	func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetModelDressState"],
	funcPath = "C_BarberShop.SetModelDressState",
	params = { { name = "dressedState", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SetSelectedSex"] = {
	key = "C_BarberShop.SetSelectedSex",
	name = "SetSelectedSex",
	category = "combat_midnight",
	subcategory = "c_barbershop",
	func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetSelectedSex"],
	funcPath = "C_BarberShop.SetSelectedSex",
	params = { { name = "sex", type = "UnitSex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SetViewingAlteredForm"] = {
	key = "C_BarberShop.SetViewingAlteredForm",
	name = "SetViewingAlteredForm",
	category = "combat_midnight",
	subcategory = "c_barbershop",
	func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetViewingAlteredForm"],
	funcPath = "C_BarberShop.SetViewingAlteredForm",
	params = { { name = "isViewingAlteredForm", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SetViewingChrModel"] = {
	key = "C_BarberShop.SetViewingChrModel",
	name = "SetViewingChrModel",
	category = "combat_midnight",
	subcategory = "c_barbershop",
	func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetViewingChrModel"],
	funcPath = "C_BarberShop.SetViewingChrModel",
	params = {
		{ name = "chrModelID", type = "number", default = nil },
		{ name = "spellShapeshiftFormID", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.SetViewingShapeshiftForm"] = {
	key = "C_BarberShop.SetViewingShapeshiftForm",
	name = "SetViewingShapeshiftForm",
	category = "combat_midnight",
	subcategory = "c_barbershop",
	func = _G["C_BarberShop"] and _G["C_BarberShop"]["SetViewingShapeshiftForm"],
	funcPath = "C_BarberShop.SetViewingShapeshiftForm",
	params = { { name = "shapeshiftFormID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BarberShop.ZoomCamera"] = {
	key = "C_BarberShop.ZoomCamera",
	name = "ZoomCamera",
	category = "combat_midnight",
	subcategory = "c_barbershop",
	func = _G["C_BarberShop"] and _G["C_BarberShop"]["ZoomCamera"],
	funcPath = "C_BarberShop.ZoomCamera",
	params = { { name = "zoomAmount", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_PerksProgram
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PerksProgram.GetCategoryInfo"] = {
	key = "C_PerksProgram.GetCategoryInfo",
	name = "GetCategoryInfo",
	category = "combat_midnight",
	subcategory = "c_perksprogram",
	func = _G["C_PerksProgram"] and _G["C_PerksProgram"]["GetCategoryInfo"],
	funcPath = "C_PerksProgram.GetCategoryInfo",
	params = {
		{
			name = "categoryID",
			type = "number",
			default = nil,
			examples = {
				{ value = 15301, label = "AllTheThings" },
				{ value = 14941, label = "AllTheThings" },
				{ value = 15304, label = "AllTheThings" },
			},
		},
	},
	returns = { { name = "categoryInfo", type = "PerksVendorCategoryInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.GetPerksProgramItemDisplayInfo"] = {
	key = "C_PerksProgram.GetPerksProgramItemDisplayInfo",
	name = "GetPerksProgramItemDisplayInfo",
	category = "combat_midnight",
	subcategory = "c_perksprogram",
	func = _G["C_PerksProgram"] and _G["C_PerksProgram"]["GetPerksProgramItemDisplayInfo"],
	funcPath = "C_PerksProgram.GetPerksProgramItemDisplayInfo",
	params = { { name = "id", type = "number", default = nil } },
	returns = { { name = "item", type = "PerksProgramItemDisplayInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.GetTimeRemaining"] = {
	key = "C_PerksProgram.GetTimeRemaining",
	name = "GetTimeRemaining",
	category = "combat_midnight",
	subcategory = "c_perksprogram",
	func = _G["C_PerksProgram"] and _G["C_PerksProgram"]["GetTimeRemaining"],
	funcPath = "C_PerksProgram.GetTimeRemaining",
	params = { { name = "vendorItemID", type = "number", default = nil } },
	returns = { { name = "timeRemaining", type = "time_t", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.GetVendorItemInfo"] = {
	key = "C_PerksProgram.GetVendorItemInfo",
	name = "GetVendorItemInfo",
	category = "combat_midnight",
	subcategory = "c_perksprogram",
	func = _G["C_PerksProgram"] and _G["C_PerksProgram"]["GetVendorItemInfo"],
	funcPath = "C_PerksProgram.GetVendorItemInfo",
	params = {
		{ name = "vendorItemID", type = "number", default = nil, examples = { { value = 110, label = "Narcissus" } } },
	},
	returns = { { name = "vendorItemInfo", type = "PerksVendorItemInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.GetVendorItemInfoRefundTimeLeft"] = {
	key = "C_PerksProgram.GetVendorItemInfoRefundTimeLeft",
	name = "GetVendorItemInfoRefundTimeLeft",
	category = "combat_midnight",
	subcategory = "c_perksprogram",
	func = _G["C_PerksProgram"] and _G["C_PerksProgram"]["GetVendorItemInfoRefundTimeLeft"],
	funcPath = "C_PerksProgram.GetVendorItemInfoRefundTimeLeft",
	params = { { name = "vendorItemID", type = "number", default = nil } },
	returns = { { name = "refundTimeRemaining", type = "time_t", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.IsFrozenPerksVendorItem"] = {
	key = "C_PerksProgram.IsFrozenPerksVendorItem",
	name = "IsFrozenPerksVendorItem",
	category = "combat_midnight",
	subcategory = "c_perksprogram",
	func = _G["C_PerksProgram"] and _G["C_PerksProgram"]["IsFrozenPerksVendorItem"],
	funcPath = "C_PerksProgram.IsFrozenPerksVendorItem",
	params = { { name = "perksVendorItemID", type = "number", default = nil } },
	returns = { { name = "isFrozen", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.ItemSelectedTelemetry"] = {
	key = "C_PerksProgram.ItemSelectedTelemetry",
	name = "ItemSelectedTelemetry",
	category = "combat_midnight",
	subcategory = "c_perksprogram",
	func = _G["C_PerksProgram"] and _G["C_PerksProgram"]["ItemSelectedTelemetry"],
	funcPath = "C_PerksProgram.ItemSelectedTelemetry",
	params = { { name = "perksVendorItemID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.PickupPerksVendorItem"] = {
	key = "C_PerksProgram.PickupPerksVendorItem",
	name = "PickupPerksVendorItem",
	category = "combat_midnight",
	subcategory = "c_perksprogram",
	func = _G["C_PerksProgram"] and _G["C_PerksProgram"]["PickupPerksVendorItem"],
	funcPath = "C_PerksProgram.PickupPerksVendorItem",
	params = { { name = "perksVendorItemID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.RequestCartCheckout"] = {
	key = "C_PerksProgram.RequestCartCheckout",
	name = "RequestCartCheckout",
	category = "combat_midnight",
	subcategory = "c_perksprogram",
	func = _G["C_PerksProgram"] and _G["C_PerksProgram"]["RequestCartCheckout"],
	funcPath = "C_PerksProgram.RequestCartCheckout",
	params = { { name = "perksVendorItemIDs", type = "table", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.RequestPurchase"] = {
	key = "C_PerksProgram.RequestPurchase",
	name = "RequestPurchase",
	category = "combat_midnight",
	subcategory = "c_perksprogram",
	func = _G["C_PerksProgram"] and _G["C_PerksProgram"]["RequestPurchase"],
	funcPath = "C_PerksProgram.RequestPurchase",
	params = { { name = "perksVendorItemID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.RequestRefund"] = {
	key = "C_PerksProgram.RequestRefund",
	name = "RequestRefund",
	category = "combat_midnight",
	subcategory = "c_perksprogram",
	func = _G["C_PerksProgram"] and _G["C_PerksProgram"]["RequestRefund"],
	funcPath = "C_PerksProgram.RequestRefund",
	params = { { name = "perksVendorItemID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

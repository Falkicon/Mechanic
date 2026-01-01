-- Generated APIDefinitions for namespace: C_AzeriteEmpoweredItem
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AzeriteEmpoweredItem.CanSelectPower"] = {
	key = "C_AzeriteEmpoweredItem.CanSelectPower",
	name = "CanSelectPower",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["CanSelectPower"],
	funcPath = "C_AzeriteEmpoweredItem.CanSelectPower",
	params = {
		{ name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil },
		{ name = "powerID", type = "number", default = nil },
	},
	returns = { { name = "canSelect", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.ConfirmAzeriteEmpoweredItemRespec"] = {
	key = "C_AzeriteEmpoweredItem.ConfirmAzeriteEmpoweredItemRespec",
	name = "ConfirmAzeriteEmpoweredItemRespec",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["ConfirmAzeriteEmpoweredItemRespec"],
	funcPath = "C_AzeriteEmpoweredItem.ConfirmAzeriteEmpoweredItemRespec",
	params = { { name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.GetAllTierInfo"] = {
	key = "C_AzeriteEmpoweredItem.GetAllTierInfo",
	name = "GetAllTierInfo",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["GetAllTierInfo"],
	funcPath = "C_AzeriteEmpoweredItem.GetAllTierInfo",
	params = { { name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil } },
	returns = { { name = "tierInfo", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.GetAllTierInfoByItemID"] = {
	key = "C_AzeriteEmpoweredItem.GetAllTierInfoByItemID",
	name = "GetAllTierInfoByItemID",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["GetAllTierInfoByItemID"],
	funcPath = "C_AzeriteEmpoweredItem.GetAllTierInfoByItemID",
	params = {
		{ name = "itemInfo", type = "ItemInfo", default = nil },
		{ name = "classID", type = "number", default = nil },
	},
	returns = { { name = "tierInfo", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.GetPowerInfo"] = {
	key = "C_AzeriteEmpoweredItem.GetPowerInfo",
	name = "GetPowerInfo",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["GetPowerInfo"],
	funcPath = "C_AzeriteEmpoweredItem.GetPowerInfo",
	params = { { name = "powerID", type = "number", default = nil } },
	returns = { { name = "powerInfo", type = "AzeriteEmpoweredItemPowerInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.GetPowerText"] = {
	key = "C_AzeriteEmpoweredItem.GetPowerText",
	name = "GetPowerText",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["GetPowerText"],
	funcPath = "C_AzeriteEmpoweredItem.GetPowerText",
	params = {
		{
			name = "azeriteEmpoweredItemLocation",
			type = "AzeriteEmpoweredItemLocation",
			default = nil,
			examples = { { value = "itemLocation", label = "Narcissus" } },
		},
		{ name = "powerID", type = "number", default = nil },
		{ name = "level", type = "AzeritePowerLevel", default = nil },
	},
	returns = { { name = "powerText", type = "AzeriteEmpoweredItemPowerText", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.GetSpecsForPower"] = {
	key = "C_AzeriteEmpoweredItem.GetSpecsForPower",
	name = "GetSpecsForPower",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["GetSpecsForPower"],
	funcPath = "C_AzeriteEmpoweredItem.GetSpecsForPower",
	params = { { name = "powerID", type = "number", default = nil } },
	returns = { { name = "specInfo", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.HasAnyUnselectedPowers"] = {
	key = "C_AzeriteEmpoweredItem.HasAnyUnselectedPowers",
	name = "HasAnyUnselectedPowers",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["HasAnyUnselectedPowers"],
	funcPath = "C_AzeriteEmpoweredItem.HasAnyUnselectedPowers",
	params = { { name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil } },
	returns = { { name = "hasAnyUnselectedPowers", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.HasBeenViewed"] = {
	key = "C_AzeriteEmpoweredItem.HasBeenViewed",
	name = "HasBeenViewed",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["HasBeenViewed"],
	funcPath = "C_AzeriteEmpoweredItem.HasBeenViewed",
	params = { { name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil } },
	returns = { { name = "hasBeenViewed", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItem"] = {
	key = "C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItem",
	name = "IsAzeriteEmpoweredItem",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["IsAzeriteEmpoweredItem"],
	funcPath = "C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItem",
	params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
	returns = { { name = "isAzeriteEmpoweredItem", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID"] = {
	key = "C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID",
	name = "IsAzeriteEmpoweredItemByID",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["IsAzeriteEmpoweredItemByID"],
	funcPath = "C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "isAzeriteEmpoweredItem", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.IsAzeritePreviewSourceDisplayable"] = {
	key = "C_AzeriteEmpoweredItem.IsAzeritePreviewSourceDisplayable",
	name = "IsAzeritePreviewSourceDisplayable",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["IsAzeritePreviewSourceDisplayable"],
	funcPath = "C_AzeriteEmpoweredItem.IsAzeritePreviewSourceDisplayable",
	params = {
		{ name = "itemInfo", type = "ItemInfo", default = nil },
		{ name = "classID", type = "number", default = nil },
	},
	returns = { { name = "isAzeritePreviewSourceDisplayable", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.IsPowerAvailableForSpec"] = {
	key = "C_AzeriteEmpoweredItem.IsPowerAvailableForSpec",
	name = "IsPowerAvailableForSpec",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["IsPowerAvailableForSpec"],
	funcPath = "C_AzeriteEmpoweredItem.IsPowerAvailableForSpec",
	params = {
		{
			name = "powerID",
			type = "number",
			default = nil,
			examples = { { value = "TraitsCache[i][1]", label = "Narcissus" } },
		},
		{ name = "specID", type = "number", default = nil },
	},
	returns = { { name = "isPowerAvailableForSpec", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.IsPowerSelected"] = {
	key = "C_AzeriteEmpoweredItem.IsPowerSelected",
	name = "IsPowerSelected",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["IsPowerSelected"],
	funcPath = "C_AzeriteEmpoweredItem.IsPowerSelected",
	params = {
		{ name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil },
		{ name = "powerID", type = "number", default = nil },
	},
	returns = { { name = "isSelected", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.SelectPower"] = {
	key = "C_AzeriteEmpoweredItem.SelectPower",
	name = "SelectPower",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["SelectPower"],
	funcPath = "C_AzeriteEmpoweredItem.SelectPower",
	params = {
		{ name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil },
		{ name = "powerID", type = "number", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.SetHasBeenViewed"] = {
	key = "C_AzeriteEmpoweredItem.SetHasBeenViewed",
	name = "SetHasBeenViewed",
	category = "combat_midnight",
	subcategory = "c_azeriteempowereditem",
	func = _G["C_AzeriteEmpoweredItem"] and _G["C_AzeriteEmpoweredItem"]["SetHasBeenViewed"],
	funcPath = "C_AzeriteEmpoweredItem.SetHasBeenViewed",
	params = { { name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_TransmogSets
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_TransmogSets.ClearNewSource"] = {
	key = "C_TransmogSets.ClearNewSource",
	name = "ClearNewSource",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["ClearNewSource"],
	funcPath = "C_TransmogSets.ClearNewSource",
	params = { { name = "sourceID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.ClearSetNewSourcesForSlot"] = {
	key = "C_TransmogSets.ClearSetNewSourcesForSlot",
	name = "ClearSetNewSourcesForSlot",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["ClearSetNewSourcesForSlot"],
	funcPath = "C_TransmogSets.ClearSetNewSourcesForSlot",
	params = {
		{ name = "transmogSetID", type = "number", default = nil },
		{ name = "slot", type = "luaIndex", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetAllSourceIDs"] = {
	key = "C_TransmogSets.GetAllSourceIDs",
	name = "GetAllSourceIDs",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["GetAllSourceIDs"],
	funcPath = "C_TransmogSets.GetAllSourceIDs",
	params = { { name = "transmogSetID", type = "number", default = nil } },
	returns = { { name = "sources", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetBaseSetID"] = {
	key = "C_TransmogSets.GetBaseSetID",
	name = "GetBaseSetID",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["GetBaseSetID"],
	funcPath = "C_TransmogSets.GetBaseSetID",
	params = { { name = "transmogSetID", type = "number", default = nil } },
	returns = { { name = "baseTransmogSetID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetBaseSetsFilter"] = {
	key = "C_TransmogSets.GetBaseSetsFilter",
	name = "GetBaseSetsFilter",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["GetBaseSetsFilter"],
	funcPath = "C_TransmogSets.GetBaseSetsFilter",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "isChecked", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetIsFavorite"] = {
	key = "C_TransmogSets.GetIsFavorite",
	name = "GetIsFavorite",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["GetIsFavorite"],
	funcPath = "C_TransmogSets.GetIsFavorite",
	params = { { name = "transmogSetID", type = "number", default = nil } },
	returns = {
		{ name = "isFavorite", type = "bool", canBeSecret = false },
		{ name = "isGroupFavorite", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetSetInfo"] = {
	key = "C_TransmogSets.GetSetInfo",
	name = "GetSetInfo",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["GetSetInfo"],
	funcPath = "C_TransmogSets.GetSetInfo",
	params = { { name = "transmogSetID", type = "number", default = nil } },
	returns = { { name = "set", type = "TransmogSetInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetSetNewSources"] = {
	key = "C_TransmogSets.GetSetNewSources",
	name = "GetSetNewSources",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["GetSetNewSources"],
	funcPath = "C_TransmogSets.GetSetNewSources",
	params = { { name = "transmogSetID", type = "number", default = nil } },
	returns = { { name = "sourceIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetSetPrimaryAppearances"] = {
	key = "C_TransmogSets.GetSetPrimaryAppearances",
	name = "GetSetPrimaryAppearances",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["GetSetPrimaryAppearances"],
	funcPath = "C_TransmogSets.GetSetPrimaryAppearances",
	params = { { name = "transmogSetID", type = "number", default = nil } },
	returns = { { name = "apppearances", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetSetsContainingSourceID"] = {
	key = "C_TransmogSets.GetSetsContainingSourceID",
	name = "GetSetsContainingSourceID",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["GetSetsContainingSourceID"],
	funcPath = "C_TransmogSets.GetSetsContainingSourceID",
	params = { { name = "sourceID", type = "number", default = nil } },
	returns = { { name = "setIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetSetsFilter"] = {
	key = "C_TransmogSets.GetSetsFilter",
	name = "GetSetsFilter",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["GetSetsFilter"],
	funcPath = "C_TransmogSets.GetSetsFilter",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "isChecked", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetSourceIDsForSlot"] = {
	key = "C_TransmogSets.GetSourceIDsForSlot",
	name = "GetSourceIDsForSlot",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["GetSourceIDsForSlot"],
	funcPath = "C_TransmogSets.GetSourceIDsForSlot",
	params = {
		{ name = "transmogSetID", type = "number", default = nil },
		{ name = "slot", type = "luaIndex", default = nil },
	},
	returns = { { name = "sources", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetSourcesForSlot"] = {
	key = "C_TransmogSets.GetSourcesForSlot",
	name = "GetSourcesForSlot",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["GetSourcesForSlot"],
	funcPath = "C_TransmogSets.GetSourcesForSlot",
	params = {
		{ name = "transmogSetID", type = "number", default = nil },
		{ name = "slot", type = "luaIndex", default = nil },
	},
	returns = { { name = "sources", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetValidClassForSet"] = {
	key = "C_TransmogSets.GetValidClassForSet",
	name = "GetValidClassForSet",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["GetValidClassForSet"],
	funcPath = "C_TransmogSets.GetValidClassForSet",
	params = { { name = "transmogSetID", type = "number", default = nil } },
	returns = { { name = "classID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.GetVariantSets"] = {
	key = "C_TransmogSets.GetVariantSets",
	name = "GetVariantSets",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["GetVariantSets"],
	funcPath = "C_TransmogSets.GetVariantSets",
	params = { { name = "transmogSetID", type = "number", default = nil } },
	returns = { { name = "sets", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.IsBaseSetCollected"] = {
	key = "C_TransmogSets.IsBaseSetCollected",
	name = "IsBaseSetCollected",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["IsBaseSetCollected"],
	funcPath = "C_TransmogSets.IsBaseSetCollected",
	params = { { name = "transmogSetID", type = "number", default = nil } },
	returns = { { name = "isCollected", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.IsNewSource"] = {
	key = "C_TransmogSets.IsNewSource",
	name = "IsNewSource",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["IsNewSource"],
	funcPath = "C_TransmogSets.IsNewSource",
	params = { { name = "sourceID", type = "number", default = nil } },
	returns = { { name = "isNew", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.IsSetVisible"] = {
	key = "C_TransmogSets.IsSetVisible",
	name = "IsSetVisible",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["IsSetVisible"],
	funcPath = "C_TransmogSets.IsSetVisible",
	params = { { name = "transmogSetID", type = "number", default = nil } },
	returns = { { name = "isVisible", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.SetBaseSetsFilter"] = {
	key = "C_TransmogSets.SetBaseSetsFilter",
	name = "SetBaseSetsFilter",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["SetBaseSetsFilter"],
	funcPath = "C_TransmogSets.SetBaseSetsFilter",
	params = {
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "isChecked", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.SetHasNewSources"] = {
	key = "C_TransmogSets.SetHasNewSources",
	name = "SetHasNewSources",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["SetHasNewSources"],
	funcPath = "C_TransmogSets.SetHasNewSources",
	params = { { name = "transmogSetID", type = "number", default = nil } },
	returns = { { name = "hasNewSources", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.SetHasNewSourcesForSlot"] = {
	key = "C_TransmogSets.SetHasNewSourcesForSlot",
	name = "SetHasNewSourcesForSlot",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["SetHasNewSourcesForSlot"],
	funcPath = "C_TransmogSets.SetHasNewSourcesForSlot",
	params = {
		{ name = "transmogSetID", type = "number", default = nil },
		{ name = "slot", type = "luaIndex", default = nil },
	},
	returns = { { name = "hasNewSources", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.SetIsFavorite"] = {
	key = "C_TransmogSets.SetIsFavorite",
	name = "SetIsFavorite",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["SetIsFavorite"],
	funcPath = "C_TransmogSets.SetIsFavorite",
	params = {
		{ name = "transmogSetID", type = "number", default = nil },
		{ name = "isFavorite", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.SetSetsFilter"] = {
	key = "C_TransmogSets.SetSetsFilter",
	name = "SetSetsFilter",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["SetSetsFilter"],
	funcPath = "C_TransmogSets.SetSetsFilter",
	params = {
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "isChecked", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogSets.SetTransmogSetsClassFilter"] = {
	key = "C_TransmogSets.SetTransmogSetsClassFilter",
	name = "SetTransmogSetsClassFilter",
	category = "combat_midnight",
	subcategory = "c_transmogsets",
	func = _G["C_TransmogSets"] and _G["C_TransmogSets"]["SetTransmogSetsClassFilter"],
	funcPath = "C_TransmogSets.SetTransmogSetsClassFilter",
	params = { { name = "classID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

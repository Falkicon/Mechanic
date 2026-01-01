-- Generated APIDefinitions for namespace: C_TransmogOutfitInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_TransmogOutfitInfo.AddNewOutfit"] = {
	key = "C_TransmogOutfitInfo.AddNewOutfit",
	name = "AddNewOutfit",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["AddNewOutfit"],
	funcPath = "C_TransmogOutfitInfo.AddNewOutfit",
	params = { { name = "name", type = "cstring", default = nil }, { name = "icon", type = "fileID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.ChangeDisplayedOutfit"] = {
	key = "C_TransmogOutfitInfo.ChangeDisplayedOutfit",
	name = "ChangeDisplayedOutfit",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["ChangeDisplayedOutfit"],
	funcPath = "C_TransmogOutfitInfo.ChangeDisplayedOutfit",
	params = {
		{ name = "outfitID", type = "number", default = nil, examples = { { value = 2, label = "Plumber" } } },
		{ name = "trigger", type = "TransmogSituationTrigger", default = nil },
		{ name = "toggleLock", type = "bool", default = nil },
		{ name = "allowRemoveOutfit", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.ChangeViewedOutfit"] = {
	key = "C_TransmogOutfitInfo.ChangeViewedOutfit",
	name = "ChangeViewedOutfit",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["ChangeViewedOutfit"],
	funcPath = "C_TransmogOutfitInfo.ChangeViewedOutfit",
	params = { { name = "outfitID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.ClearDisplayedOutfit"] = {
	key = "C_TransmogOutfitInfo.ClearDisplayedOutfit",
	name = "ClearDisplayedOutfit",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["ClearDisplayedOutfit"],
	funcPath = "C_TransmogOutfitInfo.ClearDisplayedOutfit",
	params = {
		{ name = "trigger", type = "TransmogSituationTrigger", default = nil },
		{ name = "toggleLock", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.CommitOutfitInfo"] = {
	key = "C_TransmogOutfitInfo.CommitOutfitInfo",
	name = "CommitOutfitInfo",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["CommitOutfitInfo"],
	funcPath = "C_TransmogOutfitInfo.CommitOutfitInfo",
	params = {
		{ name = "outfitID", type = "number", default = nil },
		{ name = "name", type = "cstring", default = nil },
		{ name = "icon", type = "fileID", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetCollectionInfoForSlotAndOption"] = {
	key = "C_TransmogOutfitInfo.GetCollectionInfoForSlotAndOption",
	name = "GetCollectionInfoForSlotAndOption",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetCollectionInfoForSlotAndOption"],
	funcPath = "C_TransmogOutfitInfo.GetCollectionInfoForSlotAndOption",
	params = {
		{ name = "slot", type = "TransmogOutfitSlot", default = nil },
		{ name = "weaponOption", type = "TransmogOutfitSlotOption", default = nil },
		{ name = "collectionType", type = "TransmogCollectionType", default = nil },
	},
	returns = { { name = "collectionInfo", type = "TransmogOutfitWeaponCollectionInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetEquippedSlotOptionFromTransmogSlot"] = {
	key = "C_TransmogOutfitInfo.GetEquippedSlotOptionFromTransmogSlot",
	name = "GetEquippedSlotOptionFromTransmogSlot",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetEquippedSlotOptionFromTransmogSlot"],
	funcPath = "C_TransmogOutfitInfo.GetEquippedSlotOptionFromTransmogSlot",
	params = { { name = "slot", type = "TransmogOutfitSlot", default = nil } },
	returns = { { name = "weaponOption", type = "TransmogOutfitSlotOption", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetIllusionDefaultIMAIDForCollectionType"] = {
	key = "C_TransmogOutfitInfo.GetIllusionDefaultIMAIDForCollectionType",
	name = "GetIllusionDefaultIMAIDForCollectionType",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetIllusionDefaultIMAIDForCollectionType"],
	funcPath = "C_TransmogOutfitInfo.GetIllusionDefaultIMAIDForCollectionType",
	params = { { name = "collectionType", type = "TransmogCollectionType", default = nil } },
	returns = { { name = "imaID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetLinkedSlotInfo"] = {
	key = "C_TransmogOutfitInfo.GetLinkedSlotInfo",
	name = "GetLinkedSlotInfo",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetLinkedSlotInfo"],
	funcPath = "C_TransmogOutfitInfo.GetLinkedSlotInfo",
	params = { { name = "slot", type = "TransmogOutfitSlot", default = nil } },
	returns = { { name = "linkedSlotInfo", type = "TransmogOutfitLinkedSlotInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetMaxNumberOfTotalOutfitsForSource"] = {
	key = "C_TransmogOutfitInfo.GetMaxNumberOfTotalOutfitsForSource",
	name = "GetMaxNumberOfTotalOutfitsForSource",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetMaxNumberOfTotalOutfitsForSource"],
	funcPath = "C_TransmogOutfitInfo.GetMaxNumberOfTotalOutfitsForSource",
	params = { { name = "source", type = "TransmogOutfitEntrySource", default = nil } },
	returns = { { name = "maxOutfitCount", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetNumberOfOutfitsUnlockedForSource"] = {
	key = "C_TransmogOutfitInfo.GetNumberOfOutfitsUnlockedForSource",
	name = "GetNumberOfOutfitsUnlockedForSource",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetNumberOfOutfitsUnlockedForSource"],
	funcPath = "C_TransmogOutfitInfo.GetNumberOfOutfitsUnlockedForSource",
	params = { { name = "source", type = "TransmogOutfitEntrySource", default = nil } },
	returns = { { name = "unlockedOutfitCount", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetOutfitInfo"] = {
	key = "C_TransmogOutfitInfo.GetOutfitInfo",
	name = "GetOutfitInfo",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetOutfitInfo"],
	funcPath = "C_TransmogOutfitInfo.GetOutfitInfo",
	params = {
		{ name = "outfitID", type = "number", default = nil, examples = { { value = "ID", label = "Plumber" } } },
	},
	returns = { { name = "outfitsInfo", type = "TransmogOutfitEntryInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetOutfitSituation"] = {
	key = "C_TransmogOutfitInfo.GetOutfitSituation",
	name = "GetOutfitSituation",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetOutfitSituation"],
	funcPath = "C_TransmogOutfitInfo.GetOutfitSituation",
	params = { { name = "option", type = "TransmogSituationOption", default = nil } },
	returns = { { name = "value", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetSecondarySlotState"] = {
	key = "C_TransmogOutfitInfo.GetSecondarySlotState",
	name = "GetSecondarySlotState",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetSecondarySlotState"],
	funcPath = "C_TransmogOutfitInfo.GetSecondarySlotState",
	params = { { name = "slot", type = "TransmogOutfitSlot", default = nil } },
	returns = { { name = "state", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetSetSourcesForSlot"] = {
	key = "C_TransmogOutfitInfo.GetSetSourcesForSlot",
	name = "GetSetSourcesForSlot",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetSetSourcesForSlot"],
	funcPath = "C_TransmogOutfitInfo.GetSetSourcesForSlot",
	params = {
		{ name = "transmogSetID", type = "number", default = nil },
		{ name = "slot", type = "TransmogOutfitSlot", default = nil },
	},
	returns = { { name = "sources", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetSourceIDsForSlot"] = {
	key = "C_TransmogOutfitInfo.GetSourceIDsForSlot",
	name = "GetSourceIDsForSlot",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetSourceIDsForSlot"],
	funcPath = "C_TransmogOutfitInfo.GetSourceIDsForSlot",
	params = {
		{ name = "transmogSetID", type = "number", default = nil },
		{ name = "slot", type = "TransmogOutfitSlot", default = nil },
	},
	returns = { { name = "sources", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetTransmogOutfitSlotForInventoryType"] = {
	key = "C_TransmogOutfitInfo.GetTransmogOutfitSlotForInventoryType",
	name = "GetTransmogOutfitSlotForInventoryType",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetTransmogOutfitSlotForInventoryType"],
	funcPath = "C_TransmogOutfitInfo.GetTransmogOutfitSlotForInventoryType",
	params = { { name = "inventoryType", type = "luaIndex", default = nil } },
	returns = { { name = "slot", type = "TransmogOutfitSlot", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetTransmogOutfitSlotFromInventorySlot"] = {
	key = "C_TransmogOutfitInfo.GetTransmogOutfitSlotFromInventorySlot",
	name = "GetTransmogOutfitSlotFromInventorySlot",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetTransmogOutfitSlotFromInventorySlot"],
	funcPath = "C_TransmogOutfitInfo.GetTransmogOutfitSlotFromInventorySlot",
	params = {
		{
			name = "inventorySlot",
			type = "InventorySlots",
			default = nil,
			examples = { { value = "slotID - 1", label = "Narcissus" } },
		},
	},
	returns = { { name = "slot", type = "TransmogOutfitSlot", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetUnassignedAtlasForSlot"] = {
	key = "C_TransmogOutfitInfo.GetUnassignedAtlasForSlot",
	name = "GetUnassignedAtlasForSlot",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetUnassignedAtlasForSlot"],
	funcPath = "C_TransmogOutfitInfo.GetUnassignedAtlasForSlot",
	params = { { name = "slot", type = "TransmogOutfitSlot", default = nil } },
	returns = { { name = "atlas", type = "textureAtlas", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetUnassignedDisplayAtlasForSlot"] = {
	key = "C_TransmogOutfitInfo.GetUnassignedDisplayAtlasForSlot",
	name = "GetUnassignedDisplayAtlasForSlot",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetUnassignedDisplayAtlasForSlot"],
	funcPath = "C_TransmogOutfitInfo.GetUnassignedDisplayAtlasForSlot",
	params = { { name = "slot", type = "TransmogOutfitSlot", default = nil } },
	returns = { { name = "atlas", type = "textureAtlas", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetViewedOutfitSlotInfo"] = {
	key = "C_TransmogOutfitInfo.GetViewedOutfitSlotInfo",
	name = "GetViewedOutfitSlotInfo",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetViewedOutfitSlotInfo"],
	funcPath = "C_TransmogOutfitInfo.GetViewedOutfitSlotInfo",
	params = {
		{ name = "slot", type = "TransmogOutfitSlot", default = nil },
		{ name = "type", type = "TransmogType", default = nil },
		{ name = "option", type = "TransmogOutfitSlotOption", default = nil },
	},
	returns = { { name = "slotInfo", type = "ViewedTransmogOutfitSlotInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.GetWeaponOptionsForSlot"] = {
	key = "C_TransmogOutfitInfo.GetWeaponOptionsForSlot",
	name = "GetWeaponOptionsForSlot",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["GetWeaponOptionsForSlot"],
	funcPath = "C_TransmogOutfitInfo.GetWeaponOptionsForSlot",
	params = { { name = "slot", type = "TransmogOutfitSlot", default = nil } },
	returns = {
		{ name = "weaponOptions", type = "table", canBeSecret = false },
		{ name = "artifactOptions", type = "table", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.IsLockedOutfit"] = {
	key = "C_TransmogOutfitInfo.IsLockedOutfit",
	name = "IsLockedOutfit",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["IsLockedOutfit"],
	funcPath = "C_TransmogOutfitInfo.IsLockedOutfit",
	params = { { name = "outfitID", type = "number", default = nil } },
	returns = { { name = "isLocked", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.IsSlotWeaponSlot"] = {
	key = "C_TransmogOutfitInfo.IsSlotWeaponSlot",
	name = "IsSlotWeaponSlot",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["IsSlotWeaponSlot"],
	funcPath = "C_TransmogOutfitInfo.IsSlotWeaponSlot",
	params = { { name = "slot", type = "TransmogOutfitSlot", default = nil } },
	returns = { { name = "isWeaponSlot", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.IsValidTransmogOutfitName"] = {
	key = "C_TransmogOutfitInfo.IsValidTransmogOutfitName",
	name = "IsValidTransmogOutfitName",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["IsValidTransmogOutfitName"],
	funcPath = "C_TransmogOutfitInfo.IsValidTransmogOutfitName",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = { { name = "isApproved", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.PickupOutfit"] = {
	key = "C_TransmogOutfitInfo.PickupOutfit",
	name = "PickupOutfit",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["PickupOutfit"],
	funcPath = "C_TransmogOutfitInfo.PickupOutfit",
	params = { { name = "outfitID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.RevertPendingTransmog"] = {
	key = "C_TransmogOutfitInfo.RevertPendingTransmog",
	name = "RevertPendingTransmog",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["RevertPendingTransmog"],
	funcPath = "C_TransmogOutfitInfo.RevertPendingTransmog",
	params = {
		{ name = "slot", type = "TransmogOutfitSlot", default = nil },
		{ name = "type", type = "TransmogType", default = nil },
		{ name = "option", type = "TransmogOutfitSlotOption", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.SetOutfitSituationsEnabled"] = {
	key = "C_TransmogOutfitInfo.SetOutfitSituationsEnabled",
	name = "SetOutfitSituationsEnabled",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["SetOutfitSituationsEnabled"],
	funcPath = "C_TransmogOutfitInfo.SetOutfitSituationsEnabled",
	params = { { name = "enabled", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.SetOutfitToCustomSet"] = {
	key = "C_TransmogOutfitInfo.SetOutfitToCustomSet",
	name = "SetOutfitToCustomSet",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["SetOutfitToCustomSet"],
	funcPath = "C_TransmogOutfitInfo.SetOutfitToCustomSet",
	params = { { name = "transmogCustomSetID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.SetOutfitToSet"] = {
	key = "C_TransmogOutfitInfo.SetOutfitToSet",
	name = "SetOutfitToSet",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["SetOutfitToSet"],
	funcPath = "C_TransmogOutfitInfo.SetOutfitToSet",
	params = { { name = "transmogSetID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.SetPendingTransmog"] = {
	key = "C_TransmogOutfitInfo.SetPendingTransmog",
	name = "SetPendingTransmog",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["SetPendingTransmog"],
	funcPath = "C_TransmogOutfitInfo.SetPendingTransmog",
	params = {
		{ name = "slot", type = "TransmogOutfitSlot", default = nil },
		{ name = "type", type = "TransmogType", default = nil },
		{ name = "option", type = "TransmogOutfitSlotOption", default = nil },
		{ name = "transmogID", type = "number", default = nil },
		{ name = "displayType", type = "TransmogOutfitDisplayType", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.SetSecondarySlotState"] = {
	key = "C_TransmogOutfitInfo.SetSecondarySlotState",
	name = "SetSecondarySlotState",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["SetSecondarySlotState"],
	funcPath = "C_TransmogOutfitInfo.SetSecondarySlotState",
	params = {
		{ name = "slot", type = "TransmogOutfitSlot", default = nil },
		{ name = "state", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.SetViewedWeaponOptionForSlot"] = {
	key = "C_TransmogOutfitInfo.SetViewedWeaponOptionForSlot",
	name = "SetViewedWeaponOptionForSlot",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["SetViewedWeaponOptionForSlot"],
	funcPath = "C_TransmogOutfitInfo.SetViewedWeaponOptionForSlot",
	params = {
		{ name = "slot", type = "TransmogOutfitSlot", default = nil },
		{ name = "weaponOption", type = "TransmogOutfitSlotOption", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.SlotHasSecondary"] = {
	key = "C_TransmogOutfitInfo.SlotHasSecondary",
	name = "SlotHasSecondary",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["SlotHasSecondary"],
	funcPath = "C_TransmogOutfitInfo.SlotHasSecondary",
	params = { { name = "slot", type = "TransmogOutfitSlot", default = nil } },
	returns = { { name = "hasSecondary", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TransmogOutfitInfo.UpdatePendingSituation"] = {
	key = "C_TransmogOutfitInfo.UpdatePendingSituation",
	name = "UpdatePendingSituation",
	category = "combat_midnight",
	subcategory = "c_transmogoutfitinfo",
	func = _G["C_TransmogOutfitInfo"] and _G["C_TransmogOutfitInfo"]["UpdatePendingSituation"],
	funcPath = "C_TransmogOutfitInfo.UpdatePendingSituation",
	params = {
		{ name = "option", type = "TransmogSituationOption", default = nil },
		{ name = "value", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

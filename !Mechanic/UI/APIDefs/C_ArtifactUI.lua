-- Generated APIDefinitions for namespace: C_ArtifactUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ArtifactUI.AddPower"] = {
	key = "C_ArtifactUI.AddPower",
	name = "AddPower",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["AddPower"],
	funcPath = "C_ArtifactUI.AddPower",
	params = { { name = "powerID", type = "number", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.ApplyCursorRelicToSlot"] = {
	key = "C_ArtifactUI.ApplyCursorRelicToSlot",
	name = "ApplyCursorRelicToSlot",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["ApplyCursorRelicToSlot"],
	funcPath = "C_ArtifactUI.ApplyCursorRelicToSlot",
	params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.CanApplyArtifactRelic"] = {
	key = "C_ArtifactUI.CanApplyArtifactRelic",
	name = "CanApplyArtifactRelic",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["CanApplyArtifactRelic"],
	funcPath = "C_ArtifactUI.CanApplyArtifactRelic",
	params = {
		{ name = "relicItemID", type = "number", default = nil },
		{ name = "onlyUnlocked", type = "bool", default = nil },
	},
	returns = { { name = "canApply", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.CanApplyCursorRelicToSlot"] = {
	key = "C_ArtifactUI.CanApplyCursorRelicToSlot",
	name = "CanApplyCursorRelicToSlot",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["CanApplyCursorRelicToSlot"],
	funcPath = "C_ArtifactUI.CanApplyCursorRelicToSlot",
	params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
	returns = { { name = "canApply", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.CanApplyRelicItemIDToEquippedArtifactSlot"] = {
	key = "C_ArtifactUI.CanApplyRelicItemIDToEquippedArtifactSlot",
	name = "CanApplyRelicItemIDToEquippedArtifactSlot",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["CanApplyRelicItemIDToEquippedArtifactSlot"],
	funcPath = "C_ArtifactUI.CanApplyRelicItemIDToEquippedArtifactSlot",
	params = {
		{ name = "relicItemID", type = "number", default = nil },
		{ name = "relicSlotIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "canApply", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.CanApplyRelicItemIDToSlot"] = {
	key = "C_ArtifactUI.CanApplyRelicItemIDToSlot",
	name = "CanApplyRelicItemIDToSlot",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["CanApplyRelicItemIDToSlot"],
	funcPath = "C_ArtifactUI.CanApplyRelicItemIDToSlot",
	params = {
		{ name = "relicItemID", type = "number", default = nil },
		{ name = "relicSlotIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "canApply", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetAppearanceInfo"] = {
	key = "C_ArtifactUI.GetAppearanceInfo",
	name = "GetAppearanceInfo",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetAppearanceInfo"],
	funcPath = "C_ArtifactUI.GetAppearanceInfo",
	params = {
		{ name = "appearanceSetIndex", type = "number", default = nil },
		{ name = "appearanceIndex", type = "number", default = nil },
	},
	returns = {
		{ name = "artifactAppearanceID", type = "number", canBeSecret = false },
		{ name = "appearanceName", type = "string", canBeSecret = false },
		{ name = "displayIndex", type = "number", canBeSecret = false },
		{ name = "unlocked", type = "bool", canBeSecret = false },
		{ name = "failureDescription", type = "string", canBeSecret = false },
		{ name = "uiCameraID", type = "number", canBeSecret = false },
		{ name = "altHandCameraID", type = "number", canBeSecret = false },
		{ name = "swatchColorR", type = "number", canBeSecret = false },
		{ name = "swatchColorG", type = "number", canBeSecret = false },
		{ name = "swatchColorB", type = "number", canBeSecret = false },
		{ name = "modelOpacity", type = "number", canBeSecret = false },
		{ name = "modelSaturation", type = "number", canBeSecret = false },
		{ name = "obtainable", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetAppearanceInfoByID"] = {
	key = "C_ArtifactUI.GetAppearanceInfoByID",
	name = "GetAppearanceInfoByID",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetAppearanceInfoByID"],
	funcPath = "C_ArtifactUI.GetAppearanceInfoByID",
	params = { { name = "artifactAppearanceID", type = "number", default = nil } },
	returns = {
		{ name = "artifactAppearanceSetID", type = "number", canBeSecret = false },
		{ name = "artifactAppearanceID", type = "number", canBeSecret = false },
		{ name = "appearanceName", type = "string", canBeSecret = false },
		{ name = "displayIndex", type = "number", canBeSecret = false },
		{ name = "unlocked", type = "bool", canBeSecret = false },
		{ name = "failureDescription", type = "string", canBeSecret = false },
		{ name = "uiCameraID", type = "number", canBeSecret = false },
		{ name = "altHandCameraID", type = "number", canBeSecret = false },
		{ name = "swatchColorR", type = "number", canBeSecret = false },
		{ name = "swatchColorG", type = "number", canBeSecret = false },
		{ name = "swatchColorB", type = "number", canBeSecret = false },
		{ name = "modelOpacity", type = "number", canBeSecret = false },
		{ name = "modelSaturation", type = "number", canBeSecret = false },
		{ name = "obtainable", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetAppearanceSetInfo"] = {
	key = "C_ArtifactUI.GetAppearanceSetInfo",
	name = "GetAppearanceSetInfo",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetAppearanceSetInfo"],
	funcPath = "C_ArtifactUI.GetAppearanceSetInfo",
	params = { { name = "appearanceSetIndex", type = "number", default = nil } },
	returns = {
		{ name = "artifactAppearanceSetID", type = "number", canBeSecret = false },
		{ name = "appearanceSetName", type = "string", canBeSecret = false },
		{ name = "appearanceSetDescription", type = "string", canBeSecret = false },
		{ name = "numAppearances", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetArtifactXPRewardTargetInfo"] = {
	key = "C_ArtifactUI.GetArtifactXPRewardTargetInfo",
	name = "GetArtifactXPRewardTargetInfo",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetArtifactXPRewardTargetInfo"],
	funcPath = "C_ArtifactUI.GetArtifactXPRewardTargetInfo",
	params = { { name = "artifactCategoryID", type = "number", default = nil } },
	returns = {
		{ name = "name", type = "string", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetCostForPointAtRank"] = {
	key = "C_ArtifactUI.GetCostForPointAtRank",
	name = "GetCostForPointAtRank",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetCostForPointAtRank"],
	funcPath = "C_ArtifactUI.GetCostForPointAtRank",
	params = {
		{ name = "rank", type = "number", default = nil },
		{ name = "tier", type = "ArtifactTiers", default = nil },
	},
	returns = { { name = "cost", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetEquippedArtifactNumRelicSlots"] = {
	key = "C_ArtifactUI.GetEquippedArtifactNumRelicSlots",
	name = "GetEquippedArtifactNumRelicSlots",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetEquippedArtifactNumRelicSlots"],
	funcPath = "C_ArtifactUI.GetEquippedArtifactNumRelicSlots",
	params = { { name = "onlyUnlocked", type = "bool", default = false } },
	returns = { { name = "numRelicSlots", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetEquippedArtifactRelicInfo"] = {
	key = "C_ArtifactUI.GetEquippedArtifactRelicInfo",
	name = "GetEquippedArtifactRelicInfo",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetEquippedArtifactRelicInfo"],
	funcPath = "C_ArtifactUI.GetEquippedArtifactRelicInfo",
	params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
	returns = {
		{ name = "name", type = "string", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
		{ name = "slotTypeName", type = "cstring", canBeSecret = false },
		{ name = "link", type = "string", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetEquippedRelicLockedReason"] = {
	key = "C_ArtifactUI.GetEquippedRelicLockedReason",
	name = "GetEquippedRelicLockedReason",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetEquippedRelicLockedReason"],
	funcPath = "C_ArtifactUI.GetEquippedRelicLockedReason",
	params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
	returns = { { name = "lockedReason", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetItemLevelIncreaseProvidedByRelic"] = {
	key = "C_ArtifactUI.GetItemLevelIncreaseProvidedByRelic",
	name = "GetItemLevelIncreaseProvidedByRelic",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetItemLevelIncreaseProvidedByRelic"],
	funcPath = "C_ArtifactUI.GetItemLevelIncreaseProvidedByRelic",
	params = { { name = "itemLinkOrID", type = "ItemInfo", default = nil } },
	returns = { { name = "itemIevelIncrease", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetNumRelicSlots"] = {
	key = "C_ArtifactUI.GetNumRelicSlots",
	name = "GetNumRelicSlots",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetNumRelicSlots"],
	funcPath = "C_ArtifactUI.GetNumRelicSlots",
	params = { { name = "onlyUnlocked", type = "bool", default = false } },
	returns = { { name = "numRelicSlots", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetPowerHyperlink"] = {
	key = "C_ArtifactUI.GetPowerHyperlink",
	name = "GetPowerHyperlink",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetPowerHyperlink"],
	funcPath = "C_ArtifactUI.GetPowerHyperlink",
	params = { { name = "powerID", type = "number", default = nil } },
	returns = { { name = "link", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetPowerInfo"] = {
	key = "C_ArtifactUI.GetPowerInfo",
	name = "GetPowerInfo",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetPowerInfo"],
	funcPath = "C_ArtifactUI.GetPowerInfo",
	params = { { name = "powerID", type = "number", default = nil } },
	returns = { { name = "powerInfo", type = "ArtifactPowerInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetPowerLinks"] = {
	key = "C_ArtifactUI.GetPowerLinks",
	name = "GetPowerLinks",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetPowerLinks"],
	funcPath = "C_ArtifactUI.GetPowerLinks",
	params = { { name = "powerID", type = "number", default = nil } },
	returns = { { name = "linkingPowerID", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetPowersAffectedByRelic"] = {
	key = "C_ArtifactUI.GetPowersAffectedByRelic",
	name = "GetPowersAffectedByRelic",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetPowersAffectedByRelic"],
	funcPath = "C_ArtifactUI.GetPowersAffectedByRelic",
	params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
	returns = { { name = "powerIDs", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetPowersAffectedByRelicItemLink"] = {
	key = "C_ArtifactUI.GetPowersAffectedByRelicItemLink",
	name = "GetPowersAffectedByRelicItemLink",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetPowersAffectedByRelicItemLink"],
	funcPath = "C_ArtifactUI.GetPowersAffectedByRelicItemLink",
	params = { { name = "relicItemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "powerIDs", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetRelicInfo"] = {
	key = "C_ArtifactUI.GetRelicInfo",
	name = "GetRelicInfo",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetRelicInfo"],
	funcPath = "C_ArtifactUI.GetRelicInfo",
	params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
	returns = {
		{ name = "name", type = "string", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
		{ name = "slotTypeName", type = "cstring", canBeSecret = false },
		{ name = "link", type = "string", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetRelicInfoByItemID"] = {
	key = "C_ArtifactUI.GetRelicInfoByItemID",
	name = "GetRelicInfoByItemID",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetRelicInfoByItemID"],
	funcPath = "C_ArtifactUI.GetRelicInfoByItemID",
	params = { { name = "itemID", type = "number", default = nil } },
	returns = {
		{ name = "name", type = "string", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
		{ name = "slotTypeName", type = "cstring", canBeSecret = false },
		{ name = "link", type = "string", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetRelicLockedReason"] = {
	key = "C_ArtifactUI.GetRelicLockedReason",
	name = "GetRelicLockedReason",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetRelicLockedReason"],
	funcPath = "C_ArtifactUI.GetRelicLockedReason",
	params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
	returns = { { name = "lockedReason", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetRelicSlotType"] = {
	key = "C_ArtifactUI.GetRelicSlotType",
	name = "GetRelicSlotType",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetRelicSlotType"],
	funcPath = "C_ArtifactUI.GetRelicSlotType",
	params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
	returns = { { name = "slotTypeName", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetTotalPowerCost"] = {
	key = "C_ArtifactUI.GetTotalPowerCost",
	name = "GetTotalPowerCost",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetTotalPowerCost"],
	funcPath = "C_ArtifactUI.GetTotalPowerCost",
	params = {
		{ name = "startingTrait", type = "luaIndex", default = nil },
		{ name = "numTraits", type = "number", default = nil },
		{ name = "artifactTier", type = "ArtifactTiers", default = nil },
	},
	returns = { { name = "totalArtifactPowerCost", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.IsArtifactItem"] = {
	key = "C_ArtifactUI.IsArtifactItem",
	name = "IsArtifactItem",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["IsArtifactItem"],
	funcPath = "C_ArtifactUI.IsArtifactItem",
	params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
	returns = { { name = "isArtifact", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.IsPowerKnown"] = {
	key = "C_ArtifactUI.IsPowerKnown",
	name = "IsPowerKnown",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["IsPowerKnown"],
	funcPath = "C_ArtifactUI.IsPowerKnown",
	params = { { name = "powerID", type = "number", default = nil } },
	returns = { { name = "known", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.SetAppearance"] = {
	key = "C_ArtifactUI.SetAppearance",
	name = "SetAppearance",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["SetAppearance"],
	funcPath = "C_ArtifactUI.SetAppearance",
	params = { { name = "artifactAppearanceID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.SetForgeRotation"] = {
	key = "C_ArtifactUI.SetForgeRotation",
	name = "SetForgeRotation",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["SetForgeRotation"],
	funcPath = "C_ArtifactUI.SetForgeRotation",
	params = {
		{ name = "forgeRotationX", type = "number", default = nil },
		{ name = "forgeRotationY", type = "number", default = nil },
		{ name = "forgeRotationZ", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.SetPreviewAppearance"] = {
	key = "C_ArtifactUI.SetPreviewAppearance",
	name = "SetPreviewAppearance",
	category = "combat_midnight",
	subcategory = "c_artifactui",
	func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["SetPreviewAppearance"],
	funcPath = "C_ArtifactUI.SetPreviewAppearance",
	params = { { name = "artifactAppearanceID", type = "number", default = 0 } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

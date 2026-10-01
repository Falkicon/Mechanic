-- Generated APIDefinitions for namespace: C_ArtifactUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ArtifactUI.AddPower"] = {
    key = "C_ArtifactUI.AddPower",
    name = "AddPower",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.AddPower",
    params = { { name = "powerID", type = "number", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.ApplyCursorRelicToSlot"] = {
    key = "C_ArtifactUI.ApplyCursorRelicToSlot",
    name = "ApplyCursorRelicToSlot",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.ApplyCursorRelicToSlot",
    params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.CanApplyArtifactRelic"] = {
    key = "C_ArtifactUI.CanApplyArtifactRelic",
    name = "CanApplyArtifactRelic",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.CanApplyArtifactRelic",
    params = { { name = "relicItemID", type = "number", default = nil }, { name = "onlyUnlocked", type = "bool", default = nil } },
    returns = { { name = "canApply", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.CanApplyCursorRelicToSlot"] = {
    key = "C_ArtifactUI.CanApplyCursorRelicToSlot",
    name = "CanApplyCursorRelicToSlot",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.CanApplyCursorRelicToSlot",
    params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "canApply", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.CanApplyRelicItemIDToEquippedArtifactSlot"] = {
    key = "C_ArtifactUI.CanApplyRelicItemIDToEquippedArtifactSlot",
    name = "CanApplyRelicItemIDToEquippedArtifactSlot",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.CanApplyRelicItemIDToEquippedArtifactSlot",
    params = { { name = "relicItemID", type = "number", default = nil }, { name = "relicSlotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "canApply", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.CanApplyRelicItemIDToSlot"] = {
    key = "C_ArtifactUI.CanApplyRelicItemIDToSlot",
    name = "CanApplyRelicItemIDToSlot",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.CanApplyRelicItemIDToSlot",
    params = { { name = "relicItemID", type = "number", default = nil }, { name = "relicSlotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "canApply", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.CheckRespecNPC"] = {
    key = "C_ArtifactUI.CheckRespecNPC",
    name = "CheckRespecNPC",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.CheckRespecNPC",
    params = {  },
    returns = { { name = "canRespec", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.Clear"] = {
    key = "C_ArtifactUI.Clear",
    name = "Clear",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.Clear",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.ClearForgeCamera"] = {
    key = "C_ArtifactUI.ClearForgeCamera",
    name = "ClearForgeCamera",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.ClearForgeCamera",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.ConfirmRespec"] = {
    key = "C_ArtifactUI.ConfirmRespec",
    name = "ConfirmRespec",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.ConfirmRespec",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.DoesEquippedArtifactHaveAnyRelicsSlotted"] = {
    key = "C_ArtifactUI.DoesEquippedArtifactHaveAnyRelicsSlotted",
    name = "DoesEquippedArtifactHaveAnyRelicsSlotted",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.DoesEquippedArtifactHaveAnyRelicsSlotted",
    params = {  },
    returns = { { name = "hasAnyRelicsSlotted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetAppearanceInfo"] = {
    key = "C_ArtifactUI.GetAppearanceInfo",
    name = "GetAppearanceInfo",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetAppearanceInfo",
    params = { { name = "appearanceSetIndex", type = "number", default = nil }, { name = "appearanceIndex", type = "number", default = nil } },
    returns = { { name = "artifactAppearanceID", type = "number", canBeSecret = false }, { name = "appearanceName", type = "string", canBeSecret = false }, { name = "displayIndex", type = "number", canBeSecret = false }, { name = "unlocked", type = "bool", canBeSecret = false }, { name = "failureDescription", type = "string", canBeSecret = false }, { name = "uiCameraID", type = "number", canBeSecret = false }, { name = "altHandCameraID", type = "number", canBeSecret = false }, { name = "swatchColorR", type = "number", canBeSecret = false }, { name = "swatchColorG", type = "number", canBeSecret = false }, { name = "swatchColorB", type = "number", canBeSecret = false }, { name = "modelOpacity", type = "number", canBeSecret = false }, { name = "modelSaturation", type = "number", canBeSecret = false }, { name = "obtainable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetAppearanceInfoByID"] = {
    key = "C_ArtifactUI.GetAppearanceInfoByID",
    name = "GetAppearanceInfoByID",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetAppearanceInfoByID",
    params = { { name = "artifactAppearanceID", type = "number", default = nil } },
    returns = { { name = "artifactAppearanceSetID", type = "number", canBeSecret = false }, { name = "artifactAppearanceID", type = "number", canBeSecret = false }, { name = "appearanceName", type = "string", canBeSecret = false }, { name = "displayIndex", type = "number", canBeSecret = false }, { name = "unlocked", type = "bool", canBeSecret = false }, { name = "failureDescription", type = "string", canBeSecret = false }, { name = "uiCameraID", type = "number", canBeSecret = false }, { name = "altHandCameraID", type = "number", canBeSecret = false }, { name = "swatchColorR", type = "number", canBeSecret = false }, { name = "swatchColorG", type = "number", canBeSecret = false }, { name = "swatchColorB", type = "number", canBeSecret = false }, { name = "modelOpacity", type = "number", canBeSecret = false }, { name = "modelSaturation", type = "number", canBeSecret = false }, { name = "obtainable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetAppearanceSetInfo"] = {
    key = "C_ArtifactUI.GetAppearanceSetInfo",
    name = "GetAppearanceSetInfo",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetAppearanceSetInfo",
    params = { { name = "appearanceSetIndex", type = "number", default = nil } },
    returns = { { name = "artifactAppearanceSetID", type = "number", canBeSecret = false }, { name = "appearanceSetName", type = "string", canBeSecret = false }, { name = "appearanceSetDescription", type = "string", canBeSecret = false }, { name = "numAppearances", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetArtifactArtInfo"] = {
    key = "C_ArtifactUI.GetArtifactArtInfo",
    name = "GetArtifactArtInfo",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetArtifactArtInfo",
    params = {  },
    returns = { { name = "artifactArtInfo", type = "ArtifactArtInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetArtifactInfo"] = {
    key = "C_ArtifactUI.GetArtifactInfo",
    name = "GetArtifactInfo",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetArtifactInfo",
    params = {  },
    returns = { { name = "itemID", type = "number", canBeSecret = false }, { name = "altItemID", type = "number", canBeSecret = false }, { name = "name", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "xp", type = "number", canBeSecret = false }, { name = "pointsSpent", type = "number", canBeSecret = false }, { name = "quality", type = "number", canBeSecret = false }, { name = "artifactAppearanceID", type = "number", canBeSecret = false }, { name = "appearanceModID", type = "number", canBeSecret = false }, { name = "itemAppearanceID", type = "number", canBeSecret = false }, { name = "altItemAppearanceID", type = "number", canBeSecret = false }, { name = "altOnTop", type = "bool", canBeSecret = false }, { name = "tier", type = "ArtifactTiers", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetArtifactItemID"] = {
    key = "C_ArtifactUI.GetArtifactItemID",
    name = "GetArtifactItemID",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetArtifactItemID",
    params = {  },
    returns = { { name = "itemID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetArtifactTier"] = {
    key = "C_ArtifactUI.GetArtifactTier",
    name = "GetArtifactTier",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetArtifactTier",
    params = {  },
    returns = { { name = "tier", type = "ArtifactTiers", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetArtifactXPRewardTargetInfo"] = {
    key = "C_ArtifactUI.GetArtifactXPRewardTargetInfo",
    name = "GetArtifactXPRewardTargetInfo",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetArtifactXPRewardTargetInfo",
    params = { { name = "artifactCategoryID", type = "number", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetCostForPointAtRank"] = {
    key = "C_ArtifactUI.GetCostForPointAtRank",
    name = "GetCostForPointAtRank",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetCostForPointAtRank",
    params = { { name = "rank", type = "number", default = nil }, { name = "tier", type = "ArtifactTiers", default = nil } },
    returns = { { name = "cost", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetEquippedArtifactArtInfo"] = {
    key = "C_ArtifactUI.GetEquippedArtifactArtInfo",
    name = "GetEquippedArtifactArtInfo",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetEquippedArtifactArtInfo",
    params = {  },
    returns = { { name = "artifactArtInfo", type = "ArtifactArtInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetEquippedArtifactInfo"] = {
    key = "C_ArtifactUI.GetEquippedArtifactInfo",
    name = "GetEquippedArtifactInfo",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetEquippedArtifactInfo",
    params = {  },
    returns = { { name = "itemID", type = "number", canBeSecret = false }, { name = "altItemID", type = "number", canBeSecret = false }, { name = "name", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "xp", type = "number", canBeSecret = false }, { name = "pointsSpent", type = "number", canBeSecret = false }, { name = "quality", type = "number", canBeSecret = false }, { name = "artifactAppearanceID", type = "number", canBeSecret = false }, { name = "appearanceModID", type = "number", canBeSecret = false }, { name = "itemAppearanceID", type = "number", canBeSecret = false }, { name = "altItemAppearanceID", type = "number", canBeSecret = false }, { name = "altOnTop", type = "bool", canBeSecret = false }, { name = "tier", type = "ArtifactTiers", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetEquippedArtifactItemID"] = {
    key = "C_ArtifactUI.GetEquippedArtifactItemID",
    name = "GetEquippedArtifactItemID",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetEquippedArtifactItemID",
    params = {  },
    returns = { { name = "itemID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetEquippedArtifactNumRelicSlots"] = {
    key = "C_ArtifactUI.GetEquippedArtifactNumRelicSlots",
    name = "GetEquippedArtifactNumRelicSlots",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetEquippedArtifactNumRelicSlots",
    params = { { name = "onlyUnlocked", type = "bool", default = false } },
    returns = { { name = "numRelicSlots", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetEquippedArtifactRelicInfo"] = {
    key = "C_ArtifactUI.GetEquippedArtifactRelicInfo",
    name = "GetEquippedArtifactRelicInfo",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetEquippedArtifactRelicInfo",
    params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "slotTypeName", type = "cstring", canBeSecret = false }, { name = "link", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetEquippedRelicLockedReason"] = {
    key = "C_ArtifactUI.GetEquippedRelicLockedReason",
    name = "GetEquippedRelicLockedReason",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetEquippedRelicLockedReason",
    params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "lockedReason", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetForgeRotation"] = {
    key = "C_ArtifactUI.GetForgeRotation",
    name = "GetForgeRotation",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetForgeRotation",
    params = {  },
    returns = { { name = "forgeRotationX", type = "number", canBeSecret = false }, { name = "forgeRotationY", type = "number", canBeSecret = false }, { name = "forgeRotationZ", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetItemLevelIncreaseProvidedByRelic"] = {
    key = "C_ArtifactUI.GetItemLevelIncreaseProvidedByRelic",
    name = "GetItemLevelIncreaseProvidedByRelic",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetItemLevelIncreaseProvidedByRelic",
    params = { { name = "itemLinkOrID", type = "ItemInfo", default = nil } },
    returns = { { name = "itemIevelIncrease", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetMetaPowerInfo"] = {
    key = "C_ArtifactUI.GetMetaPowerInfo",
    name = "GetMetaPowerInfo",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetMetaPowerInfo",
    params = {  },
    returns = { { name = "spellID", type = "number", canBeSecret = false }, { name = "powerCost", type = "number", canBeSecret = false }, { name = "currentRank", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetNumAppearanceSets"] = {
    key = "C_ArtifactUI.GetNumAppearanceSets",
    name = "GetNumAppearanceSets",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetNumAppearanceSets",
    params = {  },
    returns = { { name = "numAppearanceSets", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetNumObtainedArtifacts"] = {
    key = "C_ArtifactUI.GetNumObtainedArtifacts",
    name = "GetNumObtainedArtifacts",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetNumObtainedArtifacts",
    params = {  },
    returns = { { name = "numObtainedArtifacts", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetNumRelicSlots"] = {
    key = "C_ArtifactUI.GetNumRelicSlots",
    name = "GetNumRelicSlots",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetNumRelicSlots",
    params = { { name = "onlyUnlocked", type = "bool", default = false } },
    returns = { { name = "numRelicSlots", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetPointsRemaining"] = {
    key = "C_ArtifactUI.GetPointsRemaining",
    name = "GetPointsRemaining",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetPointsRemaining",
    params = {  },
    returns = { { name = "pointsRemaining", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetPowerHyperlink"] = {
    key = "C_ArtifactUI.GetPowerHyperlink",
    name = "GetPowerHyperlink",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetPowerHyperlink",
    params = { { name = "powerID", type = "number", default = nil } },
    returns = { { name = "link", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetPowerInfo"] = {
    key = "C_ArtifactUI.GetPowerInfo",
    name = "GetPowerInfo",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetPowerInfo",
    params = { { name = "powerID", type = "number", default = nil } },
    returns = { { name = "powerInfo", type = "ArtifactPowerInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetPowerLinks"] = {
    key = "C_ArtifactUI.GetPowerLinks",
    name = "GetPowerLinks",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetPowerLinks",
    params = { { name = "powerID", type = "number", default = nil } },
    returns = { { name = "linkingPowerID", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetPowers"] = {
    key = "C_ArtifactUI.GetPowers",
    name = "GetPowers",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetPowers",
    params = {  },
    returns = { { name = "powerID", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetPowersAffectedByRelic"] = {
    key = "C_ArtifactUI.GetPowersAffectedByRelic",
    name = "GetPowersAffectedByRelic",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetPowersAffectedByRelic",
    params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "powerIDs", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetPowersAffectedByRelicItemLink"] = {
    key = "C_ArtifactUI.GetPowersAffectedByRelicItemLink",
    name = "GetPowersAffectedByRelicItemLink",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetPowersAffectedByRelicItemLink",
    params = { { name = "relicItemInfo", type = "ItemInfo", default = nil } },
    returns = { { name = "powerIDs", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetPreviewAppearance"] = {
    key = "C_ArtifactUI.GetPreviewAppearance",
    name = "GetPreviewAppearance",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetPreviewAppearance",
    params = {  },
    returns = { { name = "artifactAppearanceID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetRelicInfo"] = {
    key = "C_ArtifactUI.GetRelicInfo",
    name = "GetRelicInfo",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetRelicInfo",
    params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "slotTypeName", type = "cstring", canBeSecret = false }, { name = "link", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetRelicInfoByItemID"] = {
    key = "C_ArtifactUI.GetRelicInfoByItemID",
    name = "GetRelicInfoByItemID",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetRelicInfoByItemID",
    params = { { name = "itemID", type = "number", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "slotTypeName", type = "cstring", canBeSecret = false }, { name = "link", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetRelicLockedReason"] = {
    key = "C_ArtifactUI.GetRelicLockedReason",
    name = "GetRelicLockedReason",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetRelicLockedReason",
    params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "lockedReason", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetRelicSlotType"] = {
    key = "C_ArtifactUI.GetRelicSlotType",
    name = "GetRelicSlotType",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetRelicSlotType",
    params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "slotTypeName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetRespecArtifactArtInfo"] = {
    key = "C_ArtifactUI.GetRespecArtifactArtInfo",
    name = "GetRespecArtifactArtInfo",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetRespecArtifactArtInfo",
    params = {  },
    returns = { { name = "artifactArtInfo", type = "ArtifactArtInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetRespecArtifactInfo"] = {
    key = "C_ArtifactUI.GetRespecArtifactInfo",
    name = "GetRespecArtifactInfo",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetRespecArtifactInfo",
    params = {  },
    returns = { { name = "itemID", type = "number", canBeSecret = false }, { name = "altItemID", type = "number", canBeSecret = false }, { name = "name", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "xp", type = "number", canBeSecret = false }, { name = "pointsSpent", type = "number", canBeSecret = false }, { name = "quality", type = "number", canBeSecret = false }, { name = "artifactAppearanceID", type = "number", canBeSecret = false }, { name = "appearanceModID", type = "number", canBeSecret = false }, { name = "itemAppearanceID", type = "number", canBeSecret = false }, { name = "altItemAppearanceID", type = "number", canBeSecret = false }, { name = "altOnTop", type = "bool", canBeSecret = false }, { name = "tier", type = "ArtifactTiers", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetRespecCost"] = {
    key = "C_ArtifactUI.GetRespecCost",
    name = "GetRespecCost",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetRespecCost",
    params = {  },
    returns = { { name = "cost", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetTotalPowerCost"] = {
    key = "C_ArtifactUI.GetTotalPowerCost",
    name = "GetTotalPowerCost",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetTotalPowerCost",
    params = { { name = "startingTrait", type = "luaIndex", default = nil }, { name = "numTraits", type = "number", default = nil }, { name = "artifactTier", type = "ArtifactTiers", default = nil } },
    returns = { { name = "totalArtifactPowerCost", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetTotalPurchasedRanks"] = {
    key = "C_ArtifactUI.GetTotalPurchasedRanks",
    name = "GetTotalPurchasedRanks",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.GetTotalPurchasedRanks",
    params = {  },
    returns = { { name = "totalPurchasedRanks", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.IsArtifactDisabled"] = {
    key = "C_ArtifactUI.IsArtifactDisabled",
    name = "IsArtifactDisabled",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.IsArtifactDisabled",
    params = {  },
    returns = { { name = "artifactDisabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.IsArtifactItem"] = {
    key = "C_ArtifactUI.IsArtifactItem",
    name = "IsArtifactItem",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.IsArtifactItem",
    params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
    returns = { { name = "isArtifact", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.IsAtForge"] = {
    key = "C_ArtifactUI.IsAtForge",
    name = "IsAtForge",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.IsAtForge",
    params = {  },
    returns = { { name = "isAtForge", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.IsEquippedArtifactDisabled"] = {
    key = "C_ArtifactUI.IsEquippedArtifactDisabled",
    name = "IsEquippedArtifactDisabled",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.IsEquippedArtifactDisabled",
    params = {  },
    returns = { { name = "artifactDisabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.IsEquippedArtifactMaxed"] = {
    key = "C_ArtifactUI.IsEquippedArtifactMaxed",
    name = "IsEquippedArtifactMaxed",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.IsEquippedArtifactMaxed",
    params = {  },
    returns = { { name = "artifactMaxed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.IsMaxedByRulesOrEffect"] = {
    key = "C_ArtifactUI.IsMaxedByRulesOrEffect",
    name = "IsMaxedByRulesOrEffect",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.IsMaxedByRulesOrEffect",
    params = {  },
    returns = { { name = "isEffectivelyMaxed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.IsPowerKnown"] = {
    key = "C_ArtifactUI.IsPowerKnown",
    name = "IsPowerKnown",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.IsPowerKnown",
    params = { { name = "powerID", type = "number", default = nil } },
    returns = { { name = "known", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.IsViewedArtifactEquipped"] = {
    key = "C_ArtifactUI.IsViewedArtifactEquipped",
    name = "IsViewedArtifactEquipped",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.IsViewedArtifactEquipped",
    params = {  },
    returns = { { name = "isViewedArtifactEquipped", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.SetAppearance"] = {
    key = "C_ArtifactUI.SetAppearance",
    name = "SetAppearance",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.SetAppearance",
    params = { { name = "artifactAppearanceID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.SetForgeCamera"] = {
    key = "C_ArtifactUI.SetForgeCamera",
    name = "SetForgeCamera",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.SetForgeCamera",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.SetForgeRotation"] = {
    key = "C_ArtifactUI.SetForgeRotation",
    name = "SetForgeRotation",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.SetForgeRotation",
    params = { { name = "forgeRotationX", type = "number", default = nil }, { name = "forgeRotationY", type = "number", default = nil }, { name = "forgeRotationZ", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.SetPreviewAppearance"] = {
    key = "C_ArtifactUI.SetPreviewAppearance",
    name = "SetPreviewAppearance",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.SetPreviewAppearance",
    params = { { name = "artifactAppearanceID", type = "number", default = 0 } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.ShouldSuppressForgeRotation"] = {
    key = "C_ArtifactUI.ShouldSuppressForgeRotation",
    name = "ShouldSuppressForgeRotation",
    category = "general",
    subcategory = "c_artifactui",
    funcPath = "C_ArtifactUI.ShouldSuppressForgeRotation",
    params = {  },
    returns = { { name = "shouldSuppressForgeRotation", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

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
    returns = {  },
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
    params = { { name = "relicItemID", type = "number", default = nil }, { name = "onlyUnlocked", type = "bool", default = nil } },
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
    params = { { name = "relicItemID", type = "number", default = nil }, { name = "relicSlotIndex", type = "luaIndex", default = nil } },
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
    params = { { name = "relicItemID", type = "number", default = nil }, { name = "relicSlotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "canApply", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.CheckRespecNPC"] = {
    key = "C_ArtifactUI.CheckRespecNPC",
    name = "CheckRespecNPC",
    category = "general",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["CheckRespecNPC"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["Clear"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["ClearForgeCamera"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["ConfirmRespec"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["DoesEquippedArtifactHaveAnyRelicsSlotted"],
    funcPath = "C_ArtifactUI.DoesEquippedArtifactHaveAnyRelicsSlotted",
    params = {  },
    returns = { { name = "hasAnyRelicsSlotted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetAppearanceInfo"] = {
    key = "C_ArtifactUI.GetAppearanceInfo",
    name = "GetAppearanceInfo",
    category = "combat_midnight",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetAppearanceInfo"],
    funcPath = "C_ArtifactUI.GetAppearanceInfo",
    params = { { name = "appearanceSetIndex", type = "number", default = nil }, { name = "appearanceIndex", type = "number", default = nil } },
    returns = { { name = "artifactAppearanceID", type = "number", canBeSecret = false }, { name = "appearanceName", type = "string", canBeSecret = false }, { name = "displayIndex", type = "number", canBeSecret = false }, { name = "unlocked", type = "bool", canBeSecret = false }, { name = "failureDescription", type = "string", canBeSecret = false }, { name = "uiCameraID", type = "number", canBeSecret = false }, { name = "altHandCameraID", type = "number", canBeSecret = false }, { name = "swatchColorR", type = "number", canBeSecret = false }, { name = "swatchColorG", type = "number", canBeSecret = false }, { name = "swatchColorB", type = "number", canBeSecret = false }, { name = "modelOpacity", type = "number", canBeSecret = false }, { name = "modelSaturation", type = "number", canBeSecret = false }, { name = "obtainable", type = "bool", canBeSecret = false } },
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
    returns = { { name = "artifactAppearanceSetID", type = "number", canBeSecret = false }, { name = "artifactAppearanceID", type = "number", canBeSecret = false }, { name = "appearanceName", type = "string", canBeSecret = false }, { name = "displayIndex", type = "number", canBeSecret = false }, { name = "unlocked", type = "bool", canBeSecret = false }, { name = "failureDescription", type = "string", canBeSecret = false }, { name = "uiCameraID", type = "number", canBeSecret = false }, { name = "altHandCameraID", type = "number", canBeSecret = false }, { name = "swatchColorR", type = "number", canBeSecret = false }, { name = "swatchColorG", type = "number", canBeSecret = false }, { name = "swatchColorB", type = "number", canBeSecret = false }, { name = "modelOpacity", type = "number", canBeSecret = false }, { name = "modelSaturation", type = "number", canBeSecret = false }, { name = "obtainable", type = "bool", canBeSecret = false } },
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
    returns = { { name = "artifactAppearanceSetID", type = "number", canBeSecret = false }, { name = "appearanceSetName", type = "string", canBeSecret = false }, { name = "appearanceSetDescription", type = "string", canBeSecret = false }, { name = "numAppearances", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetArtifactArtInfo"] = {
    key = "C_ArtifactUI.GetArtifactArtInfo",
    name = "GetArtifactArtInfo",
    category = "general",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetArtifactArtInfo"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetArtifactInfo"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetArtifactItemID"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetArtifactTier"],
    funcPath = "C_ArtifactUI.GetArtifactTier",
    params = {  },
    returns = { { name = "tier", type = "ArtifactTiers", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetArtifactXPRewardTargetInfo"] = {
    key = "C_ArtifactUI.GetArtifactXPRewardTargetInfo",
    name = "GetArtifactXPRewardTargetInfo",
    category = "combat_midnight",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetArtifactXPRewardTargetInfo"],
    funcPath = "C_ArtifactUI.GetArtifactXPRewardTargetInfo",
    params = { { name = "artifactCategoryID", type = "number", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false } },
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
    params = { { name = "rank", type = "number", default = nil }, { name = "tier", type = "ArtifactTiers", default = nil } },
    returns = { { name = "cost", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetEquippedArtifactArtInfo"] = {
    key = "C_ArtifactUI.GetEquippedArtifactArtInfo",
    name = "GetEquippedArtifactArtInfo",
    category = "general",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetEquippedArtifactArtInfo"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetEquippedArtifactInfo"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetEquippedArtifactItemID"],
    funcPath = "C_ArtifactUI.GetEquippedArtifactItemID",
    params = {  },
    returns = { { name = "itemID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
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
    returns = { { name = "name", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "slotTypeName", type = "cstring", canBeSecret = false }, { name = "link", type = "string", canBeSecret = false } },
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

APIDefs["C_ArtifactUI.GetForgeRotation"] = {
    key = "C_ArtifactUI.GetForgeRotation",
    name = "GetForgeRotation",
    category = "general",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetForgeRotation"],
    funcPath = "C_ArtifactUI.GetForgeRotation",
    params = {  },
    returns = { { name = "forgeRotationX", type = "number", canBeSecret = false }, { name = "forgeRotationY", type = "number", canBeSecret = false }, { name = "forgeRotationZ", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["C_ArtifactUI.GetMetaPowerInfo"] = {
    key = "C_ArtifactUI.GetMetaPowerInfo",
    name = "GetMetaPowerInfo",
    category = "general",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetMetaPowerInfo"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetNumAppearanceSets"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetNumObtainedArtifacts"],
    funcPath = "C_ArtifactUI.GetNumObtainedArtifacts",
    params = {  },
    returns = { { name = "numObtainedArtifacts", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["C_ArtifactUI.GetPointsRemaining"] = {
    key = "C_ArtifactUI.GetPointsRemaining",
    name = "GetPointsRemaining",
    category = "general",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetPointsRemaining"],
    funcPath = "C_ArtifactUI.GetPointsRemaining",
    params = {  },
    returns = { { name = "pointsRemaining", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["C_ArtifactUI.GetPowers"] = {
    key = "C_ArtifactUI.GetPowers",
    name = "GetPowers",
    category = "general",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetPowers"],
    funcPath = "C_ArtifactUI.GetPowers",
    params = {  },
    returns = { { name = "powerID", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["C_ArtifactUI.GetPreviewAppearance"] = {
    key = "C_ArtifactUI.GetPreviewAppearance",
    name = "GetPreviewAppearance",
    category = "general",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetPreviewAppearance"],
    funcPath = "C_ArtifactUI.GetPreviewAppearance",
    params = {  },
    returns = { { name = "artifactAppearanceID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetRelicInfo"] = {
    key = "C_ArtifactUI.GetRelicInfo",
    name = "GetRelicInfo",
    category = "combat_midnight",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetRelicInfo"],
    funcPath = "C_ArtifactUI.GetRelicInfo",
    params = { { name = "relicSlotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "slotTypeName", type = "cstring", canBeSecret = false }, { name = "link", type = "string", canBeSecret = false } },
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
    returns = { { name = "name", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "slotTypeName", type = "cstring", canBeSecret = false }, { name = "link", type = "string", canBeSecret = false } },
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

APIDefs["C_ArtifactUI.GetRespecArtifactArtInfo"] = {
    key = "C_ArtifactUI.GetRespecArtifactArtInfo",
    name = "GetRespecArtifactArtInfo",
    category = "general",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetRespecArtifactArtInfo"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetRespecArtifactInfo"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetRespecCost"],
    funcPath = "C_ArtifactUI.GetRespecCost",
    params = {  },
    returns = { { name = "cost", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.GetTotalPowerCost"] = {
    key = "C_ArtifactUI.GetTotalPowerCost",
    name = "GetTotalPowerCost",
    category = "combat_midnight",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetTotalPowerCost"],
    funcPath = "C_ArtifactUI.GetTotalPowerCost",
    params = { { name = "startingTrait", type = "luaIndex", default = nil }, { name = "numTraits", type = "number", default = nil }, { name = "artifactTier", type = "ArtifactTiers", default = nil } },
    returns = { { name = "totalArtifactPowerCost", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.GetTotalPurchasedRanks"] = {
    key = "C_ArtifactUI.GetTotalPurchasedRanks",
    name = "GetTotalPurchasedRanks",
    category = "general",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["GetTotalPurchasedRanks"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["IsArtifactDisabled"],
    funcPath = "C_ArtifactUI.IsArtifactDisabled",
    params = {  },
    returns = { { name = "artifactDisabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["C_ArtifactUI.IsAtForge"] = {
    key = "C_ArtifactUI.IsAtForge",
    name = "IsAtForge",
    category = "general",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["IsAtForge"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["IsEquippedArtifactDisabled"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["IsEquippedArtifactMaxed"],
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
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["IsMaxedByRulesOrEffect"],
    funcPath = "C_ArtifactUI.IsMaxedByRulesOrEffect",
    params = {  },
    returns = { { name = "isEffectivelyMaxed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["C_ArtifactUI.IsViewedArtifactEquipped"] = {
    key = "C_ArtifactUI.IsViewedArtifactEquipped",
    name = "IsViewedArtifactEquipped",
    category = "general",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["IsViewedArtifactEquipped"],
    funcPath = "C_ArtifactUI.IsViewedArtifactEquipped",
    params = {  },
    returns = { { name = "isViewedArtifactEquipped", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.SetAppearance"] = {
    key = "C_ArtifactUI.SetAppearance",
    name = "SetAppearance",
    category = "combat_midnight",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["SetAppearance"],
    funcPath = "C_ArtifactUI.SetAppearance",
    params = { { name = "artifactAppearanceID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.SetForgeCamera"] = {
    key = "C_ArtifactUI.SetForgeCamera",
    name = "SetForgeCamera",
    category = "general",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["SetForgeCamera"],
    funcPath = "C_ArtifactUI.SetForgeCamera",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ArtifactUI.SetForgeRotation"] = {
    key = "C_ArtifactUI.SetForgeRotation",
    name = "SetForgeRotation",
    category = "combat_midnight",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["SetForgeRotation"],
    funcPath = "C_ArtifactUI.SetForgeRotation",
    params = { { name = "forgeRotationX", type = "number", default = nil }, { name = "forgeRotationY", type = "number", default = nil }, { name = "forgeRotationZ", type = "number", default = nil } },
    returns = {  },
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
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ArtifactUI.ShouldSuppressForgeRotation"] = {
    key = "C_ArtifactUI.ShouldSuppressForgeRotation",
    name = "ShouldSuppressForgeRotation",
    category = "general",
    subcategory = "c_artifactui",
    func = _G["C_ArtifactUI"] and _G["C_ArtifactUI"]["ShouldSuppressForgeRotation"],
    funcPath = "C_ArtifactUI.ShouldSuppressForgeRotation",
    params = {  },
    returns = { { name = "shouldSuppressForgeRotation", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

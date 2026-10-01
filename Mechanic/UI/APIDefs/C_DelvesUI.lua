-- Generated APIDefinitions for namespace: C_DelvesUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_DelvesUI.GetCompanionInfoForActivePlayer"] = {
    key = "C_DelvesUI.GetCompanionInfoForActivePlayer",
    name = "GetCompanionInfoForActivePlayer",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetCompanionInfoForActivePlayer",
    params = {  },
    returns = { { name = "playerCompanionInfoID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_DelvesUI.GetCreatureDisplayInfoForCompanion"] = {
    key = "C_DelvesUI.GetCreatureDisplayInfoForCompanion",
    name = "GetCreatureDisplayInfoForCompanion",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetCreatureDisplayInfoForCompanion",
    params = { { name = "companionID", type = "number", default = nil } },
    returns = { { name = "creatureDisplayInfoID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetCurioLink"] = {
    key = "C_DelvesUI.GetCurioLink",
    name = "GetCurioLink",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetCurioLink",
    params = { { name = "spellID", type = "number", default = nil }, { name = "rarity", type = "CurioRarity", default = nil } },
    returns = { { name = "curioLink", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_DelvesUI.GetCurioNodeForCompanion"] = {
    key = "C_DelvesUI.GetCurioNodeForCompanion",
    name = "GetCurioNodeForCompanion",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetCurioNodeForCompanion",
    params = { { name = "curioType", type = "CurioType", default = nil }, { name = "companionID", type = "number", default = nil } },
    returns = { { name = "nodeID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetCurioRarityByTraitCondAccountElementID"] = {
    key = "C_DelvesUI.GetCurioRarityByTraitCondAccountElementID",
    name = "GetCurioRarityByTraitCondAccountElementID",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetCurioRarityByTraitCondAccountElementID",
    params = { { name = "traitCondAccountElementID", type = "number", default = nil } },
    returns = { { name = "rarity", type = "CurioRarity", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetCurrentDelvesSeasonNumber"] = {
    key = "C_DelvesUI.GetCurrentDelvesSeasonNumber",
    name = "GetCurrentDelvesSeasonNumber",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetCurrentDelvesSeasonNumber",
    params = {  },
    returns = { { name = "seasonNumber", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_DelvesUI.GetDelvesAffixSpellsForSeason"] = {
    key = "C_DelvesUI.GetDelvesAffixSpellsForSeason",
    name = "GetDelvesAffixSpellsForSeason",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetDelvesAffixSpellsForSeason",
    params = {  },
    returns = { { name = "affixSpellIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_DelvesUI.GetDelvesFactionForSeason"] = {
    key = "C_DelvesUI.GetDelvesFactionForSeason",
    name = "GetDelvesFactionForSeason",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetDelvesFactionForSeason",
    params = {  },
    returns = { { name = "factionID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_DelvesUI.GetDelvesMinRequiredLevel"] = {
    key = "C_DelvesUI.GetDelvesMinRequiredLevel",
    name = "GetDelvesMinRequiredLevel",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetDelvesMinRequiredLevel",
    params = {  },
    returns = { { name = "minRequiredLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_DelvesUI.GetFactionForCompanion"] = {
    key = "C_DelvesUI.GetFactionForCompanion",
    name = "GetFactionForCompanion",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetFactionForCompanion",
    params = { { name = "companionID", type = "number", default = nil } },
    returns = { { name = "factionID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetLockedTextForCompanion"] = {
    key = "C_DelvesUI.GetLockedTextForCompanion",
    name = "GetLockedTextForCompanion",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetLockedTextForCompanion",
    params = { { name = "companionID", type = "number", default = nil } },
    returns = { { name = "text", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetModelSceneForCompanion"] = {
    key = "C_DelvesUI.GetModelSceneForCompanion",
    name = "GetModelSceneForCompanion",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetModelSceneForCompanion",
    params = { { name = "companionID", type = "number", default = nil } },
    returns = { { name = "modelSceneID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetRoleNodeForCompanion"] = {
    key = "C_DelvesUI.GetRoleNodeForCompanion",
    name = "GetRoleNodeForCompanion",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetRoleNodeForCompanion",
    params = { { name = "companionID", type = "number", default = nil } },
    returns = { { name = "nodeID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetRoleSubtreeForCompanion"] = {
    key = "C_DelvesUI.GetRoleSubtreeForCompanion",
    name = "GetRoleSubtreeForCompanion",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetRoleSubtreeForCompanion",
    params = { { name = "roleType", type = "CompanionRoleType", default = nil }, { name = "companionID", type = "number", default = nil } },
    returns = { { name = "subTreeID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetTraitTreeForCompanion"] = {
    key = "C_DelvesUI.GetTraitTreeForCompanion",
    name = "GetTraitTreeForCompanion",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetTraitTreeForCompanion",
    params = { { name = "companionID", type = "number", default = nil } },
    returns = { { name = "treeID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.GetUnseenCuriosBySlotType"] = {
    key = "C_DelvesUI.GetUnseenCuriosBySlotType",
    name = "GetUnseenCuriosBySlotType",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.GetUnseenCuriosBySlotType",
    params = { { name = "slotType", type = "CompanionConfigSlotTypes", default = nil }, { name = "ownedCurioNodeIDs", type = "table", default = nil } },
    returns = { { name = "unseenCurioNodeIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.HasActiveDelve"] = {
    key = "C_DelvesUI.HasActiveDelve",
    name = "HasActiveDelve",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.HasActiveDelve",
    params = { { name = "mapID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.IsEligibleForActiveDelveRewards"] = {
    key = "C_DelvesUI.IsEligibleForActiveDelveRewards",
    name = "IsEligibleForActiveDelveRewards",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.IsEligibleForActiveDelveRewards",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.IsTraitTreeForCompanion"] = {
    key = "C_DelvesUI.IsTraitTreeForCompanion",
    name = "IsTraitTreeForCompanion",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.IsTraitTreeForCompanion",
    params = { { name = "traitTreeID", type = "number", default = nil } },
    returns = { { name = "isForCompanion", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.RequestPartyEligibilityForDelveTiers"] = {
    key = "C_DelvesUI.RequestPartyEligibilityForDelveTiers",
    name = "RequestPartyEligibilityForDelveTiers",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.RequestPartyEligibilityForDelveTiers",
    params = { { name = "gossipOption", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DelvesUI.SaveSeenCuriosBySlotType"] = {
    key = "C_DelvesUI.SaveSeenCuriosBySlotType",
    name = "SaveSeenCuriosBySlotType",
    category = "general",
    subcategory = "c_delvesui",
    funcPath = "C_DelvesUI.SaveSeenCuriosBySlotType",
    params = { { name = "slotType", type = "CompanionConfigSlotTypes", default = nil }, { name = "ownedCurioNodeIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

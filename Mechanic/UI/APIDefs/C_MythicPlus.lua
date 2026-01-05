-- Generated APIDefinitions for namespace: C_MythicPlus
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_MythicPlus.GetCurrentAffixes"] = {
    key = "C_MythicPlus.GetCurrentAffixes",
    name = "GetCurrentAffixes",
    category = "general",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetCurrentAffixes"],
    funcPath = "C_MythicPlus.GetCurrentAffixes",
    params = {  },
    returns = { { name = "affixIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_MythicPlus.GetCurrentSeason"] = {
    key = "C_MythicPlus.GetCurrentSeason",
    name = "GetCurrentSeason",
    category = "general",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetCurrentSeason"],
    funcPath = "C_MythicPlus.GetCurrentSeason",
    params = {  },
    returns = { { name = "seasonID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_MythicPlus.GetCurrentSeasonValues"] = {
    key = "C_MythicPlus.GetCurrentSeasonValues",
    name = "GetCurrentSeasonValues",
    category = "general",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetCurrentSeasonValues"],
    funcPath = "C_MythicPlus.GetCurrentSeasonValues",
    params = {  },
    returns = { { name = "displaySeasonID", type = "number", canBeSecret = false }, { name = "milestoneSeasonID", type = "number", canBeSecret = false }, { name = "rewardSeasonID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_MythicPlus.GetCurrentUIDisplaySeason"] = {
    key = "C_MythicPlus.GetCurrentUIDisplaySeason",
    name = "GetCurrentUIDisplaySeason",
    category = "general",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetCurrentUIDisplaySeason"],
    funcPath = "C_MythicPlus.GetCurrentUIDisplaySeason",
    params = {  },
    returns = { { name = "seasonID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_MythicPlus.GetEndOfRunGearSequenceLevel"] = {
    key = "C_MythicPlus.GetEndOfRunGearSequenceLevel",
    name = "GetEndOfRunGearSequenceLevel",
    category = "combat_midnight",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetEndOfRunGearSequenceLevel"],
    funcPath = "C_MythicPlus.GetEndOfRunGearSequenceLevel",
    params = { { name = "keystoneLevel", type = "number", default = nil } },
    returns = { { name = "sequenceLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MythicPlus.GetLastWeeklyBestInformation"] = {
    key = "C_MythicPlus.GetLastWeeklyBestInformation",
    name = "GetLastWeeklyBestInformation",
    category = "general",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetLastWeeklyBestInformation"],
    funcPath = "C_MythicPlus.GetLastWeeklyBestInformation",
    params = {  },
    returns = { { name = "challengeMapId", type = "number", canBeSecret = false }, { name = "level", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_MythicPlus.GetOwnedKeystoneChallengeMapID"] = {
    key = "C_MythicPlus.GetOwnedKeystoneChallengeMapID",
    name = "GetOwnedKeystoneChallengeMapID",
    category = "general",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetOwnedKeystoneChallengeMapID"],
    funcPath = "C_MythicPlus.GetOwnedKeystoneChallengeMapID",
    params = {  },
    returns = { { name = "challengeMapID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_MythicPlus.GetOwnedKeystoneLevel"] = {
    key = "C_MythicPlus.GetOwnedKeystoneLevel",
    name = "GetOwnedKeystoneLevel",
    category = "general",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetOwnedKeystoneLevel"],
    funcPath = "C_MythicPlus.GetOwnedKeystoneLevel",
    params = {  },
    returns = { { name = "keyStoneLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_MythicPlus.GetOwnedKeystoneMapID"] = {
    key = "C_MythicPlus.GetOwnedKeystoneMapID",
    name = "GetOwnedKeystoneMapID",
    category = "general",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetOwnedKeystoneMapID"],
    funcPath = "C_MythicPlus.GetOwnedKeystoneMapID",
    params = {  },
    returns = { { name = "mapID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_MythicPlus.GetRewardLevelForDifficultyLevel"] = {
    key = "C_MythicPlus.GetRewardLevelForDifficultyLevel",
    name = "GetRewardLevelForDifficultyLevel",
    category = "combat_midnight",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetRewardLevelForDifficultyLevel"],
    funcPath = "C_MythicPlus.GetRewardLevelForDifficultyLevel",
    params = { { name = "difficultyLevel", type = "number", default = nil } },
    returns = { { name = "weeklyRewardLevel", type = "number", canBeSecret = false }, { name = "endOfRunRewardLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MythicPlus.GetRewardLevelFromKeystoneLevel"] = {
    key = "C_MythicPlus.GetRewardLevelFromKeystoneLevel",
    name = "GetRewardLevelFromKeystoneLevel",
    category = "combat_midnight",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetRewardLevelFromKeystoneLevel"],
    funcPath = "C_MythicPlus.GetRewardLevelFromKeystoneLevel",
    params = { { name = "keystoneLevel", type = "number", default = nil } },
    returns = { { name = "rewardLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MythicPlus.GetRunHistory"] = {
    key = "C_MythicPlus.GetRunHistory",
    name = "GetRunHistory",
    category = "combat_midnight",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetRunHistory"],
    funcPath = "C_MythicPlus.GetRunHistory",
    params = { { name = "includePreviousWeeks", type = "bool", default = false }, { name = "includeIncompleteRuns", type = "bool", default = false }, { name = "currentSeasonOnly", type = "bool", default = false } },
    returns = { { name = "runs", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MythicPlus.GetSeasonBestAffixScoreInfoForMap"] = {
    key = "C_MythicPlus.GetSeasonBestAffixScoreInfoForMap",
    name = "GetSeasonBestAffixScoreInfoForMap",
    category = "combat_midnight",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetSeasonBestAffixScoreInfoForMap"],
    funcPath = "C_MythicPlus.GetSeasonBestAffixScoreInfoForMap",
    params = { { name = "mapChallengeModeID", type = "number", default = nil } },
    returns = { { name = "affixScores", type = "table", canBeSecret = false }, { name = "bestOverAllScore", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MythicPlus.GetSeasonBestForMap"] = {
    key = "C_MythicPlus.GetSeasonBestForMap",
    name = "GetSeasonBestForMap",
    category = "combat_midnight",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetSeasonBestForMap"],
    funcPath = "C_MythicPlus.GetSeasonBestForMap",
    params = { { name = "mapChallengeModeID", type = "number", default = nil } },
    returns = { { name = "intimeInfo", type = "MapSeasonBestInfo", canBeSecret = false }, { name = "overtimeInfo", type = "MapSeasonBestInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MythicPlus.GetSeasonBestMythicRatingFromThisExpansion"] = {
    key = "C_MythicPlus.GetSeasonBestMythicRatingFromThisExpansion",
    name = "GetSeasonBestMythicRatingFromThisExpansion",
    category = "general",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetSeasonBestMythicRatingFromThisExpansion"],
    funcPath = "C_MythicPlus.GetSeasonBestMythicRatingFromThisExpansion",
    params = {  },
    returns = { { name = "bestSeasonScore", type = "number", canBeSecret = false }, { name = "bestSeason", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_MythicPlus.GetWeeklyBestForMap"] = {
    key = "C_MythicPlus.GetWeeklyBestForMap",
    name = "GetWeeklyBestForMap",
    category = "combat_midnight",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetWeeklyBestForMap"],
    funcPath = "C_MythicPlus.GetWeeklyBestForMap",
    params = { { name = "mapChallengeModeID", type = "number", default = nil } },
    returns = { { name = "durationSec", type = "number", canBeSecret = false }, { name = "level", type = "number", canBeSecret = false }, { name = "completionDate", type = "MythicPlusDate", canBeSecret = false }, { name = "affixIDs", type = "table", canBeSecret = false }, { name = "members", type = "table", canBeSecret = false }, { name = "dungeonScore", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MythicPlus.GetWeeklyChestRewardLevel"] = {
    key = "C_MythicPlus.GetWeeklyChestRewardLevel",
    name = "GetWeeklyChestRewardLevel",
    category = "general",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetWeeklyChestRewardLevel"],
    funcPath = "C_MythicPlus.GetWeeklyChestRewardLevel",
    params = {  },
    returns = { { name = "currentWeekBestLevel", type = "number", canBeSecret = false }, { name = "weeklyRewardLevel", type = "number", canBeSecret = false }, { name = "nextDifficultyWeeklyRewardLevel", type = "number", canBeSecret = false }, { name = "nextBestLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_MythicPlus.IsMythicPlusActive"] = {
    key = "C_MythicPlus.IsMythicPlusActive",
    name = "IsMythicPlusActive",
    category = "general",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["IsMythicPlusActive"],
    funcPath = "C_MythicPlus.IsMythicPlusActive",
    params = {  },
    returns = { { name = "isMythicPlusActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_MythicPlus.RequestCurrentAffixes"] = {
    key = "C_MythicPlus.RequestCurrentAffixes",
    name = "RequestCurrentAffixes",
    category = "general",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["RequestCurrentAffixes"],
    funcPath = "C_MythicPlus.RequestCurrentAffixes",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_MythicPlus.RequestMapInfo"] = {
    key = "C_MythicPlus.RequestMapInfo",
    name = "RequestMapInfo",
    category = "general",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["RequestMapInfo"],
    funcPath = "C_MythicPlus.RequestMapInfo",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_MythicPlus.RequestRewards"] = {
    key = "C_MythicPlus.RequestRewards",
    name = "RequestRewards",
    category = "general",
    subcategory = "c_mythicplus",
    func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["RequestRewards"],
    funcPath = "C_MythicPlus.RequestRewards",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

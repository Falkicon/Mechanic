-- Generated APIDefinitions for namespace: C_WeeklyRewards
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_WeeklyRewards.AreRewardsForCurrentRewardPeriod"] = {
    key = "C_WeeklyRewards.AreRewardsForCurrentRewardPeriod",
    name = "AreRewardsForCurrentRewardPeriod",
    category = "general",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["AreRewardsForCurrentRewardPeriod"],
    funcPath = "C_WeeklyRewards.AreRewardsForCurrentRewardPeriod",
    params = {  },
    returns = { { name = "isCurrentPeriod", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_WeeklyRewards.CanClaimRewards"] = {
    key = "C_WeeklyRewards.CanClaimRewards",
    name = "CanClaimRewards",
    category = "general",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["CanClaimRewards"],
    funcPath = "C_WeeklyRewards.CanClaimRewards",
    params = {  },
    returns = { { name = "canClaimRewards", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_WeeklyRewards.ClaimReward"] = {
    key = "C_WeeklyRewards.ClaimReward",
    name = "ClaimReward",
    category = "combat_midnight",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["ClaimReward"],
    funcPath = "C_WeeklyRewards.ClaimReward",
    params = { { name = "id", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.CloseInteraction"] = {
    key = "C_WeeklyRewards.CloseInteraction",
    name = "CloseInteraction",
    category = "general",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["CloseInteraction"],
    funcPath = "C_WeeklyRewards.CloseInteraction",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_WeeklyRewards.GetActivities"] = {
    key = "C_WeeklyRewards.GetActivities",
    name = "GetActivities",
    category = "combat_midnight",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetActivities"],
    funcPath = "C_WeeklyRewards.GetActivities",
    params = { { name = "type", type = "WeeklyRewardChestThresholdType", default = nil } },
    returns = { { name = "activities", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.GetActivityEncounterInfo"] = {
    key = "C_WeeklyRewards.GetActivityEncounterInfo",
    name = "GetActivityEncounterInfo",
    category = "combat_midnight",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetActivityEncounterInfo"],
    funcPath = "C_WeeklyRewards.GetActivityEncounterInfo",
    params = { { name = "type", type = "WeeklyRewardChestThresholdType", default = nil }, { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "info", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.GetConquestWeeklyProgress"] = {
    key = "C_WeeklyRewards.GetConquestWeeklyProgress",
    name = "GetConquestWeeklyProgress",
    category = "general",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetConquestWeeklyProgress"],
    funcPath = "C_WeeklyRewards.GetConquestWeeklyProgress",
    params = {  },
    returns = { { name = "weeklyProgress", type = "ConquestWeeklyProgress", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_WeeklyRewards.GetDifficultyIDForActivityTier"] = {
    key = "C_WeeklyRewards.GetDifficultyIDForActivityTier",
    name = "GetDifficultyIDForActivityTier",
    category = "combat_midnight",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetDifficultyIDForActivityTier"],
    funcPath = "C_WeeklyRewards.GetDifficultyIDForActivityTier",
    params = { { name = "activityTierID", type = "number", default = nil } },
    returns = { { name = "difficultyID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.GetExampleRewardItemHyperlinks"] = {
    key = "C_WeeklyRewards.GetExampleRewardItemHyperlinks",
    name = "GetExampleRewardItemHyperlinks",
    category = "combat_midnight",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetExampleRewardItemHyperlinks"],
    funcPath = "C_WeeklyRewards.GetExampleRewardItemHyperlinks",
    params = { { name = "id", type = "number", default = nil } },
    returns = { { name = "hyperlink", type = "string", canBeSecret = false }, { name = "upgradeHyperlink", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.GetItemHyperlink"] = {
    key = "C_WeeklyRewards.GetItemHyperlink",
    name = "GetItemHyperlink",
    category = "combat_midnight",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetItemHyperlink"],
    funcPath = "C_WeeklyRewards.GetItemHyperlink",
    params = { { name = "itemDBID", type = "WeeklyRewardItemDBID", default = nil } },
    returns = { { name = "hyperlink", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.GetNextActivitiesIncrease"] = {
    key = "C_WeeklyRewards.GetNextActivitiesIncrease",
    name = "GetNextActivitiesIncrease",
    category = "combat_midnight",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetNextActivitiesIncrease"],
    funcPath = "C_WeeklyRewards.GetNextActivitiesIncrease",
    params = { { name = "activityTierID", type = "number", default = nil }, { name = "level", type = "number", default = nil } },
    returns = { { name = "hasSeasonData", type = "bool", canBeSecret = false }, { name = "nextActivityTierID", type = "number", canBeSecret = false }, { name = "nextLevel", type = "number", canBeSecret = false }, { name = "itemLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.GetNextMythicPlusIncrease"] = {
    key = "C_WeeklyRewards.GetNextMythicPlusIncrease",
    name = "GetNextMythicPlusIncrease",
    category = "combat_midnight",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetNextMythicPlusIncrease"],
    funcPath = "C_WeeklyRewards.GetNextMythicPlusIncrease",
    params = { { name = "mythicPlusLevel", type = "number", default = nil } },
    returns = { { name = "hasSeasonData", type = "bool", canBeSecret = false }, { name = "nextMythicPlusLevel", type = "number", canBeSecret = false }, { name = "itemLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.GetNumCompletedDungeonRuns"] = {
    key = "C_WeeklyRewards.GetNumCompletedDungeonRuns",
    name = "GetNumCompletedDungeonRuns",
    category = "general",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetNumCompletedDungeonRuns"],
    funcPath = "C_WeeklyRewards.GetNumCompletedDungeonRuns",
    params = {  },
    returns = { { name = "numHeroic", type = "number", canBeSecret = false }, { name = "numMythic", type = "number", canBeSecret = false }, { name = "numMythicPlus", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_WeeklyRewards.GetSortedProgressForActivity"] = {
    key = "C_WeeklyRewards.GetSortedProgressForActivity",
    name = "GetSortedProgressForActivity",
    category = "combat_midnight",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetSortedProgressForActivity"],
    funcPath = "C_WeeklyRewards.GetSortedProgressForActivity",
    params = { { name = "type", type = "WeeklyRewardChestThresholdType", default = nil }, { name = "combineSharedDifficulty", type = "bool", default = nil } },
    returns = { { name = "progress", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.HasAvailableRewards"] = {
    key = "C_WeeklyRewards.HasAvailableRewards",
    name = "HasAvailableRewards",
    category = "general",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["HasAvailableRewards"],
    funcPath = "C_WeeklyRewards.HasAvailableRewards",
    params = {  },
    returns = { { name = "hasAvailableRewards", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_WeeklyRewards.HasGeneratedRewards"] = {
    key = "C_WeeklyRewards.HasGeneratedRewards",
    name = "HasGeneratedRewards",
    category = "general",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["HasGeneratedRewards"],
    funcPath = "C_WeeklyRewards.HasGeneratedRewards",
    params = {  },
    returns = { { name = "hasGeneratedRewards", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_WeeklyRewards.HasInteraction"] = {
    key = "C_WeeklyRewards.HasInteraction",
    name = "HasInteraction",
    category = "general",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["HasInteraction"],
    funcPath = "C_WeeklyRewards.HasInteraction",
    params = {  },
    returns = { { name = "isInteracting", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_WeeklyRewards.IsWeeklyChestRetired"] = {
    key = "C_WeeklyRewards.IsWeeklyChestRetired",
    name = "IsWeeklyChestRetired",
    category = "general",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["IsWeeklyChestRetired"],
    funcPath = "C_WeeklyRewards.IsWeeklyChestRetired",
    params = {  },
    returns = { { name = "isRetired", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_WeeklyRewards.OnUIInteract"] = {
    key = "C_WeeklyRewards.OnUIInteract",
    name = "OnUIInteract",
    category = "general",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["OnUIInteract"],
    funcPath = "C_WeeklyRewards.OnUIInteract",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_WeeklyRewards.ShouldShowFinalRetirementMessage"] = {
    key = "C_WeeklyRewards.ShouldShowFinalRetirementMessage",
    name = "ShouldShowFinalRetirementMessage",
    category = "general",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["ShouldShowFinalRetirementMessage"],
    funcPath = "C_WeeklyRewards.ShouldShowFinalRetirementMessage",
    params = {  },
    returns = { { name = "showRetirementMessage", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_WeeklyRewards.ShouldShowRetirementMessage"] = {
    key = "C_WeeklyRewards.ShouldShowRetirementMessage",
    name = "ShouldShowRetirementMessage",
    category = "general",
    subcategory = "c_weeklyrewards",
    func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["ShouldShowRetirementMessage"],
    funcPath = "C_WeeklyRewards.ShouldShowRetirementMessage",
    params = {  },
    returns = { { name = "showRetirementMessage", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

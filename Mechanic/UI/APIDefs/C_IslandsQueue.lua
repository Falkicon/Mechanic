-- Generated APIDefinitions for namespace: C_IslandsQueue
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_IslandsQueue.CloseIslandsQueueScreen"] = {
    key = "C_IslandsQueue.CloseIslandsQueueScreen",
    name = "CloseIslandsQueueScreen",
    category = "general",
    subcategory = "c_islandsqueue",
    funcPath = "C_IslandsQueue.CloseIslandsQueueScreen",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_IslandsQueue.GetIslandDifficultyInfo"] = {
    key = "C_IslandsQueue.GetIslandDifficultyInfo",
    name = "GetIslandDifficultyInfo",
    category = "general",
    subcategory = "c_islandsqueue",
    funcPath = "C_IslandsQueue.GetIslandDifficultyInfo",
    params = {  },
    returns = { { name = "islandDifficultyInfo", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_IslandsQueue.GetIslandsMaxGroupSize"] = {
    key = "C_IslandsQueue.GetIslandsMaxGroupSize",
    name = "GetIslandsMaxGroupSize",
    category = "general",
    subcategory = "c_islandsqueue",
    funcPath = "C_IslandsQueue.GetIslandsMaxGroupSize",
    params = {  },
    returns = { { name = "maxGroupSize", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_IslandsQueue.GetIslandsWeeklyQuestID"] = {
    key = "C_IslandsQueue.GetIslandsWeeklyQuestID",
    name = "GetIslandsWeeklyQuestID",
    category = "general",
    subcategory = "c_islandsqueue",
    funcPath = "C_IslandsQueue.GetIslandsWeeklyQuestID",
    params = {  },
    returns = { { name = "questID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_IslandsQueue.QueueForIsland"] = {
    key = "C_IslandsQueue.QueueForIsland",
    name = "QueueForIsland",
    category = "general",
    subcategory = "c_islandsqueue",
    funcPath = "C_IslandsQueue.QueueForIsland",
    params = { { name = "difficultyID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_IslandsQueue.RequestPreloadRewardData"] = {
    key = "C_IslandsQueue.RequestPreloadRewardData",
    name = "RequestPreloadRewardData",
    category = "general",
    subcategory = "c_islandsqueue",
    funcPath = "C_IslandsQueue.RequestPreloadRewardData",
    params = { { name = "questId", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

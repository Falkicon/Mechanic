-- Generated APIDefinitions for namespace: C_SocialQueue
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SocialQueue.GetAllGroups"] = {
    key = "C_SocialQueue.GetAllGroups",
    name = "GetAllGroups",
    category = "general",
    subcategory = "c_socialqueue",
    funcPath = "C_SocialQueue.GetAllGroups",
    params = { { name = "allowNonJoinable", type = "bool", default = false }, { name = "allowNonQueuedGroups", type = "bool", default = false } },
    returns = { { name = "groupGUIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SocialQueue.GetConfig"] = {
    key = "C_SocialQueue.GetConfig",
    name = "GetConfig",
    category = "general",
    subcategory = "c_socialqueue",
    funcPath = "C_SocialQueue.GetConfig",
    params = {  },
    returns = { { name = "config", type = "SocialQueueConfig", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SocialQueue.GetGroupForPlayer"] = {
    key = "C_SocialQueue.GetGroupForPlayer",
    name = "GetGroupForPlayer",
    category = "general",
    subcategory = "c_socialqueue",
    funcPath = "C_SocialQueue.GetGroupForPlayer",
    params = { { name = "playerGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "groupGUID", type = "WOWGUID", canBeSecret = false }, { name = "isSoloQueueParty", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SocialQueue.GetGroupInfo"] = {
    key = "C_SocialQueue.GetGroupInfo",
    name = "GetGroupInfo",
    category = "general",
    subcategory = "c_socialqueue",
    funcPath = "C_SocialQueue.GetGroupInfo",
    params = { { name = "groupGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "canJoin", type = "bool", canBeSecret = false }, { name = "numQueues", type = "number", canBeSecret = false }, { name = "needTank", type = "bool", canBeSecret = false }, { name = "needHealer", type = "bool", canBeSecret = false }, { name = "needDamage", type = "bool", canBeSecret = false }, { name = "isSoloQueueParty", type = "bool", canBeSecret = false }, { name = "questSessionActive", type = "bool", canBeSecret = false }, { name = "leaderGUID", type = "WOWGUID", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SocialQueue.GetGroupMembers"] = {
    key = "C_SocialQueue.GetGroupMembers",
    name = "GetGroupMembers",
    category = "general",
    subcategory = "c_socialqueue",
    funcPath = "C_SocialQueue.GetGroupMembers",
    params = { { name = "groupGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "groupMembers", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SocialQueue.GetGroupQueues"] = {
    key = "C_SocialQueue.GetGroupQueues",
    name = "GetGroupQueues",
    category = "general",
    subcategory = "c_socialqueue",
    funcPath = "C_SocialQueue.GetGroupQueues",
    params = { { name = "groupGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "queues", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SocialQueue.RequestToJoin"] = {
    key = "C_SocialQueue.RequestToJoin",
    name = "RequestToJoin",
    category = "general",
    subcategory = "c_socialqueue",
    funcPath = "C_SocialQueue.RequestToJoin",
    params = { { name = "groupGUID", type = "WOWGUID", default = nil }, { name = "applyAsTank", type = "bool", default = false }, { name = "applyAsHealer", type = "bool", default = false }, { name = "applyAsDamage", type = "bool", default = false } },
    returns = { { name = "requestSuccessful", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SocialQueue.SignalToastDisplayed"] = {
    key = "C_SocialQueue.SignalToastDisplayed",
    name = "SignalToastDisplayed",
    category = "general",
    subcategory = "c_socialqueue",
    funcPath = "C_SocialQueue.SignalToastDisplayed",
    params = { { name = "groupGUID", type = "WOWGUID", default = nil }, { name = "priority", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_QuestSession
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_QuestSession.CanStart"] = {
    key = "C_QuestSession.CanStart",
    name = "CanStart",
    category = "achievement",
    subcategory = "c_questsession",
    func = _G["C_QuestSession"] and _G["C_QuestSession"]["CanStart"],
    funcPath = "C_QuestSession.CanStart",
    params = {  },
    returns = { { name = "allowed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_QuestSession.CanStop"] = {
    key = "C_QuestSession.CanStop",
    name = "CanStop",
    category = "achievement",
    subcategory = "c_questsession",
    func = _G["C_QuestSession"] and _G["C_QuestSession"]["CanStop"],
    funcPath = "C_QuestSession.CanStop",
    params = {  },
    returns = { { name = "allowed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_QuestSession.Exists"] = {
    key = "C_QuestSession.Exists",
    name = "Exists",
    category = "achievement",
    subcategory = "c_questsession",
    func = _G["C_QuestSession"] and _G["C_QuestSession"]["Exists"],
    funcPath = "C_QuestSession.Exists",
    params = {  },
    returns = { { name = "exists", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_QuestSession.GetAvailableSessionCommand"] = {
    key = "C_QuestSession.GetAvailableSessionCommand",
    name = "GetAvailableSessionCommand",
    category = "achievement",
    subcategory = "c_questsession",
    func = _G["C_QuestSession"] and _G["C_QuestSession"]["GetAvailableSessionCommand"],
    funcPath = "C_QuestSession.GetAvailableSessionCommand",
    params = {  },
    returns = { { name = "command", type = "QuestSessionCommand", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_QuestSession.GetPendingCommand"] = {
    key = "C_QuestSession.GetPendingCommand",
    name = "GetPendingCommand",
    category = "achievement",
    subcategory = "c_questsession",
    func = _G["C_QuestSession"] and _G["C_QuestSession"]["GetPendingCommand"],
    funcPath = "C_QuestSession.GetPendingCommand",
    params = {  },
    returns = { { name = "command", type = "QuestSessionCommand", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_QuestSession.GetProposedMaxLevelForSession"] = {
    key = "C_QuestSession.GetProposedMaxLevelForSession",
    name = "GetProposedMaxLevelForSession",
    category = "achievement",
    subcategory = "c_questsession",
    func = _G["C_QuestSession"] and _G["C_QuestSession"]["GetProposedMaxLevelForSession"],
    funcPath = "C_QuestSession.GetProposedMaxLevelForSession",
    params = {  },
    returns = { { name = "proposedMaxLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_QuestSession.GetSessionBeginDetails"] = {
    key = "C_QuestSession.GetSessionBeginDetails",
    name = "GetSessionBeginDetails",
    category = "achievement",
    subcategory = "c_questsession",
    func = _G["C_QuestSession"] and _G["C_QuestSession"]["GetSessionBeginDetails"],
    funcPath = "C_QuestSession.GetSessionBeginDetails",
    params = {  },
    returns = { { name = "details", type = "QuestSessionPlayerDetails", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_QuestSession.GetSuperTrackedQuest"] = {
    key = "C_QuestSession.GetSuperTrackedQuest",
    name = "GetSuperTrackedQuest",
    category = "achievement",
    subcategory = "c_questsession",
    func = _G["C_QuestSession"] and _G["C_QuestSession"]["GetSuperTrackedQuest"],
    funcPath = "C_QuestSession.GetSuperTrackedQuest",
    params = {  },
    returns = { { name = "questID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_QuestSession.HasJoined"] = {
    key = "C_QuestSession.HasJoined",
    name = "HasJoined",
    category = "achievement",
    subcategory = "c_questsession",
    func = _G["C_QuestSession"] and _G["C_QuestSession"]["HasJoined"],
    funcPath = "C_QuestSession.HasJoined",
    params = {  },
    returns = { { name = "hasJoined", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_QuestSession.HasPendingCommand"] = {
    key = "C_QuestSession.HasPendingCommand",
    name = "HasPendingCommand",
    category = "achievement",
    subcategory = "c_questsession",
    func = _G["C_QuestSession"] and _G["C_QuestSession"]["HasPendingCommand"],
    funcPath = "C_QuestSession.HasPendingCommand",
    params = {  },
    returns = { { name = "hasPendingCommand", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_QuestSession.RequestSessionStart"] = {
    key = "C_QuestSession.RequestSessionStart",
    name = "RequestSessionStart",
    category = "achievement",
    subcategory = "c_questsession",
    func = _G["C_QuestSession"] and _G["C_QuestSession"]["RequestSessionStart"],
    funcPath = "C_QuestSession.RequestSessionStart",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_QuestSession.RequestSessionStop"] = {
    key = "C_QuestSession.RequestSessionStop",
    name = "RequestSessionStop",
    category = "achievement",
    subcategory = "c_questsession",
    func = _G["C_QuestSession"] and _G["C_QuestSession"]["RequestSessionStop"],
    funcPath = "C_QuestSession.RequestSessionStop",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_QuestSession.SendSessionBeginResponse"] = {
    key = "C_QuestSession.SendSessionBeginResponse",
    name = "SendSessionBeginResponse",
    category = "combat_midnight",
    subcategory = "c_questsession",
    func = _G["C_QuestSession"] and _G["C_QuestSession"]["SendSessionBeginResponse"],
    funcPath = "C_QuestSession.SendSessionBeginResponse",
    params = { { name = "beginSession", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestSession.SetQuestIsSuperTracked"] = {
    key = "C_QuestSession.SetQuestIsSuperTracked",
    name = "SetQuestIsSuperTracked",
    category = "combat_midnight",
    subcategory = "c_questsession",
    func = _G["C_QuestSession"] and _G["C_QuestSession"]["SetQuestIsSuperTracked"],
    funcPath = "C_QuestSession.SetQuestIsSuperTracked",
    params = { { name = "questID", type = "number", default = nil }, { name = "superTrack", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

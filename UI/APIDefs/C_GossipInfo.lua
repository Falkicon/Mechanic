-- Generated APIDefinitions for namespace: C_GossipInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_GossipInfo.CloseGossip"] = {
    key = "C_GossipInfo.CloseGossip",
    name = "CloseGossip",
    category = "general",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["CloseGossip"],
    funcPath = "C_GossipInfo.CloseGossip",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_GossipInfo.ForceGossip"] = {
    key = "C_GossipInfo.ForceGossip",
    name = "ForceGossip",
    category = "general",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["ForceGossip"],
    funcPath = "C_GossipInfo.ForceGossip",
    params = {  },
    returns = { { name = "forceGossip", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GossipInfo.GetActiveDelveGossip"] = {
    key = "C_GossipInfo.GetActiveDelveGossip",
    name = "GetActiveDelveGossip",
    category = "general",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetActiveDelveGossip"],
    funcPath = "C_GossipInfo.GetActiveDelveGossip",
    params = {  },
    returns = { { name = "gossip", type = "GossipOptionUIInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GossipInfo.GetActiveQuests"] = {
    key = "C_GossipInfo.GetActiveQuests",
    name = "GetActiveQuests",
    category = "general",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetActiveQuests"],
    funcPath = "C_GossipInfo.GetActiveQuests",
    params = {  },
    returns = { { name = "info", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GossipInfo.GetAvailableQuests"] = {
    key = "C_GossipInfo.GetAvailableQuests",
    name = "GetAvailableQuests",
    category = "general",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetAvailableQuests"],
    funcPath = "C_GossipInfo.GetAvailableQuests",
    params = {  },
    returns = { { name = "info", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GossipInfo.GetCompletedOptionDescriptionString"] = {
    key = "C_GossipInfo.GetCompletedOptionDescriptionString",
    name = "GetCompletedOptionDescriptionString",
    category = "general",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetCompletedOptionDescriptionString"],
    funcPath = "C_GossipInfo.GetCompletedOptionDescriptionString",
    params = {  },
    returns = { { name = "description", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GossipInfo.GetCustomGossipDescriptionString"] = {
    key = "C_GossipInfo.GetCustomGossipDescriptionString",
    name = "GetCustomGossipDescriptionString",
    category = "general",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetCustomGossipDescriptionString"],
    funcPath = "C_GossipInfo.GetCustomGossipDescriptionString",
    params = {  },
    returns = { { name = "description", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GossipInfo.GetFriendshipReputation"] = {
    key = "C_GossipInfo.GetFriendshipReputation",
    name = "GetFriendshipReputation",
    category = "combat_midnight",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetFriendshipReputation"],
    funcPath = "C_GossipInfo.GetFriendshipReputation",
    params = { { name = "friendshipFactionID", type = "number", default = nil } },
    returns = { { name = "reputationInfo", type = "FriendshipReputationInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GossipInfo.GetFriendshipReputationRanks"] = {
    key = "C_GossipInfo.GetFriendshipReputationRanks",
    name = "GetFriendshipReputationRanks",
    category = "combat_midnight",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetFriendshipReputationRanks"],
    funcPath = "C_GossipInfo.GetFriendshipReputationRanks",
    params = { { name = "friendshipFactionID", type = "number", default = nil } },
    returns = { { name = "rankInfo", type = "FriendshipReputationRankInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GossipInfo.GetGossipDelveMapID"] = {
    key = "C_GossipInfo.GetGossipDelveMapID",
    name = "GetGossipDelveMapID",
    category = "general",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetGossipDelveMapID"],
    funcPath = "C_GossipInfo.GetGossipDelveMapID",
    params = {  },
    returns = { { name = "mapID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GossipInfo.GetNumActiveQuests"] = {
    key = "C_GossipInfo.GetNumActiveQuests",
    name = "GetNumActiveQuests",
    category = "general",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetNumActiveQuests"],
    funcPath = "C_GossipInfo.GetNumActiveQuests",
    params = {  },
    returns = { { name = "numQuests", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GossipInfo.GetNumAvailableQuests"] = {
    key = "C_GossipInfo.GetNumAvailableQuests",
    name = "GetNumAvailableQuests",
    category = "general",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetNumAvailableQuests"],
    funcPath = "C_GossipInfo.GetNumAvailableQuests",
    params = {  },
    returns = { { name = "numQuests", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GossipInfo.GetOptionUIWidgetSetsAndTypesByOptionID"] = {
    key = "C_GossipInfo.GetOptionUIWidgetSetsAndTypesByOptionID",
    name = "GetOptionUIWidgetSetsAndTypesByOptionID",
    category = "combat_midnight",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetOptionUIWidgetSetsAndTypesByOptionID"],
    funcPath = "C_GossipInfo.GetOptionUIWidgetSetsAndTypesByOptionID",
    params = { { name = "gossipOptionID", type = "number", default = nil } },
    returns = { { name = "gossipOptionUIWidgetSetsAndTypes", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GossipInfo.GetOptions"] = {
    key = "C_GossipInfo.GetOptions",
    name = "GetOptions",
    category = "general",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetOptions"],
    funcPath = "C_GossipInfo.GetOptions",
    params = {  },
    returns = { { name = "info", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GossipInfo.GetPoiForUiMapID"] = {
    key = "C_GossipInfo.GetPoiForUiMapID",
    name = "GetPoiForUiMapID",
    category = "combat_midnight",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetPoiForUiMapID"],
    funcPath = "C_GossipInfo.GetPoiForUiMapID",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "gossipPoiID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GossipInfo.GetPoiInfo"] = {
    key = "C_GossipInfo.GetPoiInfo",
    name = "GetPoiInfo",
    category = "combat_midnight",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetPoiInfo"],
    funcPath = "C_GossipInfo.GetPoiInfo",
    params = { { name = "uiMapID", type = "number", default = nil }, { name = "gossipPoiID", type = "number", default = nil } },
    returns = { { name = "gossipPoiInfo", type = "GossipPoiInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GossipInfo.GetText"] = {
    key = "C_GossipInfo.GetText",
    name = "GetText",
    category = "general",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetText"],
    funcPath = "C_GossipInfo.GetText",
    params = {  },
    returns = { { name = "gossipText", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GossipInfo.RefreshOptions"] = {
    key = "C_GossipInfo.RefreshOptions",
    name = "RefreshOptions",
    category = "general",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["RefreshOptions"],
    funcPath = "C_GossipInfo.RefreshOptions",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_GossipInfo.SelectActiveQuest"] = {
    key = "C_GossipInfo.SelectActiveQuest",
    name = "SelectActiveQuest",
    category = "combat_midnight",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["SelectActiveQuest"],
    funcPath = "C_GossipInfo.SelectActiveQuest",
    params = { { name = "optionID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GossipInfo.SelectAvailableQuest"] = {
    key = "C_GossipInfo.SelectAvailableQuest",
    name = "SelectAvailableQuest",
    category = "combat_midnight",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["SelectAvailableQuest"],
    funcPath = "C_GossipInfo.SelectAvailableQuest",
    params = { { name = "optionID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GossipInfo.SelectOption"] = {
    key = "C_GossipInfo.SelectOption",
    name = "SelectOption",
    category = "combat_midnight",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["SelectOption"],
    funcPath = "C_GossipInfo.SelectOption",
    params = { { name = "optionID", type = "number", default = nil }, { name = "text", type = "cstring", default = nil }, { name = "confirmed", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GossipInfo.SelectOptionByIndex"] = {
    key = "C_GossipInfo.SelectOptionByIndex",
    name = "SelectOptionByIndex",
    category = "combat_midnight",
    subcategory = "c_gossipinfo",
    func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["SelectOptionByIndex"],
    funcPath = "C_GossipInfo.SelectOptionByIndex",
    params = { { name = "optionID", type = "number", default = nil }, { name = "text", type = "cstring", default = nil }, { name = "confirmed", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

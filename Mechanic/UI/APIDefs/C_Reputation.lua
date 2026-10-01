-- Generated APIDefinitions for namespace: C_Reputation
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Reputation.AreLegacyReputationsShown"] = {
    key = "C_Reputation.AreLegacyReputationsShown",
    name = "AreLegacyReputationsShown",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.AreLegacyReputationsShown",
    params = {  },
    returns = { { name = "areLegacyReputationsShown", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Reputation.CollapseAllFactionHeaders"] = {
    key = "C_Reputation.CollapseAllFactionHeaders",
    name = "CollapseAllFactionHeaders",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.CollapseAllFactionHeaders",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Reputation.CollapseFactionHeader"] = {
    key = "C_Reputation.CollapseFactionHeader",
    name = "CollapseFactionHeader",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.CollapseFactionHeader",
    params = { { name = "factionSortIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.ExpandAllFactionHeaders"] = {
    key = "C_Reputation.ExpandAllFactionHeaders",
    name = "ExpandAllFactionHeaders",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.ExpandAllFactionHeaders",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Reputation.ExpandFactionHeader"] = {
    key = "C_Reputation.ExpandFactionHeader",
    name = "ExpandFactionHeader",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.ExpandFactionHeader",
    params = { { name = "factionSortIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.GetFactionDataByID"] = {
    key = "C_Reputation.GetFactionDataByID",
    name = "GetFactionDataByID",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.GetFactionDataByID",
    params = { { name = "factionID", type = "number", default = nil } },
    returns = { { name = "factionData", type = "FactionData", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.GetFactionDataByIndex"] = {
    key = "C_Reputation.GetFactionDataByIndex",
    name = "GetFactionDataByIndex",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.GetFactionDataByIndex",
    params = { { name = "factionSortIndex", type = "luaIndex", default = nil } },
    returns = { { name = "factionData", type = "FactionData", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.GetFactionParagonInfo"] = {
    key = "C_Reputation.GetFactionParagonInfo",
    name = "GetFactionParagonInfo",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.GetFactionParagonInfo",
    params = { { name = "factionID", type = "number", default = nil } },
    returns = { { name = "currentValue", type = "number", canBeSecret = false }, { name = "threshold", type = "number", canBeSecret = false }, { name = "rewardQuestID", type = "number", canBeSecret = false }, { name = "hasRewardPending", type = "bool", canBeSecret = false }, { name = "tooLowLevelForParagon", type = "bool", canBeSecret = false }, { name = "paragonStorageLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.GetGuildFactionData"] = {
    key = "C_Reputation.GetGuildFactionData",
    name = "GetGuildFactionData",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.GetGuildFactionData",
    params = {  },
    returns = { { name = "guildFactionData", type = "FactionData", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Reputation.GetGuildRepExpirationTime"] = {
    key = "C_Reputation.GetGuildRepExpirationTime",
    name = "GetGuildRepExpirationTime",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.GetGuildRepExpirationTime",
    params = {  },
    returns = { { name = "expirationTime", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Reputation.GetNumFactions"] = {
    key = "C_Reputation.GetNumFactions",
    name = "GetNumFactions",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.GetNumFactions",
    params = {  },
    returns = { { name = "numFactions", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Reputation.GetReputationSortType"] = {
    key = "C_Reputation.GetReputationSortType",
    name = "GetReputationSortType",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.GetReputationSortType",
    params = {  },
    returns = { { name = "sortType", type = "ReputationSortType", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Reputation.GetSelectedFaction"] = {
    key = "C_Reputation.GetSelectedFaction",
    name = "GetSelectedFaction",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.GetSelectedFaction",
    params = {  },
    returns = { { name = "selectedFactionSortIndex", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Reputation.GetWatchedFactionData"] = {
    key = "C_Reputation.GetWatchedFactionData",
    name = "GetWatchedFactionData",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.GetWatchedFactionData",
    params = {  },
    returns = { { name = "watchedFactionData", type = "FactionData", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Reputation.IsAccountWideReputation"] = {
    key = "C_Reputation.IsAccountWideReputation",
    name = "IsAccountWideReputation",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.IsAccountWideReputation",
    params = { { name = "factionID", type = "number", default = nil } },
    returns = { { name = "isAccountWide", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.IsFactionActive"] = {
    key = "C_Reputation.IsFactionActive",
    name = "IsFactionActive",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.IsFactionActive",
    params = { { name = "factionSortIndex", type = "luaIndex", default = nil } },
    returns = { { name = "isActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.IsFactionParagon"] = {
    key = "C_Reputation.IsFactionParagon",
    name = "IsFactionParagon",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.IsFactionParagon",
    params = { { name = "factionID", type = "number", default = nil } },
    returns = { { name = "factionIsParagon", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.IsFactionParagonForCurrentPlayer"] = {
    key = "C_Reputation.IsFactionParagonForCurrentPlayer",
    name = "IsFactionParagonForCurrentPlayer",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.IsFactionParagonForCurrentPlayer",
    params = { { name = "factionID", type = "number", default = nil } },
    returns = { { name = "currentPlayerHasParagon", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.IsMajorFaction"] = {
    key = "C_Reputation.IsMajorFaction",
    name = "IsMajorFaction",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.IsMajorFaction",
    params = { { name = "factionID", type = "number", default = nil } },
    returns = { { name = "isMajorFaction", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.RequestFactionParagonPreloadRewardData"] = {
    key = "C_Reputation.RequestFactionParagonPreloadRewardData",
    name = "RequestFactionParagonPreloadRewardData",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.RequestFactionParagonPreloadRewardData",
    params = { { name = "factionID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.SetFactionActive"] = {
    key = "C_Reputation.SetFactionActive",
    name = "SetFactionActive",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.SetFactionActive",
    params = { { name = "factionSortIndex", type = "luaIndex", default = nil }, { name = "setActive", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.SetLegacyReputationsShown"] = {
    key = "C_Reputation.SetLegacyReputationsShown",
    name = "SetLegacyReputationsShown",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.SetLegacyReputationsShown",
    params = { { name = "showLegacyReputations", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.SetReputationSortType"] = {
    key = "C_Reputation.SetReputationSortType",
    name = "SetReputationSortType",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.SetReputationSortType",
    params = { { name = "sortType", type = "ReputationSortType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.SetSelectedFaction"] = {
    key = "C_Reputation.SetSelectedFaction",
    name = "SetSelectedFaction",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.SetSelectedFaction",
    params = { { name = "factionSortIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.SetWatchedFactionByID"] = {
    key = "C_Reputation.SetWatchedFactionByID",
    name = "SetWatchedFactionByID",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.SetWatchedFactionByID",
    params = { { name = "factionID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.SetWatchedFactionByIndex"] = {
    key = "C_Reputation.SetWatchedFactionByIndex",
    name = "SetWatchedFactionByIndex",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.SetWatchedFactionByIndex",
    params = { { name = "factionSortIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Reputation.ToggleFactionAtWar"] = {
    key = "C_Reputation.ToggleFactionAtWar",
    name = "ToggleFactionAtWar",
    category = "achievement",
    subcategory = "c_reputation",
    funcPath = "C_Reputation.ToggleFactionAtWar",
    params = { { name = "factionSortIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

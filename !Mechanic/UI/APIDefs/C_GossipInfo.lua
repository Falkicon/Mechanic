-- Generated APIDefinitions for namespace: C_GossipInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_GossipInfo.GetFriendshipReputation"] = {
	key = "C_GossipInfo.GetFriendshipReputation",
	name = "GetFriendshipReputation",
	category = "combat_midnight",
	subcategory = "c_gossipinfo",
	func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["GetFriendshipReputation"],
	funcPath = "C_GossipInfo.GetFriendshipReputation",
	params = {
		{
			name = "friendshipFactionID",
			type = "number",
			default = nil,
			examples = { { value = "maxReputation[1]", label = "AllTheThings" } },
		},
	},
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
	params = {
		{ name = "uiMapID", type = "number", default = nil },
		{ name = "gossipPoiID", type = "number", default = nil },
	},
	returns = { { name = "gossipPoiInfo", type = "GossipPoiInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GossipInfo.SelectActiveQuest"] = {
	key = "C_GossipInfo.SelectActiveQuest",
	name = "SelectActiveQuest",
	category = "combat_midnight",
	subcategory = "c_gossipinfo",
	func = _G["C_GossipInfo"] and _G["C_GossipInfo"]["SelectActiveQuest"],
	funcPath = "C_GossipInfo.SelectActiveQuest",
	params = { { name = "optionID", type = "number", default = nil } },
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "optionID",
			type = "number",
			default = nil,
			examples = {
				{ value = "realGossipOptionID", label = "DBM-Core" },
				{ value = "gossipOptionID", label = "DBM-Core" },
				{ value = "gossipInfoTable[1].gossipOptionID", label = "Leatrix_Plus" },
			},
		},
		{ name = "text", type = "cstring", default = nil },
		{ name = "confirmed", type = "bool", default = nil },
	},
	returns = {},
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
	params = {
		{
			name = "optionID",
			type = "number",
			default = nil,
			examples = { { value = "gossipOptionID", label = "DBM-Core" } },
		},
		{ name = "text", type = "cstring", default = nil },
		{ name = "confirmed", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

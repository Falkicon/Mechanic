-- Generated APIDefinitions for namespace: C_QuestLog
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_QuestLog.AddQuestWatch"] = {
	key = "C_QuestLog.AddQuestWatch",
	name = "AddQuestWatch",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["AddQuestWatch"],
	funcPath = "C_QuestLog.AddQuestWatch",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "wasWatched", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.AddWorldQuestWatch"] = {
	key = "C_QuestLog.AddWorldQuestWatch",
	name = "AddWorldQuestWatch",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["AddWorldQuestWatch"],
	funcPath = "C_QuestLog.AddWorldQuestWatch",
	params = {
		{ name = "questID", type = "number", default = nil },
		{ name = "watchType", type = "QuestWatchType", default = nil },
	},
	returns = { { name = "wasWatched", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.CanAbandonQuest"] = {
	key = "C_QuestLog.CanAbandonQuest",
	name = "CanAbandonQuest",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["CanAbandonQuest"],
	funcPath = "C_QuestLog.CanAbandonQuest",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "canAbandon", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.DoesQuestAwardReputationWithFaction"] = {
	key = "C_QuestLog.DoesQuestAwardReputationWithFaction",
	name = "DoesQuestAwardReputationWithFaction",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["DoesQuestAwardReputationWithFaction"],
	funcPath = "C_QuestLog.DoesQuestAwardReputationWithFaction",
	params = {
		{ name = "questID", type = "number", default = nil },
		{ name = "targetFactionID", type = "number", default = nil },
	},
	returns = { { name = "awardsReputation", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetBountiesForMapID"] = {
	key = "C_QuestLog.GetBountiesForMapID",
	name = "GetBountiesForMapID",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetBountiesForMapID"],
	funcPath = "C_QuestLog.GetBountiesForMapID",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "bounties", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetBountySetInfoForMapID"] = {
	key = "C_QuestLog.GetBountySetInfoForMapID",
	name = "GetBountySetInfoForMapID",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetBountySetInfoForMapID"],
	funcPath = "C_QuestLog.GetBountySetInfoForMapID",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = {
		{ name = "displayLocation", type = "MapOverlayDisplayLocation", canBeSecret = false },
		{ name = "lockQuestID", type = "number", canBeSecret = false },
		{ name = "bountySetID", type = "number", canBeSecret = false },
		{ name = "isActivitySet", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetDistanceSqToQuest"] = {
	key = "C_QuestLog.GetDistanceSqToQuest",
	name = "GetDistanceSqToQuest",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetDistanceSqToQuest"],
	funcPath = "C_QuestLog.GetDistanceSqToQuest",
	params = { { name = "questID", type = "number", default = nil } },
	returns = {
		{ name = "distanceSq", type = "number", canBeSecret = false },
		{ name = "onContinent", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetHeaderIndexForQuest"] = {
	key = "C_QuestLog.GetHeaderIndexForQuest",
	name = "GetHeaderIndexForQuest",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetHeaderIndexForQuest"],
	funcPath = "C_QuestLog.GetHeaderIndexForQuest",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "index", type = "luaIndex", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetInfo"] = {
	key = "C_QuestLog.GetInfo",
	name = "GetInfo",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetInfo"],
	funcPath = "C_QuestLog.GetInfo",
	params = {
		{
			name = "questLogIndex",
			type = "luaIndex",
			default = nil,
			examples = {
				{ value = "C_QuestLog.GetLogIndexForQuestID(questID) or 0", label = "DBM-WorldEvents" },
				{ value = "id", label = "Narcissus" },
			},
		},
	},
	returns = { { name = "info", type = "QuestInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetLogIndexForQuestID"] = {
	key = "C_QuestLog.GetLogIndexForQuestID",
	name = "GetLogIndexForQuestID",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetLogIndexForQuestID"],
	funcPath = "C_QuestLog.GetLogIndexForQuestID",
	params = {
		{
			name = "questID",
			type = "number",
			default = nil,
			examples = { { value = "arg1", label = "Leatrix_Plus" }, { value = "line.id", label = "Plumber" } },
		},
	},
	returns = { { name = "questLogIndex", type = "luaIndex", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetNextWaypoint"] = {
	key = "C_QuestLog.GetNextWaypoint",
	name = "GetNextWaypoint",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetNextWaypoint"],
	funcPath = "C_QuestLog.GetNextWaypoint",
	params = { { name = "questID", type = "number", default = nil } },
	returns = {
		{ name = "mapID", type = "number", canBeSecret = false },
		{ name = "x", type = "number", canBeSecret = false },
		{ name = "y", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetNextWaypointForMap"] = {
	key = "C_QuestLog.GetNextWaypointForMap",
	name = "GetNextWaypointForMap",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetNextWaypointForMap"],
	funcPath = "C_QuestLog.GetNextWaypointForMap",
	params = {
		{ name = "questID", type = "number", default = nil },
		{ name = "uiMapID", type = "number", default = nil },
	},
	returns = {
		{ name = "x", type = "number", canBeSecret = false },
		{ name = "y", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetNextWaypointText"] = {
	key = "C_QuestLog.GetNextWaypointText",
	name = "GetNextWaypointText",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetNextWaypointText"],
	funcPath = "C_QuestLog.GetNextWaypointText",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "waypointText", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetNumQuestObjectives"] = {
	key = "C_QuestLog.GetNumQuestObjectives",
	name = "GetNumQuestObjectives",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetNumQuestObjectives"],
	funcPath = "C_QuestLog.GetNumQuestObjectives",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "leaderboardCount", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetQuestAdditionalHighlights"] = {
	key = "C_QuestLog.GetQuestAdditionalHighlights",
	name = "GetQuestAdditionalHighlights",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetQuestAdditionalHighlights"],
	funcPath = "C_QuestLog.GetQuestAdditionalHighlights",
	params = { { name = "questID", type = "number", default = nil } },
	returns = {
		{ name = "uiMapID", type = "number", canBeSecret = false },
		{ name = "worldQuests", type = "bool", canBeSecret = false },
		{ name = "worldQuestsElite", type = "bool", canBeSecret = false },
		{ name = "dungeons", type = "bool", canBeSecret = false },
		{ name = "treasures", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetQuestDetailsTheme"] = {
	key = "C_QuestLog.GetQuestDetailsTheme",
	name = "GetQuestDetailsTheme",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetQuestDetailsTheme"],
	funcPath = "C_QuestLog.GetQuestDetailsTheme",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "theme", type = "QuestTheme", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetQuestDifficultyLevel"] = {
	key = "C_QuestLog.GetQuestDifficultyLevel",
	name = "GetQuestDifficultyLevel",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetQuestDifficultyLevel"],
	funcPath = "C_QuestLog.GetQuestDifficultyLevel",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "level", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetQuestIDForLogIndex"] = {
	key = "C_QuestLog.GetQuestIDForLogIndex",
	name = "GetQuestIDForLogIndex",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetQuestIDForLogIndex"],
	funcPath = "C_QuestLog.GetQuestIDForLogIndex",
	params = { { name = "questLogIndex", type = "luaIndex", default = nil } },
	returns = { { name = "questID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetQuestIDForQuestWatchIndex"] = {
	key = "C_QuestLog.GetQuestIDForQuestWatchIndex",
	name = "GetQuestIDForQuestWatchIndex",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetQuestIDForQuestWatchIndex"],
	funcPath = "C_QuestLog.GetQuestIDForQuestWatchIndex",
	params = { { name = "questWatchIndex", type = "luaIndex", default = nil } },
	returns = { { name = "questID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetQuestIDForWorldQuestWatchIndex"] = {
	key = "C_QuestLog.GetQuestIDForWorldQuestWatchIndex",
	name = "GetQuestIDForWorldQuestWatchIndex",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetQuestIDForWorldQuestWatchIndex"],
	funcPath = "C_QuestLog.GetQuestIDForWorldQuestWatchIndex",
	params = { { name = "questWatchIndex", type = "luaIndex", default = nil } },
	returns = { { name = "questID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetQuestLogMajorFactionReputationRewards"] = {
	key = "C_QuestLog.GetQuestLogMajorFactionReputationRewards",
	name = "GetQuestLogMajorFactionReputationRewards",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetQuestLogMajorFactionReputationRewards"],
	funcPath = "C_QuestLog.GetQuestLogMajorFactionReputationRewards",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "reputationRewards", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetQuestLogPortraitGiver"] = {
	key = "C_QuestLog.GetQuestLogPortraitGiver",
	name = "GetQuestLogPortraitGiver",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetQuestLogPortraitGiver"],
	funcPath = "C_QuestLog.GetQuestLogPortraitGiver",
	params = { { name = "questLogIndex", type = "luaIndex", default = nil } },
	returns = {
		{ name = "portraitGiver", type = "number", canBeSecret = false },
		{ name = "portraitGiverText", type = "cstring", canBeSecret = false },
		{ name = "portraitGiverName", type = "cstring", canBeSecret = false },
		{ name = "portraitGiverMount", type = "number", canBeSecret = false },
		{ name = "portraitGiverModelSceneID", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetQuestObjectives"] = {
	key = "C_QuestLog.GetQuestObjectives",
	name = "GetQuestObjectives",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetQuestObjectives"],
	funcPath = "C_QuestLog.GetQuestObjectives",
	params = {
		{ name = "questID", type = "number", default = nil, examples = { { value = "id", label = "Weekly" } } },
	},
	returns = { { name = "objectives", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetQuestRewardCurrencies"] = {
	key = "C_QuestLog.GetQuestRewardCurrencies",
	name = "GetQuestRewardCurrencies",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetQuestRewardCurrencies"],
	funcPath = "C_QuestLog.GetQuestRewardCurrencies",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "questRewardCurrencies", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetQuestRewardCurrencyInfo"] = {
	key = "C_QuestLog.GetQuestRewardCurrencyInfo",
	name = "GetQuestRewardCurrencyInfo",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetQuestRewardCurrencyInfo"],
	funcPath = "C_QuestLog.GetQuestRewardCurrencyInfo",
	params = {
		{ name = "questID", type = "number", default = nil },
		{ name = "currencyIndex", type = "luaIndex", default = nil },
		{ name = "isChoice", type = "bool", default = nil },
	},
	returns = { { name = "questRewardCurrencyInfo", type = "QuestRewardCurrencyInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetQuestTagInfo"] = {
	key = "C_QuestLog.GetQuestTagInfo",
	name = "GetQuestTagInfo",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetQuestTagInfo"],
	funcPath = "C_QuestLog.GetQuestTagInfo",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "info", type = "QuestTagInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetQuestType"] = {
	key = "C_QuestLog.GetQuestType",
	name = "GetQuestType",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetQuestType"],
	funcPath = "C_QuestLog.GetQuestType",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "questType", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetQuestWatchType"] = {
	key = "C_QuestLog.GetQuestWatchType",
	name = "GetQuestWatchType",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetQuestWatchType"],
	funcPath = "C_QuestLog.GetQuestWatchType",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "watchType", type = "QuestWatchType", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetQuestsOnMap"] = {
	key = "C_QuestLog.GetQuestsOnMap",
	name = "GetQuestsOnMap",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetQuestsOnMap"],
	funcPath = "C_QuestLog.GetQuestsOnMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "quests", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetRequiredMoney"] = {
	key = "C_QuestLog.GetRequiredMoney",
	name = "GetRequiredMoney",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetRequiredMoney"],
	funcPath = "C_QuestLog.GetRequiredMoney",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "requiredMoney", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetSuggestedGroupSize"] = {
	key = "C_QuestLog.GetSuggestedGroupSize",
	name = "GetSuggestedGroupSize",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetSuggestedGroupSize"],
	funcPath = "C_QuestLog.GetSuggestedGroupSize",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "suggestedGroupSize", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetTimeAllowed"] = {
	key = "C_QuestLog.GetTimeAllowed",
	name = "GetTimeAllowed",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetTimeAllowed"],
	funcPath = "C_QuestLog.GetTimeAllowed",
	params = { { name = "questID", type = "number", default = nil } },
	returns = {
		{ name = "totalTime", type = "number", canBeSecret = false },
		{ name = "elapsedTime", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetTitleForLogIndex"] = {
	key = "C_QuestLog.GetTitleForLogIndex",
	name = "GetTitleForLogIndex",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetTitleForLogIndex"],
	funcPath = "C_QuestLog.GetTitleForLogIndex",
	params = { { name = "questLogIndex", type = "luaIndex", default = nil } },
	returns = { { name = "title", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetTitleForQuestID"] = {
	key = "C_QuestLog.GetTitleForQuestID",
	name = "GetTitleForQuestID",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetTitleForQuestID"],
	funcPath = "C_QuestLog.GetTitleForQuestID",
	params = {
		{ name = "questID", type = "number", default = nil, examples = { { value = "id", label = "AllTheThings" } } },
	},
	returns = { { name = "title", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.GetZoneStoryInfo"] = {
	key = "C_QuestLog.GetZoneStoryInfo",
	name = "GetZoneStoryInfo",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["GetZoneStoryInfo"],
	funcPath = "C_QuestLog.GetZoneStoryInfo",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = {
		{ name = "achievementID", type = "number", canBeSecret = false },
		{ name = "storyMapID", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsAccountQuest"] = {
	key = "C_QuestLog.IsAccountQuest",
	name = "IsAccountQuest",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsAccountQuest"],
	funcPath = "C_QuestLog.IsAccountQuest",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isAccountQuest", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsComplete"] = {
	key = "C_QuestLog.IsComplete",
	name = "IsComplete",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsComplete"],
	funcPath = "C_QuestLog.IsComplete",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isComplete", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsFailed"] = {
	key = "C_QuestLog.IsFailed",
	name = "IsFailed",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsFailed"],
	funcPath = "C_QuestLog.IsFailed",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isFailed", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsImportantQuest"] = {
	key = "C_QuestLog.IsImportantQuest",
	name = "IsImportantQuest",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsImportantQuest"],
	funcPath = "C_QuestLog.IsImportantQuest",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isImportant", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsMetaQuest"] = {
	key = "C_QuestLog.IsMetaQuest",
	name = "IsMetaQuest",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsMetaQuest"],
	funcPath = "C_QuestLog.IsMetaQuest",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isMeta", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsOnMap"] = {
	key = "C_QuestLog.IsOnMap",
	name = "IsOnMap",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsOnMap"],
	funcPath = "C_QuestLog.IsOnMap",
	params = { { name = "questID", type = "number", default = nil } },
	returns = {
		{ name = "onMap", type = "bool", canBeSecret = false },
		{ name = "hasLocalPOI", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsOnQuest"] = {
	key = "C_QuestLog.IsOnQuest",
	name = "IsOnQuest",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsOnQuest"],
	funcPath = "C_QuestLog.IsOnQuest",
	params = {
		{
			name = "questID",
			type = "number",
			default = nil,
			examples = {
				{ value = "id", label = "Weekly" },
				{ value = 13697, label = "AllTheThings" },
				{ value = 13714, label = "AllTheThings" },
			},
		},
	},
	returns = { { name = "isOnQuest", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsPushableQuest"] = {
	key = "C_QuestLog.IsPushableQuest",
	name = "IsPushableQuest",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsPushableQuest"],
	funcPath = "C_QuestLog.IsPushableQuest",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isPushable", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsQuestBounty"] = {
	key = "C_QuestLog.IsQuestBounty",
	name = "IsQuestBounty",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsQuestBounty"],
	funcPath = "C_QuestLog.IsQuestBounty",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isBounty", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsQuestCalling"] = {
	key = "C_QuestLog.IsQuestCalling",
	name = "IsQuestCalling",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsQuestCalling"],
	funcPath = "C_QuestLog.IsQuestCalling",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isCalling", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsQuestCriteriaForBounty"] = {
	key = "C_QuestLog.IsQuestCriteriaForBounty",
	name = "IsQuestCriteriaForBounty",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsQuestCriteriaForBounty"],
	funcPath = "C_QuestLog.IsQuestCriteriaForBounty",
	params = {
		{ name = "questID", type = "number", default = nil },
		{ name = "bountyQuestID", type = "number", default = nil },
	},
	returns = { { name = "isCriteriaForBounty", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsQuestDisabledForSession"] = {
	key = "C_QuestLog.IsQuestDisabledForSession",
	name = "IsQuestDisabledForSession",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsQuestDisabledForSession"],
	funcPath = "C_QuestLog.IsQuestDisabledForSession",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isDisabled", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsQuestFlaggedCompleted"] = {
	key = "C_QuestLog.IsQuestFlaggedCompleted",
	name = "IsQuestFlaggedCompleted",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsQuestFlaggedCompleted"],
	funcPath = "C_QuestLog.IsQuestFlaggedCompleted",
	params = {
		{
			name = "questID",
			type = "number",
			default = nil,
			examples = {
				{ value = "id", label = "Weekly" },
				{ value = "pinInfo[7]", label = "Leatrix_Maps" },
				{ value = "pinInfo[8]", label = "Leatrix_Maps" },
			},
		},
	},
	returns = { { name = "isCompleted", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsQuestFlaggedCompletedOnAccount"] = {
	key = "C_QuestLog.IsQuestFlaggedCompletedOnAccount",
	name = "IsQuestFlaggedCompletedOnAccount",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsQuestFlaggedCompletedOnAccount"],
	funcPath = "C_QuestLog.IsQuestFlaggedCompletedOnAccount",
	params = {
		{
			name = "questID",
			type = "number",
			default = nil,
			examples = { { value = 86961, label = "Plumber" }, { value = "id", label = "AllTheThings" } },
		},
	},
	returns = { { name = "isCompletedOnAccount", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsQuestFromContentPush"] = {
	key = "C_QuestLog.IsQuestFromContentPush",
	name = "IsQuestFromContentPush",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsQuestFromContentPush"],
	funcPath = "C_QuestLog.IsQuestFromContentPush",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isFromContentPush", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsQuestInvasion"] = {
	key = "C_QuestLog.IsQuestInvasion",
	name = "IsQuestInvasion",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsQuestInvasion"],
	funcPath = "C_QuestLog.IsQuestInvasion",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isInvasion", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsQuestReplayable"] = {
	key = "C_QuestLog.IsQuestReplayable",
	name = "IsQuestReplayable",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsQuestReplayable"],
	funcPath = "C_QuestLog.IsQuestReplayable",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isReplayable", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsQuestReplayedRecently"] = {
	key = "C_QuestLog.IsQuestReplayedRecently",
	name = "IsQuestReplayedRecently",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsQuestReplayedRecently"],
	funcPath = "C_QuestLog.IsQuestReplayedRecently",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "recentlyReplayed", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsQuestTask"] = {
	key = "C_QuestLog.IsQuestTask",
	name = "IsQuestTask",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsQuestTask"],
	funcPath = "C_QuestLog.IsQuestTask",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isTask", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsQuestTrivial"] = {
	key = "C_QuestLog.IsQuestTrivial",
	name = "IsQuestTrivial",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsQuestTrivial"],
	funcPath = "C_QuestLog.IsQuestTrivial",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isTrivial", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsRepeatableQuest"] = {
	key = "C_QuestLog.IsRepeatableQuest",
	name = "IsRepeatableQuest",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsRepeatableQuest"],
	funcPath = "C_QuestLog.IsRepeatableQuest",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isRepeatable", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsThreatQuest"] = {
	key = "C_QuestLog.IsThreatQuest",
	name = "IsThreatQuest",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsThreatQuest"],
	funcPath = "C_QuestLog.IsThreatQuest",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isThreat", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsUnitOnQuest"] = {
	key = "C_QuestLog.IsUnitOnQuest",
	name = "IsUnitOnQuest",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsUnitOnQuest"],
	funcPath = "C_QuestLog.IsUnitOnQuest",
	params = {
		{ name = "unit", type = "UnitToken", default = "player", examples = { { value = "unit", label = "Details" } } },
		{ name = "questID", type = "number", default = nil },
	},
	returns = { { name = "isOnQuest", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.IsWorldQuest"] = {
	key = "C_QuestLog.IsWorldQuest",
	name = "IsWorldQuest",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["IsWorldQuest"],
	funcPath = "C_QuestLog.IsWorldQuest",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "isWorldQuest", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.QuestCanHaveWarModeBonus"] = {
	key = "C_QuestLog.QuestCanHaveWarModeBonus",
	name = "QuestCanHaveWarModeBonus",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["QuestCanHaveWarModeBonus"],
	funcPath = "C_QuestLog.QuestCanHaveWarModeBonus",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "hasBonus", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.QuestContainsFirstTimeRepBonusForPlayer"] = {
	key = "C_QuestLog.QuestContainsFirstTimeRepBonusForPlayer",
	name = "QuestContainsFirstTimeRepBonusForPlayer",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["QuestContainsFirstTimeRepBonusForPlayer"],
	funcPath = "C_QuestLog.QuestContainsFirstTimeRepBonusForPlayer",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "questContainsFirstTimeRepBonusForPlayer", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.QuestHasQuestSessionBonus"] = {
	key = "C_QuestLog.QuestHasQuestSessionBonus",
	name = "QuestHasQuestSessionBonus",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["QuestHasQuestSessionBonus"],
	funcPath = "C_QuestLog.QuestHasQuestSessionBonus",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "hasBonus", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.QuestHasWarModeBonus"] = {
	key = "C_QuestLog.QuestHasWarModeBonus",
	name = "QuestHasWarModeBonus",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["QuestHasWarModeBonus"],
	funcPath = "C_QuestLog.QuestHasWarModeBonus",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "hasBonus", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.QuestIgnoresAccountCompletedFiltering"] = {
	key = "C_QuestLog.QuestIgnoresAccountCompletedFiltering",
	name = "QuestIgnoresAccountCompletedFiltering",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["QuestIgnoresAccountCompletedFiltering"],
	funcPath = "C_QuestLog.QuestIgnoresAccountCompletedFiltering",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "questIgnoresAccountCompletedFiltering", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.ReadyForTurnIn"] = {
	key = "C_QuestLog.ReadyForTurnIn",
	name = "ReadyForTurnIn",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["ReadyForTurnIn"],
	funcPath = "C_QuestLog.ReadyForTurnIn",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "readyForTurnIn", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.RemoveQuestWatch"] = {
	key = "C_QuestLog.RemoveQuestWatch",
	name = "RemoveQuestWatch",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["RemoveQuestWatch"],
	funcPath = "C_QuestLog.RemoveQuestWatch",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "wasRemoved", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.RemoveWorldQuestWatch"] = {
	key = "C_QuestLog.RemoveWorldQuestWatch",
	name = "RemoveWorldQuestWatch",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["RemoveWorldQuestWatch"],
	funcPath = "C_QuestLog.RemoveWorldQuestWatch",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "wasRemoved", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.RequestLoadQuestByID"] = {
	key = "C_QuestLog.RequestLoadQuestByID",
	name = "RequestLoadQuestByID",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["RequestLoadQuestByID"],
	funcPath = "C_QuestLog.RequestLoadQuestByID",
	params = {
		{
			name = "questID",
			type = "number",
			default = nil,
			examples = { { value = "arg1", label = "Leatrix_Plus" }, { value = "id", label = "AllTheThings" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.SetMapForQuestPOIs"] = {
	key = "C_QuestLog.SetMapForQuestPOIs",
	name = "SetMapForQuestPOIs",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["SetMapForQuestPOIs"],
	funcPath = "C_QuestLog.SetMapForQuestPOIs",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.SetSelectedQuest"] = {
	key = "C_QuestLog.SetSelectedQuest",
	name = "SetSelectedQuest",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["SetSelectedQuest"],
	funcPath = "C_QuestLog.SetSelectedQuest",
	params = { { name = "questID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.ShouldDisplayTimeRemaining"] = {
	key = "C_QuestLog.ShouldDisplayTimeRemaining",
	name = "ShouldDisplayTimeRemaining",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["ShouldDisplayTimeRemaining"],
	funcPath = "C_QuestLog.ShouldDisplayTimeRemaining",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "displayTimeRemaining", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.ShouldShowQuestRewards"] = {
	key = "C_QuestLog.ShouldShowQuestRewards",
	name = "ShouldShowQuestRewards",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["ShouldShowQuestRewards"],
	funcPath = "C_QuestLog.ShouldShowQuestRewards",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "shouldShow", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLog.UnitIsRelatedToActiveQuest"] = {
	key = "C_QuestLog.UnitIsRelatedToActiveQuest",
	name = "UnitIsRelatedToActiveQuest",
	category = "combat_midnight",
	subcategory = "c_questlog",
	func = _G["C_QuestLog"] and _G["C_QuestLog"]["UnitIsRelatedToActiveQuest"],
	funcPath = "C_QuestLog.UnitIsRelatedToActiveQuest",
	params = { { name = "unit", type = "UnitToken", default = "player" } },
	returns = { { name = "isRelatedToActiveQuest", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

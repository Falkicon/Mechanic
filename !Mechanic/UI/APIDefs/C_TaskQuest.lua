-- Generated APIDefinitions for namespace: C_TaskQuest
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_TaskQuest.DoesMapShowTaskQuestObjectives"] = {
	key = "C_TaskQuest.DoesMapShowTaskQuestObjectives",
	name = "DoesMapShowTaskQuestObjectives",
	category = "combat_midnight",
	subcategory = "c_taskquest",
	func = _G["C_TaskQuest"] and _G["C_TaskQuest"]["DoesMapShowTaskQuestObjectives"],
	funcPath = "C_TaskQuest.DoesMapShowTaskQuestObjectives",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "showsTaskQuestObjectives", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TaskQuest.GetQuestInfoByQuestID"] = {
	key = "C_TaskQuest.GetQuestInfoByQuestID",
	name = "GetQuestInfoByQuestID",
	category = "combat_midnight",
	subcategory = "c_taskquest",
	func = _G["C_TaskQuest"] and _G["C_TaskQuest"]["GetQuestInfoByQuestID"],
	funcPath = "C_TaskQuest.GetQuestInfoByQuestID",
	params = {
		{ name = "questID", type = "number", default = nil, examples = { { value = "arg1", label = "Leatrix_Plus" } } },
	},
	returns = {
		{ name = "questTitle", type = "cstring", canBeSecret = false },
		{ name = "factionID", type = "number", canBeSecret = false },
		{ name = "capped", type = "bool", canBeSecret = false },
		{ name = "displayAsObjective", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TaskQuest.GetQuestLocation"] = {
	key = "C_TaskQuest.GetQuestLocation",
	name = "GetQuestLocation",
	category = "combat_midnight",
	subcategory = "c_taskquest",
	func = _G["C_TaskQuest"] and _G["C_TaskQuest"]["GetQuestLocation"],
	funcPath = "C_TaskQuest.GetQuestLocation",
	params = {
		{ name = "questID", type = "number", default = nil },
		{ name = "uiMapID", type = "number", default = nil },
	},
	returns = {
		{ name = "locationX", type = "number", canBeSecret = false },
		{ name = "locationY", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TaskQuest.GetQuestProgressBarInfo"] = {
	key = "C_TaskQuest.GetQuestProgressBarInfo",
	name = "GetQuestProgressBarInfo",
	category = "combat_midnight",
	subcategory = "c_taskquest",
	func = _G["C_TaskQuest"] and _G["C_TaskQuest"]["GetQuestProgressBarInfo"],
	funcPath = "C_TaskQuest.GetQuestProgressBarInfo",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "progress", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TaskQuest.GetQuestTimeLeftMinutes"] = {
	key = "C_TaskQuest.GetQuestTimeLeftMinutes",
	name = "GetQuestTimeLeftMinutes",
	category = "combat_midnight",
	subcategory = "c_taskquest",
	func = _G["C_TaskQuest"] and _G["C_TaskQuest"]["GetQuestTimeLeftMinutes"],
	funcPath = "C_TaskQuest.GetQuestTimeLeftMinutes",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "minutesLeft", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TaskQuest.GetQuestTimeLeftSeconds"] = {
	key = "C_TaskQuest.GetQuestTimeLeftSeconds",
	name = "GetQuestTimeLeftSeconds",
	category = "combat_midnight",
	subcategory = "c_taskquest",
	func = _G["C_TaskQuest"] and _G["C_TaskQuest"]["GetQuestTimeLeftSeconds"],
	funcPath = "C_TaskQuest.GetQuestTimeLeftSeconds",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "secondsLeft", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TaskQuest.GetQuestUIWidgetSetByType"] = {
	key = "C_TaskQuest.GetQuestUIWidgetSetByType",
	name = "GetQuestUIWidgetSetByType",
	category = "combat_midnight",
	subcategory = "c_taskquest",
	func = _G["C_TaskQuest"] and _G["C_TaskQuest"]["GetQuestUIWidgetSetByType"],
	funcPath = "C_TaskQuest.GetQuestUIWidgetSetByType",
	params = {
		{ name = "questID", type = "number", default = nil },
		{ name = "type", type = "MapIconUIWidgetSetType", default = nil },
	},
	returns = { { name = "widgetSet", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TaskQuest.GetQuestZoneID"] = {
	key = "C_TaskQuest.GetQuestZoneID",
	name = "GetQuestZoneID",
	category = "combat_midnight",
	subcategory = "c_taskquest",
	func = _G["C_TaskQuest"] and _G["C_TaskQuest"]["GetQuestZoneID"],
	funcPath = "C_TaskQuest.GetQuestZoneID",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "uiMapID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TaskQuest.GetQuestsOnMap"] = {
	key = "C_TaskQuest.GetQuestsOnMap",
	name = "GetQuestsOnMap",
	category = "combat_midnight",
	subcategory = "c_taskquest",
	func = _G["C_TaskQuest"] and _G["C_TaskQuest"]["GetQuestsOnMap"],
	funcPath = "C_TaskQuest.GetQuestsOnMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "taskPOIs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TaskQuest.IsActive"] = {
	key = "C_TaskQuest.IsActive",
	name = "IsActive",
	category = "combat_midnight",
	subcategory = "c_taskquest",
	func = _G["C_TaskQuest"] and _G["C_TaskQuest"]["IsActive"],
	funcPath = "C_TaskQuest.IsActive",
	params = { { name = "questID", type = "number", default = nil } },
	returns = { { name = "active", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TaskQuest.RequestPreloadRewardData"] = {
	key = "C_TaskQuest.RequestPreloadRewardData",
	name = "RequestPreloadRewardData",
	category = "combat_midnight",
	subcategory = "c_taskquest",
	func = _G["C_TaskQuest"] and _G["C_TaskQuest"]["RequestPreloadRewardData"],
	funcPath = "C_TaskQuest.RequestPreloadRewardData",
	params = { { name = "questID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

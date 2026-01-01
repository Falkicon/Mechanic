-- Generated APIDefinitions for namespace: C_QuestLine
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_QuestLine.GetAvailableQuestLines"] = {
	key = "C_QuestLine.GetAvailableQuestLines",
	name = "GetAvailableQuestLines",
	category = "combat_midnight",
	subcategory = "c_questline",
	func = _G["C_QuestLine"] and _G["C_QuestLine"]["GetAvailableQuestLines"],
	funcPath = "C_QuestLine.GetAvailableQuestLines",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "questLines", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLine.GetForceVisibleQuests"] = {
	key = "C_QuestLine.GetForceVisibleQuests",
	name = "GetForceVisibleQuests",
	category = "combat_midnight",
	subcategory = "c_questline",
	func = _G["C_QuestLine"] and _G["C_QuestLine"]["GetForceVisibleQuests"],
	funcPath = "C_QuestLine.GetForceVisibleQuests",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "questIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLine.GetQuestLineInfo"] = {
	key = "C_QuestLine.GetQuestLineInfo",
	name = "GetQuestLineInfo",
	category = "combat_midnight",
	subcategory = "c_questline",
	func = _G["C_QuestLine"] and _G["C_QuestLine"]["GetQuestLineInfo"],
	funcPath = "C_QuestLine.GetQuestLineInfo",
	params = {
		{ name = "questID", type = "number", default = nil },
		{ name = "uiMapID", type = "number", default = nil },
		{ name = "displayableOnly", type = "bool", default = false },
	},
	returns = { { name = "questLineInfo", type = "QuestLineInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLine.GetQuestLineQuests"] = {
	key = "C_QuestLine.GetQuestLineQuests",
	name = "GetQuestLineQuests",
	category = "combat_midnight",
	subcategory = "c_questline",
	func = _G["C_QuestLine"] and _G["C_QuestLine"]["GetQuestLineQuests"],
	funcPath = "C_QuestLine.GetQuestLineQuests",
	params = {
		{ name = "questLineID", type = "number", default = nil, examples = { { value = 5572, label = "Plumber" } } },
	},
	returns = { { name = "questIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLine.IsComplete"] = {
	key = "C_QuestLine.IsComplete",
	name = "IsComplete",
	category = "combat_midnight",
	subcategory = "c_questline",
	func = _G["C_QuestLine"] and _G["C_QuestLine"]["IsComplete"],
	funcPath = "C_QuestLine.IsComplete",
	params = { { name = "questLineID", type = "number", default = nil } },
	returns = { { name = "isComplete", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLine.QuestLineIgnoresAccountCompletedFiltering"] = {
	key = "C_QuestLine.QuestLineIgnoresAccountCompletedFiltering",
	name = "QuestLineIgnoresAccountCompletedFiltering",
	category = "combat_midnight",
	subcategory = "c_questline",
	func = _G["C_QuestLine"] and _G["C_QuestLine"]["QuestLineIgnoresAccountCompletedFiltering"],
	funcPath = "C_QuestLine.QuestLineIgnoresAccountCompletedFiltering",
	params = {
		{ name = "uiMapID", type = "number", default = nil },
		{ name = "questLineID", type = "number", default = nil },
	},
	returns = { { name = "questLineIgnoresAccountCompletedFiltering", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestLine.RequestQuestLinesForMap"] = {
	key = "C_QuestLine.RequestQuestLinesForMap",
	name = "RequestQuestLinesForMap",
	category = "combat_midnight",
	subcategory = "c_questline",
	func = _G["C_QuestLine"] and _G["C_QuestLine"]["RequestQuestLinesForMap"],
	funcPath = "C_QuestLine.RequestQuestLinesForMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

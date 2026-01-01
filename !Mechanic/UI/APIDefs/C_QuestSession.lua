-- Generated APIDefinitions for namespace: C_QuestSession
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_QuestSession.SendSessionBeginResponse"] = {
	key = "C_QuestSession.SendSessionBeginResponse",
	name = "SendSessionBeginResponse",
	category = "combat_midnight",
	subcategory = "c_questsession",
	func = _G["C_QuestSession"] and _G["C_QuestSession"]["SendSessionBeginResponse"],
	funcPath = "C_QuestSession.SendSessionBeginResponse",
	params = { { name = "beginSession", type = "bool", default = nil } },
	returns = {},
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
	params = {
		{ name = "questID", type = "number", default = nil },
		{ name = "superTrack", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

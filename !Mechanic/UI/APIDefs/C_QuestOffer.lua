-- Generated APIDefinitions for namespace: C_QuestOffer
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_QuestOffer.GetQuestRequiredCurrencyInfo"] = {
	key = "C_QuestOffer.GetQuestRequiredCurrencyInfo",
	name = "GetQuestRequiredCurrencyInfo",
	category = "combat_midnight",
	subcategory = "c_questoffer",
	func = _G["C_QuestOffer"] and _G["C_QuestOffer"]["GetQuestRequiredCurrencyInfo"],
	funcPath = "C_QuestOffer.GetQuestRequiredCurrencyInfo",
	params = { { name = "questRewardIndex", type = "luaIndex", default = nil } },
	returns = { { name = "questRequiredCurrencyInfo", type = "QuestRequiredCurrencyInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestOffer.GetQuestRewardCurrencyInfo"] = {
	key = "C_QuestOffer.GetQuestRewardCurrencyInfo",
	name = "GetQuestRewardCurrencyInfo",
	category = "combat_midnight",
	subcategory = "c_questoffer",
	func = _G["C_QuestOffer"] and _G["C_QuestOffer"]["GetQuestRewardCurrencyInfo"],
	funcPath = "C_QuestOffer.GetQuestRewardCurrencyInfo",
	params = {
		{ name = "questInfoType", type = "cstring", default = nil },
		{ name = "questRewardIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "questRewardCurrencyInfo", type = "QuestRewardCurrencyInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

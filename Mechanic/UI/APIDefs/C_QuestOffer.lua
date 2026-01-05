-- Generated APIDefinitions for namespace: C_QuestOffer
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_QuestOffer.GetHideRequiredItems"] = {
    key = "C_QuestOffer.GetHideRequiredItems",
    name = "GetHideRequiredItems",
    category = "achievement",
    subcategory = "c_questoffer",
    func = _G["C_QuestOffer"] and _G["C_QuestOffer"]["GetHideRequiredItems"],
    funcPath = "C_QuestOffer.GetHideRequiredItems",
    params = {  },
    returns = { { name = "hideRequiredItems", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_QuestOffer.GetQuestOfferMajorFactionReputationRewards"] = {
    key = "C_QuestOffer.GetQuestOfferMajorFactionReputationRewards",
    name = "GetQuestOfferMajorFactionReputationRewards",
    category = "achievement",
    subcategory = "c_questoffer",
    func = _G["C_QuestOffer"] and _G["C_QuestOffer"]["GetQuestOfferMajorFactionReputationRewards"],
    funcPath = "C_QuestOffer.GetQuestOfferMajorFactionReputationRewards",
    params = {  },
    returns = { { name = "reputationRewards", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

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
    params = { { name = "questInfoType", type = "cstring", default = nil }, { name = "questRewardIndex", type = "luaIndex", default = nil } },
    returns = { { name = "questRewardCurrencyInfo", type = "QuestRewardCurrencyInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

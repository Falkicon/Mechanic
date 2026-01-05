-- Generated APIDefinitions for namespace: C_QuestInfoSystem
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_QuestInfoSystem.GetQuestClassification"] = {
    key = "C_QuestInfoSystem.GetQuestClassification",
    name = "GetQuestClassification",
    category = "combat_midnight",
    subcategory = "c_questinfosystem",
    func = _G["C_QuestInfoSystem"] and _G["C_QuestInfoSystem"]["GetQuestClassification"],
    funcPath = "C_QuestInfoSystem.GetQuestClassification",
    params = { { name = "questID", type = "number", default = nil }, { name = "questInfoID", type = "number", default = nil } },
    returns = { { name = "classification", type = "QuestClassification", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestInfoSystem.GetQuestLogRewardFavor"] = {
    key = "C_QuestInfoSystem.GetQuestLogRewardFavor",
    name = "GetQuestLogRewardFavor",
    category = "combat_midnight",
    subcategory = "c_questinfosystem",
    func = _G["C_QuestInfoSystem"] and _G["C_QuestInfoSystem"]["GetQuestLogRewardFavor"],
    funcPath = "C_QuestInfoSystem.GetQuestLogRewardFavor",
    params = { { name = "questID", type = "number", default = nil } },
    returns = { { name = "amount", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestInfoSystem.GetQuestRewardCurrencies"] = {
    key = "C_QuestInfoSystem.GetQuestRewardCurrencies",
    name = "GetQuestRewardCurrencies",
    category = "combat_midnight",
    subcategory = "c_questinfosystem",
    func = _G["C_QuestInfoSystem"] and _G["C_QuestInfoSystem"]["GetQuestRewardCurrencies"],
    funcPath = "C_QuestInfoSystem.GetQuestRewardCurrencies",
    params = { { name = "questID", type = "number", default = nil } },
    returns = { { name = "questRewardCurrencyInfo", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestInfoSystem.GetQuestRewardSpellInfo"] = {
    key = "C_QuestInfoSystem.GetQuestRewardSpellInfo",
    name = "GetQuestRewardSpellInfo",
    category = "combat_midnight",
    subcategory = "c_questinfosystem",
    func = _G["C_QuestInfoSystem"] and _G["C_QuestInfoSystem"]["GetQuestRewardSpellInfo"],
    funcPath = "C_QuestInfoSystem.GetQuestRewardSpellInfo",
    params = { { name = "questID", type = "number", default = nil }, { name = "spellID", type = "number", default = nil } },
    returns = { { name = "info", type = "QuestRewardSpellInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestInfoSystem.GetQuestRewardSpells"] = {
    key = "C_QuestInfoSystem.GetQuestRewardSpells",
    name = "GetQuestRewardSpells",
    category = "combat_midnight",
    subcategory = "c_questinfosystem",
    func = _G["C_QuestInfoSystem"] and _G["C_QuestInfoSystem"]["GetQuestRewardSpells"],
    funcPath = "C_QuestInfoSystem.GetQuestRewardSpells",
    params = { { name = "questID", type = "number", default = nil } },
    returns = { { name = "spellIDs", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestInfoSystem.GetQuestShouldToastCompletion"] = {
    key = "C_QuestInfoSystem.GetQuestShouldToastCompletion",
    name = "GetQuestShouldToastCompletion",
    category = "combat_midnight",
    subcategory = "c_questinfosystem",
    func = _G["C_QuestInfoSystem"] and _G["C_QuestInfoSystem"]["GetQuestShouldToastCompletion"],
    funcPath = "C_QuestInfoSystem.GetQuestShouldToastCompletion",
    params = { { name = "questID", type = "number", default = nil } },
    returns = { { name = "shouldToast", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestInfoSystem.HasQuestRewardCurrencies"] = {
    key = "C_QuestInfoSystem.HasQuestRewardCurrencies",
    name = "HasQuestRewardCurrencies",
    category = "combat_midnight",
    subcategory = "c_questinfosystem",
    func = _G["C_QuestInfoSystem"] and _G["C_QuestInfoSystem"]["HasQuestRewardCurrencies"],
    funcPath = "C_QuestInfoSystem.HasQuestRewardCurrencies",
    params = { { name = "questID", type = "number", default = nil } },
    returns = { { name = "hasQuestRewardCurrencies", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestInfoSystem.HasQuestRewardSpells"] = {
    key = "C_QuestInfoSystem.HasQuestRewardSpells",
    name = "HasQuestRewardSpells",
    category = "combat_midnight",
    subcategory = "c_questinfosystem",
    func = _G["C_QuestInfoSystem"] and _G["C_QuestInfoSystem"]["HasQuestRewardSpells"],
    funcPath = "C_QuestInfoSystem.HasQuestRewardSpells",
    params = { { name = "questID", type = "number", default = nil } },
    returns = { { name = "hasRewardSpells", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

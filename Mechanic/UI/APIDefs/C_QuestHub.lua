-- Generated APIDefinitions for namespace: C_QuestHub
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_QuestHub.IsQuestCurrentlyRelatedToHub"] = {
    key = "C_QuestHub.IsQuestCurrentlyRelatedToHub",
    name = "IsQuestCurrentlyRelatedToHub",
    category = "achievement",
    subcategory = "c_questhub",
    funcPath = "C_QuestHub.IsQuestCurrentlyRelatedToHub",
    params = { { name = "questID", type = "number", default = nil }, { name = "areaPoiID", type = "number", default = nil } },
    returns = { { name = "isRelated", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

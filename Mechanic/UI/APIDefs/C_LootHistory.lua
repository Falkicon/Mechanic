-- Generated APIDefinitions for namespace: C_LootHistory
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LootHistory.GetAllEncounterInfos"] = {
    key = "C_LootHistory.GetAllEncounterInfos",
    name = "GetAllEncounterInfos",
    category = "item",
    subcategory = "c_loothistory",
    funcPath = "C_LootHistory.GetAllEncounterInfos",
    params = {  },
    returns = { { name = "infos", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LootHistory.GetInfoForEncounter"] = {
    key = "C_LootHistory.GetInfoForEncounter",
    name = "GetInfoForEncounter",
    category = "item",
    subcategory = "c_loothistory",
    funcPath = "C_LootHistory.GetInfoForEncounter",
    params = { { name = "encounterID", type = "number", default = nil } },
    returns = { { name = "info", type = "EncounterLootInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LootHistory.GetLootHistoryTime"] = {
    key = "C_LootHistory.GetLootHistoryTime",
    name = "GetLootHistoryTime",
    category = "item",
    subcategory = "c_loothistory",
    funcPath = "C_LootHistory.GetLootHistoryTime",
    params = {  },
    returns = { { name = "time", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LootHistory.GetSortedDropsForEncounter"] = {
    key = "C_LootHistory.GetSortedDropsForEncounter",
    name = "GetSortedDropsForEncounter",
    category = "item",
    subcategory = "c_loothistory",
    funcPath = "C_LootHistory.GetSortedDropsForEncounter",
    params = { { name = "encounterID", type = "number", default = nil } },
    returns = { { name = "drops", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LootHistory.GetSortedInfoForDrop"] = {
    key = "C_LootHistory.GetSortedInfoForDrop",
    name = "GetSortedInfoForDrop",
    category = "item",
    subcategory = "c_loothistory",
    funcPath = "C_LootHistory.GetSortedInfoForDrop",
    params = { { name = "encounterID", type = "number", default = nil }, { name = "lootListID", type = "number", default = nil } },
    returns = { { name = "info", type = "EncounterLootDropInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

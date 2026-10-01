-- Generated APIDefinitions for namespace: C_LootJournal
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LootJournal.GetItemSetItems"] = {
    key = "C_LootJournal.GetItemSetItems",
    name = "GetItemSetItems",
    category = "item",
    subcategory = "c_lootjournal",
    funcPath = "C_LootJournal.GetItemSetItems",
    params = { { name = "setID", type = "number", default = nil } },
    returns = { { name = "items", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LootJournal.GetItemSets"] = {
    key = "C_LootJournal.GetItemSets",
    name = "GetItemSets",
    category = "item",
    subcategory = "c_lootjournal",
    funcPath = "C_LootJournal.GetItemSets",
    params = { { name = "classID", type = "number", default = nil }, { name = "specID", type = "number", default = nil } },
    returns = { { name = "itemSets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

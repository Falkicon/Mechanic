-- Generated APIDefinitions for namespace: C_LootJournal
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LootJournal.GetItemSetItems"] = {
	key = "C_LootJournal.GetItemSetItems",
	name = "GetItemSetItems",
	category = "combat_midnight",
	subcategory = "c_lootjournal",
	func = _G["C_LootJournal"] and _G["C_LootJournal"]["GetItemSetItems"],
	funcPath = "C_LootJournal.GetItemSetItems",
	params = { { name = "setID", type = "number", default = nil } },
	returns = { { name = "items", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LootJournal.GetItemSets"] = {
	key = "C_LootJournal.GetItemSets",
	name = "GetItemSets",
	category = "combat_midnight",
	subcategory = "c_lootjournal",
	func = _G["C_LootJournal"] and _G["C_LootJournal"]["GetItemSets"],
	funcPath = "C_LootJournal.GetItemSets",
	params = {
		{ name = "classID", type = "number", default = nil },
		{ name = "specID", type = "number", default = nil },
	},
	returns = { { name = "itemSets", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

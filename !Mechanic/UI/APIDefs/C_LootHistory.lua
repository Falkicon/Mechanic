-- Generated APIDefinitions for namespace: C_LootHistory
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LootHistory.GetInfoForEncounter"] = {
	key = "C_LootHistory.GetInfoForEncounter",
	name = "GetInfoForEncounter",
	category = "combat_midnight",
	subcategory = "c_loothistory",
	func = _G["C_LootHistory"] and _G["C_LootHistory"]["GetInfoForEncounter"],
	funcPath = "C_LootHistory.GetInfoForEncounter",
	params = { { name = "encounterID", type = "number", default = nil } },
	returns = { { name = "info", type = "EncounterLootInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LootHistory.GetSortedDropsForEncounter"] = {
	key = "C_LootHistory.GetSortedDropsForEncounter",
	name = "GetSortedDropsForEncounter",
	category = "combat_midnight",
	subcategory = "c_loothistory",
	func = _G["C_LootHistory"] and _G["C_LootHistory"]["GetSortedDropsForEncounter"],
	funcPath = "C_LootHistory.GetSortedDropsForEncounter",
	params = { { name = "encounterID", type = "number", default = nil } },
	returns = { { name = "drops", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LootHistory.GetSortedInfoForDrop"] = {
	key = "C_LootHistory.GetSortedInfoForDrop",
	name = "GetSortedInfoForDrop",
	category = "combat_midnight",
	subcategory = "c_loothistory",
	func = _G["C_LootHistory"] and _G["C_LootHistory"]["GetSortedInfoForDrop"],
	funcPath = "C_LootHistory.GetSortedInfoForDrop",
	params = {
		{ name = "encounterID", type = "number", default = nil },
		{ name = "lootListID", type = "number", default = nil },
	},
	returns = { { name = "info", type = "EncounterLootDropInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

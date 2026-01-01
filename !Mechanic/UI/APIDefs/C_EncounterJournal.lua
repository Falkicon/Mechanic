-- Generated APIDefinitions for namespace: C_EncounterJournal
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_EncounterJournal.GetDungeonEntrancesForMap"] = {
	key = "C_EncounterJournal.GetDungeonEntrancesForMap",
	name = "GetDungeonEntrancesForMap",
	category = "combat_midnight",
	subcategory = "c_encounterjournal",
	func = _G["C_EncounterJournal"] and _G["C_EncounterJournal"]["GetDungeonEntrancesForMap"],
	funcPath = "C_EncounterJournal.GetDungeonEntrancesForMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "dungeonEntrances", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterJournal.GetEncounterJournalLink"] = {
	key = "C_EncounterJournal.GetEncounterJournalLink",
	name = "GetEncounterJournalLink",
	category = "combat_midnight",
	subcategory = "c_encounterjournal",
	func = _G["C_EncounterJournal"] and _G["C_EncounterJournal"]["GetEncounterJournalLink"],
	funcPath = "C_EncounterJournal.GetEncounterJournalLink",
	params = {
		{ name = "linkType", type = "JournalLinkTypes", default = nil },
		{ name = "ID", type = "number", default = nil },
		{ name = "displayText", type = "string", default = nil },
		{ name = "difficultyID", type = "number", default = nil },
	},
	returns = { { name = "link", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterJournal.GetEncountersOnMap"] = {
	key = "C_EncounterJournal.GetEncountersOnMap",
	name = "GetEncountersOnMap",
	category = "combat_midnight",
	subcategory = "c_encounterjournal",
	func = _G["C_EncounterJournal"] and _G["C_EncounterJournal"]["GetEncountersOnMap"],
	funcPath = "C_EncounterJournal.GetEncountersOnMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "encounters", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterJournal.GetInstanceForGameMap"] = {
	key = "C_EncounterJournal.GetInstanceForGameMap",
	name = "GetInstanceForGameMap",
	category = "combat_midnight",
	subcategory = "c_encounterjournal",
	func = _G["C_EncounterJournal"] and _G["C_EncounterJournal"]["GetInstanceForGameMap"],
	funcPath = "C_EncounterJournal.GetInstanceForGameMap",
	params = { { name = "mapID", type = "number", default = nil } },
	returns = { { name = "journalInstanceID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterJournal.GetLootInfo"] = {
	key = "C_EncounterJournal.GetLootInfo",
	name = "GetLootInfo",
	category = "combat_midnight",
	subcategory = "c_encounterjournal",
	func = _G["C_EncounterJournal"] and _G["C_EncounterJournal"]["GetLootInfo"],
	funcPath = "C_EncounterJournal.GetLootInfo",
	params = { { name = "id", type = "number", default = nil } },
	returns = { { name = "itemInfo", type = "EncounterJournalItemInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterJournal.GetLootInfoByIndex"] = {
	key = "C_EncounterJournal.GetLootInfoByIndex",
	name = "GetLootInfoByIndex",
	category = "combat_midnight",
	subcategory = "c_encounterjournal",
	func = _G["C_EncounterJournal"] and _G["C_EncounterJournal"]["GetLootInfoByIndex"],
	funcPath = "C_EncounterJournal.GetLootInfoByIndex",
	params = {
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "encounterIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "itemInfo", type = "EncounterJournalItemInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterJournal.GetSectionIconFlags"] = {
	key = "C_EncounterJournal.GetSectionIconFlags",
	name = "GetSectionIconFlags",
	category = "combat_midnight",
	subcategory = "c_encounterjournal",
	func = _G["C_EncounterJournal"] and _G["C_EncounterJournal"]["GetSectionIconFlags"],
	funcPath = "C_EncounterJournal.GetSectionIconFlags",
	params = { { name = "sectionID", type = "number", default = nil } },
	returns = { { name = "iconFlags", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterJournal.GetSectionInfo"] = {
	key = "C_EncounterJournal.GetSectionInfo",
	name = "GetSectionInfo",
	category = "combat_midnight",
	subcategory = "c_encounterjournal",
	func = _G["C_EncounterJournal"] and _G["C_EncounterJournal"]["GetSectionInfo"],
	funcPath = "C_EncounterJournal.GetSectionInfo",
	params = {
		{
			name = "sectionID",
			type = "number",
			default = nil,
			examples = { { value = "ID", label = "Details" }, { value = "spell", label = "Details_EncounterDetails" } },
		},
	},
	returns = { { name = "info", type = "EncounterJournalSectionInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterJournal.InstanceHasLoot"] = {
	key = "C_EncounterJournal.InstanceHasLoot",
	name = "InstanceHasLoot",
	category = "combat_midnight",
	subcategory = "c_encounterjournal",
	func = _G["C_EncounterJournal"] and _G["C_EncounterJournal"]["InstanceHasLoot"],
	funcPath = "C_EncounterJournal.InstanceHasLoot",
	params = { { name = "instanceID", type = "number", default = nil } },
	returns = { { name = "hasLoot", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterJournal.IsEncounterComplete"] = {
	key = "C_EncounterJournal.IsEncounterComplete",
	name = "IsEncounterComplete",
	category = "combat_midnight",
	subcategory = "c_encounterjournal",
	func = _G["C_EncounterJournal"] and _G["C_EncounterJournal"]["IsEncounterComplete"],
	funcPath = "C_EncounterJournal.IsEncounterComplete",
	params = { { name = "journalEncounterID", type = "number", default = nil } },
	returns = { { name = "isEncounterComplete", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterJournal.SetPreviewMythicPlusLevel"] = {
	key = "C_EncounterJournal.SetPreviewMythicPlusLevel",
	name = "SetPreviewMythicPlusLevel",
	category = "combat_midnight",
	subcategory = "c_encounterjournal",
	func = _G["C_EncounterJournal"] and _G["C_EncounterJournal"]["SetPreviewMythicPlusLevel"],
	funcPath = "C_EncounterJournal.SetPreviewMythicPlusLevel",
	params = { { name = "level", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterJournal.SetPreviewPvpTier"] = {
	key = "C_EncounterJournal.SetPreviewPvpTier",
	name = "SetPreviewPvpTier",
	category = "combat_midnight",
	subcategory = "c_encounterjournal",
	func = _G["C_EncounterJournal"] and _G["C_EncounterJournal"]["SetPreviewPvpTier"],
	funcPath = "C_EncounterJournal.SetPreviewPvpTier",
	params = { { name = "tier", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterJournal.SetSlotFilter"] = {
	key = "C_EncounterJournal.SetSlotFilter",
	name = "SetSlotFilter",
	category = "combat_midnight",
	subcategory = "c_encounterjournal",
	func = _G["C_EncounterJournal"] and _G["C_EncounterJournal"]["SetSlotFilter"],
	funcPath = "C_EncounterJournal.SetSlotFilter",
	params = { { name = "filterSlot", type = "ItemSlotFilterType", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterJournal.SetTab"] = {
	key = "C_EncounterJournal.SetTab",
	name = "SetTab",
	category = "combat_midnight",
	subcategory = "c_encounterjournal",
	func = _G["C_EncounterJournal"] and _G["C_EncounterJournal"]["SetTab"],
	funcPath = "C_EncounterJournal.SetTab",
	params = {
		{
			name = "tabIdx",
			type = "number",
			default = nil,
			examples = { { value = 1, label = "Baganator" }, { value = 2, label = "Baganator" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_TooltipInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_TooltipInfo.GetAchievementByID"] = {
	key = "C_TooltipInfo.GetAchievementByID",
	name = "GetAchievementByID",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetAchievementByID"],
	funcPath = "C_TooltipInfo.GetAchievementByID",
	params = { { name = "achievementID", type = "number", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetAction"] = {
	key = "C_TooltipInfo.GetAction",
	name = "GetAction",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetAction"],
	funcPath = "C_TooltipInfo.GetAction",
	params = {
		{
			name = "actionID",
			type = "luaIndex",
			default = nil,
			examples = {
				{ value = "target", label = "WeakAurasOptions" },
				{ value = "target", label = "WeakAurasOptions" },
			},
		},
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetArtifactPowerByID"] = {
	key = "C_TooltipInfo.GetArtifactPowerByID",
	name = "GetArtifactPowerByID",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetArtifactPowerByID"],
	funcPath = "C_TooltipInfo.GetArtifactPowerByID",
	params = { { name = "powerID", type = "number", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetAzeriteEssence"] = {
	key = "C_TooltipInfo.GetAzeriteEssence",
	name = "GetAzeriteEssence",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetAzeriteEssence"],
	funcPath = "C_TooltipInfo.GetAzeriteEssence",
	params = {
		{ name = "essenceID", type = "number", default = nil },
		{ name = "rank", type = "number", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetAzeriteEssenceSlot"] = {
	key = "C_TooltipInfo.GetAzeriteEssenceSlot",
	name = "GetAzeriteEssenceSlot",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetAzeriteEssenceSlot"],
	funcPath = "C_TooltipInfo.GetAzeriteEssenceSlot",
	params = { { name = "slot", type = "AzeriteEssenceSlot", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetAzeritePower"] = {
	key = "C_TooltipInfo.GetAzeritePower",
	name = "GetAzeritePower",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetAzeritePower"],
	funcPath = "C_TooltipInfo.GetAzeritePower",
	params = {
		{ name = "itemID", type = "number", default = nil },
		{ name = "itemLevel", type = "number", default = nil },
		{ name = "powerID", type = "number", default = nil },
		{ name = "owningItemLink", type = "cstring", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetBackpackToken"] = {
	key = "C_TooltipInfo.GetBackpackToken",
	name = "GetBackpackToken",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetBackpackToken"],
	funcPath = "C_TooltipInfo.GetBackpackToken",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetBagItem"] = {
	key = "C_TooltipInfo.GetBagItem",
	name = "GetBagItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetBagItem"],
	funcPath = "C_TooltipInfo.GetBagItem",
	params = {
		{ name = "bagIndex", type = "BagIndex", default = nil },
		{ name = "slotIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetBagItemChild"] = {
	key = "C_TooltipInfo.GetBagItemChild",
	name = "GetBagItemChild",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetBagItemChild"],
	funcPath = "C_TooltipInfo.GetBagItemChild",
	params = {
		{ name = "bagIndex", type = "BagIndex", default = nil },
		{ name = "slotIndex", type = "luaIndex", default = nil },
		{ name = "equipSlotIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetBuybackItem"] = {
	key = "C_TooltipInfo.GetBuybackItem",
	name = "GetBuybackItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetBuybackItem"],
	funcPath = "C_TooltipInfo.GetBuybackItem",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetCompanionPet"] = {
	key = "C_TooltipInfo.GetCompanionPet",
	name = "GetCompanionPet",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetCompanionPet"],
	funcPath = "C_TooltipInfo.GetCompanionPet",
	params = { { name = "petGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetConduit"] = {
	key = "C_TooltipInfo.GetConduit",
	name = "GetConduit",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetConduit"],
	funcPath = "C_TooltipInfo.GetConduit",
	params = {
		{ name = "conduitID", type = "number", default = nil },
		{ name = "conduitRank", type = "number", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetCurrencyByID"] = {
	key = "C_TooltipInfo.GetCurrencyByID",
	name = "GetCurrencyByID",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetCurrencyByID"],
	funcPath = "C_TooltipInfo.GetCurrencyByID",
	params = {
		{ name = "currencyID", type = "number", default = nil },
		{ name = "amount", type = "number", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetCurrencyToken"] = {
	key = "C_TooltipInfo.GetCurrencyToken",
	name = "GetCurrencyToken",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetCurrencyToken"],
	funcPath = "C_TooltipInfo.GetCurrencyToken",
	params = { { name = "tokenIndex", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetEnhancedConduit"] = {
	key = "C_TooltipInfo.GetEnhancedConduit",
	name = "GetEnhancedConduit",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetEnhancedConduit"],
	funcPath = "C_TooltipInfo.GetEnhancedConduit",
	params = {
		{ name = "conduitID", type = "number", default = nil },
		{ name = "rank", type = "number", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetEquipmentSet"] = {
	key = "C_TooltipInfo.GetEquipmentSet",
	name = "GetEquipmentSet",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetEquipmentSet"],
	funcPath = "C_TooltipInfo.GetEquipmentSet",
	params = { { name = "setID", type = "number", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetExistingSocketGem"] = {
	key = "C_TooltipInfo.GetExistingSocketGem",
	name = "GetExistingSocketGem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetExistingSocketGem"],
	funcPath = "C_TooltipInfo.GetExistingSocketGem",
	params = {
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "toDestroy", type = "bool", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetGuildBankItem"] = {
	key = "C_TooltipInfo.GetGuildBankItem",
	name = "GetGuildBankItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetGuildBankItem"],
	funcPath = "C_TooltipInfo.GetGuildBankItem",
	params = { { name = "tab", type = "luaIndex", default = nil }, { name = "slot", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetHeirloomByItemID"] = {
	key = "C_TooltipInfo.GetHeirloomByItemID",
	name = "GetHeirloomByItemID",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetHeirloomByItemID"],
	funcPath = "C_TooltipInfo.GetHeirloomByItemID",
	params = { { name = "itemID", type = "number", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetHyperlink"] = {
	key = "C_TooltipInfo.GetHyperlink",
	name = "GetHyperlink",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetHyperlink"],
	funcPath = "C_TooltipInfo.GetHyperlink",
	params = {
		{
			name = "hyperlink",
			type = "cstring",
			default = nil,
			examples = {
				{ value = [=["unit:" .. petGUID]=], label = "Details" },
				{ value = "'unit:'.. petGUID", label = "Details" },
				{ value = [=["unit:" .. actorObject.serial]=], label = "Details" },
			},
		},
		{ name = "optionalArg1", type = "number", default = nil },
		{ name = "optionalArg2", type = "number", default = nil },
		{ name = "hideVendorPrice", type = "bool", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetInboxItem"] = {
	key = "C_TooltipInfo.GetInboxItem",
	name = "GetInboxItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetInboxItem"],
	funcPath = "C_TooltipInfo.GetInboxItem",
	params = {
		{ name = "messageIndex", type = "luaIndex", default = nil },
		{ name = "attachmentIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetInstanceLockEncountersComplete"] = {
	key = "C_TooltipInfo.GetInstanceLockEncountersComplete",
	name = "GetInstanceLockEncountersComplete",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetInstanceLockEncountersComplete"],
	funcPath = "C_TooltipInfo.GetInstanceLockEncountersComplete",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetInventoryItem"] = {
	key = "C_TooltipInfo.GetInventoryItem",
	name = "GetInventoryItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetInventoryItem"],
	funcPath = "C_TooltipInfo.GetInventoryItem",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "WeakAuras" },
				{ value = "player", label = "DejaCharacterStats" },
				{ value = "unit", label = "DejaCharacterStats" },
			},
		},
		{ name = "slot", type = "luaIndex", default = nil },
		{ name = "hideUselessStats", type = "bool", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetInventoryItemByID"] = {
	key = "C_TooltipInfo.GetInventoryItemByID",
	name = "GetInventoryItemByID",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetInventoryItemByID"],
	funcPath = "C_TooltipInfo.GetInventoryItemByID",
	params = { { name = "itemID", type = "number", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetItemByGUID"] = {
	key = "C_TooltipInfo.GetItemByGUID",
	name = "GetItemByGUID",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetItemByGUID"],
	funcPath = "C_TooltipInfo.GetItemByGUID",
	params = { { name = "guid", type = "WOWGUID", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetItemByID"] = {
	key = "C_TooltipInfo.GetItemByID",
	name = "GetItemByID",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetItemByID"],
	funcPath = "C_TooltipInfo.GetItemByID",
	params = {
		{ name = "itemID", type = "number", default = nil, examples = { { value = "id", label = "BagBrother" } } },
		{ name = "quality", type = "number", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetItemByItemModifiedAppearanceID"] = {
	key = "C_TooltipInfo.GetItemByItemModifiedAppearanceID",
	name = "GetItemByItemModifiedAppearanceID",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetItemByItemModifiedAppearanceID"],
	funcPath = "C_TooltipInfo.GetItemByItemModifiedAppearanceID",
	params = { { name = "itemModifiedAppearanceID", type = "number", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetItemKey"] = {
	key = "C_TooltipInfo.GetItemKey",
	name = "GetItemKey",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetItemKey"],
	funcPath = "C_TooltipInfo.GetItemKey",
	params = {
		{
			name = "itemID",
			type = "number",
			default = nil,
			examples = { { value = "item.itemLink", label = "Syndicator" } },
		},
		{ name = "itemLevel", type = "number", default = nil },
		{ name = "itemSuffix", type = "number", default = nil },
		{ name = "requiredLevel", type = "number", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetLFGDungeonReward"] = {
	key = "C_TooltipInfo.GetLFGDungeonReward",
	name = "GetLFGDungeonReward",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetLFGDungeonReward"],
	funcPath = "C_TooltipInfo.GetLFGDungeonReward",
	params = {
		{ name = "dungeonID", type = "number", default = nil },
		{ name = "lootIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetLFGDungeonShortageReward"] = {
	key = "C_TooltipInfo.GetLFGDungeonShortageReward",
	name = "GetLFGDungeonShortageReward",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetLFGDungeonShortageReward"],
	funcPath = "C_TooltipInfo.GetLFGDungeonShortageReward",
	params = {
		{ name = "dungeonID", type = "number", default = nil },
		{ name = "shortageSeverity", type = "number", default = nil },
		{ name = "lootIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetLootCurrency"] = {
	key = "C_TooltipInfo.GetLootCurrency",
	name = "GetLootCurrency",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetLootCurrency"],
	funcPath = "C_TooltipInfo.GetLootCurrency",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetLootItem"] = {
	key = "C_TooltipInfo.GetLootItem",
	name = "GetLootItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetLootItem"],
	funcPath = "C_TooltipInfo.GetLootItem",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetLootRollItem"] = {
	key = "C_TooltipInfo.GetLootRollItem",
	name = "GetLootRollItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetLootRollItem"],
	funcPath = "C_TooltipInfo.GetLootRollItem",
	params = { { name = "id", type = "number", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetMerchantCostItem"] = {
	key = "C_TooltipInfo.GetMerchantCostItem",
	name = "GetMerchantCostItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetMerchantCostItem"],
	funcPath = "C_TooltipInfo.GetMerchantCostItem",
	params = {
		{ name = "slot", type = "luaIndex", default = nil },
		{ name = "costIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetMerchantItem"] = {
	key = "C_TooltipInfo.GetMerchantItem",
	name = "GetMerchantItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetMerchantItem"],
	funcPath = "C_TooltipInfo.GetMerchantItem",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetMountBySpellID"] = {
	key = "C_TooltipInfo.GetMountBySpellID",
	name = "GetMountBySpellID",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetMountBySpellID"],
	funcPath = "C_TooltipInfo.GetMountBySpellID",
	params = {
		{ name = "spellID", type = "number", default = nil },
		{ name = "checkIndoors", type = "bool", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_TooltipInfo.GetOutfit"] = {
	key = "C_TooltipInfo.GetOutfit",
	name = "GetOutfit",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetOutfit"],
	funcPath = "C_TooltipInfo.GetOutfit",
	params = { { name = "outfitID", type = "number", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetOwnedItemByID"] = {
	key = "C_TooltipInfo.GetOwnedItemByID",
	name = "GetOwnedItemByID",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetOwnedItemByID"],
	funcPath = "C_TooltipInfo.GetOwnedItemByID",
	params = { { name = "itemID", type = "number", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetPetAction"] = {
	key = "C_TooltipInfo.GetPetAction",
	name = "GetPetAction",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetPetAction"],
	funcPath = "C_TooltipInfo.GetPetAction",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetPossession"] = {
	key = "C_TooltipInfo.GetPossession",
	name = "GetPossession",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetPossession"],
	funcPath = "C_TooltipInfo.GetPossession",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetPvpBrawl"] = {
	key = "C_TooltipInfo.GetPvpBrawl",
	name = "GetPvpBrawl",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetPvpBrawl"],
	funcPath = "C_TooltipInfo.GetPvpBrawl",
	params = { { name = "isSpecial", type = "bool", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetPvpTalent"] = {
	key = "C_TooltipInfo.GetPvpTalent",
	name = "GetPvpTalent",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetPvpTalent"],
	funcPath = "C_TooltipInfo.GetPvpTalent",
	params = {
		{ name = "talentID", type = "number", default = nil },
		{ name = "isInspect", type = "bool", default = nil },
		{ name = "groupIndex", type = "luaIndex", default = nil },
		{ name = "talentIndex", type = "number", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetQuestCurrency"] = {
	key = "C_TooltipInfo.GetQuestCurrency",
	name = "GetQuestCurrency",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetQuestCurrency"],
	funcPath = "C_TooltipInfo.GetQuestCurrency",
	params = {
		{ name = "type", type = "cstring", default = nil },
		{ name = "currencyIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetQuestItem"] = {
	key = "C_TooltipInfo.GetQuestItem",
	name = "GetQuestItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetQuestItem"],
	funcPath = "C_TooltipInfo.GetQuestItem",
	params = {
		{ name = "type", type = "cstring", default = nil },
		{ name = "itemIndex", type = "luaIndex", default = nil },
		{ name = "allowCollectionText", type = "bool", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetQuestLogCurrency"] = {
	key = "C_TooltipInfo.GetQuestLogCurrency",
	name = "GetQuestLogCurrency",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetQuestLogCurrency"],
	funcPath = "C_TooltipInfo.GetQuestLogCurrency",
	params = {
		{ name = "type", type = "cstring", default = nil },
		{ name = "currencyIndex", type = "luaIndex", default = nil },
		{ name = "questID", type = "number", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetQuestLogItem"] = {
	key = "C_TooltipInfo.GetQuestLogItem",
	name = "GetQuestLogItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetQuestLogItem"],
	funcPath = "C_TooltipInfo.GetQuestLogItem",
	params = {
		{ name = "type", type = "cstring", default = nil },
		{ name = "itemIndex", type = "luaIndex", default = nil },
		{ name = "questID", type = "number", default = nil },
		{ name = "allowCollectionText", type = "bool", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetQuestLogSpecialItem"] = {
	key = "C_TooltipInfo.GetQuestLogSpecialItem",
	name = "GetQuestLogSpecialItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetQuestLogSpecialItem"],
	funcPath = "C_TooltipInfo.GetQuestLogSpecialItem",
	params = { { name = "questIndex", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetQuestPartyProgress"] = {
	key = "C_TooltipInfo.GetQuestPartyProgress",
	name = "GetQuestPartyProgress",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetQuestPartyProgress"],
	funcPath = "C_TooltipInfo.GetQuestPartyProgress",
	params = {
		{ name = "questID", type = "number", default = nil },
		{ name = "omitTitle", type = "bool", default = nil },
		{ name = "ignoreActivePlayer", type = "bool", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetRecipeRankInfo"] = {
	key = "C_TooltipInfo.GetRecipeRankInfo",
	name = "GetRecipeRankInfo",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetRecipeRankInfo"],
	funcPath = "C_TooltipInfo.GetRecipeRankInfo",
	params = {
		{ name = "recipeID", type = "number", default = nil },
		{ name = "rank", type = "number", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetRecipeReagentItem"] = {
	key = "C_TooltipInfo.GetRecipeReagentItem",
	name = "GetRecipeReagentItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetRecipeReagentItem"],
	funcPath = "C_TooltipInfo.GetRecipeReagentItem",
	params = {
		{ name = "recipeSpellID", type = "number", default = nil },
		{ name = "dataSlotIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetRecipeResultItem"] = {
	key = "C_TooltipInfo.GetRecipeResultItem",
	name = "GetRecipeResultItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetRecipeResultItem"],
	funcPath = "C_TooltipInfo.GetRecipeResultItem",
	params = {
		{ name = "recipeID", type = "number", default = nil },
		{ name = "reagentInfos", type = "table", default = nil },
		{ name = "recraftItemGUID", type = "WOWGUID", default = nil },
		{ name = "recipeLevel", type = "luaIndex", default = nil },
		{ name = "overrideQualityID", type = "number", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetRecipeResultItemForOrder"] = {
	key = "C_TooltipInfo.GetRecipeResultItemForOrder",
	name = "GetRecipeResultItemForOrder",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetRecipeResultItemForOrder"],
	funcPath = "C_TooltipInfo.GetRecipeResultItemForOrder",
	params = {
		{ name = "recipeID", type = "number", default = nil },
		{ name = "reagentInfos", type = "table", default = nil },
		{ name = "orderID", type = "BigUInteger", default = nil },
		{ name = "recipeLevel", type = "luaIndex", default = nil },
		{ name = "overrideQualityID", type = "number", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetRuneforgeResultItem"] = {
	key = "C_TooltipInfo.GetRuneforgeResultItem",
	name = "GetRuneforgeResultItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetRuneforgeResultItem"],
	funcPath = "C_TooltipInfo.GetRuneforgeResultItem",
	params = {
		{ name = "itemGUID", type = "WOWGUID", default = nil },
		{ name = "itemLevel", type = "number", default = nil },
		{ name = "powerID", type = "number", default = nil },
		{ name = "modifiers", type = "table", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetSendMailItem"] = {
	key = "C_TooltipInfo.GetSendMailItem",
	name = "GetSendMailItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetSendMailItem"],
	funcPath = "C_TooltipInfo.GetSendMailItem",
	params = {
		{
			name = "attachmentIndex",
			type = "luaIndex",
			default = nil,
			examples = { { value = "id", label = "Auctionator" } },
		},
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetShapeshift"] = {
	key = "C_TooltipInfo.GetShapeshift",
	name = "GetShapeshift",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetShapeshift"],
	funcPath = "C_TooltipInfo.GetShapeshift",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetSocketGem"] = {
	key = "C_TooltipInfo.GetSocketGem",
	name = "GetSocketGem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetSocketGem"],
	funcPath = "C_TooltipInfo.GetSocketGem",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetSocketedRelic"] = {
	key = "C_TooltipInfo.GetSocketedRelic",
	name = "GetSocketedRelic",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetSocketedRelic"],
	funcPath = "C_TooltipInfo.GetSocketedRelic",
	params = { { name = "slotIndex", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetSpellBookItem"] = {
	key = "C_TooltipInfo.GetSpellBookItem",
	name = "GetSpellBookItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetSpellBookItem"],
	funcPath = "C_TooltipInfo.GetSpellBookItem",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetSpellByID"] = {
	key = "C_TooltipInfo.GetSpellByID",
	name = "GetSpellByID",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetSpellByID"],
	funcPath = "C_TooltipInfo.GetSpellByID",
	params = {
		{ name = "spellID", type = "number", default = nil },
		{ name = "isPet", type = "bool", default = nil },
		{ name = "showSubtext", type = "bool", default = nil },
		{ name = "dontOverride", type = "bool", default = nil },
		{ name = "difficultyID", type = "number", default = nil },
		{ name = "isLink", type = "bool", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_TooltipInfo.GetTalent"] = {
	key = "C_TooltipInfo.GetTalent",
	name = "GetTalent",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetTalent"],
	funcPath = "C_TooltipInfo.GetTalent",
	params = {
		{ name = "talentID", type = "number", default = nil },
		{ name = "isInspect", type = "bool", default = nil },
		{ name = "groupIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetTotem"] = {
	key = "C_TooltipInfo.GetTotem",
	name = "GetTotem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetTotem"],
	funcPath = "C_TooltipInfo.GetTotem",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetToyByItemID"] = {
	key = "C_TooltipInfo.GetToyByItemID",
	name = "GetToyByItemID",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetToyByItemID"],
	funcPath = "C_TooltipInfo.GetToyByItemID",
	params = { { name = "itemID", type = "number", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetTradePlayerItem"] = {
	key = "C_TooltipInfo.GetTradePlayerItem",
	name = "GetTradePlayerItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetTradePlayerItem"],
	funcPath = "C_TooltipInfo.GetTradePlayerItem",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetTradeTargetItem"] = {
	key = "C_TooltipInfo.GetTradeTargetItem",
	name = "GetTradeTargetItem",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetTradeTargetItem"],
	funcPath = "C_TooltipInfo.GetTradeTargetItem",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetTrainerService"] = {
	key = "C_TooltipInfo.GetTrainerService",
	name = "GetTrainerService",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetTrainerService"],
	funcPath = "C_TooltipInfo.GetTrainerService",
	params = { { name = "serviceIndex", type = "luaIndex", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetTraitEntry"] = {
	key = "C_TooltipInfo.GetTraitEntry",
	name = "GetTraitEntry",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetTraitEntry"],
	funcPath = "C_TooltipInfo.GetTraitEntry",
	params = {
		{ name = "entryID", type = "number", default = nil, examples = { { value = "entryID", label = "Plumber" } } },
		{ name = "rank", type = "number", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetUnit"] = {
	key = "C_TooltipInfo.GetUnit",
	name = "GetUnit",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetUnit"],
	funcPath = "C_TooltipInfo.GetUnit",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "guid", label = "WeakAuras" } },
		},
		{ name = "hideStatus", type = "bool", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetUnitAura"] = {
	key = "C_TooltipInfo.GetUnitAura",
	name = "GetUnitAura",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetUnitAura"],
	funcPath = "C_TooltipInfo.GetUnitAura",
	params = {
		{
			name = "unitToken",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "WeakAuras" } },
		},
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "filter", type = "AuraFilters", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenUnitAuraIndexRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetUnitAuraByAuraInstanceID"] = {
	key = "C_TooltipInfo.GetUnitAuraByAuraInstanceID",
	name = "GetUnitAuraByAuraInstanceID",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetUnitAuraByAuraInstanceID"],
	funcPath = "C_TooltipInfo.GetUnitAuraByAuraInstanceID",
	params = {
		{ name = "unitToken", type = "UnitToken", default = "player" },
		{ name = "auraInstanceID", type = "number", default = nil },
		{ name = "filter", type = "AuraFilters", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenInCombat",
}

APIDefs["C_TooltipInfo.GetUnitBuff"] = {
	key = "C_TooltipInfo.GetUnitBuff",
	name = "GetUnitBuff",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetUnitBuff"],
	funcPath = "C_TooltipInfo.GetUnitBuff",
	params = {
		{ name = "unitToken", type = "UnitToken", default = "player" },
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "filter", type = "AuraFilters", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenUnitAuraIndexRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetUnitBuffByAuraInstanceID"] = {
	key = "C_TooltipInfo.GetUnitBuffByAuraInstanceID",
	name = "GetUnitBuffByAuraInstanceID",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetUnitBuffByAuraInstanceID"],
	funcPath = "C_TooltipInfo.GetUnitBuffByAuraInstanceID",
	params = {
		{
			name = "unitToken",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "player", label = "Narcissus" },
				{ value = "player", label = "Narcissus" },
			},
		},
		{ name = "auraInstanceID", type = "number", default = nil },
		{ name = "filter", type = "AuraFilters", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenUnpackedUnitAuraInstanceRestricted, SecretArguments=AllowedWhenTainted",
}

APIDefs["C_TooltipInfo.GetUnitDebuff"] = {
	key = "C_TooltipInfo.GetUnitDebuff",
	name = "GetUnitDebuff",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetUnitDebuff"],
	funcPath = "C_TooltipInfo.GetUnitDebuff",
	params = {
		{ name = "unitToken", type = "UnitToken", default = "player" },
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "filter", type = "AuraFilters", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenUnitAuraIndexRestricted, SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetUnitDebuffByAuraInstanceID"] = {
	key = "C_TooltipInfo.GetUnitDebuffByAuraInstanceID",
	name = "GetUnitDebuffByAuraInstanceID",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetUnitDebuffByAuraInstanceID"],
	funcPath = "C_TooltipInfo.GetUnitDebuffByAuraInstanceID",
	params = {
		{
			name = "unitToken",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "WeakAuras" } },
		},
		{ name = "auraInstanceID", type = "number", default = nil },
		{ name = "filter", type = "AuraFilters", default = nil },
	},
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenUnpackedUnitAuraInstanceRestricted, SecretArguments=AllowedWhenTainted",
}

APIDefs["C_TooltipInfo.GetWeeklyReward"] = {
	key = "C_TooltipInfo.GetWeeklyReward",
	name = "GetWeeklyReward",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetWeeklyReward"],
	funcPath = "C_TooltipInfo.GetWeeklyReward",
	params = { { name = "itemDBID", type = "WeeklyRewardItemDBID", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipInfo.GetWorldLootObject"] = {
	key = "C_TooltipInfo.GetWorldLootObject",
	name = "GetWorldLootObject",
	category = "combat_midnight",
	subcategory = "c_tooltipinfo",
	func = _G["C_TooltipInfo"] and _G["C_TooltipInfo"]["GetWorldLootObject"],
	funcPath = "C_TooltipInfo.GetWorldLootObject",
	params = { { name = "unitTokenString", type = "cstring", default = nil } },
	returns = { { name = "data", type = "TooltipData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

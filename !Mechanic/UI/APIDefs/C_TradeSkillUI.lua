-- Generated APIDefinitions for namespace: C_TradeSkillUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_TradeSkillUI.CanStoreEnchantInItem"] = {
	key = "C_TradeSkillUI.CanStoreEnchantInItem",
	name = "CanStoreEnchantInItem",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["CanStoreEnchantInItem"],
	funcPath = "C_TradeSkillUI.CanStoreEnchantInItem",
	params = { { name = "itemGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "canStore", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.CraftEnchant"] = {
	key = "C_TradeSkillUI.CraftEnchant",
	name = "CraftEnchant",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["CraftEnchant"],
	funcPath = "C_TradeSkillUI.CraftEnchant",
	params = {
		{ name = "recipeSpellID", type = "number", default = nil },
		{ name = "numCasts", type = "number", default = 1 },
		{ name = "craftingReagents", type = "table", default = nil },
		{ name = "itemTarget", type = "ItemLocation", default = nil },
		{ name = "applyConcentration", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.CraftRecipe"] = {
	key = "C_TradeSkillUI.CraftRecipe",
	name = "CraftRecipe",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["CraftRecipe"],
	funcPath = "C_TradeSkillUI.CraftRecipe",
	params = {
		{ name = "recipeSpellID", type = "number", default = nil },
		{ name = "numCasts", type = "number", default = 1 },
		{ name = "craftingReagents", type = "table", default = nil },
		{ name = "recipeLevel", type = "luaIndex", default = nil },
		{ name = "orderID", type = "BigUInteger", default = nil },
		{ name = "applyConcentration", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.CraftSalvage"] = {
	key = "C_TradeSkillUI.CraftSalvage",
	name = "CraftSalvage",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["CraftSalvage"],
	funcPath = "C_TradeSkillUI.CraftSalvage",
	params = {
		{ name = "recipeSpellID", type = "number", default = nil },
		{ name = "numCasts", type = "number", default = 1 },
		{ name = "itemTarget", type = "ItemLocation", default = nil },
		{ name = "craftingReagents", type = "table", default = nil },
		{ name = "applyConcentration", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.DoesRecraftingRecipeAcceptItem"] = {
	key = "C_TradeSkillUI.DoesRecraftingRecipeAcceptItem",
	name = "DoesRecraftingRecipeAcceptItem",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["DoesRecraftingRecipeAcceptItem"],
	funcPath = "C_TradeSkillUI.DoesRecraftingRecipeAcceptItem",
	params = {
		{ name = "itemLocation", type = "ItemLocation", default = nil },
		{ name = "recipeID", type = "number", default = nil },
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetConcentrationCurrencyID"] = {
	key = "C_TradeSkillUI.GetConcentrationCurrencyID",
	name = "GetConcentrationCurrencyID",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetConcentrationCurrencyID"],
	funcPath = "C_TradeSkillUI.GetConcentrationCurrencyID",
	params = { { name = "skillLineID", type = "number", default = nil } },
	returns = { { name = "currencyType", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetCraftableCount"] = {
	key = "C_TradeSkillUI.GetCraftableCount",
	name = "GetCraftableCount",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetCraftableCount"],
	funcPath = "C_TradeSkillUI.GetCraftableCount",
	params = {
		{ name = "recipeSpellID", type = "number", default = nil },
		{ name = "recipeLevel", type = "luaIndex", default = nil },
	},
	returns = { { name = "numAvailable", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetCraftingOperationInfo"] = {
	key = "C_TradeSkillUI.GetCraftingOperationInfo",
	name = "GetCraftingOperationInfo",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetCraftingOperationInfo"],
	funcPath = "C_TradeSkillUI.GetCraftingOperationInfo",
	params = {
		{ name = "recipeID", type = "number", default = nil },
		{ name = "craftingReagents", type = "table", default = nil },
		{ name = "allocationItemGUID", type = "WOWGUID", default = nil },
		{ name = "applyConcentration", type = "bool", default = nil },
	},
	returns = { { name = "info", type = "CraftingOperationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetCraftingOperationInfoForOrder"] = {
	key = "C_TradeSkillUI.GetCraftingOperationInfoForOrder",
	name = "GetCraftingOperationInfoForOrder",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetCraftingOperationInfoForOrder"],
	funcPath = "C_TradeSkillUI.GetCraftingOperationInfoForOrder",
	params = {
		{ name = "recipeID", type = "number", default = nil },
		{ name = "craftingReagents", type = "table", default = nil },
		{ name = "orderID", type = "BigUInteger", default = nil },
		{ name = "applyConcentration", type = "bool", default = nil },
	},
	returns = { { name = "info", type = "CraftingOperationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetCraftingReagentBonusText"] = {
	key = "C_TradeSkillUI.GetCraftingReagentBonusText",
	name = "GetCraftingReagentBonusText",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetCraftingReagentBonusText"],
	funcPath = "C_TradeSkillUI.GetCraftingReagentBonusText",
	params = {
		{ name = "recipeSpellID", type = "number", default = nil },
		{ name = "craftingReagentIndex", type = "luaIndex", default = nil },
		{ name = "craftingReagents", type = "table", default = nil },
		{ name = "allocationItemGUID", type = "WOWGUID", default = nil },
	},
	returns = { { name = "bonusText", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetCraftingTargetItems"] = {
	key = "C_TradeSkillUI.GetCraftingTargetItems",
	name = "GetCraftingTargetItems",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetCraftingTargetItems"],
	funcPath = "C_TradeSkillUI.GetCraftingTargetItems",
	params = { { name = "itemIDs", type = "table", default = nil } },
	returns = { { name = "items", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetDependentReagents"] = {
	key = "C_TradeSkillUI.GetDependentReagents",
	name = "GetDependentReagents",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetDependentReagents"],
	funcPath = "C_TradeSkillUI.GetDependentReagents",
	params = { { name = "reagent", type = "CraftingReagent", default = nil } },
	returns = { { name = "reagents", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetEnchantItems"] = {
	key = "C_TradeSkillUI.GetEnchantItems",
	name = "GetEnchantItems",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetEnchantItems"],
	funcPath = "C_TradeSkillUI.GetEnchantItems",
	params = {
		{ name = "recipeID", type = "number", default = nil },
		{ name = "craftingReagents", type = "table", default = nil },
	},
	returns = { { name = "items", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetFactionSpecificOutputItem"] = {
	key = "C_TradeSkillUI.GetFactionSpecificOutputItem",
	name = "GetFactionSpecificOutputItem",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetFactionSpecificOutputItem"],
	funcPath = "C_TradeSkillUI.GetFactionSpecificOutputItem",
	params = { { name = "recipeSpellID", type = "number", default = nil } },
	returns = { { name = "itemID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetGatheringOperationInfo"] = {
	key = "C_TradeSkillUI.GetGatheringOperationInfo",
	name = "GetGatheringOperationInfo",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetGatheringOperationInfo"],
	funcPath = "C_TradeSkillUI.GetGatheringOperationInfo",
	params = { { name = "recipeID", type = "number", default = nil } },
	returns = { { name = "info", type = "GatheringOperationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetHideUnownedFlags"] = {
	key = "C_TradeSkillUI.GetHideUnownedFlags",
	name = "GetHideUnownedFlags",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetHideUnownedFlags"],
	funcPath = "C_TradeSkillUI.GetHideUnownedFlags",
	params = { { name = "recipeID", type = "number", default = nil } },
	returns = {
		{ name = "cannotModifyHideUnowned", type = "bool", canBeSecret = false },
		{ name = "alwaysShowUnowned", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetItemCraftedQualityByItemInfo"] = {
	key = "C_TradeSkillUI.GetItemCraftedQualityByItemInfo",
	name = "GetItemCraftedQualityByItemInfo",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetItemCraftedQualityByItemInfo"],
	funcPath = "C_TradeSkillUI.GetItemCraftedQualityByItemInfo",
	params = {
		{ name = "itemInfo", type = "ItemInfo", default = nil, examples = { { value = "item", label = "Plumber" } } },
	},
	returns = { { name = "quality", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetItemCraftedQualityInfo"] = {
	key = "C_TradeSkillUI.GetItemCraftedQualityInfo",
	name = "GetItemCraftedQualityInfo",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetItemCraftedQualityInfo"],
	funcPath = "C_TradeSkillUI.GetItemCraftedQualityInfo",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "info", type = "CraftingQualityInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetItemReagentQualityByItemInfo"] = {
	key = "C_TradeSkillUI.GetItemReagentQualityByItemInfo",
	name = "GetItemReagentQualityByItemInfo",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetItemReagentQualityByItemInfo"],
	funcPath = "C_TradeSkillUI.GetItemReagentQualityByItemInfo",
	params = {
		{ name = "itemInfo", type = "ItemInfo", default = nil, examples = { { value = "item", label = "Plumber" } } },
	},
	returns = { { name = "quality", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetItemReagentQualityInfo"] = {
	key = "C_TradeSkillUI.GetItemReagentQualityInfo",
	name = "GetItemReagentQualityInfo",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetItemReagentQualityInfo"],
	funcPath = "C_TradeSkillUI.GetItemReagentQualityInfo",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "info", type = "CraftingQualityInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetItemSlotModifications"] = {
	key = "C_TradeSkillUI.GetItemSlotModifications",
	name = "GetItemSlotModifications",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetItemSlotModifications"],
	funcPath = "C_TradeSkillUI.GetItemSlotModifications",
	params = { { name = "itemGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "slotMods", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetItemSlotModificationsForOrder"] = {
	key = "C_TradeSkillUI.GetItemSlotModificationsForOrder",
	name = "GetItemSlotModificationsForOrder",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetItemSlotModificationsForOrder"],
	funcPath = "C_TradeSkillUI.GetItemSlotModificationsForOrder",
	params = { { name = "orderID", type = "BigUInteger", default = nil } },
	returns = { { name = "slotMods", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetOriginalCraftRecipeID"] = {
	key = "C_TradeSkillUI.GetOriginalCraftRecipeID",
	name = "GetOriginalCraftRecipeID",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetOriginalCraftRecipeID"],
	funcPath = "C_TradeSkillUI.GetOriginalCraftRecipeID",
	params = { { name = "itemGUID", type = "WOWGUID", default = nil } },
	returns = {
		{ name = "recipeID", type = "number", canBeSecret = false },
		{ name = "skillLineAbilityID", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetProfessionByInventorySlot"] = {
	key = "C_TradeSkillUI.GetProfessionByInventorySlot",
	name = "GetProfessionByInventorySlot",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetProfessionByInventorySlot"],
	funcPath = "C_TradeSkillUI.GetProfessionByInventorySlot",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = { { name = "profession", type = "Profession", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetProfessionInfoByRecipeID"] = {
	key = "C_TradeSkillUI.GetProfessionInfoByRecipeID",
	name = "GetProfessionInfoByRecipeID",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetProfessionInfoByRecipeID"],
	funcPath = "C_TradeSkillUI.GetProfessionInfoByRecipeID",
	params = { { name = "recipeID", type = "number", default = nil } },
	returns = { { name = "info", type = "ProfessionInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetProfessionInfoBySkillLineID"] = {
	key = "C_TradeSkillUI.GetProfessionInfoBySkillLineID",
	name = "GetProfessionInfoBySkillLineID",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetProfessionInfoBySkillLineID"],
	funcPath = "C_TradeSkillUI.GetProfessionInfoBySkillLineID",
	params = { { name = "skillLineID", type = "number", default = nil } },
	returns = { { name = "info", type = "ProfessionInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetProfessionNameForSkillLineAbility"] = {
	key = "C_TradeSkillUI.GetProfessionNameForSkillLineAbility",
	name = "GetProfessionNameForSkillLineAbility",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetProfessionNameForSkillLineAbility"],
	funcPath = "C_TradeSkillUI.GetProfessionNameForSkillLineAbility",
	params = { { name = "skillLineAbilityID", type = "number", default = nil } },
	returns = { { name = "professionNmae", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetProfessionSkillLineID"] = {
	key = "C_TradeSkillUI.GetProfessionSkillLineID",
	name = "GetProfessionSkillLineID",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetProfessionSkillLineID"],
	funcPath = "C_TradeSkillUI.GetProfessionSkillLineID",
	params = { { name = "profession", type = "Profession", default = nil } },
	returns = { { name = "skillLineID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetProfessionSlots"] = {
	key = "C_TradeSkillUI.GetProfessionSlots",
	name = "GetProfessionSlots",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetProfessionSlots"],
	funcPath = "C_TradeSkillUI.GetProfessionSlots",
	params = { { name = "profession", type = "Profession", default = nil } },
	returns = { { name = "slots", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetProfessionSpells"] = {
	key = "C_TradeSkillUI.GetProfessionSpells",
	name = "GetProfessionSpells",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetProfessionSpells"],
	funcPath = "C_TradeSkillUI.GetProfessionSpells",
	params = {
		{ name = "professionID", type = "number", default = nil },
		{ name = "skillLineID", type = "number", default = nil },
	},
	returns = { { name = "knownSpells", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetQualitiesForRecipe"] = {
	key = "C_TradeSkillUI.GetQualitiesForRecipe",
	name = "GetQualitiesForRecipe",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetQualitiesForRecipe"],
	funcPath = "C_TradeSkillUI.GetQualitiesForRecipe",
	params = { { name = "recipeID", type = "number", default = nil } },
	returns = { { name = "qualityIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetReagentDifficultyText"] = {
	key = "C_TradeSkillUI.GetReagentDifficultyText",
	name = "GetReagentDifficultyText",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetReagentDifficultyText"],
	funcPath = "C_TradeSkillUI.GetReagentDifficultyText",
	params = {
		{ name = "craftingReagentIndex", type = "luaIndex", default = nil },
		{ name = "craftingReagents", type = "table", default = nil },
	},
	returns = { { name = "bonusText", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetReagentSlotStatus"] = {
	key = "C_TradeSkillUI.GetReagentSlotStatus",
	name = "GetReagentSlotStatus",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetReagentSlotStatus"],
	funcPath = "C_TradeSkillUI.GetReagentSlotStatus",
	params = {
		{ name = "mcrSlotID", type = "number", default = nil },
		{ name = "recipeSpellID", type = "number", default = nil },
		{ name = "skillLineAbilityID", type = "number", default = nil },
	},
	returns = {
		{ name = "locked", type = "bool", canBeSecret = false },
		{ name = "lockedReason", type = "string", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeDescription"] = {
	key = "C_TradeSkillUI.GetRecipeDescription",
	name = "GetRecipeDescription",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetRecipeDescription"],
	funcPath = "C_TradeSkillUI.GetRecipeDescription",
	params = {
		{ name = "recipeID", type = "number", default = nil },
		{ name = "craftingReagents", type = "table", default = nil },
		{ name = "allocationItemGUID", type = "WOWGUID", default = nil },
	},
	returns = { { name = "description", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeInfo"] = {
	key = "C_TradeSkillUI.GetRecipeInfo",
	name = "GetRecipeInfo",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetRecipeInfo"],
	funcPath = "C_TradeSkillUI.GetRecipeInfo",
	params = {
		{ name = "recipeSpellID", type = "number", default = nil },
		{ name = "recipeLevel", type = "luaIndex", default = nil },
	},
	returns = { { name = "recipeInfo", type = "TradeSkillRecipeInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeInfoForSkillLineAbility"] = {
	key = "C_TradeSkillUI.GetRecipeInfoForSkillLineAbility",
	name = "GetRecipeInfoForSkillLineAbility",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetRecipeInfoForSkillLineAbility"],
	funcPath = "C_TradeSkillUI.GetRecipeInfoForSkillLineAbility",
	params = {
		{ name = "skillLineAbilityID", type = "number", default = nil },
		{ name = "recipeLevel", type = "luaIndex", default = nil },
	},
	returns = { { name = "recipeInfo", type = "TradeSkillRecipeInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeItemQualityInfo"] = {
	key = "C_TradeSkillUI.GetRecipeItemQualityInfo",
	name = "GetRecipeItemQualityInfo",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetRecipeItemQualityInfo"],
	funcPath = "C_TradeSkillUI.GetRecipeItemQualityInfo",
	params = {
		{ name = "recipeID", type = "number", default = nil },
		{ name = "quality", type = "number", default = nil },
	},
	returns = { { name = "info", type = "CraftingQualityInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeOutputItemData"] = {
	key = "C_TradeSkillUI.GetRecipeOutputItemData",
	name = "GetRecipeOutputItemData",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetRecipeOutputItemData"],
	funcPath = "C_TradeSkillUI.GetRecipeOutputItemData",
	params = {
		{ name = "recipeSpellID", type = "number", default = nil },
		{ name = "reagents", type = "table", default = nil },
		{ name = "allocationItemGUID", type = "WOWGUID", default = nil },
		{ name = "overrideQualityID", type = "number", default = nil },
		{ name = "recraftOrderID", type = "BigUInteger", default = nil },
	},
	returns = { { name = "outputInfo", type = "CraftingRecipeOutputInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeQualityItemIDs"] = {
	key = "C_TradeSkillUI.GetRecipeQualityItemIDs",
	name = "GetRecipeQualityItemIDs",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetRecipeQualityItemIDs"],
	funcPath = "C_TradeSkillUI.GetRecipeQualityItemIDs",
	params = { { name = "recipeSpellID", type = "number", default = nil } },
	returns = { { name = "qualityItemIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeQualityReagentLink"] = {
	key = "C_TradeSkillUI.GetRecipeQualityReagentLink",
	name = "GetRecipeQualityReagentLink",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetRecipeQualityReagentLink"],
	funcPath = "C_TradeSkillUI.GetRecipeQualityReagentLink",
	params = {
		{ name = "recipeID", type = "number", default = nil },
		{ name = "dataSlotIndex", type = "luaIndex", default = nil },
		{ name = "qualityIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "link", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeRequirements"] = {
	key = "C_TradeSkillUI.GetRecipeRequirements",
	name = "GetRecipeRequirements",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetRecipeRequirements"],
	funcPath = "C_TradeSkillUI.GetRecipeRequirements",
	params = {
		{ name = "recipeID", type = "number", default = nil, examples = { { value = 124052, label = "Plumber" } } },
	},
	returns = { { name = "requirements", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeSchematic"] = {
	key = "C_TradeSkillUI.GetRecipeSchematic",
	name = "GetRecipeSchematic",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetRecipeSchematic"],
	funcPath = "C_TradeSkillUI.GetRecipeSchematic",
	params = {
		{
			name = "recipeSpellID",
			type = "number",
			default = nil,
			examples = { { value = 428667, label = "Plumber" } },
		},
		{ name = "isRecraft", type = "bool", default = nil },
		{ name = "recipeLevel", type = "luaIndex", default = nil },
	},
	returns = { { name = "schematic", type = "CraftingRecipeSchematic", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipesTracked"] = {
	key = "C_TradeSkillUI.GetRecipesTracked",
	name = "GetRecipesTracked",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetRecipesTracked"],
	funcPath = "C_TradeSkillUI.GetRecipesTracked",
	params = { { name = "isRecraft", type = "bool", default = nil } },
	returns = { { name = "recipeIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecraftItems"] = {
	key = "C_TradeSkillUI.GetRecraftItems",
	name = "GetRecraftItems",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetRecraftItems"],
	funcPath = "C_TradeSkillUI.GetRecraftItems",
	params = { { name = "recipeID", type = "number", default = nil } },
	returns = { { name = "items", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecraftRemovalWarnings"] = {
	key = "C_TradeSkillUI.GetRecraftRemovalWarnings",
	name = "GetRecraftRemovalWarnings",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetRecraftRemovalWarnings"],
	funcPath = "C_TradeSkillUI.GetRecraftRemovalWarnings",
	params = {
		{ name = "itemGUID", type = "WOWGUID", default = nil },
		{ name = "replacedReagents", type = "table", default = nil },
	},
	returns = { { name = "warnings", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetSalvagableItemIDs"] = {
	key = "C_TradeSkillUI.GetSalvagableItemIDs",
	name = "GetSalvagableItemIDs",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetSalvagableItemIDs"],
	funcPath = "C_TradeSkillUI.GetSalvagableItemIDs",
	params = { { name = "recipeID", type = "number", default = nil } },
	returns = { { name = "itemIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetSkillLineForGear"] = {
	key = "C_TradeSkillUI.GetSkillLineForGear",
	name = "GetSkillLineForGear",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetSkillLineForGear"],
	funcPath = "C_TradeSkillUI.GetSkillLineForGear",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "skillLineID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetTradeSkillDisplayName"] = {
	key = "C_TradeSkillUI.GetTradeSkillDisplayName",
	name = "GetTradeSkillDisplayName",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["GetTradeSkillDisplayName"],
	funcPath = "C_TradeSkillUI.GetTradeSkillDisplayName",
	params = { { name = "skillLineID", type = "number", default = nil } },
	returns = { { name = "professionDisplayName", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsEnchantTargetValid"] = {
	key = "C_TradeSkillUI.IsEnchantTargetValid",
	name = "IsEnchantTargetValid",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["IsEnchantTargetValid"],
	funcPath = "C_TradeSkillUI.IsEnchantTargetValid",
	params = {
		{ name = "recipeID", type = "number", default = nil },
		{ name = "itemGUID", type = "WOWGUID", default = nil },
		{ name = "craftingReagents", type = "table", default = nil },
	},
	returns = { { name = "valid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsNearProfessionSpellFocus"] = {
	key = "C_TradeSkillUI.IsNearProfessionSpellFocus",
	name = "IsNearProfessionSpellFocus",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["IsNearProfessionSpellFocus"],
	funcPath = "C_TradeSkillUI.IsNearProfessionSpellFocus",
	params = { { name = "profession", type = "Profession", default = nil } },
	returns = { { name = "nearFocus", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsOriginalCraftRecipeLearned"] = {
	key = "C_TradeSkillUI.IsOriginalCraftRecipeLearned",
	name = "IsOriginalCraftRecipeLearned",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["IsOriginalCraftRecipeLearned"],
	funcPath = "C_TradeSkillUI.IsOriginalCraftRecipeLearned",
	params = { { name = "itemGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "learned", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsRecipeFirstCraft"] = {
	key = "C_TradeSkillUI.IsRecipeFirstCraft",
	name = "IsRecipeFirstCraft",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["IsRecipeFirstCraft"],
	funcPath = "C_TradeSkillUI.IsRecipeFirstCraft",
	params = { { name = "recipeID", type = "number", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsRecipeInBaseSkillLine"] = {
	key = "C_TradeSkillUI.IsRecipeInBaseSkillLine",
	name = "IsRecipeInBaseSkillLine",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["IsRecipeInBaseSkillLine"],
	funcPath = "C_TradeSkillUI.IsRecipeInBaseSkillLine",
	params = { { name = "recipeID", type = "number", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsRecipeInSkillLine"] = {
	key = "C_TradeSkillUI.IsRecipeInSkillLine",
	name = "IsRecipeInSkillLine",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["IsRecipeInSkillLine"],
	funcPath = "C_TradeSkillUI.IsRecipeInSkillLine",
	params = {
		{ name = "recipeID", type = "number", default = nil },
		{ name = "skillLineID", type = "number", default = nil },
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsRecipeProfessionLearned"] = {
	key = "C_TradeSkillUI.IsRecipeProfessionLearned",
	name = "IsRecipeProfessionLearned",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["IsRecipeProfessionLearned"],
	funcPath = "C_TradeSkillUI.IsRecipeProfessionLearned",
	params = { { name = "recipeID", type = "number", default = nil } },
	returns = { { name = "recipeProfessionLearned", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsRecipeTracked"] = {
	key = "C_TradeSkillUI.IsRecipeTracked",
	name = "IsRecipeTracked",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["IsRecipeTracked"],
	funcPath = "C_TradeSkillUI.IsRecipeTracked",
	params = {
		{ name = "recipeID", type = "number", default = nil },
		{ name = "isRecraft", type = "bool", default = nil },
	},
	returns = { { name = "tracked", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsRecraftItemEquipped"] = {
	key = "C_TradeSkillUI.IsRecraftItemEquipped",
	name = "IsRecraftItemEquipped",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["IsRecraftItemEquipped"],
	funcPath = "C_TradeSkillUI.IsRecraftItemEquipped",
	params = { { name = "recraftItemGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "isEquipped", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsRecraftReagentValid"] = {
	key = "C_TradeSkillUI.IsRecraftReagentValid",
	name = "IsRecraftReagentValid",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["IsRecraftReagentValid"],
	funcPath = "C_TradeSkillUI.IsRecraftReagentValid",
	params = {
		{ name = "itemGUID", type = "WOWGUID", default = nil },
		{ name = "reagent", type = "CraftingReagent", default = nil },
	},
	returns = { { name = "valid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.OpenRecipe"] = {
	key = "C_TradeSkillUI.OpenRecipe",
	name = "OpenRecipe",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["OpenRecipe"],
	funcPath = "C_TradeSkillUI.OpenRecipe",
	params = { { name = "recipeID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.OpenTradeSkill"] = {
	key = "C_TradeSkillUI.OpenTradeSkill",
	name = "OpenTradeSkill",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["OpenTradeSkill"],
	funcPath = "C_TradeSkillUI.OpenTradeSkill",
	params = { { name = "skillLineID", type = "number", default = nil } },
	returns = { { name = "opened", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.RecraftLimitCategoryValid"] = {
	key = "C_TradeSkillUI.RecraftLimitCategoryValid",
	name = "RecraftLimitCategoryValid",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["RecraftLimitCategoryValid"],
	funcPath = "C_TradeSkillUI.RecraftLimitCategoryValid",
	params = { { name = "reagent", type = "CraftingReagent", default = nil } },
	returns = { { name = "recraftValid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.RecraftRecipe"] = {
	key = "C_TradeSkillUI.RecraftRecipe",
	name = "RecraftRecipe",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["RecraftRecipe"],
	funcPath = "C_TradeSkillUI.RecraftRecipe",
	params = {
		{ name = "itemGUID", type = "WOWGUID", default = nil },
		{ name = "craftingReagents", type = "table", default = nil },
		{ name = "removedModifications", type = "table", default = nil },
		{ name = "applyConcentration", type = "bool", default = nil },
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.RecraftRecipeForOrder"] = {
	key = "C_TradeSkillUI.RecraftRecipeForOrder",
	name = "RecraftRecipeForOrder",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["RecraftRecipeForOrder"],
	funcPath = "C_TradeSkillUI.RecraftRecipeForOrder",
	params = {
		{ name = "orderID", type = "BigUInteger", default = nil },
		{ name = "itemGUID", type = "WOWGUID", default = nil },
		{ name = "craftingReagents", type = "table", default = nil },
		{ name = "removedModifications", type = "table", default = nil },
		{ name = "applyConcentration", type = "bool", default = nil },
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.SetOnlyShowAvailableForOrders"] = {
	key = "C_TradeSkillUI.SetOnlyShowAvailableForOrders",
	name = "SetOnlyShowAvailableForOrders",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["SetOnlyShowAvailableForOrders"],
	funcPath = "C_TradeSkillUI.SetOnlyShowAvailableForOrders",
	params = { { name = "flag", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.SetProfessionChildSkillLineID"] = {
	key = "C_TradeSkillUI.SetProfessionChildSkillLineID",
	name = "SetProfessionChildSkillLineID",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["SetProfessionChildSkillLineID"],
	funcPath = "C_TradeSkillUI.SetProfessionChildSkillLineID",
	params = { { name = "skillLineID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.SetRecipeTracked"] = {
	key = "C_TradeSkillUI.SetRecipeTracked",
	name = "SetRecipeTracked",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["SetRecipeTracked"],
	funcPath = "C_TradeSkillUI.SetRecipeTracked",
	params = {
		{ name = "recipeID", type = "number", default = nil },
		{ name = "tracked", type = "bool", default = nil },
		{ name = "isRecraft", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.SetShowLearned"] = {
	key = "C_TradeSkillUI.SetShowLearned",
	name = "SetShowLearned",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["SetShowLearned"],
	funcPath = "C_TradeSkillUI.SetShowLearned",
	params = { { name = "flag", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.SetShowUnlearned"] = {
	key = "C_TradeSkillUI.SetShowUnlearned",
	name = "SetShowUnlearned",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["SetShowUnlearned"],
	funcPath = "C_TradeSkillUI.SetShowUnlearned",
	params = { { name = "flag", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.SetSourceTypeFilter"] = {
	key = "C_TradeSkillUI.SetSourceTypeFilter",
	name = "SetSourceTypeFilter",
	category = "combat_midnight",
	subcategory = "c_tradeskillui",
	func = _G["C_TradeSkillUI"] and _G["C_TradeSkillUI"]["SetSourceTypeFilter"],
	funcPath = "C_TradeSkillUI.SetSourceTypeFilter",
	params = { { name = "sourceTypeFilter", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

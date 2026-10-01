-- Generated APIDefinitions for namespace: C_TradeSkillUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_TradeSkillUI.CanStoreEnchantInItem"] = {
    key = "C_TradeSkillUI.CanStoreEnchantInItem",
    name = "CanStoreEnchantInItem",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.CanStoreEnchantInItem",
    params = { { name = "itemGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "canStore", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.CancelProfessionRespec"] = {
    key = "C_TradeSkillUI.CancelProfessionRespec",
    name = "CancelProfessionRespec",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.CancelProfessionRespec",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.CheckRespecNPC"] = {
    key = "C_TradeSkillUI.CheckRespecNPC",
    name = "CheckRespecNPC",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.CheckRespecNPC",
    params = {  },
    returns = { { name = "canInteract", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.CloseTradeSkill"] = {
    key = "C_TradeSkillUI.CloseTradeSkill",
    name = "CloseTradeSkill",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.CloseTradeSkill",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.ConfirmProfessionRespec"] = {
    key = "C_TradeSkillUI.ConfirmProfessionRespec",
    name = "ConfirmProfessionRespec",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.ConfirmProfessionRespec",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.CraftEnchant"] = {
    key = "C_TradeSkillUI.CraftEnchant",
    name = "CraftEnchant",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.CraftEnchant",
    params = { { name = "recipeSpellID", type = "number", default = nil }, { name = "numCasts", type = "number", default = 1 }, { name = "craftingReagents", type = "table", default = nil }, { name = "itemTarget", type = "ItemLocation", default = nil }, { name = "applyConcentration", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.CraftRecipe"] = {
    key = "C_TradeSkillUI.CraftRecipe",
    name = "CraftRecipe",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.CraftRecipe",
    params = { { name = "recipeSpellID", type = "number", default = nil }, { name = "numCasts", type = "number", default = 1 }, { name = "craftingReagents", type = "table", default = nil }, { name = "recipeLevel", type = "luaIndex", default = nil }, { name = "orderID", type = "BigUInteger", default = nil }, { name = "applyConcentration", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.CraftSalvage"] = {
    key = "C_TradeSkillUI.CraftSalvage",
    name = "CraftSalvage",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.CraftSalvage",
    params = { { name = "recipeSpellID", type = "number", default = nil }, { name = "numCasts", type = "number", default = 1 }, { name = "itemTarget", type = "ItemLocation", default = nil }, { name = "craftingReagents", type = "table", default = nil }, { name = "applyConcentration", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.DoesRecraftingRecipeAcceptItem"] = {
    key = "C_TradeSkillUI.DoesRecraftingRecipeAcceptItem",
    name = "DoesRecraftingRecipeAcceptItem",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.DoesRecraftingRecipeAcceptItem",
    params = { { name = "itemLocation", type = "ItemLocation", default = nil }, { name = "recipeID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetAllProfessionTradeSkillLines"] = {
    key = "C_TradeSkillUI.GetAllProfessionTradeSkillLines",
    name = "GetAllProfessionTradeSkillLines",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetAllProfessionTradeSkillLines",
    params = {  },
    returns = { { name = "skillLineID", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.GetBaseProfessionInfo"] = {
    key = "C_TradeSkillUI.GetBaseProfessionInfo",
    name = "GetBaseProfessionInfo",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetBaseProfessionInfo",
    params = {  },
    returns = { { name = "info", type = "ProfessionInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.GetChildProfessionInfo"] = {
    key = "C_TradeSkillUI.GetChildProfessionInfo",
    name = "GetChildProfessionInfo",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetChildProfessionInfo",
    params = {  },
    returns = { { name = "info", type = "ProfessionInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.GetChildProfessionInfos"] = {
    key = "C_TradeSkillUI.GetChildProfessionInfos",
    name = "GetChildProfessionInfos",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetChildProfessionInfos",
    params = {  },
    returns = { { name = "infos", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.GetConcentrationCurrencyID"] = {
    key = "C_TradeSkillUI.GetConcentrationCurrencyID",
    name = "GetConcentrationCurrencyID",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetConcentrationCurrencyID",
    params = { { name = "skillLineID", type = "number", default = nil } },
    returns = { { name = "currencyType", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetCraftableCount"] = {
    key = "C_TradeSkillUI.GetCraftableCount",
    name = "GetCraftableCount",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetCraftableCount",
    params = { { name = "recipeSpellID", type = "number", default = nil }, { name = "recipeLevel", type = "luaIndex", default = nil } },
    returns = { { name = "numAvailable", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetCraftingOperationInfo"] = {
    key = "C_TradeSkillUI.GetCraftingOperationInfo",
    name = "GetCraftingOperationInfo",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetCraftingOperationInfo",
    params = { { name = "recipeID", type = "number", default = nil }, { name = "craftingReagents", type = "table", default = nil }, { name = "allocationItemGUID", type = "WOWGUID", default = nil }, { name = "applyConcentration", type = "bool", default = nil } },
    returns = { { name = "info", type = "CraftingOperationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetCraftingOperationInfoForOrder"] = {
    key = "C_TradeSkillUI.GetCraftingOperationInfoForOrder",
    name = "GetCraftingOperationInfoForOrder",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetCraftingOperationInfoForOrder",
    params = { { name = "recipeID", type = "number", default = nil }, { name = "craftingReagents", type = "table", default = nil }, { name = "orderID", type = "BigUInteger", default = nil }, { name = "applyConcentration", type = "bool", default = nil } },
    returns = { { name = "info", type = "CraftingOperationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetCraftingReagentBonusText"] = {
    key = "C_TradeSkillUI.GetCraftingReagentBonusText",
    name = "GetCraftingReagentBonusText",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetCraftingReagentBonusText",
    params = { { name = "recipeSpellID", type = "number", default = nil }, { name = "craftingReagentIndex", type = "luaIndex", default = nil }, { name = "craftingReagents", type = "table", default = nil }, { name = "allocationItemGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "bonusText", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetCraftingTargetItems"] = {
    key = "C_TradeSkillUI.GetCraftingTargetItems",
    name = "GetCraftingTargetItems",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetCraftingTargetItems",
    params = { { name = "itemIDs", type = "table", default = nil } },
    returns = { { name = "items", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetDependentReagents"] = {
    key = "C_TradeSkillUI.GetDependentReagents",
    name = "GetDependentReagents",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetDependentReagents",
    params = { { name = "reagent", type = "CraftingReagent", default = nil } },
    returns = { { name = "reagents", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetEnchantItems"] = {
    key = "C_TradeSkillUI.GetEnchantItems",
    name = "GetEnchantItems",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetEnchantItems",
    params = { { name = "recipeID", type = "number", default = nil }, { name = "craftingReagents", type = "table", default = nil } },
    returns = { { name = "items", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetFactionSpecificOutputItem"] = {
    key = "C_TradeSkillUI.GetFactionSpecificOutputItem",
    name = "GetFactionSpecificOutputItem",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetFactionSpecificOutputItem",
    params = { { name = "recipeSpellID", type = "number", default = nil } },
    returns = { { name = "itemID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetGatheringOperationInfo"] = {
    key = "C_TradeSkillUI.GetGatheringOperationInfo",
    name = "GetGatheringOperationInfo",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetGatheringOperationInfo",
    params = { { name = "recipeID", type = "number", default = nil } },
    returns = { { name = "info", type = "GatheringOperationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetHideUnownedFlags"] = {
    key = "C_TradeSkillUI.GetHideUnownedFlags",
    name = "GetHideUnownedFlags",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetHideUnownedFlags",
    params = { { name = "recipeID", type = "number", default = nil } },
    returns = { { name = "cannotModifyHideUnowned", type = "bool", canBeSecret = false }, { name = "alwaysShowUnowned", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetItemCraftedQualityByItemInfo"] = {
    key = "C_TradeSkillUI.GetItemCraftedQualityByItemInfo",
    name = "GetItemCraftedQualityByItemInfo",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetItemCraftedQualityByItemInfo",
    params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
    returns = { { name = "quality", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetItemCraftedQualityInfo"] = {
    key = "C_TradeSkillUI.GetItemCraftedQualityInfo",
    name = "GetItemCraftedQualityInfo",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetItemCraftedQualityInfo",
    params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
    returns = { { name = "info", type = "CraftingQualityInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetItemReagentQualityByItemInfo"] = {
    key = "C_TradeSkillUI.GetItemReagentQualityByItemInfo",
    name = "GetItemReagentQualityByItemInfo",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetItemReagentQualityByItemInfo",
    params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
    returns = { { name = "quality", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetItemReagentQualityInfo"] = {
    key = "C_TradeSkillUI.GetItemReagentQualityInfo",
    name = "GetItemReagentQualityInfo",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetItemReagentQualityInfo",
    params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
    returns = { { name = "info", type = "CraftingQualityInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetItemSlotModifications"] = {
    key = "C_TradeSkillUI.GetItemSlotModifications",
    name = "GetItemSlotModifications",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetItemSlotModifications",
    params = { { name = "itemGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "slotMods", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetItemSlotModificationsForOrder"] = {
    key = "C_TradeSkillUI.GetItemSlotModificationsForOrder",
    name = "GetItemSlotModificationsForOrder",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetItemSlotModificationsForOrder",
    params = { { name = "orderID", type = "BigUInteger", default = nil } },
    returns = { { name = "slotMods", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetOriginalCraftRecipeID"] = {
    key = "C_TradeSkillUI.GetOriginalCraftRecipeID",
    name = "GetOriginalCraftRecipeID",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetOriginalCraftRecipeID",
    params = { { name = "itemGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "recipeID", type = "number", canBeSecret = false }, { name = "skillLineAbilityID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetProfessionByInventorySlot"] = {
    key = "C_TradeSkillUI.GetProfessionByInventorySlot",
    name = "GetProfessionByInventorySlot",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetProfessionByInventorySlot",
    params = { { name = "slot", type = "luaIndex", default = nil } },
    returns = { { name = "profession", type = "Profession", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetProfessionChildSkillLineID"] = {
    key = "C_TradeSkillUI.GetProfessionChildSkillLineID",
    name = "GetProfessionChildSkillLineID",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetProfessionChildSkillLineID",
    params = {  },
    returns = { { name = "skillLineID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.GetProfessionForCursorItem"] = {
    key = "C_TradeSkillUI.GetProfessionForCursorItem",
    name = "GetProfessionForCursorItem",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetProfessionForCursorItem",
    params = {  },
    returns = { { name = "profession", type = "Profession", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.GetProfessionInfoByRecipeID"] = {
    key = "C_TradeSkillUI.GetProfessionInfoByRecipeID",
    name = "GetProfessionInfoByRecipeID",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetProfessionInfoByRecipeID",
    params = { { name = "recipeID", type = "number", default = nil } },
    returns = { { name = "info", type = "ProfessionInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetProfessionInfoBySkillLineID"] = {
    key = "C_TradeSkillUI.GetProfessionInfoBySkillLineID",
    name = "GetProfessionInfoBySkillLineID",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetProfessionInfoBySkillLineID",
    params = { { name = "skillLineID", type = "number", default = nil } },
    returns = { { name = "info", type = "ProfessionInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetProfessionInventorySlots"] = {
    key = "C_TradeSkillUI.GetProfessionInventorySlots",
    name = "GetProfessionInventorySlots",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetProfessionInventorySlots",
    params = {  },
    returns = { { name = "invSlots", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.GetProfessionNameForSkillLineAbility"] = {
    key = "C_TradeSkillUI.GetProfessionNameForSkillLineAbility",
    name = "GetProfessionNameForSkillLineAbility",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetProfessionNameForSkillLineAbility",
    params = { { name = "skillLineAbilityID", type = "number", default = nil } },
    returns = { { name = "professionNmae", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetProfessionSkillLineID"] = {
    key = "C_TradeSkillUI.GetProfessionSkillLineID",
    name = "GetProfessionSkillLineID",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetProfessionSkillLineID",
    params = { { name = "profession", type = "Profession", default = nil } },
    returns = { { name = "skillLineID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetProfessionSlots"] = {
    key = "C_TradeSkillUI.GetProfessionSlots",
    name = "GetProfessionSlots",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetProfessionSlots",
    params = { { name = "profession", type = "Profession", default = nil } },
    returns = { { name = "slots", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetProfessionSpells"] = {
    key = "C_TradeSkillUI.GetProfessionSpells",
    name = "GetProfessionSpells",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetProfessionSpells",
    params = { { name = "professionID", type = "number", default = nil }, { name = "skillLineID", type = "number", default = nil } },
    returns = { { name = "knownSpells", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetQualitiesForRecipe"] = {
    key = "C_TradeSkillUI.GetQualitiesForRecipe",
    name = "GetQualitiesForRecipe",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetQualitiesForRecipe",
    params = { { name = "recipeID", type = "number", default = nil } },
    returns = { { name = "qualityIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetReagentDifficultyText"] = {
    key = "C_TradeSkillUI.GetReagentDifficultyText",
    name = "GetReagentDifficultyText",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetReagentDifficultyText",
    params = { { name = "craftingReagentIndex", type = "luaIndex", default = nil }, { name = "craftingReagents", type = "table", default = nil } },
    returns = { { name = "bonusText", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetReagentSlotStatus"] = {
    key = "C_TradeSkillUI.GetReagentSlotStatus",
    name = "GetReagentSlotStatus",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetReagentSlotStatus",
    params = { { name = "mcrSlotID", type = "number", default = nil }, { name = "recipeSpellID", type = "number", default = nil }, { name = "skillLineAbilityID", type = "number", default = nil } },
    returns = { { name = "locked", type = "bool", canBeSecret = false }, { name = "lockedReason", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeDescription"] = {
    key = "C_TradeSkillUI.GetRecipeDescription",
    name = "GetRecipeDescription",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetRecipeDescription",
    params = { { name = "recipeID", type = "number", default = nil }, { name = "craftingReagents", type = "table", default = nil }, { name = "allocationItemGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "description", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeInfo"] = {
    key = "C_TradeSkillUI.GetRecipeInfo",
    name = "GetRecipeInfo",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetRecipeInfo",
    params = { { name = "recipeSpellID", type = "number", default = nil }, { name = "recipeLevel", type = "luaIndex", default = nil } },
    returns = { { name = "recipeInfo", type = "TradeSkillRecipeInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeInfoForSkillLineAbility"] = {
    key = "C_TradeSkillUI.GetRecipeInfoForSkillLineAbility",
    name = "GetRecipeInfoForSkillLineAbility",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetRecipeInfoForSkillLineAbility",
    params = { { name = "skillLineAbilityID", type = "number", default = nil }, { name = "recipeLevel", type = "luaIndex", default = nil } },
    returns = { { name = "recipeInfo", type = "TradeSkillRecipeInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeItemQualityInfo"] = {
    key = "C_TradeSkillUI.GetRecipeItemQualityInfo",
    name = "GetRecipeItemQualityInfo",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetRecipeItemQualityInfo",
    params = { { name = "recipeID", type = "number", default = nil }, { name = "quality", type = "number", default = nil } },
    returns = { { name = "info", type = "CraftingQualityInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeOutputItemData"] = {
    key = "C_TradeSkillUI.GetRecipeOutputItemData",
    name = "GetRecipeOutputItemData",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetRecipeOutputItemData",
    params = { { name = "recipeSpellID", type = "number", default = nil }, { name = "reagents", type = "table", default = nil }, { name = "allocationItemGUID", type = "WOWGUID", default = nil }, { name = "overrideQualityID", type = "number", default = nil }, { name = "recraftOrderID", type = "BigUInteger", default = nil } },
    returns = { { name = "outputInfo", type = "CraftingRecipeOutputInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeQualityItemIDs"] = {
    key = "C_TradeSkillUI.GetRecipeQualityItemIDs",
    name = "GetRecipeQualityItemIDs",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetRecipeQualityItemIDs",
    params = { { name = "recipeSpellID", type = "number", default = nil } },
    returns = { { name = "qualityItemIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeQualityReagentLink"] = {
    key = "C_TradeSkillUI.GetRecipeQualityReagentLink",
    name = "GetRecipeQualityReagentLink",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetRecipeQualityReagentLink",
    params = { { name = "recipeID", type = "number", default = nil }, { name = "dataSlotIndex", type = "luaIndex", default = nil }, { name = "qualityIndex", type = "luaIndex", default = nil } },
    returns = { { name = "link", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeRequirements"] = {
    key = "C_TradeSkillUI.GetRecipeRequirements",
    name = "GetRecipeRequirements",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetRecipeRequirements",
    params = { { name = "recipeID", type = "number", default = nil } },
    returns = { { name = "requirements", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipeSchematic"] = {
    key = "C_TradeSkillUI.GetRecipeSchematic",
    name = "GetRecipeSchematic",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetRecipeSchematic",
    params = { { name = "recipeSpellID", type = "number", default = nil }, { name = "isRecraft", type = "bool", default = nil }, { name = "recipeLevel", type = "luaIndex", default = nil } },
    returns = { { name = "schematic", type = "CraftingRecipeSchematic", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecipesTracked"] = {
    key = "C_TradeSkillUI.GetRecipesTracked",
    name = "GetRecipesTracked",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetRecipesTracked",
    params = { { name = "isRecraft", type = "bool", default = nil } },
    returns = { { name = "recipeIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecraftItems"] = {
    key = "C_TradeSkillUI.GetRecraftItems",
    name = "GetRecraftItems",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetRecraftItems",
    params = { { name = "recipeID", type = "number", default = nil } },
    returns = { { name = "items", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRecraftRemovalWarnings"] = {
    key = "C_TradeSkillUI.GetRecraftRemovalWarnings",
    name = "GetRecraftRemovalWarnings",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetRecraftRemovalWarnings",
    params = { { name = "itemGUID", type = "WOWGUID", default = nil }, { name = "replacedReagents", type = "table", default = nil } },
    returns = { { name = "warnings", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetRemainingRecasts"] = {
    key = "C_TradeSkillUI.GetRemainingRecasts",
    name = "GetRemainingRecasts",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetRemainingRecasts",
    params = {  },
    returns = { { name = "remaining", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.GetSalvagableItemIDs"] = {
    key = "C_TradeSkillUI.GetSalvagableItemIDs",
    name = "GetSalvagableItemIDs",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetSalvagableItemIDs",
    params = { { name = "recipeID", type = "number", default = nil } },
    returns = { { name = "itemIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetShowLearned"] = {
    key = "C_TradeSkillUI.GetShowLearned",
    name = "GetShowLearned",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetShowLearned",
    params = {  },
    returns = { { name = "flag", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.GetShowUnlearned"] = {
    key = "C_TradeSkillUI.GetShowUnlearned",
    name = "GetShowUnlearned",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetShowUnlearned",
    params = {  },
    returns = { { name = "flag", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.GetSkillLineForGear"] = {
    key = "C_TradeSkillUI.GetSkillLineForGear",
    name = "GetSkillLineForGear",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetSkillLineForGear",
    params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
    returns = { { name = "skillLineID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.GetSourceTypeFilter"] = {
    key = "C_TradeSkillUI.GetSourceTypeFilter",
    name = "GetSourceTypeFilter",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetSourceTypeFilter",
    params = {  },
    returns = { { name = "sourceTypeFilter", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.GetTradeSkillDisplayName"] = {
    key = "C_TradeSkillUI.GetTradeSkillDisplayName",
    name = "GetTradeSkillDisplayName",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.GetTradeSkillDisplayName",
    params = { { name = "skillLineID", type = "number", default = nil } },
    returns = { { name = "professionDisplayName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.HasFavoriteOrderRecipes"] = {
    key = "C_TradeSkillUI.HasFavoriteOrderRecipes",
    name = "HasFavoriteOrderRecipes",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.HasFavoriteOrderRecipes",
    params = {  },
    returns = { { name = "hasFavorites", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.IsEnchantTargetValid"] = {
    key = "C_TradeSkillUI.IsEnchantTargetValid",
    name = "IsEnchantTargetValid",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.IsEnchantTargetValid",
    params = { { name = "recipeID", type = "number", default = nil }, { name = "itemGUID", type = "WOWGUID", default = nil }, { name = "craftingReagents", type = "table", default = nil } },
    returns = { { name = "valid", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsGuildTradeSkillsEnabled"] = {
    key = "C_TradeSkillUI.IsGuildTradeSkillsEnabled",
    name = "IsGuildTradeSkillsEnabled",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.IsGuildTradeSkillsEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.IsNPCCrafting"] = {
    key = "C_TradeSkillUI.IsNPCCrafting",
    name = "IsNPCCrafting",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.IsNPCCrafting",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.IsNearProfessionSpellFocus"] = {
    key = "C_TradeSkillUI.IsNearProfessionSpellFocus",
    name = "IsNearProfessionSpellFocus",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.IsNearProfessionSpellFocus",
    params = { { name = "profession", type = "Profession", default = nil } },
    returns = { { name = "nearFocus", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsOriginalCraftRecipeLearned"] = {
    key = "C_TradeSkillUI.IsOriginalCraftRecipeLearned",
    name = "IsOriginalCraftRecipeLearned",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.IsOriginalCraftRecipeLearned",
    params = { { name = "itemGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "learned", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsRecipeFirstCraft"] = {
    key = "C_TradeSkillUI.IsRecipeFirstCraft",
    name = "IsRecipeFirstCraft",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.IsRecipeFirstCraft",
    params = { { name = "recipeID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsRecipeInBaseSkillLine"] = {
    key = "C_TradeSkillUI.IsRecipeInBaseSkillLine",
    name = "IsRecipeInBaseSkillLine",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.IsRecipeInBaseSkillLine",
    params = { { name = "recipeID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsRecipeInSkillLine"] = {
    key = "C_TradeSkillUI.IsRecipeInSkillLine",
    name = "IsRecipeInSkillLine",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.IsRecipeInSkillLine",
    params = { { name = "recipeID", type = "number", default = nil }, { name = "skillLineID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsRecipeProfessionLearned"] = {
    key = "C_TradeSkillUI.IsRecipeProfessionLearned",
    name = "IsRecipeProfessionLearned",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.IsRecipeProfessionLearned",
    params = { { name = "recipeID", type = "number", default = nil } },
    returns = { { name = "recipeProfessionLearned", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsRecipeTracked"] = {
    key = "C_TradeSkillUI.IsRecipeTracked",
    name = "IsRecipeTracked",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.IsRecipeTracked",
    params = { { name = "recipeID", type = "number", default = nil }, { name = "isRecraft", type = "bool", default = nil } },
    returns = { { name = "tracked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsRecraftItemEquipped"] = {
    key = "C_TradeSkillUI.IsRecraftItemEquipped",
    name = "IsRecraftItemEquipped",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.IsRecraftItemEquipped",
    params = { { name = "recraftItemGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "isEquipped", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsRecraftReagentValid"] = {
    key = "C_TradeSkillUI.IsRecraftReagentValid",
    name = "IsRecraftReagentValid",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.IsRecraftReagentValid",
    params = { { name = "itemGUID", type = "WOWGUID", default = nil }, { name = "reagent", type = "CraftingReagent", default = nil } },
    returns = { { name = "valid", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.IsRuneforging"] = {
    key = "C_TradeSkillUI.IsRuneforging",
    name = "IsRuneforging",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.IsRuneforging",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TradeSkillUI.OpenRecipe"] = {
    key = "C_TradeSkillUI.OpenRecipe",
    name = "OpenRecipe",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.OpenRecipe",
    params = { { name = "recipeID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.OpenTradeSkill"] = {
    key = "C_TradeSkillUI.OpenTradeSkill",
    name = "OpenTradeSkill",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.OpenTradeSkill",
    params = { { name = "skillLineID", type = "number", default = nil } },
    returns = { { name = "opened", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.RecraftLimitCategoryValid"] = {
    key = "C_TradeSkillUI.RecraftLimitCategoryValid",
    name = "RecraftLimitCategoryValid",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.RecraftLimitCategoryValid",
    params = { { name = "reagent", type = "CraftingReagent", default = nil } },
    returns = { { name = "recraftValid", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.RecraftRecipe"] = {
    key = "C_TradeSkillUI.RecraftRecipe",
    name = "RecraftRecipe",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.RecraftRecipe",
    params = { { name = "itemGUID", type = "WOWGUID", default = nil }, { name = "craftingReagents", type = "table", default = nil }, { name = "removedModifications", type = "table", default = nil }, { name = "applyConcentration", type = "bool", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.RecraftRecipeForOrder"] = {
    key = "C_TradeSkillUI.RecraftRecipeForOrder",
    name = "RecraftRecipeForOrder",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.RecraftRecipeForOrder",
    params = { { name = "orderID", type = "BigUInteger", default = nil }, { name = "itemGUID", type = "WOWGUID", default = nil }, { name = "craftingReagents", type = "table", default = nil }, { name = "removedModifications", type = "table", default = nil }, { name = "applyConcentration", type = "bool", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.SetOnlyShowAvailableForOrders"] = {
    key = "C_TradeSkillUI.SetOnlyShowAvailableForOrders",
    name = "SetOnlyShowAvailableForOrders",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.SetOnlyShowAvailableForOrders",
    params = { { name = "flag", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.SetProfessionChildSkillLineID"] = {
    key = "C_TradeSkillUI.SetProfessionChildSkillLineID",
    name = "SetProfessionChildSkillLineID",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.SetProfessionChildSkillLineID",
    params = { { name = "skillLineID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.SetRecipeTracked"] = {
    key = "C_TradeSkillUI.SetRecipeTracked",
    name = "SetRecipeTracked",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.SetRecipeTracked",
    params = { { name = "recipeID", type = "number", default = nil }, { name = "tracked", type = "bool", default = nil }, { name = "isRecraft", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.SetShowLearned"] = {
    key = "C_TradeSkillUI.SetShowLearned",
    name = "SetShowLearned",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.SetShowLearned",
    params = { { name = "flag", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.SetShowUnlearned"] = {
    key = "C_TradeSkillUI.SetShowUnlearned",
    name = "SetShowUnlearned",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.SetShowUnlearned",
    params = { { name = "flag", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TradeSkillUI.SetSourceTypeFilter"] = {
    key = "C_TradeSkillUI.SetSourceTypeFilter",
    name = "SetSourceTypeFilter",
    category = "profession",
    subcategory = "c_tradeskillui",
    funcPath = "C_TradeSkillUI.SetSourceTypeFilter",
    params = { { name = "sourceTypeFilter", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

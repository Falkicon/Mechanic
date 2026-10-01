-- Generated APIDefinitions for namespace: C_Container
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Container.ContainerIDToInventoryID"] = {
    key = "C_Container.ContainerIDToInventoryID",
    name = "ContainerIDToInventoryID",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.ContainerIDToInventoryID",
    params = { { name = "containerID", type = "BagIndex", default = nil } },
    returns = { { name = "inventoryID", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.ContainerRefundItemPurchase"] = {
    key = "C_Container.ContainerRefundItemPurchase",
    name = "ContainerRefundItemPurchase",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.ContainerRefundItemPurchase",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil }, { name = "isEquipped", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetBackpackAutosortDisabled"] = {
    key = "C_Container.GetBackpackAutosortDisabled",
    name = "GetBackpackAutosortDisabled",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetBackpackAutosortDisabled",
    params = {  },
    returns = { { name = "isDisabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Container.GetBackpackSellJunkDisabled"] = {
    key = "C_Container.GetBackpackSellJunkDisabled",
    name = "GetBackpackSellJunkDisabled",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetBackpackSellJunkDisabled",
    params = {  },
    returns = { { name = "isDisabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Container.GetBagName"] = {
    key = "C_Container.GetBagName",
    name = "GetBagName",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetBagName",
    params = { { name = "bagIndex", type = "BagIndex", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetBagSlotFlag"] = {
    key = "C_Container.GetBagSlotFlag",
    name = "GetBagSlotFlag",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetBagSlotFlag",
    params = { { name = "bagIndex", type = "BagIndex", default = nil }, { name = "flag", type = "BagSlotFlags", default = nil } },
    returns = { { name = "isSet", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetBankAutosortDisabled"] = {
    key = "C_Container.GetBankAutosortDisabled",
    name = "GetBankAutosortDisabled",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetBankAutosortDisabled",
    params = {  },
    returns = { { name = "isDisabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Container.GetContainerFreeSlots"] = {
    key = "C_Container.GetContainerFreeSlots",
    name = "GetContainerFreeSlots",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetContainerFreeSlots",
    params = { { name = "containerIndex", type = "BagIndex", default = nil } },
    returns = { { name = "freeSlots", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetContainerItemCooldown"] = {
    key = "C_Container.GetContainerItemCooldown",
    name = "GetContainerItemCooldown",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetContainerItemCooldown",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false }, { name = "enable", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetContainerItemDurability"] = {
    key = "C_Container.GetContainerItemDurability",
    name = "GetContainerItemDurability",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetContainerItemDurability",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "durability", type = "number", canBeSecret = false }, { name = "maxDurability", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetContainerItemEquipmentSetInfo"] = {
    key = "C_Container.GetContainerItemEquipmentSetInfo",
    name = "GetContainerItemEquipmentSetInfo",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetContainerItemEquipmentSetInfo",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "inSet", type = "bool", canBeSecret = false }, { name = "setList", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetContainerItemID"] = {
    key = "C_Container.GetContainerItemID",
    name = "GetContainerItemID",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetContainerItemID",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "containerID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetContainerItemInfo"] = {
    key = "C_Container.GetContainerItemInfo",
    name = "GetContainerItemInfo",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetContainerItemInfo",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "containerInfo", type = "ContainerItemInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetContainerItemLink"] = {
    key = "C_Container.GetContainerItemLink",
    name = "GetContainerItemLink",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetContainerItemLink",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "itemLink", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetContainerItemPurchaseCurrency"] = {
    key = "C_Container.GetContainerItemPurchaseCurrency",
    name = "GetContainerItemPurchaseCurrency",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetContainerItemPurchaseCurrency",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil }, { name = "itemIndex", type = "luaIndex", default = nil }, { name = "isEquipped", type = "bool", default = nil } },
    returns = { { name = "currencyInfo", type = "ItemPurchaseCurrency", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetContainerItemPurchaseInfo"] = {
    key = "C_Container.GetContainerItemPurchaseInfo",
    name = "GetContainerItemPurchaseInfo",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetContainerItemPurchaseInfo",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil }, { name = "isEquipped", type = "bool", default = nil } },
    returns = { { name = "info", type = "ItemPurchaseInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetContainerItemPurchaseItem"] = {
    key = "C_Container.GetContainerItemPurchaseItem",
    name = "GetContainerItemPurchaseItem",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetContainerItemPurchaseItem",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil }, { name = "itemIndex", type = "luaIndex", default = nil }, { name = "isEquipped", type = "bool", default = nil } },
    returns = { { name = "itemInfo", type = "ItemPurchaseItem", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetContainerItemQuestInfo"] = {
    key = "C_Container.GetContainerItemQuestInfo",
    name = "GetContainerItemQuestInfo",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetContainerItemQuestInfo",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "questInfo", type = "ItemQuestInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetContainerNumFreeSlots"] = {
    key = "C_Container.GetContainerNumFreeSlots",
    name = "GetContainerNumFreeSlots",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetContainerNumFreeSlots",
    params = { { name = "bagIndex", type = "BagIndex", default = nil } },
    returns = { { name = "numFreeSlots", type = "number", canBeSecret = false }, { name = "bagFamily", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetContainerNumSlots"] = {
    key = "C_Container.GetContainerNumSlots",
    name = "GetContainerNumSlots",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetContainerNumSlots",
    params = { { name = "containerIndex", type = "BagIndex", default = nil } },
    returns = { { name = "numSlots", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetInsertItemsLeftToRight"] = {
    key = "C_Container.GetInsertItemsLeftToRight",
    name = "GetInsertItemsLeftToRight",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetInsertItemsLeftToRight",
    params = {  },
    returns = { { name = "isEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Container.GetItemCooldown"] = {
    key = "C_Container.GetItemCooldown",
    name = "GetItemCooldown",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetItemCooldown",
    params = { { name = "itemID", type = "number", default = nil } },
    returns = { { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false }, { name = "enable", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.GetMaxArenaCurrency"] = {
    key = "C_Container.GetMaxArenaCurrency",
    name = "GetMaxArenaCurrency",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetMaxArenaCurrency",
    params = {  },
    returns = { { name = "maxCurrency", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Container.GetSortBagsRightToLeft"] = {
    key = "C_Container.GetSortBagsRightToLeft",
    name = "GetSortBagsRightToLeft",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.GetSortBagsRightToLeft",
    params = {  },
    returns = { { name = "isEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Container.HasContainerItem"] = {
    key = "C_Container.HasContainerItem",
    name = "HasContainerItem",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.HasContainerItem",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "hasItem", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.IsBattlePayItem"] = {
    key = "C_Container.IsBattlePayItem",
    name = "IsBattlePayItem",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.IsBattlePayItem",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "isBattlePayItem", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.IsContainerFiltered"] = {
    key = "C_Container.IsContainerFiltered",
    name = "IsContainerFiltered",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.IsContainerFiltered",
    params = { { name = "containerIndex", type = "BagIndex", default = nil } },
    returns = { { name = "isFiltered", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.PickupContainerItem"] = {
    key = "C_Container.PickupContainerItem",
    name = "PickupContainerItem",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.PickupContainerItem",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.PlayerHasHearthstone"] = {
    key = "C_Container.PlayerHasHearthstone",
    name = "PlayerHasHearthstone",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.PlayerHasHearthstone",
    params = {  },
    returns = { { name = "itemID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Container.SetBackpackAutosortDisabled"] = {
    key = "C_Container.SetBackpackAutosortDisabled",
    name = "SetBackpackAutosortDisabled",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.SetBackpackAutosortDisabled",
    params = { { name = "disable", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.SetBackpackSellJunkDisabled"] = {
    key = "C_Container.SetBackpackSellJunkDisabled",
    name = "SetBackpackSellJunkDisabled",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.SetBackpackSellJunkDisabled",
    params = { { name = "disable", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.SetBagPortraitTexture"] = {
    key = "C_Container.SetBagPortraitTexture",
    name = "SetBagPortraitTexture",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.SetBagPortraitTexture",
    params = { { name = "texture", type = "SimpleTexture", default = nil }, { name = "bagIndex", type = "BagIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.SetBagSlotFlag"] = {
    key = "C_Container.SetBagSlotFlag",
    name = "SetBagSlotFlag",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.SetBagSlotFlag",
    params = { { name = "bagIndex", type = "BagIndex", default = nil }, { name = "flag", type = "BagSlotFlags", default = nil }, { name = "isSet", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.SetBankAutosortDisabled"] = {
    key = "C_Container.SetBankAutosortDisabled",
    name = "SetBankAutosortDisabled",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.SetBankAutosortDisabled",
    params = { { name = "disable", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.SetInsertItemsLeftToRight"] = {
    key = "C_Container.SetInsertItemsLeftToRight",
    name = "SetInsertItemsLeftToRight",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.SetInsertItemsLeftToRight",
    params = { { name = "enable", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.SetItemSearch"] = {
    key = "C_Container.SetItemSearch",
    name = "SetItemSearch",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.SetItemSearch",
    params = { { name = "searchString", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.SetSortBagsRightToLeft"] = {
    key = "C_Container.SetSortBagsRightToLeft",
    name = "SetSortBagsRightToLeft",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.SetSortBagsRightToLeft",
    params = { { name = "enable", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.ShowContainerSellCursor"] = {
    key = "C_Container.ShowContainerSellCursor",
    name = "ShowContainerSellCursor",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.ShowContainerSellCursor",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.SocketContainerItem"] = {
    key = "C_Container.SocketContainerItem",
    name = "SocketContainerItem",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.SocketContainerItem",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.SortAccountBankBags"] = {
    key = "C_Container.SortAccountBankBags",
    name = "SortAccountBankBags",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.SortAccountBankBags",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Container.SortBags"] = {
    key = "C_Container.SortBags",
    name = "SortBags",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.SortBags",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Container.SortBank"] = {
    key = "C_Container.SortBank",
    name = "SortBank",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.SortBank",
    params = { { name = "bankType", type = "BankType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.SortBankBags"] = {
    key = "C_Container.SortBankBags",
    name = "SortBankBags",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.SortBankBags",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Container.SplitContainerItem"] = {
    key = "C_Container.SplitContainerItem",
    name = "SplitContainerItem",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.SplitContainerItem",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil }, { name = "amount", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.UseContainerItem"] = {
    key = "C_Container.UseContainerItem",
    name = "UseContainerItem",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.UseContainerItem",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil }, { name = "unitToken", type = "UnitToken", default = "player" }, { name = "bankType", type = "BankType", default = nil }, { name = "reagentBankOpen", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Container.UseHearthstone"] = {
    key = "C_Container.UseHearthstone",
    name = "UseHearthstone",
    category = "item",
    subcategory = "c_container",
    funcPath = "C_Container.UseHearthstone",
    params = {  },
    returns = { { name = "used", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

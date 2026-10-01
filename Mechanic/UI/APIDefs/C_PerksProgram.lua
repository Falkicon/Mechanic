-- Generated APIDefinitions for namespace: C_PerksProgram
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PerksProgram.ClearFrozenPerksVendorItem"] = {
    key = "C_PerksProgram.ClearFrozenPerksVendorItem",
    name = "ClearFrozenPerksVendorItem",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.ClearFrozenPerksVendorItem",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksProgram.CloseInteraction"] = {
    key = "C_PerksProgram.CloseInteraction",
    name = "CloseInteraction",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.CloseInteraction",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksProgram.GetAvailableCategoryIDs"] = {
    key = "C_PerksProgram.GetAvailableCategoryIDs",
    name = "GetAvailableCategoryIDs",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.GetAvailableCategoryIDs",
    params = {  },
    returns = { { name = "categoryIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksProgram.GetAvailableVendorItemIDs"] = {
    key = "C_PerksProgram.GetAvailableVendorItemIDs",
    name = "GetAvailableVendorItemIDs",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.GetAvailableVendorItemIDs",
    params = {  },
    returns = { { name = "vendorItemIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksProgram.GetCategoryInfo"] = {
    key = "C_PerksProgram.GetCategoryInfo",
    name = "GetCategoryInfo",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.GetCategoryInfo",
    params = { { name = "categoryID", type = "number", default = nil } },
    returns = { { name = "categoryInfo", type = "PerksVendorCategoryInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.GetCurrencyAmount"] = {
    key = "C_PerksProgram.GetCurrencyAmount",
    name = "GetCurrencyAmount",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.GetCurrencyAmount",
    params = {  },
    returns = { { name = "currencyAmount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksProgram.GetDraggedPerksVendorItem"] = {
    key = "C_PerksProgram.GetDraggedPerksVendorItem",
    name = "GetDraggedPerksVendorItem",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.GetDraggedPerksVendorItem",
    params = {  },
    returns = { { name = "perksVendorItemID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksProgram.GetFrozenPerksVendorItemInfo"] = {
    key = "C_PerksProgram.GetFrozenPerksVendorItemInfo",
    name = "GetFrozenPerksVendorItemInfo",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.GetFrozenPerksVendorItemInfo",
    params = {  },
    returns = { { name = "vendorItemInfo", type = "PerksVendorItemInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksProgram.GetPendingChestRewards"] = {
    key = "C_PerksProgram.GetPendingChestRewards",
    name = "GetPendingChestRewards",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.GetPendingChestRewards",
    params = {  },
    returns = { { name = "pendingRewards", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksProgram.GetPerksProgramItemDisplayInfo"] = {
    key = "C_PerksProgram.GetPerksProgramItemDisplayInfo",
    name = "GetPerksProgramItemDisplayInfo",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.GetPerksProgramItemDisplayInfo",
    params = { { name = "id", type = "number", default = nil } },
    returns = { { name = "item", type = "PerksProgramItemDisplayInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.GetTimeRemaining"] = {
    key = "C_PerksProgram.GetTimeRemaining",
    name = "GetTimeRemaining",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.GetTimeRemaining",
    params = { { name = "vendorItemID", type = "number", default = nil } },
    returns = { { name = "timeRemaining", type = "time_t", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.GetVendorItemInfo"] = {
    key = "C_PerksProgram.GetVendorItemInfo",
    name = "GetVendorItemInfo",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.GetVendorItemInfo",
    params = { { name = "vendorItemID", type = "number", default = nil } },
    returns = { { name = "vendorItemInfo", type = "PerksVendorItemInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.GetVendorItemInfoRefundTimeLeft"] = {
    key = "C_PerksProgram.GetVendorItemInfoRefundTimeLeft",
    name = "GetVendorItemInfoRefundTimeLeft",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.GetVendorItemInfoRefundTimeLeft",
    params = { { name = "vendorItemID", type = "number", default = nil } },
    returns = { { name = "refundTimeRemaining", type = "time_t", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.IsAttackAnimToggleEnabled"] = {
    key = "C_PerksProgram.IsAttackAnimToggleEnabled",
    name = "IsAttackAnimToggleEnabled",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.IsAttackAnimToggleEnabled",
    params = {  },
    returns = { { name = "isAttackAnimToggleEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksProgram.IsFrozenPerksVendorItem"] = {
    key = "C_PerksProgram.IsFrozenPerksVendorItem",
    name = "IsFrozenPerksVendorItem",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.IsFrozenPerksVendorItem",
    params = { { name = "perksVendorItemID", type = "number", default = nil } },
    returns = { { name = "isFrozen", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.IsMountSpecialAnimToggleEnabled"] = {
    key = "C_PerksProgram.IsMountSpecialAnimToggleEnabled",
    name = "IsMountSpecialAnimToggleEnabled",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.IsMountSpecialAnimToggleEnabled",
    params = {  },
    returns = { { name = "isMountSpecialAnimToggleEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksProgram.ItemSelectedTelemetry"] = {
    key = "C_PerksProgram.ItemSelectedTelemetry",
    name = "ItemSelectedTelemetry",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.ItemSelectedTelemetry",
    params = { { name = "perksVendorItemID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.PickupPerksVendorItem"] = {
    key = "C_PerksProgram.PickupPerksVendorItem",
    name = "PickupPerksVendorItem",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.PickupPerksVendorItem",
    params = { { name = "perksVendorItemID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.RequestCartCheckout"] = {
    key = "C_PerksProgram.RequestCartCheckout",
    name = "RequestCartCheckout",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.RequestCartCheckout",
    params = { { name = "perksVendorItemIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.RequestPendingChestRewards"] = {
    key = "C_PerksProgram.RequestPendingChestRewards",
    name = "RequestPendingChestRewards",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.RequestPendingChestRewards",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksProgram.RequestPurchase"] = {
    key = "C_PerksProgram.RequestPurchase",
    name = "RequestPurchase",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.RequestPurchase",
    params = { { name = "perksVendorItemID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.RequestRefund"] = {
    key = "C_PerksProgram.RequestRefund",
    name = "RequestRefund",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.RequestRefund",
    params = { { name = "perksVendorItemID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksProgram.ResetHeldItemDragAndDrop"] = {
    key = "C_PerksProgram.ResetHeldItemDragAndDrop",
    name = "ResetHeldItemDragAndDrop",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.ResetHeldItemDragAndDrop",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksProgram.SetFrozenPerksVendorItem"] = {
    key = "C_PerksProgram.SetFrozenPerksVendorItem",
    name = "SetFrozenPerksVendorItem",
    category = "general",
    subcategory = "c_perksprogram",
    funcPath = "C_PerksProgram.SetFrozenPerksVendorItem",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

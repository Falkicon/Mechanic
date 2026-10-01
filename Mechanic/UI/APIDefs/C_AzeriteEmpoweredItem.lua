-- Generated APIDefinitions for namespace: C_AzeriteEmpoweredItem
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AzeriteEmpoweredItem.CanSelectPower"] = {
    key = "C_AzeriteEmpoweredItem.CanSelectPower",
    name = "CanSelectPower",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.CanSelectPower",
    params = { { name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil }, { name = "powerID", type = "number", default = nil } },
    returns = { { name = "canSelect", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.ConfirmAzeriteEmpoweredItemRespec"] = {
    key = "C_AzeriteEmpoweredItem.ConfirmAzeriteEmpoweredItemRespec",
    name = "ConfirmAzeriteEmpoweredItemRespec",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.ConfirmAzeriteEmpoweredItemRespec",
    params = { { name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.GetAllTierInfo"] = {
    key = "C_AzeriteEmpoweredItem.GetAllTierInfo",
    name = "GetAllTierInfo",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.GetAllTierInfo",
    params = { { name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil } },
    returns = { { name = "tierInfo", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.GetAllTierInfoByItemID"] = {
    key = "C_AzeriteEmpoweredItem.GetAllTierInfoByItemID",
    name = "GetAllTierInfoByItemID",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.GetAllTierInfoByItemID",
    params = { { name = "itemInfo", type = "ItemInfo", default = nil }, { name = "classID", type = "number", default = nil } },
    returns = { { name = "tierInfo", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.GetAzeriteEmpoweredItemRespecCost"] = {
    key = "C_AzeriteEmpoweredItem.GetAzeriteEmpoweredItemRespecCost",
    name = "GetAzeriteEmpoweredItemRespecCost",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.GetAzeriteEmpoweredItemRespecCost",
    params = {  },
    returns = { { name = "cost", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AzeriteEmpoweredItem.GetPowerInfo"] = {
    key = "C_AzeriteEmpoweredItem.GetPowerInfo",
    name = "GetPowerInfo",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.GetPowerInfo",
    params = { { name = "powerID", type = "number", default = nil } },
    returns = { { name = "powerInfo", type = "AzeriteEmpoweredItemPowerInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.GetPowerText"] = {
    key = "C_AzeriteEmpoweredItem.GetPowerText",
    name = "GetPowerText",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.GetPowerText",
    params = { { name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil }, { name = "powerID", type = "number", default = nil }, { name = "level", type = "AzeritePowerLevel", default = nil } },
    returns = { { name = "powerText", type = "AzeriteEmpoweredItemPowerText", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.GetSpecsForPower"] = {
    key = "C_AzeriteEmpoweredItem.GetSpecsForPower",
    name = "GetSpecsForPower",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.GetSpecsForPower",
    params = { { name = "powerID", type = "number", default = nil } },
    returns = { { name = "specInfo", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.HasAnyUnselectedPowers"] = {
    key = "C_AzeriteEmpoweredItem.HasAnyUnselectedPowers",
    name = "HasAnyUnselectedPowers",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.HasAnyUnselectedPowers",
    params = { { name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil } },
    returns = { { name = "hasAnyUnselectedPowers", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.HasBeenViewed"] = {
    key = "C_AzeriteEmpoweredItem.HasBeenViewed",
    name = "HasBeenViewed",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.HasBeenViewed",
    params = { { name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil } },
    returns = { { name = "hasBeenViewed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItem"] = {
    key = "C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItem",
    name = "IsAzeriteEmpoweredItem",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItem",
    params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
    returns = { { name = "isAzeriteEmpoweredItem", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID"] = {
    key = "C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID",
    name = "IsAzeriteEmpoweredItemByID",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID",
    params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
    returns = { { name = "isAzeriteEmpoweredItem", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.IsAzeritePreviewSourceDisplayable"] = {
    key = "C_AzeriteEmpoweredItem.IsAzeritePreviewSourceDisplayable",
    name = "IsAzeritePreviewSourceDisplayable",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.IsAzeritePreviewSourceDisplayable",
    params = { { name = "itemInfo", type = "ItemInfo", default = nil }, { name = "classID", type = "number", default = nil } },
    returns = { { name = "isAzeritePreviewSourceDisplayable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.IsHeartOfAzerothEquipped"] = {
    key = "C_AzeriteEmpoweredItem.IsHeartOfAzerothEquipped",
    name = "IsHeartOfAzerothEquipped",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.IsHeartOfAzerothEquipped",
    params = {  },
    returns = { { name = "isHeartOfAzerothEquipped", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AzeriteEmpoweredItem.IsPowerAvailableForSpec"] = {
    key = "C_AzeriteEmpoweredItem.IsPowerAvailableForSpec",
    name = "IsPowerAvailableForSpec",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.IsPowerAvailableForSpec",
    params = { { name = "powerID", type = "number", default = nil }, { name = "specID", type = "number", default = nil } },
    returns = { { name = "isPowerAvailableForSpec", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.IsPowerSelected"] = {
    key = "C_AzeriteEmpoweredItem.IsPowerSelected",
    name = "IsPowerSelected",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.IsPowerSelected",
    params = { { name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil }, { name = "powerID", type = "number", default = nil } },
    returns = { { name = "isSelected", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.SelectPower"] = {
    key = "C_AzeriteEmpoweredItem.SelectPower",
    name = "SelectPower",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.SelectPower",
    params = { { name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil }, { name = "powerID", type = "number", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteEmpoweredItem.SetHasBeenViewed"] = {
    key = "C_AzeriteEmpoweredItem.SetHasBeenViewed",
    name = "SetHasBeenViewed",
    category = "item",
    subcategory = "c_azeriteempowereditem",
    funcPath = "C_AzeriteEmpoweredItem.SetHasBeenViewed",
    params = { { name = "azeriteEmpoweredItemLocation", type = "AzeriteEmpoweredItemLocation", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_AzeriteItem
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AzeriteItem.FindActiveAzeriteItem"] = {
    key = "C_AzeriteItem.FindActiveAzeriteItem",
    name = "FindActiveAzeriteItem",
    category = "item",
    subcategory = "c_azeriteitem",
    func = _G["C_AzeriteItem"] and _G["C_AzeriteItem"]["FindActiveAzeriteItem"],
    funcPath = "C_AzeriteItem.FindActiveAzeriteItem",
    params = {  },
    returns = { { name = "activeAzeriteItemLocation", type = "AzeriteItemLocation", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AzeriteItem.GetAzeriteItemXPInfo"] = {
    key = "C_AzeriteItem.GetAzeriteItemXPInfo",
    name = "GetAzeriteItemXPInfo",
    category = "combat_midnight",
    subcategory = "c_azeriteitem",
    func = _G["C_AzeriteItem"] and _G["C_AzeriteItem"]["GetAzeriteItemXPInfo"],
    funcPath = "C_AzeriteItem.GetAzeriteItemXPInfo",
    params = { { name = "azeriteItemLocation", type = "AzeriteItemLocation", default = nil } },
    returns = { { name = "xp", type = "number", canBeSecret = false }, { name = "totalLevelXP", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteItem.GetPowerLevel"] = {
    key = "C_AzeriteItem.GetPowerLevel",
    name = "GetPowerLevel",
    category = "combat_midnight",
    subcategory = "c_azeriteitem",
    func = _G["C_AzeriteItem"] and _G["C_AzeriteItem"]["GetPowerLevel"],
    funcPath = "C_AzeriteItem.GetPowerLevel",
    params = { { name = "azeriteItemLocation", type = "AzeriteItemLocation", default = nil } },
    returns = { { name = "powerLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteItem.GetUnlimitedPowerLevel"] = {
    key = "C_AzeriteItem.GetUnlimitedPowerLevel",
    name = "GetUnlimitedPowerLevel",
    category = "combat_midnight",
    subcategory = "c_azeriteitem",
    func = _G["C_AzeriteItem"] and _G["C_AzeriteItem"]["GetUnlimitedPowerLevel"],
    funcPath = "C_AzeriteItem.GetUnlimitedPowerLevel",
    params = { { name = "azeriteItemLocation", type = "AzeriteItemLocation", default = nil } },
    returns = { { name = "powerLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteItem.HasActiveAzeriteItem"] = {
    key = "C_AzeriteItem.HasActiveAzeriteItem",
    name = "HasActiveAzeriteItem",
    category = "item",
    subcategory = "c_azeriteitem",
    func = _G["C_AzeriteItem"] and _G["C_AzeriteItem"]["HasActiveAzeriteItem"],
    funcPath = "C_AzeriteItem.HasActiveAzeriteItem",
    params = {  },
    returns = { { name = "hasActiveAzeriteItem", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AzeriteItem.IsAzeriteItem"] = {
    key = "C_AzeriteItem.IsAzeriteItem",
    name = "IsAzeriteItem",
    category = "combat_midnight",
    subcategory = "c_azeriteitem",
    func = _G["C_AzeriteItem"] and _G["C_AzeriteItem"]["IsAzeriteItem"],
    funcPath = "C_AzeriteItem.IsAzeriteItem",
    params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
    returns = { { name = "isAzeriteItem", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteItem.IsAzeriteItemAtMaxLevel"] = {
    key = "C_AzeriteItem.IsAzeriteItemAtMaxLevel",
    name = "IsAzeriteItemAtMaxLevel",
    category = "item",
    subcategory = "c_azeriteitem",
    func = _G["C_AzeriteItem"] and _G["C_AzeriteItem"]["IsAzeriteItemAtMaxLevel"],
    funcPath = "C_AzeriteItem.IsAzeriteItemAtMaxLevel",
    params = {  },
    returns = { { name = "isAtMax", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AzeriteItem.IsAzeriteItemByID"] = {
    key = "C_AzeriteItem.IsAzeriteItemByID",
    name = "IsAzeriteItemByID",
    category = "combat_midnight",
    subcategory = "c_azeriteitem",
    func = _G["C_AzeriteItem"] and _G["C_AzeriteItem"]["IsAzeriteItemByID"],
    funcPath = "C_AzeriteItem.IsAzeriteItemByID",
    params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
    returns = { { name = "isAzeriteItem", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteItem.IsAzeriteItemEnabled"] = {
    key = "C_AzeriteItem.IsAzeriteItemEnabled",
    name = "IsAzeriteItemEnabled",
    category = "combat_midnight",
    subcategory = "c_azeriteitem",
    func = _G["C_AzeriteItem"] and _G["C_AzeriteItem"]["IsAzeriteItemEnabled"],
    funcPath = "C_AzeriteItem.IsAzeriteItemEnabled",
    params = { { name = "azeriteItemLocation", type = "AzeriteItemLocation", default = nil } },
    returns = { { name = "isEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AzeriteItem.IsUnlimitedLevelingUnlocked"] = {
    key = "C_AzeriteItem.IsUnlimitedLevelingUnlocked",
    name = "IsUnlimitedLevelingUnlocked",
    category = "item",
    subcategory = "c_azeriteitem",
    func = _G["C_AzeriteItem"] and _G["C_AzeriteItem"]["IsUnlimitedLevelingUnlocked"],
    funcPath = "C_AzeriteItem.IsUnlimitedLevelingUnlocked",
    params = {  },
    returns = { { name = "isUnlimitedLevelingUnlocked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

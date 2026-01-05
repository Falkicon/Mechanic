-- Generated APIDefinitions for namespace: C_HeirloomInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HeirloomInfo.AreAllCollectionFiltersChecked"] = {
    key = "C_HeirloomInfo.AreAllCollectionFiltersChecked",
    name = "AreAllCollectionFiltersChecked",
    category = "general",
    subcategory = "c_heirloominfo",
    func = _G["C_HeirloomInfo"] and _G["C_HeirloomInfo"]["AreAllCollectionFiltersChecked"],
    funcPath = "C_HeirloomInfo.AreAllCollectionFiltersChecked",
    params = {  },
    returns = { { name = "areAllCollectionFiltersChecked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HeirloomInfo.AreAllSourceFiltersChecked"] = {
    key = "C_HeirloomInfo.AreAllSourceFiltersChecked",
    name = "AreAllSourceFiltersChecked",
    category = "general",
    subcategory = "c_heirloominfo",
    func = _G["C_HeirloomInfo"] and _G["C_HeirloomInfo"]["AreAllSourceFiltersChecked"],
    funcPath = "C_HeirloomInfo.AreAllSourceFiltersChecked",
    params = {  },
    returns = { { name = "areAllSourceFiltersChecked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HeirloomInfo.IsHeirloomSourceValid"] = {
    key = "C_HeirloomInfo.IsHeirloomSourceValid",
    name = "IsHeirloomSourceValid",
    category = "combat_midnight",
    subcategory = "c_heirloominfo",
    func = _G["C_HeirloomInfo"] and _G["C_HeirloomInfo"]["IsHeirloomSourceValid"],
    funcPath = "C_HeirloomInfo.IsHeirloomSourceValid",
    params = { { name = "source", type = "luaIndex", default = nil } },
    returns = { { name = "isHeirloomSourceValid", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HeirloomInfo.IsUsingDefaultFilters"] = {
    key = "C_HeirloomInfo.IsUsingDefaultFilters",
    name = "IsUsingDefaultFilters",
    category = "general",
    subcategory = "c_heirloominfo",
    func = _G["C_HeirloomInfo"] and _G["C_HeirloomInfo"]["IsUsingDefaultFilters"],
    funcPath = "C_HeirloomInfo.IsUsingDefaultFilters",
    params = {  },
    returns = { { name = "isUsingDefaultFilters", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HeirloomInfo.SetAllCollectionFilters"] = {
    key = "C_HeirloomInfo.SetAllCollectionFilters",
    name = "SetAllCollectionFilters",
    category = "combat_midnight",
    subcategory = "c_heirloominfo",
    func = _G["C_HeirloomInfo"] and _G["C_HeirloomInfo"]["SetAllCollectionFilters"],
    funcPath = "C_HeirloomInfo.SetAllCollectionFilters",
    params = { { name = "checked", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HeirloomInfo.SetAllSourceFilters"] = {
    key = "C_HeirloomInfo.SetAllSourceFilters",
    name = "SetAllSourceFilters",
    category = "combat_midnight",
    subcategory = "c_heirloominfo",
    func = _G["C_HeirloomInfo"] and _G["C_HeirloomInfo"]["SetAllSourceFilters"],
    funcPath = "C_HeirloomInfo.SetAllSourceFilters",
    params = { { name = "checked", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HeirloomInfo.SetDefaultFilters"] = {
    key = "C_HeirloomInfo.SetDefaultFilters",
    name = "SetDefaultFilters",
    category = "general",
    subcategory = "c_heirloominfo",
    func = _G["C_HeirloomInfo"] and _G["C_HeirloomInfo"]["SetDefaultFilters"],
    funcPath = "C_HeirloomInfo.SetDefaultFilters",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

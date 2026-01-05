-- Generated APIDefinitions for namespace: C_ToyBoxInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ToyBoxInfo.ClearFanfare"] = {
    key = "C_ToyBoxInfo.ClearFanfare",
    name = "ClearFanfare",
    category = "combat_midnight",
    subcategory = "c_toyboxinfo",
    func = _G["C_ToyBoxInfo"] and _G["C_ToyBoxInfo"]["ClearFanfare"],
    funcPath = "C_ToyBoxInfo.ClearFanfare",
    params = { { name = "itemID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ToyBoxInfo.IsToySourceValid"] = {
    key = "C_ToyBoxInfo.IsToySourceValid",
    name = "IsToySourceValid",
    category = "combat_midnight",
    subcategory = "c_toyboxinfo",
    func = _G["C_ToyBoxInfo"] and _G["C_ToyBoxInfo"]["IsToySourceValid"],
    funcPath = "C_ToyBoxInfo.IsToySourceValid",
    params = { { name = "source", type = "luaIndex", default = nil } },
    returns = { { name = "isToySourceValid", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ToyBoxInfo.IsUsingDefaultFilters"] = {
    key = "C_ToyBoxInfo.IsUsingDefaultFilters",
    name = "IsUsingDefaultFilters",
    category = "general",
    subcategory = "c_toyboxinfo",
    func = _G["C_ToyBoxInfo"] and _G["C_ToyBoxInfo"]["IsUsingDefaultFilters"],
    funcPath = "C_ToyBoxInfo.IsUsingDefaultFilters",
    params = {  },
    returns = { { name = "isUsingDefaultFilters", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ToyBoxInfo.NeedsFanfare"] = {
    key = "C_ToyBoxInfo.NeedsFanfare",
    name = "NeedsFanfare",
    category = "combat_midnight",
    subcategory = "c_toyboxinfo",
    func = _G["C_ToyBoxInfo"] and _G["C_ToyBoxInfo"]["NeedsFanfare"],
    funcPath = "C_ToyBoxInfo.NeedsFanfare",
    params = { { name = "itemID", type = "number", default = nil } },
    returns = { { name = "needsFanfare", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ToyBoxInfo.SetDefaultFilters"] = {
    key = "C_ToyBoxInfo.SetDefaultFilters",
    name = "SetDefaultFilters",
    category = "general",
    subcategory = "c_toyboxinfo",
    func = _G["C_ToyBoxInfo"] and _G["C_ToyBoxInfo"]["SetDefaultFilters"],
    funcPath = "C_ToyBoxInfo.SetDefaultFilters",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

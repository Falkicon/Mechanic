-- Generated APIDefinitions for namespace: C_ToyBoxInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ToyBoxInfo.ClearFanfare"] = {
    key = "C_ToyBoxInfo.ClearFanfare",
    name = "ClearFanfare",
    category = "general",
    subcategory = "c_toyboxinfo",
    funcPath = "C_ToyBoxInfo.ClearFanfare",
    params = { { name = "itemID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ToyBoxInfo.IsToySourceValid"] = {
    key = "C_ToyBoxInfo.IsToySourceValid",
    name = "IsToySourceValid",
    category = "general",
    subcategory = "c_toyboxinfo",
    funcPath = "C_ToyBoxInfo.IsToySourceValid",
    params = { { name = "source", type = "luaIndex", default = nil } },
    returns = { { name = "isToySourceValid", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ToyBoxInfo.IsUsingDefaultFilters"] = {
    key = "C_ToyBoxInfo.IsUsingDefaultFilters",
    name = "IsUsingDefaultFilters",
    category = "general",
    subcategory = "c_toyboxinfo",
    funcPath = "C_ToyBoxInfo.IsUsingDefaultFilters",
    params = {  },
    returns = { { name = "isUsingDefaultFilters", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ToyBoxInfo.NeedsFanfare"] = {
    key = "C_ToyBoxInfo.NeedsFanfare",
    name = "NeedsFanfare",
    category = "general",
    subcategory = "c_toyboxinfo",
    funcPath = "C_ToyBoxInfo.NeedsFanfare",
    params = { { name = "itemID", type = "number", default = nil } },
    returns = { { name = "needsFanfare", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ToyBoxInfo.SetDefaultFilters"] = {
    key = "C_ToyBoxInfo.SetDefaultFilters",
    name = "SetDefaultFilters",
    category = "general",
    subcategory = "c_toyboxinfo",
    funcPath = "C_ToyBoxInfo.SetDefaultFilters",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

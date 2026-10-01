-- Generated APIDefinitions for namespace: C_NewItems
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_NewItems.ClearAll"] = {
    key = "C_NewItems.ClearAll",
    name = "ClearAll",
    category = "item",
    subcategory = "c_newitems",
    funcPath = "C_NewItems.ClearAll",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_NewItems.IsNewItem"] = {
    key = "C_NewItems.IsNewItem",
    name = "IsNewItem",
    category = "item",
    subcategory = "c_newitems",
    funcPath = "C_NewItems.IsNewItem",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "isNew", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NewItems.RemoveNewItem"] = {
    key = "C_NewItems.RemoveNewItem",
    name = "RemoveNewItem",
    category = "item",
    subcategory = "c_newitems",
    funcPath = "C_NewItems.RemoveNewItem",
    params = { { name = "containerIndex", type = "BagIndex", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

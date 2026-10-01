-- Generated APIDefinitions for namespace: C_DyeColor
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_DyeColor.GetAllDyeColorCategories"] = {
    key = "C_DyeColor.GetAllDyeColorCategories",
    name = "GetAllDyeColorCategories",
    category = "general",
    subcategory = "c_dyecolor",
    funcPath = "C_DyeColor.GetAllDyeColorCategories",
    params = {  },
    returns = { { name = "dyeColorCategoryIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_DyeColor.GetAllDyeColors"] = {
    key = "C_DyeColor.GetAllDyeColors",
    name = "GetAllDyeColors",
    category = "general",
    subcategory = "c_dyecolor",
    funcPath = "C_DyeColor.GetAllDyeColors",
    params = { { name = "ownedColorsOnly", type = "bool", default = false } },
    returns = { { name = "dyeColorIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DyeColor.GetDyeColorCategoryInfo"] = {
    key = "C_DyeColor.GetDyeColorCategoryInfo",
    name = "GetDyeColorCategoryInfo",
    category = "general",
    subcategory = "c_dyecolor",
    funcPath = "C_DyeColor.GetDyeColorCategoryInfo",
    params = { { name = "dyeColorCategoryID", type = "number", default = nil } },
    returns = { { name = "dyeColorCategoryInfo", type = "DyeColorCategoryDisplayInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DyeColor.GetDyeColorForItem"] = {
    key = "C_DyeColor.GetDyeColorForItem",
    name = "GetDyeColorForItem",
    category = "general",
    subcategory = "c_dyecolor",
    funcPath = "C_DyeColor.GetDyeColorForItem",
    params = { { name = "itemLinkOrID", type = "ItemInfo", default = nil } },
    returns = { { name = "dyeColorID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DyeColor.GetDyeColorForItemLocation"] = {
    key = "C_DyeColor.GetDyeColorForItemLocation",
    name = "GetDyeColorForItemLocation",
    category = "general",
    subcategory = "c_dyecolor",
    funcPath = "C_DyeColor.GetDyeColorForItemLocation",
    params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
    returns = { { name = "dyeColorID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DyeColor.GetDyeColorInfo"] = {
    key = "C_DyeColor.GetDyeColorInfo",
    name = "GetDyeColorInfo",
    category = "general",
    subcategory = "c_dyecolor",
    funcPath = "C_DyeColor.GetDyeColorInfo",
    params = { { name = "dyeColorID", type = "number", default = nil } },
    returns = { { name = "dyeColorInfo", type = "DyeColorDisplayInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DyeColor.GetDyeColorsInCategory"] = {
    key = "C_DyeColor.GetDyeColorsInCategory",
    name = "GetDyeColorsInCategory",
    category = "general",
    subcategory = "c_dyecolor",
    funcPath = "C_DyeColor.GetDyeColorsInCategory",
    params = { { name = "dyeColorCategory", type = "number", default = nil }, { name = "ownedColorsOnly", type = "bool", default = false } },
    returns = { { name = "dyeColorIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DyeColor.IsDyeColorOwned"] = {
    key = "C_DyeColor.IsDyeColorOwned",
    name = "IsDyeColorOwned",
    category = "general",
    subcategory = "c_dyecolor",
    funcPath = "C_DyeColor.IsDyeColorOwned",
    params = { { name = "dyeColorID", type = "number", default = nil } },
    returns = { { name = "isOwned", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

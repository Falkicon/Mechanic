-- Generated APIDefinitions for namespace: C_DyeColor
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_DyeColor.GetAllDyeColors"] = {
	key = "C_DyeColor.GetAllDyeColors",
	name = "GetAllDyeColors",
	category = "combat_midnight",
	subcategory = "c_dyecolor",
	func = _G["C_DyeColor"] and _G["C_DyeColor"]["GetAllDyeColors"],
	funcPath = "C_DyeColor.GetAllDyeColors",
	params = { { name = "ownedColorsOnly", type = "bool", default = false } },
	returns = { { name = "dyeColorIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DyeColor.GetDyeColorCategoryInfo"] = {
	key = "C_DyeColor.GetDyeColorCategoryInfo",
	name = "GetDyeColorCategoryInfo",
	category = "combat_midnight",
	subcategory = "c_dyecolor",
	func = _G["C_DyeColor"] and _G["C_DyeColor"]["GetDyeColorCategoryInfo"],
	funcPath = "C_DyeColor.GetDyeColorCategoryInfo",
	params = { { name = "dyeColorCategoryID", type = "number", default = nil } },
	returns = { { name = "dyeColorCategoryInfo", type = "DyeColorCategoryDisplayInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DyeColor.GetDyeColorForItem"] = {
	key = "C_DyeColor.GetDyeColorForItem",
	name = "GetDyeColorForItem",
	category = "combat_midnight",
	subcategory = "c_dyecolor",
	func = _G["C_DyeColor"] and _G["C_DyeColor"]["GetDyeColorForItem"],
	funcPath = "C_DyeColor.GetDyeColorForItem",
	params = { { name = "itemLinkOrID", type = "ItemInfo", default = nil } },
	returns = { { name = "dyeColorID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DyeColor.GetDyeColorForItemLocation"] = {
	key = "C_DyeColor.GetDyeColorForItemLocation",
	name = "GetDyeColorForItemLocation",
	category = "combat_midnight",
	subcategory = "c_dyecolor",
	func = _G["C_DyeColor"] and _G["C_DyeColor"]["GetDyeColorForItemLocation"],
	funcPath = "C_DyeColor.GetDyeColorForItemLocation",
	params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
	returns = { { name = "dyeColorID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DyeColor.GetDyeColorInfo"] = {
	key = "C_DyeColor.GetDyeColorInfo",
	name = "GetDyeColorInfo",
	category = "combat_midnight",
	subcategory = "c_dyecolor",
	func = _G["C_DyeColor"] and _G["C_DyeColor"]["GetDyeColorInfo"],
	funcPath = "C_DyeColor.GetDyeColorInfo",
	params = { { name = "dyeColorID", type = "number", default = nil } },
	returns = { { name = "dyeColorInfo", type = "DyeColorDisplayInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DyeColor.GetDyeColorsInCategory"] = {
	key = "C_DyeColor.GetDyeColorsInCategory",
	name = "GetDyeColorsInCategory",
	category = "combat_midnight",
	subcategory = "c_dyecolor",
	func = _G["C_DyeColor"] and _G["C_DyeColor"]["GetDyeColorsInCategory"],
	funcPath = "C_DyeColor.GetDyeColorsInCategory",
	params = {
		{ name = "dyeColorCategory", type = "number", default = nil },
		{ name = "ownedColorsOnly", type = "bool", default = false },
	},
	returns = { { name = "dyeColorIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DyeColor.IsDyeColorOwned"] = {
	key = "C_DyeColor.IsDyeColorOwned",
	name = "IsDyeColorOwned",
	category = "combat_midnight",
	subcategory = "c_dyecolor",
	func = _G["C_DyeColor"] and _G["C_DyeColor"]["IsDyeColorOwned"],
	funcPath = "C_DyeColor.IsDyeColorOwned",
	params = { { name = "dyeColorID", type = "number", default = nil } },
	returns = { { name = "isOwned", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

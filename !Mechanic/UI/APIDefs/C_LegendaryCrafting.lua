-- Generated APIDefinitions for namespace: C_LegendaryCrafting
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LegendaryCrafting.CraftRuneforgeLegendary"] = {
	key = "C_LegendaryCrafting.CraftRuneforgeLegendary",
	name = "CraftRuneforgeLegendary",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["CraftRuneforgeLegendary"],
	funcPath = "C_LegendaryCrafting.CraftRuneforgeLegendary",
	params = { { name = "description", type = "RuneforgeLegendaryCraftDescription", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LegendaryCrafting.GetRuneforgeItemPreviewInfo"] = {
	key = "C_LegendaryCrafting.GetRuneforgeItemPreviewInfo",
	name = "GetRuneforgeItemPreviewInfo",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["GetRuneforgeItemPreviewInfo"],
	funcPath = "C_LegendaryCrafting.GetRuneforgeItemPreviewInfo",
	params = {
		{ name = "baseItem", type = "ItemLocation", default = nil },
		{ name = "runeforgePowerID", type = "number", default = nil },
		{ name = "modifiers", type = "table", default = nil },
	},
	returns = { { name = "info", type = "RuneforgeItemPreviewInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LegendaryCrafting.GetRuneforgeLegendaryComponentInfo"] = {
	key = "C_LegendaryCrafting.GetRuneforgeLegendaryComponentInfo",
	name = "GetRuneforgeLegendaryComponentInfo",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["GetRuneforgeLegendaryComponentInfo"],
	funcPath = "C_LegendaryCrafting.GetRuneforgeLegendaryComponentInfo",
	params = { { name = "runeforgeLegendary", type = "ItemLocation", default = nil } },
	returns = { { name = "componentInfo", type = "RuneforgeLegendaryComponentInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LegendaryCrafting.GetRuneforgeLegendaryCost"] = {
	key = "C_LegendaryCrafting.GetRuneforgeLegendaryCost",
	name = "GetRuneforgeLegendaryCost",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["GetRuneforgeLegendaryCost"],
	funcPath = "C_LegendaryCrafting.GetRuneforgeLegendaryCost",
	params = { { name = "baseItem", type = "ItemLocation", default = nil } },
	returns = { { name = "cost", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LegendaryCrafting.GetRuneforgeLegendaryUpgradeCost"] = {
	key = "C_LegendaryCrafting.GetRuneforgeLegendaryUpgradeCost",
	name = "GetRuneforgeLegendaryUpgradeCost",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["GetRuneforgeLegendaryUpgradeCost"],
	funcPath = "C_LegendaryCrafting.GetRuneforgeLegendaryUpgradeCost",
	params = {
		{ name = "runeforgeLegendary", type = "ItemLocation", default = nil },
		{ name = "upgradeItem", type = "ItemLocation", default = nil },
	},
	returns = { { name = "cost", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LegendaryCrafting.GetRuneforgeModifierInfo"] = {
	key = "C_LegendaryCrafting.GetRuneforgeModifierInfo",
	name = "GetRuneforgeModifierInfo",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["GetRuneforgeModifierInfo"],
	funcPath = "C_LegendaryCrafting.GetRuneforgeModifierInfo",
	params = {
		{ name = "baseItem", type = "ItemLocation", default = nil },
		{ name = "powerID", type = "number", default = nil },
		{ name = "addedModifierIndex", type = "luaIndex", default = nil },
		{ name = "modifiers", type = "table", default = nil },
	},
	returns = {
		{ name = "name", type = "string", canBeSecret = false },
		{ name = "description", type = "table", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LegendaryCrafting.GetRuneforgePowerInfo"] = {
	key = "C_LegendaryCrafting.GetRuneforgePowerInfo",
	name = "GetRuneforgePowerInfo",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["GetRuneforgePowerInfo"],
	funcPath = "C_LegendaryCrafting.GetRuneforgePowerInfo",
	params = { { name = "runeforgePowerID", type = "number", default = nil } },
	returns = { { name = "power", type = "RuneforgePower", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LegendaryCrafting.GetRuneforgePowerSlots"] = {
	key = "C_LegendaryCrafting.GetRuneforgePowerSlots",
	name = "GetRuneforgePowerSlots",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["GetRuneforgePowerSlots"],
	funcPath = "C_LegendaryCrafting.GetRuneforgePowerSlots",
	params = { { name = "runeforgePowerID", type = "number", default = nil } },
	returns = { { name = "slotNames", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LegendaryCrafting.GetRuneforgePowers"] = {
	key = "C_LegendaryCrafting.GetRuneforgePowers",
	name = "GetRuneforgePowers",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["GetRuneforgePowers"],
	funcPath = "C_LegendaryCrafting.GetRuneforgePowers",
	params = {
		{ name = "baseItem", type = "ItemLocation", default = nil },
		{ name = "filter", type = "RuneforgePowerFilter", default = nil },
	},
	returns = {
		{ name = "primaryRuneforgePowerIDs", type = "table", canBeSecret = false },
		{ name = "otherRuneforgePowerIDs", type = "table", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LegendaryCrafting.GetRuneforgePowersByClassSpecAndCovenant"] = {
	key = "C_LegendaryCrafting.GetRuneforgePowersByClassSpecAndCovenant",
	name = "GetRuneforgePowersByClassSpecAndCovenant",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["GetRuneforgePowersByClassSpecAndCovenant"],
	funcPath = "C_LegendaryCrafting.GetRuneforgePowersByClassSpecAndCovenant",
	params = {
		{ name = "classID", type = "number", default = nil },
		{ name = "specID", type = "number", default = nil },
		{ name = "covenantID", type = "number", default = nil },
		{ name = "filter", type = "RuneforgePowerFilter", default = nil },
	},
	returns = { { name = "runeforgePowerIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LegendaryCrafting.IsRuneforgeLegendary"] = {
	key = "C_LegendaryCrafting.IsRuneforgeLegendary",
	name = "IsRuneforgeLegendary",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["IsRuneforgeLegendary"],
	funcPath = "C_LegendaryCrafting.IsRuneforgeLegendary",
	params = { { name = "item", type = "ItemLocation", default = nil } },
	returns = { { name = "isRuneforgeLegendary", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LegendaryCrafting.IsRuneforgeLegendaryMaxLevel"] = {
	key = "C_LegendaryCrafting.IsRuneforgeLegendaryMaxLevel",
	name = "IsRuneforgeLegendaryMaxLevel",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["IsRuneforgeLegendaryMaxLevel"],
	funcPath = "C_LegendaryCrafting.IsRuneforgeLegendaryMaxLevel",
	params = { { name = "runeforgeLegendary", type = "ItemLocation", default = nil } },
	returns = { { name = "isMaxLevel", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LegendaryCrafting.IsUpgradeItemValidForRuneforgeLegendary"] = {
	key = "C_LegendaryCrafting.IsUpgradeItemValidForRuneforgeLegendary",
	name = "IsUpgradeItemValidForRuneforgeLegendary",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["IsUpgradeItemValidForRuneforgeLegendary"],
	funcPath = "C_LegendaryCrafting.IsUpgradeItemValidForRuneforgeLegendary",
	params = {
		{ name = "runeforgeLegendary", type = "ItemLocation", default = nil },
		{ name = "upgradeItem", type = "ItemLocation", default = nil },
	},
	returns = { { name = "isValid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LegendaryCrafting.IsValidRuneforgeBaseItem"] = {
	key = "C_LegendaryCrafting.IsValidRuneforgeBaseItem",
	name = "IsValidRuneforgeBaseItem",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["IsValidRuneforgeBaseItem"],
	funcPath = "C_LegendaryCrafting.IsValidRuneforgeBaseItem",
	params = { { name = "baseItem", type = "ItemLocation", default = nil } },
	returns = { { name = "isValid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LegendaryCrafting.MakeRuneforgeCraftDescription"] = {
	key = "C_LegendaryCrafting.MakeRuneforgeCraftDescription",
	name = "MakeRuneforgeCraftDescription",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["MakeRuneforgeCraftDescription"],
	funcPath = "C_LegendaryCrafting.MakeRuneforgeCraftDescription",
	params = {
		{ name = "baseItem", type = "ItemLocation", default = nil },
		{ name = "runeforgePowerID", type = "number", default = nil },
		{ name = "modifiers", type = "table", default = nil },
	},
	returns = { { name = "description", type = "RuneforgeLegendaryCraftDescription", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LegendaryCrafting.UpgradeRuneforgeLegendary"] = {
	key = "C_LegendaryCrafting.UpgradeRuneforgeLegendary",
	name = "UpgradeRuneforgeLegendary",
	category = "combat_midnight",
	subcategory = "c_legendarycrafting",
	func = _G["C_LegendaryCrafting"] and _G["C_LegendaryCrafting"]["UpgradeRuneforgeLegendary"],
	funcPath = "C_LegendaryCrafting.UpgradeRuneforgeLegendary",
	params = {
		{ name = "runeforgeLegendary", type = "ItemLocation", default = nil },
		{ name = "upgradeItem", type = "ItemLocation", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

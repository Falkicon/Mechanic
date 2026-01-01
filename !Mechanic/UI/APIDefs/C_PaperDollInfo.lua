-- Generated APIDefinitions for namespace: C_PaperDollInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PaperDollInfo.CanCursorCanGoInSlot"] = {
	key = "C_PaperDollInfo.CanCursorCanGoInSlot",
	name = "CanCursorCanGoInSlot",
	category = "combat_midnight",
	subcategory = "c_paperdollinfo",
	func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["CanCursorCanGoInSlot"],
	funcPath = "C_PaperDollInfo.CanCursorCanGoInSlot",
	params = { { name = "slotIndex", type = "luaIndex", default = nil } },
	returns = { { name = "canOccupySlot", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PaperDollInfo.GetArmorEffectiveness"] = {
	key = "C_PaperDollInfo.GetArmorEffectiveness",
	name = "GetArmorEffectiveness",
	category = "combat_midnight",
	subcategory = "c_paperdollinfo",
	func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetArmorEffectiveness"],
	funcPath = "C_PaperDollInfo.GetArmorEffectiveness",
	params = {
		{
			name = "armor",
			type = "number",
			default = nil,
			examples = {
				{ value = "effectiveArmor", label = "Narcissus" },
				{ value = "shieldBlockArmor", label = "Narcissus" },
			},
		},
		{ name = "attackerLevel", type = "number", default = nil },
	},
	returns = { { name = "effectiveness", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PaperDollInfo.GetArmorEffectivenessAgainstTarget"] = {
	key = "C_PaperDollInfo.GetArmorEffectivenessAgainstTarget",
	name = "GetArmorEffectivenessAgainstTarget",
	category = "combat_midnight",
	subcategory = "c_paperdollinfo",
	func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetArmorEffectivenessAgainstTarget"],
	funcPath = "C_PaperDollInfo.GetArmorEffectivenessAgainstTarget",
	params = { { name = "armor", type = "number", default = nil } },
	returns = { { name = "effectiveness", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PaperDollInfo.GetInspectAzeriteItemEmpoweredChoices"] = {
	key = "C_PaperDollInfo.GetInspectAzeriteItemEmpoweredChoices",
	name = "GetInspectAzeriteItemEmpoweredChoices",
	category = "combat_midnight",
	subcategory = "c_paperdollinfo",
	func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetInspectAzeriteItemEmpoweredChoices"],
	funcPath = "C_PaperDollInfo.GetInspectAzeriteItemEmpoweredChoices",
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "equipmentSlotIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "azeritePowerIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PaperDollInfo.GetInspectGuildInfo"] = {
	key = "C_PaperDollInfo.GetInspectGuildInfo",
	name = "GetInspectGuildInfo",
	category = "combat_midnight",
	subcategory = "c_paperdollinfo",
	func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetInspectGuildInfo"],
	funcPath = "C_PaperDollInfo.GetInspectGuildInfo",
	params = { { name = "unitString", type = "string", default = nil } },
	returns = {
		{ name = "achievementPoints", type = "number", canBeSecret = false },
		{ name = "numMembers", type = "number", canBeSecret = false },
		{ name = "guildName", type = "string", canBeSecret = false },
		{ name = "realmName", type = "string", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PaperDollInfo.GetInspectItemLevel"] = {
	key = "C_PaperDollInfo.GetInspectItemLevel",
	name = "GetInspectItemLevel",
	category = "combat_midnight",
	subcategory = "c_paperdollinfo",
	func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetInspectItemLevel"],
	funcPath = "C_PaperDollInfo.GetInspectItemLevel",
	params = { { name = "unit", type = "UnitToken", default = "player" } },
	returns = { { name = "equippedItemLevel", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PaperDollInfo.GetStaggerPercentage"] = {
	key = "C_PaperDollInfo.GetStaggerPercentage",
	name = "GetStaggerPercentage",
	category = "combat_midnight",
	subcategory = "c_paperdollinfo",
	func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["GetStaggerPercentage"],
	funcPath = "C_PaperDollInfo.GetStaggerPercentage",
	params = { { name = "unit", type = "UnitToken", default = "player" } },
	returns = {
		{ name = "stagger", type = "number", canBeSecret = false },
		{ name = "staggerAgainstTarget", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PaperDollInfo.IsInventorySlotEnabled"] = {
	key = "C_PaperDollInfo.IsInventorySlotEnabled",
	name = "IsInventorySlotEnabled",
	category = "combat_midnight",
	subcategory = "c_paperdollinfo",
	func = _G["C_PaperDollInfo"] and _G["C_PaperDollInfo"]["IsInventorySlotEnabled"],
	funcPath = "C_PaperDollInfo.IsInventorySlotEnabled",
	params = { { name = "slotName", type = "stringView", default = nil } },
	returns = { { name = "isEnabled", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

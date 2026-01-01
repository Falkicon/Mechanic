-- Generated APIDefinitions for namespace: C_PetInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PetInfo.GetPetTamersForMap"] = {
	key = "C_PetInfo.GetPetTamersForMap",
	name = "GetPetTamersForMap",
	category = "combat_midnight",
	subcategory = "c_petinfo",
	func = _G["C_PetInfo"] and _G["C_PetInfo"]["GetPetTamersForMap"],
	funcPath = "C_PetInfo.GetPetTamersForMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "petTamers", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetInfo.GetSpellForPetAction"] = {
	key = "C_PetInfo.GetSpellForPetAction",
	name = "GetSpellForPetAction",
	category = "combat_midnight",
	subcategory = "c_petinfo",
	func = _G["C_PetInfo"] and _G["C_PetInfo"]["GetSpellForPetAction"],
	funcPath = "C_PetInfo.GetSpellForPetAction",
	params = { { name = "actionID", type = "number", default = nil } },
	returns = { { name = "spellID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetInfo.IsPetActionPassive"] = {
	key = "C_PetInfo.IsPetActionPassive",
	name = "IsPetActionPassive",
	category = "combat_midnight",
	subcategory = "c_petinfo",
	func = _G["C_PetInfo"] and _G["C_PetInfo"]["IsPetActionPassive"],
	funcPath = "C_PetInfo.IsPetActionPassive",
	params = { { name = "actionID", type = "number", default = nil } },
	returns = { { name = "isPassive", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetInfo.PetAbandon"] = {
	key = "C_PetInfo.PetAbandon",
	name = "PetAbandon",
	category = "combat_midnight",
	subcategory = "c_petinfo",
	func = _G["C_PetInfo"] and _G["C_PetInfo"]["PetAbandon"],
	funcPath = "C_PetInfo.PetAbandon",
	params = { { name = "petNumber", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetInfo.PetRename"] = {
	key = "C_PetInfo.PetRename",
	name = "PetRename",
	category = "combat_midnight",
	subcategory = "c_petinfo",
	func = _G["C_PetInfo"] and _G["C_PetInfo"]["PetRename"],
	funcPath = "C_PetInfo.PetRename",
	params = {
		{ name = "name", type = "cstring", default = nil },
		{ name = "petNumber", type = "number", default = nil },
		{ name = "declensions", type = "table", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

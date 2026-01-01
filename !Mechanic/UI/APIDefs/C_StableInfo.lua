-- Generated APIDefinitions for namespace: C_StableInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_StableInfo.GetStablePetFoodTypes"] = {
	key = "C_StableInfo.GetStablePetFoodTypes",
	name = "GetStablePetFoodTypes",
	category = "combat_midnight",
	subcategory = "c_stableinfo",
	func = _G["C_StableInfo"] and _G["C_StableInfo"]["GetStablePetFoodTypes"],
	funcPath = "C_StableInfo.GetStablePetFoodTypes",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "foodTypes", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_StableInfo.GetStablePetInfo"] = {
	key = "C_StableInfo.GetStablePetInfo",
	name = "GetStablePetInfo",
	category = "combat_midnight",
	subcategory = "c_stableinfo",
	func = _G["C_StableInfo"] and _G["C_StableInfo"]["GetStablePetInfo"],
	funcPath = "C_StableInfo.GetStablePetInfo",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "petInfo", type = "PetInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_StableInfo.IsPetFavorite"] = {
	key = "C_StableInfo.IsPetFavorite",
	name = "IsPetFavorite",
	category = "combat_midnight",
	subcategory = "c_stableinfo",
	func = _G["C_StableInfo"] and _G["C_StableInfo"]["IsPetFavorite"],
	funcPath = "C_StableInfo.IsPetFavorite",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = { { name = "isFavorite", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_StableInfo.PickupStablePet"] = {
	key = "C_StableInfo.PickupStablePet",
	name = "PickupStablePet",
	category = "combat_midnight",
	subcategory = "c_stableinfo",
	func = _G["C_StableInfo"] and _G["C_StableInfo"]["PickupStablePet"],
	funcPath = "C_StableInfo.PickupStablePet",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_StableInfo.SetPetFavorite"] = {
	key = "C_StableInfo.SetPetFavorite",
	name = "SetPetFavorite",
	category = "combat_midnight",
	subcategory = "c_stableinfo",
	func = _G["C_StableInfo"] and _G["C_StableInfo"]["SetPetFavorite"],
	funcPath = "C_StableInfo.SetPetFavorite",
	params = {
		{ name = "slot", type = "luaIndex", default = nil },
		{ name = "isFavorite", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_StableInfo.SetPetSlot"] = {
	key = "C_StableInfo.SetPetSlot",
	name = "SetPetSlot",
	category = "combat_midnight",
	subcategory = "c_stableinfo",
	func = _G["C_StableInfo"] and _G["C_StableInfo"]["SetPetSlot"],
	funcPath = "C_StableInfo.SetPetSlot",
	params = {
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "slot", type = "luaIndex", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_PetBattles
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PetBattles.GetBreedQuality"] = {
	key = "C_PetBattles.GetBreedQuality",
	name = "GetBreedQuality",
	category = "combat_midnight",
	subcategory = "c_petbattles",
	func = _G["C_PetBattles"] and _G["C_PetBattles"]["GetBreedQuality"],
	funcPath = "C_PetBattles.GetBreedQuality",
	params = {
		{ name = "petOwner", type = "BattlePetOwner", default = nil },
		{ name = "slot", type = "number", default = nil },
	},
	returns = { { name = "quality", type = "BattlePetBreedQuality", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetBattles.GetIcon"] = {
	key = "C_PetBattles.GetIcon",
	name = "GetIcon",
	category = "combat_midnight",
	subcategory = "c_petbattles",
	func = _G["C_PetBattles"] and _G["C_PetBattles"]["GetIcon"],
	funcPath = "C_PetBattles.GetIcon",
	params = {
		{
			name = "petOwner",
			type = "BattlePetOwner",
			default = nil,
			examples = { { value = "unit", label = "BigWigs_NerubarPalace" } },
		},
		{ name = "slot", type = "number", default = nil },
	},
	returns = { { name = "iconFileID", type = "fileID", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetBattles.GetName"] = {
	key = "C_PetBattles.GetName",
	name = "GetName",
	category = "combat_midnight",
	subcategory = "c_petbattles",
	func = _G["C_PetBattles"] and _G["C_PetBattles"]["GetName"],
	funcPath = "C_PetBattles.GetName",
	params = {
		{
			name = "petOwner",
			type = "BattlePetOwner",
			default = nil,
			examples = { { value = "id", label = "Narcissus" } },
		},
		{ name = "slot", type = "number", default = nil },
	},
	returns = {
		{ name = "customName", type = "string", canBeSecret = false },
		{ name = "speciesName", type = "string", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

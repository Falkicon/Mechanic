-- Generated APIDefinitions for namespace: C_PetJournal
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PetJournal.DismissSummonedPet"] = {
	key = "C_PetJournal.DismissSummonedPet",
	name = "DismissSummonedPet",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["DismissSummonedPet"],
	funcPath = "C_PetJournal.DismissSummonedPet",
	params = { { name = "petID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetDisplayIDByIndex"] = {
	key = "C_PetJournal.GetDisplayIDByIndex",
	name = "GetDisplayIDByIndex",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["GetDisplayIDByIndex"],
	funcPath = "C_PetJournal.GetDisplayIDByIndex",
	params = {
		{ name = "speciesID", type = "number", default = nil },
		{ name = "index", type = "luaIndex", default = nil },
	},
	returns = { { name = "displayID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetDisplayProbabilityByIndex"] = {
	key = "C_PetJournal.GetDisplayProbabilityByIndex",
	name = "GetDisplayProbabilityByIndex",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["GetDisplayProbabilityByIndex"],
	funcPath = "C_PetJournal.GetDisplayProbabilityByIndex",
	params = {
		{ name = "speciesID", type = "number", default = nil },
		{ name = "index", type = "luaIndex", default = nil },
	},
	returns = { { name = "displayProbability", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetNonBattlePetLinkByIndex"] = {
	key = "C_PetJournal.GetNonBattlePetLinkByIndex",
	name = "GetNonBattlePetLinkByIndex",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["GetNonBattlePetLinkByIndex"],
	funcPath = "C_PetJournal.GetNonBattlePetLinkByIndex",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "link", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetNumDisplays"] = {
	key = "C_PetJournal.GetNumDisplays",
	name = "GetNumDisplays",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["GetNumDisplays"],
	funcPath = "C_PetJournal.GetNumDisplays",
	params = { { name = "speciesID", type = "number", default = nil } },
	returns = { { name = "numDisplays", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetNumPetsInJournal"] = {
	key = "C_PetJournal.GetNumPetsInJournal",
	name = "GetNumPetsInJournal",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["GetNumPetsInJournal"],
	funcPath = "C_PetJournal.GetNumPetsInJournal",
	params = { { name = "creatureID", type = "number", default = nil } },
	returns = {
		{ name = "maxAllowed", type = "number", canBeSecret = false },
		{ name = "numPets", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetPetAbilityInfo"] = {
	key = "C_PetJournal.GetPetAbilityInfo",
	name = "GetPetAbilityInfo",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["GetPetAbilityInfo"],
	funcPath = "C_PetJournal.GetPetAbilityInfo",
	params = { { name = "abilityID", type = "number", default = nil } },
	returns = {
		{ name = "name", type = "string", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
		{ name = "petType", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetPetAbilityListTable"] = {
	key = "C_PetJournal.GetPetAbilityListTable",
	name = "GetPetAbilityListTable",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["GetPetAbilityListTable"],
	funcPath = "C_PetJournal.GetPetAbilityListTable",
	params = { { name = "speciesID", type = "number", default = nil } },
	returns = { { name = "info", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetPetInfoTableByPetID"] = {
	key = "C_PetJournal.GetPetInfoTableByPetID",
	name = "GetPetInfoTableByPetID",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["GetPetInfoTableByPetID"],
	funcPath = "C_PetJournal.GetPetInfoTableByPetID",
	params = { { name = "petID", type = "WOWGUID", default = nil } },
	returns = { { name = "info", type = "PetJournalPetInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetPetLoadOutInfo"] = {
	key = "C_PetJournal.GetPetLoadOutInfo",
	name = "GetPetLoadOutInfo",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["GetPetLoadOutInfo"],
	funcPath = "C_PetJournal.GetPetLoadOutInfo",
	params = {
		{
			name = "slot",
			type = "luaIndex",
			default = nil,
			examples = {
				{ value = 1, label = "Leatrix_Plus" },
				{ value = 2, label = "Leatrix_Plus" },
				{ value = 3, label = "Leatrix_Plus" },
			},
		},
	},
	returns = {
		{ name = "petID", type = "WOWGUID", canBeSecret = false },
		{ name = "ability1ID", type = "number", canBeSecret = false },
		{ name = "ability2ID", type = "number", canBeSecret = false },
		{ name = "ability3ID", type = "number", canBeSecret = false },
		{ name = "locked", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetPetSummonInfo"] = {
	key = "C_PetJournal.GetPetSummonInfo",
	name = "GetPetSummonInfo",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["GetPetSummonInfo"],
	funcPath = "C_PetJournal.GetPetSummonInfo",
	params = { { name = "battlePetGUID", type = "WOWGUID", default = nil } },
	returns = {
		{ name = "isSummonable", type = "bool", canBeSecret = false },
		{ name = "error", type = "PetJournalError", canBeSecret = false },
		{ name = "errorText", type = "cstring", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.IsCurrentlySummoned"] = {
	key = "C_PetJournal.IsCurrentlySummoned",
	name = "IsCurrentlySummoned",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["IsCurrentlySummoned"],
	funcPath = "C_PetJournal.IsCurrentlySummoned",
	params = { { name = "petID", type = "WOWGUID", default = nil } },
	returns = { { name = "isSummoned", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.PetIsSummonable"] = {
	key = "C_PetJournal.PetIsSummonable",
	name = "PetIsSummonable",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["PetIsSummonable"],
	funcPath = "C_PetJournal.PetIsSummonable",
	params = { { name = "battlePetGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "isSummonable", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.PetUsesRandomDisplay"] = {
	key = "C_PetJournal.PetUsesRandomDisplay",
	name = "PetUsesRandomDisplay",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["PetUsesRandomDisplay"],
	funcPath = "C_PetJournal.PetUsesRandomDisplay",
	params = { { name = "speciesID", type = "number", default = nil } },
	returns = { { name = "usesRandomDisplay", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.SetHoveredBattlePet"] = {
	key = "C_PetJournal.SetHoveredBattlePet",
	name = "SetHoveredBattlePet",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["SetHoveredBattlePet"],
	funcPath = "C_PetJournal.SetHoveredBattlePet",
	params = { { name = "battlePetGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.SetSearchFilter"] = {
	key = "C_PetJournal.SetSearchFilter",
	name = "SetSearchFilter",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["SetSearchFilter"],
	funcPath = "C_PetJournal.SetSearchFilter",
	params = {
		{
			name = "filterText",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "self", label = "AllTheThings" },
				{ value = "self", label = "AllTheThings" },
				{ value = "self", label = "AllTheThings" },
			},
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.SpellTargetBattlePet"] = {
	key = "C_PetJournal.SpellTargetBattlePet",
	name = "SpellTargetBattlePet",
	category = "combat_midnight",
	subcategory = "c_petjournal",
	func = _G["C_PetJournal"] and _G["C_PetJournal"]["SpellTargetBattlePet"],
	funcPath = "C_PetJournal.SpellTargetBattlePet",
	params = { { name = "battlePetGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

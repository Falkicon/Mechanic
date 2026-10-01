-- Generated APIDefinitions for namespace: C_PetJournal
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PetJournal.ClearHoveredBattlePet"] = {
    key = "C_PetJournal.ClearHoveredBattlePet",
    name = "ClearHoveredBattlePet",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.ClearHoveredBattlePet",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PetJournal.ClearSearchFilter"] = {
    key = "C_PetJournal.ClearSearchFilter",
    name = "ClearSearchFilter",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.ClearSearchFilter",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PetJournal.DismissSummonedPet"] = {
    key = "C_PetJournal.DismissSummonedPet",
    name = "DismissSummonedPet",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.DismissSummonedPet",
    params = { { name = "petID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetDisplayIDByIndex"] = {
    key = "C_PetJournal.GetDisplayIDByIndex",
    name = "GetDisplayIDByIndex",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.GetDisplayIDByIndex",
    params = { { name = "speciesID", type = "number", default = nil }, { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "displayID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetDisplayProbabilityByIndex"] = {
    key = "C_PetJournal.GetDisplayProbabilityByIndex",
    name = "GetDisplayProbabilityByIndex",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.GetDisplayProbabilityByIndex",
    params = { { name = "speciesID", type = "number", default = nil }, { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "displayProbability", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetNonBattlePetLinkByIndex"] = {
    key = "C_PetJournal.GetNonBattlePetLinkByIndex",
    name = "GetNonBattlePetLinkByIndex",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.GetNonBattlePetLinkByIndex",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "link", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetNumDisplays"] = {
    key = "C_PetJournal.GetNumDisplays",
    name = "GetNumDisplays",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.GetNumDisplays",
    params = { { name = "speciesID", type = "number", default = nil } },
    returns = { { name = "numDisplays", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetNumPetsInJournal"] = {
    key = "C_PetJournal.GetNumPetsInJournal",
    name = "GetNumPetsInJournal",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.GetNumPetsInJournal",
    params = { { name = "creatureID", type = "number", default = nil } },
    returns = { { name = "maxAllowed", type = "number", canBeSecret = false }, { name = "numPets", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetOwnedPetIDs"] = {
    key = "C_PetJournal.GetOwnedPetIDs",
    name = "GetOwnedPetIDs",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.GetOwnedPetIDs",
    params = {  },
    returns = { { name = "ownedPetIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PetJournal.GetPetAbilityInfo"] = {
    key = "C_PetJournal.GetPetAbilityInfo",
    name = "GetPetAbilityInfo",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.GetPetAbilityInfo",
    params = { { name = "abilityID", type = "number", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false }, { name = "icon", type = "fileID", canBeSecret = false }, { name = "petType", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetPetAbilityListTable"] = {
    key = "C_PetJournal.GetPetAbilityListTable",
    name = "GetPetAbilityListTable",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.GetPetAbilityListTable",
    params = { { name = "speciesID", type = "number", default = nil } },
    returns = { { name = "info", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetPetInfoTableByPetID"] = {
    key = "C_PetJournal.GetPetInfoTableByPetID",
    name = "GetPetInfoTableByPetID",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.GetPetInfoTableByPetID",
    params = { { name = "petID", type = "WOWGUID", default = nil } },
    returns = { { name = "info", type = "PetJournalPetInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetPetLoadOutInfo"] = {
    key = "C_PetJournal.GetPetLoadOutInfo",
    name = "GetPetLoadOutInfo",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.GetPetLoadOutInfo",
    params = { { name = "slot", type = "luaIndex", default = nil } },
    returns = { { name = "petID", type = "WOWGUID", canBeSecret = false }, { name = "ability1ID", type = "number", canBeSecret = false }, { name = "ability2ID", type = "number", canBeSecret = false }, { name = "ability3ID", type = "number", canBeSecret = false }, { name = "locked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetPetSummonInfo"] = {
    key = "C_PetJournal.GetPetSummonInfo",
    name = "GetPetSummonInfo",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.GetPetSummonInfo",
    params = { { name = "battlePetGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "isSummonable", type = "bool", canBeSecret = false }, { name = "error", type = "PetJournalError", canBeSecret = false }, { name = "errorText", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.GetSearchFilter"] = {
    key = "C_PetJournal.GetSearchFilter",
    name = "GetSearchFilter",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.GetSearchFilter",
    params = {  },
    returns = { { name = "filterText", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PetJournal.HasFavoritePets"] = {
    key = "C_PetJournal.HasFavoritePets",
    name = "HasFavoritePets",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.HasFavoritePets",
    params = {  },
    returns = { { name = "hasFavorites", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PetJournal.IsCurrentlySummoned"] = {
    key = "C_PetJournal.IsCurrentlySummoned",
    name = "IsCurrentlySummoned",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.IsCurrentlySummoned",
    params = { { name = "petID", type = "WOWGUID", default = nil } },
    returns = { { name = "isSummoned", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.IsUsingDefaultFilters"] = {
    key = "C_PetJournal.IsUsingDefaultFilters",
    name = "IsUsingDefaultFilters",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.IsUsingDefaultFilters",
    params = {  },
    returns = { { name = "isUsingDefaultFilters", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PetJournal.PetIsSummonable"] = {
    key = "C_PetJournal.PetIsSummonable",
    name = "PetIsSummonable",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.PetIsSummonable",
    params = { { name = "battlePetGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "isSummonable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.PetUsesRandomDisplay"] = {
    key = "C_PetJournal.PetUsesRandomDisplay",
    name = "PetUsesRandomDisplay",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.PetUsesRandomDisplay",
    params = { { name = "speciesID", type = "number", default = nil } },
    returns = { { name = "usesRandomDisplay", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.SetDefaultFilters"] = {
    key = "C_PetJournal.SetDefaultFilters",
    name = "SetDefaultFilters",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.SetDefaultFilters",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PetJournal.SetHoveredBattlePet"] = {
    key = "C_PetJournal.SetHoveredBattlePet",
    name = "SetHoveredBattlePet",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.SetHoveredBattlePet",
    params = { { name = "battlePetGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.SetSearchFilter"] = {
    key = "C_PetJournal.SetSearchFilter",
    name = "SetSearchFilter",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.SetSearchFilter",
    params = { { name = "filterText", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetJournal.SpellTargetBattlePet"] = {
    key = "C_PetJournal.SpellTargetBattlePet",
    name = "SpellTargetBattlePet",
    category = "general",
    subcategory = "c_petjournal",
    funcPath = "C_PetJournal.SpellTargetBattlePet",
    params = { { name = "battlePetGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

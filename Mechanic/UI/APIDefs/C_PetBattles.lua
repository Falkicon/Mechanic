-- Generated APIDefinitions for namespace: C_PetBattles
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PetBattles.GetBreedQuality"] = {
    key = "C_PetBattles.GetBreedQuality",
    name = "GetBreedQuality",
    category = "general",
    subcategory = "c_petbattles",
    funcPath = "C_PetBattles.GetBreedQuality",
    params = { { name = "petOwner", type = "BattlePetOwner", default = nil }, { name = "slot", type = "number", default = nil } },
    returns = { { name = "quality", type = "BattlePetBreedQuality", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetBattles.GetIcon"] = {
    key = "C_PetBattles.GetIcon",
    name = "GetIcon",
    category = "general",
    subcategory = "c_petbattles",
    funcPath = "C_PetBattles.GetIcon",
    params = { { name = "petOwner", type = "BattlePetOwner", default = nil }, { name = "slot", type = "number", default = nil } },
    returns = { { name = "iconFileID", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetBattles.GetName"] = {
    key = "C_PetBattles.GetName",
    name = "GetName",
    category = "general",
    subcategory = "c_petbattles",
    funcPath = "C_PetBattles.GetName",
    params = { { name = "petOwner", type = "BattlePetOwner", default = nil }, { name = "slot", type = "number", default = nil } },
    returns = { { name = "customName", type = "string", canBeSecret = false }, { name = "speciesName", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetBattles.IsPlayerNPC"] = {
    key = "C_PetBattles.IsPlayerNPC",
    name = "IsPlayerNPC",
    category = "general",
    subcategory = "c_petbattles",
    funcPath = "C_PetBattles.IsPlayerNPC",
    params = {  },
    returns = { { name = "isPlayerNPC", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PetBattles.IsWildBattle"] = {
    key = "C_PetBattles.IsWildBattle",
    name = "IsWildBattle",
    category = "general",
    subcategory = "c_petbattles",
    funcPath = "C_PetBattles.IsWildBattle",
    params = {  },
    returns = { { name = "isWildBattle", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

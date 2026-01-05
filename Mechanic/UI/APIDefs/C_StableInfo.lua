-- Generated APIDefinitions for namespace: C_StableInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_StableInfo.ClosePetStables"] = {
    key = "C_StableInfo.ClosePetStables",
    name = "ClosePetStables",
    category = "general",
    subcategory = "c_stableinfo",
    func = _G["C_StableInfo"] and _G["C_StableInfo"]["ClosePetStables"],
    funcPath = "C_StableInfo.ClosePetStables",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_StableInfo.GetActivePetList"] = {
    key = "C_StableInfo.GetActivePetList",
    name = "GetActivePetList",
    category = "general",
    subcategory = "c_stableinfo",
    func = _G["C_StableInfo"] and _G["C_StableInfo"]["GetActivePetList"],
    funcPath = "C_StableInfo.GetActivePetList",
    params = {  },
    returns = { { name = "activePets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_StableInfo.GetAvailablePetSpecInfos"] = {
    key = "C_StableInfo.GetAvailablePetSpecInfos",
    name = "GetAvailablePetSpecInfos",
    category = "general",
    subcategory = "c_stableinfo",
    func = _G["C_StableInfo"] and _G["C_StableInfo"]["GetAvailablePetSpecInfos"],
    funcPath = "C_StableInfo.GetAvailablePetSpecInfos",
    params = {  },
    returns = { { name = "petSpecInfos", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_StableInfo.GetNumActivePets"] = {
    key = "C_StableInfo.GetNumActivePets",
    name = "GetNumActivePets",
    category = "general",
    subcategory = "c_stableinfo",
    func = _G["C_StableInfo"] and _G["C_StableInfo"]["GetNumActivePets"],
    funcPath = "C_StableInfo.GetNumActivePets",
    params = {  },
    returns = { { name = "numActivePets", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_StableInfo.GetNumStablePets"] = {
    key = "C_StableInfo.GetNumStablePets",
    name = "GetNumStablePets",
    category = "general",
    subcategory = "c_stableinfo",
    func = _G["C_StableInfo"] and _G["C_StableInfo"]["GetNumStablePets"],
    funcPath = "C_StableInfo.GetNumStablePets",
    params = {  },
    returns = { { name = "numStablePets", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

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

APIDefs["C_StableInfo.GetStabledPetList"] = {
    key = "C_StableInfo.GetStabledPetList",
    name = "GetStabledPetList",
    category = "general",
    subcategory = "c_stableinfo",
    func = _G["C_StableInfo"] and _G["C_StableInfo"]["GetStabledPetList"],
    funcPath = "C_StableInfo.GetStabledPetList",
    params = {  },
    returns = { { name = "stabledPets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_StableInfo.IsAtStableMaster"] = {
    key = "C_StableInfo.IsAtStableMaster",
    name = "IsAtStableMaster",
    category = "general",
    subcategory = "c_stableinfo",
    func = _G["C_StableInfo"] and _G["C_StableInfo"]["IsAtStableMaster"],
    funcPath = "C_StableInfo.IsAtStableMaster",
    params = {  },
    returns = { { name = "isAtStableMaster", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_StableInfo.IsBonusPetSlotAvailable"] = {
    key = "C_StableInfo.IsBonusPetSlotAvailable",
    name = "IsBonusPetSlotAvailable",
    category = "general",
    subcategory = "c_stableinfo",
    func = _G["C_StableInfo"] and _G["C_StableInfo"]["IsBonusPetSlotAvailable"],
    funcPath = "C_StableInfo.IsBonusPetSlotAvailable",
    params = {  },
    returns = { { name = "isAvailable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
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
    returns = {  },
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
    params = { { name = "slot", type = "luaIndex", default = nil }, { name = "isFavorite", type = "bool", default = nil } },
    returns = {  },
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
    params = { { name = "index", type = "luaIndex", default = nil }, { name = "slot", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

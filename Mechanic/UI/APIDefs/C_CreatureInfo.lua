-- Generated APIDefinitions for namespace: C_CreatureInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CreatureInfo.GetClassInfo"] = {
    key = "C_CreatureInfo.GetClassInfo",
    name = "GetClassInfo",
    category = "general",
    subcategory = "c_creatureinfo",
    funcPath = "C_CreatureInfo.GetClassInfo",
    params = { { name = "classID", type = "number", default = nil } },
    returns = { { name = "classInfo", type = "ClassInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CreatureInfo.GetCreatureFamilyIDs"] = {
    key = "C_CreatureInfo.GetCreatureFamilyIDs",
    name = "GetCreatureFamilyIDs",
    category = "general",
    subcategory = "c_creatureinfo",
    funcPath = "C_CreatureInfo.GetCreatureFamilyIDs",
    params = {  },
    returns = { { name = "creatureFamilyIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CreatureInfo.GetCreatureFamilyInfo"] = {
    key = "C_CreatureInfo.GetCreatureFamilyInfo",
    name = "GetCreatureFamilyInfo",
    category = "general",
    subcategory = "c_creatureinfo",
    funcPath = "C_CreatureInfo.GetCreatureFamilyInfo",
    params = { { name = "creatureFamilyID", type = "number", default = nil } },
    returns = { { name = "creatureFamilyInfo", type = "CreatureFamilyInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CreatureInfo.GetCreatureID"] = {
    key = "C_CreatureInfo.GetCreatureID",
    name = "GetCreatureID",
    category = "general",
    subcategory = "c_creatureinfo",
    funcPath = "C_CreatureInfo.GetCreatureID",
    params = { { name = "creatureGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "creatureID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CreatureInfo.GetCreatureTypeIDs"] = {
    key = "C_CreatureInfo.GetCreatureTypeIDs",
    name = "GetCreatureTypeIDs",
    category = "general",
    subcategory = "c_creatureinfo",
    funcPath = "C_CreatureInfo.GetCreatureTypeIDs",
    params = {  },
    returns = { { name = "creatureTypeIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CreatureInfo.GetCreatureTypeInfo"] = {
    key = "C_CreatureInfo.GetCreatureTypeInfo",
    name = "GetCreatureTypeInfo",
    category = "general",
    subcategory = "c_creatureinfo",
    funcPath = "C_CreatureInfo.GetCreatureTypeInfo",
    params = { { name = "creatureTypeID", type = "number", default = nil } },
    returns = { { name = "creatureTypeInfo", type = "CreatureTypeInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CreatureInfo.GetFactionInfo"] = {
    key = "C_CreatureInfo.GetFactionInfo",
    name = "GetFactionInfo",
    category = "general",
    subcategory = "c_creatureinfo",
    funcPath = "C_CreatureInfo.GetFactionInfo",
    params = { { name = "raceID", type = "number", default = nil } },
    returns = { { name = "factionInfo", type = "FactionInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CreatureInfo.GetRaceInfo"] = {
    key = "C_CreatureInfo.GetRaceInfo",
    name = "GetRaceInfo",
    category = "general",
    subcategory = "c_creatureinfo",
    funcPath = "C_CreatureInfo.GetRaceInfo",
    params = { { name = "raceID", type = "number", default = nil } },
    returns = { { name = "raceInfo", type = "RaceInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

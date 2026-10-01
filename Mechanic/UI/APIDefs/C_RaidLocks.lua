-- Generated APIDefinitions for namespace: C_RaidLocks
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_RaidLocks.GetRedirectedDifficultyID"] = {
    key = "C_RaidLocks.GetRedirectedDifficultyID",
    name = "GetRedirectedDifficultyID",
    category = "unit",
    subcategory = "c_raidlocks",
    funcPath = "C_RaidLocks.GetRedirectedDifficultyID",
    params = { { name = "mapID", type = "number", default = nil }, { name = "difficultyID", type = "number", default = nil } },
    returns = { { name = "redirectedDifficultyID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RaidLocks.IsEncounterComplete"] = {
    key = "C_RaidLocks.IsEncounterComplete",
    name = "IsEncounterComplete",
    category = "unit",
    subcategory = "c_raidlocks",
    funcPath = "C_RaidLocks.IsEncounterComplete",
    params = { { name = "mapID", type = "number", default = nil }, { name = "encounterID", type = "number", default = nil }, { name = "difficultyID", type = "number", default = nil } },
    returns = { { name = "encounterIsComplete", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RaidLocks.IsRaidLockExtendFeatureEnabled"] = {
    key = "C_RaidLocks.IsRaidLockExtendFeatureEnabled",
    name = "IsRaidLockExtendFeatureEnabled",
    category = "unit",
    subcategory = "c_raidlocks",
    funcPath = "C_RaidLocks.IsRaidLockExtendFeatureEnabled",
    params = {  },
    returns = { { name = "raidLockExtendFeatureEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

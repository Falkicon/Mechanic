-- Generated APIDefinitions for namespace: C_AlliedRaces
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AlliedRaces.GetAllRacialAbilitiesFromID"] = {
    key = "C_AlliedRaces.GetAllRacialAbilitiesFromID",
    name = "GetAllRacialAbilitiesFromID",
    category = "combat_midnight",
    subcategory = "c_alliedraces",
    func = _G["C_AlliedRaces"] and _G["C_AlliedRaces"]["GetAllRacialAbilitiesFromID"],
    funcPath = "C_AlliedRaces.GetAllRacialAbilitiesFromID",
    params = { { name = "raceID", type = "number", default = nil } },
    returns = { { name = "allDisplayInfo", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AlliedRaces.GetRaceInfoByID"] = {
    key = "C_AlliedRaces.GetRaceInfoByID",
    name = "GetRaceInfoByID",
    category = "combat_midnight",
    subcategory = "c_alliedraces",
    func = _G["C_AlliedRaces"] and _G["C_AlliedRaces"]["GetRaceInfoByID"],
    funcPath = "C_AlliedRaces.GetRaceInfoByID",
    params = { { name = "raceID", type = "number", default = nil } },
    returns = { { name = "info", type = "AlliedRaceInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

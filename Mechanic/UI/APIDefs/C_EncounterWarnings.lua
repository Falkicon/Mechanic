-- Generated APIDefinitions for namespace: C_EncounterWarnings
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_EncounterWarnings.GetEditModeWarningInfo"] = {
    key = "C_EncounterWarnings.GetEditModeWarningInfo",
    name = "GetEditModeWarningInfo",
    category = "general",
    subcategory = "c_encounterwarnings",
    funcPath = "C_EncounterWarnings.GetEditModeWarningInfo",
    params = { { name = "severity", type = "EncounterEventSeverity", default = nil } },
    returns = { { name = "warningInfo", type = "EncounterWarningInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterWarnings.GetSoundKitForSeverity"] = {
    key = "C_EncounterWarnings.GetSoundKitForSeverity",
    name = "GetSoundKitForSeverity",
    category = "general",
    subcategory = "c_encounterwarnings",
    funcPath = "C_EncounterWarnings.GetSoundKitForSeverity",
    params = { { name = "severity", type = "EncounterEventSeverity", default = nil } },
    returns = { { name = "soundKitID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterWarnings.IsFeatureAvailable"] = {
    key = "C_EncounterWarnings.IsFeatureAvailable",
    name = "IsFeatureAvailable",
    category = "general",
    subcategory = "c_encounterwarnings",
    funcPath = "C_EncounterWarnings.IsFeatureAvailable",
    params = {  },
    returns = { { name = "isAvailable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_EncounterWarnings.IsFeatureEnabled"] = {
    key = "C_EncounterWarnings.IsFeatureEnabled",
    name = "IsFeatureEnabled",
    category = "general",
    subcategory = "c_encounterwarnings",
    funcPath = "C_EncounterWarnings.IsFeatureEnabled",
    params = {  },
    returns = { { name = "isAvailableAndEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_EncounterWarnings.PlaySound"] = {
    key = "C_EncounterWarnings.PlaySound",
    name = "PlaySound",
    category = "general",
    subcategory = "c_encounterwarnings",
    funcPath = "C_EncounterWarnings.PlaySound",
    params = { { name = "severity", type = "EncounterEventSeverity", default = nil } },
    returns = { { name = "soundHandle", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_InstanceEncounter
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_InstanceEncounter.IsEncounterInProgress"] = {
    key = "C_InstanceEncounter.IsEncounterInProgress",
    name = "IsEncounterInProgress",
    category = "general",
    subcategory = "c_instanceencounter",
    func = _G["C_InstanceEncounter"] and _G["C_InstanceEncounter"]["IsEncounterInProgress"],
    funcPath = "C_InstanceEncounter.IsEncounterInProgress",
    params = {  },
    returns = { { name = "isInProgress", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_InstanceEncounter.IsEncounterLimitingResurrections"] = {
    key = "C_InstanceEncounter.IsEncounterLimitingResurrections",
    name = "IsEncounterLimitingResurrections",
    category = "general",
    subcategory = "c_instanceencounter",
    func = _G["C_InstanceEncounter"] and _G["C_InstanceEncounter"]["IsEncounterLimitingResurrections"],
    funcPath = "C_InstanceEncounter.IsEncounterLimitingResurrections",
    params = {  },
    returns = { { name = "isLimitingResurrections", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_InstanceEncounter.IsEncounterSuppressingRelease"] = {
    key = "C_InstanceEncounter.IsEncounterSuppressingRelease",
    name = "IsEncounterSuppressingRelease",
    category = "general",
    subcategory = "c_instanceencounter",
    func = _G["C_InstanceEncounter"] and _G["C_InstanceEncounter"]["IsEncounterSuppressingRelease"],
    funcPath = "C_InstanceEncounter.IsEncounterSuppressingRelease",
    params = {  },
    returns = { { name = "isSuppressingRelease", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_InstanceEncounter.ShouldShowTimelineForEncounter"] = {
    key = "C_InstanceEncounter.ShouldShowTimelineForEncounter",
    name = "ShouldShowTimelineForEncounter",
    category = "general",
    subcategory = "c_instanceencounter",
    func = _G["C_InstanceEncounter"] and _G["C_InstanceEncounter"]["ShouldShowTimelineForEncounter"],
    funcPath = "C_InstanceEncounter.ShouldShowTimelineForEncounter",
    params = {  },
    returns = { { name = "shouldShow", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

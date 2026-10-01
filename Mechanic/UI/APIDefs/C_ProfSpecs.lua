-- Generated APIDefinitions for namespace: C_ProfSpecs
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ProfSpecs.CanRefundPath"] = {
    key = "C_ProfSpecs.CanRefundPath",
    name = "CanRefundPath",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.CanRefundPath",
    params = { { name = "pathID", type = "number", default = nil }, { name = "configID", type = "number", default = nil } },
    returns = { { name = "canRefund", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.CanUnlockTab"] = {
    key = "C_ProfSpecs.CanUnlockTab",
    name = "CanUnlockTab",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.CanUnlockTab",
    params = { { name = "tabTreeID", type = "number", default = nil }, { name = "configID", type = "number", default = nil } },
    returns = { { name = "canUnlock", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetChildrenForPath"] = {
    key = "C_ProfSpecs.GetChildrenForPath",
    name = "GetChildrenForPath",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetChildrenForPath",
    params = { { name = "pathID", type = "number", default = nil } },
    returns = { { name = "childIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetConfigIDForSkillLine"] = {
    key = "C_ProfSpecs.GetConfigIDForSkillLine",
    name = "GetConfigIDForSkillLine",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetConfigIDForSkillLine",
    params = { { name = "skillLineID", type = "number", default = nil } },
    returns = { { name = "configID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetCurrencyInfoForSkillLine"] = {
    key = "C_ProfSpecs.GetCurrencyInfoForSkillLine",
    name = "GetCurrencyInfoForSkillLine",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetCurrencyInfoForSkillLine",
    params = { { name = "skillLineID", type = "number", default = nil } },
    returns = { { name = "info", type = "SpecializationCurrencyInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetDefaultSpecSkillLine"] = {
    key = "C_ProfSpecs.GetDefaultSpecSkillLine",
    name = "GetDefaultSpecSkillLine",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetDefaultSpecSkillLine",
    params = {  },
    returns = { { name = "defaultSpecSkillLine", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ProfSpecs.GetDescriptionForPath"] = {
    key = "C_ProfSpecs.GetDescriptionForPath",
    name = "GetDescriptionForPath",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetDescriptionForPath",
    params = { { name = "pathID", type = "number", default = nil } },
    returns = { { name = "description", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetDescriptionForPerk"] = {
    key = "C_ProfSpecs.GetDescriptionForPerk",
    name = "GetDescriptionForPerk",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetDescriptionForPerk",
    params = { { name = "perkID", type = "number", default = nil } },
    returns = { { name = "description", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetEntryIDForPerk"] = {
    key = "C_ProfSpecs.GetEntryIDForPerk",
    name = "GetEntryIDForPerk",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetEntryIDForPerk",
    params = { { name = "perkID", type = "number", default = nil } },
    returns = { { name = "entryID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetNewSpecReminderProfName"] = {
    key = "C_ProfSpecs.GetNewSpecReminderProfName",
    name = "GetNewSpecReminderProfName",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetNewSpecReminderProfName",
    params = {  },
    returns = { { name = "profName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ProfSpecs.GetPerksForPath"] = {
    key = "C_ProfSpecs.GetPerksForPath",
    name = "GetPerksForPath",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetPerksForPath",
    params = { { name = "pathID", type = "number", default = nil } },
    returns = { { name = "perkInfos", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetRootPathForTab"] = {
    key = "C_ProfSpecs.GetRootPathForTab",
    name = "GetRootPathForTab",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetRootPathForTab",
    params = { { name = "tabTreeID", type = "number", default = nil } },
    returns = { { name = "rootPathID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetSourceTextForPath"] = {
    key = "C_ProfSpecs.GetSourceTextForPath",
    name = "GetSourceTextForPath",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetSourceTextForPath",
    params = { { name = "pathID", type = "number", default = nil }, { name = "configID", type = "number", default = nil } },
    returns = { { name = "sourceText", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetSpecTabIDsForSkillLine"] = {
    key = "C_ProfSpecs.GetSpecTabIDsForSkillLine",
    name = "GetSpecTabIDsForSkillLine",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetSpecTabIDsForSkillLine",
    params = { { name = "skillLineID", type = "number", default = nil } },
    returns = { { name = "specTabIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetSpecTabInfo"] = {
    key = "C_ProfSpecs.GetSpecTabInfo",
    name = "GetSpecTabInfo",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetSpecTabInfo",
    params = {  },
    returns = { { name = "specTabInfo", type = "SpecializationTabInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ProfSpecs.GetSpendCurrencyForPath"] = {
    key = "C_ProfSpecs.GetSpendCurrencyForPath",
    name = "GetSpendCurrencyForPath",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetSpendCurrencyForPath",
    params = { { name = "pathID", type = "number", default = nil } },
    returns = { { name = "currencyID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetSpendEntryForPath"] = {
    key = "C_ProfSpecs.GetSpendEntryForPath",
    name = "GetSpendEntryForPath",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetSpendEntryForPath",
    params = { { name = "pathID", type = "number", default = nil } },
    returns = { { name = "entryID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetStateForPath"] = {
    key = "C_ProfSpecs.GetStateForPath",
    name = "GetStateForPath",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetStateForPath",
    params = { { name = "pathID", type = "number", default = nil }, { name = "configID", type = "number", default = nil } },
    returns = { { name = "state", type = "ProfessionsSpecPathState", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetStateForPerk"] = {
    key = "C_ProfSpecs.GetStateForPerk",
    name = "GetStateForPerk",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetStateForPerk",
    params = { { name = "perkID", type = "number", default = nil }, { name = "configID", type = "number", default = nil } },
    returns = { { name = "state", type = "ProfessionsSpecPerkState", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetStateForTab"] = {
    key = "C_ProfSpecs.GetStateForTab",
    name = "GetStateForTab",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetStateForTab",
    params = { { name = "tabTreeID", type = "number", default = nil }, { name = "configID", type = "number", default = nil } },
    returns = { { name = "tabInfo", type = "ProfessionsSpecTabState", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetTabInfo"] = {
    key = "C_ProfSpecs.GetTabInfo",
    name = "GetTabInfo",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetTabInfo",
    params = { { name = "tabTreeID", type = "number", default = nil } },
    returns = { { name = "tabInfo", type = "ProfTabInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetUnlockEntryForPath"] = {
    key = "C_ProfSpecs.GetUnlockEntryForPath",
    name = "GetUnlockEntryForPath",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetUnlockEntryForPath",
    params = { { name = "pathID", type = "number", default = nil } },
    returns = { { name = "entryID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.GetUnlockRankForPerk"] = {
    key = "C_ProfSpecs.GetUnlockRankForPerk",
    name = "GetUnlockRankForPerk",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.GetUnlockRankForPerk",
    params = { { name = "perkID", type = "number", default = nil } },
    returns = { { name = "unlockRank", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.ShouldShowPointsReminder"] = {
    key = "C_ProfSpecs.ShouldShowPointsReminder",
    name = "ShouldShowPointsReminder",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.ShouldShowPointsReminder",
    params = {  },
    returns = { { name = "showReminder", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ProfSpecs.ShouldShowPointsReminderForSkillLine"] = {
    key = "C_ProfSpecs.ShouldShowPointsReminderForSkillLine",
    name = "ShouldShowPointsReminderForSkillLine",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.ShouldShowPointsReminderForSkillLine",
    params = { { name = "skillLineID", type = "number", default = nil } },
    returns = { { name = "showReminder", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ProfSpecs.ShouldShowSpecTab"] = {
    key = "C_ProfSpecs.ShouldShowSpecTab",
    name = "ShouldShowSpecTab",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.ShouldShowSpecTab",
    params = {  },
    returns = { { name = "showSpecTab", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ProfSpecs.SkillLineHasSpecialization"] = {
    key = "C_ProfSpecs.SkillLineHasSpecialization",
    name = "SkillLineHasSpecialization",
    category = "general",
    subcategory = "c_profspecs",
    funcPath = "C_ProfSpecs.SkillLineHasSpecialization",
    params = { { name = "skillLineID", type = "number", default = nil } },
    returns = { { name = "hasSpecialization", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

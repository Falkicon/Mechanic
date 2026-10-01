-- Generated APIDefinitions for namespace: C_MajorFactions
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_MajorFactions.GetCurrentRenownLevel"] = {
    key = "C_MajorFactions.GetCurrentRenownLevel",
    name = "GetCurrentRenownLevel",
    category = "achievement",
    subcategory = "c_majorfactions",
    funcPath = "C_MajorFactions.GetCurrentRenownLevel",
    params = { { name = "majorFactionID", type = "number", default = nil } },
    returns = { { name = "level", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.GetMajorFactionData"] = {
    key = "C_MajorFactions.GetMajorFactionData",
    name = "GetMajorFactionData",
    category = "achievement",
    subcategory = "c_majorfactions",
    funcPath = "C_MajorFactions.GetMajorFactionData",
    params = { { name = "majorFactionID", type = "number", default = nil } },
    returns = { { name = "data", type = "MajorFactionData", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.GetMajorFactionIDs"] = {
    key = "C_MajorFactions.GetMajorFactionIDs",
    name = "GetMajorFactionIDs",
    category = "achievement",
    subcategory = "c_majorfactions",
    funcPath = "C_MajorFactions.GetMajorFactionIDs",
    params = { { name = "expansionID", type = "number", default = nil } },
    returns = { { name = "majorFactionIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.GetMajorFactionRenownInfo"] = {
    key = "C_MajorFactions.GetMajorFactionRenownInfo",
    name = "GetMajorFactionRenownInfo",
    category = "achievement",
    subcategory = "c_majorfactions",
    funcPath = "C_MajorFactions.GetMajorFactionRenownInfo",
    params = { { name = "majorFactionID", type = "number", default = nil } },
    returns = { { name = "data", type = "MajorFactionRenownInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.GetRenownLevels"] = {
    key = "C_MajorFactions.GetRenownLevels",
    name = "GetRenownLevels",
    category = "achievement",
    subcategory = "c_majorfactions",
    funcPath = "C_MajorFactions.GetRenownLevels",
    params = { { name = "majorFactionID", type = "number", default = nil } },
    returns = { { name = "levels", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.GetRenownNPCFactionID"] = {
    key = "C_MajorFactions.GetRenownNPCFactionID",
    name = "GetRenownNPCFactionID",
    category = "achievement",
    subcategory = "c_majorfactions",
    funcPath = "C_MajorFactions.GetRenownNPCFactionID",
    params = {  },
    returns = { { name = "renownNPCFactionID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_MajorFactions.GetRenownRewardsForLevel"] = {
    key = "C_MajorFactions.GetRenownRewardsForLevel",
    name = "GetRenownRewardsForLevel",
    category = "achievement",
    subcategory = "c_majorfactions",
    funcPath = "C_MajorFactions.GetRenownRewardsForLevel",
    params = { { name = "majorFactionID", type = "number", default = nil }, { name = "renownLevel", type = "number", default = nil } },
    returns = { { name = "rewards", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.HasMaximumRenown"] = {
    key = "C_MajorFactions.HasMaximumRenown",
    name = "HasMaximumRenown",
    category = "achievement",
    subcategory = "c_majorfactions",
    funcPath = "C_MajorFactions.HasMaximumRenown",
    params = { { name = "majorFactionID", type = "number", default = nil } },
    returns = { { name = "hasMaxRenown", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.IsMajorFactionHiddenFromExpansionPage"] = {
    key = "C_MajorFactions.IsMajorFactionHiddenFromExpansionPage",
    name = "IsMajorFactionHiddenFromExpansionPage",
    category = "achievement",
    subcategory = "c_majorfactions",
    funcPath = "C_MajorFactions.IsMajorFactionHiddenFromExpansionPage",
    params = { { name = "majorFactionID", type = "number", default = nil } },
    returns = { { name = "isHidden", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.IsWeeklyRenownCapped"] = {
    key = "C_MajorFactions.IsWeeklyRenownCapped",
    name = "IsWeeklyRenownCapped",
    category = "achievement",
    subcategory = "c_majorfactions",
    funcPath = "C_MajorFactions.IsWeeklyRenownCapped",
    params = { { name = "majorFactionID", type = "number", default = nil } },
    returns = { { name = "isWeeklyCapped", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.ShouldDisplayMajorFactionAsJourney"] = {
    key = "C_MajorFactions.ShouldDisplayMajorFactionAsJourney",
    name = "ShouldDisplayMajorFactionAsJourney",
    category = "achievement",
    subcategory = "c_majorfactions",
    funcPath = "C_MajorFactions.ShouldDisplayMajorFactionAsJourney",
    params = { { name = "majorFactionID", type = "number", default = nil } },
    returns = { { name = "shouldDisplayMajorFactionAsJourney", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MajorFactions.ShouldUseJourneyRewardTrack"] = {
    key = "C_MajorFactions.ShouldUseJourneyRewardTrack",
    name = "ShouldUseJourneyRewardTrack",
    category = "achievement",
    subcategory = "c_majorfactions",
    funcPath = "C_MajorFactions.ShouldUseJourneyRewardTrack",
    params = { { name = "majorFactionID", type = "number", default = nil } },
    returns = { { name = "shouldUseJourneyRewardTrack", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

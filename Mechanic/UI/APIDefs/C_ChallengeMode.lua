-- Generated APIDefinitions for namespace: C_ChallengeMode
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ChallengeMode.CanUseKeystoneInCurrentMap"] = {
    key = "C_ChallengeMode.CanUseKeystoneInCurrentMap",
    name = "CanUseKeystoneInCurrentMap",
    category = "combat_midnight",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["CanUseKeystoneInCurrentMap"],
    funcPath = "C_ChallengeMode.CanUseKeystoneInCurrentMap",
    params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
    returns = { { name = "canUse", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChallengeMode.ClearKeystone"] = {
    key = "C_ChallengeMode.ClearKeystone",
    name = "ClearKeystone",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["ClearKeystone"],
    funcPath = "C_ChallengeMode.ClearKeystone",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.CloseKeystoneFrame"] = {
    key = "C_ChallengeMode.CloseKeystoneFrame",
    name = "CloseKeystoneFrame",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["CloseKeystoneFrame"],
    funcPath = "C_ChallengeMode.CloseKeystoneFrame",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.GetActiveChallengeMapID"] = {
    key = "C_ChallengeMode.GetActiveChallengeMapID",
    name = "GetActiveChallengeMapID",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetActiveChallengeMapID"],
    funcPath = "C_ChallengeMode.GetActiveChallengeMapID",
    params = {  },
    returns = { { name = "mapChallengeModeID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.GetActiveKeystoneInfo"] = {
    key = "C_ChallengeMode.GetActiveKeystoneInfo",
    name = "GetActiveKeystoneInfo",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetActiveKeystoneInfo"],
    funcPath = "C_ChallengeMode.GetActiveKeystoneInfo",
    params = {  },
    returns = { { name = "activeKeystoneLevel", type = "number", canBeSecret = false }, { name = "activeAffixIDs", type = "table", canBeSecret = false }, { name = "wasActiveKeystoneCharged", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.GetAffixInfo"] = {
    key = "C_ChallengeMode.GetAffixInfo",
    name = "GetAffixInfo",
    category = "combat_midnight",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetAffixInfo"],
    funcPath = "C_ChallengeMode.GetAffixInfo",
    params = { { name = "affixID", type = "number", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "description", type = "cstring", canBeSecret = false }, { name = "filedataid", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChallengeMode.GetChallengeCompletionInfo"] = {
    key = "C_ChallengeMode.GetChallengeCompletionInfo",
    name = "GetChallengeCompletionInfo",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetChallengeCompletionInfo"],
    funcPath = "C_ChallengeMode.GetChallengeCompletionInfo",
    params = {  },
    returns = { { name = "info", type = "ChallengeCompletionInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.GetDeathCount"] = {
    key = "C_ChallengeMode.GetDeathCount",
    name = "GetDeathCount",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetDeathCount"],
    funcPath = "C_ChallengeMode.GetDeathCount",
    params = {  },
    returns = { { name = "numDeaths", type = "number", canBeSecret = false }, { name = "timeLost", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.GetDungeonScoreRarityColor"] = {
    key = "C_ChallengeMode.GetDungeonScoreRarityColor",
    name = "GetDungeonScoreRarityColor",
    category = "combat_midnight",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetDungeonScoreRarityColor"],
    funcPath = "C_ChallengeMode.GetDungeonScoreRarityColor",
    params = { { name = "dungeonScore", type = "number", default = nil } },
    returns = { { name = "scoreColor", type = "colorRGB", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChallengeMode.GetGuildLeaders"] = {
    key = "C_ChallengeMode.GetGuildLeaders",
    name = "GetGuildLeaders",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetGuildLeaders"],
    funcPath = "C_ChallengeMode.GetGuildLeaders",
    params = {  },
    returns = { { name = "topAttempt", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.GetKeystoneLevelRarityColor"] = {
    key = "C_ChallengeMode.GetKeystoneLevelRarityColor",
    name = "GetKeystoneLevelRarityColor",
    category = "combat_midnight",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetKeystoneLevelRarityColor"],
    funcPath = "C_ChallengeMode.GetKeystoneLevelRarityColor",
    params = { { name = "level", type = "number", default = nil } },
    returns = { { name = "levelScore", type = "colorRGB", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChallengeMode.GetLeaverPenaltyWarningTimeLeft"] = {
    key = "C_ChallengeMode.GetLeaverPenaltyWarningTimeLeft",
    name = "GetLeaverPenaltyWarningTimeLeft",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetLeaverPenaltyWarningTimeLeft"],
    funcPath = "C_ChallengeMode.GetLeaverPenaltyWarningTimeLeft",
    params = {  },
    returns = { { name = "timeLeftSeconds", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.GetMapScoreInfo"] = {
    key = "C_ChallengeMode.GetMapScoreInfo",
    name = "GetMapScoreInfo",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetMapScoreInfo"],
    funcPath = "C_ChallengeMode.GetMapScoreInfo",
    params = {  },
    returns = { { name = "displayScores", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.GetMapTable"] = {
    key = "C_ChallengeMode.GetMapTable",
    name = "GetMapTable",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetMapTable"],
    funcPath = "C_ChallengeMode.GetMapTable",
    params = {  },
    returns = { { name = "mapChallengeModeIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.GetMapUIInfo"] = {
    key = "C_ChallengeMode.GetMapUIInfo",
    name = "GetMapUIInfo",
    category = "combat_midnight",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetMapUIInfo"],
    funcPath = "C_ChallengeMode.GetMapUIInfo",
    params = { { name = "mapChallengeModeID", type = "number", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false }, { name = "id", type = "number", canBeSecret = false }, { name = "timeLimit", type = "number", canBeSecret = false }, { name = "texture", type = "number", canBeSecret = false }, { name = "backgroundTexture", type = "number", canBeSecret = false }, { name = "mapID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChallengeMode.GetOverallDungeonScore"] = {
    key = "C_ChallengeMode.GetOverallDungeonScore",
    name = "GetOverallDungeonScore",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetOverallDungeonScore"],
    funcPath = "C_ChallengeMode.GetOverallDungeonScore",
    params = {  },
    returns = { { name = "overallDungeonScore", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.GetPowerLevelDamageHealthMod"] = {
    key = "C_ChallengeMode.GetPowerLevelDamageHealthMod",
    name = "GetPowerLevelDamageHealthMod",
    category = "combat_midnight",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetPowerLevelDamageHealthMod"],
    funcPath = "C_ChallengeMode.GetPowerLevelDamageHealthMod",
    params = { { name = "powerLevel", type = "number", default = nil } },
    returns = { { name = "damageMod", type = "number", canBeSecret = false }, { name = "healthMod", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChallengeMode.GetSlottedKeystoneInfo"] = {
    key = "C_ChallengeMode.GetSlottedKeystoneInfo",
    name = "GetSlottedKeystoneInfo",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetSlottedKeystoneInfo"],
    funcPath = "C_ChallengeMode.GetSlottedKeystoneInfo",
    params = {  },
    returns = { { name = "mapChallengeModeID", type = "number", canBeSecret = false }, { name = "affixIDs", type = "table", canBeSecret = false }, { name = "keystoneLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.GetSpecificDungeonOverallScoreRarityColor"] = {
    key = "C_ChallengeMode.GetSpecificDungeonOverallScoreRarityColor",
    name = "GetSpecificDungeonOverallScoreRarityColor",
    category = "combat_midnight",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetSpecificDungeonOverallScoreRarityColor"],
    funcPath = "C_ChallengeMode.GetSpecificDungeonOverallScoreRarityColor",
    params = { { name = "specificDungeonOverallScore", type = "number", default = nil } },
    returns = { { name = "specificDungeonOverallScoreColor", type = "colorRGB", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChallengeMode.GetSpecificDungeonScoreRarityColor"] = {
    key = "C_ChallengeMode.GetSpecificDungeonScoreRarityColor",
    name = "GetSpecificDungeonScoreRarityColor",
    category = "combat_midnight",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetSpecificDungeonScoreRarityColor"],
    funcPath = "C_ChallengeMode.GetSpecificDungeonScoreRarityColor",
    params = { { name = "specificDungeonScore", type = "number", default = nil } },
    returns = { { name = "specificDungeonScoreColor", type = "colorRGB", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChallengeMode.GetStartTime"] = {
    key = "C_ChallengeMode.GetStartTime",
    name = "GetStartTime",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetStartTime"],
    funcPath = "C_ChallengeMode.GetStartTime",
    params = {  },
    returns = { { name = "startTime", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.HasSlottedKeystone"] = {
    key = "C_ChallengeMode.HasSlottedKeystone",
    name = "HasSlottedKeystone",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["HasSlottedKeystone"],
    funcPath = "C_ChallengeMode.HasSlottedKeystone",
    params = {  },
    returns = { { name = "hasSlottedKeystone", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.IsChallengeModeActive"] = {
    key = "C_ChallengeMode.IsChallengeModeActive",
    name = "IsChallengeModeActive",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["IsChallengeModeActive"],
    funcPath = "C_ChallengeMode.IsChallengeModeActive",
    params = {  },
    returns = { { name = "challengeModeActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.IsChallengeModeResettable"] = {
    key = "C_ChallengeMode.IsChallengeModeResettable",
    name = "IsChallengeModeResettable",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["IsChallengeModeResettable"],
    funcPath = "C_ChallengeMode.IsChallengeModeResettable",
    params = {  },
    returns = { { name = "canReset", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.RemoveKeystone"] = {
    key = "C_ChallengeMode.RemoveKeystone",
    name = "RemoveKeystone",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["RemoveKeystone"],
    funcPath = "C_ChallengeMode.RemoveKeystone",
    params = {  },
    returns = { { name = "removalSuccessful", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.RequestLeaders"] = {
    key = "C_ChallengeMode.RequestLeaders",
    name = "RequestLeaders",
    category = "combat_midnight",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["RequestLeaders"],
    funcPath = "C_ChallengeMode.RequestLeaders",
    params = { { name = "mapChallengeModeID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChallengeMode.Reset"] = {
    key = "C_ChallengeMode.Reset",
    name = "Reset",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["Reset"],
    funcPath = "C_ChallengeMode.Reset",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.SlotKeystone"] = {
    key = "C_ChallengeMode.SlotKeystone",
    name = "SlotKeystone",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["SlotKeystone"],
    funcPath = "C_ChallengeMode.SlotKeystone",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_ChallengeMode.StartChallengeMode"] = {
    key = "C_ChallengeMode.StartChallengeMode",
    name = "StartChallengeMode",
    category = "general",
    subcategory = "c_challengemode",
    func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["StartChallengeMode"],
    funcPath = "C_ChallengeMode.StartChallengeMode",
    params = {  },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

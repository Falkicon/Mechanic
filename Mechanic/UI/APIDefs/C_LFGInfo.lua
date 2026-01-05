-- Generated APIDefinitions for namespace: C_LFGInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LFGInfo.AreCrossFactionGroupQueuesAllowed"] = {
    key = "C_LFGInfo.AreCrossFactionGroupQueuesAllowed",
    name = "AreCrossFactionGroupQueuesAllowed",
    category = "combat_midnight",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["AreCrossFactionGroupQueuesAllowed"],
    funcPath = "C_LFGInfo.AreCrossFactionGroupQueuesAllowed",
    params = { { name = "lfgDungeonID", type = "number", default = nil } },
    returns = { { name = "areCrossFactionGroupQueuesAllowed", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGInfo.CanPlayerUseGroupFinder"] = {
    key = "C_LFGInfo.CanPlayerUseGroupFinder",
    name = "CanPlayerUseGroupFinder",
    category = "general",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["CanPlayerUseGroupFinder"],
    funcPath = "C_LFGInfo.CanPlayerUseGroupFinder",
    params = {  },
    returns = { { name = "canUse", type = "bool", canBeSecret = false }, { name = "failureReason", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGInfo.CanPlayerUseLFD"] = {
    key = "C_LFGInfo.CanPlayerUseLFD",
    name = "CanPlayerUseLFD",
    category = "general",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["CanPlayerUseLFD"],
    funcPath = "C_LFGInfo.CanPlayerUseLFD",
    params = {  },
    returns = { { name = "canUse", type = "bool", canBeSecret = false }, { name = "failureReason", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGInfo.CanPlayerUseLFR"] = {
    key = "C_LFGInfo.CanPlayerUseLFR",
    name = "CanPlayerUseLFR",
    category = "general",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["CanPlayerUseLFR"],
    funcPath = "C_LFGInfo.CanPlayerUseLFR",
    params = {  },
    returns = { { name = "canUse", type = "bool", canBeSecret = false }, { name = "failureReason", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGInfo.CanPlayerUsePVP"] = {
    key = "C_LFGInfo.CanPlayerUsePVP",
    name = "CanPlayerUsePVP",
    category = "general",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["CanPlayerUsePVP"],
    funcPath = "C_LFGInfo.CanPlayerUsePVP",
    params = {  },
    returns = { { name = "canUse", type = "bool", canBeSecret = false }, { name = "failureReason", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGInfo.CanPlayerUsePremadeGroup"] = {
    key = "C_LFGInfo.CanPlayerUsePremadeGroup",
    name = "CanPlayerUsePremadeGroup",
    category = "general",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["CanPlayerUsePremadeGroup"],
    funcPath = "C_LFGInfo.CanPlayerUsePremadeGroup",
    params = {  },
    returns = { { name = "canUse", type = "bool", canBeSecret = false }, { name = "failureReason", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGInfo.CanPlayerUseScenarioFinder"] = {
    key = "C_LFGInfo.CanPlayerUseScenarioFinder",
    name = "CanPlayerUseScenarioFinder",
    category = "general",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["CanPlayerUseScenarioFinder"],
    funcPath = "C_LFGInfo.CanPlayerUseScenarioFinder",
    params = {  },
    returns = { { name = "canUse", type = "bool", canBeSecret = false }, { name = "failureReason", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGInfo.ConfirmLfgExpandSearch"] = {
    key = "C_LFGInfo.ConfirmLfgExpandSearch",
    name = "ConfirmLfgExpandSearch",
    category = "general",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["ConfirmLfgExpandSearch"],
    funcPath = "C_LFGInfo.ConfirmLfgExpandSearch",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGInfo.DoesActivePartyMeetPremadeLaunchCount"] = {
    key = "C_LFGInfo.DoesActivePartyMeetPremadeLaunchCount",
    name = "DoesActivePartyMeetPremadeLaunchCount",
    category = "combat_midnight",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["DoesActivePartyMeetPremadeLaunchCount"],
    funcPath = "C_LFGInfo.DoesActivePartyMeetPremadeLaunchCount",
    params = { { name = "lfgDungeonID", type = "number", default = nil } },
    returns = { { name = "doesActivePartyMeetPremadeLaunchCount", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGInfo.DoesCrossFactionQueueRequireFullPremade"] = {
    key = "C_LFGInfo.DoesCrossFactionQueueRequireFullPremade",
    name = "DoesCrossFactionQueueRequireFullPremade",
    category = "combat_midnight",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["DoesCrossFactionQueueRequireFullPremade"],
    funcPath = "C_LFGInfo.DoesCrossFactionQueueRequireFullPremade",
    params = { { name = "lfgDungeonID", type = "number", default = nil } },
    returns = { { name = "doesCrossFactionQueueRequireFullPremade", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGInfo.GetAllEntriesForCategory"] = {
    key = "C_LFGInfo.GetAllEntriesForCategory",
    name = "GetAllEntriesForCategory",
    category = "combat_midnight",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["GetAllEntriesForCategory"],
    funcPath = "C_LFGInfo.GetAllEntriesForCategory",
    params = { { name = "category", type = "luaIndex", default = nil } },
    returns = { { name = "lfgDungeonIDs", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGInfo.GetDungeonInfo"] = {
    key = "C_LFGInfo.GetDungeonInfo",
    name = "GetDungeonInfo",
    category = "combat_midnight",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["GetDungeonInfo"],
    funcPath = "C_LFGInfo.GetDungeonInfo",
    params = { { name = "lfgDungeonID", type = "number", default = nil } },
    returns = { { name = "dungeonInfo", type = "LFGDungeonInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGInfo.GetLFDLockStates"] = {
    key = "C_LFGInfo.GetLFDLockStates",
    name = "GetLFDLockStates",
    category = "general",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["GetLFDLockStates"],
    funcPath = "C_LFGInfo.GetLFDLockStates",
    params = {  },
    returns = { { name = "lockInfo", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGInfo.GetLevelUpInstances"] = {
    key = "C_LFGInfo.GetLevelUpInstances",
    name = "GetLevelUpInstances",
    category = "combat_midnight",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["GetLevelUpInstances"],
    funcPath = "C_LFGInfo.GetLevelUpInstances",
    params = { { name = "currPlayerLevel", type = "number", default = nil }, { name = "isRaid", type = "bool", default = nil } },
    returns = { { name = "instances", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGInfo.GetRoleCheckDifficultyDetails"] = {
    key = "C_LFGInfo.GetRoleCheckDifficultyDetails",
    name = "GetRoleCheckDifficultyDetails",
    category = "general",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["GetRoleCheckDifficultyDetails"],
    funcPath = "C_LFGInfo.GetRoleCheckDifficultyDetails",
    params = {  },
    returns = { { name = "maxLevel", type = "number", canBeSecret = false }, { name = "isLevelReduced", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGInfo.HideNameFromUI"] = {
    key = "C_LFGInfo.HideNameFromUI",
    name = "HideNameFromUI",
    category = "combat_midnight",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["HideNameFromUI"],
    funcPath = "C_LFGInfo.HideNameFromUI",
    params = { { name = "dungeonID", type = "number", default = nil } },
    returns = { { name = "shouldHide", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGInfo.IsGroupFinderEnabled"] = {
    key = "C_LFGInfo.IsGroupFinderEnabled",
    name = "IsGroupFinderEnabled",
    category = "general",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["IsGroupFinderEnabled"],
    funcPath = "C_LFGInfo.IsGroupFinderEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGInfo.IsInLFGFollowerDungeon"] = {
    key = "C_LFGInfo.IsInLFGFollowerDungeon",
    name = "IsInLFGFollowerDungeon",
    category = "general",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["IsInLFGFollowerDungeon"],
    funcPath = "C_LFGInfo.IsInLFGFollowerDungeon",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGInfo.IsLFDEnabled"] = {
    key = "C_LFGInfo.IsLFDEnabled",
    name = "IsLFDEnabled",
    category = "general",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["IsLFDEnabled"],
    funcPath = "C_LFGInfo.IsLFDEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LFGInfo.IsLFGFollowerDungeon"] = {
    key = "C_LFGInfo.IsLFGFollowerDungeon",
    name = "IsLFGFollowerDungeon",
    category = "combat_midnight",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["IsLFGFollowerDungeon"],
    funcPath = "C_LFGInfo.IsLFGFollowerDungeon",
    params = { { name = "dungeonID", type = "number", default = nil } },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LFGInfo.IsLFREnabled"] = {
    key = "C_LFGInfo.IsLFREnabled",
    name = "IsLFREnabled",
    category = "general",
    subcategory = "c_lfginfo",
    func = _G["C_LFGInfo"] and _G["C_LFGInfo"]["IsLFREnabled"],
    funcPath = "C_LFGInfo.IsLFREnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

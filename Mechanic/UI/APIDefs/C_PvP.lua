-- Generated APIDefinitions for namespace: C_PvP
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PvP.ArePvpTalentsUnlocked"] = {
    key = "C_PvP.ArePvpTalentsUnlocked",
    name = "ArePvpTalentsUnlocked",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["ArePvpTalentsUnlocked"],
    funcPath = "C_PvP.ArePvpTalentsUnlocked",
    params = {  },
    returns = { { name = "arePvpTalentsUnlocked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.AreTrainingGroundsEnabled"] = {
    key = "C_PvP.AreTrainingGroundsEnabled",
    name = "AreTrainingGroundsEnabled",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["AreTrainingGroundsEnabled"],
    funcPath = "C_PvP.AreTrainingGroundsEnabled",
    params = {  },
    returns = { { name = "areTrainingGroundsEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.CanDisplayDeaths"] = {
    key = "C_PvP.CanDisplayDeaths",
    name = "CanDisplayDeaths",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["CanDisplayDeaths"],
    funcPath = "C_PvP.CanDisplayDeaths",
    params = {  },
    returns = { { name = "canDisplay", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.CanDisplayHonorableKills"] = {
    key = "C_PvP.CanDisplayHonorableKills",
    name = "CanDisplayHonorableKills",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["CanDisplayHonorableKills"],
    funcPath = "C_PvP.CanDisplayHonorableKills",
    params = {  },
    returns = { { name = "canDisplay", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.CanPlayerUseRatedPVPUI"] = {
    key = "C_PvP.CanPlayerUseRatedPVPUI",
    name = "CanPlayerUseRatedPVPUI",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["CanPlayerUseRatedPVPUI"],
    funcPath = "C_PvP.CanPlayerUseRatedPVPUI",
    params = {  },
    returns = { { name = "canUse", type = "bool", canBeSecret = false }, { name = "failureReason", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.CanPlayerUseTrainingGroundsUI"] = {
    key = "C_PvP.CanPlayerUseTrainingGroundsUI",
    name = "CanPlayerUseTrainingGroundsUI",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["CanPlayerUseTrainingGroundsUI"],
    funcPath = "C_PvP.CanPlayerUseTrainingGroundsUI",
    params = {  },
    returns = { { name = "canUseTrainingGroundsUI", type = "bool", canBeSecret = false }, { name = "failureReason", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.CanToggleWarMode"] = {
    key = "C_PvP.CanToggleWarMode",
    name = "CanToggleWarMode",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["CanToggleWarMode"],
    funcPath = "C_PvP.CanToggleWarMode",
    params = { { name = "toggle", type = "bool", default = nil } },
    returns = { { name = "canTogglePvP", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.CanToggleWarModeInArea"] = {
    key = "C_PvP.CanToggleWarModeInArea",
    name = "CanToggleWarModeInArea",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["CanToggleWarModeInArea"],
    funcPath = "C_PvP.CanToggleWarModeInArea",
    params = {  },
    returns = { { name = "canTogglePvPInArea", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.DoesMatchOutcomeAffectRating"] = {
    key = "C_PvP.DoesMatchOutcomeAffectRating",
    name = "DoesMatchOutcomeAffectRating",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["DoesMatchOutcomeAffectRating"],
    funcPath = "C_PvP.DoesMatchOutcomeAffectRating",
    params = {  },
    returns = { { name = "doesAffect", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetActiveBrawlInfo"] = {
    key = "C_PvP.GetActiveBrawlInfo",
    name = "GetActiveBrawlInfo",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetActiveBrawlInfo"],
    funcPath = "C_PvP.GetActiveBrawlInfo",
    params = {  },
    returns = { { name = "brawlInfo", type = "PvpBrawlInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetActiveMatchBracket"] = {
    key = "C_PvP.GetActiveMatchBracket",
    name = "GetActiveMatchBracket",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetActiveMatchBracket"],
    funcPath = "C_PvP.GetActiveMatchBracket",
    params = {  },
    returns = { { name = "bracket", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetActiveMatchDuration"] = {
    key = "C_PvP.GetActiveMatchDuration",
    name = "GetActiveMatchDuration",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetActiveMatchDuration"],
    funcPath = "C_PvP.GetActiveMatchDuration",
    params = {  },
    returns = { { name = "seconds", type = "time_t", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetActiveMatchState"] = {
    key = "C_PvP.GetActiveMatchState",
    name = "GetActiveMatchState",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetActiveMatchState"],
    funcPath = "C_PvP.GetActiveMatchState",
    params = {  },
    returns = { { name = "state", type = "PvPMatchState", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetActiveMatchWinner"] = {
    key = "C_PvP.GetActiveMatchWinner",
    name = "GetActiveMatchWinner",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetActiveMatchWinner"],
    funcPath = "C_PvP.GetActiveMatchWinner",
    params = {  },
    returns = { { name = "winner", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetArenaCrowdControlInfo"] = {
    key = "C_PvP.GetArenaCrowdControlInfo",
    name = "GetArenaCrowdControlInfo",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetArenaCrowdControlInfo"],
    funcPath = "C_PvP.GetArenaCrowdControlInfo",
    params = { { name = "playerToken", type = "UnitToken", default = "player" } },
    returns = { { name = "spellID", type = "number", canBeSecret = false }, { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetArenaRewards"] = {
    key = "C_PvP.GetArenaRewards",
    name = "GetArenaRewards",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetArenaRewards"],
    funcPath = "C_PvP.GetArenaRewards",
    params = { { name = "teamSize", type = "number", default = nil } },
    returns = { { name = "honor", type = "number", canBeSecret = false }, { name = "experience", type = "number", canBeSecret = false }, { name = "itemRewards", type = "table", canBeSecret = false }, { name = "currencyRewards", type = "table", canBeSecret = false }, { name = "roleShortageBonus", type = "RoleShortageReward", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetArenaSkirmishRewards"] = {
    key = "C_PvP.GetArenaSkirmishRewards",
    name = "GetArenaSkirmishRewards",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetArenaSkirmishRewards"],
    funcPath = "C_PvP.GetArenaSkirmishRewards",
    params = {  },
    returns = { { name = "honor", type = "number", canBeSecret = false }, { name = "experience", type = "number", canBeSecret = false }, { name = "itemRewards", type = "table", canBeSecret = false }, { name = "currencyRewards", type = "table", canBeSecret = false }, { name = "roleShortageBonus", type = "RoleShortageReward", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetAssignedSpecForBattlefieldQueue"] = {
    key = "C_PvP.GetAssignedSpecForBattlefieldQueue",
    name = "GetAssignedSpecForBattlefieldQueue",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetAssignedSpecForBattlefieldQueue"],
    funcPath = "C_PvP.GetAssignedSpecForBattlefieldQueue",
    params = { { name = "queueID", type = "number", default = nil } },
    returns = { { name = "specializationID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetAvailableBrawlInfo"] = {
    key = "C_PvP.GetAvailableBrawlInfo",
    name = "GetAvailableBrawlInfo",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetAvailableBrawlInfo"],
    funcPath = "C_PvP.GetAvailableBrawlInfo",
    params = {  },
    returns = { { name = "brawlInfo", type = "PvpBrawlInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetBattlefieldFlagPosition"] = {
    key = "C_PvP.GetBattlefieldFlagPosition",
    name = "GetBattlefieldFlagPosition",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetBattlefieldFlagPosition"],
    funcPath = "C_PvP.GetBattlefieldFlagPosition",
    params = { { name = "flagIndex", type = "luaIndex", default = nil }, { name = "uiMapId", type = "number", default = nil } },
    returns = { { name = "uiPosx", type = "number", canBeSecret = false }, { name = "uiPosy", type = "number", canBeSecret = false }, { name = "flagTexture", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetBattlefieldVehicleInfo"] = {
    key = "C_PvP.GetBattlefieldVehicleInfo",
    name = "GetBattlefieldVehicleInfo",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetBattlefieldVehicleInfo"],
    funcPath = "C_PvP.GetBattlefieldVehicleInfo",
    params = { { name = "vehicleIndex", type = "luaIndex", default = nil }, { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "info", type = "BattlefieldVehicleInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetBattlefieldVehicles"] = {
    key = "C_PvP.GetBattlefieldVehicles",
    name = "GetBattlefieldVehicles",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetBattlefieldVehicles"],
    funcPath = "C_PvP.GetBattlefieldVehicles",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "vehicles", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetBattlegroundInfo"] = {
    key = "C_PvP.GetBattlegroundInfo",
    name = "GetBattlegroundInfo",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetBattlegroundInfo"],
    funcPath = "C_PvP.GetBattlegroundInfo",
    params = { { name = "battlegroundIndex", type = "luaIndex", default = nil } },
    returns = { { name = "battlegroundInfo", type = "BattlegroundInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetBrawlRewards"] = {
    key = "C_PvP.GetBrawlRewards",
    name = "GetBrawlRewards",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetBrawlRewards"],
    funcPath = "C_PvP.GetBrawlRewards",
    params = { { name = "brawlType", type = "BrawlType", default = nil } },
    returns = { { name = "honor", type = "number", canBeSecret = false }, { name = "experience", type = "number", canBeSecret = false }, { name = "itemRewards", type = "table", canBeSecret = false }, { name = "currencyRewards", type = "table", canBeSecret = false }, { name = "roleShortageBonus", type = "RoleShortageReward", canBeSecret = false }, { name = "hasWon", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetBrawlSoloRBGMinItemLevel"] = {
    key = "C_PvP.GetBrawlSoloRBGMinItemLevel",
    name = "GetBrawlSoloRBGMinItemLevel",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetBrawlSoloRBGMinItemLevel"],
    funcPath = "C_PvP.GetBrawlSoloRBGMinItemLevel",
    params = {  },
    returns = { { name = "minItemLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetCustomVictoryStatID"] = {
    key = "C_PvP.GetCustomVictoryStatID",
    name = "GetCustomVictoryStatID",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetCustomVictoryStatID"],
    funcPath = "C_PvP.GetCustomVictoryStatID",
    params = {  },
    returns = { { name = "statID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetGlobalPvpScalingInfoForSpecID"] = {
    key = "C_PvP.GetGlobalPvpScalingInfoForSpecID",
    name = "GetGlobalPvpScalingInfoForSpecID",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetGlobalPvpScalingInfoForSpecID"],
    funcPath = "C_PvP.GetGlobalPvpScalingInfoForSpecID",
    params = { { name = "specializationID", type = "number", default = nil } },
    returns = { { name = "pvpScalingData", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetHonorRewardInfo"] = {
    key = "C_PvP.GetHonorRewardInfo",
    name = "GetHonorRewardInfo",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetHonorRewardInfo"],
    funcPath = "C_PvP.GetHonorRewardInfo",
    params = { { name = "honorLevel", type = "number", default = nil } },
    returns = { { name = "info", type = "HonorRewardInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetLevelUpBattlegrounds"] = {
    key = "C_PvP.GetLevelUpBattlegrounds",
    name = "GetLevelUpBattlegrounds",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetLevelUpBattlegrounds"],
    funcPath = "C_PvP.GetLevelUpBattlegrounds",
    params = { { name = "level", type = "number", default = nil } },
    returns = { { name = "battlefields", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetMatchPVPStatColumn"] = {
    key = "C_PvP.GetMatchPVPStatColumn",
    name = "GetMatchPVPStatColumn",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetMatchPVPStatColumn"],
    funcPath = "C_PvP.GetMatchPVPStatColumn",
    params = { { name = "pvpStatID", type = "number", default = nil } },
    returns = { { name = "info", type = "MatchPVPStatColumn", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetMatchPVPStatColumns"] = {
    key = "C_PvP.GetMatchPVPStatColumns",
    name = "GetMatchPVPStatColumns",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetMatchPVPStatColumns"],
    funcPath = "C_PvP.GetMatchPVPStatColumns",
    params = {  },
    returns = { { name = "columns", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetNextHonorLevelForReward"] = {
    key = "C_PvP.GetNextHonorLevelForReward",
    name = "GetNextHonorLevelForReward",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetNextHonorLevelForReward"],
    funcPath = "C_PvP.GetNextHonorLevelForReward",
    params = { { name = "honorLevel", type = "number", default = nil } },
    returns = { { name = "nextHonorLevelWithReward", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetOutdoorPvPWaitTime"] = {
    key = "C_PvP.GetOutdoorPvPWaitTime",
    name = "GetOutdoorPvPWaitTime",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetOutdoorPvPWaitTime"],
    funcPath = "C_PvP.GetOutdoorPvPWaitTime",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "pvpWaitTime", type = "time_t", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetPVPActiveMatchPersonalRatedInfo"] = {
    key = "C_PvP.GetPVPActiveMatchPersonalRatedInfo",
    name = "GetPVPActiveMatchPersonalRatedInfo",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetPVPActiveMatchPersonalRatedInfo"],
    funcPath = "C_PvP.GetPVPActiveMatchPersonalRatedInfo",
    params = {  },
    returns = { { name = "info", type = "PVPPersonalRatedInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetPVPActiveRatedMatchDeserterPenalty"] = {
    key = "C_PvP.GetPVPActiveRatedMatchDeserterPenalty",
    name = "GetPVPActiveRatedMatchDeserterPenalty",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetPVPActiveRatedMatchDeserterPenalty"],
    funcPath = "C_PvP.GetPVPActiveRatedMatchDeserterPenalty",
    params = {  },
    returns = { { name = "deserterPenalty", type = "RatedMatchDeserterPenalty", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetPVPSeasonRewardAchievementID"] = {
    key = "C_PvP.GetPVPSeasonRewardAchievementID",
    name = "GetPVPSeasonRewardAchievementID",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetPVPSeasonRewardAchievementID"],
    funcPath = "C_PvP.GetPVPSeasonRewardAchievementID",
    params = {  },
    returns = { { name = "achievementID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetPersonalRatedBGBlitzSpecStats"] = {
    key = "C_PvP.GetPersonalRatedBGBlitzSpecStats",
    name = "GetPersonalRatedBGBlitzSpecStats",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetPersonalRatedBGBlitzSpecStats"],
    funcPath = "C_PvP.GetPersonalRatedBGBlitzSpecStats",
    params = {  },
    returns = { { name = "specStats", type = "RatedBGBlitzSpecStats", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetPersonalRatedSoloShuffleSpecStats"] = {
    key = "C_PvP.GetPersonalRatedSoloShuffleSpecStats",
    name = "GetPersonalRatedSoloShuffleSpecStats",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetPersonalRatedSoloShuffleSpecStats"],
    funcPath = "C_PvP.GetPersonalRatedSoloShuffleSpecStats",
    params = {  },
    returns = { { name = "specStats", type = "RatedSoloShuffleSpecStats", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetPostMatchCurrencyRewards"] = {
    key = "C_PvP.GetPostMatchCurrencyRewards",
    name = "GetPostMatchCurrencyRewards",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetPostMatchCurrencyRewards"],
    funcPath = "C_PvP.GetPostMatchCurrencyRewards",
    params = {  },
    returns = { { name = "rewards", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetPostMatchItemRewards"] = {
    key = "C_PvP.GetPostMatchItemRewards",
    name = "GetPostMatchItemRewards",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetPostMatchItemRewards"],
    funcPath = "C_PvP.GetPostMatchItemRewards",
    params = {  },
    returns = { { name = "rewards", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetPvpTalentsUnlockedLevel"] = {
    key = "C_PvP.GetPvpTalentsUnlockedLevel",
    name = "GetPvpTalentsUnlockedLevel",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetPvpTalentsUnlockedLevel"],
    funcPath = "C_PvP.GetPvpTalentsUnlockedLevel",
    params = {  },
    returns = { { name = "unlockLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetPvpTierID"] = {
    key = "C_PvP.GetPvpTierID",
    name = "GetPvpTierID",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetPvpTierID"],
    funcPath = "C_PvP.GetPvpTierID",
    params = { { name = "tierEnum", type = "number", default = nil }, { name = "bracketEnum", type = "luaIndex", default = nil } },
    returns = { { name = "id", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetPvpTierInfo"] = {
    key = "C_PvP.GetPvpTierInfo",
    name = "GetPvpTierInfo",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetPvpTierInfo"],
    funcPath = "C_PvP.GetPvpTierInfo",
    params = { { name = "tierID", type = "number", default = nil } },
    returns = { { name = "pvpTierInfo", type = "PvpTierInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetRandomBGInfo"] = {
    key = "C_PvP.GetRandomBGInfo",
    name = "GetRandomBGInfo",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetRandomBGInfo"],
    funcPath = "C_PvP.GetRandomBGInfo",
    params = {  },
    returns = { { name = "info", type = "RandomBGInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetRandomBGRewards"] = {
    key = "C_PvP.GetRandomBGRewards",
    name = "GetRandomBGRewards",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetRandomBGRewards"],
    funcPath = "C_PvP.GetRandomBGRewards",
    params = {  },
    returns = { { name = "honor", type = "number", canBeSecret = false }, { name = "experience", type = "number", canBeSecret = false }, { name = "itemRewards", type = "table", canBeSecret = false }, { name = "currencyRewards", type = "table", canBeSecret = false }, { name = "roleShortageBonus", type = "RoleShortageReward", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetRandomEpicBGInfo"] = {
    key = "C_PvP.GetRandomEpicBGInfo",
    name = "GetRandomEpicBGInfo",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetRandomEpicBGInfo"],
    funcPath = "C_PvP.GetRandomEpicBGInfo",
    params = {  },
    returns = { { name = "info", type = "RandomBGInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetRandomEpicBGRewards"] = {
    key = "C_PvP.GetRandomEpicBGRewards",
    name = "GetRandomEpicBGRewards",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetRandomEpicBGRewards"],
    funcPath = "C_PvP.GetRandomEpicBGRewards",
    params = {  },
    returns = { { name = "honor", type = "number", canBeSecret = false }, { name = "experience", type = "number", canBeSecret = false }, { name = "itemRewards", type = "table", canBeSecret = false }, { name = "currencyRewards", type = "table", canBeSecret = false }, { name = "roleShortageBonus", type = "RoleShortageReward", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetRandomTrainingGroundRewards"] = {
    key = "C_PvP.GetRandomTrainingGroundRewards",
    name = "GetRandomTrainingGroundRewards",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetRandomTrainingGroundRewards"],
    funcPath = "C_PvP.GetRandomTrainingGroundRewards",
    params = {  },
    returns = { { name = "honor", type = "number", canBeSecret = false }, { name = "experience", type = "number", canBeSecret = false }, { name = "itemRewards", type = "table", canBeSecret = false }, { name = "currencyRewards", type = "table", canBeSecret = false }, { name = "roleShortageBonus", type = "RoleShortageReward", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetRatedBGRewards"] = {
    key = "C_PvP.GetRatedBGRewards",
    name = "GetRatedBGRewards",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetRatedBGRewards"],
    funcPath = "C_PvP.GetRatedBGRewards",
    params = {  },
    returns = { { name = "honor", type = "number", canBeSecret = false }, { name = "experience", type = "number", canBeSecret = false }, { name = "itemRewards", type = "table", canBeSecret = false }, { name = "currencyRewards", type = "table", canBeSecret = false }, { name = "roleShortageBonus", type = "RoleShortageReward", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetRatedSoloRBGMinItemLevel"] = {
    key = "C_PvP.GetRatedSoloRBGMinItemLevel",
    name = "GetRatedSoloRBGMinItemLevel",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetRatedSoloRBGMinItemLevel"],
    funcPath = "C_PvP.GetRatedSoloRBGMinItemLevel",
    params = {  },
    returns = { { name = "minItemLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetRatedSoloRBGRewards"] = {
    key = "C_PvP.GetRatedSoloRBGRewards",
    name = "GetRatedSoloRBGRewards",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetRatedSoloRBGRewards"],
    funcPath = "C_PvP.GetRatedSoloRBGRewards",
    params = {  },
    returns = { { name = "honor", type = "number", canBeSecret = false }, { name = "experience", type = "number", canBeSecret = false }, { name = "itemRewards", type = "table", canBeSecret = false }, { name = "currencyRewards", type = "table", canBeSecret = false }, { name = "roleShortageBonus", type = "RoleShortageReward", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetRatedSoloShuffleMinItemLevel"] = {
    key = "C_PvP.GetRatedSoloShuffleMinItemLevel",
    name = "GetRatedSoloShuffleMinItemLevel",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetRatedSoloShuffleMinItemLevel"],
    funcPath = "C_PvP.GetRatedSoloShuffleMinItemLevel",
    params = {  },
    returns = { { name = "minItemLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetRatedSoloShuffleRewards"] = {
    key = "C_PvP.GetRatedSoloShuffleRewards",
    name = "GetRatedSoloShuffleRewards",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetRatedSoloShuffleRewards"],
    funcPath = "C_PvP.GetRatedSoloShuffleRewards",
    params = {  },
    returns = { { name = "honor", type = "number", canBeSecret = false }, { name = "experience", type = "number", canBeSecret = false }, { name = "itemRewards", type = "table", canBeSecret = false }, { name = "currencyRewards", type = "table", canBeSecret = false }, { name = "roleShortageBonus", type = "RoleShortageReward", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetRewardItemLevelsByTierEnum"] = {
    key = "C_PvP.GetRewardItemLevelsByTierEnum",
    name = "GetRewardItemLevelsByTierEnum",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetRewardItemLevelsByTierEnum"],
    funcPath = "C_PvP.GetRewardItemLevelsByTierEnum",
    params = { { name = "pvpTierEnum", type = "number", default = nil } },
    returns = { { name = "activityItemLevel", type = "number", canBeSecret = false }, { name = "weeklyItemLevel", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetScoreInfo"] = {
    key = "C_PvP.GetScoreInfo",
    name = "GetScoreInfo",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetScoreInfo"],
    funcPath = "C_PvP.GetScoreInfo",
    params = { { name = "offsetIndex", type = "luaIndex", default = nil } },
    returns = { { name = "info", type = "PVPScoreInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetScoreInfoByPlayerGuid"] = {
    key = "C_PvP.GetScoreInfoByPlayerGuid",
    name = "GetScoreInfoByPlayerGuid",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetScoreInfoByPlayerGuid"],
    funcPath = "C_PvP.GetScoreInfoByPlayerGuid",
    params = { { name = "guid", type = "WOWGUID", default = nil } },
    returns = { { name = "info", type = "PVPScoreInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetSeasonBestInfo"] = {
    key = "C_PvP.GetSeasonBestInfo",
    name = "GetSeasonBestInfo",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetSeasonBestInfo"],
    funcPath = "C_PvP.GetSeasonBestInfo",
    params = {  },
    returns = { { name = "tierID", type = "number", canBeSecret = false }, { name = "nextTierID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetSkirmishInfo"] = {
    key = "C_PvP.GetSkirmishInfo",
    name = "GetSkirmishInfo",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetSkirmishInfo"],
    funcPath = "C_PvP.GetSkirmishInfo",
    params = { { name = "pvpBracket", type = "number", default = nil } },
    returns = { { name = "battlemasterListInfo", type = "BattlemasterListInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetSpecialEventBrawlInfo"] = {
    key = "C_PvP.GetSpecialEventBrawlInfo",
    name = "GetSpecialEventBrawlInfo",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetSpecialEventBrawlInfo"],
    funcPath = "C_PvP.GetSpecialEventBrawlInfo",
    params = {  },
    returns = { { name = "brawlInfo", type = "PvpBrawlInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetTeamInfo"] = {
    key = "C_PvP.GetTeamInfo",
    name = "GetTeamInfo",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetTeamInfo"],
    funcPath = "C_PvP.GetTeamInfo",
    params = { { name = "factionIndex", type = "number", default = nil } },
    returns = { { name = "info", type = "PVPTeamInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.GetTrainingGrounds"] = {
    key = "C_PvP.GetTrainingGrounds",
    name = "GetTrainingGrounds",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetTrainingGrounds"],
    funcPath = "C_PvP.GetTrainingGrounds",
    params = {  },
    returns = { { name = "trainingGrounds", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetUIDisplaySeason"] = {
    key = "C_PvP.GetUIDisplaySeason",
    name = "GetUIDisplaySeason",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetUIDisplaySeason"],
    funcPath = "C_PvP.GetUIDisplaySeason",
    params = {  },
    returns = { { name = "uiDisplaySeason", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetWarModeRewardBonus"] = {
    key = "C_PvP.GetWarModeRewardBonus",
    name = "GetWarModeRewardBonus",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetWarModeRewardBonus"],
    funcPath = "C_PvP.GetWarModeRewardBonus",
    params = {  },
    returns = { { name = "rewardBonus", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetWarModeRewardBonusDefault"] = {
    key = "C_PvP.GetWarModeRewardBonusDefault",
    name = "GetWarModeRewardBonusDefault",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetWarModeRewardBonusDefault"],
    funcPath = "C_PvP.GetWarModeRewardBonusDefault",
    params = {  },
    returns = { { name = "defaultBonus", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetWeeklyChestInfo"] = {
    key = "C_PvP.GetWeeklyChestInfo",
    name = "GetWeeklyChestInfo",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetWeeklyChestInfo"],
    funcPath = "C_PvP.GetWeeklyChestInfo",
    params = {  },
    returns = { { name = "rewardAchieved", type = "bool", canBeSecret = false }, { name = "lastWeekRewardAchieved", type = "bool", canBeSecret = false }, { name = "lastWeekRewardClaimed", type = "bool", canBeSecret = false }, { name = "pvpTierMaxFromWins", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.GetZonePVPInfo"] = {
    key = "C_PvP.GetZonePVPInfo",
    name = "GetZonePVPInfo",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["GetZonePVPInfo"],
    funcPath = "C_PvP.GetZonePVPInfo",
    params = {  },
    returns = { { name = "pvpType", type = "cstring", canBeSecret = false }, { name = "isSubZonePvP", type = "bool", canBeSecret = false }, { name = "factionName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.HasArenaSkirmishWinToday"] = {
    key = "C_PvP.HasArenaSkirmishWinToday",
    name = "HasArenaSkirmishWinToday",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["HasArenaSkirmishWinToday"],
    funcPath = "C_PvP.HasArenaSkirmishWinToday",
    params = {  },
    returns = { { name = "hasArenaSkirmishWinToday", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.HasMatchStarted"] = {
    key = "C_PvP.HasMatchStarted",
    name = "HasMatchStarted",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["HasMatchStarted"],
    funcPath = "C_PvP.HasMatchStarted",
    params = {  },
    returns = { { name = "hasStarted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.HasRandomTrainingGroundWinToday"] = {
    key = "C_PvP.HasRandomTrainingGroundWinToday",
    name = "HasRandomTrainingGroundWinToday",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["HasRandomTrainingGroundWinToday"],
    funcPath = "C_PvP.HasRandomTrainingGroundWinToday",
    params = {  },
    returns = { { name = "hasRandomTrainingGroundWinToday", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsActiveBattlefield"] = {
    key = "C_PvP.IsActiveBattlefield",
    name = "IsActiveBattlefield",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsActiveBattlefield"],
    funcPath = "C_PvP.IsActiveBattlefield",
    params = {  },
    returns = { { name = "isActiveBattlefield", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsActiveMatchRegistered"] = {
    key = "C_PvP.IsActiveMatchRegistered",
    name = "IsActiveMatchRegistered",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsActiveMatchRegistered"],
    funcPath = "C_PvP.IsActiveMatchRegistered",
    params = {  },
    returns = { { name = "registered", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsArena"] = {
    key = "C_PvP.IsArena",
    name = "IsArena",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsArena"],
    funcPath = "C_PvP.IsArena",
    params = {  },
    returns = { { name = "isArena", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsBattleground"] = {
    key = "C_PvP.IsBattleground",
    name = "IsBattleground",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsBattleground"],
    funcPath = "C_PvP.IsBattleground",
    params = {  },
    returns = { { name = "isBattleground", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsBattlegroundEnlistmentBonusActive"] = {
    key = "C_PvP.IsBattlegroundEnlistmentBonusActive",
    name = "IsBattlegroundEnlistmentBonusActive",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsBattlegroundEnlistmentBonusActive"],
    funcPath = "C_PvP.IsBattlegroundEnlistmentBonusActive",
    params = {  },
    returns = { { name = "battlegroundActive", type = "bool", canBeSecret = false }, { name = "brawlActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsBrawlSoloRBG"] = {
    key = "C_PvP.IsBrawlSoloRBG",
    name = "IsBrawlSoloRBG",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsBrawlSoloRBG"],
    funcPath = "C_PvP.IsBrawlSoloRBG",
    params = {  },
    returns = { { name = "isBrawlSoloRBG", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsBrawlSoloShuffle"] = {
    key = "C_PvP.IsBrawlSoloShuffle",
    name = "IsBrawlSoloShuffle",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsBrawlSoloShuffle"],
    funcPath = "C_PvP.IsBrawlSoloShuffle",
    params = {  },
    returns = { { name = "isBrawlSoloShuffle", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsInBrawl"] = {
    key = "C_PvP.IsInBrawl",
    name = "IsInBrawl",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsInBrawl"],
    funcPath = "C_PvP.IsInBrawl",
    params = {  },
    returns = { { name = "isInBrawl", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsInRatedMatchWithDeserterPenalty"] = {
    key = "C_PvP.IsInRatedMatchWithDeserterPenalty",
    name = "IsInRatedMatchWithDeserterPenalty",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsInRatedMatchWithDeserterPenalty"],
    funcPath = "C_PvP.IsInRatedMatchWithDeserterPenalty",
    params = {  },
    returns = { { name = "isInRatedMatchWithDeserterPenalty", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsMatchActive"] = {
    key = "C_PvP.IsMatchActive",
    name = "IsMatchActive",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsMatchActive"],
    funcPath = "C_PvP.IsMatchActive",
    params = {  },
    returns = { { name = "isActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsMatchComplete"] = {
    key = "C_PvP.IsMatchComplete",
    name = "IsMatchComplete",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsMatchComplete"],
    funcPath = "C_PvP.IsMatchComplete",
    params = {  },
    returns = { { name = "isComplete", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsMatchConsideredArena"] = {
    key = "C_PvP.IsMatchConsideredArena",
    name = "IsMatchConsideredArena",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsMatchConsideredArena"],
    funcPath = "C_PvP.IsMatchConsideredArena",
    params = {  },
    returns = { { name = "asArena", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsMatchFactional"] = {
    key = "C_PvP.IsMatchFactional",
    name = "IsMatchFactional",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsMatchFactional"],
    funcPath = "C_PvP.IsMatchFactional",
    params = {  },
    returns = { { name = "isFactional", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsPVPMap"] = {
    key = "C_PvP.IsPVPMap",
    name = "IsPVPMap",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsPVPMap"],
    funcPath = "C_PvP.IsPVPMap",
    params = {  },
    returns = { { name = "isPVPMap", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsRatedArena"] = {
    key = "C_PvP.IsRatedArena",
    name = "IsRatedArena",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsRatedArena"],
    funcPath = "C_PvP.IsRatedArena",
    params = {  },
    returns = { { name = "isRatedArena", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsRatedBattleground"] = {
    key = "C_PvP.IsRatedBattleground",
    name = "IsRatedBattleground",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsRatedBattleground"],
    funcPath = "C_PvP.IsRatedBattleground",
    params = {  },
    returns = { { name = "isRatedBattleground", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsRatedMap"] = {
    key = "C_PvP.IsRatedMap",
    name = "IsRatedMap",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsRatedMap"],
    funcPath = "C_PvP.IsRatedMap",
    params = {  },
    returns = { { name = "isRatedMap", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsRatedSoloRBG"] = {
    key = "C_PvP.IsRatedSoloRBG",
    name = "IsRatedSoloRBG",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsRatedSoloRBG"],
    funcPath = "C_PvP.IsRatedSoloRBG",
    params = {  },
    returns = { { name = "isRatedSoloRBG", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsRatedSoloShuffle"] = {
    key = "C_PvP.IsRatedSoloShuffle",
    name = "IsRatedSoloShuffle",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsRatedSoloShuffle"],
    funcPath = "C_PvP.IsRatedSoloShuffle",
    params = {  },
    returns = { { name = "isRatedSoloShuffle", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsSoloRBG"] = {
    key = "C_PvP.IsSoloRBG",
    name = "IsSoloRBG",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsSoloRBG"],
    funcPath = "C_PvP.IsSoloRBG",
    params = {  },
    returns = { { name = "isSoloRBG", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsSoloShuffle"] = {
    key = "C_PvP.IsSoloShuffle",
    name = "IsSoloShuffle",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsSoloShuffle"],
    funcPath = "C_PvP.IsSoloShuffle",
    params = {  },
    returns = { { name = "isSoloShuffle", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsSubZonePVPPOI"] = {
    key = "C_PvP.IsSubZonePVPPOI",
    name = "IsSubZonePVPPOI",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsSubZonePVPPOI"],
    funcPath = "C_PvP.IsSubZonePVPPOI",
    params = {  },
    returns = { { name = "result", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsWarModeActive"] = {
    key = "C_PvP.IsWarModeActive",
    name = "IsWarModeActive",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsWarModeActive"],
    funcPath = "C_PvP.IsWarModeActive",
    params = {  },
    returns = { { name = "warModeActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsWarModeDesired"] = {
    key = "C_PvP.IsWarModeDesired",
    name = "IsWarModeDesired",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsWarModeDesired"],
    funcPath = "C_PvP.IsWarModeDesired",
    params = {  },
    returns = { { name = "warModeDesired", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.IsWarModeFeatureEnabled"] = {
    key = "C_PvP.IsWarModeFeatureEnabled",
    name = "IsWarModeFeatureEnabled",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["IsWarModeFeatureEnabled"],
    funcPath = "C_PvP.IsWarModeFeatureEnabled",
    params = {  },
    returns = { { name = "warModeEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.JoinBattlefield"] = {
    key = "C_PvP.JoinBattlefield",
    name = "JoinBattlefield",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["JoinBattlefield"],
    funcPath = "C_PvP.JoinBattlefield",
    params = { { name = "battlemasterListId", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.JoinBrawl"] = {
    key = "C_PvP.JoinBrawl",
    name = "JoinBrawl",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["JoinBrawl"],
    funcPath = "C_PvP.JoinBrawl",
    params = { { name = "isSpecialBrawl", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.JoinRatedBGBlitz"] = {
    key = "C_PvP.JoinRatedBGBlitz",
    name = "JoinRatedBGBlitz",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["JoinRatedBGBlitz"],
    funcPath = "C_PvP.JoinRatedBGBlitz",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.JoinTrainingGround"] = {
    key = "C_PvP.JoinTrainingGround",
    name = "JoinTrainingGround",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["JoinTrainingGround"],
    funcPath = "C_PvP.JoinTrainingGround",
    params = { { name = "trainingGroundID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.RequestCrowdControlSpell"] = {
    key = "C_PvP.RequestCrowdControlSpell",
    name = "RequestCrowdControlSpell",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["RequestCrowdControlSpell"],
    funcPath = "C_PvP.RequestCrowdControlSpell",
    params = { { name = "playerToken", type = "UnitToken", default = "player" } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.SetPVP"] = {
    key = "C_PvP.SetPVP",
    name = "SetPVP",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["SetPVP"],
    funcPath = "C_PvP.SetPVP",
    params = { { name = "enablePVP", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.SetWarModeDesired"] = {
    key = "C_PvP.SetWarModeDesired",
    name = "SetWarModeDesired",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["SetWarModeDesired"],
    funcPath = "C_PvP.SetWarModeDesired",
    params = { { name = "warModeDesired", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.StartSoloRBGWarGameByName"] = {
    key = "C_PvP.StartSoloRBGWarGameByName",
    name = "StartSoloRBGWarGameByName",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["StartSoloRBGWarGameByName"],
    funcPath = "C_PvP.StartSoloRBGWarGameByName",
    params = { { name = "args", type = "cstring", default = nil } },
    returns = { { name = "success", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.StartSpectatorSoloRBGWarGame"] = {
    key = "C_PvP.StartSpectatorSoloRBGWarGame",
    name = "StartSpectatorSoloRBGWarGame",
    category = "combat_midnight",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["StartSpectatorSoloRBGWarGame"],
    funcPath = "C_PvP.StartSpectatorSoloRBGWarGame",
    params = { { name = "opaqueID1", type = "number", default = nil }, { name = "opaqueID2", type = "number", default = nil }, { name = "specifiedMap", type = "cstring", default = nil }, { name = "tournamentRules", type = "bool", default = nil } },
    returns = { { name = "success", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.TogglePVP"] = {
    key = "C_PvP.TogglePVP",
    name = "TogglePVP",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["TogglePVP"],
    funcPath = "C_PvP.TogglePVP",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PvP.ToggleWarMode"] = {
    key = "C_PvP.ToggleWarMode",
    name = "ToggleWarMode",
    category = "general",
    subcategory = "c_pvp",
    func = _G["C_PvP"] and _G["C_PvP"]["ToggleWarMode"],
    funcPath = "C_PvP.ToggleWarMode",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

-- Generated APIDefinitions for namespace: C_Commentator
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Commentator.AddPlayerOverrideName"] = {
    key = "C_Commentator.AddPlayerOverrideName",
    name = "AddPlayerOverrideName",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["AddPlayerOverrideName"],
    funcPath = "C_Commentator.AddPlayerOverrideName",
    params = { { name = "playerName", type = "string", default = nil }, { name = "overrideName", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.AddTrackedDefensiveAuras"] = {
    key = "C_Commentator.AddTrackedDefensiveAuras",
    name = "AddTrackedDefensiveAuras",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["AddTrackedDefensiveAuras"],
    funcPath = "C_Commentator.AddTrackedDefensiveAuras",
    params = { { name = "spellIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.AddTrackedOffensiveAuras"] = {
    key = "C_Commentator.AddTrackedOffensiveAuras",
    name = "AddTrackedOffensiveAuras",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["AddTrackedOffensiveAuras"],
    funcPath = "C_Commentator.AddTrackedOffensiveAuras",
    params = { { name = "spellIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.AreTeamsSwapped"] = {
    key = "C_Commentator.AreTeamsSwapped",
    name = "AreTeamsSwapped",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["AreTeamsSwapped"],
    funcPath = "C_Commentator.AreTeamsSwapped",
    params = {  },
    returns = { { name = "teamsAreSwapped", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.AssignPlayerToTeam"] = {
    key = "C_Commentator.AssignPlayerToTeam",
    name = "AssignPlayerToTeam",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["AssignPlayerToTeam"],
    funcPath = "C_Commentator.AssignPlayerToTeam",
    params = { { name = "playerName", type = "string", default = nil }, { name = "teamName", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.AssignPlayersToTeam"] = {
    key = "C_Commentator.AssignPlayersToTeam",
    name = "AssignPlayersToTeam",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["AssignPlayersToTeam"],
    funcPath = "C_Commentator.AssignPlayersToTeam",
    params = { { name = "playerName", type = "table", default = nil }, { name = "teamName", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.AssignPlayersToTeamInCurrentInstance"] = {
    key = "C_Commentator.AssignPlayersToTeamInCurrentInstance",
    name = "AssignPlayersToTeamInCurrentInstance",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["AssignPlayersToTeamInCurrentInstance"],
    funcPath = "C_Commentator.AssignPlayersToTeamInCurrentInstance",
    params = { { name = "teamIndex", type = "luaIndex", default = nil }, { name = "teamName", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.CanUseCommentatorCheats"] = {
    key = "C_Commentator.CanUseCommentatorCheats",
    name = "CanUseCommentatorCheats",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["CanUseCommentatorCheats"],
    funcPath = "C_Commentator.CanUseCommentatorCheats",
    params = {  },
    returns = { { name = "canUseCommentatorCheats", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.ClearCameraTarget"] = {
    key = "C_Commentator.ClearCameraTarget",
    name = "ClearCameraTarget",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["ClearCameraTarget"],
    funcPath = "C_Commentator.ClearCameraTarget",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.ClearFollowTarget"] = {
    key = "C_Commentator.ClearFollowTarget",
    name = "ClearFollowTarget",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["ClearFollowTarget"],
    funcPath = "C_Commentator.ClearFollowTarget",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.ClearLookAtTarget"] = {
    key = "C_Commentator.ClearLookAtTarget",
    name = "ClearLookAtTarget",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["ClearLookAtTarget"],
    funcPath = "C_Commentator.ClearLookAtTarget",
    params = { { name = "lookAtIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.EnterInstance"] = {
    key = "C_Commentator.EnterInstance",
    name = "EnterInstance",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["EnterInstance"],
    funcPath = "C_Commentator.EnterInstance",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.ExitInstance"] = {
    key = "C_Commentator.ExitInstance",
    name = "ExitInstance",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["ExitInstance"],
    funcPath = "C_Commentator.ExitInstance",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.FindSpectatedUnit"] = {
    key = "C_Commentator.FindSpectatedUnit",
    name = "FindSpectatedUnit",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["FindSpectatedUnit"],
    funcPath = "C_Commentator.FindSpectatedUnit",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "playerIndex", type = "luaIndex", canBeSecret = false }, { name = "teamIndex", type = "luaIndex", canBeSecret = false }, { name = "isPet", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.FindTeamNameInCurrentInstance"] = {
    key = "C_Commentator.FindTeamNameInCurrentInstance",
    name = "FindTeamNameInCurrentInstance",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["FindTeamNameInCurrentInstance"],
    funcPath = "C_Commentator.FindTeamNameInCurrentInstance",
    params = { { name = "teamIndex", type = "luaIndex", default = nil } },
    returns = { { name = "teamName", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.FindTeamNameInDirectory"] = {
    key = "C_Commentator.FindTeamNameInDirectory",
    name = "FindTeamNameInDirectory",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["FindTeamNameInDirectory"],
    funcPath = "C_Commentator.FindTeamNameInDirectory",
    params = { { name = "playerNames", type = "table", default = nil } },
    returns = { { name = "teamName", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.FlushCommentatorHistory"] = {
    key = "C_Commentator.FlushCommentatorHistory",
    name = "FlushCommentatorHistory",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["FlushCommentatorHistory"],
    funcPath = "C_Commentator.FlushCommentatorHistory",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.FollowPlayer"] = {
    key = "C_Commentator.FollowPlayer",
    name = "FollowPlayer",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["FollowPlayer"],
    funcPath = "C_Commentator.FollowPlayer",
    params = { { name = "factionIndex", type = "luaIndex", default = nil }, { name = "playerIndex", type = "luaIndex", default = nil }, { name = "forceInstantTransition", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.FollowUnit"] = {
    key = "C_Commentator.FollowUnit",
    name = "FollowUnit",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["FollowUnit"],
    funcPath = "C_Commentator.FollowUnit",
    params = { { name = "token", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.ForceFollowTransition"] = {
    key = "C_Commentator.ForceFollowTransition",
    name = "ForceFollowTransition",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["ForceFollowTransition"],
    funcPath = "C_Commentator.ForceFollowTransition",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetAdditionalCameraWeight"] = {
    key = "C_Commentator.GetAdditionalCameraWeight",
    name = "GetAdditionalCameraWeight",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetAdditionalCameraWeight"],
    funcPath = "C_Commentator.GetAdditionalCameraWeight",
    params = {  },
    returns = { { name = "teamIndex", type = "luaIndex", canBeSecret = false }, { name = "playerIndex", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetAdditionalCameraWeightByToken"] = {
    key = "C_Commentator.GetAdditionalCameraWeightByToken",
    name = "GetAdditionalCameraWeightByToken",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetAdditionalCameraWeightByToken"],
    funcPath = "C_Commentator.GetAdditionalCameraWeightByToken",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "weight", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetAllPlayerOverrideNames"] = {
    key = "C_Commentator.GetAllPlayerOverrideNames",
    name = "GetAllPlayerOverrideNames",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetAllPlayerOverrideNames"],
    funcPath = "C_Commentator.GetAllPlayerOverrideNames",
    params = {  },
    returns = { { name = "nameEntries", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetCamera"] = {
    key = "C_Commentator.GetCamera",
    name = "GetCamera",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetCamera"],
    funcPath = "C_Commentator.GetCamera",
    params = {  },
    returns = { { name = "xPos", type = "number", canBeSecret = false }, { name = "yPos", type = "number", canBeSecret = false }, { name = "zPos", type = "number", canBeSecret = false }, { name = "yaw", type = "number", canBeSecret = false }, { name = "pitch", type = "number", canBeSecret = false }, { name = "roll", type = "number", canBeSecret = false }, { name = "fov", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetCameraCollision"] = {
    key = "C_Commentator.GetCameraCollision",
    name = "GetCameraCollision",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetCameraCollision"],
    funcPath = "C_Commentator.GetCameraCollision",
    params = {  },
    returns = { { name = "isColliding", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetCameraPosition"] = {
    key = "C_Commentator.GetCameraPosition",
    name = "GetCameraPosition",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetCameraPosition"],
    funcPath = "C_Commentator.GetCameraPosition",
    params = {  },
    returns = { { name = "xPos", type = "number", canBeSecret = false }, { name = "yPos", type = "number", canBeSecret = false }, { name = "zPos", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetCombatEventInfo"] = {
    key = "C_Commentator.GetCombatEventInfo",
    name = "GetCombatEventInfo",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetCombatEventInfo"],
    funcPath = "C_Commentator.GetCombatEventInfo",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetCommentatorHistory"] = {
    key = "C_Commentator.GetCommentatorHistory",
    name = "GetCommentatorHistory",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetCommentatorHistory"],
    funcPath = "C_Commentator.GetCommentatorHistory",
    params = {  },
    returns = { { name = "history", type = "CommentatorHistory", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetCurrentMapID"] = {
    key = "C_Commentator.GetCurrentMapID",
    name = "GetCurrentMapID",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetCurrentMapID"],
    funcPath = "C_Commentator.GetCurrentMapID",
    params = {  },
    returns = { { name = "mapID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetDampeningPercent"] = {
    key = "C_Commentator.GetDampeningPercent",
    name = "GetDampeningPercent",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetDampeningPercent"],
    funcPath = "C_Commentator.GetDampeningPercent",
    params = {  },
    returns = { { name = "percentage", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetDistanceBeforeForcedHorizontalConvergence"] = {
    key = "C_Commentator.GetDistanceBeforeForcedHorizontalConvergence",
    name = "GetDistanceBeforeForcedHorizontalConvergence",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetDistanceBeforeForcedHorizontalConvergence"],
    funcPath = "C_Commentator.GetDistanceBeforeForcedHorizontalConvergence",
    params = {  },
    returns = { { name = "distance", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetDurationToForceHorizontalConvergence"] = {
    key = "C_Commentator.GetDurationToForceHorizontalConvergence",
    name = "GetDurationToForceHorizontalConvergence",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetDurationToForceHorizontalConvergence"],
    funcPath = "C_Commentator.GetDurationToForceHorizontalConvergence",
    params = {  },
    returns = { { name = "ms", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetExcludeDistance"] = {
    key = "C_Commentator.GetExcludeDistance",
    name = "GetExcludeDistance",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetExcludeDistance"],
    funcPath = "C_Commentator.GetExcludeDistance",
    params = {  },
    returns = { { name = "excludeDistance", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetHardlockWeight"] = {
    key = "C_Commentator.GetHardlockWeight",
    name = "GetHardlockWeight",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetHardlockWeight"],
    funcPath = "C_Commentator.GetHardlockWeight",
    params = {  },
    returns = { { name = "weight", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetHorizontalAngleThresholdToSmooth"] = {
    key = "C_Commentator.GetHorizontalAngleThresholdToSmooth",
    name = "GetHorizontalAngleThresholdToSmooth",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetHorizontalAngleThresholdToSmooth"],
    funcPath = "C_Commentator.GetHorizontalAngleThresholdToSmooth",
    params = {  },
    returns = { { name = "angle", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetIndirectSpellID"] = {
    key = "C_Commentator.GetIndirectSpellID",
    name = "GetIndirectSpellID",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetIndirectSpellID"],
    funcPath = "C_Commentator.GetIndirectSpellID",
    params = { { name = "trackedSpellID", type = "number", default = nil } },
    returns = { { name = "indirectSpellID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetInstanceInfo"] = {
    key = "C_Commentator.GetInstanceInfo",
    name = "GetInstanceInfo",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetInstanceInfo"],
    funcPath = "C_Commentator.GetInstanceInfo",
    params = { { name = "mapIndex", type = "luaIndex", default = nil }, { name = "instanceIndex", type = "luaIndex", default = nil } },
    returns = { { name = "mapID", type = "number", canBeSecret = false }, { name = "mapName", type = "string", canBeSecret = false }, { name = "status", type = "number", canBeSecret = false }, { name = "instanceIDLow", type = "number", canBeSecret = false }, { name = "instanceIDHigh", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetLookAtLerpAmount"] = {
    key = "C_Commentator.GetLookAtLerpAmount",
    name = "GetLookAtLerpAmount",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetLookAtLerpAmount"],
    funcPath = "C_Commentator.GetLookAtLerpAmount",
    params = {  },
    returns = { { name = "amount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetMapInfo"] = {
    key = "C_Commentator.GetMapInfo",
    name = "GetMapInfo",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetMapInfo"],
    funcPath = "C_Commentator.GetMapInfo",
    params = { { name = "mapIndex", type = "luaIndex", default = nil } },
    returns = { { name = "teamSize", type = "number", canBeSecret = false }, { name = "minLevel", type = "number", canBeSecret = false }, { name = "maxLevel", type = "number", canBeSecret = false }, { name = "numInstances", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetMatchDuration"] = {
    key = "C_Commentator.GetMatchDuration",
    name = "GetMatchDuration",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetMatchDuration"],
    funcPath = "C_Commentator.GetMatchDuration",
    params = {  },
    returns = { { name = "seconds", type = "time_t", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetMaxNumPlayersPerTeam"] = {
    key = "C_Commentator.GetMaxNumPlayersPerTeam",
    name = "GetMaxNumPlayersPerTeam",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetMaxNumPlayersPerTeam"],
    funcPath = "C_Commentator.GetMaxNumPlayersPerTeam",
    params = {  },
    returns = { { name = "maxNumPlayersPerTeam", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetMaxNumTeams"] = {
    key = "C_Commentator.GetMaxNumTeams",
    name = "GetMaxNumTeams",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetMaxNumTeams"],
    funcPath = "C_Commentator.GetMaxNumTeams",
    params = {  },
    returns = { { name = "maxNumTeams", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetMode"] = {
    key = "C_Commentator.GetMode",
    name = "GetMode",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetMode"],
    funcPath = "C_Commentator.GetMode",
    params = {  },
    returns = { { name = "commentatorMode", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetMsToHoldForHorizontalMovement"] = {
    key = "C_Commentator.GetMsToHoldForHorizontalMovement",
    name = "GetMsToHoldForHorizontalMovement",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetMsToHoldForHorizontalMovement"],
    funcPath = "C_Commentator.GetMsToHoldForHorizontalMovement",
    params = {  },
    returns = { { name = "ms", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetMsToHoldForVerticalMovement"] = {
    key = "C_Commentator.GetMsToHoldForVerticalMovement",
    name = "GetMsToHoldForVerticalMovement",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetMsToHoldForVerticalMovement"],
    funcPath = "C_Commentator.GetMsToHoldForVerticalMovement",
    params = {  },
    returns = { { name = "ms", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetMsToSmoothHorizontalChange"] = {
    key = "C_Commentator.GetMsToSmoothHorizontalChange",
    name = "GetMsToSmoothHorizontalChange",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetMsToSmoothHorizontalChange"],
    funcPath = "C_Commentator.GetMsToSmoothHorizontalChange",
    params = {  },
    returns = { { name = "ms", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetMsToSmoothVerticalChange"] = {
    key = "C_Commentator.GetMsToSmoothVerticalChange",
    name = "GetMsToSmoothVerticalChange",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetMsToSmoothVerticalChange"],
    funcPath = "C_Commentator.GetMsToSmoothVerticalChange",
    params = {  },
    returns = { { name = "ms", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetNumMaps"] = {
    key = "C_Commentator.GetNumMaps",
    name = "GetNumMaps",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetNumMaps"],
    funcPath = "C_Commentator.GetNumMaps",
    params = {  },
    returns = { { name = "numMaps", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetNumPlayers"] = {
    key = "C_Commentator.GetNumPlayers",
    name = "GetNumPlayers",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetNumPlayers"],
    funcPath = "C_Commentator.GetNumPlayers",
    params = { { name = "factionIndex", type = "luaIndex", default = nil } },
    returns = { { name = "numPlayers", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetOrCreateSeries"] = {
    key = "C_Commentator.GetOrCreateSeries",
    name = "GetOrCreateSeries",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetOrCreateSeries"],
    funcPath = "C_Commentator.GetOrCreateSeries",
    params = { { name = "teamName1", type = "string", default = nil }, { name = "teamName2", type = "string", default = nil } },
    returns = { { name = "data", type = "CommentatorSeries", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetPlayerAuraInfo"] = {
    key = "C_Commentator.GetPlayerAuraInfo",
    name = "GetPlayerAuraInfo",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetPlayerAuraInfo"],
    funcPath = "C_Commentator.GetPlayerAuraInfo",
    params = { { name = "teamIndex", type = "luaIndex", default = nil }, { name = "playerIndex", type = "luaIndex", default = nil }, { name = "spellID", type = "number", default = nil } },
    returns = { { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false }, { name = "enable", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetPlayerAuraInfoByUnit"] = {
    key = "C_Commentator.GetPlayerAuraInfoByUnit",
    name = "GetPlayerAuraInfoByUnit",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetPlayerAuraInfoByUnit"],
    funcPath = "C_Commentator.GetPlayerAuraInfoByUnit",
    params = { { name = "token", type = "UnitToken", default = "player" }, { name = "spellID", type = "number", default = nil } },
    returns = { { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false }, { name = "enable", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetPlayerCooldownInfo"] = {
    key = "C_Commentator.GetPlayerCooldownInfo",
    name = "GetPlayerCooldownInfo",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetPlayerCooldownInfo"],
    funcPath = "C_Commentator.GetPlayerCooldownInfo",
    params = { { name = "teamIndex", type = "luaIndex", default = nil }, { name = "playerIndex", type = "luaIndex", default = nil }, { name = "spellID", type = "number", default = nil } },
    returns = { { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false }, { name = "enable", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetPlayerCooldownInfoByUnit"] = {
    key = "C_Commentator.GetPlayerCooldownInfoByUnit",
    name = "GetPlayerCooldownInfoByUnit",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetPlayerCooldownInfoByUnit"],
    funcPath = "C_Commentator.GetPlayerCooldownInfoByUnit",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "spellID", type = "number", default = nil } },
    returns = { { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false }, { name = "enable", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetPlayerCrowdControlInfo"] = {
    key = "C_Commentator.GetPlayerCrowdControlInfo",
    name = "GetPlayerCrowdControlInfo",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetPlayerCrowdControlInfo"],
    funcPath = "C_Commentator.GetPlayerCrowdControlInfo",
    params = { { name = "teamIndex", type = "luaIndex", default = nil }, { name = "playerIndex", type = "luaIndex", default = nil } },
    returns = { { name = "spellID", type = "number", canBeSecret = false }, { name = "expiration", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetPlayerCrowdControlInfoByUnit"] = {
    key = "C_Commentator.GetPlayerCrowdControlInfoByUnit",
    name = "GetPlayerCrowdControlInfoByUnit",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetPlayerCrowdControlInfoByUnit"],
    funcPath = "C_Commentator.GetPlayerCrowdControlInfoByUnit",
    params = { { name = "token", type = "UnitToken", default = "player" } },
    returns = { { name = "spellID", type = "number", canBeSecret = false }, { name = "expiration", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetPlayerData"] = {
    key = "C_Commentator.GetPlayerData",
    name = "GetPlayerData",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetPlayerData"],
    funcPath = "C_Commentator.GetPlayerData",
    params = { { name = "teamIndex", type = "luaIndex", default = nil }, { name = "playerIndex", type = "luaIndex", default = nil } },
    returns = { { name = "info", type = "CommentatorPlayerData", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetPlayerFlagInfo"] = {
    key = "C_Commentator.GetPlayerFlagInfo",
    name = "GetPlayerFlagInfo",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetPlayerFlagInfo"],
    funcPath = "C_Commentator.GetPlayerFlagInfo",
    params = { { name = "teamIndex", type = "luaIndex", default = nil }, { name = "playerIndex", type = "luaIndex", default = nil } },
    returns = { { name = "hasFlag", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetPlayerFlagInfoByUnit"] = {
    key = "C_Commentator.GetPlayerFlagInfoByUnit",
    name = "GetPlayerFlagInfoByUnit",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetPlayerFlagInfoByUnit"],
    funcPath = "C_Commentator.GetPlayerFlagInfoByUnit",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "hasFlag", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetPlayerItemCooldownInfo"] = {
    key = "C_Commentator.GetPlayerItemCooldownInfo",
    name = "GetPlayerItemCooldownInfo",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetPlayerItemCooldownInfo"],
    funcPath = "C_Commentator.GetPlayerItemCooldownInfo",
    params = { { name = "teamIndex", type = "luaIndex", default = nil }, { name = "playerIndex", type = "luaIndex", default = nil }, { name = "itemID", type = "number", default = nil } },
    returns = { { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false }, { name = "enable", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetPlayerItemCooldownInfoByUnit"] = {
    key = "C_Commentator.GetPlayerItemCooldownInfoByUnit",
    name = "GetPlayerItemCooldownInfoByUnit",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetPlayerItemCooldownInfoByUnit"],
    funcPath = "C_Commentator.GetPlayerItemCooldownInfoByUnit",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "itemID", type = "number", default = nil } },
    returns = { { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false }, { name = "enable", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetPlayerOverrideName"] = {
    key = "C_Commentator.GetPlayerOverrideName",
    name = "GetPlayerOverrideName",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetPlayerOverrideName"],
    funcPath = "C_Commentator.GetPlayerOverrideName",
    params = { { name = "originalName", type = "string", default = nil } },
    returns = { { name = "overrideName", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetPlayerSpellCharges"] = {
    key = "C_Commentator.GetPlayerSpellCharges",
    name = "GetPlayerSpellCharges",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetPlayerSpellCharges"],
    funcPath = "C_Commentator.GetPlayerSpellCharges",
    params = { { name = "teamIndex", type = "luaIndex", default = nil }, { name = "playerIndex", type = "luaIndex", default = nil }, { name = "spellID", type = "number", default = nil } },
    returns = { { name = "charges", type = "number", canBeSecret = false }, { name = "maxCharges", type = "number", canBeSecret = false }, { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetPlayerSpellChargesByUnit"] = {
    key = "C_Commentator.GetPlayerSpellChargesByUnit",
    name = "GetPlayerSpellChargesByUnit",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetPlayerSpellChargesByUnit"],
    funcPath = "C_Commentator.GetPlayerSpellChargesByUnit",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "spellID", type = "number", default = nil } },
    returns = { { name = "charges", type = "number", canBeSecret = false }, { name = "maxCharges", type = "number", canBeSecret = false }, { name = "startTime", type = "number", canBeSecret = false }, { name = "duration", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetPositionLerpAmount"] = {
    key = "C_Commentator.GetPositionLerpAmount",
    name = "GetPositionLerpAmount",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetPositionLerpAmount"],
    funcPath = "C_Commentator.GetPositionLerpAmount",
    params = {  },
    returns = { { name = "amount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetSmoothFollowTransitioning"] = {
    key = "C_Commentator.GetSmoothFollowTransitioning",
    name = "GetSmoothFollowTransitioning",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetSmoothFollowTransitioning"],
    funcPath = "C_Commentator.GetSmoothFollowTransitioning",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetSoftlockWeight"] = {
    key = "C_Commentator.GetSoftlockWeight",
    name = "GetSoftlockWeight",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetSoftlockWeight"],
    funcPath = "C_Commentator.GetSoftlockWeight",
    params = {  },
    returns = { { name = "weight", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetSpeedFactor"] = {
    key = "C_Commentator.GetSpeedFactor",
    name = "GetSpeedFactor",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetSpeedFactor"],
    funcPath = "C_Commentator.GetSpeedFactor",
    params = {  },
    returns = { { name = "factor", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetStartLocation"] = {
    key = "C_Commentator.GetStartLocation",
    name = "GetStartLocation",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetStartLocation"],
    funcPath = "C_Commentator.GetStartLocation",
    params = { { name = "mapID", type = "number", default = nil } },
    returns = { { name = "pos", type = "vector3", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetTeamColor"] = {
    key = "C_Commentator.GetTeamColor",
    name = "GetTeamColor",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetTeamColor"],
    funcPath = "C_Commentator.GetTeamColor",
    params = { { name = "teamIndex", type = "luaIndex", default = nil } },
    returns = { { name = "color", type = "colorRGB", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetTeamColorByUnit"] = {
    key = "C_Commentator.GetTeamColorByUnit",
    name = "GetTeamColorByUnit",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetTeamColorByUnit"],
    funcPath = "C_Commentator.GetTeamColorByUnit",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "color", type = "colorRGB", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetTimeLeftInMatch"] = {
    key = "C_Commentator.GetTimeLeftInMatch",
    name = "GetTimeLeftInMatch",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetTimeLeftInMatch"],
    funcPath = "C_Commentator.GetTimeLeftInMatch",
    params = {  },
    returns = { { name = "timeLeft", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.GetTrackedSpellID"] = {
    key = "C_Commentator.GetTrackedSpellID",
    name = "GetTrackedSpellID",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetTrackedSpellID"],
    funcPath = "C_Commentator.GetTrackedSpellID",
    params = { { name = "indirectSpellID", type = "number", default = nil } },
    returns = { { name = "trackedSpellID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetTrackedSpells"] = {
    key = "C_Commentator.GetTrackedSpells",
    name = "GetTrackedSpells",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetTrackedSpells"],
    funcPath = "C_Commentator.GetTrackedSpells",
    params = { { name = "teamIndex", type = "luaIndex", default = nil }, { name = "playerIndex", type = "luaIndex", default = nil }, { name = "category", type = "TrackedSpellCategory", default = nil } },
    returns = { { name = "spells", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetTrackedSpellsByUnit"] = {
    key = "C_Commentator.GetTrackedSpellsByUnit",
    name = "GetTrackedSpellsByUnit",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetTrackedSpellsByUnit"],
    funcPath = "C_Commentator.GetTrackedSpellsByUnit",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "category", type = "TrackedSpellCategory", default = nil } },
    returns = { { name = "spells", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetUnitData"] = {
    key = "C_Commentator.GetUnitData",
    name = "GetUnitData",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetUnitData"],
    funcPath = "C_Commentator.GetUnitData",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "data", type = "CommentatorUnitData", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.GetWargameInfo"] = {
    key = "C_Commentator.GetWargameInfo",
    name = "GetWargameInfo",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["GetWargameInfo"],
    funcPath = "C_Commentator.GetWargameInfo",
    params = { { name = "listID", type = "number", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false }, { name = "minPlayers", type = "number", canBeSecret = false }, { name = "maxPlayers", type = "number", canBeSecret = false }, { name = "isArena", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.HasTrackedAuras"] = {
    key = "C_Commentator.HasTrackedAuras",
    name = "HasTrackedAuras",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["HasTrackedAuras"],
    funcPath = "C_Commentator.HasTrackedAuras",
    params = { { name = "token", type = "UnitToken", default = "player" } },
    returns = { { name = "hasOffensiveAura", type = "bool", canBeSecret = false }, { name = "hasDefensiveAura", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.IsSmartCameraLocked"] = {
    key = "C_Commentator.IsSmartCameraLocked",
    name = "IsSmartCameraLocked",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["IsSmartCameraLocked"],
    funcPath = "C_Commentator.IsSmartCameraLocked",
    params = {  },
    returns = { { name = "isSmartCameraLocked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.IsSpectating"] = {
    key = "C_Commentator.IsSpectating",
    name = "IsSpectating",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["IsSpectating"],
    funcPath = "C_Commentator.IsSpectating",
    params = {  },
    returns = { { name = "isSpectating", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.IsTrackedDefensiveAura"] = {
    key = "C_Commentator.IsTrackedDefensiveAura",
    name = "IsTrackedDefensiveAura",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["IsTrackedDefensiveAura"],
    funcPath = "C_Commentator.IsTrackedDefensiveAura",
    params = { { name = "spellID", type = "number", default = nil } },
    returns = { { name = "isDefensiveTrigger", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.IsTrackedOffensiveAura"] = {
    key = "C_Commentator.IsTrackedOffensiveAura",
    name = "IsTrackedOffensiveAura",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["IsTrackedOffensiveAura"],
    funcPath = "C_Commentator.IsTrackedOffensiveAura",
    params = { { name = "spellID", type = "number", default = nil } },
    returns = { { name = "isOffensiveTrigger", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.IsTrackedSpell"] = {
    key = "C_Commentator.IsTrackedSpell",
    name = "IsTrackedSpell",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["IsTrackedSpell"],
    funcPath = "C_Commentator.IsTrackedSpell",
    params = { { name = "teamIndex", type = "luaIndex", default = nil }, { name = "playerIndex", type = "luaIndex", default = nil }, { name = "spellID", type = "number", default = nil }, { name = "category", type = "TrackedSpellCategory", default = nil } },
    returns = { { name = "isTracked", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.IsTrackedSpellByUnit"] = {
    key = "C_Commentator.IsTrackedSpellByUnit",
    name = "IsTrackedSpellByUnit",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["IsTrackedSpellByUnit"],
    funcPath = "C_Commentator.IsTrackedSpellByUnit",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "spellID", type = "number", default = nil }, { name = "category", type = "TrackedSpellCategory", default = nil } },
    returns = { { name = "isTracked", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.IsUsingSmartCamera"] = {
    key = "C_Commentator.IsUsingSmartCamera",
    name = "IsUsingSmartCamera",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["IsUsingSmartCamera"],
    funcPath = "C_Commentator.IsUsingSmartCamera",
    params = {  },
    returns = { { name = "isUsingSmartCamera", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.LookAtPlayer"] = {
    key = "C_Commentator.LookAtPlayer",
    name = "LookAtPlayer",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["LookAtPlayer"],
    funcPath = "C_Commentator.LookAtPlayer",
    params = { { name = "factionIndex", type = "luaIndex", default = nil }, { name = "playerIndex", type = "luaIndex", default = nil }, { name = "lookAtIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.RemoveAllOverrideNames"] = {
    key = "C_Commentator.RemoveAllOverrideNames",
    name = "RemoveAllOverrideNames",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["RemoveAllOverrideNames"],
    funcPath = "C_Commentator.RemoveAllOverrideNames",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.RemovePlayerOverrideName"] = {
    key = "C_Commentator.RemovePlayerOverrideName",
    name = "RemovePlayerOverrideName",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["RemovePlayerOverrideName"],
    funcPath = "C_Commentator.RemovePlayerOverrideName",
    params = { { name = "originalPlayerName", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.RequestPlayerCooldownInfo"] = {
    key = "C_Commentator.RequestPlayerCooldownInfo",
    name = "RequestPlayerCooldownInfo",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["RequestPlayerCooldownInfo"],
    funcPath = "C_Commentator.RequestPlayerCooldownInfo",
    params = { { name = "teamIndex", type = "luaIndex", default = nil }, { name = "playerIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.ResetFoVTarget"] = {
    key = "C_Commentator.ResetFoVTarget",
    name = "ResetFoVTarget",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["ResetFoVTarget"],
    funcPath = "C_Commentator.ResetFoVTarget",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.ResetSeriesScores"] = {
    key = "C_Commentator.ResetSeriesScores",
    name = "ResetSeriesScores",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["ResetSeriesScores"],
    funcPath = "C_Commentator.ResetSeriesScores",
    params = { { name = "teamName1", type = "string", default = nil }, { name = "teamName2", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.ResetSettings"] = {
    key = "C_Commentator.ResetSettings",
    name = "ResetSettings",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["ResetSettings"],
    funcPath = "C_Commentator.ResetSettings",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.ResetTrackedAuras"] = {
    key = "C_Commentator.ResetTrackedAuras",
    name = "ResetTrackedAuras",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["ResetTrackedAuras"],
    funcPath = "C_Commentator.ResetTrackedAuras",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.SetAdditionalCameraWeight"] = {
    key = "C_Commentator.SetAdditionalCameraWeight",
    name = "SetAdditionalCameraWeight",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetAdditionalCameraWeight"],
    funcPath = "C_Commentator.SetAdditionalCameraWeight",
    params = { { name = "teamIndex", type = "luaIndex", default = nil }, { name = "playerIndex", type = "luaIndex", default = nil }, { name = "weight", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetAdditionalCameraWeightByToken"] = {
    key = "C_Commentator.SetAdditionalCameraWeightByToken",
    name = "SetAdditionalCameraWeightByToken",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetAdditionalCameraWeightByToken"],
    funcPath = "C_Commentator.SetAdditionalCameraWeightByToken",
    params = { { name = "unitToken", type = "UnitToken", default = "player" }, { name = "weight", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetBlocklistedAuras"] = {
    key = "C_Commentator.SetBlocklistedAuras",
    name = "SetBlocklistedAuras",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetBlocklistedAuras"],
    funcPath = "C_Commentator.SetBlocklistedAuras",
    params = { { name = "spellIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetBlocklistedCooldowns"] = {
    key = "C_Commentator.SetBlocklistedCooldowns",
    name = "SetBlocklistedCooldowns",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetBlocklistedCooldowns"],
    funcPath = "C_Commentator.SetBlocklistedCooldowns",
    params = { { name = "specID", type = "number", default = nil }, { name = "spellIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetBlocklistedItemCooldowns"] = {
    key = "C_Commentator.SetBlocklistedItemCooldowns",
    name = "SetBlocklistedItemCooldowns",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetBlocklistedItemCooldowns"],
    funcPath = "C_Commentator.SetBlocklistedItemCooldowns",
    params = { { name = "itemIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetCamera"] = {
    key = "C_Commentator.SetCamera",
    name = "SetCamera",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetCamera"],
    funcPath = "C_Commentator.SetCamera",
    params = { { name = "xPos", type = "number", default = nil }, { name = "yPos", type = "number", default = nil }, { name = "zPos", type = "number", default = nil }, { name = "yaw", type = "number", default = nil }, { name = "pitch", type = "number", default = nil }, { name = "roll", type = "number", default = nil }, { name = "fov", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetCameraCollision"] = {
    key = "C_Commentator.SetCameraCollision",
    name = "SetCameraCollision",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetCameraCollision"],
    funcPath = "C_Commentator.SetCameraCollision",
    params = { { name = "collide", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetCameraPosition"] = {
    key = "C_Commentator.SetCameraPosition",
    name = "SetCameraPosition",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetCameraPosition"],
    funcPath = "C_Commentator.SetCameraPosition",
    params = { { name = "xPos", type = "number", default = nil }, { name = "yPos", type = "number", default = nil }, { name = "zPos", type = "number", default = nil }, { name = "snapToLocation", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetCheatsEnabled"] = {
    key = "C_Commentator.SetCheatsEnabled",
    name = "SetCheatsEnabled",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetCheatsEnabled"],
    funcPath = "C_Commentator.SetCheatsEnabled",
    params = { { name = "enableCheats", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetCommentatorHistory"] = {
    key = "C_Commentator.SetCommentatorHistory",
    name = "SetCommentatorHistory",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetCommentatorHistory"],
    funcPath = "C_Commentator.SetCommentatorHistory",
    params = { { name = "history", type = "CommentatorHistory", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetDistanceBeforeForcedHorizontalConvergence"] = {
    key = "C_Commentator.SetDistanceBeforeForcedHorizontalConvergence",
    name = "SetDistanceBeforeForcedHorizontalConvergence",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetDistanceBeforeForcedHorizontalConvergence"],
    funcPath = "C_Commentator.SetDistanceBeforeForcedHorizontalConvergence",
    params = { { name = "distance", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetDurationToForceHorizontalConvergence"] = {
    key = "C_Commentator.SetDurationToForceHorizontalConvergence",
    name = "SetDurationToForceHorizontalConvergence",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetDurationToForceHorizontalConvergence"],
    funcPath = "C_Commentator.SetDurationToForceHorizontalConvergence",
    params = { { name = "ms", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetExcludeDistance"] = {
    key = "C_Commentator.SetExcludeDistance",
    name = "SetExcludeDistance",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetExcludeDistance"],
    funcPath = "C_Commentator.SetExcludeDistance",
    params = { { name = "excludeDistance", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetFollowCameraSpeeds"] = {
    key = "C_Commentator.SetFollowCameraSpeeds",
    name = "SetFollowCameraSpeeds",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetFollowCameraSpeeds"],
    funcPath = "C_Commentator.SetFollowCameraSpeeds",
    params = { { name = "elasticSpeed", type = "number", default = nil }, { name = "minSpeed", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetHardlockWeight"] = {
    key = "C_Commentator.SetHardlockWeight",
    name = "SetHardlockWeight",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetHardlockWeight"],
    funcPath = "C_Commentator.SetHardlockWeight",
    params = { { name = "weight", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetHorizontalAngleThresholdToSmooth"] = {
    key = "C_Commentator.SetHorizontalAngleThresholdToSmooth",
    name = "SetHorizontalAngleThresholdToSmooth",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetHorizontalAngleThresholdToSmooth"],
    funcPath = "C_Commentator.SetHorizontalAngleThresholdToSmooth",
    params = { { name = "angle", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetLookAtLerpAmount"] = {
    key = "C_Commentator.SetLookAtLerpAmount",
    name = "SetLookAtLerpAmount",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetLookAtLerpAmount"],
    funcPath = "C_Commentator.SetLookAtLerpAmount",
    params = { { name = "amount", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetMapAndInstanceIndex"] = {
    key = "C_Commentator.SetMapAndInstanceIndex",
    name = "SetMapAndInstanceIndex",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetMapAndInstanceIndex"],
    funcPath = "C_Commentator.SetMapAndInstanceIndex",
    params = { { name = "mapIndex", type = "luaIndex", default = nil }, { name = "instanceIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetMouseDisabled"] = {
    key = "C_Commentator.SetMouseDisabled",
    name = "SetMouseDisabled",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetMouseDisabled"],
    funcPath = "C_Commentator.SetMouseDisabled",
    params = { { name = "disabled", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetMoveSpeed"] = {
    key = "C_Commentator.SetMoveSpeed",
    name = "SetMoveSpeed",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetMoveSpeed"],
    funcPath = "C_Commentator.SetMoveSpeed",
    params = { { name = "newSpeed", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetMsToHoldForHorizontalMovement"] = {
    key = "C_Commentator.SetMsToHoldForHorizontalMovement",
    name = "SetMsToHoldForHorizontalMovement",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetMsToHoldForHorizontalMovement"],
    funcPath = "C_Commentator.SetMsToHoldForHorizontalMovement",
    params = { { name = "ms", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetMsToHoldForVerticalMovement"] = {
    key = "C_Commentator.SetMsToHoldForVerticalMovement",
    name = "SetMsToHoldForVerticalMovement",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetMsToHoldForVerticalMovement"],
    funcPath = "C_Commentator.SetMsToHoldForVerticalMovement",
    params = { { name = "ms", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetMsToSmoothHorizontalChange"] = {
    key = "C_Commentator.SetMsToSmoothHorizontalChange",
    name = "SetMsToSmoothHorizontalChange",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetMsToSmoothHorizontalChange"],
    funcPath = "C_Commentator.SetMsToSmoothHorizontalChange",
    params = { { name = "ms", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetMsToSmoothVerticalChange"] = {
    key = "C_Commentator.SetMsToSmoothVerticalChange",
    name = "SetMsToSmoothVerticalChange",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetMsToSmoothVerticalChange"],
    funcPath = "C_Commentator.SetMsToSmoothVerticalChange",
    params = { { name = "ms", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetPositionLerpAmount"] = {
    key = "C_Commentator.SetPositionLerpAmount",
    name = "SetPositionLerpAmount",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetPositionLerpAmount"],
    funcPath = "C_Commentator.SetPositionLerpAmount",
    params = { { name = "amount", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetRequestedDebuffCooldowns"] = {
    key = "C_Commentator.SetRequestedDebuffCooldowns",
    name = "SetRequestedDebuffCooldowns",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetRequestedDebuffCooldowns"],
    funcPath = "C_Commentator.SetRequestedDebuffCooldowns",
    params = { { name = "specID", type = "number", default = nil }, { name = "spellIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetRequestedDefensiveCooldowns"] = {
    key = "C_Commentator.SetRequestedDefensiveCooldowns",
    name = "SetRequestedDefensiveCooldowns",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetRequestedDefensiveCooldowns"],
    funcPath = "C_Commentator.SetRequestedDefensiveCooldowns",
    params = { { name = "specID", type = "number", default = nil }, { name = "spellIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetRequestedItemCooldowns"] = {
    key = "C_Commentator.SetRequestedItemCooldowns",
    name = "SetRequestedItemCooldowns",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetRequestedItemCooldowns"],
    funcPath = "C_Commentator.SetRequestedItemCooldowns",
    params = { { name = "itemIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetRequestedOffensiveCooldowns"] = {
    key = "C_Commentator.SetRequestedOffensiveCooldowns",
    name = "SetRequestedOffensiveCooldowns",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetRequestedOffensiveCooldowns"],
    funcPath = "C_Commentator.SetRequestedOffensiveCooldowns",
    params = { { name = "specID", type = "number", default = nil }, { name = "spellIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetSeriesScore"] = {
    key = "C_Commentator.SetSeriesScore",
    name = "SetSeriesScore",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetSeriesScore"],
    funcPath = "C_Commentator.SetSeriesScore",
    params = { { name = "teamName1", type = "string", default = nil }, { name = "teamName2", type = "string", default = nil }, { name = "scoringTeamName", type = "string", default = nil }, { name = "score", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetSeriesScores"] = {
    key = "C_Commentator.SetSeriesScores",
    name = "SetSeriesScores",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetSeriesScores"],
    funcPath = "C_Commentator.SetSeriesScores",
    params = { { name = "teamName1", type = "string", default = nil }, { name = "teamName2", type = "string", default = nil }, { name = "score1", type = "number", default = nil }, { name = "score2", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetSmartCameraLocked"] = {
    key = "C_Commentator.SetSmartCameraLocked",
    name = "SetSmartCameraLocked",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetSmartCameraLocked"],
    funcPath = "C_Commentator.SetSmartCameraLocked",
    params = { { name = "locked", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetSmoothFollowTransitioning"] = {
    key = "C_Commentator.SetSmoothFollowTransitioning",
    name = "SetSmoothFollowTransitioning",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetSmoothFollowTransitioning"],
    funcPath = "C_Commentator.SetSmoothFollowTransitioning",
    params = { { name = "enabled", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetSoftlockWeight"] = {
    key = "C_Commentator.SetSoftlockWeight",
    name = "SetSoftlockWeight",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetSoftlockWeight"],
    funcPath = "C_Commentator.SetSoftlockWeight",
    params = { { name = "weight", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetSpeedFactor"] = {
    key = "C_Commentator.SetSpeedFactor",
    name = "SetSpeedFactor",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetSpeedFactor"],
    funcPath = "C_Commentator.SetSpeedFactor",
    params = { { name = "factor", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetTargetHeightOffset"] = {
    key = "C_Commentator.SetTargetHeightOffset",
    name = "SetTargetHeightOffset",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetTargetHeightOffset"],
    funcPath = "C_Commentator.SetTargetHeightOffset",
    params = { { name = "offset", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SetUseSmartCamera"] = {
    key = "C_Commentator.SetUseSmartCamera",
    name = "SetUseSmartCamera",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SetUseSmartCamera"],
    funcPath = "C_Commentator.SetUseSmartCamera",
    params = { { name = "useSmartCamera", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SnapCameraLookAtPoint"] = {
    key = "C_Commentator.SnapCameraLookAtPoint",
    name = "SnapCameraLookAtPoint",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SnapCameraLookAtPoint"],
    funcPath = "C_Commentator.SnapCameraLookAtPoint",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.SpellUsesItemCharges"] = {
    key = "C_Commentator.SpellUsesItemCharges",
    name = "SpellUsesItemCharges",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SpellUsesItemCharges"],
    funcPath = "C_Commentator.SpellUsesItemCharges",
    params = { { name = "spellID", type = "number", default = nil } },
    returns = { { name = "spellUsesItemCharges", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.StartWargame"] = {
    key = "C_Commentator.StartWargame",
    name = "StartWargame",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["StartWargame"],
    funcPath = "C_Commentator.StartWargame",
    params = { { name = "listID", type = "number", default = nil }, { name = "teamSize", type = "number", default = nil }, { name = "tournamentRules", type = "bool", default = nil }, { name = "teamOneCaptain", type = "string", default = nil }, { name = "teamTwoCaptain", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.SwapTeamSides"] = {
    key = "C_Commentator.SwapTeamSides",
    name = "SwapTeamSides",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["SwapTeamSides"],
    funcPath = "C_Commentator.SwapTeamSides",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.ToggleCheats"] = {
    key = "C_Commentator.ToggleCheats",
    name = "ToggleCheats",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["ToggleCheats"],
    funcPath = "C_Commentator.ToggleCheats",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.UpdateMapInfo"] = {
    key = "C_Commentator.UpdateMapInfo",
    name = "UpdateMapInfo",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["UpdateMapInfo"],
    funcPath = "C_Commentator.UpdateMapInfo",
    params = { { name = "targetPlayer", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.UpdatePlayerInfo"] = {
    key = "C_Commentator.UpdatePlayerInfo",
    name = "UpdatePlayerInfo",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["UpdatePlayerInfo"],
    funcPath = "C_Commentator.UpdatePlayerInfo",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.ZoomIn"] = {
    key = "C_Commentator.ZoomIn",
    name = "ZoomIn",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["ZoomIn"],
    funcPath = "C_Commentator.ZoomIn",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.ZoomIn_Position"] = {
    key = "C_Commentator.ZoomIn_Position",
    name = "ZoomIn_Position",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["ZoomIn_Position"],
    funcPath = "C_Commentator.ZoomIn_Position",
    params = { { name = "zoomAmount", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Commentator.ZoomOut"] = {
    key = "C_Commentator.ZoomOut",
    name = "ZoomOut",
    category = "general",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["ZoomOut"],
    funcPath = "C_Commentator.ZoomOut",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Commentator.ZoomOut_Position"] = {
    key = "C_Commentator.ZoomOut_Position",
    name = "ZoomOut_Position",
    category = "combat_midnight",
    subcategory = "c_commentator",
    func = _G["C_Commentator"] and _G["C_Commentator"]["ZoomOut_Position"],
    funcPath = "C_Commentator.ZoomOut_Position",
    params = { { name = "zoomAmount", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

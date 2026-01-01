-- Generated APIDefinitions for namespace: C_PvP
local _, ns = ...
local APIDefs = ns.APIDefinitions

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

APIDefs["C_PvP.GetArenaCrowdControlInfo"] = {
	key = "C_PvP.GetArenaCrowdControlInfo",
	name = "GetArenaCrowdControlInfo",
	category = "combat_midnight",
	subcategory = "c_pvp",
	func = _G["C_PvP"] and _G["C_PvP"]["GetArenaCrowdControlInfo"],
	funcPath = "C_PvP.GetArenaCrowdControlInfo",
	params = { { name = "playerToken", type = "UnitToken", default = "player" } },
	returns = {
		{ name = "spellID", type = "number", canBeSecret = false },
		{ name = "startTime", type = "number", canBeSecret = false },
		{ name = "duration", type = "number", canBeSecret = false },
	},
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
	returns = {
		{ name = "honor", type = "number", canBeSecret = false },
		{ name = "experience", type = "number", canBeSecret = false },
		{ name = "itemRewards", type = "table", canBeSecret = false },
		{ name = "currencyRewards", type = "table", canBeSecret = false },
		{ name = "roleShortageBonus", type = "RoleShortageReward", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["C_PvP.GetBattlefieldFlagPosition"] = {
	key = "C_PvP.GetBattlefieldFlagPosition",
	name = "GetBattlefieldFlagPosition",
	category = "combat_midnight",
	subcategory = "c_pvp",
	func = _G["C_PvP"] and _G["C_PvP"]["GetBattlefieldFlagPosition"],
	funcPath = "C_PvP.GetBattlefieldFlagPosition",
	params = {
		{ name = "flagIndex", type = "luaIndex", default = nil },
		{ name = "uiMapId", type = "number", default = nil },
	},
	returns = {
		{ name = "uiPosx", type = "number", canBeSecret = false },
		{ name = "uiPosy", type = "number", canBeSecret = false },
		{ name = "flagTexture", type = "number", canBeSecret = false },
	},
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
	params = {
		{ name = "vehicleIndex", type = "luaIndex", default = nil },
		{ name = "uiMapID", type = "number", default = nil },
	},
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
	returns = {
		{ name = "honor", type = "number", canBeSecret = false },
		{ name = "experience", type = "number", canBeSecret = false },
		{ name = "itemRewards", type = "table", canBeSecret = false },
		{ name = "currencyRewards", type = "table", canBeSecret = false },
		{ name = "roleShortageBonus", type = "RoleShortageReward", canBeSecret = false },
		{ name = "hasWon", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["C_PvP.GetPvpTierID"] = {
	key = "C_PvP.GetPvpTierID",
	name = "GetPvpTierID",
	category = "combat_midnight",
	subcategory = "c_pvp",
	func = _G["C_PvP"] and _G["C_PvP"]["GetPvpTierID"],
	funcPath = "C_PvP.GetPvpTierID",
	params = {
		{ name = "tierEnum", type = "number", default = nil },
		{ name = "bracketEnum", type = "luaIndex", default = nil },
	},
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

APIDefs["C_PvP.GetRewardItemLevelsByTierEnum"] = {
	key = "C_PvP.GetRewardItemLevelsByTierEnum",
	name = "GetRewardItemLevelsByTierEnum",
	category = "combat_midnight",
	subcategory = "c_pvp",
	func = _G["C_PvP"] and _G["C_PvP"]["GetRewardItemLevelsByTierEnum"],
	funcPath = "C_PvP.GetRewardItemLevelsByTierEnum",
	params = { { name = "pvpTierEnum", type = "number", default = nil } },
	returns = {
		{ name = "activityItemLevel", type = "number", canBeSecret = false },
		{ name = "weeklyItemLevel", type = "number", canBeSecret = false },
	},
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
	params = {
		{
			name = "guid",
			type = "WOWGUID",
			default = nil,
			examples = {
				{ value = [=[UnitGUID("player")]=], label = "Details" },
				{ value = "playerInfo.guid", label = "Details" },
			},
		},
	},
	returns = { { name = "info", type = "PVPScoreInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["C_PvP.GetTeamInfo"] = {
	key = "C_PvP.GetTeamInfo",
	name = "GetTeamInfo",
	category = "combat_midnight",
	subcategory = "c_pvp",
	func = _G["C_PvP"] and _G["C_PvP"]["GetTeamInfo"],
	funcPath = "C_PvP.GetTeamInfo",
	params = {
		{
			name = "factionIndex",
			type = "number",
			default = nil,
			examples = { { value = 0, label = "Details" }, { value = 1, label = "Details" } },
		},
	},
	returns = { { name = "info", type = "PVPTeamInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.JoinBattlefield"] = {
	key = "C_PvP.JoinBattlefield",
	name = "JoinBattlefield",
	category = "combat_midnight",
	subcategory = "c_pvp",
	func = _G["C_PvP"] and _G["C_PvP"]["JoinBattlefield"],
	funcPath = "C_PvP.JoinBattlefield",
	params = { { name = "battlemasterListId", type = "number", default = nil } },
	returns = {},
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
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PvP.JoinTrainingGround"] = {
	key = "C_PvP.JoinTrainingGround",
	name = "JoinTrainingGround",
	category = "combat_midnight",
	subcategory = "c_pvp",
	func = _G["C_PvP"] and _G["C_PvP"]["JoinTrainingGround"],
	funcPath = "C_PvP.JoinTrainingGround",
	params = { { name = "trainingGroundID", type = "number", default = nil } },
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{ name = "opaqueID1", type = "number", default = nil },
		{ name = "opaqueID2", type = "number", default = nil },
		{ name = "specifiedMap", type = "cstring", default = nil },
		{ name = "tournamentRules", type = "bool", default = nil },
	},
	returns = { { name = "success", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

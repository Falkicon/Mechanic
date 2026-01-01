-- Generated APIDefinitions for namespace: C_Garrison
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Garrison.AddFollowerToMission"] = {
	key = "C_Garrison.AddFollowerToMission",
	name = "AddFollowerToMission",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["AddFollowerToMission"],
	funcPath = "C_Garrison.AddFollowerToMission",
	params = {
		{ name = "missionID", type = "number", default = nil },
		{ name = "followerID", type = "GarrisonFollower", default = nil },
		{ name = "boardIndex", type = "number", default = nil },
	},
	returns = { { name = "followerAdded", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetAutoMissionBoardState"] = {
	key = "C_Garrison.GetAutoMissionBoardState",
	name = "GetAutoMissionBoardState",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetAutoMissionBoardState"],
	funcPath = "C_Garrison.GetAutoMissionBoardState",
	params = { { name = "missionID", type = "number", default = nil } },
	returns = { { name = "targetInfo", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetAutoMissionEnvironmentEffect"] = {
	key = "C_Garrison.GetAutoMissionEnvironmentEffect",
	name = "GetAutoMissionEnvironmentEffect",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetAutoMissionEnvironmentEffect"],
	funcPath = "C_Garrison.GetAutoMissionEnvironmentEffect",
	params = { { name = "missionID", type = "number", default = nil } },
	returns = { { name = "autoMissionEnvEffect", type = "AutoMissionEnvironmentEffect", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetAutoMissionTargetingInfo"] = {
	key = "C_Garrison.GetAutoMissionTargetingInfo",
	name = "GetAutoMissionTargetingInfo",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetAutoMissionTargetingInfo"],
	funcPath = "C_Garrison.GetAutoMissionTargetingInfo",
	params = {
		{ name = "missionID", type = "number", default = nil },
		{ name = "followerID", type = "GarrisonFollower", default = nil },
		{ name = "casterBoardIndex", type = "number", default = nil },
	},
	returns = { { name = "targetInfo", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetAutoMissionTargetingInfoForSpell"] = {
	key = "C_Garrison.GetAutoMissionTargetingInfoForSpell",
	name = "GetAutoMissionTargetingInfoForSpell",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetAutoMissionTargetingInfoForSpell"],
	funcPath = "C_Garrison.GetAutoMissionTargetingInfoForSpell",
	params = {
		{ name = "missionID", type = "number", default = nil },
		{ name = "autoCombatSpellID", type = "number", default = nil },
		{ name = "casterBoardIndex", type = "number", default = nil },
	},
	returns = { { name = "targetInfo", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetAutoTroops"] = {
	key = "C_Garrison.GetAutoTroops",
	name = "GetAutoTroops",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetAutoTroops"],
	funcPath = "C_Garrison.GetAutoTroops",
	params = { { name = "followerType", type = "number", default = nil } },
	returns = { { name = "autoTroopInfo", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetCombatLogSpellInfo"] = {
	key = "C_Garrison.GetCombatLogSpellInfo",
	name = "GetCombatLogSpellInfo",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetCombatLogSpellInfo"],
	funcPath = "C_Garrison.GetCombatLogSpellInfo",
	params = { { name = "autoCombatSpellID", type = "number", default = nil } },
	returns = { { name = "spellInfo", type = "AutoCombatSpellInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetFollowerAutoCombatSpells"] = {
	key = "C_Garrison.GetFollowerAutoCombatSpells",
	name = "GetFollowerAutoCombatSpells",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetFollowerAutoCombatSpells"],
	funcPath = "C_Garrison.GetFollowerAutoCombatSpells",
	params = {
		{ name = "garrFollowerID", type = "GarrisonFollower", default = nil },
		{ name = "followerLevel", type = "number", default = nil },
	},
	returns = {
		{ name = "autoCombatSpells", type = "table", canBeSecret = false },
		{ name = "autoCombatAutoAttack", type = "AutoCombatSpellInfo", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetFollowerAutoCombatStats"] = {
	key = "C_Garrison.GetFollowerAutoCombatStats",
	name = "GetFollowerAutoCombatStats",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetFollowerAutoCombatStats"],
	funcPath = "C_Garrison.GetFollowerAutoCombatStats",
	params = { { name = "garrFollowerID", type = "GarrisonFollower", default = nil } },
	returns = { { name = "autoCombatInfo", type = "FollowerAutoCombatStatsInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetFollowerMissionCompleteInfo"] = {
	key = "C_Garrison.GetFollowerMissionCompleteInfo",
	name = "GetFollowerMissionCompleteInfo",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetFollowerMissionCompleteInfo"],
	funcPath = "C_Garrison.GetFollowerMissionCompleteInfo",
	params = { { name = "followerID", type = "GarrisonFollower", default = nil } },
	returns = { { name = "followerMissionCompleteInfo", type = "FollowerMissionCompleteInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetGarrisonPlotsInstancesForMap"] = {
	key = "C_Garrison.GetGarrisonPlotsInstancesForMap",
	name = "GetGarrisonPlotsInstancesForMap",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetGarrisonPlotsInstancesForMap"],
	funcPath = "C_Garrison.GetGarrisonPlotsInstancesForMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "garrisonPlotInstances", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetGarrisonTalentTreeCurrencyTypes"] = {
	key = "C_Garrison.GetGarrisonTalentTreeCurrencyTypes",
	name = "GetGarrisonTalentTreeCurrencyTypes",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetGarrisonTalentTreeCurrencyTypes"],
	funcPath = "C_Garrison.GetGarrisonTalentTreeCurrencyTypes",
	params = { { name = "garrTalentTreeID", type = "number", default = nil } },
	returns = { { name = "garrTalentTreeCurrencyType", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetGarrisonTalentTreeType"] = {
	key = "C_Garrison.GetGarrisonTalentTreeType",
	name = "GetGarrisonTalentTreeType",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetGarrisonTalentTreeType"],
	funcPath = "C_Garrison.GetGarrisonTalentTreeType",
	params = { { name = "garrTalentTreeID", type = "number", default = nil } },
	returns = { { name = "garrTalentTreeType", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetMissionCompleteEncounters"] = {
	key = "C_Garrison.GetMissionCompleteEncounters",
	name = "GetMissionCompleteEncounters",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetMissionCompleteEncounters"],
	funcPath = "C_Garrison.GetMissionCompleteEncounters",
	params = { { name = "missionID", type = "number", default = nil } },
	returns = { { name = "encounters", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetMissionDeploymentInfo"] = {
	key = "C_Garrison.GetMissionDeploymentInfo",
	name = "GetMissionDeploymentInfo",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetMissionDeploymentInfo"],
	funcPath = "C_Garrison.GetMissionDeploymentInfo",
	params = { { name = "missionID", type = "number", default = nil } },
	returns = { { name = "missionDeploymentInfo", type = "MissionDeploymentInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetMissionEncounterIconInfo"] = {
	key = "C_Garrison.GetMissionEncounterIconInfo",
	name = "GetMissionEncounterIconInfo",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetMissionEncounterIconInfo"],
	funcPath = "C_Garrison.GetMissionEncounterIconInfo",
	params = { { name = "missionID", type = "number", default = nil } },
	returns = { { name = "missionEncounterIconInfo", type = "MissionEncounterIconInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetTalentInfo"] = {
	key = "C_Garrison.GetTalentInfo",
	name = "GetTalentInfo",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetTalentInfo"],
	funcPath = "C_Garrison.GetTalentInfo",
	params = {
		{
			name = "talentID",
			type = "number",
			default = nil,
			examples = {
				{ value = "{       tier = math.ceil(index / 3)", label = "WeakAuras" },
				{ value = "tier", label = "WeakAuras" },
				{ value = 2, label = "BigWigs_Core" },
			},
		},
	},
	returns = { { name = "info", type = "GarrisonTalentInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetTalentPointsSpentInTalentTree"] = {
	key = "C_Garrison.GetTalentPointsSpentInTalentTree",
	name = "GetTalentPointsSpentInTalentTree",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetTalentPointsSpentInTalentTree"],
	funcPath = "C_Garrison.GetTalentPointsSpentInTalentTree",
	params = { { name = "garrTalentTreeID", type = "number", default = nil } },
	returns = { { name = "talentPoints", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetTalentTreeIDsByClassID"] = {
	key = "C_Garrison.GetTalentTreeIDsByClassID",
	name = "GetTalentTreeIDsByClassID",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetTalentTreeIDsByClassID"],
	funcPath = "C_Garrison.GetTalentTreeIDsByClassID",
	params = {
		{ name = "garrType", type = "number", default = nil },
		{ name = "classID", type = "number", default = nil },
	},
	returns = { { name = "treeIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetTalentTreeInfo"] = {
	key = "C_Garrison.GetTalentTreeInfo",
	name = "GetTalentTreeInfo",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetTalentTreeInfo"],
	funcPath = "C_Garrison.GetTalentTreeInfo",
	params = { { name = "treeID", type = "number", default = nil } },
	returns = { { name = "info", type = "GarrisonTalentTreeInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetTalentTreeResetInfo"] = {
	key = "C_Garrison.GetTalentTreeResetInfo",
	name = "GetTalentTreeResetInfo",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetTalentTreeResetInfo"],
	funcPath = "C_Garrison.GetTalentTreeResetInfo",
	params = { { name = "garrTalentTreeID", type = "number", default = nil } },
	returns = {
		{ name = "goldCost", type = "number", canBeSecret = false },
		{ name = "currencyCosts", type = "table", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetTalentTreeTalentPointResearchInfo"] = {
	key = "C_Garrison.GetTalentTreeTalentPointResearchInfo",
	name = "GetTalentTreeTalentPointResearchInfo",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetTalentTreeTalentPointResearchInfo"],
	funcPath = "C_Garrison.GetTalentTreeTalentPointResearchInfo",
	params = {
		{ name = "garrTalentID", type = "number", default = nil },
		{ name = "researchRank", type = "number", default = nil },
		{ name = "garrTalentTreeID", type = "number", default = nil },
		{ name = "talentPointIndex", type = "number", default = nil },
		{ name = "isRespec", type = "bool", default = nil },
	},
	returns = {
		{ name = "goldCost", type = "number", canBeSecret = false },
		{ name = "currencyCosts", type = "table", canBeSecret = false },
		{ name = "durationSecs", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.GetTalentUnlockWorldQuest"] = {
	key = "C_Garrison.GetTalentUnlockWorldQuest",
	name = "GetTalentUnlockWorldQuest",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["GetTalentUnlockWorldQuest"],
	funcPath = "C_Garrison.GetTalentUnlockWorldQuest",
	params = { { name = "talentID", type = "number", default = nil } },
	returns = { { name = "worldQuestID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.IsEnvironmentCountered"] = {
	key = "C_Garrison.IsEnvironmentCountered",
	name = "IsEnvironmentCountered",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["IsEnvironmentCountered"],
	funcPath = "C_Garrison.IsEnvironmentCountered",
	params = { { name = "missionID", type = "number", default = nil } },
	returns = { { name = "environmentCountered", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.IsFollowerOnCompletedMission"] = {
	key = "C_Garrison.IsFollowerOnCompletedMission",
	name = "IsFollowerOnCompletedMission",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["IsFollowerOnCompletedMission"],
	funcPath = "C_Garrison.IsFollowerOnCompletedMission",
	params = { { name = "followerID", type = "GarrisonFollower", default = nil } },
	returns = { { name = "followerOnCompletedMission", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.IsLandingPageMinimapButtonVisible"] = {
	key = "C_Garrison.IsLandingPageMinimapButtonVisible",
	name = "IsLandingPageMinimapButtonVisible",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["IsLandingPageMinimapButtonVisible"],
	funcPath = "C_Garrison.IsLandingPageMinimapButtonVisible",
	params = { { name = "garrType", type = "number", default = nil } },
	returns = { { name = "isLandingPageMinimapButtonVisible", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.IsTalentConditionMet"] = {
	key = "C_Garrison.IsTalentConditionMet",
	name = "IsTalentConditionMet",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["IsTalentConditionMet"],
	funcPath = "C_Garrison.IsTalentConditionMet",
	params = { { name = "talentID", type = "number", default = nil } },
	returns = {
		{ name = "isMet", type = "bool", canBeSecret = false },
		{ name = "failureString", type = "cstring", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.RegenerateCombatLog"] = {
	key = "C_Garrison.RegenerateCombatLog",
	name = "RegenerateCombatLog",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["RegenerateCombatLog"],
	funcPath = "C_Garrison.RegenerateCombatLog",
	params = { { name = "missionID", type = "number", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.RemoveFollowerFromMission"] = {
	key = "C_Garrison.RemoveFollowerFromMission",
	name = "RemoveFollowerFromMission",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["RemoveFollowerFromMission"],
	funcPath = "C_Garrison.RemoveFollowerFromMission",
	params = {
		{ name = "missionID", type = "number", default = nil },
		{ name = "followerID", type = "GarrisonFollower", default = nil },
		{ name = "boardIndex", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.RushHealAllFollowers"] = {
	key = "C_Garrison.RushHealAllFollowers",
	name = "RushHealAllFollowers",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["RushHealAllFollowers"],
	funcPath = "C_Garrison.RushHealAllFollowers",
	params = { { name = "followerType", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.RushHealFollower"] = {
	key = "C_Garrison.RushHealFollower",
	name = "RushHealFollower",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["RushHealFollower"],
	funcPath = "C_Garrison.RushHealFollower",
	params = { { name = "garrFollowerID", type = "GarrisonFollower", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Garrison.SetAutoCombatSpellFastForward"] = {
	key = "C_Garrison.SetAutoCombatSpellFastForward",
	name = "SetAutoCombatSpellFastForward",
	category = "combat_midnight",
	subcategory = "c_garrison",
	func = _G["C_Garrison"] and _G["C_Garrison"]["SetAutoCombatSpellFastForward"],
	funcPath = "C_Garrison.SetAutoCombatSpellFastForward",
	params = { { name = "state", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

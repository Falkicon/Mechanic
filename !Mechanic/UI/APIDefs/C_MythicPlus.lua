-- Generated APIDefinitions for namespace: C_MythicPlus
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_MythicPlus.GetEndOfRunGearSequenceLevel"] = {
	key = "C_MythicPlus.GetEndOfRunGearSequenceLevel",
	name = "GetEndOfRunGearSequenceLevel",
	category = "combat_midnight",
	subcategory = "c_mythicplus",
	func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetEndOfRunGearSequenceLevel"],
	funcPath = "C_MythicPlus.GetEndOfRunGearSequenceLevel",
	params = { { name = "keystoneLevel", type = "number", default = nil } },
	returns = { { name = "sequenceLevel", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MythicPlus.GetRewardLevelForDifficultyLevel"] = {
	key = "C_MythicPlus.GetRewardLevelForDifficultyLevel",
	name = "GetRewardLevelForDifficultyLevel",
	category = "combat_midnight",
	subcategory = "c_mythicplus",
	func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetRewardLevelForDifficultyLevel"],
	funcPath = "C_MythicPlus.GetRewardLevelForDifficultyLevel",
	params = { { name = "difficultyLevel", type = "number", default = nil } },
	returns = {
		{ name = "weeklyRewardLevel", type = "number", canBeSecret = false },
		{ name = "endOfRunRewardLevel", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MythicPlus.GetRewardLevelFromKeystoneLevel"] = {
	key = "C_MythicPlus.GetRewardLevelFromKeystoneLevel",
	name = "GetRewardLevelFromKeystoneLevel",
	category = "combat_midnight",
	subcategory = "c_mythicplus",
	func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetRewardLevelFromKeystoneLevel"],
	funcPath = "C_MythicPlus.GetRewardLevelFromKeystoneLevel",
	params = { { name = "keystoneLevel", type = "number", default = nil } },
	returns = { { name = "rewardLevel", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MythicPlus.GetRunHistory"] = {
	key = "C_MythicPlus.GetRunHistory",
	name = "GetRunHistory",
	category = "combat_midnight",
	subcategory = "c_mythicplus",
	func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetRunHistory"],
	funcPath = "C_MythicPlus.GetRunHistory",
	params = {
		{ name = "includePreviousWeeks", type = "bool", default = false },
		{ name = "includeIncompleteRuns", type = "bool", default = false },
		{ name = "currentSeasonOnly", type = "bool", default = false },
	},
	returns = { { name = "runs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MythicPlus.GetSeasonBestAffixScoreInfoForMap"] = {
	key = "C_MythicPlus.GetSeasonBestAffixScoreInfoForMap",
	name = "GetSeasonBestAffixScoreInfoForMap",
	category = "combat_midnight",
	subcategory = "c_mythicplus",
	func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetSeasonBestAffixScoreInfoForMap"],
	funcPath = "C_MythicPlus.GetSeasonBestAffixScoreInfoForMap",
	params = { { name = "mapChallengeModeID", type = "number", default = nil } },
	returns = {
		{ name = "affixScores", type = "table", canBeSecret = false },
		{ name = "bestOverAllScore", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MythicPlus.GetSeasonBestForMap"] = {
	key = "C_MythicPlus.GetSeasonBestForMap",
	name = "GetSeasonBestForMap",
	category = "combat_midnight",
	subcategory = "c_mythicplus",
	func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetSeasonBestForMap"],
	funcPath = "C_MythicPlus.GetSeasonBestForMap",
	params = { { name = "mapChallengeModeID", type = "number", default = nil } },
	returns = {
		{ name = "intimeInfo", type = "MapSeasonBestInfo", canBeSecret = false },
		{ name = "overtimeInfo", type = "MapSeasonBestInfo", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MythicPlus.GetWeeklyBestForMap"] = {
	key = "C_MythicPlus.GetWeeklyBestForMap",
	name = "GetWeeklyBestForMap",
	category = "combat_midnight",
	subcategory = "c_mythicplus",
	func = _G["C_MythicPlus"] and _G["C_MythicPlus"]["GetWeeklyBestForMap"],
	funcPath = "C_MythicPlus.GetWeeklyBestForMap",
	params = { { name = "mapChallengeModeID", type = "number", default = nil } },
	returns = {
		{ name = "durationSec", type = "number", canBeSecret = false },
		{ name = "level", type = "number", canBeSecret = false },
		{ name = "completionDate", type = "MythicPlusDate", canBeSecret = false },
		{ name = "affixIDs", type = "table", canBeSecret = false },
		{ name = "members", type = "table", canBeSecret = false },
		{ name = "dungeonScore", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

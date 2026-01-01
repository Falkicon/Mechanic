-- Generated APIDefinitions for namespace: C_WeeklyRewards
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_WeeklyRewards.ClaimReward"] = {
	key = "C_WeeklyRewards.ClaimReward",
	name = "ClaimReward",
	category = "combat_midnight",
	subcategory = "c_weeklyrewards",
	func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["ClaimReward"],
	funcPath = "C_WeeklyRewards.ClaimReward",
	params = { { name = "id", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.GetActivities"] = {
	key = "C_WeeklyRewards.GetActivities",
	name = "GetActivities",
	category = "combat_midnight",
	subcategory = "c_weeklyrewards",
	func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetActivities"],
	funcPath = "C_WeeklyRewards.GetActivities",
	params = {
		{
			name = "type",
			type = "WeeklyRewardChestThresholdType",
			default = nil,
			examples = { { value = 3, label = "Weekly" } },
		},
	},
	returns = { { name = "activities", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.GetActivityEncounterInfo"] = {
	key = "C_WeeklyRewards.GetActivityEncounterInfo",
	name = "GetActivityEncounterInfo",
	category = "combat_midnight",
	subcategory = "c_weeklyrewards",
	func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetActivityEncounterInfo"],
	funcPath = "C_WeeklyRewards.GetActivityEncounterInfo",
	params = {
		{ name = "type", type = "WeeklyRewardChestThresholdType", default = nil },
		{ name = "index", type = "luaIndex", default = nil },
	},
	returns = { { name = "info", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.GetDifficultyIDForActivityTier"] = {
	key = "C_WeeklyRewards.GetDifficultyIDForActivityTier",
	name = "GetDifficultyIDForActivityTier",
	category = "combat_midnight",
	subcategory = "c_weeklyrewards",
	func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetDifficultyIDForActivityTier"],
	funcPath = "C_WeeklyRewards.GetDifficultyIDForActivityTier",
	params = { { name = "activityTierID", type = "number", default = nil } },
	returns = { { name = "difficultyID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.GetExampleRewardItemHyperlinks"] = {
	key = "C_WeeklyRewards.GetExampleRewardItemHyperlinks",
	name = "GetExampleRewardItemHyperlinks",
	category = "combat_midnight",
	subcategory = "c_weeklyrewards",
	func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetExampleRewardItemHyperlinks"],
	funcPath = "C_WeeklyRewards.GetExampleRewardItemHyperlinks",
	params = {
		{
			name = "id",
			type = "number",
			default = nil,
			examples = {
				{ value = "id", label = "Plumber" },
				{ value = "activityInfo.id", label = "Plumber" },
				{ value = "self.info.id", label = "Plumber" },
			},
		},
	},
	returns = {
		{ name = "hyperlink", type = "string", canBeSecret = false },
		{ name = "upgradeHyperlink", type = "string", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.GetItemHyperlink"] = {
	key = "C_WeeklyRewards.GetItemHyperlink",
	name = "GetItemHyperlink",
	category = "combat_midnight",
	subcategory = "c_weeklyrewards",
	func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetItemHyperlink"],
	funcPath = "C_WeeklyRewards.GetItemHyperlink",
	params = { { name = "itemDBID", type = "WeeklyRewardItemDBID", default = nil } },
	returns = { { name = "hyperlink", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.GetNextActivitiesIncrease"] = {
	key = "C_WeeklyRewards.GetNextActivitiesIncrease",
	name = "GetNextActivitiesIncrease",
	category = "combat_midnight",
	subcategory = "c_weeklyrewards",
	func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetNextActivitiesIncrease"],
	funcPath = "C_WeeklyRewards.GetNextActivitiesIncrease",
	params = {
		{ name = "activityTierID", type = "number", default = nil },
		{ name = "level", type = "number", default = nil },
	},
	returns = {
		{ name = "hasSeasonData", type = "bool", canBeSecret = false },
		{ name = "nextActivityTierID", type = "number", canBeSecret = false },
		{ name = "nextLevel", type = "number", canBeSecret = false },
		{ name = "itemLevel", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.GetNextMythicPlusIncrease"] = {
	key = "C_WeeklyRewards.GetNextMythicPlusIncrease",
	name = "GetNextMythicPlusIncrease",
	category = "combat_midnight",
	subcategory = "c_weeklyrewards",
	func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetNextMythicPlusIncrease"],
	funcPath = "C_WeeklyRewards.GetNextMythicPlusIncrease",
	params = { { name = "mythicPlusLevel", type = "number", default = nil } },
	returns = {
		{ name = "hasSeasonData", type = "bool", canBeSecret = false },
		{ name = "nextMythicPlusLevel", type = "number", canBeSecret = false },
		{ name = "itemLevel", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WeeklyRewards.GetSortedProgressForActivity"] = {
	key = "C_WeeklyRewards.GetSortedProgressForActivity",
	name = "GetSortedProgressForActivity",
	category = "combat_midnight",
	subcategory = "c_weeklyrewards",
	func = _G["C_WeeklyRewards"] and _G["C_WeeklyRewards"]["GetSortedProgressForActivity"],
	funcPath = "C_WeeklyRewards.GetSortedProgressForActivity",
	params = {
		{ name = "type", type = "WeeklyRewardChestThresholdType", default = nil },
		{ name = "combineSharedDifficulty", type = "bool", default = nil },
	},
	returns = { { name = "progress", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

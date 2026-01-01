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

APIDefs["C_ChallengeMode.GetAffixInfo"] = {
	key = "C_ChallengeMode.GetAffixInfo",
	name = "GetAffixInfo",
	category = "combat_midnight",
	subcategory = "c_challengemode",
	func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetAffixInfo"],
	funcPath = "C_ChallengeMode.GetAffixInfo",
	params = {
		{ name = "affixID", type = "number", default = nil, examples = { { value = 1, label = "AstralKeys" } } },
	},
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "description", type = "cstring", canBeSecret = false },
		{ name = "filedataid", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChallengeMode.GetDungeonScoreRarityColor"] = {
	key = "C_ChallengeMode.GetDungeonScoreRarityColor",
	name = "GetDungeonScoreRarityColor",
	category = "combat_midnight",
	subcategory = "c_challengemode",
	func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetDungeonScoreRarityColor"],
	funcPath = "C_ChallengeMode.GetDungeonScoreRarityColor",
	params = {
		{
			name = "dungeonScore",
			type = "number",
			default = nil,
			examples = {
				{ value = "Details222.MythicPlus.NewDungeonScore", label = "Details" },
				{
					value = [=[GetPlayerMythicPlusRatingSummary(LT["Unit"]).currentSeasonScore]=],
					label = "Leatrix_Plus",
				},
			},
		},
	},
	returns = { { name = "scoreColor", type = "colorRGB", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["C_ChallengeMode.GetMapUIInfo"] = {
	key = "C_ChallengeMode.GetMapUIInfo",
	name = "GetMapUIInfo",
	category = "combat_midnight",
	subcategory = "c_challengemode",
	func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetMapUIInfo"],
	funcPath = "C_ChallengeMode.GetMapUIInfo",
	params = {
		{
			name = "mapChallengeModeID",
			type = "number",
			default = nil,
			examples = { { value = "pData[2]", label = "BigWigs" } },
		},
	},
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "id", type = "number", canBeSecret = false },
		{ name = "timeLimit", type = "number", canBeSecret = false },
		{ name = "texture", type = "number", canBeSecret = false },
		{ name = "backgroundTexture", type = "number", canBeSecret = false },
		{ name = "mapID", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ChallengeMode.GetPowerLevelDamageHealthMod"] = {
	key = "C_ChallengeMode.GetPowerLevelDamageHealthMod",
	name = "GetPowerLevelDamageHealthMod",
	category = "combat_midnight",
	subcategory = "c_challengemode",
	func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["GetPowerLevelDamageHealthMod"],
	funcPath = "C_ChallengeMode.GetPowerLevelDamageHealthMod",
	params = { { name = "powerLevel", type = "number", default = nil } },
	returns = {
		{ name = "damageMod", type = "number", canBeSecret = false },
		{ name = "healthMod", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["C_ChallengeMode.RequestLeaders"] = {
	key = "C_ChallengeMode.RequestLeaders",
	name = "RequestLeaders",
	category = "combat_midnight",
	subcategory = "c_challengemode",
	func = _G["C_ChallengeMode"] and _G["C_ChallengeMode"]["RequestLeaders"],
	funcPath = "C_ChallengeMode.RequestLeaders",
	params = { { name = "mapChallengeModeID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_RecruitAFriend
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_RecruitAFriend.CanSummonFriend"] = {
	key = "C_RecruitAFriend.CanSummonFriend",
	name = "CanSummonFriend",
	category = "combat_midnight",
	subcategory = "c_recruitafriend",
	func = _G["C_RecruitAFriend"] and _G["C_RecruitAFriend"]["CanSummonFriend"],
	funcPath = "C_RecruitAFriend.CanSummonFriend",
	params = { { name = "guid", type = "WOWGUID", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RecruitAFriend.ClaimActivityReward"] = {
	key = "C_RecruitAFriend.ClaimActivityReward",
	name = "ClaimActivityReward",
	category = "combat_midnight",
	subcategory = "c_recruitafriend",
	func = _G["C_RecruitAFriend"] and _G["C_RecruitAFriend"]["ClaimActivityReward"],
	funcPath = "C_RecruitAFriend.ClaimActivityReward",
	params = {
		{ name = "activityID", type = "number", default = nil },
		{ name = "acceptanceID", type = "RecruitAcceptanceID", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RecruitAFriend.ClaimNextReward"] = {
	key = "C_RecruitAFriend.ClaimNextReward",
	name = "ClaimNextReward",
	category = "combat_midnight",
	subcategory = "c_recruitafriend",
	func = _G["C_RecruitAFriend"] and _G["C_RecruitAFriend"]["ClaimNextReward"],
	funcPath = "C_RecruitAFriend.ClaimNextReward",
	params = { { name = "rafVersion", type = "RecruitAFriendRewardsVersion", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RecruitAFriend.GetRecruitActivityRequirementsText"] = {
	key = "C_RecruitAFriend.GetRecruitActivityRequirementsText",
	name = "GetRecruitActivityRequirementsText",
	category = "combat_midnight",
	subcategory = "c_recruitafriend",
	func = _G["C_RecruitAFriend"] and _G["C_RecruitAFriend"]["GetRecruitActivityRequirementsText"],
	funcPath = "C_RecruitAFriend.GetRecruitActivityRequirementsText",
	params = {
		{ name = "activityID", type = "number", default = nil },
		{ name = "acceptanceID", type = "RecruitAcceptanceID", default = nil },
	},
	returns = { { name = "requirementsText", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RecruitAFriend.IsRecruitAFriendLinked"] = {
	key = "C_RecruitAFriend.IsRecruitAFriendLinked",
	name = "IsRecruitAFriendLinked",
	category = "combat_midnight",
	subcategory = "c_recruitafriend",
	func = _G["C_RecruitAFriend"] and _G["C_RecruitAFriend"]["IsRecruitAFriendLinked"],
	funcPath = "C_RecruitAFriend.IsRecruitAFriendLinked",
	params = { { name = "guid", type = "WOWGUID", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RecruitAFriend.RemoveRAFRecruit"] = {
	key = "C_RecruitAFriend.RemoveRAFRecruit",
	name = "RemoveRAFRecruit",
	category = "combat_midnight",
	subcategory = "c_recruitafriend",
	func = _G["C_RecruitAFriend"] and _G["C_RecruitAFriend"]["RemoveRAFRecruit"],
	funcPath = "C_RecruitAFriend.RemoveRAFRecruit",
	params = { { name = "wowAccountGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RecruitAFriend.SummonFriend"] = {
	key = "C_RecruitAFriend.SummonFriend",
	name = "SummonFriend",
	category = "combat_midnight",
	subcategory = "c_recruitafriend",
	func = _G["C_RecruitAFriend"] and _G["C_RecruitAFriend"]["SummonFriend"],
	funcPath = "C_RecruitAFriend.SummonFriend",
	params = {
		{ name = "target", type = "WOWGUID", default = nil },
		{ name = "name", type = "cstring", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

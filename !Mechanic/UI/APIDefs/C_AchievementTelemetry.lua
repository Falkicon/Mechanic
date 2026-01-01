-- Generated APIDefinitions for namespace: C_AchievementTelemetry
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AchievementTelemetry.LinkAchievementInClub"] = {
	key = "C_AchievementTelemetry.LinkAchievementInClub",
	name = "LinkAchievementInClub",
	category = "combat_midnight",
	subcategory = "c_achievementtelemetry",
	func = _G["C_AchievementTelemetry"] and _G["C_AchievementTelemetry"]["LinkAchievementInClub"],
	funcPath = "C_AchievementTelemetry.LinkAchievementInClub",
	params = { { name = "achievementID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AchievementTelemetry.LinkAchievementInWhisper"] = {
	key = "C_AchievementTelemetry.LinkAchievementInWhisper",
	name = "LinkAchievementInWhisper",
	category = "combat_midnight",
	subcategory = "c_achievementtelemetry",
	func = _G["C_AchievementTelemetry"] and _G["C_AchievementTelemetry"]["LinkAchievementInWhisper"],
	funcPath = "C_AchievementTelemetry.LinkAchievementInWhisper",
	params = { { name = "achievementID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

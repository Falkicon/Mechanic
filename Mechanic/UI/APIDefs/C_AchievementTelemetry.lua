-- Generated APIDefinitions for namespace: C_AchievementTelemetry
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AchievementTelemetry.LinkAchievementInClub"] = {
    key = "C_AchievementTelemetry.LinkAchievementInClub",
    name = "LinkAchievementInClub",
    category = "achievement",
    subcategory = "c_achievementtelemetry",
    funcPath = "C_AchievementTelemetry.LinkAchievementInClub",
    params = { { name = "achievementID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AchievementTelemetry.LinkAchievementInWhisper"] = {
    key = "C_AchievementTelemetry.LinkAchievementInWhisper",
    name = "LinkAchievementInWhisper",
    category = "achievement",
    subcategory = "c_achievementtelemetry",
    funcPath = "C_AchievementTelemetry.LinkAchievementInWhisper",
    params = { { name = "achievementID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AchievementTelemetry.ShowAchievements"] = {
    key = "C_AchievementTelemetry.ShowAchievements",
    name = "ShowAchievements",
    category = "achievement",
    subcategory = "c_achievementtelemetry",
    funcPath = "C_AchievementTelemetry.ShowAchievements",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

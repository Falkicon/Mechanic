-- Generated APIDefinitions for namespace: C_AchievementInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AchievementInfo.AreGuildAchievementsEnabled"] = {
    key = "C_AchievementInfo.AreGuildAchievementsEnabled",
    name = "AreGuildAchievementsEnabled",
    category = "achievement",
    subcategory = "c_achievementinfo",
    func = _G["C_AchievementInfo"] and _G["C_AchievementInfo"]["AreGuildAchievementsEnabled"],
    funcPath = "C_AchievementInfo.AreGuildAchievementsEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AchievementInfo.GetRewardItemID"] = {
    key = "C_AchievementInfo.GetRewardItemID",
    name = "GetRewardItemID",
    category = "combat_midnight",
    subcategory = "c_achievementinfo",
    func = _G["C_AchievementInfo"] and _G["C_AchievementInfo"]["GetRewardItemID"],
    funcPath = "C_AchievementInfo.GetRewardItemID",
    params = { { name = "achievementID", type = "number", default = nil } },
    returns = { { name = "rewardItemID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AchievementInfo.GetSupercedingAchievements"] = {
    key = "C_AchievementInfo.GetSupercedingAchievements",
    name = "GetSupercedingAchievements",
    category = "combat_midnight",
    subcategory = "c_achievementinfo",
    func = _G["C_AchievementInfo"] and _G["C_AchievementInfo"]["GetSupercedingAchievements"],
    funcPath = "C_AchievementInfo.GetSupercedingAchievements",
    params = { { name = "achievementID", type = "number", default = nil } },
    returns = { { name = "supercedingAchievements", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AchievementInfo.IsGuildAchievement"] = {
    key = "C_AchievementInfo.IsGuildAchievement",
    name = "IsGuildAchievement",
    category = "combat_midnight",
    subcategory = "c_achievementinfo",
    func = _G["C_AchievementInfo"] and _G["C_AchievementInfo"]["IsGuildAchievement"],
    funcPath = "C_AchievementInfo.IsGuildAchievement",
    params = { { name = "achievementId", type = "number", default = nil } },
    returns = { { name = "isGuild", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AchievementInfo.IsValidAchievement"] = {
    key = "C_AchievementInfo.IsValidAchievement",
    name = "IsValidAchievement",
    category = "combat_midnight",
    subcategory = "c_achievementinfo",
    func = _G["C_AchievementInfo"] and _G["C_AchievementInfo"]["IsValidAchievement"],
    funcPath = "C_AchievementInfo.IsValidAchievement",
    params = { { name = "achievementId", type = "number", default = nil } },
    returns = { { name = "isValidAchievement", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AchievementInfo.SetPortraitTexture"] = {
    key = "C_AchievementInfo.SetPortraitTexture",
    name = "SetPortraitTexture",
    category = "combat_midnight",
    subcategory = "c_achievementinfo",
    func = _G["C_AchievementInfo"] and _G["C_AchievementInfo"]["SetPortraitTexture"],
    funcPath = "C_AchievementInfo.SetPortraitTexture",
    params = { { name = "textureObject", type = "SimpleTexture", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_PlayerMentorship
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PlayerMentorship.GetMentorLevelRequirement"] = {
    key = "C_PlayerMentorship.GetMentorLevelRequirement",
    name = "GetMentorLevelRequirement",
    category = "unit",
    subcategory = "c_playermentorship",
    func = _G["C_PlayerMentorship"] and _G["C_PlayerMentorship"]["GetMentorLevelRequirement"],
    funcPath = "C_PlayerMentorship.GetMentorLevelRequirement",
    params = {  },
    returns = { { name = "level", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PlayerMentorship.GetMentorRequirements"] = {
    key = "C_PlayerMentorship.GetMentorRequirements",
    name = "GetMentorRequirements",
    category = "unit",
    subcategory = "c_playermentorship",
    func = _G["C_PlayerMentorship"] and _G["C_PlayerMentorship"]["GetMentorRequirements"],
    funcPath = "C_PlayerMentorship.GetMentorRequirements",
    params = {  },
    returns = { { name = "achievementIDs", type = "table", canBeSecret = false }, { name = "optionalAchievementIDs", type = "table", canBeSecret = false }, { name = "optionalCompleteAtLeastCount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PlayerMentorship.GetMentorshipStatus"] = {
    key = "C_PlayerMentorship.GetMentorshipStatus",
    name = "GetMentorshipStatus",
    category = "combat_midnight",
    subcategory = "c_playermentorship",
    func = _G["C_PlayerMentorship"] and _G["C_PlayerMentorship"]["GetMentorshipStatus"],
    funcPath = "C_PlayerMentorship.GetMentorshipStatus",
    params = { { name = "playerLocation", type = "PlayerLocation", default = nil } },
    returns = { { name = "status", type = "PlayerMentorshipStatus", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PlayerMentorship.IsActivePlayerConsideredNewcomer"] = {
    key = "C_PlayerMentorship.IsActivePlayerConsideredNewcomer",
    name = "IsActivePlayerConsideredNewcomer",
    category = "unit",
    subcategory = "c_playermentorship",
    func = _G["C_PlayerMentorship"] and _G["C_PlayerMentorship"]["IsActivePlayerConsideredNewcomer"],
    funcPath = "C_PlayerMentorship.IsActivePlayerConsideredNewcomer",
    params = {  },
    returns = { { name = "isConsideredNewcomer", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PlayerMentorship.IsMentorRestricted"] = {
    key = "C_PlayerMentorship.IsMentorRestricted",
    name = "IsMentorRestricted",
    category = "unit",
    subcategory = "c_playermentorship",
    func = _G["C_PlayerMentorship"] and _G["C_PlayerMentorship"]["IsMentorRestricted"],
    funcPath = "C_PlayerMentorship.IsMentorRestricted",
    params = {  },
    returns = { { name = "isRestricted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

-- Generated APIDefinitions for namespace: C_PerksActivities
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PerksActivities.AddTrackedPerksActivity"] = {
    key = "C_PerksActivities.AddTrackedPerksActivity",
    name = "AddTrackedPerksActivity",
    category = "combat_midnight",
    subcategory = "c_perksactivities",
    func = _G["C_PerksActivities"] and _G["C_PerksActivities"]["AddTrackedPerksActivity"],
    funcPath = "C_PerksActivities.AddTrackedPerksActivity",
    params = { { name = "perksActivityID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksActivities.ClearPerksActivitiesPendingCompletion"] = {
    key = "C_PerksActivities.ClearPerksActivitiesPendingCompletion",
    name = "ClearPerksActivitiesPendingCompletion",
    category = "general",
    subcategory = "c_perksactivities",
    func = _G["C_PerksActivities"] and _G["C_PerksActivities"]["ClearPerksActivitiesPendingCompletion"],
    funcPath = "C_PerksActivities.ClearPerksActivitiesPendingCompletion",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksActivities.GetAllPerksActivityTags"] = {
    key = "C_PerksActivities.GetAllPerksActivityTags",
    name = "GetAllPerksActivityTags",
    category = "general",
    subcategory = "c_perksactivities",
    func = _G["C_PerksActivities"] and _G["C_PerksActivities"]["GetAllPerksActivityTags"],
    funcPath = "C_PerksActivities.GetAllPerksActivityTags",
    params = {  },
    returns = { { name = "tags", type = "PerksActivityTags", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksActivities.GetPerksActivitiesInfo"] = {
    key = "C_PerksActivities.GetPerksActivitiesInfo",
    name = "GetPerksActivitiesInfo",
    category = "general",
    subcategory = "c_perksactivities",
    func = _G["C_PerksActivities"] and _G["C_PerksActivities"]["GetPerksActivitiesInfo"],
    funcPath = "C_PerksActivities.GetPerksActivitiesInfo",
    params = {  },
    returns = { { name = "info", type = "PerksActivitiesInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksActivities.GetPerksActivitiesPendingCompletion"] = {
    key = "C_PerksActivities.GetPerksActivitiesPendingCompletion",
    name = "GetPerksActivitiesPendingCompletion",
    category = "general",
    subcategory = "c_perksactivities",
    func = _G["C_PerksActivities"] and _G["C_PerksActivities"]["GetPerksActivitiesPendingCompletion"],
    funcPath = "C_PerksActivities.GetPerksActivitiesPendingCompletion",
    params = {  },
    returns = { { name = "pending", type = "PerksActivitiesPending", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksActivities.GetPerksActivityChatLink"] = {
    key = "C_PerksActivities.GetPerksActivityChatLink",
    name = "GetPerksActivityChatLink",
    category = "combat_midnight",
    subcategory = "c_perksactivities",
    func = _G["C_PerksActivities"] and _G["C_PerksActivities"]["GetPerksActivityChatLink"],
    funcPath = "C_PerksActivities.GetPerksActivityChatLink",
    params = { { name = "perksActivityID", type = "number", default = nil } },
    returns = { { name = "link", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksActivities.GetPerksActivityInfo"] = {
    key = "C_PerksActivities.GetPerksActivityInfo",
    name = "GetPerksActivityInfo",
    category = "combat_midnight",
    subcategory = "c_perksactivities",
    func = _G["C_PerksActivities"] and _G["C_PerksActivities"]["GetPerksActivityInfo"],
    funcPath = "C_PerksActivities.GetPerksActivityInfo",
    params = { { name = "perksActivityID", type = "number", default = nil } },
    returns = { { name = "info", type = "PerksActivityInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PerksActivities.GetPerksUIThemePrefix"] = {
    key = "C_PerksActivities.GetPerksUIThemePrefix",
    name = "GetPerksUIThemePrefix",
    category = "general",
    subcategory = "c_perksactivities",
    func = _G["C_PerksActivities"] and _G["C_PerksActivities"]["GetPerksUIThemePrefix"],
    funcPath = "C_PerksActivities.GetPerksUIThemePrefix",
    params = {  },
    returns = { { name = "kitPrefix", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksActivities.GetTrackedPerksActivities"] = {
    key = "C_PerksActivities.GetTrackedPerksActivities",
    name = "GetTrackedPerksActivities",
    category = "general",
    subcategory = "c_perksactivities",
    func = _G["C_PerksActivities"] and _G["C_PerksActivities"]["GetTrackedPerksActivities"],
    funcPath = "C_PerksActivities.GetTrackedPerksActivities",
    params = {  },
    returns = { { name = "trackedPerksActivities", type = "PerksActivitiesTracked", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_PerksActivities.RemoveTrackedPerksActivity"] = {
    key = "C_PerksActivities.RemoveTrackedPerksActivity",
    name = "RemoveTrackedPerksActivity",
    category = "combat_midnight",
    subcategory = "c_perksactivities",
    func = _G["C_PerksActivities"] and _G["C_PerksActivities"]["RemoveTrackedPerksActivity"],
    funcPath = "C_PerksActivities.RemoveTrackedPerksActivity",
    params = { { name = "perksActivityID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

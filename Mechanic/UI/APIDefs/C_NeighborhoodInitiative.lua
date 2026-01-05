-- Generated APIDefinitions for namespace: C_NeighborhoodInitiative
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_NeighborhoodInitiative.AddTrackedInitiativeTask"] = {
    key = "C_NeighborhoodInitiative.AddTrackedInitiativeTask",
    name = "AddTrackedInitiativeTask",
    category = "combat_midnight",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["AddTrackedInitiativeTask"],
    funcPath = "C_NeighborhoodInitiative.AddTrackedInitiativeTask",
    params = { { name = "initiativeTaskID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NeighborhoodInitiative.GetInitiativeActivityLogInfo"] = {
    key = "C_NeighborhoodInitiative.GetInitiativeActivityLogInfo",
    name = "GetInitiativeActivityLogInfo",
    category = "general",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["GetInitiativeActivityLogInfo"],
    funcPath = "C_NeighborhoodInitiative.GetInitiativeActivityLogInfo",
    params = {  },
    returns = { { name = "info", type = "InitiativeActivityLogInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_NeighborhoodInitiative.GetInitiativeTaskChatLink"] = {
    key = "C_NeighborhoodInitiative.GetInitiativeTaskChatLink",
    name = "GetInitiativeTaskChatLink",
    category = "combat_midnight",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["GetInitiativeTaskChatLink"],
    funcPath = "C_NeighborhoodInitiative.GetInitiativeTaskChatLink",
    params = { { name = "initiativeTaskID", type = "number", default = nil } },
    returns = { { name = "link", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NeighborhoodInitiative.GetInitiativeTaskInfo"] = {
    key = "C_NeighborhoodInitiative.GetInitiativeTaskInfo",
    name = "GetInitiativeTaskInfo",
    category = "combat_midnight",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["GetInitiativeTaskInfo"],
    funcPath = "C_NeighborhoodInitiative.GetInitiativeTaskInfo",
    params = { { name = "initiativeTaskID", type = "number", default = nil } },
    returns = { { name = "info", type = "InitiativeTaskInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NeighborhoodInitiative.GetNeighborhoodInitiativeInfo"] = {
    key = "C_NeighborhoodInitiative.GetNeighborhoodInitiativeInfo",
    name = "GetNeighborhoodInitiativeInfo",
    category = "general",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["GetNeighborhoodInitiativeInfo"],
    funcPath = "C_NeighborhoodInitiative.GetNeighborhoodInitiativeInfo",
    params = {  },
    returns = { { name = "info", type = "NeighborhoodInitiativeInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_NeighborhoodInitiative.GetRequiredLevel"] = {
    key = "C_NeighborhoodInitiative.GetRequiredLevel",
    name = "GetRequiredLevel",
    category = "general",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["GetRequiredLevel"],
    funcPath = "C_NeighborhoodInitiative.GetRequiredLevel",
    params = {  },
    returns = { { name = "reqLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_NeighborhoodInitiative.GetTrackedInitiativeTasks"] = {
    key = "C_NeighborhoodInitiative.GetTrackedInitiativeTasks",
    name = "GetTrackedInitiativeTasks",
    category = "general",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["GetTrackedInitiativeTasks"],
    funcPath = "C_NeighborhoodInitiative.GetTrackedInitiativeTasks",
    params = {  },
    returns = { { name = "trackedInitiativeTasks", type = "InitiativeTasksTracked", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_NeighborhoodInitiative.IsInitiativeEnabled"] = {
    key = "C_NeighborhoodInitiative.IsInitiativeEnabled",
    name = "IsInitiativeEnabled",
    category = "general",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["IsInitiativeEnabled"],
    funcPath = "C_NeighborhoodInitiative.IsInitiativeEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_NeighborhoodInitiative.IsPlayerInNeighborhoodGroup"] = {
    key = "C_NeighborhoodInitiative.IsPlayerInNeighborhoodGroup",
    name = "IsPlayerInNeighborhoodGroup",
    category = "general",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["IsPlayerInNeighborhoodGroup"],
    funcPath = "C_NeighborhoodInitiative.IsPlayerInNeighborhoodGroup",
    params = {  },
    returns = { { name = "inValidGroup", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_NeighborhoodInitiative.IsViewingActiveNeighborhood"] = {
    key = "C_NeighborhoodInitiative.IsViewingActiveNeighborhood",
    name = "IsViewingActiveNeighborhood",
    category = "general",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["IsViewingActiveNeighborhood"],
    funcPath = "C_NeighborhoodInitiative.IsViewingActiveNeighborhood",
    params = {  },
    returns = { { name = "isViewingActiveNeighborhood", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_NeighborhoodInitiative.PlayerMeetsRequiredLevel"] = {
    key = "C_NeighborhoodInitiative.PlayerMeetsRequiredLevel",
    name = "PlayerMeetsRequiredLevel",
    category = "general",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["PlayerMeetsRequiredLevel"],
    funcPath = "C_NeighborhoodInitiative.PlayerMeetsRequiredLevel",
    params = {  },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_NeighborhoodInitiative.RemoveTrackedInitiativeTask"] = {
    key = "C_NeighborhoodInitiative.RemoveTrackedInitiativeTask",
    name = "RemoveTrackedInitiativeTask",
    category = "combat_midnight",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["RemoveTrackedInitiativeTask"],
    funcPath = "C_NeighborhoodInitiative.RemoveTrackedInitiativeTask",
    params = { { name = "initiativeTaskID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NeighborhoodInitiative.RequestInitiativeActivityLog"] = {
    key = "C_NeighborhoodInitiative.RequestInitiativeActivityLog",
    name = "RequestInitiativeActivityLog",
    category = "general",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["RequestInitiativeActivityLog"],
    funcPath = "C_NeighborhoodInitiative.RequestInitiativeActivityLog",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_NeighborhoodInitiative.RequestNeighborhoodInitiativeInfo"] = {
    key = "C_NeighborhoodInitiative.RequestNeighborhoodInitiativeInfo",
    name = "RequestNeighborhoodInitiativeInfo",
    category = "general",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["RequestNeighborhoodInitiativeInfo"],
    funcPath = "C_NeighborhoodInitiative.RequestNeighborhoodInitiativeInfo",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_NeighborhoodInitiative.SetActiveNeighborhood"] = {
    key = "C_NeighborhoodInitiative.SetActiveNeighborhood",
    name = "SetActiveNeighborhood",
    category = "combat_midnight",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["SetActiveNeighborhood"],
    funcPath = "C_NeighborhoodInitiative.SetActiveNeighborhood",
    params = { { name = "neighborhoodGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NeighborhoodInitiative.SetViewingNeighborhood"] = {
    key = "C_NeighborhoodInitiative.SetViewingNeighborhood",
    name = "SetViewingNeighborhood",
    category = "combat_midnight",
    subcategory = "c_neighborhoodinitiative",
    func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["SetViewingNeighborhood"],
    funcPath = "C_NeighborhoodInitiative.SetViewingNeighborhood",
    params = { { name = "neighborhoodGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

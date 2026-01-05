-- Generated APIDefinitions for namespace: C_SuperTrack
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SuperTrack.ClearAllSuperTracked"] = {
    key = "C_SuperTrack.ClearAllSuperTracked",
    name = "ClearAllSuperTracked",
    category = "general",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["ClearAllSuperTracked"],
    funcPath = "C_SuperTrack.ClearAllSuperTracked",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_SuperTrack.ClearSuperTrackedContent"] = {
    key = "C_SuperTrack.ClearSuperTrackedContent",
    name = "ClearSuperTrackedContent",
    category = "general",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["ClearSuperTrackedContent"],
    funcPath = "C_SuperTrack.ClearSuperTrackedContent",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_SuperTrack.ClearSuperTrackedMapPin"] = {
    key = "C_SuperTrack.ClearSuperTrackedMapPin",
    name = "ClearSuperTrackedMapPin",
    category = "general",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["ClearSuperTrackedMapPin"],
    funcPath = "C_SuperTrack.ClearSuperTrackedMapPin",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_SuperTrack.GetHighestPrioritySuperTrackingType"] = {
    key = "C_SuperTrack.GetHighestPrioritySuperTrackingType",
    name = "GetHighestPrioritySuperTrackingType",
    category = "general",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["GetHighestPrioritySuperTrackingType"],
    funcPath = "C_SuperTrack.GetHighestPrioritySuperTrackingType",
    params = {  },
    returns = { { name = "type", type = "SuperTrackingType", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SuperTrack.GetNextWaypointForMap"] = {
    key = "C_SuperTrack.GetNextWaypointForMap",
    name = "GetNextWaypointForMap",
    category = "combat_midnight",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["GetNextWaypointForMap"],
    funcPath = "C_SuperTrack.GetNextWaypointForMap",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "x", type = "number", canBeSecret = false }, { name = "y", type = "number", canBeSecret = false }, { name = "waypointDescription", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SuperTrack.GetSuperTrackedContent"] = {
    key = "C_SuperTrack.GetSuperTrackedContent",
    name = "GetSuperTrackedContent",
    category = "general",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["GetSuperTrackedContent"],
    funcPath = "C_SuperTrack.GetSuperTrackedContent",
    params = {  },
    returns = { { name = "trackableType", type = "ContentTrackingType", canBeSecret = false }, { name = "trackableID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SuperTrack.GetSuperTrackedItemName"] = {
    key = "C_SuperTrack.GetSuperTrackedItemName",
    name = "GetSuperTrackedItemName",
    category = "general",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["GetSuperTrackedItemName"],
    funcPath = "C_SuperTrack.GetSuperTrackedItemName",
    params = {  },
    returns = { { name = "name", type = "string", canBeSecret = false }, { name = "description", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SuperTrack.GetSuperTrackedMapPin"] = {
    key = "C_SuperTrack.GetSuperTrackedMapPin",
    name = "GetSuperTrackedMapPin",
    category = "general",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["GetSuperTrackedMapPin"],
    funcPath = "C_SuperTrack.GetSuperTrackedMapPin",
    params = {  },
    returns = { { name = "type", type = "SuperTrackingMapPinType", canBeSecret = false }, { name = "typeID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SuperTrack.GetSuperTrackedQuestID"] = {
    key = "C_SuperTrack.GetSuperTrackedQuestID",
    name = "GetSuperTrackedQuestID",
    category = "general",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["GetSuperTrackedQuestID"],
    funcPath = "C_SuperTrack.GetSuperTrackedQuestID",
    params = {  },
    returns = { { name = "questID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SuperTrack.GetSuperTrackedVignette"] = {
    key = "C_SuperTrack.GetSuperTrackedVignette",
    name = "GetSuperTrackedVignette",
    category = "general",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["GetSuperTrackedVignette"],
    funcPath = "C_SuperTrack.GetSuperTrackedVignette",
    params = {  },
    returns = { { name = "vignetteGUID", type = "WOWGUID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SuperTrack.IsSuperTrackingAnything"] = {
    key = "C_SuperTrack.IsSuperTrackingAnything",
    name = "IsSuperTrackingAnything",
    category = "general",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["IsSuperTrackingAnything"],
    funcPath = "C_SuperTrack.IsSuperTrackingAnything",
    params = {  },
    returns = { { name = "isSuperTracking", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SuperTrack.IsSuperTrackingContent"] = {
    key = "C_SuperTrack.IsSuperTrackingContent",
    name = "IsSuperTrackingContent",
    category = "general",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["IsSuperTrackingContent"],
    funcPath = "C_SuperTrack.IsSuperTrackingContent",
    params = {  },
    returns = { { name = "isSuperTracking", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SuperTrack.IsSuperTrackingCorpse"] = {
    key = "C_SuperTrack.IsSuperTrackingCorpse",
    name = "IsSuperTrackingCorpse",
    category = "general",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["IsSuperTrackingCorpse"],
    funcPath = "C_SuperTrack.IsSuperTrackingCorpse",
    params = {  },
    returns = { { name = "isSuperTracking", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SuperTrack.IsSuperTrackingMapPin"] = {
    key = "C_SuperTrack.IsSuperTrackingMapPin",
    name = "IsSuperTrackingMapPin",
    category = "general",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["IsSuperTrackingMapPin"],
    funcPath = "C_SuperTrack.IsSuperTrackingMapPin",
    params = {  },
    returns = { { name = "isSuperTracking", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SuperTrack.IsSuperTrackingQuest"] = {
    key = "C_SuperTrack.IsSuperTrackingQuest",
    name = "IsSuperTrackingQuest",
    category = "general",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["IsSuperTrackingQuest"],
    funcPath = "C_SuperTrack.IsSuperTrackingQuest",
    params = {  },
    returns = { { name = "isSuperTracking", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SuperTrack.IsSuperTrackingUserWaypoint"] = {
    key = "C_SuperTrack.IsSuperTrackingUserWaypoint",
    name = "IsSuperTrackingUserWaypoint",
    category = "general",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["IsSuperTrackingUserWaypoint"],
    funcPath = "C_SuperTrack.IsSuperTrackingUserWaypoint",
    params = {  },
    returns = { { name = "isSuperTracking", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_SuperTrack.SetSuperTrackedContent"] = {
    key = "C_SuperTrack.SetSuperTrackedContent",
    name = "SetSuperTrackedContent",
    category = "combat_midnight",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["SetSuperTrackedContent"],
    funcPath = "C_SuperTrack.SetSuperTrackedContent",
    params = { { name = "trackableType", type = "ContentTrackingType", default = nil }, { name = "trackableID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SuperTrack.SetSuperTrackedMapPin"] = {
    key = "C_SuperTrack.SetSuperTrackedMapPin",
    name = "SetSuperTrackedMapPin",
    category = "combat_midnight",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["SetSuperTrackedMapPin"],
    funcPath = "C_SuperTrack.SetSuperTrackedMapPin",
    params = { { name = "type", type = "SuperTrackingMapPinType", default = nil }, { name = "typeID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SuperTrack.SetSuperTrackedQuestID"] = {
    key = "C_SuperTrack.SetSuperTrackedQuestID",
    name = "SetSuperTrackedQuestID",
    category = "combat_midnight",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["SetSuperTrackedQuestID"],
    funcPath = "C_SuperTrack.SetSuperTrackedQuestID",
    params = { { name = "questID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SuperTrack.SetSuperTrackedUserWaypoint"] = {
    key = "C_SuperTrack.SetSuperTrackedUserWaypoint",
    name = "SetSuperTrackedUserWaypoint",
    category = "combat_midnight",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["SetSuperTrackedUserWaypoint"],
    funcPath = "C_SuperTrack.SetSuperTrackedUserWaypoint",
    params = { { name = "superTracked", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SuperTrack.SetSuperTrackedVignette"] = {
    key = "C_SuperTrack.SetSuperTrackedVignette",
    name = "SetSuperTrackedVignette",
    category = "combat_midnight",
    subcategory = "c_supertrack",
    func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["SetSuperTrackedVignette"],
    funcPath = "C_SuperTrack.SetSuperTrackedVignette",
    params = { { name = "vignetteGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

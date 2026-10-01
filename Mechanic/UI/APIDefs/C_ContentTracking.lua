-- Generated APIDefinitions for namespace: C_ContentTracking
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ContentTracking.GetBestMapForTrackable"] = {
    key = "C_ContentTracking.GetBestMapForTrackable",
    name = "GetBestMapForTrackable",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.GetBestMapForTrackable",
    params = { { name = "trackableType", type = "ContentTrackingType", default = nil }, { name = "trackableID", type = "number", default = nil }, { name = "ignoreWaypoint", type = "bool", default = false } },
    returns = { { name = "result", type = "ContentTrackingResult", canBeSecret = false }, { name = "mapID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetCollectableSourceTrackingEnabled"] = {
    key = "C_ContentTracking.GetCollectableSourceTrackingEnabled",
    name = "GetCollectableSourceTrackingEnabled",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.GetCollectableSourceTrackingEnabled",
    params = {  },
    returns = { { name = "isEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ContentTracking.GetCollectableSourceTypes"] = {
    key = "C_ContentTracking.GetCollectableSourceTypes",
    name = "GetCollectableSourceTypes",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.GetCollectableSourceTypes",
    params = {  },
    returns = { { name = "collectableSourceTypes", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_ContentTracking.GetCurrentTrackingTarget"] = {
    key = "C_ContentTracking.GetCurrentTrackingTarget",
    name = "GetCurrentTrackingTarget",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.GetCurrentTrackingTarget",
    params = { { name = "type", type = "ContentTrackingType", default = nil }, { name = "id", type = "number", default = nil } },
    returns = { { name = "targetType", type = "ContentTrackingTargetType", canBeSecret = false }, { name = "targetID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetEncounterTrackingInfo"] = {
    key = "C_ContentTracking.GetEncounterTrackingInfo",
    name = "GetEncounterTrackingInfo",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.GetEncounterTrackingInfo",
    params = { { name = "journalEncounterID", type = "number", default = nil } },
    returns = { { name = "trackingInfo", type = "EncounterTrackingInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetNextWaypointForTrackable"] = {
    key = "C_ContentTracking.GetNextWaypointForTrackable",
    name = "GetNextWaypointForTrackable",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.GetNextWaypointForTrackable",
    params = { { name = "trackableType", type = "ContentTrackingType", default = nil }, { name = "trackableID", type = "number", default = nil }, { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "result", type = "ContentTrackingResult", canBeSecret = false }, { name = "mapInfo", type = "ContentTrackingMapInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetObjectiveText"] = {
    key = "C_ContentTracking.GetObjectiveText",
    name = "GetObjectiveText",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.GetObjectiveText",
    params = { { name = "targetType", type = "ContentTrackingTargetType", default = nil }, { name = "targetID", type = "number", default = nil }, { name = "includeHyperlinks", type = "bool", default = true } },
    returns = { { name = "objectiveText", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetTitle"] = {
    key = "C_ContentTracking.GetTitle",
    name = "GetTitle",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.GetTitle",
    params = { { name = "trackableType", type = "ContentTrackingType", default = nil }, { name = "trackableID", type = "number", default = nil } },
    returns = { { name = "title", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetTrackablesOnMap"] = {
    key = "C_ContentTracking.GetTrackablesOnMap",
    name = "GetTrackablesOnMap",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.GetTrackablesOnMap",
    params = { { name = "trackableType", type = "ContentTrackingType", default = nil }, { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "result", type = "ContentTrackingResult", canBeSecret = false }, { name = "trackableMapInfos", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetTrackedIDs"] = {
    key = "C_ContentTracking.GetTrackedIDs",
    name = "GetTrackedIDs",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.GetTrackedIDs",
    params = { { name = "trackableType", type = "ContentTrackingType", default = nil } },
    returns = { { name = "entryIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetVendorTrackingInfo"] = {
    key = "C_ContentTracking.GetVendorTrackingInfo",
    name = "GetVendorTrackingInfo",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.GetVendorTrackingInfo",
    params = { { name = "collectableEntryID", type = "number", default = nil } },
    returns = { { name = "vendorTrackingInfo", type = "VendorTrackingInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetWaypointText"] = {
    key = "C_ContentTracking.GetWaypointText",
    name = "GetWaypointText",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.GetWaypointText",
    params = { { name = "trackableType", type = "ContentTrackingType", default = nil }, { name = "trackableID", type = "number", default = nil } },
    returns = { { name = "waypointText", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.IsNavigable"] = {
    key = "C_ContentTracking.IsNavigable",
    name = "IsNavigable",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.IsNavigable",
    params = { { name = "trackableType", type = "ContentTrackingType", default = nil }, { name = "trackableID", type = "number", default = nil } },
    returns = { { name = "result", type = "ContentTrackingResult", canBeSecret = false }, { name = "isNavigable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.IsTrackable"] = {
    key = "C_ContentTracking.IsTrackable",
    name = "IsTrackable",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.IsTrackable",
    params = { { name = "type", type = "ContentTrackingType", default = nil }, { name = "id", type = "number", default = nil } },
    returns = { { name = "isTrackable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.IsTracking"] = {
    key = "C_ContentTracking.IsTracking",
    name = "IsTracking",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.IsTracking",
    params = { { name = "type", type = "ContentTrackingType", default = nil }, { name = "id", type = "number", default = nil } },
    returns = { { name = "isTracking", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.StartTracking"] = {
    key = "C_ContentTracking.StartTracking",
    name = "StartTracking",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.StartTracking",
    params = { { name = "type", type = "ContentTrackingType", default = nil }, { name = "id", type = "number", default = nil } },
    returns = { { name = "error", type = "ContentTrackingError", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.StopTracking"] = {
    key = "C_ContentTracking.StopTracking",
    name = "StopTracking",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.StopTracking",
    params = { { name = "type", type = "ContentTrackingType", default = nil }, { name = "id", type = "number", default = nil }, { name = "stopType", type = "ContentTrackingStopType", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.ToggleTracking"] = {
    key = "C_ContentTracking.ToggleTracking",
    name = "ToggleTracking",
    category = "general",
    subcategory = "c_contenttracking",
    funcPath = "C_ContentTracking.ToggleTracking",
    params = { { name = "type", type = "ContentTrackingType", default = nil }, { name = "id", type = "number", default = nil }, { name = "stopType", type = "ContentTrackingStopType", default = nil } },
    returns = { { name = "error", type = "ContentTrackingError", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

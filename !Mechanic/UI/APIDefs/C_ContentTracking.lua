-- Generated APIDefinitions for namespace: C_ContentTracking
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ContentTracking.GetBestMapForTrackable"] = {
	key = "C_ContentTracking.GetBestMapForTrackable",
	name = "GetBestMapForTrackable",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["GetBestMapForTrackable"],
	funcPath = "C_ContentTracking.GetBestMapForTrackable",
	params = {
		{ name = "trackableType", type = "ContentTrackingType", default = nil },
		{ name = "trackableID", type = "number", default = nil },
		{ name = "ignoreWaypoint", type = "bool", default = false },
	},
	returns = {
		{ name = "result", type = "ContentTrackingResult", canBeSecret = false },
		{ name = "mapID", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetCurrentTrackingTarget"] = {
	key = "C_ContentTracking.GetCurrentTrackingTarget",
	name = "GetCurrentTrackingTarget",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["GetCurrentTrackingTarget"],
	funcPath = "C_ContentTracking.GetCurrentTrackingTarget",
	params = {
		{ name = "type", type = "ContentTrackingType", default = nil },
		{ name = "id", type = "number", default = nil },
	},
	returns = {
		{ name = "targetType", type = "ContentTrackingTargetType", canBeSecret = false },
		{ name = "targetID", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetEncounterTrackingInfo"] = {
	key = "C_ContentTracking.GetEncounterTrackingInfo",
	name = "GetEncounterTrackingInfo",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["GetEncounterTrackingInfo"],
	funcPath = "C_ContentTracking.GetEncounterTrackingInfo",
	params = { { name = "journalEncounterID", type = "number", default = nil } },
	returns = { { name = "trackingInfo", type = "EncounterTrackingInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetNextWaypointForTrackable"] = {
	key = "C_ContentTracking.GetNextWaypointForTrackable",
	name = "GetNextWaypointForTrackable",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["GetNextWaypointForTrackable"],
	funcPath = "C_ContentTracking.GetNextWaypointForTrackable",
	params = {
		{ name = "trackableType", type = "ContentTrackingType", default = nil },
		{ name = "trackableID", type = "number", default = nil },
		{ name = "uiMapID", type = "number", default = nil },
	},
	returns = {
		{ name = "result", type = "ContentTrackingResult", canBeSecret = false },
		{ name = "mapInfo", type = "ContentTrackingMapInfo", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetObjectiveText"] = {
	key = "C_ContentTracking.GetObjectiveText",
	name = "GetObjectiveText",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["GetObjectiveText"],
	funcPath = "C_ContentTracking.GetObjectiveText",
	params = {
		{ name = "targetType", type = "ContentTrackingTargetType", default = nil },
		{ name = "targetID", type = "number", default = nil },
		{ name = "includeHyperlinks", type = "bool", default = true },
	},
	returns = { { name = "objectiveText", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetTitle"] = {
	key = "C_ContentTracking.GetTitle",
	name = "GetTitle",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["GetTitle"],
	funcPath = "C_ContentTracking.GetTitle",
	params = {
		{
			name = "trackableType",
			type = "ContentTrackingType",
			default = nil,
			examples = { { value = "id", label = "Narcissus" }, { value = "matchedIDs[i][2]", label = "Narcissus" } },
		},
		{ name = "trackableID", type = "number", default = nil },
	},
	returns = { { name = "title", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetTrackablesOnMap"] = {
	key = "C_ContentTracking.GetTrackablesOnMap",
	name = "GetTrackablesOnMap",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["GetTrackablesOnMap"],
	funcPath = "C_ContentTracking.GetTrackablesOnMap",
	params = {
		{ name = "trackableType", type = "ContentTrackingType", default = nil },
		{ name = "uiMapID", type = "number", default = nil },
	},
	returns = {
		{ name = "result", type = "ContentTrackingResult", canBeSecret = false },
		{ name = "trackableMapInfos", type = "table", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetTrackedIDs"] = {
	key = "C_ContentTracking.GetTrackedIDs",
	name = "GetTrackedIDs",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["GetTrackedIDs"],
	funcPath = "C_ContentTracking.GetTrackedIDs",
	params = {
		{
			name = "trackableType",
			type = "ContentTrackingType",
			default = nil,
			examples = { { value = 2, label = "BigWigs_Plugins" } },
		},
	},
	returns = { { name = "entryIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetVendorTrackingInfo"] = {
	key = "C_ContentTracking.GetVendorTrackingInfo",
	name = "GetVendorTrackingInfo",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["GetVendorTrackingInfo"],
	funcPath = "C_ContentTracking.GetVendorTrackingInfo",
	params = { { name = "collectableEntryID", type = "number", default = nil } },
	returns = { { name = "vendorTrackingInfo", type = "VendorTrackingInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.GetWaypointText"] = {
	key = "C_ContentTracking.GetWaypointText",
	name = "GetWaypointText",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["GetWaypointText"],
	funcPath = "C_ContentTracking.GetWaypointText",
	params = {
		{ name = "trackableType", type = "ContentTrackingType", default = nil },
		{ name = "trackableID", type = "number", default = nil },
	},
	returns = { { name = "waypointText", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.IsNavigable"] = {
	key = "C_ContentTracking.IsNavigable",
	name = "IsNavigable",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["IsNavigable"],
	funcPath = "C_ContentTracking.IsNavigable",
	params = {
		{ name = "trackableType", type = "ContentTrackingType", default = nil },
		{ name = "trackableID", type = "number", default = nil },
	},
	returns = {
		{ name = "result", type = "ContentTrackingResult", canBeSecret = false },
		{ name = "isNavigable", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.IsTrackable"] = {
	key = "C_ContentTracking.IsTrackable",
	name = "IsTrackable",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["IsTrackable"],
	funcPath = "C_ContentTracking.IsTrackable",
	params = {
		{ name = "type", type = "ContentTrackingType", default = nil },
		{ name = "id", type = "number", default = nil },
	},
	returns = { { name = "isTrackable", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.IsTracking"] = {
	key = "C_ContentTracking.IsTracking",
	name = "IsTracking",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["IsTracking"],
	funcPath = "C_ContentTracking.IsTracking",
	params = {
		{
			name = "type",
			type = "ContentTrackingType",
			default = nil,
			examples = {
				{ value = "TRACKING_TYPE_ACHV", label = "Narcissus_Achievements" },
				{ value = "type", label = "AllTheThings" },
			},
		},
		{ name = "id", type = "number", default = nil },
	},
	returns = { { name = "isTracking", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.StartTracking"] = {
	key = "C_ContentTracking.StartTracking",
	name = "StartTracking",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["StartTracking"],
	funcPath = "C_ContentTracking.StartTracking",
	params = {
		{
			name = "type",
			type = "ContentTrackingType",
			default = nil,
			examples = {
				{ value = "TRACKING_TYPE_ACHV", label = "Narcissus_Achievements" },
				{ value = "trackType", label = "Plumber" },
				{ value = "type", label = "AllTheThings" },
			},
		},
		{ name = "id", type = "number", default = nil },
	},
	returns = { { name = "error", type = "ContentTrackingError", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.StopTracking"] = {
	key = "C_ContentTracking.StopTracking",
	name = "StopTracking",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["StopTracking"],
	funcPath = "C_ContentTracking.StopTracking",
	params = {
		{
			name = "type",
			type = "ContentTrackingType",
			default = nil,
			examples = {
				{ value = "TRACKING_TYPE_ACHV", label = "Narcissus_Achievements" },
				{ value = "trackType", label = "Plumber" },
				{ value = "type", label = "AllTheThings" },
			},
		},
		{ name = "id", type = "number", default = nil },
		{ name = "stopType", type = "ContentTrackingStopType", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ContentTracking.ToggleTracking"] = {
	key = "C_ContentTracking.ToggleTracking",
	name = "ToggleTracking",
	category = "combat_midnight",
	subcategory = "c_contenttracking",
	func = _G["C_ContentTracking"] and _G["C_ContentTracking"]["ToggleTracking"],
	funcPath = "C_ContentTracking.ToggleTracking",
	params = {
		{
			name = "type",
			type = "ContentTrackingType",
			default = nil,
			examples = { { value = "id", label = "Narcissus_Achievements" } },
		},
		{ name = "id", type = "number", default = nil },
		{ name = "stopType", type = "ContentTrackingStopType", default = nil },
	},
	returns = { { name = "error", type = "ContentTrackingError", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

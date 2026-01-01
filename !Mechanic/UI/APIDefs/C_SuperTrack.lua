-- Generated APIDefinitions for namespace: C_SuperTrack
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SuperTrack.GetNextWaypointForMap"] = {
	key = "C_SuperTrack.GetNextWaypointForMap",
	name = "GetNextWaypointForMap",
	category = "combat_midnight",
	subcategory = "c_supertrack",
	func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["GetNextWaypointForMap"],
	funcPath = "C_SuperTrack.GetNextWaypointForMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = {
		{ name = "x", type = "number", canBeSecret = false },
		{ name = "y", type = "number", canBeSecret = false },
		{ name = "waypointDescription", type = "string", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SuperTrack.SetSuperTrackedContent"] = {
	key = "C_SuperTrack.SetSuperTrackedContent",
	name = "SetSuperTrackedContent",
	category = "combat_midnight",
	subcategory = "c_supertrack",
	func = _G["C_SuperTrack"] and _G["C_SuperTrack"]["SetSuperTrackedContent"],
	funcPath = "C_SuperTrack.SetSuperTrackedContent",
	params = {
		{ name = "trackableType", type = "ContentTrackingType", default = nil },
		{ name = "trackableID", type = "number", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "type", type = "SuperTrackingMapPinType", default = nil },
		{ name = "typeID", type = "number", default = nil },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

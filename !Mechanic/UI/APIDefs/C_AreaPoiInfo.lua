-- Generated APIDefinitions for namespace: C_AreaPoiInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AreaPoiInfo.GetAreaPOIForMap"] = {
	key = "C_AreaPoiInfo.GetAreaPOIForMap",
	name = "GetAreaPOIForMap",
	category = "combat_midnight",
	subcategory = "c_areapoiinfo",
	func = _G["C_AreaPoiInfo"] and _G["C_AreaPoiInfo"]["GetAreaPOIForMap"],
	funcPath = "C_AreaPoiInfo.GetAreaPOIForMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "areaPoiIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AreaPoiInfo.GetAreaPOIInfo"] = {
	key = "C_AreaPoiInfo.GetAreaPOIInfo",
	name = "GetAreaPOIInfo",
	category = "combat_midnight",
	subcategory = "c_areapoiinfo",
	func = _G["C_AreaPoiInfo"] and _G["C_AreaPoiInfo"]["GetAreaPOIInfo"],
	funcPath = "C_AreaPoiInfo.GetAreaPOIInfo",
	params = {
		{ name = "uiMapID", type = "number", default = nil, examples = { { value = "uiMapID", label = "Plumber" } } },
		{ name = "areaPoiID", type = "number", default = nil },
	},
	returns = { { name = "poiInfo", type = "AreaPOIInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AreaPoiInfo.GetAreaPOISecondsLeft"] = {
	key = "C_AreaPoiInfo.GetAreaPOISecondsLeft",
	name = "GetAreaPOISecondsLeft",
	category = "combat_midnight",
	subcategory = "c_areapoiinfo",
	func = _G["C_AreaPoiInfo"] and _G["C_AreaPoiInfo"]["GetAreaPOISecondsLeft"],
	funcPath = "C_AreaPoiInfo.GetAreaPOISecondsLeft",
	params = { { name = "areaPoiID", type = "number", default = nil } },
	returns = { { name = "secondsLeft", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AreaPoiInfo.GetDelvesForMap"] = {
	key = "C_AreaPoiInfo.GetDelvesForMap",
	name = "GetDelvesForMap",
	category = "combat_midnight",
	subcategory = "c_areapoiinfo",
	func = _G["C_AreaPoiInfo"] and _G["C_AreaPoiInfo"]["GetDelvesForMap"],
	funcPath = "C_AreaPoiInfo.GetDelvesForMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "areaPoiIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AreaPoiInfo.GetDragonridingRacesForMap"] = {
	key = "C_AreaPoiInfo.GetDragonridingRacesForMap",
	name = "GetDragonridingRacesForMap",
	category = "combat_midnight",
	subcategory = "c_areapoiinfo",
	func = _G["C_AreaPoiInfo"] and _G["C_AreaPoiInfo"]["GetDragonridingRacesForMap"],
	funcPath = "C_AreaPoiInfo.GetDragonridingRacesForMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "areaPoiIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AreaPoiInfo.GetEventsForMap"] = {
	key = "C_AreaPoiInfo.GetEventsForMap",
	name = "GetEventsForMap",
	category = "combat_midnight",
	subcategory = "c_areapoiinfo",
	func = _G["C_AreaPoiInfo"] and _G["C_AreaPoiInfo"]["GetEventsForMap"],
	funcPath = "C_AreaPoiInfo.GetEventsForMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "areaPoiIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AreaPoiInfo.GetQuestHubsForMap"] = {
	key = "C_AreaPoiInfo.GetQuestHubsForMap",
	name = "GetQuestHubsForMap",
	category = "combat_midnight",
	subcategory = "c_areapoiinfo",
	func = _G["C_AreaPoiInfo"] and _G["C_AreaPoiInfo"]["GetQuestHubsForMap"],
	funcPath = "C_AreaPoiInfo.GetQuestHubsForMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "areaPoiIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AreaPoiInfo.IsAreaPOITimed"] = {
	key = "C_AreaPoiInfo.IsAreaPOITimed",
	name = "IsAreaPOITimed",
	category = "combat_midnight",
	subcategory = "c_areapoiinfo",
	func = _G["C_AreaPoiInfo"] and _G["C_AreaPoiInfo"]["IsAreaPOITimed"],
	funcPath = "C_AreaPoiInfo.IsAreaPOITimed",
	params = { { name = "areaPoiID", type = "number", default = nil } },
	returns = {
		{ name = "isTimed", type = "bool", canBeSecret = false },
		{ name = "hideTimerInTooltip", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

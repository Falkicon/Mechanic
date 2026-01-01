-- Generated APIDefinitions for namespace: C_EventScheduler
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_EventScheduler.ClearReminder"] = {
	key = "C_EventScheduler.ClearReminder",
	name = "ClearReminder",
	category = "combat_midnight",
	subcategory = "c_eventscheduler",
	func = _G["C_EventScheduler"] and _G["C_EventScheduler"]["ClearReminder"],
	funcPath = "C_EventScheduler.ClearReminder",
	params = { { name = "eventKey", type = "string", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EventScheduler.GetEventUiMapID"] = {
	key = "C_EventScheduler.GetEventUiMapID",
	name = "GetEventUiMapID",
	category = "combat_midnight",
	subcategory = "c_eventscheduler",
	func = _G["C_EventScheduler"] and _G["C_EventScheduler"]["GetEventUiMapID"],
	funcPath = "C_EventScheduler.GetEventUiMapID",
	params = { { name = "areaPoiID", type = "number", default = nil } },
	returns = { { name = "uiMapID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EventScheduler.GetEventZoneName"] = {
	key = "C_EventScheduler.GetEventZoneName",
	name = "GetEventZoneName",
	category = "combat_midnight",
	subcategory = "c_eventscheduler",
	func = _G["C_EventScheduler"] and _G["C_EventScheduler"]["GetEventZoneName"],
	funcPath = "C_EventScheduler.GetEventZoneName",
	params = { { name = "areaPoiID", type = "number", default = nil } },
	returns = { { name = "name", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EventScheduler.SetReminder"] = {
	key = "C_EventScheduler.SetReminder",
	name = "SetReminder",
	category = "combat_midnight",
	subcategory = "c_eventscheduler",
	func = _G["C_EventScheduler"] and _G["C_EventScheduler"]["SetReminder"],
	funcPath = "C_EventScheduler.SetReminder",
	params = { { name = "eventKey", type = "string", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

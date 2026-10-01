-- Generated APIDefinitions for namespace: C_EventScheduler
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_EventScheduler.CanShowEvents"] = {
    key = "C_EventScheduler.CanShowEvents",
    name = "CanShowEvents",
    category = "general",
    subcategory = "c_eventscheduler",
    funcPath = "C_EventScheduler.CanShowEvents",
    params = {  },
    returns = { { name = "canShow", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_EventScheduler.ClearReminder"] = {
    key = "C_EventScheduler.ClearReminder",
    name = "ClearReminder",
    category = "general",
    subcategory = "c_eventscheduler",
    funcPath = "C_EventScheduler.ClearReminder",
    params = { { name = "eventKey", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EventScheduler.GetActiveContinentName"] = {
    key = "C_EventScheduler.GetActiveContinentName",
    name = "GetActiveContinentName",
    category = "general",
    subcategory = "c_eventscheduler",
    funcPath = "C_EventScheduler.GetActiveContinentName",
    params = {  },
    returns = { { name = "name", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_EventScheduler.GetEventUiMapID"] = {
    key = "C_EventScheduler.GetEventUiMapID",
    name = "GetEventUiMapID",
    category = "general",
    subcategory = "c_eventscheduler",
    funcPath = "C_EventScheduler.GetEventUiMapID",
    params = { { name = "areaPoiID", type = "number", default = nil } },
    returns = { { name = "uiMapID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EventScheduler.GetEventZoneName"] = {
    key = "C_EventScheduler.GetEventZoneName",
    name = "GetEventZoneName",
    category = "general",
    subcategory = "c_eventscheduler",
    funcPath = "C_EventScheduler.GetEventZoneName",
    params = { { name = "areaPoiID", type = "number", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EventScheduler.GetOngoingEvents"] = {
    key = "C_EventScheduler.GetOngoingEvents",
    name = "GetOngoingEvents",
    category = "general",
    subcategory = "c_eventscheduler",
    funcPath = "C_EventScheduler.GetOngoingEvents",
    params = {  },
    returns = { { name = "events", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_EventScheduler.GetScheduledEvents"] = {
    key = "C_EventScheduler.GetScheduledEvents",
    name = "GetScheduledEvents",
    category = "general",
    subcategory = "c_eventscheduler",
    funcPath = "C_EventScheduler.GetScheduledEvents",
    params = {  },
    returns = { { name = "events", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_EventScheduler.HasData"] = {
    key = "C_EventScheduler.HasData",
    name = "HasData",
    category = "general",
    subcategory = "c_eventscheduler",
    funcPath = "C_EventScheduler.HasData",
    params = {  },
    returns = { { name = "hasData", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_EventScheduler.HasSavedReminders"] = {
    key = "C_EventScheduler.HasSavedReminders",
    name = "HasSavedReminders",
    category = "general",
    subcategory = "c_eventscheduler",
    funcPath = "C_EventScheduler.HasSavedReminders",
    params = {  },
    returns = { { name = "hasSavedReminders", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_EventScheduler.RequestEvents"] = {
    key = "C_EventScheduler.RequestEvents",
    name = "RequestEvents",
    category = "general",
    subcategory = "c_eventscheduler",
    funcPath = "C_EventScheduler.RequestEvents",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_EventScheduler.SetReminder"] = {
    key = "C_EventScheduler.SetReminder",
    name = "SetReminder",
    category = "general",
    subcategory = "c_eventscheduler",
    funcPath = "C_EventScheduler.SetReminder",
    params = { { name = "eventKey", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

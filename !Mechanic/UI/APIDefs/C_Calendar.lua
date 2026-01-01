-- Generated APIDefinitions for namespace: C_Calendar
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Calendar.ContextMenuEventCanComplain"] = {
	key = "C_Calendar.ContextMenuEventCanComplain",
	name = "ContextMenuEventCanComplain",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuEventCanComplain"],
	funcPath = "C_Calendar.ContextMenuEventCanComplain",
	params = {
		{ name = "offsetMonths", type = "number", default = nil },
		{ name = "monthDay", type = "luaIndex", default = nil },
		{ name = "eventIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "canComplain", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.ContextMenuEventCanEdit"] = {
	key = "C_Calendar.ContextMenuEventCanEdit",
	name = "ContextMenuEventCanEdit",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuEventCanEdit"],
	funcPath = "C_Calendar.ContextMenuEventCanEdit",
	params = {
		{ name = "offsetMonths", type = "number", default = nil },
		{ name = "monthDay", type = "luaIndex", default = nil },
		{ name = "eventIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "canEdit", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.ContextMenuEventCanRemove"] = {
	key = "C_Calendar.ContextMenuEventCanRemove",
	name = "ContextMenuEventCanRemove",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuEventCanRemove"],
	funcPath = "C_Calendar.ContextMenuEventCanRemove",
	params = {
		{ name = "offsetMonths", type = "number", default = nil },
		{ name = "monthDay", type = "luaIndex", default = nil },
		{ name = "eventIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "canRemove", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.ContextMenuEventPaste"] = {
	key = "C_Calendar.ContextMenuEventPaste",
	name = "ContextMenuEventPaste",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuEventPaste"],
	funcPath = "C_Calendar.ContextMenuEventPaste",
	params = {
		{ name = "offsetMonths", type = "number", default = nil },
		{ name = "monthDay", type = "luaIndex", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.ContextMenuSelectEvent"] = {
	key = "C_Calendar.ContextMenuSelectEvent",
	name = "ContextMenuSelectEvent",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuSelectEvent"],
	funcPath = "C_Calendar.ContextMenuSelectEvent",
	params = {
		{ name = "offsetMonths", type = "number", default = nil },
		{ name = "monthDay", type = "luaIndex", default = nil },
		{ name = "eventIndex", type = "luaIndex", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventClearModerator"] = {
	key = "C_Calendar.EventClearModerator",
	name = "EventClearModerator",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventClearModerator"],
	funcPath = "C_Calendar.EventClearModerator",
	params = { { name = "inviteIndex", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventGetInvite"] = {
	key = "C_Calendar.EventGetInvite",
	name = "EventGetInvite",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventGetInvite"],
	funcPath = "C_Calendar.EventGetInvite",
	params = { { name = "eventIndex", type = "luaIndex", default = nil } },
	returns = { { name = "info", type = "CalendarEventInviteInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventGetInviteResponseTime"] = {
	key = "C_Calendar.EventGetInviteResponseTime",
	name = "EventGetInviteResponseTime",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventGetInviteResponseTime"],
	funcPath = "C_Calendar.EventGetInviteResponseTime",
	params = { { name = "eventIndex", type = "luaIndex", default = nil } },
	returns = { { name = "time", type = "CalendarTime", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventGetStatusOptions"] = {
	key = "C_Calendar.EventGetStatusOptions",
	name = "EventGetStatusOptions",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventGetStatusOptions"],
	funcPath = "C_Calendar.EventGetStatusOptions",
	params = { { name = "eventIndex", type = "luaIndex", default = nil } },
	returns = { { name = "options", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventGetTextures"] = {
	key = "C_Calendar.EventGetTextures",
	name = "EventGetTextures",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventGetTextures"],
	funcPath = "C_Calendar.EventGetTextures",
	params = { { name = "eventType", type = "CalendarEventType", default = nil } },
	returns = { { name = "textures", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventInvite"] = {
	key = "C_Calendar.EventInvite",
	name = "EventInvite",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventInvite"],
	funcPath = "C_Calendar.EventInvite",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventRemoveInvite"] = {
	key = "C_Calendar.EventRemoveInvite",
	name = "EventRemoveInvite",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventRemoveInvite"],
	funcPath = "C_Calendar.EventRemoveInvite",
	params = { { name = "inviteIndex", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventRemoveInviteByGuid"] = {
	key = "C_Calendar.EventRemoveInviteByGuid",
	name = "EventRemoveInviteByGuid",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventRemoveInviteByGuid"],
	funcPath = "C_Calendar.EventRemoveInviteByGuid",
	params = { { name = "guid", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventSelectInvite"] = {
	key = "C_Calendar.EventSelectInvite",
	name = "EventSelectInvite",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventSelectInvite"],
	funcPath = "C_Calendar.EventSelectInvite",
	params = { { name = "inviteIndex", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventSetClubId"] = {
	key = "C_Calendar.EventSetClubId",
	name = "EventSetClubId",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventSetClubId"],
	funcPath = "C_Calendar.EventSetClubId",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventSetDate"] = {
	key = "C_Calendar.EventSetDate",
	name = "EventSetDate",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventSetDate"],
	funcPath = "C_Calendar.EventSetDate",
	params = {
		{ name = "month", type = "luaIndex", default = nil },
		{ name = "monthDay", type = "luaIndex", default = nil },
		{ name = "year", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventSetDescription"] = {
	key = "C_Calendar.EventSetDescription",
	name = "EventSetDescription",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventSetDescription"],
	funcPath = "C_Calendar.EventSetDescription",
	params = { { name = "description", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventSetInviteStatus"] = {
	key = "C_Calendar.EventSetInviteStatus",
	name = "EventSetInviteStatus",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventSetInviteStatus"],
	funcPath = "C_Calendar.EventSetInviteStatus",
	params = {
		{ name = "eventIndex", type = "luaIndex", default = nil },
		{ name = "status", type = "CalendarStatus", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventSetModerator"] = {
	key = "C_Calendar.EventSetModerator",
	name = "EventSetModerator",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventSetModerator"],
	funcPath = "C_Calendar.EventSetModerator",
	params = { { name = "inviteIndex", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventSetTextureID"] = {
	key = "C_Calendar.EventSetTextureID",
	name = "EventSetTextureID",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventSetTextureID"],
	funcPath = "C_Calendar.EventSetTextureID",
	params = { { name = "textureIndex", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventSetTime"] = {
	key = "C_Calendar.EventSetTime",
	name = "EventSetTime",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventSetTime"],
	funcPath = "C_Calendar.EventSetTime",
	params = { { name = "hour", type = "number", default = nil }, { name = "minute", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventSetTitle"] = {
	key = "C_Calendar.EventSetTitle",
	name = "EventSetTitle",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventSetTitle"],
	funcPath = "C_Calendar.EventSetTitle",
	params = { { name = "title", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventSetType"] = {
	key = "C_Calendar.EventSetType",
	name = "EventSetType",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventSetType"],
	funcPath = "C_Calendar.EventSetType",
	params = { { name = "typeIndex", type = "CalendarEventType", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventSortInvites"] = {
	key = "C_Calendar.EventSortInvites",
	name = "EventSortInvites",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["EventSortInvites"],
	funcPath = "C_Calendar.EventSortInvites",
	params = {
		{ name = "criterion", type = "cstring", default = nil },
		{ name = "reverse", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.GetClubCalendarEvents"] = {
	key = "C_Calendar.GetClubCalendarEvents",
	name = "GetClubCalendarEvents",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["GetClubCalendarEvents"],
	funcPath = "C_Calendar.GetClubCalendarEvents",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "startTime", type = "CalendarTime", default = nil },
		{ name = "endTime", type = "CalendarTime", default = nil },
	},
	returns = { { name = "events", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.GetDayEvent"] = {
	key = "C_Calendar.GetDayEvent",
	name = "GetDayEvent",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["GetDayEvent"],
	funcPath = "C_Calendar.GetDayEvent",
	params = {
		{ name = "monthOffset", type = "number", default = nil },
		{ name = "monthDay", type = "luaIndex", default = nil },
		{ name = "index", type = "luaIndex", default = nil },
	},
	returns = { { name = "event", type = "CalendarDayEvent", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.GetEventIndexInfo"] = {
	key = "C_Calendar.GetEventIndexInfo",
	name = "GetEventIndexInfo",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["GetEventIndexInfo"],
	funcPath = "C_Calendar.GetEventIndexInfo",
	params = {
		{ name = "eventID", type = "CalendarEventID", default = nil },
		{ name = "monthOffset", type = "number", default = nil },
		{ name = "monthDay", type = "number", default = nil },
	},
	returns = { { name = "eventIndexInfo", type = "CalendarEventIndexInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.GetFirstPendingInvite"] = {
	key = "C_Calendar.GetFirstPendingInvite",
	name = "GetFirstPendingInvite",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["GetFirstPendingInvite"],
	funcPath = "C_Calendar.GetFirstPendingInvite",
	params = {
		{ name = "offsetMonths", type = "number", default = nil },
		{ name = "monthDay", type = "luaIndex", default = nil },
	},
	returns = { { name = "firstPendingInvite", type = "luaIndex", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.GetGuildEventInfo"] = {
	key = "C_Calendar.GetGuildEventInfo",
	name = "GetGuildEventInfo",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["GetGuildEventInfo"],
	funcPath = "C_Calendar.GetGuildEventInfo",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "info", type = "CalendarGuildEventInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.GetGuildEventSelectionInfo"] = {
	key = "C_Calendar.GetGuildEventSelectionInfo",
	name = "GetGuildEventSelectionInfo",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["GetGuildEventSelectionInfo"],
	funcPath = "C_Calendar.GetGuildEventSelectionInfo",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "info", type = "CalendarEventIndexInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.GetHolidayInfo"] = {
	key = "C_Calendar.GetHolidayInfo",
	name = "GetHolidayInfo",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["GetHolidayInfo"],
	funcPath = "C_Calendar.GetHolidayInfo",
	params = {
		{ name = "monthOffset", type = "number", default = nil, examples = { { value = 0, label = "AllTheThings" } } },
		{ name = "monthDay", type = "luaIndex", default = nil },
		{ name = "index", type = "luaIndex", default = nil },
	},
	returns = { { name = "event", type = "CalendarHolidayInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.GetMonthInfo"] = {
	key = "C_Calendar.GetMonthInfo",
	name = "GetMonthInfo",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["GetMonthInfo"],
	funcPath = "C_Calendar.GetMonthInfo",
	params = { { name = "offsetMonths", type = "number", default = 0 } },
	returns = { { name = "monthInfo", type = "CalendarMonthInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.GetNumDayEvents"] = {
	key = "C_Calendar.GetNumDayEvents",
	name = "GetNumDayEvents",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["GetNumDayEvents"],
	funcPath = "C_Calendar.GetNumDayEvents",
	params = {
		{ name = "offsetMonths", type = "number", default = nil, examples = { { value = 0, label = "AllTheThings" } } },
		{ name = "monthDay", type = "luaIndex", default = nil },
	},
	returns = { { name = "numDayEvents", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.GetRaidInfo"] = {
	key = "C_Calendar.GetRaidInfo",
	name = "GetRaidInfo",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["GetRaidInfo"],
	funcPath = "C_Calendar.GetRaidInfo",
	params = {
		{ name = "offsetMonths", type = "number", default = nil },
		{ name = "monthDay", type = "luaIndex", default = nil },
		{ name = "eventIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "info", type = "CalendarRaidInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.MassInviteCommunity"] = {
	key = "C_Calendar.MassInviteCommunity",
	name = "MassInviteCommunity",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["MassInviteCommunity"],
	funcPath = "C_Calendar.MassInviteCommunity",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "minLevel", type = "number", default = nil },
		{ name = "maxLevel", type = "number", default = nil },
		{ name = "maxRankOrder", type = "luaIndex", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.MassInviteGuild"] = {
	key = "C_Calendar.MassInviteGuild",
	name = "MassInviteGuild",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["MassInviteGuild"],
	funcPath = "C_Calendar.MassInviteGuild",
	params = {
		{ name = "minLevel", type = "number", default = nil },
		{ name = "maxLevel", type = "number", default = nil },
		{ name = "maxRankOrder", type = "luaIndex", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.OpenEvent"] = {
	key = "C_Calendar.OpenEvent",
	name = "OpenEvent",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["OpenEvent"],
	funcPath = "C_Calendar.OpenEvent",
	params = {
		{ name = "offsetMonths", type = "number", default = nil },
		{ name = "monthDay", type = "luaIndex", default = nil },
		{ name = "index", type = "luaIndex", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.SetAbsMonth"] = {
	key = "C_Calendar.SetAbsMonth",
	name = "SetAbsMonth",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["SetAbsMonth"],
	funcPath = "C_Calendar.SetAbsMonth",
	params = { { name = "month", type = "luaIndex", default = nil }, { name = "year", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.SetMonth"] = {
	key = "C_Calendar.SetMonth",
	name = "SetMonth",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["SetMonth"],
	funcPath = "C_Calendar.SetMonth",
	params = { { name = "offsetMonths", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.SetNextClubId"] = {
	key = "C_Calendar.SetNextClubId",
	name = "SetNextClubId",
	category = "combat_midnight",
	subcategory = "c_calendar",
	func = _G["C_Calendar"] and _G["C_Calendar"]["SetNextClubId"],
	funcPath = "C_Calendar.SetNextClubId",
	params = { { name = "clubId", type = "ClubId", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

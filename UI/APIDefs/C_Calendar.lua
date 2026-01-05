-- Generated APIDefinitions for namespace: C_Calendar
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Calendar.AddEvent"] = {
    key = "C_Calendar.AddEvent",
    name = "AddEvent",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["AddEvent"],
    funcPath = "C_Calendar.AddEvent",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.AreNamesReady"] = {
    key = "C_Calendar.AreNamesReady",
    name = "AreNamesReady",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["AreNamesReady"],
    funcPath = "C_Calendar.AreNamesReady",
    params = {  },
    returns = { { name = "ready", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.CanAddEvent"] = {
    key = "C_Calendar.CanAddEvent",
    name = "CanAddEvent",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["CanAddEvent"],
    funcPath = "C_Calendar.CanAddEvent",
    params = {  },
    returns = { { name = "canAddEvent", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.CanSendInvite"] = {
    key = "C_Calendar.CanSendInvite",
    name = "CanSendInvite",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["CanSendInvite"],
    funcPath = "C_Calendar.CanSendInvite",
    params = {  },
    returns = { { name = "canSendInvite", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.CloseEvent"] = {
    key = "C_Calendar.CloseEvent",
    name = "CloseEvent",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["CloseEvent"],
    funcPath = "C_Calendar.CloseEvent",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.ContextMenuEventCanComplain"] = {
    key = "C_Calendar.ContextMenuEventCanComplain",
    name = "ContextMenuEventCanComplain",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuEventCanComplain"],
    funcPath = "C_Calendar.ContextMenuEventCanComplain",
    params = { { name = "offsetMonths", type = "number", default = nil }, { name = "monthDay", type = "luaIndex", default = nil }, { name = "eventIndex", type = "luaIndex", default = nil } },
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
    params = { { name = "offsetMonths", type = "number", default = nil }, { name = "monthDay", type = "luaIndex", default = nil }, { name = "eventIndex", type = "luaIndex", default = nil } },
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
    params = { { name = "offsetMonths", type = "number", default = nil }, { name = "monthDay", type = "luaIndex", default = nil }, { name = "eventIndex", type = "luaIndex", default = nil } },
    returns = { { name = "canRemove", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.ContextMenuEventClipboard"] = {
    key = "C_Calendar.ContextMenuEventClipboard",
    name = "ContextMenuEventClipboard",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuEventClipboard"],
    funcPath = "C_Calendar.ContextMenuEventClipboard",
    params = {  },
    returns = { { name = "exists", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.ContextMenuEventCopy"] = {
    key = "C_Calendar.ContextMenuEventCopy",
    name = "ContextMenuEventCopy",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuEventCopy"],
    funcPath = "C_Calendar.ContextMenuEventCopy",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.ContextMenuEventGetCalendarType"] = {
    key = "C_Calendar.ContextMenuEventGetCalendarType",
    name = "ContextMenuEventGetCalendarType",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuEventGetCalendarType"],
    funcPath = "C_Calendar.ContextMenuEventGetCalendarType",
    params = {  },
    returns = { { name = "calendarType", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.ContextMenuEventPaste"] = {
    key = "C_Calendar.ContextMenuEventPaste",
    name = "ContextMenuEventPaste",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuEventPaste"],
    funcPath = "C_Calendar.ContextMenuEventPaste",
    params = { { name = "offsetMonths", type = "number", default = nil }, { name = "monthDay", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.ContextMenuEventRemove"] = {
    key = "C_Calendar.ContextMenuEventRemove",
    name = "ContextMenuEventRemove",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuEventRemove"],
    funcPath = "C_Calendar.ContextMenuEventRemove",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.ContextMenuEventSignUp"] = {
    key = "C_Calendar.ContextMenuEventSignUp",
    name = "ContextMenuEventSignUp",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuEventSignUp"],
    funcPath = "C_Calendar.ContextMenuEventSignUp",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.ContextMenuGetEventIndex"] = {
    key = "C_Calendar.ContextMenuGetEventIndex",
    name = "ContextMenuGetEventIndex",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuGetEventIndex"],
    funcPath = "C_Calendar.ContextMenuGetEventIndex",
    params = {  },
    returns = { { name = "info", type = "CalendarEventIndexInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.ContextMenuInviteAvailable"] = {
    key = "C_Calendar.ContextMenuInviteAvailable",
    name = "ContextMenuInviteAvailable",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuInviteAvailable"],
    funcPath = "C_Calendar.ContextMenuInviteAvailable",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.ContextMenuInviteDecline"] = {
    key = "C_Calendar.ContextMenuInviteDecline",
    name = "ContextMenuInviteDecline",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuInviteDecline"],
    funcPath = "C_Calendar.ContextMenuInviteDecline",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.ContextMenuInviteRemove"] = {
    key = "C_Calendar.ContextMenuInviteRemove",
    name = "ContextMenuInviteRemove",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuInviteRemove"],
    funcPath = "C_Calendar.ContextMenuInviteRemove",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.ContextMenuInviteTentative"] = {
    key = "C_Calendar.ContextMenuInviteTentative",
    name = "ContextMenuInviteTentative",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuInviteTentative"],
    funcPath = "C_Calendar.ContextMenuInviteTentative",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.ContextMenuSelectEvent"] = {
    key = "C_Calendar.ContextMenuSelectEvent",
    name = "ContextMenuSelectEvent",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["ContextMenuSelectEvent"],
    funcPath = "C_Calendar.ContextMenuSelectEvent",
    params = { { name = "offsetMonths", type = "number", default = nil }, { name = "monthDay", type = "luaIndex", default = nil }, { name = "eventIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.CreateCommunitySignUpEvent"] = {
    key = "C_Calendar.CreateCommunitySignUpEvent",
    name = "CreateCommunitySignUpEvent",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["CreateCommunitySignUpEvent"],
    funcPath = "C_Calendar.CreateCommunitySignUpEvent",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.CreateGuildAnnouncementEvent"] = {
    key = "C_Calendar.CreateGuildAnnouncementEvent",
    name = "CreateGuildAnnouncementEvent",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["CreateGuildAnnouncementEvent"],
    funcPath = "C_Calendar.CreateGuildAnnouncementEvent",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.CreateGuildSignUpEvent"] = {
    key = "C_Calendar.CreateGuildSignUpEvent",
    name = "CreateGuildSignUpEvent",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["CreateGuildSignUpEvent"],
    funcPath = "C_Calendar.CreateGuildSignUpEvent",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.CreatePlayerEvent"] = {
    key = "C_Calendar.CreatePlayerEvent",
    name = "CreatePlayerEvent",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["CreatePlayerEvent"],
    funcPath = "C_Calendar.CreatePlayerEvent",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.EventAvailable"] = {
    key = "C_Calendar.EventAvailable",
    name = "EventAvailable",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventAvailable"],
    funcPath = "C_Calendar.EventAvailable",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.EventCanEdit"] = {
    key = "C_Calendar.EventCanEdit",
    name = "EventCanEdit",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventCanEdit"],
    funcPath = "C_Calendar.EventCanEdit",
    params = {  },
    returns = { { name = "canEdit", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.EventClearAutoApprove"] = {
    key = "C_Calendar.EventClearAutoApprove",
    name = "EventClearAutoApprove",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventClearAutoApprove"],
    funcPath = "C_Calendar.EventClearAutoApprove",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.EventClearLocked"] = {
    key = "C_Calendar.EventClearLocked",
    name = "EventClearLocked",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventClearLocked"],
    funcPath = "C_Calendar.EventClearLocked",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.EventClearModerator"] = {
    key = "C_Calendar.EventClearModerator",
    name = "EventClearModerator",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventClearModerator"],
    funcPath = "C_Calendar.EventClearModerator",
    params = { { name = "inviteIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventDecline"] = {
    key = "C_Calendar.EventDecline",
    name = "EventDecline",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventDecline"],
    funcPath = "C_Calendar.EventDecline",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.EventGetCalendarType"] = {
    key = "C_Calendar.EventGetCalendarType",
    name = "EventGetCalendarType",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventGetCalendarType"],
    funcPath = "C_Calendar.EventGetCalendarType",
    params = {  },
    returns = { { name = "calendarType", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.EventGetClubId"] = {
    key = "C_Calendar.EventGetClubId",
    name = "EventGetClubId",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventGetClubId"],
    funcPath = "C_Calendar.EventGetClubId",
    params = {  },
    returns = { { name = "info", type = "ClubId", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["C_Calendar.EventGetInviteSortCriterion"] = {
    key = "C_Calendar.EventGetInviteSortCriterion",
    name = "EventGetInviteSortCriterion",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventGetInviteSortCriterion"],
    funcPath = "C_Calendar.EventGetInviteSortCriterion",
    params = {  },
    returns = { { name = "criterion", type = "string", canBeSecret = false }, { name = "reverse", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.EventGetSelectedInvite"] = {
    key = "C_Calendar.EventGetSelectedInvite",
    name = "EventGetSelectedInvite",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventGetSelectedInvite"],
    funcPath = "C_Calendar.EventGetSelectedInvite",
    params = {  },
    returns = { { name = "inviteIndex", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["C_Calendar.EventGetTypes"] = {
    key = "C_Calendar.EventGetTypes",
    name = "EventGetTypes",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventGetTypes"],
    funcPath = "C_Calendar.EventGetTypes",
    params = {  },
    returns = { { name = "types", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.EventGetTypesDisplayOrdered"] = {
    key = "C_Calendar.EventGetTypesDisplayOrdered",
    name = "EventGetTypesDisplayOrdered",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventGetTypesDisplayOrdered"],
    funcPath = "C_Calendar.EventGetTypesDisplayOrdered",
    params = {  },
    returns = { { name = "infos", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.EventHasPendingInvite"] = {
    key = "C_Calendar.EventHasPendingInvite",
    name = "EventHasPendingInvite",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventHasPendingInvite"],
    funcPath = "C_Calendar.EventHasPendingInvite",
    params = {  },
    returns = { { name = "hasPendingInvite", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.EventHaveSettingsChanged"] = {
    key = "C_Calendar.EventHaveSettingsChanged",
    name = "EventHaveSettingsChanged",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventHaveSettingsChanged"],
    funcPath = "C_Calendar.EventHaveSettingsChanged",
    params = {  },
    returns = { { name = "haveSettingsChanged", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.EventInvite"] = {
    key = "C_Calendar.EventInvite",
    name = "EventInvite",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventInvite"],
    funcPath = "C_Calendar.EventInvite",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = {  },
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
    returns = {  },
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
    returns = {  },
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
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventSetAutoApprove"] = {
    key = "C_Calendar.EventSetAutoApprove",
    name = "EventSetAutoApprove",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventSetAutoApprove"],
    funcPath = "C_Calendar.EventSetAutoApprove",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.EventSetClubId"] = {
    key = "C_Calendar.EventSetClubId",
    name = "EventSetClubId",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventSetClubId"],
    funcPath = "C_Calendar.EventSetClubId",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = {  },
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
    params = { { name = "month", type = "luaIndex", default = nil }, { name = "monthDay", type = "luaIndex", default = nil }, { name = "year", type = "number", default = nil } },
    returns = {  },
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
    returns = {  },
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
    params = { { name = "eventIndex", type = "luaIndex", default = nil }, { name = "status", type = "CalendarStatus", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventSetLocked"] = {
    key = "C_Calendar.EventSetLocked",
    name = "EventSetLocked",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventSetLocked"],
    funcPath = "C_Calendar.EventSetLocked",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.EventSetModerator"] = {
    key = "C_Calendar.EventSetModerator",
    name = "EventSetModerator",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventSetModerator"],
    funcPath = "C_Calendar.EventSetModerator",
    params = { { name = "inviteIndex", type = "luaIndex", default = nil } },
    returns = {  },
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
    returns = {  },
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
    returns = {  },
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
    returns = {  },
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
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventSignUp"] = {
    key = "C_Calendar.EventSignUp",
    name = "EventSignUp",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventSignUp"],
    funcPath = "C_Calendar.EventSignUp",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.EventSortInvites"] = {
    key = "C_Calendar.EventSortInvites",
    name = "EventSortInvites",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventSortInvites"],
    funcPath = "C_Calendar.EventSortInvites",
    params = { { name = "criterion", type = "cstring", default = nil }, { name = "reverse", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.EventTentative"] = {
    key = "C_Calendar.EventTentative",
    name = "EventTentative",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["EventTentative"],
    funcPath = "C_Calendar.EventTentative",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.GetClubCalendarEvents"] = {
    key = "C_Calendar.GetClubCalendarEvents",
    name = "GetClubCalendarEvents",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["GetClubCalendarEvents"],
    funcPath = "C_Calendar.GetClubCalendarEvents",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "startTime", type = "CalendarTime", default = nil }, { name = "endTime", type = "CalendarTime", default = nil } },
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
    params = { { name = "monthOffset", type = "number", default = nil }, { name = "monthDay", type = "luaIndex", default = nil }, { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "event", type = "CalendarDayEvent", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.GetDefaultGuildFilter"] = {
    key = "C_Calendar.GetDefaultGuildFilter",
    name = "GetDefaultGuildFilter",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["GetDefaultGuildFilter"],
    funcPath = "C_Calendar.GetDefaultGuildFilter",
    params = {  },
    returns = { { name = "info", type = "CalendarGuildFilterInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.GetEventIndex"] = {
    key = "C_Calendar.GetEventIndex",
    name = "GetEventIndex",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["GetEventIndex"],
    funcPath = "C_Calendar.GetEventIndex",
    params = {  },
    returns = { { name = "info", type = "CalendarEventIndexInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.GetEventIndexInfo"] = {
    key = "C_Calendar.GetEventIndexInfo",
    name = "GetEventIndexInfo",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["GetEventIndexInfo"],
    funcPath = "C_Calendar.GetEventIndexInfo",
    params = { { name = "eventID", type = "CalendarEventID", default = nil }, { name = "monthOffset", type = "number", default = nil }, { name = "monthDay", type = "number", default = nil } },
    returns = { { name = "eventIndexInfo", type = "CalendarEventIndexInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.GetEventInfo"] = {
    key = "C_Calendar.GetEventInfo",
    name = "GetEventInfo",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["GetEventInfo"],
    funcPath = "C_Calendar.GetEventInfo",
    params = {  },
    returns = { { name = "info", type = "CalendarEventInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.GetFirstPendingInvite"] = {
    key = "C_Calendar.GetFirstPendingInvite",
    name = "GetFirstPendingInvite",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["GetFirstPendingInvite"],
    funcPath = "C_Calendar.GetFirstPendingInvite",
    params = { { name = "offsetMonths", type = "number", default = nil }, { name = "monthDay", type = "luaIndex", default = nil } },
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
    params = { { name = "monthOffset", type = "number", default = nil }, { name = "monthDay", type = "luaIndex", default = nil }, { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "event", type = "CalendarHolidayInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.GetMaxCreateDate"] = {
    key = "C_Calendar.GetMaxCreateDate",
    name = "GetMaxCreateDate",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["GetMaxCreateDate"],
    funcPath = "C_Calendar.GetMaxCreateDate",
    params = {  },
    returns = { { name = "maxCreateDate", type = "CalendarTime", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.GetMinDate"] = {
    key = "C_Calendar.GetMinDate",
    name = "GetMinDate",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["GetMinDate"],
    funcPath = "C_Calendar.GetMinDate",
    params = {  },
    returns = { { name = "minDate", type = "CalendarTime", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["C_Calendar.GetNextClubId"] = {
    key = "C_Calendar.GetNextClubId",
    name = "GetNextClubId",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["GetNextClubId"],
    funcPath = "C_Calendar.GetNextClubId",
    params = {  },
    returns = { { name = "clubId", type = "ClubId", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.GetNumDayEvents"] = {
    key = "C_Calendar.GetNumDayEvents",
    name = "GetNumDayEvents",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["GetNumDayEvents"],
    funcPath = "C_Calendar.GetNumDayEvents",
    params = { { name = "offsetMonths", type = "number", default = nil }, { name = "monthDay", type = "luaIndex", default = nil } },
    returns = { { name = "numDayEvents", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.GetNumGuildEvents"] = {
    key = "C_Calendar.GetNumGuildEvents",
    name = "GetNumGuildEvents",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["GetNumGuildEvents"],
    funcPath = "C_Calendar.GetNumGuildEvents",
    params = {  },
    returns = { { name = "numGuildEvents", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.GetNumInvites"] = {
    key = "C_Calendar.GetNumInvites",
    name = "GetNumInvites",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["GetNumInvites"],
    funcPath = "C_Calendar.GetNumInvites",
    params = {  },
    returns = { { name = "num", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.GetNumPendingInvites"] = {
    key = "C_Calendar.GetNumPendingInvites",
    name = "GetNumPendingInvites",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["GetNumPendingInvites"],
    funcPath = "C_Calendar.GetNumPendingInvites",
    params = {  },
    returns = { { name = "num", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.GetRaidInfo"] = {
    key = "C_Calendar.GetRaidInfo",
    name = "GetRaidInfo",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["GetRaidInfo"],
    funcPath = "C_Calendar.GetRaidInfo",
    params = { { name = "offsetMonths", type = "number", default = nil }, { name = "monthDay", type = "luaIndex", default = nil }, { name = "eventIndex", type = "luaIndex", default = nil } },
    returns = { { name = "info", type = "CalendarRaidInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.IsActionPending"] = {
    key = "C_Calendar.IsActionPending",
    name = "IsActionPending",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["IsActionPending"],
    funcPath = "C_Calendar.IsActionPending",
    params = {  },
    returns = { { name = "actionPending", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.IsEventOpen"] = {
    key = "C_Calendar.IsEventOpen",
    name = "IsEventOpen",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["IsEventOpen"],
    funcPath = "C_Calendar.IsEventOpen",
    params = {  },
    returns = { { name = "isOpen", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.MassInviteCommunity"] = {
    key = "C_Calendar.MassInviteCommunity",
    name = "MassInviteCommunity",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["MassInviteCommunity"],
    funcPath = "C_Calendar.MassInviteCommunity",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "minLevel", type = "number", default = nil }, { name = "maxLevel", type = "number", default = nil }, { name = "maxRankOrder", type = "luaIndex", default = nil } },
    returns = {  },
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
    params = { { name = "minLevel", type = "number", default = nil }, { name = "maxLevel", type = "number", default = nil }, { name = "maxRankOrder", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.OpenCalendar"] = {
    key = "C_Calendar.OpenCalendar",
    name = "OpenCalendar",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["OpenCalendar"],
    funcPath = "C_Calendar.OpenCalendar",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.OpenEvent"] = {
    key = "C_Calendar.OpenEvent",
    name = "OpenEvent",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["OpenEvent"],
    funcPath = "C_Calendar.OpenEvent",
    params = { { name = "offsetMonths", type = "number", default = nil }, { name = "monthDay", type = "luaIndex", default = nil }, { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.RemoveEvent"] = {
    key = "C_Calendar.RemoveEvent",
    name = "RemoveEvent",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["RemoveEvent"],
    funcPath = "C_Calendar.RemoveEvent",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Calendar.SetAbsMonth"] = {
    key = "C_Calendar.SetAbsMonth",
    name = "SetAbsMonth",
    category = "combat_midnight",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["SetAbsMonth"],
    funcPath = "C_Calendar.SetAbsMonth",
    params = { { name = "month", type = "luaIndex", default = nil }, { name = "year", type = "number", default = nil } },
    returns = {  },
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
    returns = {  },
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
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Calendar.UpdateEvent"] = {
    key = "C_Calendar.UpdateEvent",
    name = "UpdateEvent",
    category = "general",
    subcategory = "c_calendar",
    func = _G["C_Calendar"] and _G["C_Calendar"]["UpdateEvent"],
    funcPath = "C_Calendar.UpdateEvent",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

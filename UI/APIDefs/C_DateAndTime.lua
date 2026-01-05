-- Generated APIDefinitions for namespace: C_DateAndTime
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_DateAndTime.AdjustTimeByDays"] = {
    key = "C_DateAndTime.AdjustTimeByDays",
    name = "AdjustTimeByDays",
    category = "combat_midnight",
    subcategory = "c_dateandtime",
    func = _G["C_DateAndTime"] and _G["C_DateAndTime"]["AdjustTimeByDays"],
    funcPath = "C_DateAndTime.AdjustTimeByDays",
    params = { { name = "date", type = "CalendarTime", default = nil }, { name = "days", type = "number", default = nil } },
    returns = { { name = "newDate", type = "CalendarTime", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DateAndTime.AdjustTimeByMinutes"] = {
    key = "C_DateAndTime.AdjustTimeByMinutes",
    name = "AdjustTimeByMinutes",
    category = "combat_midnight",
    subcategory = "c_dateandtime",
    func = _G["C_DateAndTime"] and _G["C_DateAndTime"]["AdjustTimeByMinutes"],
    funcPath = "C_DateAndTime.AdjustTimeByMinutes",
    params = { { name = "date", type = "CalendarTime", default = nil }, { name = "minutes", type = "number", default = nil } },
    returns = { { name = "newDate", type = "CalendarTime", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DateAndTime.AdjustTimeByMonths"] = {
    key = "C_DateAndTime.AdjustTimeByMonths",
    name = "AdjustTimeByMonths",
    category = "combat_midnight",
    subcategory = "c_dateandtime",
    func = _G["C_DateAndTime"] and _G["C_DateAndTime"]["AdjustTimeByMonths"],
    funcPath = "C_DateAndTime.AdjustTimeByMonths",
    params = { { name = "date", type = "CalendarTime", default = nil }, { name = "months", type = "number", default = nil } },
    returns = { { name = "newDate", type = "CalendarTime", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DateAndTime.CompareCalendarTime"] = {
    key = "C_DateAndTime.CompareCalendarTime",
    name = "CompareCalendarTime",
    category = "combat_midnight",
    subcategory = "c_dateandtime",
    func = _G["C_DateAndTime"] and _G["C_DateAndTime"]["CompareCalendarTime"],
    funcPath = "C_DateAndTime.CompareCalendarTime",
    params = { { name = "lhsCalendarTime", type = "CalendarTime", default = nil }, { name = "rhsCalendarTime", type = "CalendarTime", default = nil } },
    returns = { { name = "comparison", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DateAndTime.GetCalendarTimeFromEpoch"] = {
    key = "C_DateAndTime.GetCalendarTimeFromEpoch",
    name = "GetCalendarTimeFromEpoch",
    category = "combat_midnight",
    subcategory = "c_dateandtime",
    func = _G["C_DateAndTime"] and _G["C_DateAndTime"]["GetCalendarTimeFromEpoch"],
    funcPath = "C_DateAndTime.GetCalendarTimeFromEpoch",
    params = { { name = "epoch", type = "BigUInteger", default = nil } },
    returns = { { name = "date", type = "CalendarTime", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_DateAndTime.GetCurrentCalendarTime"] = {
    key = "C_DateAndTime.GetCurrentCalendarTime",
    name = "GetCurrentCalendarTime",
    category = "general",
    subcategory = "c_dateandtime",
    func = _G["C_DateAndTime"] and _G["C_DateAndTime"]["GetCurrentCalendarTime"],
    funcPath = "C_DateAndTime.GetCurrentCalendarTime",
    params = {  },
    returns = { { name = "date", type = "CalendarTime", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_DateAndTime.GetSecondsUntilDailyReset"] = {
    key = "C_DateAndTime.GetSecondsUntilDailyReset",
    name = "GetSecondsUntilDailyReset",
    category = "general",
    subcategory = "c_dateandtime",
    func = _G["C_DateAndTime"] and _G["C_DateAndTime"]["GetSecondsUntilDailyReset"],
    funcPath = "C_DateAndTime.GetSecondsUntilDailyReset",
    params = {  },
    returns = { { name = "seconds", type = "time_t", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_DateAndTime.GetSecondsUntilWeeklyReset"] = {
    key = "C_DateAndTime.GetSecondsUntilWeeklyReset",
    name = "GetSecondsUntilWeeklyReset",
    category = "general",
    subcategory = "c_dateandtime",
    func = _G["C_DateAndTime"] and _G["C_DateAndTime"]["GetSecondsUntilWeeklyReset"],
    funcPath = "C_DateAndTime.GetSecondsUntilWeeklyReset",
    params = {  },
    returns = { { name = "seconds", type = "time_t", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_DateAndTime.GetServerTimeLocal"] = {
    key = "C_DateAndTime.GetServerTimeLocal",
    name = "GetServerTimeLocal",
    category = "general",
    subcategory = "c_dateandtime",
    func = _G["C_DateAndTime"] and _G["C_DateAndTime"]["GetServerTimeLocal"],
    funcPath = "C_DateAndTime.GetServerTimeLocal",
    params = {  },
    returns = { { name = "serverTimeLocal", type = "time_t", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_DateAndTime.GetWeeklyResetStartTime"] = {
    key = "C_DateAndTime.GetWeeklyResetStartTime",
    name = "GetWeeklyResetStartTime",
    category = "general",
    subcategory = "c_dateandtime",
    func = _G["C_DateAndTime"] and _G["C_DateAndTime"]["GetWeeklyResetStartTime"],
    funcPath = "C_DateAndTime.GetWeeklyResetStartTime",
    params = {  },
    returns = { { name = "seconds", type = "time_t", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

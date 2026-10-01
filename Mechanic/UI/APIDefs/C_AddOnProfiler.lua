-- Generated APIDefinitions for namespace: C_AddOnProfiler
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AddOnProfiler.AddMeasuredCallEvent"] = {
    key = "C_AddOnProfiler.AddMeasuredCallEvent",
    name = "AddMeasuredCallEvent",
    category = "general",
    subcategory = "c_addonprofiler",
    funcPath = "C_AddOnProfiler.AddMeasuredCallEvent",
    params = { { name = "name", type = "stringView", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOnProfiler.AddPerformanceMessageShown"] = {
    key = "C_AddOnProfiler.AddPerformanceMessageShown",
    name = "AddPerformanceMessageShown",
    category = "general",
    subcategory = "c_addonprofiler",
    funcPath = "C_AddOnProfiler.AddPerformanceMessageShown",
    params = { { name = "msg", type = "AddOnPerformanceMessage", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOnProfiler.CheckForPerformanceMessage"] = {
    key = "C_AddOnProfiler.CheckForPerformanceMessage",
    name = "CheckForPerformanceMessage",
    category = "general",
    subcategory = "c_addonprofiler",
    funcPath = "C_AddOnProfiler.CheckForPerformanceMessage",
    params = {  },
    returns = { { name = "msg", type = "AddOnPerformanceMessage", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AddOnProfiler.GetAddOnMetric"] = {
    key = "C_AddOnProfiler.GetAddOnMetric",
    name = "GetAddOnMetric",
    category = "general",
    subcategory = "c_addonprofiler",
    funcPath = "C_AddOnProfiler.GetAddOnMetric",
    params = { { name = "name", type = "cstring", default = nil }, { name = "metric", type = "AddOnProfilerMetric", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOnProfiler.GetApplicationMetric"] = {
    key = "C_AddOnProfiler.GetApplicationMetric",
    name = "GetApplicationMetric",
    category = "general",
    subcategory = "c_addonprofiler",
    funcPath = "C_AddOnProfiler.GetApplicationMetric",
    params = { { name = "metric", type = "AddOnProfilerMetric", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOnProfiler.GetOverallMetric"] = {
    key = "C_AddOnProfiler.GetOverallMetric",
    name = "GetOverallMetric",
    category = "general",
    subcategory = "c_addonprofiler",
    funcPath = "C_AddOnProfiler.GetOverallMetric",
    params = { { name = "metric", type = "AddOnProfilerMetric", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOnProfiler.GetTicksPerSecond"] = {
    key = "C_AddOnProfiler.GetTicksPerSecond",
    name = "GetTicksPerSecond",
    category = "general",
    subcategory = "c_addonprofiler",
    funcPath = "C_AddOnProfiler.GetTicksPerSecond",
    params = {  },
    returns = { { name = "frequency", type = "BigInteger", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AddOnProfiler.GetTopKAddOnsForMetric"] = {
    key = "C_AddOnProfiler.GetTopKAddOnsForMetric",
    name = "GetTopKAddOnsForMetric",
    category = "general",
    subcategory = "c_addonprofiler",
    funcPath = "C_AddOnProfiler.GetTopKAddOnsForMetric",
    params = { { name = "metric", type = "AddOnProfilerMetric", default = nil }, { name = "k", type = "number", default = nil } },
    returns = { { name = "results", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOnProfiler.IsEnabled"] = {
    key = "C_AddOnProfiler.IsEnabled",
    name = "IsEnabled",
    category = "general",
    subcategory = "c_addonprofiler",
    funcPath = "C_AddOnProfiler.IsEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_AddOnProfiler.MeasureCall"] = {
    key = "C_AddOnProfiler.MeasureCall",
    name = "MeasureCall",
    category = "general",
    subcategory = "c_addonprofiler",
    funcPath = "C_AddOnProfiler.MeasureCall",
    params = { { name = "func", type = "LuaValueVariant", default = nil }, { name = "arguments", type = "LuaValueVariant", default = nil } },
    returns = { { name = "results", type = "AddOnProfilerCallResults", canBeSecret = false }, { name = "returns", type = "LuaValueVariant", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

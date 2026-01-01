-- Generated APIDefinitions for namespace: C_AddOnProfiler
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AddOnProfiler.AddMeasuredCallEvent"] = {
	key = "C_AddOnProfiler.AddMeasuredCallEvent",
	name = "AddMeasuredCallEvent",
	category = "combat_midnight",
	subcategory = "c_addonprofiler",
	func = _G["C_AddOnProfiler"] and _G["C_AddOnProfiler"]["AddMeasuredCallEvent"],
	funcPath = "C_AddOnProfiler.AddMeasuredCallEvent",
	params = { { name = "name", type = "stringView", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOnProfiler.AddPerformanceMessageShown"] = {
	key = "C_AddOnProfiler.AddPerformanceMessageShown",
	name = "AddPerformanceMessageShown",
	category = "combat_midnight",
	subcategory = "c_addonprofiler",
	func = _G["C_AddOnProfiler"] and _G["C_AddOnProfiler"]["AddPerformanceMessageShown"],
	funcPath = "C_AddOnProfiler.AddPerformanceMessageShown",
	params = { { name = "msg", type = "AddOnPerformanceMessage", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOnProfiler.GetAddOnMetric"] = {
	key = "C_AddOnProfiler.GetAddOnMetric",
	name = "GetAddOnMetric",
	category = "combat_midnight",
	subcategory = "c_addonprofiler",
	func = _G["C_AddOnProfiler"] and _G["C_AddOnProfiler"]["GetAddOnMetric"],
	funcPath = "C_AddOnProfiler.GetAddOnMetric",
	params = {
		{ name = "name", type = "cstring", default = nil },
		{ name = "metric", type = "AddOnProfilerMetric", default = nil },
	},
	returns = { { name = "result", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOnProfiler.GetApplicationMetric"] = {
	key = "C_AddOnProfiler.GetApplicationMetric",
	name = "GetApplicationMetric",
	category = "combat_midnight",
	subcategory = "c_addonprofiler",
	func = _G["C_AddOnProfiler"] and _G["C_AddOnProfiler"]["GetApplicationMetric"],
	funcPath = "C_AddOnProfiler.GetApplicationMetric",
	params = { { name = "metric", type = "AddOnProfilerMetric", default = nil } },
	returns = { { name = "result", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOnProfiler.GetOverallMetric"] = {
	key = "C_AddOnProfiler.GetOverallMetric",
	name = "GetOverallMetric",
	category = "combat_midnight",
	subcategory = "c_addonprofiler",
	func = _G["C_AddOnProfiler"] and _G["C_AddOnProfiler"]["GetOverallMetric"],
	funcPath = "C_AddOnProfiler.GetOverallMetric",
	params = { { name = "metric", type = "AddOnProfilerMetric", default = nil } },
	returns = { { name = "result", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOnProfiler.GetTopKAddOnsForMetric"] = {
	key = "C_AddOnProfiler.GetTopKAddOnsForMetric",
	name = "GetTopKAddOnsForMetric",
	category = "combat_midnight",
	subcategory = "c_addonprofiler",
	func = _G["C_AddOnProfiler"] and _G["C_AddOnProfiler"]["GetTopKAddOnsForMetric"],
	funcPath = "C_AddOnProfiler.GetTopKAddOnsForMetric",
	params = {
		{ name = "metric", type = "AddOnProfilerMetric", default = nil },
		{ name = "k", type = "number", default = nil },
	},
	returns = { { name = "results", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOnProfiler.MeasureCall"] = {
	key = "C_AddOnProfiler.MeasureCall",
	name = "MeasureCall",
	category = "combat_midnight",
	subcategory = "c_addonprofiler",
	func = _G["C_AddOnProfiler"] and _G["C_AddOnProfiler"]["MeasureCall"],
	funcPath = "C_AddOnProfiler.MeasureCall",
	params = {
		{ name = "func", type = "LuaValueVariant", default = nil },
		{ name = "arguments", type = "LuaValueVariant", default = nil },
	},
	returns = {
		{ name = "results", type = "AddOnProfilerCallResults", canBeSecret = false },
		{ name = "returns", type = "LuaValueVariant", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

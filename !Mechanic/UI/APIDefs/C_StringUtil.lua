-- Generated APIDefinitions for namespace: C_StringUtil
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_StringUtil.EscapeLuaPatterns"] = {
	key = "C_StringUtil.EscapeLuaPatterns",
	name = "EscapeLuaPatterns",
	category = "combat_midnight",
	subcategory = "c_stringutil",
	func = _G["C_StringUtil"] and _G["C_StringUtil"]["EscapeLuaPatterns"],
	funcPath = "C_StringUtil.EscapeLuaPatterns",
	params = { { name = "text", type = "stringView", default = nil } },
	returns = { { name = "escapedText", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.EscapeQuotedCodes"] = {
	key = "C_StringUtil.EscapeQuotedCodes",
	name = "EscapeQuotedCodes",
	category = "combat_midnight",
	subcategory = "c_stringutil",
	func = _G["C_StringUtil"] and _G["C_StringUtil"]["EscapeQuotedCodes"],
	funcPath = "C_StringUtil.EscapeQuotedCodes",
	params = { { name = "text", type = "string", default = nil } },
	returns = { { name = "escaped", type = "stringView", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.FloorToNearestString"] = {
	key = "C_StringUtil.FloorToNearestString",
	name = "FloorToNearestString",
	category = "combat_midnight",
	subcategory = "c_stringutil",
	func = _G["C_StringUtil"] and _G["C_StringUtil"]["FloorToNearestString"],
	funcPath = "C_StringUtil.FloorToNearestString",
	params = { { name = "number", type = "number", default = nil } },
	returns = { { name = "text", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.RemoveContiguousSpaces"] = {
	key = "C_StringUtil.RemoveContiguousSpaces",
	name = "RemoveContiguousSpaces",
	category = "combat_midnight",
	subcategory = "c_stringutil",
	func = _G["C_StringUtil"] and _G["C_StringUtil"]["RemoveContiguousSpaces"],
	funcPath = "C_StringUtil.RemoveContiguousSpaces",
	params = {
		{ name = "text", type = "stringView", default = nil },
		{ name = "maxAllowedSpaces", type = "number", default = nil },
	},
	returns = { { name = "trimmedText", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.RoundToNearestString"] = {
	key = "C_StringUtil.RoundToNearestString",
	name = "RoundToNearestString",
	category = "combat_midnight",
	subcategory = "c_stringutil",
	func = _G["C_StringUtil"] and _G["C_StringUtil"]["RoundToNearestString"],
	funcPath = "C_StringUtil.RoundToNearestString",
	params = { { name = "number", type = "number", default = nil } },
	returns = { { name = "text", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.StripHyperlinks"] = {
	key = "C_StringUtil.StripHyperlinks",
	name = "StripHyperlinks",
	category = "combat_midnight",
	subcategory = "c_stringutil",
	func = _G["C_StringUtil"] and _G["C_StringUtil"]["StripHyperlinks"],
	funcPath = "C_StringUtil.StripHyperlinks",
	params = {
		{ name = "text", type = "string", default = nil },
		{ name = "maintainColor", type = "bool", default = false },
		{ name = "maintainBrackets", type = "bool", default = false },
		{ name = "stripNewlines", type = "bool", default = false },
		{ name = "maintainAtlases", type = "bool", default = false },
	},
	returns = { { name = "stripped", type = "stringView", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.TruncateWhenZero"] = {
	key = "C_StringUtil.TruncateWhenZero",
	name = "TruncateWhenZero",
	category = "combat_midnight",
	subcategory = "c_stringutil",
	func = _G["C_StringUtil"] and _G["C_StringUtil"]["TruncateWhenZero"],
	funcPath = "C_StringUtil.TruncateWhenZero",
	params = { { name = "number", type = "number", default = nil } },
	returns = { { name = "text", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.WrapString"] = {
	key = "C_StringUtil.WrapString",
	name = "WrapString",
	category = "combat_midnight",
	subcategory = "c_stringutil",
	func = _G["C_StringUtil"] and _G["C_StringUtil"]["WrapString"],
	funcPath = "C_StringUtil.WrapString",
	params = {
		{
			name = "infix",
			type = "stringView",
			default = nil,
			examples = {
				{ value = "truncated", label = "DandersFrames" },
				{ value = "text", label = "DBM-Core" },
				{ value = "text", label = "DBM-Core" },
			},
		},
		{ name = "prefix", type = "stringView", default = nil },
		{ name = "suffix", type = "stringView", default = nil },
	},
	returns = { { name = "text", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.trim"] = {
	key = "C_StringUtil.trim",
	name = "trim",
	category = "combat_midnight",
	subcategory = "c_stringutil",
	func = _G["C_StringUtil"] and _G["C_StringUtil"]["trim"],
	funcPath = "C_StringUtil.trim",
	params = {
		{
			name = "str",
			type = "stringView",
			default = nil,
			examples = { { value = "info[2]", label = "Narcissus" }, { value = "ID", label = "Plater" } },
		},
		{ name = "characters", type = "stringView", default = " \\r\\n\\t" },
	},
	returns = { { name = "trimmed", type = "stringView", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

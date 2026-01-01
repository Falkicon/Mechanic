-- Generated APIDefinitions for namespace: C_ColorUtil
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ColorUtil.ConvertHSLToHSV"] = {
	key = "C_ColorUtil.ConvertHSLToHSV",
	name = "ConvertHSLToHSV",
	category = "combat_midnight",
	subcategory = "c_colorutil",
	func = _G["C_ColorUtil"] and _G["C_ColorUtil"]["ConvertHSLToHSV"],
	funcPath = "C_ColorUtil.ConvertHSLToHSV",
	params = {
		{ name = "hslH", type = "number", default = nil },
		{ name = "hslS", type = "number", default = nil },
		{ name = "hslL", type = "number", default = nil },
	},
	returns = {
		{ name = "hsvH", type = "number", canBeSecret = false },
		{ name = "hsvS", type = "number", canBeSecret = false },
		{ name = "hsvV", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ColorUtil.ConvertHSVToHSL"] = {
	key = "C_ColorUtil.ConvertHSVToHSL",
	name = "ConvertHSVToHSL",
	category = "combat_midnight",
	subcategory = "c_colorutil",
	func = _G["C_ColorUtil"] and _G["C_ColorUtil"]["ConvertHSVToHSL"],
	funcPath = "C_ColorUtil.ConvertHSVToHSL",
	params = {
		{ name = "hsvH", type = "number", default = nil },
		{ name = "hsvS", type = "number", default = nil },
		{ name = "hsvV", type = "number", default = nil },
	},
	returns = {
		{ name = "hslH", type = "number", canBeSecret = false },
		{ name = "hslS", type = "number", canBeSecret = false },
		{ name = "hslL", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ColorUtil.ConvertHSVToRGB"] = {
	key = "C_ColorUtil.ConvertHSVToRGB",
	name = "ConvertHSVToRGB",
	category = "combat_midnight",
	subcategory = "c_colorutil",
	func = _G["C_ColorUtil"] and _G["C_ColorUtil"]["ConvertHSVToRGB"],
	funcPath = "C_ColorUtil.ConvertHSVToRGB",
	params = {
		{ name = "hsvH", type = "number", default = nil },
		{ name = "hsvS", type = "number", default = nil },
		{ name = "hsvV", type = "number", default = nil },
	},
	returns = {
		{ name = "rgbR", type = "number", canBeSecret = false },
		{ name = "rgbG", type = "number", canBeSecret = false },
		{ name = "rgbB", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ColorUtil.ConvertRGBToHSV"] = {
	key = "C_ColorUtil.ConvertRGBToHSV",
	name = "ConvertRGBToHSV",
	category = "combat_midnight",
	subcategory = "c_colorutil",
	func = _G["C_ColorUtil"] and _G["C_ColorUtil"]["ConvertRGBToHSV"],
	funcPath = "C_ColorUtil.ConvertRGBToHSV",
	params = {
		{ name = "rgbR", type = "number", default = nil },
		{ name = "rgbG", type = "number", default = nil },
		{ name = "rgbB", type = "number", default = nil },
	},
	returns = {
		{ name = "hsvH", type = "number", canBeSecret = false },
		{ name = "hsvS", type = "number", canBeSecret = false },
		{ name = "hsvV", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ColorUtil.GenerateTextColorCode"] = {
	key = "C_ColorUtil.GenerateTextColorCode",
	name = "GenerateTextColorCode",
	category = "combat_midnight",
	subcategory = "c_colorutil",
	func = _G["C_ColorUtil"] and _G["C_ColorUtil"]["GenerateTextColorCode"],
	funcPath = "C_ColorUtil.GenerateTextColorCode",
	params = { { name = "color", type = "colorRGB", default = nil } },
	returns = { { name = "textColorCode", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_ColorUtil.WrapTextInColor"] = {
	key = "C_ColorUtil.WrapTextInColor",
	name = "WrapTextInColor",
	category = "combat_midnight",
	subcategory = "c_colorutil",
	func = _G["C_ColorUtil"] and _G["C_ColorUtil"]["WrapTextInColor"],
	funcPath = "C_ColorUtil.WrapTextInColor",
	params = {
		{ name = "text", type = "cstring", default = nil },
		{ name = "color", type = "colorRGB", default = nil },
	},
	returns = { { name = "coloredText", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_ColorUtil.WrapTextInColorCode"] = {
	key = "C_ColorUtil.WrapTextInColorCode",
	name = "WrapTextInColorCode",
	category = "combat_midnight",
	subcategory = "c_colorutil",
	func = _G["C_ColorUtil"] and _G["C_ColorUtil"]["WrapTextInColorCode"],
	funcPath = "C_ColorUtil.WrapTextInColorCode",
	params = {
		{
			name = "text",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "Ambiguate(k", label = "AstralKeys" },
				{ value = "Ambiguate(unit", label = "AstralKeys" },
				{ value = "unit", label = "AstralKeys" },
			},
		},
		{ name = "textColorCode", type = "cstring", default = nil },
	},
	returns = { { name = "coloredText", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

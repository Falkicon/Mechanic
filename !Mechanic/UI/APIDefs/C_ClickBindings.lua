-- Generated APIDefinitions for namespace: C_ClickBindings
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ClickBindings.CanSpellBeClickBound"] = {
	key = "C_ClickBindings.CanSpellBeClickBound",
	name = "CanSpellBeClickBound",
	category = "combat_midnight",
	subcategory = "c_clickbindings",
	func = _G["C_ClickBindings"] and _G["C_ClickBindings"]["CanSpellBeClickBound"],
	funcPath = "C_ClickBindings.CanSpellBeClickBound",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = { { name = "canBeBound", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_ClickBindings.ExecuteBinding"] = {
	key = "C_ClickBindings.ExecuteBinding",
	name = "ExecuteBinding",
	category = "combat_midnight",
	subcategory = "c_clickbindings",
	func = _G["C_ClickBindings"] and _G["C_ClickBindings"]["ExecuteBinding"],
	funcPath = "C_ClickBindings.ExecuteBinding",
	params = {
		{ name = "targetToken", type = "cstring", default = nil },
		{ name = "button", type = "cstring", default = nil },
		{ name = "modifiers", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClickBindings.GetBindingType"] = {
	key = "C_ClickBindings.GetBindingType",
	name = "GetBindingType",
	category = "combat_midnight",
	subcategory = "c_clickbindings",
	func = _G["C_ClickBindings"] and _G["C_ClickBindings"]["GetBindingType"],
	funcPath = "C_ClickBindings.GetBindingType",
	params = {
		{ name = "button", type = "cstring", default = nil },
		{ name = "modifiers", type = "number", default = nil },
	},
	returns = { { name = "type", type = "ClickBindingType", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClickBindings.GetEffectiveInteractionButton"] = {
	key = "C_ClickBindings.GetEffectiveInteractionButton",
	name = "GetEffectiveInteractionButton",
	category = "combat_midnight",
	subcategory = "c_clickbindings",
	func = _G["C_ClickBindings"] and _G["C_ClickBindings"]["GetEffectiveInteractionButton"],
	funcPath = "C_ClickBindings.GetEffectiveInteractionButton",
	params = {
		{ name = "button", type = "cstring", default = nil },
		{ name = "modifiers", type = "number", default = nil },
	},
	returns = { { name = "effectiveButton", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClickBindings.GetStringFromModifiers"] = {
	key = "C_ClickBindings.GetStringFromModifiers",
	name = "GetStringFromModifiers",
	category = "combat_midnight",
	subcategory = "c_clickbindings",
	func = _G["C_ClickBindings"] and _G["C_ClickBindings"]["GetStringFromModifiers"],
	funcPath = "C_ClickBindings.GetStringFromModifiers",
	params = { { name = "modifiers", type = "number", default = nil } },
	returns = { { name = "modifierString", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClickBindings.SetProfileByInfo"] = {
	key = "C_ClickBindings.SetProfileByInfo",
	name = "SetProfileByInfo",
	category = "combat_midnight",
	subcategory = "c_clickbindings",
	func = _G["C_ClickBindings"] and _G["C_ClickBindings"]["SetProfileByInfo"],
	funcPath = "C_ClickBindings.SetProfileByInfo",
	params = { { name = "infoVec", type = "table", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

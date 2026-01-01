-- Generated APIDefinitions for namespace: C_KeyBindings
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_KeyBindings.ActivateBindingContext"] = {
	key = "C_KeyBindings.ActivateBindingContext",
	name = "ActivateBindingContext",
	category = "combat_midnight",
	subcategory = "c_keybindings",
	func = _G["C_KeyBindings"] and _G["C_KeyBindings"]["ActivateBindingContext"],
	funcPath = "C_KeyBindings.ActivateBindingContext",
	params = { { name = "newContext", type = "BindingContext", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_KeyBindings.DeactivateBindingContext"] = {
	key = "C_KeyBindings.DeactivateBindingContext",
	name = "DeactivateBindingContext",
	category = "combat_midnight",
	subcategory = "c_keybindings",
	func = _G["C_KeyBindings"] and _G["C_KeyBindings"]["DeactivateBindingContext"],
	funcPath = "C_KeyBindings.DeactivateBindingContext",
	params = { { name = "context", type = "BindingContext", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_KeyBindings.GetBindingByKey"] = {
	key = "C_KeyBindings.GetBindingByKey",
	name = "GetBindingByKey",
	category = "combat_midnight",
	subcategory = "c_keybindings",
	func = _G["C_KeyBindings"] and _G["C_KeyBindings"]["GetBindingByKey"],
	funcPath = "C_KeyBindings.GetBindingByKey",
	params = {
		{ name = "action", type = "cstring", default = nil },
		{ name = "context", type = "BindingContext", default = nil },
	},
	returns = { { name = "binding", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_KeyBindings.GetBindingContextForAction"] = {
	key = "C_KeyBindings.GetBindingContextForAction",
	name = "GetBindingContextForAction",
	category = "combat_midnight",
	subcategory = "c_keybindings",
	func = _G["C_KeyBindings"] and _G["C_KeyBindings"]["GetBindingContextForAction"],
	funcPath = "C_KeyBindings.GetBindingContextForAction",
	params = { { name = "action", type = "cstring", default = nil } },
	returns = { { name = "context", type = "BindingContext", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_KeyBindings.GetBindingIndex"] = {
	key = "C_KeyBindings.GetBindingIndex",
	name = "GetBindingIndex",
	category = "combat_midnight",
	subcategory = "c_keybindings",
	func = _G["C_KeyBindings"] and _G["C_KeyBindings"]["GetBindingIndex"],
	funcPath = "C_KeyBindings.GetBindingIndex",
	params = { { name = "action", type = "cstring", default = nil } },
	returns = { { name = "bindingIndex", type = "luaIndex", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_KeyBindings.GetCustomBindingType"] = {
	key = "C_KeyBindings.GetCustomBindingType",
	name = "GetCustomBindingType",
	category = "combat_midnight",
	subcategory = "c_keybindings",
	func = _G["C_KeyBindings"] and _G["C_KeyBindings"]["GetCustomBindingType"],
	funcPath = "C_KeyBindings.GetCustomBindingType",
	params = { { name = "bindingIndex", type = "luaIndex", default = nil } },
	returns = { { name = "customBindingType", type = "CustomBindingType", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_KeyBindings.GetSearchTagsForAction"] = {
	key = "C_KeyBindings.GetSearchTagsForAction",
	name = "GetSearchTagsForAction",
	category = "combat_midnight",
	subcategory = "c_keybindings",
	func = _G["C_KeyBindings"] and _G["C_KeyBindings"]["GetSearchTagsForAction"],
	funcPath = "C_KeyBindings.GetSearchTagsForAction",
	params = { { name = "action", type = "cstring", default = nil } },
	returns = { { name = "searchTags", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_KeyBindings.IsBindingContextActive"] = {
	key = "C_KeyBindings.IsBindingContextActive",
	name = "IsBindingContextActive",
	category = "combat_midnight",
	subcategory = "c_keybindings",
	func = _G["C_KeyBindings"] and _G["C_KeyBindings"]["IsBindingContextActive"],
	funcPath = "C_KeyBindings.IsBindingContextActive",
	params = { { name = "context", type = "BindingContext", default = nil } },
	returns = { { name = "isActive", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_KeyBindings.SetTurnStrafeStyle"] = {
	key = "C_KeyBindings.SetTurnStrafeStyle",
	name = "SetTurnStrafeStyle",
	category = "combat_midnight",
	subcategory = "c_keybindings",
	func = _G["C_KeyBindings"] and _G["C_KeyBindings"]["SetTurnStrafeStyle"],
	funcPath = "C_KeyBindings.SetTurnStrafeStyle",
	params = { { name = "style", type = "TurnStrafeStyle", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

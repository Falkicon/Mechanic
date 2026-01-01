-- Generated APIDefinitions for namespace: C_EventUtils
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_EventUtils.IsCallbackEvent"] = {
	key = "C_EventUtils.IsCallbackEvent",
	name = "IsCallbackEvent",
	category = "combat_midnight",
	subcategory = "c_eventutils",
	func = _G["C_EventUtils"] and _G["C_EventUtils"]["IsCallbackEvent"],
	funcPath = "C_EventUtils.IsCallbackEvent",
	params = { { name = "eventName", type = "stringView", default = nil } },
	returns = { { name = "isCallbackEvent", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EventUtils.IsEventValid"] = {
	key = "C_EventUtils.IsEventValid",
	name = "IsEventValid",
	category = "combat_midnight",
	subcategory = "c_eventutils",
	func = _G["C_EventUtils"] and _G["C_EventUtils"]["IsEventValid"],
	funcPath = "C_EventUtils.IsEventValid",
	params = {
		{
			name = "eventName",
			type = "stringView",
			default = nil,
			examples = {
				{ value = "PET_JOURNAL_PET_DELETED", label = "Baganator" },
				{ value = "SOCKET_INFO_UPDATE", label = "Baganator" },
				{ value = "SPELL_TEXT_UPDATE", label = "Details" },
			},
		},
	},
	returns = { { name = "valid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_CombatAudioAlert
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CombatAudioAlert.GetFormatSetting"] = {
	key = "C_CombatAudioAlert.GetFormatSetting",
	name = "GetFormatSetting",
	category = "combat_midnight",
	subcategory = "c_combataudioalert",
	func = _G["C_CombatAudioAlert"] and _G["C_CombatAudioAlert"]["GetFormatSetting"],
	funcPath = "C_CombatAudioAlert.GetFormatSetting",
	params = {
		{ name = "unit", type = "CombatAudioAlertUnit", default = nil },
		{ name = "alertType", type = "CombatAudioAlertType", default = nil },
	},
	returns = { { name = "formatVal", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CombatAudioAlert.GetSpecSetting"] = {
	key = "C_CombatAudioAlert.GetSpecSetting",
	name = "GetSpecSetting",
	category = "combat_midnight",
	subcategory = "c_combataudioalert",
	func = _G["C_CombatAudioAlert"] and _G["C_CombatAudioAlert"]["GetSpecSetting"],
	funcPath = "C_CombatAudioAlert.GetSpecSetting",
	params = { { name = "setting", type = "CombatAudioAlertSpecSetting", default = nil } },
	returns = { { name = "value", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CombatAudioAlert.GetThrottle"] = {
	key = "C_CombatAudioAlert.GetThrottle",
	name = "GetThrottle",
	category = "combat_midnight",
	subcategory = "c_combataudioalert",
	func = _G["C_CombatAudioAlert"] and _G["C_CombatAudioAlert"]["GetThrottle"],
	funcPath = "C_CombatAudioAlert.GetThrottle",
	params = { { name = "throttleType", type = "CombatAudioAlertThrottle", default = nil } },
	returns = { { name = "throttle", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CombatAudioAlert.SetFormatSetting"] = {
	key = "C_CombatAudioAlert.SetFormatSetting",
	name = "SetFormatSetting",
	category = "combat_midnight",
	subcategory = "c_combataudioalert",
	func = _G["C_CombatAudioAlert"] and _G["C_CombatAudioAlert"]["SetFormatSetting"],
	funcPath = "C_CombatAudioAlert.SetFormatSetting",
	params = {
		{ name = "unit", type = "CombatAudioAlertUnit", default = nil },
		{ name = "alertType", type = "CombatAudioAlertType", default = nil },
		{ name = "newVal", type = "number", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CombatAudioAlert.SetSpeakerSpeed"] = {
	key = "C_CombatAudioAlert.SetSpeakerSpeed",
	name = "SetSpeakerSpeed",
	category = "combat_midnight",
	subcategory = "c_combataudioalert",
	func = _G["C_CombatAudioAlert"] and _G["C_CombatAudioAlert"]["SetSpeakerSpeed"],
	funcPath = "C_CombatAudioAlert.SetSpeakerSpeed",
	params = { { name = "newVal", type = "number", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CombatAudioAlert.SetSpeakerVolume"] = {
	key = "C_CombatAudioAlert.SetSpeakerVolume",
	name = "SetSpeakerVolume",
	category = "combat_midnight",
	subcategory = "c_combataudioalert",
	func = _G["C_CombatAudioAlert"] and _G["C_CombatAudioAlert"]["SetSpeakerVolume"],
	funcPath = "C_CombatAudioAlert.SetSpeakerVolume",
	params = { { name = "newVal", type = "number", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CombatAudioAlert.SetSpecSetting"] = {
	key = "C_CombatAudioAlert.SetSpecSetting",
	name = "SetSpecSetting",
	category = "combat_midnight",
	subcategory = "c_combataudioalert",
	func = _G["C_CombatAudioAlert"] and _G["C_CombatAudioAlert"]["SetSpecSetting"],
	funcPath = "C_CombatAudioAlert.SetSpecSetting",
	params = {
		{ name = "setting", type = "CombatAudioAlertSpecSetting", default = nil },
		{ name = "newVal", type = "number", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CombatAudioAlert.SetThrottle"] = {
	key = "C_CombatAudioAlert.SetThrottle",
	name = "SetThrottle",
	category = "combat_midnight",
	subcategory = "c_combataudioalert",
	func = _G["C_CombatAudioAlert"] and _G["C_CombatAudioAlert"]["SetThrottle"],
	funcPath = "C_CombatAudioAlert.SetThrottle",
	params = {
		{ name = "throttleType", type = "CombatAudioAlertThrottle", default = nil },
		{ name = "newVal", type = "number", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CombatAudioAlert.SpeakText"] = {
	key = "C_CombatAudioAlert.SpeakText",
	name = "SpeakText",
	category = "combat_midnight",
	subcategory = "c_combataudioalert",
	func = _G["C_CombatAudioAlert"] and _G["C_CombatAudioAlert"]["SpeakText"],
	funcPath = "C_CombatAudioAlert.SpeakText",
	params = {
		{ name = "text", type = "string", default = nil },
		{ name = "allowOverlap", type = "bool", default = true },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

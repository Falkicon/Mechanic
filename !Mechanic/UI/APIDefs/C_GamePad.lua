-- Generated APIDefinitions for namespace: C_GamePad
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_GamePad.AddSDLMapping"] = {
	key = "C_GamePad.AddSDLMapping",
	name = "AddSDLMapping",
	category = "combat_midnight",
	subcategory = "c_gamepad",
	func = _G["C_GamePad"] and _G["C_GamePad"]["AddSDLMapping"],
	funcPath = "C_GamePad.AddSDLMapping",
	params = {
		{ name = "platform", type = "ClientPlatformType", default = nil },
		{ name = "mapping", type = "cstring", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.AxisIndexToConfigName"] = {
	key = "C_GamePad.AxisIndexToConfigName",
	name = "AxisIndexToConfigName",
	category = "combat_midnight",
	subcategory = "c_gamepad",
	func = _G["C_GamePad"] and _G["C_GamePad"]["AxisIndexToConfigName"],
	funcPath = "C_GamePad.AxisIndexToConfigName",
	params = { { name = "axisIndex", type = "number", default = nil } },
	returns = { { name = "configName", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.ButtonBindingToIndex"] = {
	key = "C_GamePad.ButtonBindingToIndex",
	name = "ButtonBindingToIndex",
	category = "combat_midnight",
	subcategory = "c_gamepad",
	func = _G["C_GamePad"] and _G["C_GamePad"]["ButtonBindingToIndex"],
	funcPath = "C_GamePad.ButtonBindingToIndex",
	params = { { name = "bindingName", type = "cstring", default = nil } },
	returns = { { name = "buttonIndex", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.ButtonIndexToBinding"] = {
	key = "C_GamePad.ButtonIndexToBinding",
	name = "ButtonIndexToBinding",
	category = "combat_midnight",
	subcategory = "c_gamepad",
	func = _G["C_GamePad"] and _G["C_GamePad"]["ButtonIndexToBinding"],
	funcPath = "C_GamePad.ButtonIndexToBinding",
	params = { { name = "buttonIndex", type = "number", default = nil } },
	returns = { { name = "bindingName", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.ButtonIndexToConfigName"] = {
	key = "C_GamePad.ButtonIndexToConfigName",
	name = "ButtonIndexToConfigName",
	category = "combat_midnight",
	subcategory = "c_gamepad",
	func = _G["C_GamePad"] and _G["C_GamePad"]["ButtonIndexToConfigName"],
	funcPath = "C_GamePad.ButtonIndexToConfigName",
	params = { { name = "buttonIndex", type = "number", default = nil } },
	returns = { { name = "configName", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.DeleteConfig"] = {
	key = "C_GamePad.DeleteConfig",
	name = "DeleteConfig",
	category = "combat_midnight",
	subcategory = "c_gamepad",
	func = _G["C_GamePad"] and _G["C_GamePad"]["DeleteConfig"],
	funcPath = "C_GamePad.DeleteConfig",
	params = { { name = "configID", type = "GamePadConfigID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.GetConfig"] = {
	key = "C_GamePad.GetConfig",
	name = "GetConfig",
	category = "combat_midnight",
	subcategory = "c_gamepad",
	func = _G["C_GamePad"] and _G["C_GamePad"]["GetConfig"],
	funcPath = "C_GamePad.GetConfig",
	params = { { name = "configID", type = "GamePadConfigID", default = nil } },
	returns = { { name = "config", type = "GamePadConfig", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.GetDeviceMappedState"] = {
	key = "C_GamePad.GetDeviceMappedState",
	name = "GetDeviceMappedState",
	category = "combat_midnight",
	subcategory = "c_gamepad",
	func = _G["C_GamePad"] and _G["C_GamePad"]["GetDeviceMappedState"],
	funcPath = "C_GamePad.GetDeviceMappedState",
	params = { { name = "deviceID", type = "number", default = nil } },
	returns = { { name = "state", type = "GamePadMappedState", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.GetDeviceRawState"] = {
	key = "C_GamePad.GetDeviceRawState",
	name = "GetDeviceRawState",
	category = "combat_midnight",
	subcategory = "c_gamepad",
	func = _G["C_GamePad"] and _G["C_GamePad"]["GetDeviceRawState"],
	funcPath = "C_GamePad.GetDeviceRawState",
	params = { { name = "deviceID", type = "number", default = nil } },
	returns = { { name = "rawState", type = "GamePadRawState", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.GetPowerLevel"] = {
	key = "C_GamePad.GetPowerLevel",
	name = "GetPowerLevel",
	category = "combat_midnight",
	subcategory = "c_gamepad",
	func = _G["C_GamePad"] and _G["C_GamePad"]["GetPowerLevel"],
	funcPath = "C_GamePad.GetPowerLevel",
	params = {
		{
			name = "deviceID",
			type = "number",
			default = nil,
			examples = { { value = "item", label = "Dominos_Progress" } },
		},
	},
	returns = { { name = "powerLevel", type = "GamePadPowerLevel", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.SetConfig"] = {
	key = "C_GamePad.SetConfig",
	name = "SetConfig",
	category = "combat_midnight",
	subcategory = "c_gamepad",
	func = _G["C_GamePad"] and _G["C_GamePad"]["SetConfig"],
	funcPath = "C_GamePad.SetConfig",
	params = { { name = "config", type = "GamePadConfig", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.SetLedColor"] = {
	key = "C_GamePad.SetLedColor",
	name = "SetLedColor",
	category = "combat_midnight",
	subcategory = "c_gamepad",
	func = _G["C_GamePad"] and _G["C_GamePad"]["SetLedColor"],
	funcPath = "C_GamePad.SetLedColor",
	params = { { name = "color", type = "colorRGB", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.SetVibration"] = {
	key = "C_GamePad.SetVibration",
	name = "SetVibration",
	category = "combat_midnight",
	subcategory = "c_gamepad",
	func = _G["C_GamePad"] and _G["C_GamePad"]["SetVibration"],
	funcPath = "C_GamePad.SetVibration",
	params = {
		{
			name = "vibrationType",
			type = "cstring",
			default = nil,
			examples = { { value = "High", label = "DBM-Core" } },
		},
		{ name = "intensity", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.StickIndexToConfigName"] = {
	key = "C_GamePad.StickIndexToConfigName",
	name = "StickIndexToConfigName",
	category = "combat_midnight",
	subcategory = "c_gamepad",
	func = _G["C_GamePad"] and _G["C_GamePad"]["StickIndexToConfigName"],
	funcPath = "C_GamePad.StickIndexToConfigName",
	params = { { name = "stickIndex", type = "number", default = nil } },
	returns = { { name = "configName", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

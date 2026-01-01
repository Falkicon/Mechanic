-- Generated APIDefinitions for namespace: C_Ping
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Ping.GetContextualPingTypeForUnit"] = {
	key = "C_Ping.GetContextualPingTypeForUnit",
	name = "GetContextualPingTypeForUnit",
	category = "combat_midnight",
	subcategory = "c_ping",
	func = _G["C_Ping"] and _G["C_Ping"]["GetContextualPingTypeForUnit"],
	funcPath = "C_Ping.GetContextualPingTypeForUnit",
	params = { { name = "targetUnit", type = "WOWGUID", default = nil } },
	returns = { { name = "type", type = "PingSubjectType", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Ping.GetTextureKitForType"] = {
	key = "C_Ping.GetTextureKitForType",
	name = "GetTextureKitForType",
	category = "combat_midnight",
	subcategory = "c_ping",
	func = _G["C_Ping"] and _G["C_Ping"]["GetTextureKitForType"],
	funcPath = "C_Ping.GetTextureKitForType",
	params = { { name = "type", type = "PingSubjectType", default = nil } },
	returns = { { name = "uiTextureKitID", type = "textureKit", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Ping.SendMacroPing"] = {
	key = "C_Ping.SendMacroPing",
	name = "SendMacroPing",
	category = "combat_midnight",
	subcategory = "c_ping",
	func = _G["C_Ping"] and _G["C_Ping"]["SendMacroPing"],
	funcPath = "C_Ping.SendMacroPing",
	params = {
		{ name = "type", type = "PingSubjectType", default = nil },
		{ name = "targetToken", type = "cstring", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Ping.TogglePingListener"] = {
	key = "C_Ping.TogglePingListener",
	name = "TogglePingListener",
	category = "combat_midnight",
	subcategory = "c_ping",
	func = _G["C_Ping"] and _G["C_Ping"]["TogglePingListener"],
	funcPath = "C_Ping.TogglePingListener",
	params = { { name = "down", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_GameRules
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_GameRules.AutoConnectToGameModeRealm"] = {
	key = "C_GameRules.AutoConnectToGameModeRealm",
	name = "AutoConnectToGameModeRealm",
	category = "combat_midnight",
	subcategory = "c_gamerules",
	func = _G["C_GameRules"] and _G["C_GameRules"]["AutoConnectToGameModeRealm"],
	funcPath = "C_GameRules.AutoConnectToGameModeRealm",
	params = { { name = "gameModeRecordID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.DoesGameModeHavePromo"] = {
	key = "C_GameRules.DoesGameModeHavePromo",
	name = "DoesGameModeHavePromo",
	category = "combat_midnight",
	subcategory = "c_gamerules",
	func = _G["C_GameRules"] and _G["C_GameRules"]["DoesGameModeHavePromo"],
	funcPath = "C_GameRules.DoesGameModeHavePromo",
	params = { { name = "gameModeRecordID", type = "number", default = nil } },
	returns = { { name = "hasPromo", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.GetDisplayedGameModeRecordIDAtIndex"] = {
	key = "C_GameRules.GetDisplayedGameModeRecordIDAtIndex",
	name = "GetDisplayedGameModeRecordIDAtIndex",
	category = "combat_midnight",
	subcategory = "c_gamerules",
	func = _G["C_GameRules"] and _G["C_GameRules"]["GetDisplayedGameModeRecordIDAtIndex"],
	funcPath = "C_GameRules.GetDisplayedGameModeRecordIDAtIndex",
	params = { { name = "displayIndex", type = "luaIndex", default = nil } },
	returns = { { name = "gameModeRecordID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.GetGameModeDisplayInfoByRecordID"] = {
	key = "C_GameRules.GetGameModeDisplayInfoByRecordID",
	name = "GetGameModeDisplayInfoByRecordID",
	category = "combat_midnight",
	subcategory = "c_gamerules",
	func = _G["C_GameRules"] and _G["C_GameRules"]["GetGameModeDisplayInfoByRecordID"],
	funcPath = "C_GameRules.GetGameModeDisplayInfoByRecordID",
	params = { { name = "gameModeRecordID", type = "number", default = nil } },
	returns = { { name = "info", type = "GameModeDisplayInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.GetGameModePromoGlobalString"] = {
	key = "C_GameRules.GetGameModePromoGlobalString",
	name = "GetGameModePromoGlobalString",
	category = "combat_midnight",
	subcategory = "c_gamerules",
	func = _G["C_GameRules"] and _G["C_GameRules"]["GetGameModePromoGlobalString"],
	funcPath = "C_GameRules.GetGameModePromoGlobalString",
	params = { { name = "gameModeRecordID", type = "number", default = nil } },
	returns = { { name = "promoGlobalString", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.GetGameRuleAsFloat"] = {
	key = "C_GameRules.GetGameRuleAsFloat",
	name = "GetGameRuleAsFloat",
	category = "combat_midnight",
	subcategory = "c_gamerules",
	func = _G["C_GameRules"] and _G["C_GameRules"]["GetGameRuleAsFloat"],
	funcPath = "C_GameRules.GetGameRuleAsFloat",
	params = {
		{ name = "gameRule", type = "GameRule", default = nil },
		{ name = "decimalPlaces", type = "number", default = 0 },
	},
	returns = { { name = "value", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.GetGameRuleAsFrameStrata"] = {
	key = "C_GameRules.GetGameRuleAsFrameStrata",
	name = "GetGameRuleAsFrameStrata",
	category = "combat_midnight",
	subcategory = "c_gamerules",
	func = _G["C_GameRules"] and _G["C_GameRules"]["GetGameRuleAsFrameStrata"],
	funcPath = "C_GameRules.GetGameRuleAsFrameStrata",
	params = { { name = "gameRule", type = "GameRule", default = nil } },
	returns = { { name = "frameStrata", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.IsClassAllowedForGameMode"] = {
	key = "C_GameRules.IsClassAllowedForGameMode",
	name = "IsClassAllowedForGameMode",
	category = "combat_midnight",
	subcategory = "c_gamerules",
	func = _G["C_GameRules"] and _G["C_GameRules"]["IsClassAllowedForGameMode"],
	funcPath = "C_GameRules.IsClassAllowedForGameMode",
	params = { { name = "classID", type = "number", default = nil } },
	returns = { { name = "valid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.IsGameModeEnabled"] = {
	key = "C_GameRules.IsGameModeEnabled",
	name = "IsGameModeEnabled",
	category = "combat_midnight",
	subcategory = "c_gamerules",
	func = _G["C_GameRules"] and _G["C_GameRules"]["IsGameModeEnabled"],
	funcPath = "C_GameRules.IsGameModeEnabled",
	params = { { name = "gameModeRecordID", type = "number", default = nil } },
	returns = { { name = "enabled", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GameRules.IsGameRuleActive"] = {
	key = "C_GameRules.IsGameRuleActive",
	name = "IsGameRuleActive",
	category = "combat_midnight",
	subcategory = "c_gamerules",
	func = _G["C_GameRules"] and _G["C_GameRules"]["IsGameRuleActive"],
	funcPath = "C_GameRules.IsGameRuleActive",
	params = { { name = "gameRule", type = "GameRule", default = nil } },
	returns = { { name = "isActive", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

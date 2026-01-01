-- Generated APIDefinitions for namespace: C_BattleNet
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_BattleNet.BNCheckBattleTagInviteToRecentAlly"] = {
	key = "C_BattleNet.BNCheckBattleTagInviteToRecentAlly",
	name = "BNCheckBattleTagInviteToRecentAlly",
	category = "combat_midnight",
	subcategory = "c_battlenet",
	func = _G["C_BattleNet"] and _G["C_BattleNet"]["BNCheckBattleTagInviteToRecentAlly"],
	funcPath = "C_BattleNet.BNCheckBattleTagInviteToRecentAlly",
	params = { { name = "recentAllyGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetAccountInfoByGUID"] = {
	key = "C_BattleNet.GetAccountInfoByGUID",
	name = "GetAccountInfoByGUID",
	category = "combat_midnight",
	subcategory = "c_battlenet",
	func = _G["C_BattleNet"] and _G["C_BattleNet"]["GetAccountInfoByGUID"],
	funcPath = "C_BattleNet.GetAccountInfoByGUID",
	params = {
		{ name = "guid", type = "WOWGUID", default = nil, examples = { { value = "guid", label = "AllTheThings" } } },
	},
	returns = { { name = "accountInfo", type = "BNetAccountInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetAccountInfoByID"] = {
	key = "C_BattleNet.GetAccountInfoByID",
	name = "GetAccountInfoByID",
	category = "combat_midnight",
	subcategory = "c_battlenet",
	func = _G["C_BattleNet"] and _G["C_BattleNet"]["GetAccountInfoByID"],
	funcPath = "C_BattleNet.GetAccountInfoByID",
	params = {
		{ name = "id", type = "number", default = nil },
		{ name = "wowAccountGUID", type = "WOWGUID", default = nil },
	},
	returns = { { name = "accountInfo", type = "BNetAccountInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetFriendAccountInfo"] = {
	key = "C_BattleNet.GetFriendAccountInfo",
	name = "GetFriendAccountInfo",
	category = "combat_midnight",
	subcategory = "c_battlenet",
	func = _G["C_BattleNet"] and _G["C_BattleNet"]["GetFriendAccountInfo"],
	funcPath = "C_BattleNet.GetFriendAccountInfo",
	params = {
		{ name = "friendIndex", type = "luaIndex", default = nil },
		{ name = "wowAccountGUID", type = "WOWGUID", default = nil },
	},
	returns = { { name = "accountInfo", type = "BNetAccountInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetFriendGameAccountInfo"] = {
	key = "C_BattleNet.GetFriendGameAccountInfo",
	name = "GetFriendGameAccountInfo",
	category = "combat_midnight",
	subcategory = "c_battlenet",
	func = _G["C_BattleNet"] and _G["C_BattleNet"]["GetFriendGameAccountInfo"],
	funcPath = "C_BattleNet.GetFriendGameAccountInfo",
	params = {
		{
			name = "friendIndex",
			type = "luaIndex",
			default = nil,
			examples = { { value = "self.id", label = "AstralKeys" } },
		},
		{ name = "accountIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "gameAccountInfo", type = "BNetGameAccountInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetFriendNumGameAccounts"] = {
	key = "C_BattleNet.GetFriendNumGameAccounts",
	name = "GetFriendNumGameAccounts",
	category = "combat_midnight",
	subcategory = "c_battlenet",
	func = _G["C_BattleNet"] and _G["C_BattleNet"]["GetFriendNumGameAccounts"],
	funcPath = "C_BattleNet.GetFriendNumGameAccounts",
	params = {
		{
			name = "friendIndex",
			type = "luaIndex",
			default = nil,
			examples = { { value = "self.id", label = "AstralKeys" } },
		},
	},
	returns = { { name = "numGameAccounts", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetGameAccountInfoByGUID"] = {
	key = "C_BattleNet.GetGameAccountInfoByGUID",
	name = "GetGameAccountInfoByGUID",
	category = "combat_midnight",
	subcategory = "c_battlenet",
	func = _G["C_BattleNet"] and _G["C_BattleNet"]["GetGameAccountInfoByGUID"],
	funcPath = "C_BattleNet.GetGameAccountInfoByGUID",
	params = {
		{
			name = "guid",
			type = "WOWGUID",
			default = nil,
			examples = {
				{ value = "guid", label = "AllTheThings" },
				{ value = [=[UnitGUID("player")]=], label = "TomTom" },
			},
		},
	},
	returns = { { name = "gameAccountInfo", type = "BNetGameAccountInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetGameAccountInfoByID"] = {
	key = "C_BattleNet.GetGameAccountInfoByID",
	name = "GetGameAccountInfoByID",
	category = "combat_midnight",
	subcategory = "c_battlenet",
	func = _G["C_BattleNet"] and _G["C_BattleNet"]["GetGameAccountInfoByID"],
	funcPath = "C_BattleNet.GetGameAccountInfoByID",
	params = { { name = "id", type = "number", default = nil } },
	returns = { { name = "gameAccountInfo", type = "BNetGameAccountInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.SendGameData"] = {
	key = "C_BattleNet.SendGameData",
	name = "SendGameData",
	category = "combat_midnight",
	subcategory = "c_battlenet",
	func = _G["C_BattleNet"] and _G["C_BattleNet"]["SendGameData"],
	funcPath = "C_BattleNet.SendGameData",
	params = {
		{ name = "gameAccountID", type = "number", default = nil },
		{ name = "prefix", type = "stringView", default = nil },
		{ name = "data", type = "stringView", default = nil },
	},
	returns = { { name = "result", type = "SendAddonMessageResult", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.SendWhisper"] = {
	key = "C_BattleNet.SendWhisper",
	name = "SendWhisper",
	category = "combat_midnight",
	subcategory = "c_battlenet",
	func = _G["C_BattleNet"] and _G["C_BattleNet"]["SendWhisper"],
	funcPath = "C_BattleNet.SendWhisper",
	params = {
		{ name = "bnetAccountID", type = "number", default = nil },
		{ name = "text", type = "stringView", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.SetCustomMessage"] = {
	key = "C_BattleNet.SetCustomMessage",
	name = "SetCustomMessage",
	category = "combat_midnight",
	subcategory = "c_battlenet",
	func = _G["C_BattleNet"] and _G["C_BattleNet"]["SetCustomMessage"],
	funcPath = "C_BattleNet.SetCustomMessage",
	params = { { name = "text", type = "cstring", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

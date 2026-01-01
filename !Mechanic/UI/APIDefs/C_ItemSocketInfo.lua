-- Generated APIDefinitions for namespace: C_ItemSocketInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ItemSocketInfo.ClickSocketButton"] = {
	key = "C_ItemSocketInfo.ClickSocketButton",
	name = "ClickSocketButton",
	category = "combat_midnight",
	subcategory = "c_itemsocketinfo",
	func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["ClickSocketButton"],
	funcPath = "C_ItemSocketInfo.ClickSocketButton",
	params = {
		{ name = "index", type = "luaIndex", default = nil, examples = { { value = 1, label = "Narcissus" } } },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemSocketInfo.GetExistingSocketInfo"] = {
	key = "C_ItemSocketInfo.GetExistingSocketInfo",
	name = "GetExistingSocketInfo",
	category = "combat_midnight",
	subcategory = "c_itemsocketinfo",
	func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["GetExistingSocketInfo"],
	funcPath = "C_ItemSocketInfo.GetExistingSocketInfo",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = {
		{ name = "name", type = "string", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
		{ name = "gemMatchesSocket", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemSocketInfo.GetExistingSocketLink"] = {
	key = "C_ItemSocketInfo.GetExistingSocketLink",
	name = "GetExistingSocketLink",
	category = "combat_midnight",
	subcategory = "c_itemsocketinfo",
	func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["GetExistingSocketLink"],
	funcPath = "C_ItemSocketInfo.GetExistingSocketLink",
	params = {
		{ name = "index", type = "luaIndex", default = nil, examples = { { value = 1, label = "Narcissus" } } },
	},
	returns = { { name = "existingSocketLink", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemSocketInfo.GetNewSocketInfo"] = {
	key = "C_ItemSocketInfo.GetNewSocketInfo",
	name = "GetNewSocketInfo",
	category = "combat_midnight",
	subcategory = "c_itemsocketinfo",
	func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["GetNewSocketInfo"],
	funcPath = "C_ItemSocketInfo.GetNewSocketInfo",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = {
		{ name = "name", type = "string", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
		{ name = "gemMatchesSocket", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemSocketInfo.GetNewSocketLink"] = {
	key = "C_ItemSocketInfo.GetNewSocketLink",
	name = "GetNewSocketLink",
	category = "combat_midnight",
	subcategory = "c_itemsocketinfo",
	func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["GetNewSocketLink"],
	funcPath = "C_ItemSocketInfo.GetNewSocketLink",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "newSocketLink", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemSocketInfo.GetSocketTypes"] = {
	key = "C_ItemSocketInfo.GetSocketTypes",
	name = "GetSocketTypes",
	category = "combat_midnight",
	subcategory = "c_itemsocketinfo",
	func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["GetSocketTypes"],
	funcPath = "C_ItemSocketInfo.GetSocketTypes",
	params = {
		{ name = "index", type = "luaIndex", default = nil, examples = { { value = 1, label = "Narcissus" } } },
	},
	returns = { { name = "socketType", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemSocketInfo.IsArtifactRelicItem"] = {
	key = "C_ItemSocketInfo.IsArtifactRelicItem",
	name = "IsArtifactRelicItem",
	category = "combat_midnight",
	subcategory = "c_itemsocketinfo",
	func = _G["C_ItemSocketInfo"] and _G["C_ItemSocketInfo"]["IsArtifactRelicItem"],
	funcPath = "C_ItemSocketInfo.IsArtifactRelicItem",
	params = {
		{ name = "info", type = "ItemInfo", default = nil, examples = { { value = "Info.Item.ID", label = "Pawn" } } },
	},
	returns = { { name = "isArtifactRelicItem", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

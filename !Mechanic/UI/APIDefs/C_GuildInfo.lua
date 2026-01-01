-- Generated APIDefinitions for namespace: C_GuildInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_GuildInfo.Demote"] = {
	key = "C_GuildInfo.Demote",
	name = "Demote",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["Demote"],
	funcPath = "C_GuildInfo.Demote",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.GetGuildNewsInfo"] = {
	key = "C_GuildInfo.GetGuildNewsInfo",
	name = "GetGuildNewsInfo",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["GetGuildNewsInfo"],
	funcPath = "C_GuildInfo.GetGuildNewsInfo",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "newsInfo", type = "GuildNewsInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.GetGuildRankOrder"] = {
	key = "C_GuildInfo.GetGuildRankOrder",
	name = "GetGuildRankOrder",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["GetGuildRankOrder"],
	funcPath = "C_GuildInfo.GetGuildRankOrder",
	params = {
		{
			name = "guid",
			type = "WOWGUID",
			default = nil,
			examples = { { value = "UnitGUID(id)", label = "TitanLootType" } },
		},
	},
	returns = { { name = "rankOrder", type = "luaIndex", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.GetGuildTabardInfo"] = {
	key = "C_GuildInfo.GetGuildTabardInfo",
	name = "GetGuildTabardInfo",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["GetGuildTabardInfo"],
	funcPath = "C_GuildInfo.GetGuildTabardInfo",
	params = { { name = "unit", type = "UnitToken", default = "player" } },
	returns = { { name = "tabardInfo", type = "GuildTabardInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.GuildControlGetRankFlags"] = {
	key = "C_GuildInfo.GuildControlGetRankFlags",
	name = "GuildControlGetRankFlags",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["GuildControlGetRankFlags"],
	funcPath = "C_GuildInfo.GuildControlGetRankFlags",
	params = { { name = "rankOrder", type = "luaIndex", default = nil } },
	returns = { { name = "permissions", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.Invite"] = {
	key = "C_GuildInfo.Invite",
	name = "Invite",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["Invite"],
	funcPath = "C_GuildInfo.Invite",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.IsGuildRankAssignmentAllowed"] = {
	key = "C_GuildInfo.IsGuildRankAssignmentAllowed",
	name = "IsGuildRankAssignmentAllowed",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["IsGuildRankAssignmentAllowed"],
	funcPath = "C_GuildInfo.IsGuildRankAssignmentAllowed",
	params = {
		{ name = "guid", type = "WOWGUID", default = nil },
		{ name = "rankOrder", type = "luaIndex", default = nil },
	},
	returns = { { name = "isGuildRankAssignmentAllowed", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.MemberExistsByName"] = {
	key = "C_GuildInfo.MemberExistsByName",
	name = "MemberExistsByName",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["MemberExistsByName"],
	funcPath = "C_GuildInfo.MemberExistsByName",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = { { name = "exists", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.Promote"] = {
	key = "C_GuildInfo.Promote",
	name = "Promote",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["Promote"],
	funcPath = "C_GuildInfo.Promote",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.QueryGuildMemberRecipes"] = {
	key = "C_GuildInfo.QueryGuildMemberRecipes",
	name = "QueryGuildMemberRecipes",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["QueryGuildMemberRecipes"],
	funcPath = "C_GuildInfo.QueryGuildMemberRecipes",
	params = {
		{ name = "guildMemberGUID", type = "WOWGUID", default = nil },
		{ name = "skillLineID", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.QueryGuildMembersForRecipe"] = {
	key = "C_GuildInfo.QueryGuildMembersForRecipe",
	name = "QueryGuildMembersForRecipe",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["QueryGuildMembersForRecipe"],
	funcPath = "C_GuildInfo.QueryGuildMembersForRecipe",
	params = {
		{ name = "skillLineID", type = "number", default = nil },
		{ name = "recipeSpellID", type = "number", default = nil },
		{ name = "recipeLevel", type = "luaIndex", default = nil },
	},
	returns = { { name = "updatedRecipeSpellID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.RemoveFromGuild"] = {
	key = "C_GuildInfo.RemoveFromGuild",
	name = "RemoveFromGuild",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["RemoveFromGuild"],
	funcPath = "C_GuildInfo.RemoveFromGuild",
	params = { { name = "guid", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.RequestGuildRename"] = {
	key = "C_GuildInfo.RequestGuildRename",
	name = "RequestGuildRename",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["RequestGuildRename"],
	funcPath = "C_GuildInfo.RequestGuildRename",
	params = { { name = "desiredName", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.RequestRenameNameCheck"] = {
	key = "C_GuildInfo.RequestRenameNameCheck",
	name = "RequestRenameNameCheck",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["RequestRenameNameCheck"],
	funcPath = "C_GuildInfo.RequestRenameNameCheck",
	params = { { name = "desiredName", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.SetGuildRankOrder"] = {
	key = "C_GuildInfo.SetGuildRankOrder",
	name = "SetGuildRankOrder",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["SetGuildRankOrder"],
	funcPath = "C_GuildInfo.SetGuildRankOrder",
	params = {
		{ name = "guid", type = "WOWGUID", default = nil },
		{ name = "rankOrder", type = "luaIndex", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.SetLeader"] = {
	key = "C_GuildInfo.SetLeader",
	name = "SetLeader",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["SetLeader"],
	funcPath = "C_GuildInfo.SetLeader",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.SetMOTD"] = {
	key = "C_GuildInfo.SetMOTD",
	name = "SetMOTD",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["SetMOTD"],
	funcPath = "C_GuildInfo.SetMOTD",
	params = { { name = "motd", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.SetNote"] = {
	key = "C_GuildInfo.SetNote",
	name = "SetNote",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["SetNote"],
	funcPath = "C_GuildInfo.SetNote",
	params = {
		{ name = "guid", type = "WOWGUID", default = nil },
		{ name = "note", type = "cstring", default = nil },
		{ name = "isPublic", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.Uninvite"] = {
	key = "C_GuildInfo.Uninvite",
	name = "Uninvite",
	category = "combat_midnight",
	subcategory = "c_guildinfo",
	func = _G["C_GuildInfo"] and _G["C_GuildInfo"]["Uninvite"],
	funcPath = "C_GuildInfo.Uninvite",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

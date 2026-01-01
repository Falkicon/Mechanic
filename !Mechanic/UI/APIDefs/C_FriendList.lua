-- Generated APIDefinitions for namespace: C_FriendList
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_FriendList.AddFriend"] = {
	key = "C_FriendList.AddFriend",
	name = "AddFriend",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["AddFriend"],
	funcPath = "C_FriendList.AddFriend",
	params = { { name = "name", type = "cstring", default = nil }, { name = "notes", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.AddIgnore"] = {
	key = "C_FriendList.AddIgnore",
	name = "AddIgnore",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["AddIgnore"],
	funcPath = "C_FriendList.AddIgnore",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = { { name = "added", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.AddOrDelIgnore"] = {
	key = "C_FriendList.AddOrDelIgnore",
	name = "AddOrDelIgnore",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["AddOrDelIgnore"],
	funcPath = "C_FriendList.AddOrDelIgnore",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.AddOrRemoveFriend"] = {
	key = "C_FriendList.AddOrRemoveFriend",
	name = "AddOrRemoveFriend",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["AddOrRemoveFriend"],
	funcPath = "C_FriendList.AddOrRemoveFriend",
	params = { { name = "name", type = "cstring", default = nil }, { name = "notes", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.DelIgnore"] = {
	key = "C_FriendList.DelIgnore",
	name = "DelIgnore",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["DelIgnore"],
	funcPath = "C_FriendList.DelIgnore",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = { { name = "removed", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.DelIgnoreByIndex"] = {
	key = "C_FriendList.DelIgnoreByIndex",
	name = "DelIgnoreByIndex",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["DelIgnoreByIndex"],
	funcPath = "C_FriendList.DelIgnoreByIndex",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.GetFriendInfo"] = {
	key = "C_FriendList.GetFriendInfo",
	name = "GetFriendInfo",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["GetFriendInfo"],
	funcPath = "C_FriendList.GetFriendInfo",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = { { name = "info", type = "FriendInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.GetFriendInfoByIndex"] = {
	key = "C_FriendList.GetFriendInfoByIndex",
	name = "GetFriendInfoByIndex",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["GetFriendInfoByIndex"],
	funcPath = "C_FriendList.GetFriendInfoByIndex",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "info", type = "FriendInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.GetIgnoreName"] = {
	key = "C_FriendList.GetIgnoreName",
	name = "GetIgnoreName",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["GetIgnoreName"],
	funcPath = "C_FriendList.GetIgnoreName",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = { { name = "name", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.GetWhoInfo"] = {
	key = "C_FriendList.GetWhoInfo",
	name = "GetWhoInfo",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["GetWhoInfo"],
	funcPath = "C_FriendList.GetWhoInfo",
	params = { { name = "index", type = "luaIndex", default = nil, examples = { { value = 1, label = "Plumber" } } } },
	returns = { { name = "info", type = "WhoInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.IsFriend"] = {
	key = "C_FriendList.IsFriend",
	name = "IsFriend",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["IsFriend"],
	funcPath = "C_FriendList.IsFriend",
	params = {
		{
			name = "guid",
			type = "WOWGUID",
			default = nil,
			examples = { { value = "guid", label = "BigWigs_Plugins" } },
		},
	},
	returns = { { name = "isFriend", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.IsIgnored"] = {
	key = "C_FriendList.IsIgnored",
	name = "IsIgnored",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["IsIgnored"],
	funcPath = "C_FriendList.IsIgnored",
	params = { { name = "token", type = "cstring", default = nil } },
	returns = { { name = "isIgnored", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.IsIgnoredByGuid"] = {
	key = "C_FriendList.IsIgnoredByGuid",
	name = "IsIgnoredByGuid",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["IsIgnoredByGuid"],
	funcPath = "C_FriendList.IsIgnoredByGuid",
	params = { { name = "guid", type = "WOWGUID", default = nil } },
	returns = { { name = "isIgnored", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.IsOnIgnoredList"] = {
	key = "C_FriendList.IsOnIgnoredList",
	name = "IsOnIgnoredList",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["IsOnIgnoredList"],
	funcPath = "C_FriendList.IsOnIgnoredList",
	params = { { name = "token", type = "cstring", default = nil } },
	returns = { { name = "isIgnored", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.RemoveFriend"] = {
	key = "C_FriendList.RemoveFriend",
	name = "RemoveFriend",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["RemoveFriend"],
	funcPath = "C_FriendList.RemoveFriend",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = { { name = "removed", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.RemoveFriendByIndex"] = {
	key = "C_FriendList.RemoveFriendByIndex",
	name = "RemoveFriendByIndex",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["RemoveFriendByIndex"],
	funcPath = "C_FriendList.RemoveFriendByIndex",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.SendWho"] = {
	key = "C_FriendList.SendWho",
	name = "SendWho",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["SendWho"],
	funcPath = "C_FriendList.SendWho",
	params = {
		{ name = "filter", type = "cstring", default = nil },
		{ name = "origin", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.SetFriendNotes"] = {
	key = "C_FriendList.SetFriendNotes",
	name = "SetFriendNotes",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["SetFriendNotes"],
	funcPath = "C_FriendList.SetFriendNotes",
	params = {
		{
			name = "name",
			type = "cstring",
			default = nil,
			examples = { { value = "dfButton.playerName", label = "Details" } },
		},
		{ name = "notes", type = "cstring", default = nil },
	},
	returns = { { name = "found", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.SetFriendNotesByIndex"] = {
	key = "C_FriendList.SetFriendNotesByIndex",
	name = "SetFriendNotesByIndex",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["SetFriendNotesByIndex"],
	funcPath = "C_FriendList.SetFriendNotesByIndex",
	params = {
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "notes", type = "cstring", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.SetSelectedFriend"] = {
	key = "C_FriendList.SetSelectedFriend",
	name = "SetSelectedFriend",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["SetSelectedFriend"],
	funcPath = "C_FriendList.SetSelectedFriend",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.SetSelectedIgnore"] = {
	key = "C_FriendList.SetSelectedIgnore",
	name = "SetSelectedIgnore",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["SetSelectedIgnore"],
	funcPath = "C_FriendList.SetSelectedIgnore",
	params = { { name = "index", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.SetWhoToUi"] = {
	key = "C_FriendList.SetWhoToUi",
	name = "SetWhoToUi",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["SetWhoToUi"],
	funcPath = "C_FriendList.SetWhoToUi",
	params = { { name = "whoToUi", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.SortWho"] = {
	key = "C_FriendList.SortWho",
	name = "SortWho",
	category = "combat_midnight",
	subcategory = "c_friendlist",
	func = _G["C_FriendList"] and _G["C_FriendList"]["SortWho"],
	funcPath = "C_FriendList.SortWho",
	params = { { name = "sorting", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

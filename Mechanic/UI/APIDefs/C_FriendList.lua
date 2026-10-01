-- Generated APIDefinitions for namespace: C_FriendList
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_FriendList.AddFriend"] = {
    key = "C_FriendList.AddFriend",
    name = "AddFriend",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.AddFriend",
    params = { { name = "name", type = "cstring", default = nil }, { name = "notes", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.AddIgnore"] = {
    key = "C_FriendList.AddIgnore",
    name = "AddIgnore",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.AddIgnore",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "added", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.AddOrDelIgnore"] = {
    key = "C_FriendList.AddOrDelIgnore",
    name = "AddOrDelIgnore",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.AddOrDelIgnore",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.AddOrRemoveFriend"] = {
    key = "C_FriendList.AddOrRemoveFriend",
    name = "AddOrRemoveFriend",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.AddOrRemoveFriend",
    params = { { name = "name", type = "cstring", default = nil }, { name = "notes", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.DelIgnore"] = {
    key = "C_FriendList.DelIgnore",
    name = "DelIgnore",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.DelIgnore",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "removed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.DelIgnoreByIndex"] = {
    key = "C_FriendList.DelIgnoreByIndex",
    name = "DelIgnoreByIndex",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.DelIgnoreByIndex",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.GetFriendInfo"] = {
    key = "C_FriendList.GetFriendInfo",
    name = "GetFriendInfo",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.GetFriendInfo",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "info", type = "FriendInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.GetFriendInfoByIndex"] = {
    key = "C_FriendList.GetFriendInfoByIndex",
    name = "GetFriendInfoByIndex",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.GetFriendInfoByIndex",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "info", type = "FriendInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.GetIgnoreName"] = {
    key = "C_FriendList.GetIgnoreName",
    name = "GetIgnoreName",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.GetIgnoreName",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.GetNumFriends"] = {
    key = "C_FriendList.GetNumFriends",
    name = "GetNumFriends",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.GetNumFriends",
    params = {  },
    returns = { { name = "numFriends", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_FriendList.GetNumIgnores"] = {
    key = "C_FriendList.GetNumIgnores",
    name = "GetNumIgnores",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.GetNumIgnores",
    params = {  },
    returns = { { name = "numIgnores", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_FriendList.GetNumOnlineFriends"] = {
    key = "C_FriendList.GetNumOnlineFriends",
    name = "GetNumOnlineFriends",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.GetNumOnlineFriends",
    params = {  },
    returns = { { name = "numOnline", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_FriendList.GetNumWhoResults"] = {
    key = "C_FriendList.GetNumWhoResults",
    name = "GetNumWhoResults",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.GetNumWhoResults",
    params = {  },
    returns = { { name = "numWhos", type = "number", canBeSecret = false }, { name = "totalNumWhos", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_FriendList.GetSelectedFriend"] = {
    key = "C_FriendList.GetSelectedFriend",
    name = "GetSelectedFriend",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.GetSelectedFriend",
    params = {  },
    returns = { { name = "index", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_FriendList.GetSelectedIgnore"] = {
    key = "C_FriendList.GetSelectedIgnore",
    name = "GetSelectedIgnore",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.GetSelectedIgnore",
    params = {  },
    returns = { { name = "index", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_FriendList.GetWhoInfo"] = {
    key = "C_FriendList.GetWhoInfo",
    name = "GetWhoInfo",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.GetWhoInfo",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "info", type = "WhoInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.IsFriend"] = {
    key = "C_FriendList.IsFriend",
    name = "IsFriend",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.IsFriend",
    params = { { name = "guid", type = "WOWGUID", default = nil } },
    returns = { { name = "isFriend", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.IsIgnored"] = {
    key = "C_FriendList.IsIgnored",
    name = "IsIgnored",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.IsIgnored",
    params = { { name = "token", type = "cstring", default = nil } },
    returns = { { name = "isIgnored", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.IsIgnoredByGuid"] = {
    key = "C_FriendList.IsIgnoredByGuid",
    name = "IsIgnoredByGuid",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.IsIgnoredByGuid",
    params = { { name = "guid", type = "WOWGUID", default = nil } },
    returns = { { name = "isIgnored", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.IsOnIgnoredList"] = {
    key = "C_FriendList.IsOnIgnoredList",
    name = "IsOnIgnoredList",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.IsOnIgnoredList",
    params = { { name = "token", type = "cstring", default = nil } },
    returns = { { name = "isIgnored", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.RemoveFriend"] = {
    key = "C_FriendList.RemoveFriend",
    name = "RemoveFriend",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.RemoveFriend",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "removed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.RemoveFriendByIndex"] = {
    key = "C_FriendList.RemoveFriendByIndex",
    name = "RemoveFriendByIndex",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.RemoveFriendByIndex",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.SendWho"] = {
    key = "C_FriendList.SendWho",
    name = "SendWho",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.SendWho",
    params = { { name = "filter", type = "cstring", default = nil }, { name = "origin", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.SetFriendNotes"] = {
    key = "C_FriendList.SetFriendNotes",
    name = "SetFriendNotes",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.SetFriendNotes",
    params = { { name = "name", type = "cstring", default = nil }, { name = "notes", type = "cstring", default = nil } },
    returns = { { name = "found", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.SetFriendNotesByIndex"] = {
    key = "C_FriendList.SetFriendNotesByIndex",
    name = "SetFriendNotesByIndex",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.SetFriendNotesByIndex",
    params = { { name = "index", type = "luaIndex", default = nil }, { name = "notes", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.SetSelectedFriend"] = {
    key = "C_FriendList.SetSelectedFriend",
    name = "SetSelectedFriend",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.SetSelectedFriend",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.SetSelectedIgnore"] = {
    key = "C_FriendList.SetSelectedIgnore",
    name = "SetSelectedIgnore",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.SetSelectedIgnore",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.SetWhoToUi"] = {
    key = "C_FriendList.SetWhoToUi",
    name = "SetWhoToUi",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.SetWhoToUi",
    params = { { name = "whoToUi", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_FriendList.ShowFriends"] = {
    key = "C_FriendList.ShowFriends",
    name = "ShowFriends",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.ShowFriends",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_FriendList.SortWho"] = {
    key = "C_FriendList.SortWho",
    name = "SortWho",
    category = "social",
    subcategory = "c_friendlist",
    funcPath = "C_FriendList.SortWho",
    params = { { name = "sorting", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

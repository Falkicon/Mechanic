-- Generated APIDefinitions for namespace: C_LobbyMatchmakerInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LobbyMatchmakerInfo.AbandonQueue"] = {
    key = "C_LobbyMatchmakerInfo.AbandonQueue",
    name = "AbandonQueue",
    category = "general",
    subcategory = "c_lobbymatchmakerinfo",
    funcPath = "C_LobbyMatchmakerInfo.AbandonQueue",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_LobbyMatchmakerInfo.EnterQueue"] = {
    key = "C_LobbyMatchmakerInfo.EnterQueue",
    name = "EnterQueue",
    category = "general",
    subcategory = "c_lobbymatchmakerinfo",
    funcPath = "C_LobbyMatchmakerInfo.EnterQueue",
    params = { { name = "playlistEntry", type = "PartyPlaylistEntry", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LobbyMatchmakerInfo.GetCurrQueuePlaylistEntry"] = {
    key = "C_LobbyMatchmakerInfo.GetCurrQueuePlaylistEntry",
    name = "GetCurrQueuePlaylistEntry",
    category = "general",
    subcategory = "c_lobbymatchmakerinfo",
    funcPath = "C_LobbyMatchmakerInfo.GetCurrQueuePlaylistEntry",
    params = {  },
    returns = { { name = "playlistEntry", type = "PartyPlaylistEntry", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LobbyMatchmakerInfo.GetCurrQueueState"] = {
    key = "C_LobbyMatchmakerInfo.GetCurrQueueState",
    name = "GetCurrQueueState",
    category = "general",
    subcategory = "c_lobbymatchmakerinfo",
    funcPath = "C_LobbyMatchmakerInfo.GetCurrQueueState",
    params = {  },
    returns = { { name = "queueState", type = "PlunderstormQueueState", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LobbyMatchmakerInfo.GetQueueFromMainlineEnabled"] = {
    key = "C_LobbyMatchmakerInfo.GetQueueFromMainlineEnabled",
    name = "GetQueueFromMainlineEnabled",
    category = "general",
    subcategory = "c_lobbymatchmakerinfo",
    funcPath = "C_LobbyMatchmakerInfo.GetQueueFromMainlineEnabled",
    params = {  },
    returns = { { name = "queueFromMainlineEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LobbyMatchmakerInfo.GetQueueStartTime"] = {
    key = "C_LobbyMatchmakerInfo.GetQueueStartTime",
    name = "GetQueueStartTime",
    category = "general",
    subcategory = "c_lobbymatchmakerinfo",
    funcPath = "C_LobbyMatchmakerInfo.GetQueueStartTime",
    params = {  },
    returns = { { name = "queueStartTime", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LobbyMatchmakerInfo.IsInQueue"] = {
    key = "C_LobbyMatchmakerInfo.IsInQueue",
    name = "IsInQueue",
    category = "general",
    subcategory = "c_lobbymatchmakerinfo",
    funcPath = "C_LobbyMatchmakerInfo.IsInQueue",
    params = {  },
    returns = { { name = "isInQueue", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_LobbyMatchmakerInfo.RespondToQueuePop"] = {
    key = "C_LobbyMatchmakerInfo.RespondToQueuePop",
    name = "RespondToQueuePop",
    category = "general",
    subcategory = "c_lobbymatchmakerinfo",
    funcPath = "C_LobbyMatchmakerInfo.RespondToQueuePop",
    params = { { name = "acceptQueue", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

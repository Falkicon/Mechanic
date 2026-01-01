-- Generated APIDefinitions for namespace: C_LobbyMatchmakerInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LobbyMatchmakerInfo.EnterQueue"] = {
	key = "C_LobbyMatchmakerInfo.EnterQueue",
	name = "EnterQueue",
	category = "combat_midnight",
	subcategory = "c_lobbymatchmakerinfo",
	func = _G["C_LobbyMatchmakerInfo"] and _G["C_LobbyMatchmakerInfo"]["EnterQueue"],
	funcPath = "C_LobbyMatchmakerInfo.EnterQueue",
	params = { { name = "playlistEntry", type = "PartyPlaylistEntry", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_LobbyMatchmakerInfo.RespondToQueuePop"] = {
	key = "C_LobbyMatchmakerInfo.RespondToQueuePop",
	name = "RespondToQueuePop",
	category = "combat_midnight",
	subcategory = "c_lobbymatchmakerinfo",
	func = _G["C_LobbyMatchmakerInfo"] and _G["C_LobbyMatchmakerInfo"]["RespondToQueuePop"],
	funcPath = "C_LobbyMatchmakerInfo.RespondToQueuePop",
	params = { { name = "acceptQueue", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

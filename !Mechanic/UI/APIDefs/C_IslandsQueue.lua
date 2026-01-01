-- Generated APIDefinitions for namespace: C_IslandsQueue
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_IslandsQueue.QueueForIsland"] = {
	key = "C_IslandsQueue.QueueForIsland",
	name = "QueueForIsland",
	category = "combat_midnight",
	subcategory = "c_islandsqueue",
	func = _G["C_IslandsQueue"] and _G["C_IslandsQueue"]["QueueForIsland"],
	funcPath = "C_IslandsQueue.QueueForIsland",
	params = { { name = "difficultyID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_IslandsQueue.RequestPreloadRewardData"] = {
	key = "C_IslandsQueue.RequestPreloadRewardData",
	name = "RequestPreloadRewardData",
	category = "combat_midnight",
	subcategory = "c_islandsqueue",
	func = _G["C_IslandsQueue"] and _G["C_IslandsQueue"]["RequestPreloadRewardData"],
	funcPath = "C_IslandsQueue.RequestPreloadRewardData",
	params = { { name = "questId", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

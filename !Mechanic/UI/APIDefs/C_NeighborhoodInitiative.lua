-- Generated APIDefinitions for namespace: C_NeighborhoodInitiative
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_NeighborhoodInitiative.AddTrackedInitiativeTask"] = {
	key = "C_NeighborhoodInitiative.AddTrackedInitiativeTask",
	name = "AddTrackedInitiativeTask",
	category = "combat_midnight",
	subcategory = "c_neighborhoodinitiative",
	func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["AddTrackedInitiativeTask"],
	funcPath = "C_NeighborhoodInitiative.AddTrackedInitiativeTask",
	params = { { name = "initiativeTaskID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NeighborhoodInitiative.GetInitiativeTaskChatLink"] = {
	key = "C_NeighborhoodInitiative.GetInitiativeTaskChatLink",
	name = "GetInitiativeTaskChatLink",
	category = "combat_midnight",
	subcategory = "c_neighborhoodinitiative",
	func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["GetInitiativeTaskChatLink"],
	funcPath = "C_NeighborhoodInitiative.GetInitiativeTaskChatLink",
	params = { { name = "initiativeTaskID", type = "number", default = nil } },
	returns = { { name = "link", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NeighborhoodInitiative.GetInitiativeTaskInfo"] = {
	key = "C_NeighborhoodInitiative.GetInitiativeTaskInfo",
	name = "GetInitiativeTaskInfo",
	category = "combat_midnight",
	subcategory = "c_neighborhoodinitiative",
	func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["GetInitiativeTaskInfo"],
	funcPath = "C_NeighborhoodInitiative.GetInitiativeTaskInfo",
	params = { { name = "initiativeTaskID", type = "number", default = nil } },
	returns = { { name = "info", type = "InitiativeTaskInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NeighborhoodInitiative.RemoveTrackedInitiativeTask"] = {
	key = "C_NeighborhoodInitiative.RemoveTrackedInitiativeTask",
	name = "RemoveTrackedInitiativeTask",
	category = "combat_midnight",
	subcategory = "c_neighborhoodinitiative",
	func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["RemoveTrackedInitiativeTask"],
	funcPath = "C_NeighborhoodInitiative.RemoveTrackedInitiativeTask",
	params = { { name = "initiativeTaskID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NeighborhoodInitiative.SetActiveNeighborhood"] = {
	key = "C_NeighborhoodInitiative.SetActiveNeighborhood",
	name = "SetActiveNeighborhood",
	category = "combat_midnight",
	subcategory = "c_neighborhoodinitiative",
	func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["SetActiveNeighborhood"],
	funcPath = "C_NeighborhoodInitiative.SetActiveNeighborhood",
	params = { { name = "neighborhoodGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NeighborhoodInitiative.SetViewingNeighborhood"] = {
	key = "C_NeighborhoodInitiative.SetViewingNeighborhood",
	name = "SetViewingNeighborhood",
	category = "combat_midnight",
	subcategory = "c_neighborhoodinitiative",
	func = _G["C_NeighborhoodInitiative"] and _G["C_NeighborhoodInitiative"]["SetViewingNeighborhood"],
	funcPath = "C_NeighborhoodInitiative.SetViewingNeighborhood",
	params = { { name = "neighborhoodGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

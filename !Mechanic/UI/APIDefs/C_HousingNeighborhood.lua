-- Generated APIDefinitions for namespace: C_HousingNeighborhood
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HousingNeighborhood.CancelInviteToNeighborhood"] = {
	key = "C_HousingNeighborhood.CancelInviteToNeighborhood",
	name = "CancelInviteToNeighborhood",
	category = "combat_midnight",
	subcategory = "c_housingneighborhood",
	func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["CancelInviteToNeighborhood"],
	funcPath = "C_HousingNeighborhood.CancelInviteToNeighborhood",
	params = { { name = "playerName", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingNeighborhood.DemoteToResident"] = {
	key = "C_HousingNeighborhood.DemoteToResident",
	name = "DemoteToResident",
	category = "combat_midnight",
	subcategory = "c_housingneighborhood",
	func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["DemoteToResident"],
	funcPath = "C_HousingNeighborhood.DemoteToResident",
	params = { { name = "playerGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingNeighborhood.GetNeighborhoodPlotName"] = {
	key = "C_HousingNeighborhood.GetNeighborhoodPlotName",
	name = "GetNeighborhoodPlotName",
	category = "combat_midnight",
	subcategory = "c_housingneighborhood",
	func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["GetNeighborhoodPlotName"],
	funcPath = "C_HousingNeighborhood.GetNeighborhoodPlotName",
	params = { { name = "plotIndex", type = "number", default = nil } },
	returns = { { name = "neighborhoodName", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingNeighborhood.InvitePlayerToNeighborhood"] = {
	key = "C_HousingNeighborhood.InvitePlayerToNeighborhood",
	name = "InvitePlayerToNeighborhood",
	category = "combat_midnight",
	subcategory = "c_housingneighborhood",
	func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["InvitePlayerToNeighborhood"],
	funcPath = "C_HousingNeighborhood.InvitePlayerToNeighborhood",
	params = { { name = "playerName", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingNeighborhood.PromoteToManager"] = {
	key = "C_HousingNeighborhood.PromoteToManager",
	name = "PromoteToManager",
	category = "combat_midnight",
	subcategory = "c_housingneighborhood",
	func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["PromoteToManager"],
	funcPath = "C_HousingNeighborhood.PromoteToManager",
	params = { { name = "playerGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingNeighborhood.TransferNeighborhoodOwnership"] = {
	key = "C_HousingNeighborhood.TransferNeighborhoodOwnership",
	name = "TransferNeighborhoodOwnership",
	category = "combat_midnight",
	subcategory = "c_housingneighborhood",
	func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["TransferNeighborhoodOwnership"],
	funcPath = "C_HousingNeighborhood.TransferNeighborhoodOwnership",
	params = { { name = "playerGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingNeighborhood.TryEvictPlayer"] = {
	key = "C_HousingNeighborhood.TryEvictPlayer",
	name = "TryEvictPlayer",
	category = "combat_midnight",
	subcategory = "c_housingneighborhood",
	func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["TryEvictPlayer"],
	funcPath = "C_HousingNeighborhood.TryEvictPlayer",
	params = { { name = "plotID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

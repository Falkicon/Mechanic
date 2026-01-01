-- Generated APIDefinitions for namespace: C_Housing
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Housing.CanTakeReportScreenshot"] = {
	key = "C_Housing.CanTakeReportScreenshot",
	name = "CanTakeReportScreenshot",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["CanTakeReportScreenshot"],
	funcPath = "C_Housing.CanTakeReportScreenshot",
	params = { { name = "plotIndex", type = "number", default = nil } },
	returns = { { name = "reason", type = "InvalidPlotScreenshotReason", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.CreateGuildNeighborhood"] = {
	key = "C_Housing.CreateGuildNeighborhood",
	name = "CreateGuildNeighborhood",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["CreateGuildNeighborhood"],
	funcPath = "C_Housing.CreateGuildNeighborhood",
	params = { { name = "neighborhoodName", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.CreateNeighborhoodCharter"] = {
	key = "C_Housing.CreateNeighborhoodCharter",
	name = "CreateNeighborhoodCharter",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["CreateNeighborhoodCharter"],
	funcPath = "C_Housing.CreateNeighborhoodCharter",
	params = { { name = "neighborhoodName", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.DoesFactionMatchNeighborhood"] = {
	key = "C_Housing.DoesFactionMatchNeighborhood",
	name = "DoesFactionMatchNeighborhood",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["DoesFactionMatchNeighborhood"],
	funcPath = "C_Housing.DoesFactionMatchNeighborhood",
	params = { { name = "neighborhoodGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "factionMatches", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.EditNeighborhoodCharter"] = {
	key = "C_Housing.EditNeighborhoodCharter",
	name = "EditNeighborhoodCharter",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["EditNeighborhoodCharter"],
	funcPath = "C_Housing.EditNeighborhoodCharter",
	params = { { name = "neighborhoodName", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.GetCurrentHouseLevelFavor"] = {
	key = "C_Housing.GetCurrentHouseLevelFavor",
	name = "GetCurrentHouseLevelFavor",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["GetCurrentHouseLevelFavor"],
	funcPath = "C_Housing.GetCurrentHouseLevelFavor",
	params = { { name = "houseGuid", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.GetHouseLevelFavorForLevel"] = {
	key = "C_Housing.GetHouseLevelFavorForLevel",
	name = "GetHouseLevelFavorForLevel",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["GetHouseLevelFavorForLevel"],
	funcPath = "C_Housing.GetHouseLevelFavorForLevel",
	params = {
		{
			name = "level",
			type = "number",
			default = nil,
			examples = { { value = "self.actualLevel + 1", label = "Plumber" } },
		},
	},
	returns = { { name = "houseFavor", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.GetHouseLevelRewardsForLevel"] = {
	key = "C_Housing.GetHouseLevelRewardsForLevel",
	name = "GetHouseLevelRewardsForLevel",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["GetHouseLevelRewardsForLevel"],
	funcPath = "C_Housing.GetHouseLevelRewardsForLevel",
	params = { { name = "level", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.GetNeighborhoodTextureSuffix"] = {
	key = "C_Housing.GetNeighborhoodTextureSuffix",
	name = "GetNeighborhoodTextureSuffix",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["GetNeighborhoodTextureSuffix"],
	funcPath = "C_Housing.GetNeighborhoodTextureSuffix",
	params = { { name = "neighborhoodGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "neighborhoodTextureSuffix", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.GetOthersOwnedHouses"] = {
	key = "C_Housing.GetOthersOwnedHouses",
	name = "GetOthersOwnedHouses",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["GetOthersOwnedHouses"],
	funcPath = "C_Housing.GetOthersOwnedHouses",
	params = {
		{ name = "playerGUID", type = "WOWGUID", default = nil },
		{ name = "bnetID", type = "number", default = nil },
		{ name = "isInPlayersGuild", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.GetUIMapIDForNeighborhood"] = {
	key = "C_Housing.GetUIMapIDForNeighborhood",
	name = "GetUIMapIDForNeighborhood",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["GetUIMapIDForNeighborhood"],
	funcPath = "C_Housing.GetUIMapIDForNeighborhood",
	params = { { name = "neighborhoodGuid", type = "WOWGUID", default = nil } },
	returns = { { name = "uiMapID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.HouseFinderRequestReservationAndPort"] = {
	key = "C_Housing.HouseFinderRequestReservationAndPort",
	name = "HouseFinderRequestReservationAndPort",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["HouseFinderRequestReservationAndPort"],
	funcPath = "C_Housing.HouseFinderRequestReservationAndPort",
	params = {
		{ name = "neighborhoodGuid", type = "WOWGUID", default = nil },
		{ name = "plotID", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.OnSignCharterClicked"] = {
	key = "C_Housing.OnSignCharterClicked",
	name = "OnSignCharterClicked",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["OnSignCharterClicked"],
	funcPath = "C_Housing.OnSignCharterClicked",
	params = { { name = "charterOwnerGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.RelinquishHouse"] = {
	key = "C_Housing.RelinquishHouse",
	name = "RelinquishHouse",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["RelinquishHouse"],
	funcPath = "C_Housing.RelinquishHouse",
	params = { { name = "houseGuid", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.RequestHouseFinderNeighborhoodData"] = {
	key = "C_Housing.RequestHouseFinderNeighborhoodData",
	name = "RequestHouseFinderNeighborhoodData",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["RequestHouseFinderNeighborhoodData"],
	funcPath = "C_Housing.RequestHouseFinderNeighborhoodData",
	params = { { name = "neighborhoodGuid", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.SaveHouseSettings"] = {
	key = "C_Housing.SaveHouseSettings",
	name = "SaveHouseSettings",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["SaveHouseSettings"],
	funcPath = "C_Housing.SaveHouseSettings",
	params = {
		{ name = "playerGUID", type = "WOWGUID", default = nil },
		{ name = "accessFlags", type = "HouseSettingFlags", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.SearchBNetFriendNeighborhoods"] = {
	key = "C_Housing.SearchBNetFriendNeighborhoods",
	name = "SearchBNetFriendNeighborhoods",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["SearchBNetFriendNeighborhoods"],
	funcPath = "C_Housing.SearchBNetFriendNeighborhoods",
	params = { { name = "bnetName", type = "cstring", default = nil } },
	returns = { { name = "isValidBnetFriend", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.SearchBNetFriendNeighborhoodsByID"] = {
	key = "C_Housing.SearchBNetFriendNeighborhoodsByID",
	name = "SearchBNetFriendNeighborhoodsByID",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["SearchBNetFriendNeighborhoodsByID"],
	funcPath = "C_Housing.SearchBNetFriendNeighborhoodsByID",
	params = { { name = "bnetID", type = "number", default = nil } },
	returns = { { name = "isValidBnetFriend", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.SetTrackedHouseGuid"] = {
	key = "C_Housing.SetTrackedHouseGuid",
	name = "SetTrackedHouseGuid",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["SetTrackedHouseGuid"],
	funcPath = "C_Housing.SetTrackedHouseGuid",
	params = { { name = "trackedHouse", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.TeleportHome"] = {
	key = "C_Housing.TeleportHome",
	name = "TeleportHome",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["TeleportHome"],
	funcPath = "C_Housing.TeleportHome",
	params = {
		{ name = "neighborhoodGUID", type = "WOWGUID", default = nil },
		{ name = "houseGUID", type = "WOWGUID", default = nil },
		{ name = "plotID", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.TryRenameNeighborhood"] = {
	key = "C_Housing.TryRenameNeighborhood",
	name = "TryRenameNeighborhood",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["TryRenameNeighborhood"],
	funcPath = "C_Housing.TryRenameNeighborhood",
	params = { { name = "neighborhoodName", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.ValidateNeighborhoodName"] = {
	key = "C_Housing.ValidateNeighborhoodName",
	name = "ValidateNeighborhoodName",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["ValidateNeighborhoodName"],
	funcPath = "C_Housing.ValidateNeighborhoodName",
	params = { { name = "neighborhoodName", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.VisitHouse"] = {
	key = "C_Housing.VisitHouse",
	name = "VisitHouse",
	category = "combat_midnight",
	subcategory = "c_housing",
	func = _G["C_Housing"] and _G["C_Housing"]["VisitHouse"],
	funcPath = "C_Housing.VisitHouse",
	params = {
		{ name = "neighborhoodGUID", type = "WOWGUID", default = nil },
		{ name = "houseGUID", type = "WOWGUID", default = nil },
		{ name = "plotID", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_Housing
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Housing.AcceptNeighborhoodOwnership"] = {
    key = "C_Housing.AcceptNeighborhoodOwnership",
    name = "AcceptNeighborhoodOwnership",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.AcceptNeighborhoodOwnership",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.CanEditCharter"] = {
    key = "C_Housing.CanEditCharter",
    name = "CanEditCharter",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.CanEditCharter",
    params = {  },
    returns = { { name = "canEditCharter", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.CanTakeReportScreenshot"] = {
    key = "C_Housing.CanTakeReportScreenshot",
    name = "CanTakeReportScreenshot",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.CanTakeReportScreenshot",
    params = { { name = "plotIndex", type = "number", default = nil } },
    returns = { { name = "reason", type = "InvalidPlotScreenshotReason", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.CreateGuildNeighborhood"] = {
    key = "C_Housing.CreateGuildNeighborhood",
    name = "CreateGuildNeighborhood",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.CreateGuildNeighborhood",
    params = { { name = "neighborhoodName", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.CreateNeighborhoodCharter"] = {
    key = "C_Housing.CreateNeighborhoodCharter",
    name = "CreateNeighborhoodCharter",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.CreateNeighborhoodCharter",
    params = { { name = "neighborhoodName", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.DeclineNeighborhoodOwnership"] = {
    key = "C_Housing.DeclineNeighborhoodOwnership",
    name = "DeclineNeighborhoodOwnership",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.DeclineNeighborhoodOwnership",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.DoesFactionMatchNeighborhood"] = {
    key = "C_Housing.DoesFactionMatchNeighborhood",
    name = "DoesFactionMatchNeighborhood",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.DoesFactionMatchNeighborhood",
    params = { { name = "neighborhoodGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "factionMatches", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.EditNeighborhoodCharter"] = {
    key = "C_Housing.EditNeighborhoodCharter",
    name = "EditNeighborhoodCharter",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.EditNeighborhoodCharter",
    params = { { name = "neighborhoodName", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.GetCurrentHouseInfo"] = {
    key = "C_Housing.GetCurrentHouseInfo",
    name = "GetCurrentHouseInfo",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.GetCurrentHouseInfo",
    params = {  },
    returns = { { name = "houseInfo", type = "HouseInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.GetCurrentHouseLevelFavor"] = {
    key = "C_Housing.GetCurrentHouseLevelFavor",
    name = "GetCurrentHouseLevelFavor",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.GetCurrentHouseLevelFavor",
    params = { { name = "houseGuid", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.GetCurrentHouseRefundAmount"] = {
    key = "C_Housing.GetCurrentHouseRefundAmount",
    name = "GetCurrentHouseRefundAmount",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.GetCurrentHouseRefundAmount",
    params = {  },
    returns = { { name = "refundAmount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.GetCurrentNeighborhoodGUID"] = {
    key = "C_Housing.GetCurrentNeighborhoodGUID",
    name = "GetCurrentNeighborhoodGUID",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.GetCurrentNeighborhoodGUID",
    params = {  },
    returns = { { name = "neighborhoodGUID", type = "WOWGUID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.GetHouseLevelFavorForLevel"] = {
    key = "C_Housing.GetHouseLevelFavorForLevel",
    name = "GetHouseLevelFavorForLevel",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.GetHouseLevelFavorForLevel",
    params = { { name = "level", type = "number", default = nil } },
    returns = { { name = "houseFavor", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.GetHouseLevelRewardsForLevel"] = {
    key = "C_Housing.GetHouseLevelRewardsForLevel",
    name = "GetHouseLevelRewardsForLevel",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.GetHouseLevelRewardsForLevel",
    params = { { name = "level", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.GetHousingAccessFlags"] = {
    key = "C_Housing.GetHousingAccessFlags",
    name = "GetHousingAccessFlags",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.GetHousingAccessFlags",
    params = {  },
    returns = { { name = "accessFlags", type = "HouseSettingFlags", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.GetMaxHouseLevel"] = {
    key = "C_Housing.GetMaxHouseLevel",
    name = "GetMaxHouseLevel",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.GetMaxHouseLevel",
    params = {  },
    returns = { { name = "level", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.GetNeighborhoodTextureSuffix"] = {
    key = "C_Housing.GetNeighborhoodTextureSuffix",
    name = "GetNeighborhoodTextureSuffix",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.GetNeighborhoodTextureSuffix",
    params = { { name = "neighborhoodGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "neighborhoodTextureSuffix", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.GetOthersOwnedHouses"] = {
    key = "C_Housing.GetOthersOwnedHouses",
    name = "GetOthersOwnedHouses",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.GetOthersOwnedHouses",
    params = { { name = "playerGUID", type = "WOWGUID", default = nil }, { name = "bnetID", type = "number", default = nil }, { name = "isInPlayersGuild", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.GetPlayerOwnedHouses"] = {
    key = "C_Housing.GetPlayerOwnedHouses",
    name = "GetPlayerOwnedHouses",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.GetPlayerOwnedHouses",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.GetTrackedHouseGuid"] = {
    key = "C_Housing.GetTrackedHouseGuid",
    name = "GetTrackedHouseGuid",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.GetTrackedHouseGuid",
    params = {  },
    returns = { { name = "trackedHouse", type = "WOWGUID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.GetUIMapIDForNeighborhood"] = {
    key = "C_Housing.GetUIMapIDForNeighborhood",
    name = "GetUIMapIDForNeighborhood",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.GetUIMapIDForNeighborhood",
    params = { { name = "neighborhoodGuid", type = "WOWGUID", default = nil } },
    returns = { { name = "uiMapID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.GetVisitCooldownInfo"] = {
    key = "C_Housing.GetVisitCooldownInfo",
    name = "GetVisitCooldownInfo",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.GetVisitCooldownInfo",
    params = {  },
    returns = { { name = "spellCooldownInfo", type = "SpellCooldownInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.HasHousingExpansionAccess"] = {
    key = "C_Housing.HasHousingExpansionAccess",
    name = "HasHousingExpansionAccess",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.HasHousingExpansionAccess",
    params = {  },
    returns = { { name = "hasAccess", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.HouseFinderDeclineNeighborhoodInvitation"] = {
    key = "C_Housing.HouseFinderDeclineNeighborhoodInvitation",
    name = "HouseFinderDeclineNeighborhoodInvitation",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.HouseFinderDeclineNeighborhoodInvitation",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.HouseFinderRequestNeighborhoods"] = {
    key = "C_Housing.HouseFinderRequestNeighborhoods",
    name = "HouseFinderRequestNeighborhoods",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.HouseFinderRequestNeighborhoods",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.HouseFinderRequestReservationAndPort"] = {
    key = "C_Housing.HouseFinderRequestReservationAndPort",
    name = "HouseFinderRequestReservationAndPort",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.HouseFinderRequestReservationAndPort",
    params = { { name = "neighborhoodGuid", type = "WOWGUID", default = nil }, { name = "plotID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.IsHousingMarketEnabled"] = {
    key = "C_Housing.IsHousingMarketEnabled",
    name = "IsHousingMarketEnabled",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.IsHousingMarketEnabled",
    params = {  },
    returns = { { name = "isHousingMarketEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.IsHousingMarketShopEnabled"] = {
    key = "C_Housing.IsHousingMarketShopEnabled",
    name = "IsHousingMarketShopEnabled",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.IsHousingMarketShopEnabled",
    params = {  },
    returns = { { name = "isHousingMarketShopEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.IsHousingServiceEnabled"] = {
    key = "C_Housing.IsHousingServiceEnabled",
    name = "IsHousingServiceEnabled",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.IsHousingServiceEnabled",
    params = {  },
    returns = { { name = "isAvailable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.IsInsideHouse"] = {
    key = "C_Housing.IsInsideHouse",
    name = "IsInsideHouse",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.IsInsideHouse",
    params = {  },
    returns = { { name = "isInside", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.IsInsideHouseOrPlot"] = {
    key = "C_Housing.IsInsideHouseOrPlot",
    name = "IsInsideHouseOrPlot",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.IsInsideHouseOrPlot",
    params = {  },
    returns = { { name = "isInside", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.IsInsideOwnHouse"] = {
    key = "C_Housing.IsInsideOwnHouse",
    name = "IsInsideOwnHouse",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.IsInsideOwnHouse",
    params = {  },
    returns = { { name = "isInsideOwnHouse", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.IsInsidePlot"] = {
    key = "C_Housing.IsInsidePlot",
    name = "IsInsidePlot",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.IsInsidePlot",
    params = {  },
    returns = { { name = "isInside", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.IsOnNeighborhoodMap"] = {
    key = "C_Housing.IsOnNeighborhoodMap",
    name = "IsOnNeighborhoodMap",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.IsOnNeighborhoodMap",
    params = {  },
    returns = { { name = "isOnNeighborhoodMap", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.LeaveHouse"] = {
    key = "C_Housing.LeaveHouse",
    name = "LeaveHouse",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.LeaveHouse",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.OnCharterConfirmationAccepted"] = {
    key = "C_Housing.OnCharterConfirmationAccepted",
    name = "OnCharterConfirmationAccepted",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.OnCharterConfirmationAccepted",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.OnCharterConfirmationClosed"] = {
    key = "C_Housing.OnCharterConfirmationClosed",
    name = "OnCharterConfirmationClosed",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.OnCharterConfirmationClosed",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.OnCreateCharterNeighborhoodClosed"] = {
    key = "C_Housing.OnCreateCharterNeighborhoodClosed",
    name = "OnCreateCharterNeighborhoodClosed",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.OnCreateCharterNeighborhoodClosed",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.OnCreateGuildNeighborhoodClosed"] = {
    key = "C_Housing.OnCreateGuildNeighborhoodClosed",
    name = "OnCreateGuildNeighborhoodClosed",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.OnCreateGuildNeighborhoodClosed",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.OnRequestSignatureClicked"] = {
    key = "C_Housing.OnRequestSignatureClicked",
    name = "OnRequestSignatureClicked",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.OnRequestSignatureClicked",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.OnSignCharterClicked"] = {
    key = "C_Housing.OnSignCharterClicked",
    name = "OnSignCharterClicked",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.OnSignCharterClicked",
    params = { { name = "charterOwnerGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.RelinquishHouse"] = {
    key = "C_Housing.RelinquishHouse",
    name = "RelinquishHouse",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.RelinquishHouse",
    params = { { name = "houseGuid", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.RequestCurrentHouseInfo"] = {
    key = "C_Housing.RequestCurrentHouseInfo",
    name = "RequestCurrentHouseInfo",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.RequestCurrentHouseInfo",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.RequestHouseFinderNeighborhoodData"] = {
    key = "C_Housing.RequestHouseFinderNeighborhoodData",
    name = "RequestHouseFinderNeighborhoodData",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.RequestHouseFinderNeighborhoodData",
    params = { { name = "neighborhoodGuid", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.RequestPlayerCharacterList"] = {
    key = "C_Housing.RequestPlayerCharacterList",
    name = "RequestPlayerCharacterList",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.RequestPlayerCharacterList",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.ReturnAfterVisitingHouse"] = {
    key = "C_Housing.ReturnAfterVisitingHouse",
    name = "ReturnAfterVisitingHouse",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.ReturnAfterVisitingHouse",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.SaveHouseSettings"] = {
    key = "C_Housing.SaveHouseSettings",
    name = "SaveHouseSettings",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.SaveHouseSettings",
    params = { { name = "playerGUID", type = "WOWGUID", default = nil }, { name = "accessFlags", type = "HouseSettingFlags", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.SearchBNetFriendNeighborhoods"] = {
    key = "C_Housing.SearchBNetFriendNeighborhoods",
    name = "SearchBNetFriendNeighborhoods",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.SearchBNetFriendNeighborhoods",
    params = { { name = "bnetName", type = "cstring", default = nil } },
    returns = { { name = "isValidBnetFriend", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.SearchBNetFriendNeighborhoodsByID"] = {
    key = "C_Housing.SearchBNetFriendNeighborhoodsByID",
    name = "SearchBNetFriendNeighborhoodsByID",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.SearchBNetFriendNeighborhoodsByID",
    params = { { name = "bnetID", type = "number", default = nil } },
    returns = { { name = "isValidBnetFriend", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.SetTrackedHouseGuid"] = {
    key = "C_Housing.SetTrackedHouseGuid",
    name = "SetTrackedHouseGuid",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.SetTrackedHouseGuid",
    params = { { name = "trackedHouse", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.StartTutorial"] = {
    key = "C_Housing.StartTutorial",
    name = "StartTutorial",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.StartTutorial",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.TeleportHome"] = {
    key = "C_Housing.TeleportHome",
    name = "TeleportHome",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.TeleportHome",
    params = { { name = "neighborhoodGUID", type = "WOWGUID", default = nil }, { name = "houseGUID", type = "WOWGUID", default = nil }, { name = "plotID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.TryRenameNeighborhood"] = {
    key = "C_Housing.TryRenameNeighborhood",
    name = "TryRenameNeighborhood",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.TryRenameNeighborhood",
    params = { { name = "neighborhoodName", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.ValidateCreateGuildNeighborhoodSize"] = {
    key = "C_Housing.ValidateCreateGuildNeighborhoodSize",
    name = "ValidateCreateGuildNeighborhoodSize",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.ValidateCreateGuildNeighborhoodSize",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Housing.ValidateNeighborhoodName"] = {
    key = "C_Housing.ValidateNeighborhoodName",
    name = "ValidateNeighborhoodName",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.ValidateNeighborhoodName",
    params = { { name = "neighborhoodName", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Housing.VisitHouse"] = {
    key = "C_Housing.VisitHouse",
    name = "VisitHouse",
    category = "general",
    subcategory = "c_housing",
    funcPath = "C_Housing.VisitHouse",
    params = { { name = "neighborhoodGUID", type = "WOWGUID", default = nil }, { name = "houseGUID", type = "WOWGUID", default = nil }, { name = "plotID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

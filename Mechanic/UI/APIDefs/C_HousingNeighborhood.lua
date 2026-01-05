-- Generated APIDefinitions for namespace: C_HousingNeighborhood
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HousingNeighborhood.CanReturnAfterVisitingHouse"] = {
    key = "C_HousingNeighborhood.CanReturnAfterVisitingHouse",
    name = "CanReturnAfterVisitingHouse",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["CanReturnAfterVisitingHouse"],
    funcPath = "C_HousingNeighborhood.CanReturnAfterVisitingHouse",
    params = {  },
    returns = { { name = "canReturn", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.CancelInviteToNeighborhood"] = {
    key = "C_HousingNeighborhood.CancelInviteToNeighborhood",
    name = "CancelInviteToNeighborhood",
    category = "combat_midnight",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["CancelInviteToNeighborhood"],
    funcPath = "C_HousingNeighborhood.CancelInviteToNeighborhood",
    params = { { name = "playerName", type = "cstring", default = nil } },
    returns = {  },
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
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingNeighborhood.GetCornerstoneHouseInfo"] = {
    key = "C_HousingNeighborhood.GetCornerstoneHouseInfo",
    name = "GetCornerstoneHouseInfo",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["GetCornerstoneHouseInfo"],
    funcPath = "C_HousingNeighborhood.GetCornerstoneHouseInfo",
    params = {  },
    returns = { { name = "houseInfo", type = "HouseInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.GetCornerstoneNeighborhoodInfo"] = {
    key = "C_HousingNeighborhood.GetCornerstoneNeighborhoodInfo",
    name = "GetCornerstoneNeighborhoodInfo",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["GetCornerstoneNeighborhoodInfo"],
    funcPath = "C_HousingNeighborhood.GetCornerstoneNeighborhoodInfo",
    params = {  },
    returns = { { name = "neighborhoodInfo", type = "NeighborhoodInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.GetCornerstonePurchaseMode"] = {
    key = "C_HousingNeighborhood.GetCornerstonePurchaseMode",
    name = "GetCornerstonePurchaseMode",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["GetCornerstonePurchaseMode"],
    funcPath = "C_HousingNeighborhood.GetCornerstonePurchaseMode",
    params = {  },
    returns = { { name = "purchaseMode", type = "CornerstonePurchaseMode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.GetCurrentNeighborhoodTextureSuffix"] = {
    key = "C_HousingNeighborhood.GetCurrentNeighborhoodTextureSuffix",
    name = "GetCurrentNeighborhoodTextureSuffix",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["GetCurrentNeighborhoodTextureSuffix"],
    funcPath = "C_HousingNeighborhood.GetCurrentNeighborhoodTextureSuffix",
    params = {  },
    returns = { { name = "neighborhoodTextureSuffix", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.GetDiscountedMovePrice"] = {
    key = "C_HousingNeighborhood.GetDiscountedMovePrice",
    name = "GetDiscountedMovePrice",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["GetDiscountedMovePrice"],
    funcPath = "C_HousingNeighborhood.GetDiscountedMovePrice",
    params = {  },
    returns = { { name = "movePrice", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.GetMoveCooldownTime"] = {
    key = "C_HousingNeighborhood.GetMoveCooldownTime",
    name = "GetMoveCooldownTime",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["GetMoveCooldownTime"],
    funcPath = "C_HousingNeighborhood.GetMoveCooldownTime",
    params = {  },
    returns = { { name = "movecooldownTime", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.GetNeighborhoodMapData"] = {
    key = "C_HousingNeighborhood.GetNeighborhoodMapData",
    name = "GetNeighborhoodMapData",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["GetNeighborhoodMapData"],
    funcPath = "C_HousingNeighborhood.GetNeighborhoodMapData",
    params = {  },
    returns = { { name = "neighborhoodPlots", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.GetNeighborhoodName"] = {
    key = "C_HousingNeighborhood.GetNeighborhoodName",
    name = "GetNeighborhoodName",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["GetNeighborhoodName"],
    funcPath = "C_HousingNeighborhood.GetNeighborhoodName",
    params = {  },
    returns = { { name = "neighborhoodName", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["C_HousingNeighborhood.GetPreviousHouseIdentifier"] = {
    key = "C_HousingNeighborhood.GetPreviousHouseIdentifier",
    name = "GetPreviousHouseIdentifier",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["GetPreviousHouseIdentifier"],
    funcPath = "C_HousingNeighborhood.GetPreviousHouseIdentifier",
    params = {  },
    returns = { { name = "previousHouseIdentifier", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.HasPermissionToPurchase"] = {
    key = "C_HousingNeighborhood.HasPermissionToPurchase",
    name = "HasPermissionToPurchase",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["HasPermissionToPurchase"],
    funcPath = "C_HousingNeighborhood.HasPermissionToPurchase",
    params = {  },
    returns = { { name = "cantPurchaseReason", type = "PurchaseHouseDisabledReason", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.InvitePlayerToNeighborhood"] = {
    key = "C_HousingNeighborhood.InvitePlayerToNeighborhood",
    name = "InvitePlayerToNeighborhood",
    category = "combat_midnight",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["InvitePlayerToNeighborhood"],
    funcPath = "C_HousingNeighborhood.InvitePlayerToNeighborhood",
    params = { { name = "playerName", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingNeighborhood.IsNeighborhoodManager"] = {
    key = "C_HousingNeighborhood.IsNeighborhoodManager",
    name = "IsNeighborhoodManager",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["IsNeighborhoodManager"],
    funcPath = "C_HousingNeighborhood.IsNeighborhoodManager",
    params = {  },
    returns = { { name = "isManager", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.IsNeighborhoodOwner"] = {
    key = "C_HousingNeighborhood.IsNeighborhoodOwner",
    name = "IsNeighborhoodOwner",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["IsNeighborhoodOwner"],
    funcPath = "C_HousingNeighborhood.IsNeighborhoodOwner",
    params = {  },
    returns = { { name = "isOwner", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.IsPlayerInOtherPlayersPlot"] = {
    key = "C_HousingNeighborhood.IsPlayerInOtherPlayersPlot",
    name = "IsPlayerInOtherPlayersPlot",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["IsPlayerInOtherPlayersPlot"],
    funcPath = "C_HousingNeighborhood.IsPlayerInOtherPlayersPlot",
    params = {  },
    returns = { { name = "isInUnownedPlot", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.IsPlotAvailableForPurchase"] = {
    key = "C_HousingNeighborhood.IsPlotAvailableForPurchase",
    name = "IsPlotAvailableForPurchase",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["IsPlotAvailableForPurchase"],
    funcPath = "C_HousingNeighborhood.IsPlotAvailableForPurchase",
    params = {  },
    returns = { { name = "isAvailable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.IsPlotOwnedByPlayer"] = {
    key = "C_HousingNeighborhood.IsPlotOwnedByPlayer",
    name = "IsPlotOwnedByPlayer",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["IsPlotOwnedByPlayer"],
    funcPath = "C_HousingNeighborhood.IsPlotOwnedByPlayer",
    params = {  },
    returns = { { name = "isPlayerOwned", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.OnBulletinBoardClosed"] = {
    key = "C_HousingNeighborhood.OnBulletinBoardClosed",
    name = "OnBulletinBoardClosed",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["OnBulletinBoardClosed"],
    funcPath = "C_HousingNeighborhood.OnBulletinBoardClosed",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.PromoteToManager"] = {
    key = "C_HousingNeighborhood.PromoteToManager",
    name = "PromoteToManager",
    category = "combat_midnight",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["PromoteToManager"],
    funcPath = "C_HousingNeighborhood.PromoteToManager",
    params = { { name = "playerGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingNeighborhood.RequestNeighborhoodInfo"] = {
    key = "C_HousingNeighborhood.RequestNeighborhoodInfo",
    name = "RequestNeighborhoodInfo",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["RequestNeighborhoodInfo"],
    funcPath = "C_HousingNeighborhood.RequestNeighborhoodInfo",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.RequestNeighborhoodRoster"] = {
    key = "C_HousingNeighborhood.RequestNeighborhoodRoster",
    name = "RequestNeighborhoodRoster",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["RequestNeighborhoodRoster"],
    funcPath = "C_HousingNeighborhood.RequestNeighborhoodRoster",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.RequestPendingNeighborhoodInvites"] = {
    key = "C_HousingNeighborhood.RequestPendingNeighborhoodInvites",
    name = "RequestPendingNeighborhoodInvites",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["RequestPendingNeighborhoodInvites"],
    funcPath = "C_HousingNeighborhood.RequestPendingNeighborhoodInvites",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.TransferNeighborhoodOwnership"] = {
    key = "C_HousingNeighborhood.TransferNeighborhoodOwnership",
    name = "TransferNeighborhoodOwnership",
    category = "combat_midnight",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["TransferNeighborhoodOwnership"],
    funcPath = "C_HousingNeighborhood.TransferNeighborhoodOwnership",
    params = { { name = "playerGUID", type = "WOWGUID", default = nil } },
    returns = {  },
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
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingNeighborhood.TryMoveHouse"] = {
    key = "C_HousingNeighborhood.TryMoveHouse",
    name = "TryMoveHouse",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["TryMoveHouse"],
    funcPath = "C_HousingNeighborhood.TryMoveHouse",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingNeighborhood.TryPurchasePlot"] = {
    key = "C_HousingNeighborhood.TryPurchasePlot",
    name = "TryPurchasePlot",
    category = "general",
    subcategory = "c_housingneighborhood",
    func = _G["C_HousingNeighborhood"] and _G["C_HousingNeighborhood"]["TryPurchasePlot"],
    funcPath = "C_HousingNeighborhood.TryPurchasePlot",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

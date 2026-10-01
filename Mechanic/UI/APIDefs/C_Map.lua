-- Generated APIDefinitions for namespace: C_Map
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Map.CanSetUserWaypointOnMap"] = {
    key = "C_Map.CanSetUserWaypointOnMap",
    name = "CanSetUserWaypointOnMap",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.CanSetUserWaypointOnMap",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "canSet", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.ClearUserWaypoint"] = {
    key = "C_Map.ClearUserWaypoint",
    name = "ClearUserWaypoint",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.ClearUserWaypoint",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Map.CloseWorldMapInteraction"] = {
    key = "C_Map.CloseWorldMapInteraction",
    name = "CloseWorldMapInteraction",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.CloseWorldMapInteraction",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_Map.GetAreaInfo"] = {
    key = "C_Map.GetAreaInfo",
    name = "GetAreaInfo",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetAreaInfo",
    params = { { name = "areaID", type = "number", default = nil } },
    returns = { { name = "name", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetBestMapForUnit"] = {
    key = "C_Map.GetBestMapForUnit",
    name = "GetBestMapForUnit",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetBestMapForUnit",
    params = { { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "uiMapID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetBountySetMaps"] = {
    key = "C_Map.GetBountySetMaps",
    name = "GetBountySetMaps",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetBountySetMaps",
    params = { { name = "bountySetID", type = "number", default = nil } },
    returns = { { name = "mapIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetFallbackWorldMapID"] = {
    key = "C_Map.GetFallbackWorldMapID",
    name = "GetFallbackWorldMapID",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetFallbackWorldMapID",
    params = {  },
    returns = { { name = "uiMapID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Map.GetMapArtBackgroundAtlas"] = {
    key = "C_Map.GetMapArtBackgroundAtlas",
    name = "GetMapArtBackgroundAtlas",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapArtBackgroundAtlas",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "atlasName", type = "textureAtlas", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapArtHelpTextPosition"] = {
    key = "C_Map.GetMapArtHelpTextPosition",
    name = "GetMapArtHelpTextPosition",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapArtHelpTextPosition",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "position", type = "MapCanvasPosition", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapArtID"] = {
    key = "C_Map.GetMapArtID",
    name = "GetMapArtID",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapArtID",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "uiMapArtID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapArtLayerTextures"] = {
    key = "C_Map.GetMapArtLayerTextures",
    name = "GetMapArtLayerTextures",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapArtLayerTextures",
    params = { { name = "uiMapID", type = "number", default = nil }, { name = "layerIndex", type = "luaIndex", default = nil } },
    returns = { { name = "textures", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapArtLayers"] = {
    key = "C_Map.GetMapArtLayers",
    name = "GetMapArtLayers",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapArtLayers",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "layerInfo", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapArtZoneTextPosition"] = {
    key = "C_Map.GetMapArtZoneTextPosition",
    name = "GetMapArtZoneTextPosition",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapArtZoneTextPosition",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "position", type = "MapCanvasPosition", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapBannersForMap"] = {
    key = "C_Map.GetMapBannersForMap",
    name = "GetMapBannersForMap",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapBannersForMap",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "mapBanners", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapChildrenInfo"] = {
    key = "C_Map.GetMapChildrenInfo",
    name = "GetMapChildrenInfo",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapChildrenInfo",
    params = { { name = "uiMapID", type = "number", default = nil }, { name = "mapType", type = "UIMapType", default = nil }, { name = "allDescendants", type = "bool", default = nil } },
    returns = { { name = "info", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapDisplayInfo"] = {
    key = "C_Map.GetMapDisplayInfo",
    name = "GetMapDisplayInfo",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapDisplayInfo",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "hideIcons", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapGroupID"] = {
    key = "C_Map.GetMapGroupID",
    name = "GetMapGroupID",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapGroupID",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "uiMapGroupID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapGroupMembersInfo"] = {
    key = "C_Map.GetMapGroupMembersInfo",
    name = "GetMapGroupMembersInfo",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapGroupMembersInfo",
    params = { { name = "uiMapGroupID", type = "number", default = nil } },
    returns = { { name = "info", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapHighlightInfoAtPosition"] = {
    key = "C_Map.GetMapHighlightInfoAtPosition",
    name = "GetMapHighlightInfoAtPosition",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapHighlightInfoAtPosition",
    params = { { name = "uiMapID", type = "number", default = nil }, { name = "x", type = "number", default = nil }, { name = "y", type = "number", default = nil } },
    returns = { { name = "fileDataID", type = "fileID", canBeSecret = false }, { name = "atlasID", type = "textureAtlas", canBeSecret = false }, { name = "texturePercentageX", type = "number", canBeSecret = false }, { name = "texturePercentageY", type = "number", canBeSecret = false }, { name = "textureX", type = "number", canBeSecret = false }, { name = "textureY", type = "number", canBeSecret = false }, { name = "scrollChildX", type = "number", canBeSecret = false }, { name = "scrollChildY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapHighlightPulseInfo"] = {
    key = "C_Map.GetMapHighlightPulseInfo",
    name = "GetMapHighlightPulseInfo",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapHighlightPulseInfo",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "fileDataID", type = "fileID", canBeSecret = false }, { name = "atlasID", type = "textureAtlas", canBeSecret = false }, { name = "texturePercentageX", type = "number", canBeSecret = false }, { name = "texturePercentageY", type = "number", canBeSecret = false }, { name = "textureX", type = "number", canBeSecret = false }, { name = "textureY", type = "number", canBeSecret = false }, { name = "scrollChildX", type = "number", canBeSecret = false }, { name = "scrollChildY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapInfo"] = {
    key = "C_Map.GetMapInfo",
    name = "GetMapInfo",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapInfo",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "info", type = "UiMapDetails", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapInfoAtPosition"] = {
    key = "C_Map.GetMapInfoAtPosition",
    name = "GetMapInfoAtPosition",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapInfoAtPosition",
    params = { { name = "uiMapID", type = "number", default = nil }, { name = "x", type = "number", default = nil }, { name = "y", type = "number", default = nil }, { name = "ignoreZoneMapPositionData", type = "bool", default = nil } },
    returns = { { name = "info", type = "UiMapDetails", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapLevels"] = {
    key = "C_Map.GetMapLevels",
    name = "GetMapLevels",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapLevels",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "playerMinLevel", type = "number", canBeSecret = false }, { name = "playerMaxLevel", type = "number", canBeSecret = false }, { name = "petMinLevel", type = "number", canBeSecret = false }, { name = "petMaxLevel", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapLinksForMap"] = {
    key = "C_Map.GetMapLinksForMap",
    name = "GetMapLinksForMap",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapLinksForMap",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "mapLinks", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapPosFromWorldPos"] = {
    key = "C_Map.GetMapPosFromWorldPos",
    name = "GetMapPosFromWorldPos",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapPosFromWorldPos",
    params = { { name = "continentID", type = "number", default = nil }, { name = "worldPosition", type = "vector2", default = nil }, { name = "overrideUiMapID", type = "number", default = nil } },
    returns = { { name = "uiMapID", type = "number", canBeSecret = false }, { name = "mapPosition", type = "vector2", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapRectOnMap"] = {
    key = "C_Map.GetMapRectOnMap",
    name = "GetMapRectOnMap",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapRectOnMap",
    params = { { name = "uiMapID", type = "number", default = nil }, { name = "topUiMapID", type = "number", default = nil } },
    returns = { { name = "minX", type = "number", canBeSecret = false }, { name = "maxX", type = "number", canBeSecret = false }, { name = "minY", type = "number", canBeSecret = false }, { name = "maxY", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapWorldSize"] = {
    key = "C_Map.GetMapWorldSize",
    name = "GetMapWorldSize",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetMapWorldSize",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "width", type = "number", canBeSecret = false }, { name = "height", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetPlayerMapPosition"] = {
    key = "C_Map.GetPlayerMapPosition",
    name = "GetPlayerMapPosition",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetPlayerMapPosition",
    params = { { name = "uiMapID", type = "number", default = nil }, { name = "unitToken", type = "UnitToken", default = "player" } },
    returns = { { name = "position", type = "vector2", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetUserWaypoint"] = {
    key = "C_Map.GetUserWaypoint",
    name = "GetUserWaypoint",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetUserWaypoint",
    params = {  },
    returns = { { name = "point", type = "UiMapPoint", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Map.GetUserWaypointFromHyperlink"] = {
    key = "C_Map.GetUserWaypointFromHyperlink",
    name = "GetUserWaypointFromHyperlink",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetUserWaypointFromHyperlink",
    params = { { name = "hyperlink", type = "string", default = nil } },
    returns = { { name = "point", type = "UiMapPoint", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetUserWaypointHyperlink"] = {
    key = "C_Map.GetUserWaypointHyperlink",
    name = "GetUserWaypointHyperlink",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetUserWaypointHyperlink",
    params = {  },
    returns = { { name = "hyperlink", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Map.GetUserWaypointPositionForMap"] = {
    key = "C_Map.GetUserWaypointPositionForMap",
    name = "GetUserWaypointPositionForMap",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetUserWaypointPositionForMap",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "mapPosition", type = "vector2", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetWorldPosFromMapPos"] = {
    key = "C_Map.GetWorldPosFromMapPos",
    name = "GetWorldPosFromMapPos",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.GetWorldPosFromMapPos",
    params = { { name = "uiMapID", type = "number", default = nil }, { name = "mapPosition", type = "vector2", default = nil } },
    returns = { { name = "continentID", type = "number", canBeSecret = false }, { name = "worldPosition", type = "vector2", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.HasUserWaypoint"] = {
    key = "C_Map.HasUserWaypoint",
    name = "HasUserWaypoint",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.HasUserWaypoint",
    params = {  },
    returns = { { name = "hasUserWaypoint", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_Map.IsCityMap"] = {
    key = "C_Map.IsCityMap",
    name = "IsCityMap",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.IsCityMap",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "isCityMap", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.IsMapValidForNavBarDropdown"] = {
    key = "C_Map.IsMapValidForNavBarDropdown",
    name = "IsMapValidForNavBarDropdown",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.IsMapValidForNavBarDropdown",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "isValid", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.MapHasArt"] = {
    key = "C_Map.MapHasArt",
    name = "MapHasArt",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.MapHasArt",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "hasArt", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.OpenWorldMap"] = {
    key = "C_Map.OpenWorldMap",
    name = "OpenWorldMap",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.OpenWorldMap",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.RequestPreloadMap"] = {
    key = "C_Map.RequestPreloadMap",
    name = "RequestPreloadMap",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.RequestPreloadMap",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.SetUserWaypoint"] = {
    key = "C_Map.SetUserWaypoint",
    name = "SetUserWaypoint",
    category = "map",
    subcategory = "c_map",
    funcPath = "C_Map.SetUserWaypoint",
    params = { { name = "point", type = "UiMapPoint", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

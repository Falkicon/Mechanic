-- Generated APIDefinitions for namespace: C_Map
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Map.CanSetUserWaypointOnMap"] = {
	key = "C_Map.CanSetUserWaypointOnMap",
	name = "CanSetUserWaypointOnMap",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["CanSetUserWaypointOnMap"],
	funcPath = "C_Map.CanSetUserWaypointOnMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "canSet", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetAreaInfo"] = {
	key = "C_Map.GetAreaInfo",
	name = "GetAreaInfo",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetAreaInfo"],
	funcPath = "C_Map.GetAreaInfo",
	params = {
		{
			name = "areaID",
			type = "number",
			default = nil,
			examples = {
				{ value = "id", label = "WeakAuras" },
				{ value = 4892, label = "AllTheThings" },
				{ value = 7932, label = "AllTheThings" },
			},
		},
	},
	returns = { { name = "name", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetBestMapForUnit"] = {
	key = "C_Map.GetBestMapForUnit",
	name = "GetBestMapForUnit",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetBestMapForUnit"],
	funcPath = "C_Map.GetBestMapForUnit",
	params = {
		{
			name = "unitToken",
			type = "UnitToken",
			default = "player",
			examples = { { value = "player", label = "WeakAuras" }, { value = "unit", label = "Narcissus" } },
		},
	},
	returns = { { name = "uiMapID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetBountySetMaps"] = {
	key = "C_Map.GetBountySetMaps",
	name = "GetBountySetMaps",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetBountySetMaps"],
	funcPath = "C_Map.GetBountySetMaps",
	params = { { name = "bountySetID", type = "number", default = nil } },
	returns = { { name = "mapIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapArtBackgroundAtlas"] = {
	key = "C_Map.GetMapArtBackgroundAtlas",
	name = "GetMapArtBackgroundAtlas",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapArtBackgroundAtlas"],
	funcPath = "C_Map.GetMapArtBackgroundAtlas",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "atlasName", type = "textureAtlas", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapArtHelpTextPosition"] = {
	key = "C_Map.GetMapArtHelpTextPosition",
	name = "GetMapArtHelpTextPosition",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapArtHelpTextPosition"],
	funcPath = "C_Map.GetMapArtHelpTextPosition",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "position", type = "MapCanvasPosition", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapArtID"] = {
	key = "C_Map.GetMapArtID",
	name = "GetMapArtID",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapArtID"],
	funcPath = "C_Map.GetMapArtID",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "uiMapArtID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapArtLayerTextures"] = {
	key = "C_Map.GetMapArtLayerTextures",
	name = "GetMapArtLayerTextures",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapArtLayerTextures"],
	funcPath = "C_Map.GetMapArtLayerTextures",
	params = {
		{
			name = "uiMapID",
			type = "number",
			default = nil,
			examples = { { value = "background", label = "MRT" }, { value = "mapID", label = "Narcissus" } },
		},
		{ name = "layerIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "textures", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapArtLayers"] = {
	key = "C_Map.GetMapArtLayers",
	name = "GetMapArtLayers",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapArtLayers"],
	funcPath = "C_Map.GetMapArtLayers",
	params = {
		{ name = "uiMapID", type = "number", default = nil, examples = { { value = "arg1", label = "Leatrix_Maps" } } },
	},
	returns = { { name = "layerInfo", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapArtZoneTextPosition"] = {
	key = "C_Map.GetMapArtZoneTextPosition",
	name = "GetMapArtZoneTextPosition",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapArtZoneTextPosition"],
	funcPath = "C_Map.GetMapArtZoneTextPosition",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "position", type = "MapCanvasPosition", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapBannersForMap"] = {
	key = "C_Map.GetMapBannersForMap",
	name = "GetMapBannersForMap",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapBannersForMap"],
	funcPath = "C_Map.GetMapBannersForMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "mapBanners", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapChildrenInfo"] = {
	key = "C_Map.GetMapChildrenInfo",
	name = "GetMapChildrenInfo",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapChildrenInfo"],
	funcPath = "C_Map.GetMapChildrenInfo",
	params = {
		{ name = "uiMapID", type = "number", default = nil, examples = { { value = "id", label = "WeakAuras" } } },
		{ name = "mapType", type = "UIMapType", default = nil },
		{ name = "allDescendants", type = "bool", default = nil },
	},
	returns = { { name = "info", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapDisplayInfo"] = {
	key = "C_Map.GetMapDisplayInfo",
	name = "GetMapDisplayInfo",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapDisplayInfo"],
	funcPath = "C_Map.GetMapDisplayInfo",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "hideIcons", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapGroupID"] = {
	key = "C_Map.GetMapGroupID",
	name = "GetMapGroupID",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapGroupID"],
	funcPath = "C_Map.GetMapGroupID",
	params = {
		{ name = "uiMapID", type = "number", default = nil, examples = { { value = "id", label = "TomTom" } } },
	},
	returns = { { name = "uiMapGroupID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapGroupMembersInfo"] = {
	key = "C_Map.GetMapGroupMembersInfo",
	name = "GetMapGroupMembersInfo",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapGroupMembersInfo"],
	funcPath = "C_Map.GetMapGroupMembersInfo",
	params = {
		{
			name = "uiMapGroupID",
			type = "number",
			default = nil,
			examples = { { value = "tonumber(id)", label = "WeakAuras" } },
		},
	},
	returns = { { name = "info", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapHighlightInfoAtPosition"] = {
	key = "C_Map.GetMapHighlightInfoAtPosition",
	name = "GetMapHighlightInfoAtPosition",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapHighlightInfoAtPosition"],
	funcPath = "C_Map.GetMapHighlightInfoAtPosition",
	params = {
		{ name = "uiMapID", type = "number", default = nil },
		{ name = "x", type = "number", default = nil },
		{ name = "y", type = "number", default = nil },
	},
	returns = {
		{ name = "fileDataID", type = "fileID", canBeSecret = false },
		{ name = "atlasID", type = "textureAtlas", canBeSecret = false },
		{ name = "texturePercentageX", type = "number", canBeSecret = false },
		{ name = "texturePercentageY", type = "number", canBeSecret = false },
		{ name = "textureX", type = "number", canBeSecret = false },
		{ name = "textureY", type = "number", canBeSecret = false },
		{ name = "scrollChildX", type = "number", canBeSecret = false },
		{ name = "scrollChildY", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapHighlightPulseInfo"] = {
	key = "C_Map.GetMapHighlightPulseInfo",
	name = "GetMapHighlightPulseInfo",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapHighlightPulseInfo"],
	funcPath = "C_Map.GetMapHighlightPulseInfo",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = {
		{ name = "fileDataID", type = "fileID", canBeSecret = false },
		{ name = "atlasID", type = "textureAtlas", canBeSecret = false },
		{ name = "texturePercentageX", type = "number", canBeSecret = false },
		{ name = "texturePercentageY", type = "number", canBeSecret = false },
		{ name = "textureX", type = "number", canBeSecret = false },
		{ name = "textureY", type = "number", canBeSecret = false },
		{ name = "scrollChildX", type = "number", canBeSecret = false },
		{ name = "scrollChildY", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapInfo"] = {
	key = "C_Map.GetMapInfo",
	name = "GetMapInfo",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapInfo"],
	funcPath = "C_Map.GetMapInfo",
	params = {
		{
			name = "uiMapID",
			type = "number",
			default = nil,
			examples = {
				{ value = "tonumber(firstMapId:sub(2)) or 0", label = "DBM-Core" },
				{ value = "tonumber(name:sub(2)) or 0", label = "DBM-Core" },
				{ value = "arg1", label = "Leatrix_Maps" },
			},
		},
	},
	returns = { { name = "info", type = "UiMapDetails", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapInfoAtPosition"] = {
	key = "C_Map.GetMapInfoAtPosition",
	name = "GetMapInfoAtPosition",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapInfoAtPosition"],
	funcPath = "C_Map.GetMapInfoAtPosition",
	params = {
		{
			name = "uiMapID",
			type = "number",
			default = nil,
			examples = { { value = 109, label = "Narcissus_Barbershop" } },
		},
		{ name = "x", type = "number", default = nil },
		{ name = "y", type = "number", default = nil },
		{ name = "ignoreZoneMapPositionData", type = "bool", default = nil },
	},
	returns = { { name = "info", type = "UiMapDetails", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapLevels"] = {
	key = "C_Map.GetMapLevels",
	name = "GetMapLevels",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapLevels"],
	funcPath = "C_Map.GetMapLevels",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = {
		{ name = "playerMinLevel", type = "number", canBeSecret = false },
		{ name = "playerMaxLevel", type = "number", canBeSecret = false },
		{ name = "petMinLevel", type = "number", canBeSecret = false },
		{ name = "petMaxLevel", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapLinksForMap"] = {
	key = "C_Map.GetMapLinksForMap",
	name = "GetMapLinksForMap",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapLinksForMap"],
	funcPath = "C_Map.GetMapLinksForMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "mapLinks", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapPosFromWorldPos"] = {
	key = "C_Map.GetMapPosFromWorldPos",
	name = "GetMapPosFromWorldPos",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapPosFromWorldPos"],
	funcPath = "C_Map.GetMapPosFromWorldPos",
	params = {
		{ name = "continentID", type = "number", default = nil },
		{ name = "worldPosition", type = "vector2", default = nil },
		{ name = "overrideUiMapID", type = "number", default = nil },
	},
	returns = {
		{ name = "uiMapID", type = "number", canBeSecret = false },
		{ name = "mapPosition", type = "vector2", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapRectOnMap"] = {
	key = "C_Map.GetMapRectOnMap",
	name = "GetMapRectOnMap",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapRectOnMap"],
	funcPath = "C_Map.GetMapRectOnMap",
	params = {
		{ name = "uiMapID", type = "number", default = nil, examples = { { value = "id", label = "TomTom" } } },
		{ name = "topUiMapID", type = "number", default = nil },
	},
	returns = {
		{ name = "minX", type = "number", canBeSecret = false },
		{ name = "maxX", type = "number", canBeSecret = false },
		{ name = "minY", type = "number", canBeSecret = false },
		{ name = "maxY", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetMapWorldSize"] = {
	key = "C_Map.GetMapWorldSize",
	name = "GetMapWorldSize",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetMapWorldSize"],
	funcPath = "C_Map.GetMapWorldSize",
	params = {
		{ name = "uiMapID", type = "number", default = nil, examples = { { value = "id", label = "TomTom" } } },
	},
	returns = {
		{ name = "width", type = "number", canBeSecret = false },
		{ name = "height", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetPlayerMapPosition"] = {
	key = "C_Map.GetPlayerMapPosition",
	name = "GetPlayerMapPosition",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetPlayerMapPosition"],
	funcPath = "C_Map.GetPlayerMapPosition",
	params = {
		{
			name = "uiMapID",
			type = "number",
			default = nil,
			examples = {
				{ value = "mapID", label = "Weekly" },
				{ value = "id", label = "AllTheThings" },
				{ value = "ATTC.RealMapID", label = "AllTheThings" },
			},
		},
		{ name = "unitToken", type = "UnitToken", default = "player" },
	},
	returns = { { name = "position", type = "vector2", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetUserWaypointFromHyperlink"] = {
	key = "C_Map.GetUserWaypointFromHyperlink",
	name = "GetUserWaypointFromHyperlink",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetUserWaypointFromHyperlink"],
	funcPath = "C_Map.GetUserWaypointFromHyperlink",
	params = { { name = "hyperlink", type = "string", default = nil } },
	returns = { { name = "point", type = "UiMapPoint", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetUserWaypointPositionForMap"] = {
	key = "C_Map.GetUserWaypointPositionForMap",
	name = "GetUserWaypointPositionForMap",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetUserWaypointPositionForMap"],
	funcPath = "C_Map.GetUserWaypointPositionForMap",
	params = {
		{ name = "uiMapID", type = "number", default = nil, examples = { { value = 12, label = "Narcissus" } } },
	},
	returns = { { name = "mapPosition", type = "vector2", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.GetWorldPosFromMapPos"] = {
	key = "C_Map.GetWorldPosFromMapPos",
	name = "GetWorldPosFromMapPos",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["GetWorldPosFromMapPos"],
	funcPath = "C_Map.GetWorldPosFromMapPos",
	params = {
		{
			name = "uiMapID",
			type = "number",
			default = nil,
			examples = {
				{ value = [=[tonumber(customAreaID) or C_Map.GetBestMapForUnit("player") or 0]=], label = "DBM-Core" },
				{ value = [=[tonumber(AreaID) or C_Map.GetBestMapForUnit("player") or 0]=], label = "DBM-Core" },
				{ value = "mapID", label = "Leatrix_Plus" },
			},
		},
		{ name = "mapPosition", type = "vector2", default = nil },
	},
	returns = {
		{ name = "continentID", type = "number", canBeSecret = false },
		{ name = "worldPosition", type = "vector2", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.IsCityMap"] = {
	key = "C_Map.IsCityMap",
	name = "IsCityMap",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["IsCityMap"],
	funcPath = "C_Map.IsCityMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "isCityMap", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.IsMapValidForNavBarDropdown"] = {
	key = "C_Map.IsMapValidForNavBarDropdown",
	name = "IsMapValidForNavBarDropdown",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["IsMapValidForNavBarDropdown"],
	funcPath = "C_Map.IsMapValidForNavBarDropdown",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "isValid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.MapHasArt"] = {
	key = "C_Map.MapHasArt",
	name = "MapHasArt",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["MapHasArt"],
	funcPath = "C_Map.MapHasArt",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = { { name = "hasArt", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.OpenWorldMap"] = {
	key = "C_Map.OpenWorldMap",
	name = "OpenWorldMap",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["OpenWorldMap"],
	funcPath = "C_Map.OpenWorldMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.RequestPreloadMap"] = {
	key = "C_Map.RequestPreloadMap",
	name = "RequestPreloadMap",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["RequestPreloadMap"],
	funcPath = "C_Map.RequestPreloadMap",
	params = { { name = "uiMapID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Map.SetUserWaypoint"] = {
	key = "C_Map.SetUserWaypoint",
	name = "SetUserWaypoint",
	category = "combat_midnight",
	subcategory = "c_map",
	func = _G["C_Map"] and _G["C_Map"]["SetUserWaypoint"],
	funcPath = "C_Map.SetUserWaypoint",
	params = {
		{
			name = "point",
			type = "UiMapPoint",
			default = nil,
			examples = { { value = "UiMapPoint.CreateFromVector2D(1525", label = "Leatrix_Plus" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

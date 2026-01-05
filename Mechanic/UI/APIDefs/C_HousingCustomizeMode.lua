-- Generated APIDefinitions for namespace: C_HousingCustomizeMode
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HousingCustomizeMode.ApplyDyeToSelectedDecor"] = {
    key = "C_HousingCustomizeMode.ApplyDyeToSelectedDecor",
    name = "ApplyDyeToSelectedDecor",
    category = "combat_midnight",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["ApplyDyeToSelectedDecor"],
    funcPath = "C_HousingCustomizeMode.ApplyDyeToSelectedDecor",
    params = { { name = "dyeSlotID", type = "number", default = nil }, { name = "dyeColorID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCustomizeMode.ApplyThemeToRoom"] = {
    key = "C_HousingCustomizeMode.ApplyThemeToRoom",
    name = "ApplyThemeToRoom",
    category = "combat_midnight",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["ApplyThemeToRoom"],
    funcPath = "C_HousingCustomizeMode.ApplyThemeToRoom",
    params = { { name = "themeSetID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCustomizeMode.ApplyThemeToSelectedRoomComponent"] = {
    key = "C_HousingCustomizeMode.ApplyThemeToSelectedRoomComponent",
    name = "ApplyThemeToSelectedRoomComponent",
    category = "combat_midnight",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["ApplyThemeToSelectedRoomComponent"],
    funcPath = "C_HousingCustomizeMode.ApplyThemeToSelectedRoomComponent",
    params = { { name = "themeSetID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCustomizeMode.ApplyWallpaperToAllWalls"] = {
    key = "C_HousingCustomizeMode.ApplyWallpaperToAllWalls",
    name = "ApplyWallpaperToAllWalls",
    category = "combat_midnight",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["ApplyWallpaperToAllWalls"],
    funcPath = "C_HousingCustomizeMode.ApplyWallpaperToAllWalls",
    params = { { name = "roomComponentTextureRecID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCustomizeMode.ApplyWallpaperToSelectedRoomComponent"] = {
    key = "C_HousingCustomizeMode.ApplyWallpaperToSelectedRoomComponent",
    name = "ApplyWallpaperToSelectedRoomComponent",
    category = "combat_midnight",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["ApplyWallpaperToSelectedRoomComponent"],
    funcPath = "C_HousingCustomizeMode.ApplyWallpaperToSelectedRoomComponent",
    params = { { name = "roomComponentTextureRecID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCustomizeMode.CancelActiveEditing"] = {
    key = "C_HousingCustomizeMode.CancelActiveEditing",
    name = "CancelActiveEditing",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["CancelActiveEditing"],
    funcPath = "C_HousingCustomizeMode.CancelActiveEditing",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.ClearDyesForSelectedDecor"] = {
    key = "C_HousingCustomizeMode.ClearDyesForSelectedDecor",
    name = "ClearDyesForSelectedDecor",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["ClearDyesForSelectedDecor"],
    funcPath = "C_HousingCustomizeMode.ClearDyesForSelectedDecor",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.ClearTargetRoomComponent"] = {
    key = "C_HousingCustomizeMode.ClearTargetRoomComponent",
    name = "ClearTargetRoomComponent",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["ClearTargetRoomComponent"],
    funcPath = "C_HousingCustomizeMode.ClearTargetRoomComponent",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.CommitDyesForSelectedDecor"] = {
    key = "C_HousingCustomizeMode.CommitDyesForSelectedDecor",
    name = "CommitDyesForSelectedDecor",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["CommitDyesForSelectedDecor"],
    funcPath = "C_HousingCustomizeMode.CommitDyesForSelectedDecor",
    params = {  },
    returns = { { name = "hasChanges", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.GetHoveredDecorInfo"] = {
    key = "C_HousingCustomizeMode.GetHoveredDecorInfo",
    name = "GetHoveredDecorInfo",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["GetHoveredDecorInfo"],
    funcPath = "C_HousingCustomizeMode.GetHoveredDecorInfo",
    params = {  },
    returns = { { name = "info", type = "HousingDecorInstanceInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.GetHoveredRoomComponentInfo"] = {
    key = "C_HousingCustomizeMode.GetHoveredRoomComponentInfo",
    name = "GetHoveredRoomComponentInfo",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["GetHoveredRoomComponentInfo"],
    funcPath = "C_HousingCustomizeMode.GetHoveredRoomComponentInfo",
    params = {  },
    returns = { { name = "info", type = "HousingRoomComponentInstanceInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.GetNumDyesToRemoveOnSelectedDecor"] = {
    key = "C_HousingCustomizeMode.GetNumDyesToRemoveOnSelectedDecor",
    name = "GetNumDyesToRemoveOnSelectedDecor",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["GetNumDyesToRemoveOnSelectedDecor"],
    funcPath = "C_HousingCustomizeMode.GetNumDyesToRemoveOnSelectedDecor",
    params = {  },
    returns = { { name = "numDyesToRemove", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.GetNumDyesToSpendOnSelectedDecor"] = {
    key = "C_HousingCustomizeMode.GetNumDyesToSpendOnSelectedDecor",
    name = "GetNumDyesToSpendOnSelectedDecor",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["GetNumDyesToSpendOnSelectedDecor"],
    funcPath = "C_HousingCustomizeMode.GetNumDyesToSpendOnSelectedDecor",
    params = {  },
    returns = { { name = "numDyesToSpend", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.GetPreviewDyesOnSelectedDecor"] = {
    key = "C_HousingCustomizeMode.GetPreviewDyesOnSelectedDecor",
    name = "GetPreviewDyesOnSelectedDecor",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["GetPreviewDyesOnSelectedDecor"],
    funcPath = "C_HousingCustomizeMode.GetPreviewDyesOnSelectedDecor",
    params = {  },
    returns = { { name = "previewDyes", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.GetRecentlyUsedDyes"] = {
    key = "C_HousingCustomizeMode.GetRecentlyUsedDyes",
    name = "GetRecentlyUsedDyes",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["GetRecentlyUsedDyes"],
    funcPath = "C_HousingCustomizeMode.GetRecentlyUsedDyes",
    params = {  },
    returns = { { name = "recentDyes", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.GetRecentlyUsedThemeSets"] = {
    key = "C_HousingCustomizeMode.GetRecentlyUsedThemeSets",
    name = "GetRecentlyUsedThemeSets",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["GetRecentlyUsedThemeSets"],
    funcPath = "C_HousingCustomizeMode.GetRecentlyUsedThemeSets",
    params = {  },
    returns = { { name = "recentThemeSets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.GetRecentlyUsedWallpapers"] = {
    key = "C_HousingCustomizeMode.GetRecentlyUsedWallpapers",
    name = "GetRecentlyUsedWallpapers",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["GetRecentlyUsedWallpapers"],
    funcPath = "C_HousingCustomizeMode.GetRecentlyUsedWallpapers",
    params = {  },
    returns = { { name = "recentWallpapers", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.GetSelectedDecorInfo"] = {
    key = "C_HousingCustomizeMode.GetSelectedDecorInfo",
    name = "GetSelectedDecorInfo",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["GetSelectedDecorInfo"],
    funcPath = "C_HousingCustomizeMode.GetSelectedDecorInfo",
    params = {  },
    returns = { { name = "info", type = "HousingDecorInstanceInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.GetSelectedRoomComponentInfo"] = {
    key = "C_HousingCustomizeMode.GetSelectedRoomComponentInfo",
    name = "GetSelectedRoomComponentInfo",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["GetSelectedRoomComponentInfo"],
    funcPath = "C_HousingCustomizeMode.GetSelectedRoomComponentInfo",
    params = {  },
    returns = { { name = "info", type = "HousingRoomComponentInstanceInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.GetThemeSetInfo"] = {
    key = "C_HousingCustomizeMode.GetThemeSetInfo",
    name = "GetThemeSetInfo",
    category = "combat_midnight",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["GetThemeSetInfo"],
    funcPath = "C_HousingCustomizeMode.GetThemeSetInfo",
    params = { { name = "themeSetID", type = "number", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCustomizeMode.GetWallpapersForRoomComponentType"] = {
    key = "C_HousingCustomizeMode.GetWallpapersForRoomComponentType",
    name = "GetWallpapersForRoomComponentType",
    category = "combat_midnight",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["GetWallpapersForRoomComponentType"],
    funcPath = "C_HousingCustomizeMode.GetWallpapersForRoomComponentType",
    params = { { name = "type", type = "HousingRoomComponentType", default = nil } },
    returns = { { name = "availableWallpapers", type = "table", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCustomizeMode.IsDecorSelected"] = {
    key = "C_HousingCustomizeMode.IsDecorSelected",
    name = "IsDecorSelected",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["IsDecorSelected"],
    funcPath = "C_HousingCustomizeMode.IsDecorSelected",
    params = {  },
    returns = { { name = "hasSelectedDecor", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.IsHouseExteriorDoorHovered"] = {
    key = "C_HousingCustomizeMode.IsHouseExteriorDoorHovered",
    name = "IsHouseExteriorDoorHovered",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["IsHouseExteriorDoorHovered"],
    funcPath = "C_HousingCustomizeMode.IsHouseExteriorDoorHovered",
    params = {  },
    returns = { { name = "isHouseExteriorDoorHovered", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.IsHoveringDecor"] = {
    key = "C_HousingCustomizeMode.IsHoveringDecor",
    name = "IsHoveringDecor",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["IsHoveringDecor"],
    funcPath = "C_HousingCustomizeMode.IsHoveringDecor",
    params = {  },
    returns = { { name = "isHoveringDecor", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.IsHoveringRoomComponent"] = {
    key = "C_HousingCustomizeMode.IsHoveringRoomComponent",
    name = "IsHoveringRoomComponent",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["IsHoveringRoomComponent"],
    funcPath = "C_HousingCustomizeMode.IsHoveringRoomComponent",
    params = {  },
    returns = { { name = "isHovering", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.IsRoomComponentSelected"] = {
    key = "C_HousingCustomizeMode.IsRoomComponentSelected",
    name = "IsRoomComponentSelected",
    category = "general",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["IsRoomComponentSelected"],
    funcPath = "C_HousingCustomizeMode.IsRoomComponentSelected",
    params = {  },
    returns = { { name = "hasSelectedComponent", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingCustomizeMode.RoomComponentSupportsVariant"] = {
    key = "C_HousingCustomizeMode.RoomComponentSupportsVariant",
    name = "RoomComponentSupportsVariant",
    category = "combat_midnight",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["RoomComponentSupportsVariant"],
    funcPath = "C_HousingCustomizeMode.RoomComponentSupportsVariant",
    params = { { name = "componentID", type = "number", default = nil }, { name = "variant", type = "number", default = nil } },
    returns = { { name = "variantSupported", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCustomizeMode.SetRoomComponentCeilingType"] = {
    key = "C_HousingCustomizeMode.SetRoomComponentCeilingType",
    name = "SetRoomComponentCeilingType",
    category = "combat_midnight",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["SetRoomComponentCeilingType"],
    funcPath = "C_HousingCustomizeMode.SetRoomComponentCeilingType",
    params = { { name = "roomGUID", type = "WOWGUID", default = nil }, { name = "componentID", type = "number", default = nil }, { name = "ceilingType", type = "HousingRoomComponentCeilingType", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingCustomizeMode.SetRoomComponentDoorType"] = {
    key = "C_HousingCustomizeMode.SetRoomComponentDoorType",
    name = "SetRoomComponentDoorType",
    category = "combat_midnight",
    subcategory = "c_housingcustomizemode",
    func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["SetRoomComponentDoorType"],
    funcPath = "C_HousingCustomizeMode.SetRoomComponentDoorType",
    params = { { name = "roomGUID", type = "WOWGUID", default = nil }, { name = "componentID", type = "number", default = nil }, { name = "newDoortype", type = "HousingRoomComponentDoorType", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

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
	params = {
		{ name = "dyeSlotID", type = "number", default = nil, examples = { { value = "v.ID", label = "Plumber" } } },
		{ name = "dyeColorID", type = "number", default = nil },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["C_HousingCustomizeMode.RoomComponentSupportsVariant"] = {
	key = "C_HousingCustomizeMode.RoomComponentSupportsVariant",
	name = "RoomComponentSupportsVariant",
	category = "combat_midnight",
	subcategory = "c_housingcustomizemode",
	func = _G["C_HousingCustomizeMode"] and _G["C_HousingCustomizeMode"]["RoomComponentSupportsVariant"],
	funcPath = "C_HousingCustomizeMode.RoomComponentSupportsVariant",
	params = {
		{ name = "componentID", type = "number", default = nil },
		{ name = "variant", type = "number", default = nil },
	},
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
	params = {
		{ name = "roomGUID", type = "WOWGUID", default = nil },
		{ name = "componentID", type = "number", default = nil },
		{ name = "ceilingType", type = "HousingRoomComponentCeilingType", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "roomGUID", type = "WOWGUID", default = nil },
		{ name = "componentID", type = "number", default = nil },
		{ name = "newDoortype", type = "HousingRoomComponentDoorType", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

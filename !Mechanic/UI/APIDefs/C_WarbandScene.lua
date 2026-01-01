-- Generated APIDefinitions for namespace: C_WarbandScene
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_WarbandScene.GetWarbandSceneEntry"] = {
	key = "C_WarbandScene.GetWarbandSceneEntry",
	name = "GetWarbandSceneEntry",
	category = "combat_midnight",
	subcategory = "c_warbandscene",
	func = _G["C_WarbandScene"] and _G["C_WarbandScene"]["GetWarbandSceneEntry"],
	funcPath = "C_WarbandScene.GetWarbandSceneEntry",
	params = { { name = "warbandSceneID", type = "number", default = nil } },
	returns = { { name = "warbandSceneEntry", type = "WarbandSceneEntry", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WarbandScene.HasWarbandScene"] = {
	key = "C_WarbandScene.HasWarbandScene",
	name = "HasWarbandScene",
	category = "combat_midnight",
	subcategory = "c_warbandscene",
	func = _G["C_WarbandScene"] and _G["C_WarbandScene"]["HasWarbandScene"],
	funcPath = "C_WarbandScene.HasWarbandScene",
	params = { { name = "warbandSceneID", type = "number", default = nil } },
	returns = { { name = "owned", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WarbandScene.IsFavorite"] = {
	key = "C_WarbandScene.IsFavorite",
	name = "IsFavorite",
	category = "combat_midnight",
	subcategory = "c_warbandscene",
	func = _G["C_WarbandScene"] and _G["C_WarbandScene"]["IsFavorite"],
	funcPath = "C_WarbandScene.IsFavorite",
	params = {
		{
			name = "warbandSceneID",
			type = "number",
			default = nil,
			examples = { { value = "id", label = "!Mechanic" } },
		},
	},
	returns = { { name = "favorite", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WarbandScene.SearchWarbandSceneEntries"] = {
	key = "C_WarbandScene.SearchWarbandSceneEntries",
	name = "SearchWarbandSceneEntries",
	category = "combat_midnight",
	subcategory = "c_warbandscene",
	func = _G["C_WarbandScene"] and _G["C_WarbandScene"]["SearchWarbandSceneEntries"],
	funcPath = "C_WarbandScene.SearchWarbandSceneEntries",
	params = { { name = "searchParams", type = "WarbandSceneSearchInfo", default = nil } },
	returns = { { name = "matchingEntryIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_WarbandScene.SetFavorite"] = {
	key = "C_WarbandScene.SetFavorite",
	name = "SetFavorite",
	category = "combat_midnight",
	subcategory = "c_warbandscene",
	func = _G["C_WarbandScene"] and _G["C_WarbandScene"]["SetFavorite"],
	funcPath = "C_WarbandScene.SetFavorite",
	params = {
		{
			name = "warbandSceneID",
			type = "number",
			default = nil,
			examples = { { value = "NarciAnimationInfo.IsFavorite(id)", label = "Narcissus" } },
		},
		{ name = "favorite", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

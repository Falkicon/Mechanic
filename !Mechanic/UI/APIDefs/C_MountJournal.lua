-- Generated APIDefinitions for namespace: C_MountJournal
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_MountJournal.ApplyMountEquipment"] = {
	key = "C_MountJournal.ApplyMountEquipment",
	name = "ApplyMountEquipment",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["ApplyMountEquipment"],
	funcPath = "C_MountJournal.ApplyMountEquipment",
	params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
	returns = { { name = "canContinue", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.ClearFanfare"] = {
	key = "C_MountJournal.ClearFanfare",
	name = "ClearFanfare",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["ClearFanfare"],
	funcPath = "C_MountJournal.ClearFanfare",
	params = { { name = "mountID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.GetAllCreatureDisplayIDsForMountID"] = {
	key = "C_MountJournal.GetAllCreatureDisplayIDsForMountID",
	name = "GetAllCreatureDisplayIDsForMountID",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["GetAllCreatureDisplayIDsForMountID"],
	funcPath = "C_MountJournal.GetAllCreatureDisplayIDsForMountID",
	params = { { name = "mountID", type = "number", default = nil } },
	returns = { { name = "creatureDisplayIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.GetCollectedFilterSetting"] = {
	key = "C_MountJournal.GetCollectedFilterSetting",
	name = "GetCollectedFilterSetting",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["GetCollectedFilterSetting"],
	funcPath = "C_MountJournal.GetCollectedFilterSetting",
	params = { { name = "filterIndex", type = "luaIndex", default = nil } },
	returns = { { name = "isChecked", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.GetDisplayedMountAllCreatureDisplayInfo"] = {
	key = "C_MountJournal.GetDisplayedMountAllCreatureDisplayInfo",
	name = "GetDisplayedMountAllCreatureDisplayInfo",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["GetDisplayedMountAllCreatureDisplayInfo"],
	funcPath = "C_MountJournal.GetDisplayedMountAllCreatureDisplayInfo",
	params = { { name = "mountIndex", type = "luaIndex", default = nil } },
	returns = { { name = "allDisplayInfo", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.GetDisplayedMountID"] = {
	key = "C_MountJournal.GetDisplayedMountID",
	name = "GetDisplayedMountID",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["GetDisplayedMountID"],
	funcPath = "C_MountJournal.GetDisplayedMountID",
	params = { { name = "displayIndex", type = "luaIndex", default = nil } },
	returns = { { name = "mountID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.GetDisplayedMountInfo"] = {
	key = "C_MountJournal.GetDisplayedMountInfo",
	name = "GetDisplayedMountInfo",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["GetDisplayedMountInfo"],
	funcPath = "C_MountJournal.GetDisplayedMountInfo",
	params = { { name = "displayIndex", type = "luaIndex", default = nil } },
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "spellID", type = "number", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
		{ name = "isActive", type = "bool", canBeSecret = false },
		{ name = "isUsable", type = "bool", canBeSecret = false },
		{ name = "sourceType", type = "number", canBeSecret = false },
		{ name = "isFavorite", type = "bool", canBeSecret = false },
		{ name = "isFactionSpecific", type = "bool", canBeSecret = false },
		{ name = "faction", type = "PvPFaction", canBeSecret = false },
		{ name = "shouldHideOnChar", type = "bool", canBeSecret = false },
		{ name = "isCollected", type = "bool", canBeSecret = false },
		{ name = "mountID", type = "number", canBeSecret = false },
		{ name = "isSteadyFlight", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.GetDisplayedMountInfoExtra"] = {
	key = "C_MountJournal.GetDisplayedMountInfoExtra",
	name = "GetDisplayedMountInfoExtra",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["GetDisplayedMountInfoExtra"],
	funcPath = "C_MountJournal.GetDisplayedMountInfoExtra",
	params = { { name = "mountIndex", type = "luaIndex", default = nil } },
	returns = {
		{ name = "creatureDisplayInfoID", type = "number", canBeSecret = false },
		{ name = "description", type = "cstring", canBeSecret = false },
		{ name = "source", type = "cstring", canBeSecret = false },
		{ name = "isSelfMount", type = "bool", canBeSecret = false },
		{ name = "mountTypeID", type = "number", canBeSecret = false },
		{ name = "uiModelSceneID", type = "number", canBeSecret = false },
		{ name = "animID", type = "number", canBeSecret = false },
		{ name = "spellVisualKitID", type = "number", canBeSecret = false },
		{ name = "disablePlayerMountPreview", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.GetIsFavorite"] = {
	key = "C_MountJournal.GetIsFavorite",
	name = "GetIsFavorite",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["GetIsFavorite"],
	funcPath = "C_MountJournal.GetIsFavorite",
	params = { { name = "mountIndex", type = "luaIndex", default = nil } },
	returns = {
		{ name = "isFavorite", type = "bool", canBeSecret = false },
		{ name = "canSetFavorite", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.GetMountAllCreatureDisplayInfoByID"] = {
	key = "C_MountJournal.GetMountAllCreatureDisplayInfoByID",
	name = "GetMountAllCreatureDisplayInfoByID",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["GetMountAllCreatureDisplayInfoByID"],
	funcPath = "C_MountJournal.GetMountAllCreatureDisplayInfoByID",
	params = { { name = "mountID", type = "number", default = nil } },
	returns = { { name = "allDisplayInfo", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.GetMountFromItem"] = {
	key = "C_MountJournal.GetMountFromItem",
	name = "GetMountFromItem",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["GetMountFromItem"],
	funcPath = "C_MountJournal.GetMountFromItem",
	params = { { name = "itemID", type = "number", default = nil } },
	returns = { { name = "mountID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.GetMountFromSpell"] = {
	key = "C_MountJournal.GetMountFromSpell",
	name = "GetMountFromSpell",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["GetMountFromSpell"],
	funcPath = "C_MountJournal.GetMountFromSpell",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = { { name = "mountID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_MountJournal.GetMountInfoByID"] = {
	key = "C_MountJournal.GetMountInfoByID",
	name = "GetMountInfoByID",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["GetMountInfoByID"],
	funcPath = "C_MountJournal.GetMountInfoByID",
	params = {
		{ name = "mountID", type = "number", default = nil, examples = { { value = "id", label = "Plumber" } } },
	},
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "spellID", type = "number", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
		{ name = "isActive", type = "bool", canBeSecret = false },
		{ name = "isUsable", type = "bool", canBeSecret = false },
		{ name = "sourceType", type = "number", canBeSecret = false },
		{ name = "isFavorite", type = "bool", canBeSecret = false },
		{ name = "isFactionSpecific", type = "bool", canBeSecret = false },
		{ name = "faction", type = "PvPFaction", canBeSecret = false },
		{ name = "shouldHideOnChar", type = "bool", canBeSecret = false },
		{ name = "isCollected", type = "bool", canBeSecret = false },
		{ name = "mountID", type = "number", canBeSecret = false },
		{ name = "isSteadyFlight", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.GetMountInfoExtraByID"] = {
	key = "C_MountJournal.GetMountInfoExtraByID",
	name = "GetMountInfoExtraByID",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["GetMountInfoExtraByID"],
	funcPath = "C_MountJournal.GetMountInfoExtraByID",
	params = {
		{
			name = "mountID",
			type = "number",
			default = nil,
			examples = { { value = 1289, label = "Narcissus" }, { value = 2469, label = "Plumber" } },
		},
	},
	returns = {
		{ name = "creatureDisplayInfoID", type = "number", canBeSecret = false },
		{ name = "description", type = "cstring", canBeSecret = false },
		{ name = "source", type = "cstring", canBeSecret = false },
		{ name = "isSelfMount", type = "bool", canBeSecret = false },
		{ name = "mountTypeID", type = "number", canBeSecret = false },
		{ name = "uiModelSceneID", type = "number", canBeSecret = false },
		{ name = "animID", type = "number", canBeSecret = false },
		{ name = "spellVisualKitID", type = "number", canBeSecret = false },
		{ name = "disablePlayerMountPreview", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.GetMountLink"] = {
	key = "C_MountJournal.GetMountLink",
	name = "GetMountLink",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["GetMountLink"],
	funcPath = "C_MountJournal.GetMountLink",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = { { name = "mountCreatureDisplayInfoLink", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.GetMountUsabilityByID"] = {
	key = "C_MountJournal.GetMountUsabilityByID",
	name = "GetMountUsabilityByID",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["GetMountUsabilityByID"],
	funcPath = "C_MountJournal.GetMountUsabilityByID",
	params = {
		{ name = "mountID", type = "number", default = nil },
		{ name = "checkIndoors", type = "bool", default = nil },
	},
	returns = {
		{ name = "isUsable", type = "bool", canBeSecret = false },
		{ name = "useError", type = "cstring", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.IsItemMountEquipment"] = {
	key = "C_MountJournal.IsItemMountEquipment",
	name = "IsItemMountEquipment",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["IsItemMountEquipment"],
	funcPath = "C_MountJournal.IsItemMountEquipment",
	params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
	returns = { { name = "isMountEquipment", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.IsSourceChecked"] = {
	key = "C_MountJournal.IsSourceChecked",
	name = "IsSourceChecked",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["IsSourceChecked"],
	funcPath = "C_MountJournal.IsSourceChecked",
	params = { { name = "filterIndex", type = "luaIndex", default = nil } },
	returns = { { name = "isChecked", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.IsTypeChecked"] = {
	key = "C_MountJournal.IsTypeChecked",
	name = "IsTypeChecked",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["IsTypeChecked"],
	funcPath = "C_MountJournal.IsTypeChecked",
	params = { { name = "filterIndex", type = "luaIndex", default = nil } },
	returns = { { name = "isChecked", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.IsValidSourceFilter"] = {
	key = "C_MountJournal.IsValidSourceFilter",
	name = "IsValidSourceFilter",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["IsValidSourceFilter"],
	funcPath = "C_MountJournal.IsValidSourceFilter",
	params = { { name = "filterIndex", type = "luaIndex", default = nil } },
	returns = { { name = "isValid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.IsValidTypeFilter"] = {
	key = "C_MountJournal.IsValidTypeFilter",
	name = "IsValidTypeFilter",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["IsValidTypeFilter"],
	funcPath = "C_MountJournal.IsValidTypeFilter",
	params = { { name = "filterIndex", type = "luaIndex", default = nil } },
	returns = { { name = "isValid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.NeedsFanfare"] = {
	key = "C_MountJournal.NeedsFanfare",
	name = "NeedsFanfare",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["NeedsFanfare"],
	funcPath = "C_MountJournal.NeedsFanfare",
	params = { { name = "mountID", type = "number", default = nil } },
	returns = { { name = "needsFanfare", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.Pickup"] = {
	key = "C_MountJournal.Pickup",
	name = "Pickup",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["Pickup"],
	funcPath = "C_MountJournal.Pickup",
	params = {
		{
			name = "displayIndex",
			type = "luaIndex",
			default = nil,
			examples = { { value = "newOption.value", label = "Baganator" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.SetAllSourceFilters"] = {
	key = "C_MountJournal.SetAllSourceFilters",
	name = "SetAllSourceFilters",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["SetAllSourceFilters"],
	funcPath = "C_MountJournal.SetAllSourceFilters",
	params = { { name = "isChecked", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.SetAllTypeFilters"] = {
	key = "C_MountJournal.SetAllTypeFilters",
	name = "SetAllTypeFilters",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["SetAllTypeFilters"],
	funcPath = "C_MountJournal.SetAllTypeFilters",
	params = { { name = "isChecked", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.SetCollectedFilterSetting"] = {
	key = "C_MountJournal.SetCollectedFilterSetting",
	name = "SetCollectedFilterSetting",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["SetCollectedFilterSetting"],
	funcPath = "C_MountJournal.SetCollectedFilterSetting",
	params = {
		{ name = "filterIndex", type = "luaIndex", default = nil },
		{ name = "isChecked", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.SetIsFavorite"] = {
	key = "C_MountJournal.SetIsFavorite",
	name = "SetIsFavorite",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["SetIsFavorite"],
	funcPath = "C_MountJournal.SetIsFavorite",
	params = {
		{ name = "mountIndex", type = "luaIndex", default = nil },
		{ name = "isFavorite", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.SetSearch"] = {
	key = "C_MountJournal.SetSearch",
	name = "SetSearch",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["SetSearch"],
	funcPath = "C_MountJournal.SetSearch",
	params = { { name = "searchValue", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.SetSourceFilter"] = {
	key = "C_MountJournal.SetSourceFilter",
	name = "SetSourceFilter",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["SetSourceFilter"],
	funcPath = "C_MountJournal.SetSourceFilter",
	params = {
		{ name = "filterIndex", type = "luaIndex", default = nil },
		{ name = "isChecked", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.SetTypeFilter"] = {
	key = "C_MountJournal.SetTypeFilter",
	name = "SetTypeFilter",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["SetTypeFilter"],
	funcPath = "C_MountJournal.SetTypeFilter",
	params = {
		{ name = "filterIndex", type = "luaIndex", default = nil },
		{ name = "isChecked", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_MountJournal.SummonByID"] = {
	key = "C_MountJournal.SummonByID",
	name = "SummonByID",
	category = "combat_midnight",
	subcategory = "c_mountjournal",
	func = _G["C_MountJournal"] and _G["C_MountJournal"]["SummonByID"],
	funcPath = "C_MountJournal.SummonByID",
	params = { { name = "mountID", type = "number", default = nil, examples = { { value = 0, label = "Plumber" } } } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

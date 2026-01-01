-- Generated APIDefinitions for namespace: C_ClassTalents
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ClassTalents.CommitConfig"] = {
	key = "C_ClassTalents.CommitConfig",
	name = "CommitConfig",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["CommitConfig"],
	funcPath = "C_ClassTalents.CommitConfig",
	params = { { name = "savedConfigID", type = "number", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.DeleteConfig"] = {
	key = "C_ClassTalents.DeleteConfig",
	name = "DeleteConfig",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["DeleteConfig"],
	funcPath = "C_ClassTalents.DeleteConfig",
	params = { { name = "configID", type = "number", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.GetConfigIDsBySpecID"] = {
	key = "C_ClassTalents.GetConfigIDsBySpecID",
	name = "GetConfigIDsBySpecID",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["GetConfigIDsBySpecID"],
	funcPath = "C_ClassTalents.GetConfigIDsBySpecID",
	params = { { name = "specID", type = "number", default = nil } },
	returns = { { name = "configIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.GetHeroTalentSpecsForClassSpec"] = {
	key = "C_ClassTalents.GetHeroTalentSpecsForClassSpec",
	name = "GetHeroTalentSpecsForClassSpec",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["GetHeroTalentSpecsForClassSpec"],
	funcPath = "C_ClassTalents.GetHeroTalentSpecsForClassSpec",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "classSpecID", type = "number", default = nil },
	},
	returns = {
		{ name = "subTreeIDs", type = "table", canBeSecret = false },
		{ name = "requiredPlayerLevel", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.GetLastSelectedSavedConfigID"] = {
	key = "C_ClassTalents.GetLastSelectedSavedConfigID",
	name = "GetLastSelectedSavedConfigID",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["GetLastSelectedSavedConfigID"],
	funcPath = "C_ClassTalents.GetLastSelectedSavedConfigID",
	params = { { name = "specID", type = "number", default = nil } },
	returns = { { name = "configID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.GetTraitTreeForSpec"] = {
	key = "C_ClassTalents.GetTraitTreeForSpec",
	name = "GetTraitTreeForSpec",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["GetTraitTreeForSpec"],
	funcPath = "C_ClassTalents.GetTraitTreeForSpec",
	params = { { name = "specID", type = "number", default = nil } },
	returns = { { name = "treeID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.ImportLoadout"] = {
	key = "C_ClassTalents.ImportLoadout",
	name = "ImportLoadout",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["ImportLoadout"],
	funcPath = "C_ClassTalents.ImportLoadout",
	params = {
		{
			name = "configID",
			type = "number",
			default = nil,
			examples = { { value = "configID", label = "Leatrix_Plus" } },
		},
		{ name = "entries", type = "table", default = nil },
		{ name = "name", type = "string", default = nil },
		{ name = "importString", type = "string", default = nil },
	},
	returns = {
		{ name = "success", type = "bool", canBeSecret = false },
		{ name = "importError", type = "cstring", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.InitializeViewLoadout"] = {
	key = "C_ClassTalents.InitializeViewLoadout",
	name = "InitializeViewLoadout",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["InitializeViewLoadout"],
	funcPath = "C_ClassTalents.InitializeViewLoadout",
	params = {
		{ name = "specID", type = "number", default = nil, examples = { { value = "specId", label = "WeakAuras" } } },
		{ name = "level", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.IsConfigPopulated"] = {
	key = "C_ClassTalents.IsConfigPopulated",
	name = "IsConfigPopulated",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["IsConfigPopulated"],
	funcPath = "C_ClassTalents.IsConfigPopulated",
	params = { { name = "configID", type = "number", default = nil } },
	returns = { { name = "isPopulated", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.LoadConfig"] = {
	key = "C_ClassTalents.LoadConfig",
	name = "LoadConfig",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["LoadConfig"],
	funcPath = "C_ClassTalents.LoadConfig",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "autoApply", type = "bool", default = nil },
	},
	returns = {
		{ name = "result", type = "LoadConfigResult", canBeSecret = false },
		{ name = "changeError", type = "string", canBeSecret = false },
		{ name = "newLearnedNodeIDs", type = "table", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.RenameConfig"] = {
	key = "C_ClassTalents.RenameConfig",
	name = "RenameConfig",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["RenameConfig"],
	funcPath = "C_ClassTalents.RenameConfig",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "name", type = "string", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.RequestNewConfig"] = {
	key = "C_ClassTalents.RequestNewConfig",
	name = "RequestNewConfig",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["RequestNewConfig"],
	funcPath = "C_ClassTalents.RequestNewConfig",
	params = { { name = "name", type = "string", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.SaveConfig"] = {
	key = "C_ClassTalents.SaveConfig",
	name = "SaveConfig",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["SaveConfig"],
	funcPath = "C_ClassTalents.SaveConfig",
	params = { { name = "configID", type = "number", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.SetStarterBuildActive"] = {
	key = "C_ClassTalents.SetStarterBuildActive",
	name = "SetStarterBuildActive",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["SetStarterBuildActive"],
	funcPath = "C_ClassTalents.SetStarterBuildActive",
	params = { { name = "active", type = "bool", default = nil } },
	returns = { { name = "result", type = "LoadConfigResult", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.SetUsesSharedActionBars"] = {
	key = "C_ClassTalents.SetUsesSharedActionBars",
	name = "SetUsesSharedActionBars",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["SetUsesSharedActionBars"],
	funcPath = "C_ClassTalents.SetUsesSharedActionBars",
	params = {
		{ name = "configID", type = "number", default = nil },
		{ name = "usesShared", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.UpdateLastSelectedSavedConfigID"] = {
	key = "C_ClassTalents.UpdateLastSelectedSavedConfigID",
	name = "UpdateLastSelectedSavedConfigID",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["UpdateLastSelectedSavedConfigID"],
	funcPath = "C_ClassTalents.UpdateLastSelectedSavedConfigID",
	params = {
		{ name = "specID", type = "number", default = nil },
		{ name = "configID", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ClassTalents.ViewLoadout"] = {
	key = "C_ClassTalents.ViewLoadout",
	name = "ViewLoadout",
	category = "combat_midnight",
	subcategory = "c_classtalents",
	func = _G["C_ClassTalents"] and _G["C_ClassTalents"]["ViewLoadout"],
	funcPath = "C_ClassTalents.ViewLoadout",
	params = {
		{ name = "entries", type = "table", default = nil },
		{ name = "importString", type = "string", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

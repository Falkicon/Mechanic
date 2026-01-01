-- Generated APIDefinitions for namespace: C_AddOns
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AddOns.DisableAddOn"] = {
	key = "C_AddOns.DisableAddOn",
	name = "DisableAddOn",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["DisableAddOn"],
	funcPath = "C_AddOns.DisableAddOn",
	params = {
		{
			name = "name",
			type = "uiAddon",
			default = nil,
			examples = {
				{ value = "ZygorGuidesViewer", label = "Leatrix_Plus" },
				{ value = "!Swatter", label = "!BugGrabber" },
				{ value = "name", label = "ACP" },
			},
		},
		{ name = "character", type = "cstring", default = "0" },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.DisableAllAddOns"] = {
	key = "C_AddOns.DisableAllAddOns",
	name = "DisableAllAddOns",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["DisableAllAddOns"],
	funcPath = "C_AddOns.DisableAllAddOns",
	params = {
		{
			name = "character",
			type = "cstring",
			default = nil,
			examples = { { value = [=[UnitGUID("player")]=], label = "ACP" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.DoesAddOnExist"] = {
	key = "C_AddOns.DoesAddOnExist",
	name = "DoesAddOnExist",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["DoesAddOnExist"],
	funcPath = "C_AddOns.DoesAddOnExist",
	params = {
		{
			name = "name",
			type = "uiAddon",
			default = nil,
			examples = {
				{ value = "Syndicator", label = "Baganator" },
				{ value = "DBM-Raids-Vanilla", label = "DBM-Core" },
				{ value = "DBM-Raids-BC", label = "DBM-Core" },
			},
		},
	},
	returns = { { name = "exists", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.DoesAddOnHaveLoadError"] = {
	key = "C_AddOns.DoesAddOnHaveLoadError",
	name = "DoesAddOnHaveLoadError",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["DoesAddOnHaveLoadError"],
	funcPath = "C_AddOns.DoesAddOnHaveLoadError",
	params = { { name = "name", type = "uiAddon", default = nil } },
	returns = { { name = "hadError", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.EnableAddOn"] = {
	key = "C_AddOns.EnableAddOn",
	name = "EnableAddOn",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["EnableAddOn"],
	funcPath = "C_AddOns.EnableAddOn",
	params = {
		{
			name = "name",
			type = "uiAddon",
			default = nil,
			examples = {
				{ value = "WeakAurasCompanion", label = "WeakAuras" },
				{ value = "WeakAurasArchive", label = "WeakAuras" },
				{ value = "Syndicator", label = "Baganator" },
			},
		},
		{ name = "character", type = "cstring", default = "0" },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.EnableAllAddOns"] = {
	key = "C_AddOns.EnableAllAddOns",
	name = "EnableAllAddOns",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["EnableAllAddOns"],
	funcPath = "C_AddOns.EnableAllAddOns",
	params = { { name = "character", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnDependencies"] = {
	key = "C_AddOns.GetAddOnDependencies",
	name = "GetAddOnDependencies",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["GetAddOnDependencies"],
	funcPath = "C_AddOns.GetAddOnDependencies",
	params = { { name = "name", type = "uiAddon", default = nil } },
	returns = { { name = "deps", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnEnableState"] = {
	key = "C_AddOns.GetAddOnEnableState",
	name = "GetAddOnEnableState",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["GetAddOnEnableState"],
	funcPath = "C_AddOns.GetAddOnEnableState",
	params = {
		{
			name = "name",
			type = "uiAddon",
			default = nil,
			examples = {
				{ value = "WeakAurasTemplates", label = "WeakAurasOptions" },
				{ value = "VEM-Core", label = "DBM-Core" },
				{ value = "DBM-Profiles", label = "DBM-Core" },
			},
		},
		{ name = "character", type = "cstring", default = "0" },
	},
	returns = { { name = "state", type = "AddOnEnableState", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnInfo"] = {
	key = "C_AddOns.GetAddOnInfo",
	name = "GetAddOnInfo",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["GetAddOnInfo"],
	funcPath = "C_AddOns.GetAddOnInfo",
	params = {
		{
			name = "name",
			type = "uiAddon",
			default = nil,
			examples = {
				{ value = "GatherMate2_Data", label = "GatherMate2" },
				{ value = "ZygorGuidesViewer", label = "Leatrix_Plus" },
				{ value = "SexyMap", label = "RaidAchievement" },
			},
		},
	},
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "title", type = "cstring", canBeSecret = false },
		{ name = "notes", type = "cstring", canBeSecret = false },
		{ name = "loadable", type = "bool", canBeSecret = false },
		{ name = "reason", type = "cstring", canBeSecret = false },
		{ name = "security", type = "cstring", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnInterfaceVersion"] = {
	key = "C_AddOns.GetAddOnInterfaceVersion",
	name = "GetAddOnInterfaceVersion",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["GetAddOnInterfaceVersion"],
	funcPath = "C_AddOns.GetAddOnInterfaceVersion",
	params = { { name = "name", type = "uiAddon", default = nil } },
	returns = { { name = "interfaceVersion", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnLocalTable"] = {
	key = "C_AddOns.GetAddOnLocalTable",
	name = "GetAddOnLocalTable",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["GetAddOnLocalTable"],
	funcPath = "C_AddOns.GetAddOnLocalTable",
	params = { { name = "name", type = "uiAddon", default = nil } },
	returns = { { name = "table", type = "LuaValueVariant", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnMetadata"] = {
	key = "C_AddOns.GetAddOnMetadata",
	name = "GetAddOnMetadata",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["GetAddOnMetadata"],
	funcPath = "C_AddOns.GetAddOnMetadata",
	params = {
		{
			name = "name",
			type = "uiAddon",
			default = nil,
			examples = {
				{ value = "WeakAuras", label = "WeakAuras" },
				{ value = "WeakAuras", label = "WeakAuras" },
				{ value = "ActionHud", label = "ActionHud" },
			},
		},
		{ name = "variable", type = "cstring", default = nil },
	},
	returns = { { name = "value", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnName"] = {
	key = "C_AddOns.GetAddOnName",
	name = "GetAddOnName",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["GetAddOnName"],
	funcPath = "C_AddOns.GetAddOnName",
	params = { { name = "index", type = "uiAddon", default = nil } },
	returns = { { name = "name", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnNotes"] = {
	key = "C_AddOns.GetAddOnNotes",
	name = "GetAddOnNotes",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["GetAddOnNotes"],
	funcPath = "C_AddOns.GetAddOnNotes",
	params = { { name = "name", type = "uiAddon", default = nil } },
	returns = { { name = "notes", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnOptionalDependencies"] = {
	key = "C_AddOns.GetAddOnOptionalDependencies",
	name = "GetAddOnOptionalDependencies",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["GetAddOnOptionalDependencies"],
	funcPath = "C_AddOns.GetAddOnOptionalDependencies",
	params = { { name = "name", type = "uiAddon", default = nil } },
	returns = { { name = "deps", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnSecurity"] = {
	key = "C_AddOns.GetAddOnSecurity",
	name = "GetAddOnSecurity",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["GetAddOnSecurity"],
	funcPath = "C_AddOns.GetAddOnSecurity",
	params = { { name = "name", type = "uiAddon", default = nil } },
	returns = { { name = "security", type = "AddOnSecurityStatus", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.GetAddOnTitle"] = {
	key = "C_AddOns.GetAddOnTitle",
	name = "GetAddOnTitle",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["GetAddOnTitle"],
	funcPath = "C_AddOns.GetAddOnTitle",
	params = { { name = "name", type = "uiAddon", default = nil } },
	returns = { { name = "title", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.IsAddOnDefaultEnabled"] = {
	key = "C_AddOns.IsAddOnDefaultEnabled",
	name = "IsAddOnDefaultEnabled",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["IsAddOnDefaultEnabled"],
	funcPath = "C_AddOns.IsAddOnDefaultEnabled",
	params = { { name = "name", type = "uiAddon", default = nil } },
	returns = { { name = "defaultEnabled", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.IsAddOnLoadOnDemand"] = {
	key = "C_AddOns.IsAddOnLoadOnDemand",
	name = "IsAddOnLoadOnDemand",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["IsAddOnLoadOnDemand"],
	funcPath = "C_AddOns.IsAddOnLoadOnDemand",
	params = { { name = "name", type = "uiAddon", default = nil } },
	returns = { { name = "loadOnDemand", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.IsAddOnLoadable"] = {
	key = "C_AddOns.IsAddOnLoadable",
	name = "IsAddOnLoadable",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["IsAddOnLoadable"],
	funcPath = "C_AddOns.IsAddOnLoadable",
	params = {
		{ name = "name", type = "uiAddon", default = nil },
		{ name = "character", type = "cstring", default = "0" },
		{ name = "demandLoaded", type = "bool", default = false },
	},
	returns = {
		{ name = "loadable", type = "bool", canBeSecret = false },
		{ name = "reason", type = "cstring", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.IsAddOnLoaded"] = {
	key = "C_AddOns.IsAddOnLoaded",
	name = "IsAddOnLoaded",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["IsAddOnLoaded"],
	funcPath = "C_AddOns.IsAddOnLoaded",
	params = {
		{
			name = "name",
			type = "uiAddon",
			default = nil,
			examples = {
				{ value = "CustomNames", label = "WeakAuras" },
				{ value = "WeakAurasOptions", label = "WeakAuras" },
				{ value = "WeakAurasArchive", label = "WeakAuras" },
			},
		},
	},
	returns = {
		{ name = "loadedOrLoading", type = "bool", canBeSecret = false },
		{ name = "loaded", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.LoadAddOn"] = {
	key = "C_AddOns.LoadAddOn",
	name = "LoadAddOn",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["LoadAddOn"],
	funcPath = "C_AddOns.LoadAddOn",
	params = {
		{
			name = "name",
			type = "uiAddon",
			default = nil,
			examples = {
				{ value = "WeakAurasOptions", label = "WeakAuras" },
				{ value = "WeakAurasArchive", label = "WeakAuras" },
				{ value = "WeakAurasModelPaths", label = "WeakAurasOptions" },
			},
		},
	},
	returns = {
		{ name = "loaded", type = "bool", canBeSecret = false },
		{ name = "value", type = "string", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AddOns.SetAddonVersionCheck"] = {
	key = "C_AddOns.SetAddonVersionCheck",
	name = "SetAddonVersionCheck",
	category = "combat_midnight",
	subcategory = "c_addons",
	func = _G["C_AddOns"] and _G["C_AddOns"]["SetAddonVersionCheck"],
	funcPath = "C_AddOns.SetAddonVersionCheck",
	params = { { name = "enabled", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_NamePlateManager
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_NamePlateManager.GetNamePlateHitTestInsets"] = {
	key = "C_NamePlateManager.GetNamePlateHitTestInsets",
	name = "GetNamePlateHitTestInsets",
	category = "combat_midnight",
	subcategory = "c_nameplatemanager",
	func = _G["C_NamePlateManager"] and _G["C_NamePlateManager"]["GetNamePlateHitTestInsets"],
	funcPath = "C_NamePlateManager.GetNamePlateHitTestInsets",
	params = { { name = "type", type = "NamePlateType", default = nil } },
	returns = {
		{ name = "left", type = "uiUnit", canBeSecret = false },
		{ name = "right", type = "uiUnit", canBeSecret = false },
		{ name = "top", type = "uiUnit", canBeSecret = false },
		{ name = "bottom", type = "uiUnit", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NamePlateManager.IsNamePlateUnitBehindCamera"] = {
	key = "C_NamePlateManager.IsNamePlateUnitBehindCamera",
	name = "IsNamePlateUnitBehindCamera",
	category = "combat_midnight",
	subcategory = "c_nameplatemanager",
	func = _G["C_NamePlateManager"] and _G["C_NamePlateManager"]["IsNamePlateUnitBehindCamera"],
	funcPath = "C_NamePlateManager.IsNamePlateUnitBehindCamera",
	params = { { name = "unitToken", type = "UnitToken", default = "player" } },
	returns = { { name = "isBehindCamera", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NamePlateManager.SetNamePlateHitTestFrame"] = {
	key = "C_NamePlateManager.SetNamePlateHitTestFrame",
	name = "SetNamePlateHitTestFrame",
	category = "combat_midnight",
	subcategory = "c_nameplatemanager",
	func = _G["C_NamePlateManager"] and _G["C_NamePlateManager"]["SetNamePlateHitTestFrame"],
	funcPath = "C_NamePlateManager.SetNamePlateHitTestFrame",
	params = {
		{ name = "unitToken", type = "UnitToken", default = "player" },
		{ name = "hitTestFrame", type = "SimpleFrame", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NamePlateManager.SetNamePlateHitTestInsets"] = {
	key = "C_NamePlateManager.SetNamePlateHitTestInsets",
	name = "SetNamePlateHitTestInsets",
	category = "combat_midnight",
	subcategory = "c_nameplatemanager",
	func = _G["C_NamePlateManager"] and _G["C_NamePlateManager"]["SetNamePlateHitTestInsets"],
	funcPath = "C_NamePlateManager.SetNamePlateHitTestInsets",
	params = {
		{ name = "type", type = "NamePlateType", default = nil },
		{ name = "left", type = "uiUnit", default = nil },
		{ name = "right", type = "uiUnit", default = nil },
		{ name = "top", type = "uiUnit", default = nil },
		{ name = "bottom", type = "uiUnit", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_NamePlateManager.SetNamePlateSimplified"] = {
	key = "C_NamePlateManager.SetNamePlateSimplified",
	name = "SetNamePlateSimplified",
	category = "combat_midnight",
	subcategory = "c_nameplatemanager",
	func = _G["C_NamePlateManager"] and _G["C_NamePlateManager"]["SetNamePlateSimplified"],
	funcPath = "C_NamePlateManager.SetNamePlateSimplified",
	params = {
		{ name = "unitToken", type = "UnitToken", default = "player" },
		{ name = "isSimplified", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

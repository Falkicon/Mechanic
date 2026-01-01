-- Generated APIDefinitions for namespace: C_CVar
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CVar.GetCVar"] = {
	key = "C_CVar.GetCVar",
	name = "GetCVar",
	category = "combat_midnight",
	subcategory = "c_cvar",
	func = _G["C_CVar"] and _G["C_CVar"]["GetCVar"],
	funcPath = "C_CVar.GetCVar",
	params = {
		{
			name = "name",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "Private.soft_target_cvars[unit]", label = "WeakAuras" },
				{ value = "Sound_NumChannels", label = "BigWigs" },
				{ value = "Sound_MaxCacheSizeInBytes", label = "BigWigs" },
			},
		},
	},
	returns = { { name = "value", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_CVar.GetCVarBitfield"] = {
	key = "C_CVar.GetCVarBitfield",
	name = "GetCVarBitfield",
	category = "combat_midnight",
	subcategory = "c_cvar",
	func = _G["C_CVar"] and _G["C_CVar"]["GetCVarBitfield"],
	funcPath = "C_CVar.GetCVarBitfield",
	params = {
		{
			name = "name",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "nameplateStackingTypes", label = "Plater" },
				{ value = "nameplateStackingTypes", label = "Plater" },
			},
		},
		{ name = "index", type = "luaIndex", default = nil },
	},
	returns = { { name = "value", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_CVar.GetCVarBool"] = {
	key = "C_CVar.GetCVarBool",
	name = "GetCVarBool",
	category = "combat_midnight",
	subcategory = "c_cvar",
	func = _G["C_CVar"] and _G["C_CVar"]["GetCVarBool"],
	funcPath = "C_CVar.GetCVarBool",
	params = {
		{
			name = "name",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "useClassicGuildUI", label = "Dominos" },
				{ value = "digSites", label = "GatherMate2" },
				{ value = "combinedBags", label = "Narcissus_BagFilter" },
			},
		},
	},
	returns = { { name = "value", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_CVar.GetCVarDefault"] = {
	key = "C_CVar.GetCVarDefault",
	name = "GetCVarDefault",
	category = "combat_midnight",
	subcategory = "c_cvar",
	func = _G["C_CVar"] and _G["C_CVar"]["GetCVarDefault"],
	funcPath = "C_CVar.GetCVarDefault",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = { { name = "defaultValue", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_CVar.GetCVarInfo"] = {
	key = "C_CVar.GetCVarInfo",
	name = "GetCVarInfo",
	category = "combat_midnight",
	subcategory = "c_cvar",
	func = _G["C_CVar"] and _G["C_CVar"]["GetCVarInfo"],
	funcPath = "C_CVar.GetCVarInfo",
	params = { { name = "name", type = "cstring", default = nil } },
	returns = {
		{ name = "value", type = "cstring", canBeSecret = false },
		{ name = "defaultValue", type = "cstring", canBeSecret = false },
		{ name = "isStoredServerAccount", type = "bool", canBeSecret = false },
		{ name = "isStoredServerCharacter", type = "bool", canBeSecret = false },
		{ name = "isLockedFromUser", type = "bool", canBeSecret = false },
		{ name = "isSecure", type = "bool", canBeSecret = false },
		{ name = "isReadOnly", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_CVar.RegisterCVar"] = {
	key = "C_CVar.RegisterCVar",
	name = "RegisterCVar",
	category = "combat_midnight",
	subcategory = "c_cvar",
	func = _G["C_CVar"] and _G["C_CVar"]["RegisterCVar"],
	funcPath = "C_CVar.RegisterCVar",
	params = {
		{
			name = "name",
			type = "cstring",
			default = nil,
			examples = { { value = "nameplateShowOnlyNames", label = "Plater" } },
		},
		{ name = "value", type = "cstring", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_CVar.SetCVar"] = {
	key = "C_CVar.SetCVar",
	name = "SetCVar",
	category = "combat_midnight",
	subcategory = "c_cvar",
	func = _G["C_CVar"] and _G["C_CVar"]["SetCVar"],
	funcPath = "C_CVar.SetCVar",
	params = {
		{
			name = "name",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "combinedBags", label = "BagBrother" },
				{ value = "encounterTimelineEnabled", label = "BigWigs" },
				{ value = "Sound_NumChannels", label = "BigWigs" },
			},
		},
		{ name = "value", type = "cstring", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_CVar.SetCVarBitfield"] = {
	key = "C_CVar.SetCVarBitfield",
	name = "SetCVarBitfield",
	category = "combat_midnight",
	subcategory = "c_cvar",
	func = _G["C_CVar"] and _G["C_CVar"]["SetCVarBitfield"],
	funcPath = "C_CVar.SetCVarBitfield",
	params = {
		{
			name = "name",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "closedInfoFrames", label = "BagBrother" },
				{ value = "closedInfoFrames", label = "BagBrother" },
				{ value = "closedInfoFrames", label = "BagBrother" },
			},
		},
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "value", type = "bool", default = nil },
	},
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

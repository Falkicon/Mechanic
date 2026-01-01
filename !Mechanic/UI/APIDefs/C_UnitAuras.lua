-- Generated APIDefinitions for namespace: C_UnitAuras
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_UnitAuras.AddPrivateAuraAnchor"] = {
	key = "C_UnitAuras.AddPrivateAuraAnchor",
	name = "AddPrivateAuraAnchor",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["AddPrivateAuraAnchor"],
	funcPath = "C_UnitAuras.AddPrivateAuraAnchor",
	params = { { name = "args", type = "AddPrivateAuraAnchorArgs", default = nil } },
	returns = { { name = "anchorID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.AddPrivateAuraAppliedSound"] = {
	key = "C_UnitAuras.AddPrivateAuraAppliedSound",
	name = "AddPrivateAuraAppliedSound",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["AddPrivateAuraAppliedSound"],
	funcPath = "C_UnitAuras.AddPrivateAuraAppliedSound",
	params = {
		{
			name = "sound",
			type = "UnitPrivateAuraAppliedSoundInfo",
			default = nil,
			examples = {
				{ value = "{ 					spellID = opt[i]", label = "BigWigs_Core" },
				{ value = "{ 				spellID = auraspellId", label = "DBM-Core" },
			},
		},
	},
	returns = { { name = "privateAuraSoundID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.AuraIsBigDefensive"] = {
	key = "C_UnitAuras.AuraIsBigDefensive",
	name = "AuraIsBigDefensive",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["AuraIsBigDefensive"],
	funcPath = "C_UnitAuras.AuraIsBigDefensive",
	params = {
		{
			name = "spellID",
			type = "number",
			default = nil,
			examples = { { value = "unit", label = "DandersFrames" }, { value = "unit", label = "DandersFrames" } },
		},
	},
	returns = { { name = "isBigDefensive", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.AuraIsPrivate"] = {
	key = "C_UnitAuras.AuraIsPrivate",
	name = "AuraIsPrivate",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["AuraIsPrivate"],
	funcPath = "C_UnitAuras.AuraIsPrivate",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = { { name = "isPrivate", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.DoesAuraHaveExpirationTime"] = {
	key = "C_UnitAuras.DoesAuraHaveExpirationTime",
	name = "DoesAuraHaveExpirationTime",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["DoesAuraHaveExpirationTime"],
	funcPath = "C_UnitAuras.DoesAuraHaveExpirationTime",
	params = {
		{
			name = "auraInstanceUnit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "DandersFrames" } },
		},
		{ name = "auraInstanceID", type = "number", default = nil },
	},
	returns = { { name = "hasExpirationTime", type = "bool", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraInstanceRestricted",
}

APIDefs["C_UnitAuras.GetAuraApplicationDisplayCount"] = {
	key = "C_UnitAuras.GetAuraApplicationDisplayCount",
	name = "GetAuraApplicationDisplayCount",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetAuraApplicationDisplayCount"],
	funcPath = "C_UnitAuras.GetAuraApplicationDisplayCount",
	params = {
		{
			name = "auraInstanceUnit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "DandersFrames" } },
		},
		{ name = "auraInstanceID", type = "number", default = nil },
		{ name = "minDisplayCount", type = "number", default = 2 },
		{ name = "maxDisplayCount", type = "number", default = nil },
	},
	returns = { { name = "count", type = "string", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraInstanceRestricted",
}

APIDefs["C_UnitAuras.GetAuraBaseDuration"] = {
	key = "C_UnitAuras.GetAuraBaseDuration",
	name = "GetAuraBaseDuration",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetAuraBaseDuration"],
	funcPath = "C_UnitAuras.GetAuraBaseDuration",
	params = {
		{ name = "auraInstanceUnit", type = "UnitToken", default = "player" },
		{ name = "auraInstanceID", type = "number", default = nil },
		{ name = "spellID", type = "number", default = nil },
	},
	returns = { { name = "newDuration", type = "number", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraInstanceRestricted",
}

APIDefs["C_UnitAuras.GetAuraDataByAuraInstanceID"] = {
	key = "C_UnitAuras.GetAuraDataByAuraInstanceID",
	name = "GetAuraDataByAuraInstanceID",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetAuraDataByAuraInstanceID"],
	funcPath = "C_UnitAuras.GetAuraDataByAuraInstanceID",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "WeakAuras" },
				{ value = "unitId", label = "Details" },
				{ value = "player", label = "Details" },
			},
		},
		{ name = "auraInstanceID", type = "number", default = nil },
	},
	returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenAuraDataRestricted, SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.GetAuraDataByIndex"] = {
	key = "C_UnitAuras.GetAuraDataByIndex",
	name = "GetAuraDataByIndex",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetAuraDataByIndex"],
	funcPath = "C_UnitAuras.GetAuraDataByIndex",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "DandersFrames" },
				{ value = "player", label = "DandersFrames" },
				{ value = "unit", label = "DandersFrames" },
			},
		},
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "filter", type = "AuraFilters", default = nil },
	},
	returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenAuraDataRestricted, SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.GetAuraDataBySlot"] = {
	key = "C_UnitAuras.GetAuraDataBySlot",
	name = "GetAuraDataBySlot",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetAuraDataBySlot"],
	funcPath = "C_UnitAuras.GetAuraDataBySlot",
	params = {
		{ name = "unit", type = "UnitToken", default = "player", examples = { { value = "unit", label = "Plater" } } },
		{ name = "slot", type = "number", default = nil },
	},
	returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenAuraDataRestricted, SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.GetAuraDataBySpellName"] = {
	key = "C_UnitAuras.GetAuraDataBySpellName",
	name = "GetAuraDataBySpellName",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetAuraDataBySpellName"],
	funcPath = "C_UnitAuras.GetAuraDataBySpellName",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "DandersFrames" },
				{ value = "uId", label = "DBM-Core" },
				{ value = "uId", label = "DBM-Core" },
			},
		},
		{ name = "spellName", type = "cstring", default = nil },
		{ name = "filter", type = "AuraFilters", default = nil },
	},
	returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenAuraDataRestricted, SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.GetAuraDispelTypeColor"] = {
	key = "C_UnitAuras.GetAuraDispelTypeColor",
	name = "GetAuraDispelTypeColor",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetAuraDispelTypeColor"],
	funcPath = "C_UnitAuras.GetAuraDispelTypeColor",
	params = {
		{
			name = "auraInstanceUnit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "DandersFrames" },
				{ value = "unit", label = "DandersFrames" },
				{ value = "unit", label = "DandersFrames" },
			},
		},
		{ name = "auraInstanceID", type = "number", default = nil },
		{ name = "curve", type = "LuaColorCurveObject", default = nil },
	},
	returns = { { name = "dispelTypeColor", type = "colorRGBA", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenUnitAuraInstanceRestricted, SecretArguments=AllowedWhenTainted, SecretWhenCurveSecret",
}

APIDefs["C_UnitAuras.GetAuraDuration"] = {
	key = "C_UnitAuras.GetAuraDuration",
	name = "GetAuraDuration",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetAuraDuration"],
	funcPath = "C_UnitAuras.GetAuraDuration",
	params = {
		{ name = "auraInstanceUnit", type = "UnitToken", default = "player" },
		{ name = "auraInstanceID", type = "number", default = nil },
	},
	returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.GetAuraDurationRemaining"] = {
	key = "C_UnitAuras.GetAuraDurationRemaining",
	name = "GetAuraDurationRemaining",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetAuraDurationRemaining"],
	funcPath = "C_UnitAuras.GetAuraDurationRemaining",
	params = {
		{
			name = "auraInstanceUnit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "ActionHud" } },
		},
		{ name = "auraInstanceID", type = "number", default = nil },
	},
	returns = { { name = "durationRemaining", type = "DurationSeconds", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraInstanceRestricted",
}

APIDefs["C_UnitAuras.GetAuraDurationRemainingPercent"] = {
	key = "C_UnitAuras.GetAuraDurationRemainingPercent",
	name = "GetAuraDurationRemainingPercent",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetAuraDurationRemainingPercent"],
	funcPath = "C_UnitAuras.GetAuraDurationRemainingPercent",
	params = {
		{ name = "auraInstanceUnit", type = "UnitToken", default = "player" },
		{ name = "auraInstanceID", type = "number", default = nil },
		{ name = "curve", type = "LuaCurveObjectBase", default = nil },
	},
	returns = { { name = "result", type = "LuaCurveEvaluatedResult", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenUnitAuraInstanceRestricted, SecretArguments=AllowedWhenTainted, SecretWhenCurveSecret",
}

APIDefs["C_UnitAuras.GetAuraSlots"] = {
	key = "C_UnitAuras.GetAuraSlots",
	name = "GetAuraSlots",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetAuraSlots"],
	funcPath = "C_UnitAuras.GetAuraSlots",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "Plater" },
				{ value = "unitId", label = "Plater" },
				{ value = "unitId", label = "Plater" },
			},
		},
		{ name = "filter", type = "AuraFilters", default = nil },
		{ name = "maxSlots", type = "number", default = nil },
		{ name = "continuationToken", type = "number", default = nil },
	},
	returns = {
		{ name = "outContinuationToken", type = "number", canBeSecret = false },
		{ name = "slots", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.GetBuffDataByIndex"] = {
	key = "C_UnitAuras.GetBuffDataByIndex",
	name = "GetBuffDataByIndex",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetBuffDataByIndex"],
	funcPath = "C_UnitAuras.GetBuffDataByIndex",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "Leatrix_Plus" },
				{ value = "target", label = "Plumber" },
				{ value = "player", label = "Simulationcraft" },
			},
		},
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "filter", type = "AuraFilters", default = nil },
	},
	returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenAuraDataRestricted, SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.GetCooldownAuraBySpellID"] = {
	key = "C_UnitAuras.GetCooldownAuraBySpellID",
	name = "GetCooldownAuraBySpellID",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetCooldownAuraBySpellID"],
	funcPath = "C_UnitAuras.GetCooldownAuraBySpellID",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = { { name = "cooldownSpellID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.GetDebuffDataByIndex"] = {
	key = "C_UnitAuras.GetDebuffDataByIndex",
	name = "GetDebuffDataByIndex",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetDebuffDataByIndex"],
	funcPath = "C_UnitAuras.GetDebuffDataByIndex",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "player", label = "Leatrix_Plus" },
				{ value = "unit", label = "RaidAchievement" },
				{ value = "unit", label = "RaidAchievement" },
			},
		},
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "filter", type = "AuraFilters", default = nil },
	},
	returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenAuraDataRestricted, SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.GetPlayerAuraBySpellID"] = {
	key = "C_UnitAuras.GetPlayerAuraBySpellID",
	name = "GetPlayerAuraBySpellID",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetPlayerAuraBySpellID"],
	funcPath = "C_UnitAuras.GetPlayerAuraBySpellID",
	params = {
		{
			name = "spellID",
			type = "number",
			default = nil,
			examples = { { value = 11327, label = "Details" }, { value = 355752, label = "Narcissus" } },
		},
	},
	returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenAuraDataRestricted, SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.GetRefreshExtendedDuration"] = {
	key = "C_UnitAuras.GetRefreshExtendedDuration",
	name = "GetRefreshExtendedDuration",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetRefreshExtendedDuration"],
	funcPath = "C_UnitAuras.GetRefreshExtendedDuration",
	params = {
		{ name = "auraInstanceUnit", type = "UnitToken", default = "player" },
		{ name = "auraInstanceID", type = "number", default = nil },
		{ name = "spellID", type = "number", default = nil },
	},
	returns = { { name = "newDuration", type = "number", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraInstanceRestricted",
}

APIDefs["C_UnitAuras.GetUnitAuraBySpellID"] = {
	key = "C_UnitAuras.GetUnitAuraBySpellID",
	name = "GetUnitAuraBySpellID",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetUnitAuraBySpellID"],
	funcPath = "C_UnitAuras.GetUnitAuraBySpellID",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "BigWigs_Core" }, { value = "player", label = "Plumber" } },
		},
		{ name = "spellID", type = "number", default = nil },
	},
	returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenAuraDataRestricted, SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.GetUnitAuraInstanceIDs"] = {
	key = "C_UnitAuras.GetUnitAuraInstanceIDs",
	name = "GetUnitAuraInstanceIDs",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetUnitAuraInstanceIDs"],
	funcPath = "C_UnitAuras.GetUnitAuraInstanceIDs",
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "filter", type = "AuraFilters", default = nil },
		{ name = "maxCount", type = "number", default = nil },
		{ name = "sortRule", type = "UnitAuraSortRule", default = "Unsorted" },
		{ name = "sortDirection", type = "UnitAuraSortDirection", default = "Normal" },
	},
	returns = { { name = "auraInstanceIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.GetUnitAuras"] = {
	key = "C_UnitAuras.GetUnitAuras",
	name = "GetUnitAuras",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["GetUnitAuras"],
	funcPath = "C_UnitAuras.GetUnitAuras",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "DandersFrames" },
				{ value = "unit", label = "DandersFrames" },
				{ value = "unit", label = "DandersFrames" },
			},
		},
		{ name = "filter", type = "AuraFilters", default = nil },
		{ name = "maxCount", type = "number", default = nil },
		{ name = "sortRule", type = "UnitAuraSortRule", default = "Unsorted" },
		{ name = "sortDirection", type = "UnitAuraSortDirection", default = "Normal" },
	},
	returns = { { name = "auras", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.IsAuraFilteredOutByInstanceID"] = {
	key = "C_UnitAuras.IsAuraFilteredOutByInstanceID",
	name = "IsAuraFilteredOutByInstanceID",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["IsAuraFilteredOutByInstanceID"],
	funcPath = "C_UnitAuras.IsAuraFilteredOutByInstanceID",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = {
				{ value = "unit", label = "DandersFrames" },
				{ value = "unit", label = "DandersFrames" },
				{ value = "unit", label = "DandersFrames" },
			},
		},
		{ name = "auraInstanceID", type = "number", default = nil },
		{ name = "filter", type = "AuraFilters", default = nil },
	},
	returns = { { name = "isFiltered", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.RemovePrivateAuraAnchor"] = {
	key = "C_UnitAuras.RemovePrivateAuraAnchor",
	name = "RemovePrivateAuraAnchor",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["RemovePrivateAuraAnchor"],
	funcPath = "C_UnitAuras.RemovePrivateAuraAnchor",
	params = { { name = "anchorID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.RemovePrivateAuraAppliedSound"] = {
	key = "C_UnitAuras.RemovePrivateAuraAppliedSound",
	name = "RemovePrivateAuraAppliedSound",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["RemovePrivateAuraAppliedSound"],
	funcPath = "C_UnitAuras.RemovePrivateAuraAppliedSound",
	params = {
		{
			name = "privateAuraSoundID",
			type = "number",
			default = nil,
			examples = { { value = "id", label = "DBM-Core" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.SetPrivateWarningTextAnchor"] = {
	key = "C_UnitAuras.SetPrivateWarningTextAnchor",
	name = "SetPrivateWarningTextAnchor",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["SetPrivateWarningTextAnchor"],
	funcPath = "C_UnitAuras.SetPrivateWarningTextAnchor",
	params = {
		{ name = "parent", type = "SimpleFrame", default = nil },
		{ name = "anchor", type = "AnchorBinding", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.TriggerPrivateAuraShowDispelType"] = {
	key = "C_UnitAuras.TriggerPrivateAuraShowDispelType",
	name = "TriggerPrivateAuraShowDispelType",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["TriggerPrivateAuraShowDispelType"],
	funcPath = "C_UnitAuras.TriggerPrivateAuraShowDispelType",
	params = { { name = "show", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.WantsAlteredForm"] = {
	key = "C_UnitAuras.WantsAlteredForm",
	name = "WantsAlteredForm",
	category = "combat_midnight",
	subcategory = "c_unitauras",
	func = _G["C_UnitAuras"] and _G["C_UnitAuras"]["WantsAlteredForm"],
	funcPath = "C_UnitAuras.WantsAlteredForm",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "Narcissus" }, { value = "player", label = "Narcissus" } },
		},
	},
	returns = { { name = "wantsAlteredForm", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

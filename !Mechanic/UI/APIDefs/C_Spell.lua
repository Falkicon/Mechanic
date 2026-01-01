-- Generated APIDefinitions for namespace: C_Spell
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Spell.CancelSpellByID"] = {
	key = "C_Spell.CancelSpellByID",
	name = "CancelSpellByID",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["CancelSpellByID"],
	funcPath = "C_Spell.CancelSpellByID",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Spell.DoesSpellExist"] = {
	key = "C_Spell.DoesSpellExist",
	name = "DoesSpellExist",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["DoesSpellExist"],
	funcPath = "C_Spell.DoesSpellExist",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "spellExists", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Spell.EnableSpellRangeCheck"] = {
	key = "C_Spell.EnableSpellRangeCheck",
	name = "EnableSpellRangeCheck",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["EnableSpellRangeCheck"],
	funcPath = "C_Spell.EnableSpellRangeCheck",
	params = {
		{ name = "spellIdentifier", type = "SpellIdentifier", default = nil },
		{ name = "enable", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Spell.GetAuraStatChanges"] = {
	key = "C_Spell.GetAuraStatChanges",
	name = "GetAuraStatChanges",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetAuraStatChanges"],
	funcPath = "C_Spell.GetAuraStatChanges",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = {
		{ name = "healthChange", type = "number", canBeSecret = false },
		{ name = "powerTypeChanges", type = "table", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Spell.GetBaseSpell"] = {
	key = "C_Spell.GetBaseSpell",
	name = "GetBaseSpell",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetBaseSpell"],
	funcPath = "C_Spell.GetBaseSpell",
	params = {
		{ name = "spellIdentifier", type = "SpellIdentifier", default = nil },
		{ name = "spec", type = "number", default = 0 },
	},
	returns = { { name = "baseSpellID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetDeadlyDebuffInfo"] = {
	key = "C_Spell.GetDeadlyDebuffInfo",
	name = "GetDeadlyDebuffInfo",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetDeadlyDebuffInfo"],
	funcPath = "C_Spell.GetDeadlyDebuffInfo",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "deadlyDebuffInfo", type = "DeadlyDebuffInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetItemModifiedAppearancesApplied"] = {
	key = "C_Spell.GetItemModifiedAppearancesApplied",
	name = "GetItemModifiedAppearancesApplied",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetItemModifiedAppearancesApplied"],
	funcPath = "C_Spell.GetItemModifiedAppearancesApplied",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = { { name = "itemModifiedAppearanceIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Spell.GetMawPowerBorderAtlasBySpellID"] = {
	key = "C_Spell.GetMawPowerBorderAtlasBySpellID",
	name = "GetMawPowerBorderAtlasBySpellID",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetMawPowerBorderAtlasBySpellID"],
	funcPath = "C_Spell.GetMawPowerBorderAtlasBySpellID",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = { { name = "rarityBorderAtlas", type = "textureAtlas", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetMawPowerLinkBySpellID"] = {
	key = "C_Spell.GetMawPowerLinkBySpellID",
	name = "GetMawPowerLinkBySpellID",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetMawPowerLinkBySpellID"],
	funcPath = "C_Spell.GetMawPowerLinkBySpellID",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = { { name = "link", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetOverrideSpell"] = {
	key = "C_Spell.GetOverrideSpell",
	name = "GetOverrideSpell",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetOverrideSpell"],
	funcPath = "C_Spell.GetOverrideSpell",
	params = {
		{
			name = "spellIdentifier",
			type = "SpellIdentifier",
			default = nil,
			examples = { { value = 439052, label = "Narcissus" }, { value = 439053, label = "Narcissus" } },
		},
		{ name = "spec", type = "number", default = 0 },
		{ name = "onlyKnown", type = "bool", default = true },
		{ name = "ignoreOverrideSpellID", type = "number", default = 0 },
	},
	returns = { { name = "overrideSpellID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Spell.GetSchoolString"] = {
	key = "C_Spell.GetSchoolString",
	name = "GetSchoolString",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSchoolString"],
	funcPath = "C_Spell.GetSchoolString",
	params = {
		{
			name = "schoolMask",
			type = "number",
			default = nil,
			examples = {
				{ value = 1, label = "WeakAuras" },
				{ value = 2, label = "WeakAuras" },
				{ value = 4, label = "WeakAuras" },
			},
		},
	},
	returns = { { name = "result", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellAutoCast"] = {
	key = "C_Spell.GetSpellAutoCast",
	name = "GetSpellAutoCast",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellAutoCast"],
	funcPath = "C_Spell.GetSpellAutoCast",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = {
		{ name = "autoCastAllowed", type = "bool", canBeSecret = false },
		{ name = "autoCastEnabled", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellCastCount"] = {
	key = "C_Spell.GetSpellCastCount",
	name = "GetSpellCastCount",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellCastCount"],
	funcPath = "C_Spell.GetSpellCastCount",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "castCount", type = "number", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenSpellCooldownRestricted",
}

APIDefs["C_Spell.GetSpellChargeDuration"] = {
	key = "C_Spell.GetSpellChargeDuration",
	name = "GetSpellChargeDuration",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellChargeDuration"],
	funcPath = "C_Spell.GetSpellChargeDuration",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellCharges"] = {
	key = "C_Spell.GetSpellCharges",
	name = "GetSpellCharges",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellCharges"],
	funcPath = "C_Spell.GetSpellCharges",
	params = {
		{
			name = "spellIdentifier",
			type = "SpellIdentifier",
			default = nil,
			examples = {
				{ value = "id", label = "WeakAuras" },
				{ value = 372608, label = "Flightsim" },
				{ value = "id", label = "WeakAuras" },
			},
		},
	},
	returns = { { name = "chargeInfo", type = "SpellChargeInfo", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenSpellCooldownRestricted",
}

APIDefs["C_Spell.GetSpellCooldown"] = {
	key = "C_Spell.GetSpellCooldown",
	name = "GetSpellCooldown",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellCooldown"],
	funcPath = "C_Spell.GetSpellCooldown",
	params = {
		{
			name = "spellIdentifier",
			type = "SpellIdentifier",
			default = nil,
			examples = {
				{ value = 29515, label = "WeakAuras" },
				{ value = 5019, label = "WeakAuras" },
				{ value = 61304, label = "WeakAuras" },
			},
		},
	},
	returns = { { name = "spellCooldownInfo", type = "SpellCooldownInfo", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenSpellCooldownRestricted",
}

APIDefs["C_Spell.GetSpellCooldownDuration"] = {
	key = "C_Spell.GetSpellCooldownDuration",
	name = "GetSpellCooldownDuration",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellCooldownDuration"],
	funcPath = "C_Spell.GetSpellCooldownDuration",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellCooldownRemaining"] = {
	key = "C_Spell.GetSpellCooldownRemaining",
	name = "GetSpellCooldownRemaining",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellCooldownRemaining"],
	funcPath = "C_Spell.GetSpellCooldownRemaining",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "remainingSeconds", type = "number", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenSpellCooldownRestricted",
}

APIDefs["C_Spell.GetSpellCooldownRemainingPercent"] = {
	key = "C_Spell.GetSpellCooldownRemainingPercent",
	name = "GetSpellCooldownRemainingPercent",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellCooldownRemainingPercent"],
	funcPath = "C_Spell.GetSpellCooldownRemainingPercent",
	params = {
		{ name = "spellIdentifier", type = "SpellIdentifier", default = nil },
		{ name = "curve", type = "LuaCurveObjectBase", default = nil },
	},
	returns = { { name = "result", type = "LuaCurveEvaluatedResult", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenSpellCooldownRestricted, SecretWhenCurveSecret",
}

APIDefs["C_Spell.GetSpellDescription"] = {
	key = "C_Spell.GetSpellDescription",
	name = "GetSpellDescription",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellDescription"],
	funcPath = "C_Spell.GetSpellDescription",
	params = {
		{
			name = "spellIdentifier",
			type = "SpellIdentifier",
			default = nil,
			examples = {
				{ value = "spell:GetSpellID()", label = "WeakAurasTemplates" },
				{ value = "item.spell", label = "WeakAurasTemplates" },
				{ value = "id", label = "BigWigs_Core" },
			},
		},
	},
	returns = { { name = "description", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellDisplayCount"] = {
	key = "C_Spell.GetSpellDisplayCount",
	name = "GetSpellDisplayCount",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellDisplayCount"],
	funcPath = "C_Spell.GetSpellDisplayCount",
	params = {
		{ name = "spellIdentifier", type = "SpellIdentifier", default = nil },
		{ name = "maxDisplayCount", type = "number", default = 9999 },
		{ name = "replacementString", type = "cstring", default = "*" },
	},
	returns = { { name = "displayCount", type = "string", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenSpellCooldownRestricted",
}

APIDefs["C_Spell.GetSpellIDForSpellIdentifier"] = {
	key = "C_Spell.GetSpellIDForSpellIdentifier",
	name = "GetSpellIDForSpellIdentifier",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellIDForSpellIdentifier"],
	funcPath = "C_Spell.GetSpellIDForSpellIdentifier",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "spellID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellInfo"] = {
	key = "C_Spell.GetSpellInfo",
	name = "GetSpellInfo",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellInfo"],
	funcPath = "C_Spell.GetSpellInfo",
	params = {
		{
			name = "spellIdentifier",
			type = "SpellIdentifier",
			default = nil,
			examples = {
				{ value = "id", label = "WeakAurasOptions" },
				{ value = 126, label = "Dominos" },
				{ value = [=[LeaPlusCB["Spell" .. i]:GetText()]=], label = "Leatrix_Plus" },
			},
		},
	},
	returns = { { name = "spellInfo", type = "SpellInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellLevelLearned"] = {
	key = "C_Spell.GetSpellLevelLearned",
	name = "GetSpellLevelLearned",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellLevelLearned"],
	funcPath = "C_Spell.GetSpellLevelLearned",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "levelLearned", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellLink"] = {
	key = "C_Spell.GetSpellLink",
	name = "GetSpellLink",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellLink"],
	funcPath = "C_Spell.GetSpellLink",
	params = {
		{
			name = "spellIdentifier",
			type = "SpellIdentifier",
			default = nil,
			examples = {
				{ value = "id", label = "AllTheThings" },
				{ value = 6603, label = "Details" },
				{ value = "actor.id", label = "Details" },
			},
		},
		{ name = "glyphID", type = "number", default = nil },
	},
	returns = { { name = "spellLink", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellLossOfControlCooldown"] = {
	key = "C_Spell.GetSpellLossOfControlCooldown",
	name = "GetSpellLossOfControlCooldown",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellLossOfControlCooldown"],
	funcPath = "C_Spell.GetSpellLossOfControlCooldown",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = {
		{ name = "startTime", type = "number", canBeSecret = false },
		{ name = "duration", type = "number", canBeSecret = false },
	},
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenSpellCooldownRestricted",
}

APIDefs["C_Spell.GetSpellLossOfControlCooldownDuration"] = {
	key = "C_Spell.GetSpellLossOfControlCooldownDuration",
	name = "GetSpellLossOfControlCooldownDuration",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellLossOfControlCooldownDuration"],
	funcPath = "C_Spell.GetSpellLossOfControlCooldownDuration",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellMaxCumulativeAuraApplications"] = {
	key = "C_Spell.GetSpellMaxCumulativeAuraApplications",
	name = "GetSpellMaxCumulativeAuraApplications",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellMaxCumulativeAuraApplications"],
	funcPath = "C_Spell.GetSpellMaxCumulativeAuraApplications",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = { { name = "cumulativeAura", type = "number", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretWhenSpellAuraRestricted, SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellName"] = {
	key = "C_Spell.GetSpellName",
	name = "GetSpellName",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellName"],
	funcPath = "C_Spell.GetSpellName",
	params = {
		{
			name = "spellIdentifier",
			type = "SpellIdentifier",
			default = nil,
			examples = {
				{ value = 21127, label = "AllTheThings" },
				{ value = 147343, label = "AllTheThings" },
				{ value = 61820, label = "AllTheThings" },
			},
		},
	},
	returns = { { name = "name", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellPowerCost"] = {
	key = "C_Spell.GetSpellPowerCost",
	name = "GetSpellPowerCost",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellPowerCost"],
	funcPath = "C_Spell.GetSpellPowerCost",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "powerCosts", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellSkillLineAbilityRank"] = {
	key = "C_Spell.GetSpellSkillLineAbilityRank",
	name = "GetSpellSkillLineAbilityRank",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellSkillLineAbilityRank"],
	funcPath = "C_Spell.GetSpellSkillLineAbilityRank",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "rank", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellSubtext"] = {
	key = "C_Spell.GetSpellSubtext",
	name = "GetSpellSubtext",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellSubtext"],
	funcPath = "C_Spell.GetSpellSubtext",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "subtext", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellTexture"] = {
	key = "C_Spell.GetSpellTexture",
	name = "GetSpellTexture",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellTexture"],
	funcPath = "C_Spell.GetSpellTexture",
	params = {
		{
			name = "spellIdentifier",
			type = "SpellIdentifier",
			default = nil,
			examples = {
				{ value = "id", label = "WeakAurasOptions" },
				{ value = 135936, label = "DandersFrames" },
				{ value = "spell", label = "Plumber" },
			},
		},
	},
	returns = {
		{ name = "iconID", type = "fileID", canBeSecret = false },
		{ name = "originalIconID", type = "fileID", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetSpellTradeSkillLink"] = {
	key = "C_Spell.GetSpellTradeSkillLink",
	name = "GetSpellTradeSkillLink",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetSpellTradeSkillLink"],
	funcPath = "C_Spell.GetSpellTradeSkillLink",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "spellLink", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.GetVisibilityInfo"] = {
	key = "C_Spell.GetVisibilityInfo",
	name = "GetVisibilityInfo",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["GetVisibilityInfo"],
	funcPath = "C_Spell.GetVisibilityInfo",
	params = {
		{ name = "spellID", type = "number", default = nil },
		{ name = "visibilityType", type = "SpellAuraVisibilityType", default = nil },
	},
	returns = {
		{ name = "hasCustom", type = "bool", canBeSecret = false },
		{ name = "alwaysShowMine", type = "bool", canBeSecret = false },
		{ name = "showForMySpec", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Spell.IsAutoAttackSpell"] = {
	key = "C_Spell.IsAutoAttackSpell",
	name = "IsAutoAttackSpell",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsAutoAttackSpell"],
	funcPath = "C_Spell.IsAutoAttackSpell",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "isAutoAttack", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.IsAutoRepeatSpell"] = {
	key = "C_Spell.IsAutoRepeatSpell",
	name = "IsAutoRepeatSpell",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsAutoRepeatSpell"],
	funcPath = "C_Spell.IsAutoRepeatSpell",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "isAutoRepeat", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.IsClassTalentSpell"] = {
	key = "C_Spell.IsClassTalentSpell",
	name = "IsClassTalentSpell",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsClassTalentSpell"],
	funcPath = "C_Spell.IsClassTalentSpell",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "isAutoRepeat", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.IsCurrentSpell"] = {
	key = "C_Spell.IsCurrentSpell",
	name = "IsCurrentSpell",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsCurrentSpell"],
	funcPath = "C_Spell.IsCurrentSpell",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "isCurrentSpell", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.IsExternalDefensive"] = {
	key = "C_Spell.IsExternalDefensive",
	name = "IsExternalDefensive",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsExternalDefensive"],
	funcPath = "C_Spell.IsExternalDefensive",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = { { name = "isExternalDefensive", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Spell.IsPressHoldReleaseSpell"] = {
	key = "C_Spell.IsPressHoldReleaseSpell",
	name = "IsPressHoldReleaseSpell",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsPressHoldReleaseSpell"],
	funcPath = "C_Spell.IsPressHoldReleaseSpell",
	params = {
		{
			name = "spellIdentifier",
			type = "SpellIdentifier",
			default = nil,
			examples = { { value = "id", label = "Bartender4" } },
		},
	},
	returns = { { name = "isPressHoldRelease", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.IsPriorityAura"] = {
	key = "C_Spell.IsPriorityAura",
	name = "IsPriorityAura",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsPriorityAura"],
	funcPath = "C_Spell.IsPriorityAura",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = { { name = "isHighPriority", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Spell.IsPvPTalentSpell"] = {
	key = "C_Spell.IsPvPTalentSpell",
	name = "IsPvPTalentSpell",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsPvPTalentSpell"],
	funcPath = "C_Spell.IsPvPTalentSpell",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "isAutoRepeat", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.IsRangedAutoAttackSpell"] = {
	key = "C_Spell.IsRangedAutoAttackSpell",
	name = "IsRangedAutoAttackSpell",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsRangedAutoAttackSpell"],
	funcPath = "C_Spell.IsRangedAutoAttackSpell",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "isRangedAutoAttack", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.IsSelfBuff"] = {
	key = "C_Spell.IsSelfBuff",
	name = "IsSelfBuff",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsSelfBuff"],
	funcPath = "C_Spell.IsSelfBuff",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = { { name = "hasSelfEffectsOnly", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Spell.IsSpellCrowdControl"] = {
	key = "C_Spell.IsSpellCrowdControl",
	name = "IsSpellCrowdControl",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsSpellCrowdControl"],
	funcPath = "C_Spell.IsSpellCrowdControl",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "isCrowdControl", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.IsSpellDataCached"] = {
	key = "C_Spell.IsSpellDataCached",
	name = "IsSpellDataCached",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsSpellDataCached"],
	funcPath = "C_Spell.IsSpellDataCached",
	params = {
		{
			name = "spellIdentifier",
			type = "SpellIdentifier",
			default = nil,
			examples = { { value = "self.id", label = "Plumber" } },
		},
	},
	returns = { { name = "isCached", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Spell.IsSpellDisabled"] = {
	key = "C_Spell.IsSpellDisabled",
	name = "IsSpellDisabled",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsSpellDisabled"],
	funcPath = "C_Spell.IsSpellDisabled",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "disabled", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.IsSpellHarmful"] = {
	key = "C_Spell.IsSpellHarmful",
	name = "IsSpellHarmful",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsSpellHarmful"],
	funcPath = "C_Spell.IsSpellHarmful",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "isHarmful", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.IsSpellHelpful"] = {
	key = "C_Spell.IsSpellHelpful",
	name = "IsSpellHelpful",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsSpellHelpful"],
	funcPath = "C_Spell.IsSpellHelpful",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "isHelpful", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.IsSpellImportant"] = {
	key = "C_Spell.IsSpellImportant",
	name = "IsSpellImportant",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsSpellImportant"],
	funcPath = "C_Spell.IsSpellImportant",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "isImportant", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.IsSpellInRange"] = {
	key = "C_Spell.IsSpellInRange",
	name = "IsSpellInRange",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsSpellInRange"],
	funcPath = "C_Spell.IsSpellInRange",
	params = {
		{
			name = "spellIdentifier",
			type = "SpellIdentifier",
			default = nil,
			examples = {
				{ value = "spellID", label = "MoveAny" },
				{ value = "index", label = "Plater" },
				{ value = "spellId", label = "WeakAuras" },
			},
		},
		{ name = "targetUnit", type = "UnitToken", default = "player" },
	},
	returns = { { name = "inRange", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.IsSpellPassive"] = {
	key = "C_Spell.IsSpellPassive",
	name = "IsSpellPassive",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsSpellPassive"],
	funcPath = "C_Spell.IsSpellPassive",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "isPassive", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.IsSpellUsable"] = {
	key = "C_Spell.IsSpellUsable",
	name = "IsSpellUsable",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["IsSpellUsable"],
	funcPath = "C_Spell.IsSpellUsable",
	params = {
		{
			name = "spellIdentifier",
			type = "SpellIdentifier",
			default = nil,
			examples = { { value = 372608, label = "Flightsim" } },
		},
	},
	returns = {
		{ name = "isUsable", type = "bool", canBeSecret = false },
		{ name = "insufficientPower", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.PickupSpell"] = {
	key = "C_Spell.PickupSpell",
	name = "PickupSpell",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["PickupSpell"],
	funcPath = "C_Spell.PickupSpell",
	params = {
		{
			name = "spellIdentifier",
			type = "SpellIdentifier",
			default = nil,
			examples = { { value = "target", label = "Bartender4" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Spell.RequestLoadSpellData"] = {
	key = "C_Spell.RequestLoadSpellData",
	name = "RequestLoadSpellData",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["RequestLoadSpellData"],
	funcPath = "C_Spell.RequestLoadSpellData",
	params = {
		{
			name = "spellIdentifier",
			type = "SpellIdentifier",
			default = nil,
			examples = { { value = "spell1", label = "Narcissus" }, { value = "spell2", label = "Narcissus" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Spell.SetSpellAutoCastEnabled"] = {
	key = "C_Spell.SetSpellAutoCastEnabled",
	name = "SetSpellAutoCastEnabled",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["SetSpellAutoCastEnabled"],
	funcPath = "C_Spell.SetSpellAutoCastEnabled",
	params = {
		{ name = "spellIdentifier", type = "SpellIdentifier", default = nil },
		{ name = "enabled", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Spell.SpellHasRange"] = {
	key = "C_Spell.SpellHasRange",
	name = "SpellHasRange",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["SpellHasRange"],
	funcPath = "C_Spell.SpellHasRange",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "hasRange", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Spell.ToggleSpellAutoCast"] = {
	key = "C_Spell.ToggleSpellAutoCast",
	name = "ToggleSpellAutoCast",
	category = "combat_midnight",
	subcategory = "c_spell",
	func = _G["C_Spell"] and _G["C_Spell"]["ToggleSpellAutoCast"],
	funcPath = "C_Spell.ToggleSpellAutoCast",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

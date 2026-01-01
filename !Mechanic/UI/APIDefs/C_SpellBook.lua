-- Generated APIDefinitions for namespace: C_SpellBook
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SpellBook.CastSpellBookItem"] = {
	key = "C_SpellBook.CastSpellBookItem",
	name = "CastSpellBookItem",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["CastSpellBookItem"],
	funcPath = "C_SpellBook.CastSpellBookItem",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
		{ name = "targetSelf", type = "bool", default = false },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.FindBaseSpellByID"] = {
	key = "C_SpellBook.FindBaseSpellByID",
	name = "FindBaseSpellByID",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["FindBaseSpellByID"],
	funcPath = "C_SpellBook.FindBaseSpellByID",
	params = {
		{ name = "spellID", type = "number", default = nil, examples = { { value = "spell", label = "WeakAuras" } } },
	},
	returns = { { name = "baseSpellID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.FindFlyoutSlotBySpellID"] = {
	key = "C_SpellBook.FindFlyoutSlotBySpellID",
	name = "FindFlyoutSlotBySpellID",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["FindFlyoutSlotBySpellID"],
	funcPath = "C_SpellBook.FindFlyoutSlotBySpellID",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = { { name = "flyoutSlot", type = "luaIndex", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.FindSpellBookSlotForSpell"] = {
	key = "C_SpellBook.FindSpellBookSlotForSpell",
	name = "FindSpellBookSlotForSpell",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["FindSpellBookSlotForSpell"],
	funcPath = "C_SpellBook.FindSpellBookSlotForSpell",
	params = {
		{ name = "spellIdentifier", type = "SpellIdentifier", default = nil },
		{ name = "includeHidden", type = "bool", default = false },
		{ name = "includeFlyouts", type = "bool", default = true },
		{ name = "includeFutureSpells", type = "bool", default = false },
		{ name = "includeOffSpec", type = "bool", default = false },
	},
	returns = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", canBeSecret = false },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.FindSpellOverrideByID"] = {
	key = "C_SpellBook.FindSpellOverrideByID",
	name = "FindSpellOverrideByID",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["FindSpellOverrideByID"],
	funcPath = "C_SpellBook.FindSpellOverrideByID",
	params = { { name = "spellID", type = "number", default = nil } },
	returns = { { name = "overrideSpellID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetCurrentLevelSpells"] = {
	key = "C_SpellBook.GetCurrentLevelSpells",
	name = "GetCurrentLevelSpells",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetCurrentLevelSpells"],
	funcPath = "C_SpellBook.GetCurrentLevelSpells",
	params = { { name = "level", type = "number", default = nil } },
	returns = { { name = "spellIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSkillLineIndexByID"] = {
	key = "C_SpellBook.GetSkillLineIndexByID",
	name = "GetSkillLineIndexByID",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSkillLineIndexByID"],
	funcPath = "C_SpellBook.GetSkillLineIndexByID",
	params = { { name = "skillLineID", type = "number", default = nil } },
	returns = { { name = "skillIndex", type = "luaIndex", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSpellBookItemAutoCast"] = {
	key = "C_SpellBook.GetSpellBookItemAutoCast",
	name = "GetSpellBookItemAutoCast",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemAutoCast"],
	funcPath = "C_SpellBook.GetSpellBookItemAutoCast",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = {
		{ name = "autoCastAllowed", type = "bool", canBeSecret = false },
		{ name = "autoCastEnabled", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSpellBookItemCastCount"] = {
	key = "C_SpellBook.GetSpellBookItemCastCount",
	name = "GetSpellBookItemCastCount",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemCastCount"],
	funcPath = "C_SpellBook.GetSpellBookItemCastCount",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "castCount", type = "number", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenSpellBookItemCooldownRestricted",
}

APIDefs["C_SpellBook.GetSpellBookItemChargeDuration"] = {
	key = "C_SpellBook.GetSpellBookItemChargeDuration",
	name = "GetSpellBookItemChargeDuration",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemChargeDuration"],
	funcPath = "C_SpellBook.GetSpellBookItemChargeDuration",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSpellBookItemCharges"] = {
	key = "C_SpellBook.GetSpellBookItemCharges",
	name = "GetSpellBookItemCharges",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemCharges"],
	funcPath = "C_SpellBook.GetSpellBookItemCharges",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "chargeInfo", type = "SpellChargeInfo", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenSpellBookItemCooldownRestricted",
}

APIDefs["C_SpellBook.GetSpellBookItemCooldown"] = {
	key = "C_SpellBook.GetSpellBookItemCooldown",
	name = "GetSpellBookItemCooldown",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemCooldown"],
	funcPath = "C_SpellBook.GetSpellBookItemCooldown",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "spellCooldownInfo", type = "SpellCooldownInfo", canBeSecret = false } },
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenSpellBookItemCooldownRestricted",
}

APIDefs["C_SpellBook.GetSpellBookItemCooldownDuration"] = {
	key = "C_SpellBook.GetSpellBookItemCooldownDuration",
	name = "GetSpellBookItemCooldownDuration",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemCooldownDuration"],
	funcPath = "C_SpellBook.GetSpellBookItemCooldownDuration",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSpellBookItemDescription"] = {
	key = "C_SpellBook.GetSpellBookItemDescription",
	name = "GetSpellBookItemDescription",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemDescription"],
	funcPath = "C_SpellBook.GetSpellBookItemDescription",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "description", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSpellBookItemInfo"] = {
	key = "C_SpellBook.GetSpellBookItemInfo",
	name = "GetSpellBookItemInfo",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemInfo"],
	funcPath = "C_SpellBook.GetSpellBookItemInfo",
	params = {
		{
			name = "spellBookItemSlotIndex",
			type = "luaIndex",
			default = nil,
			examples = {
				{ value = "math.random(1", label = "Dominos_Cast" },
				{ value = "i", label = "MRT" },
				{ value = "i", label = "Bartender4" },
			},
		},
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "spellBookItemInfo", type = "SpellBookItemInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSpellBookItemLevelLearned"] = {
	key = "C_SpellBook.GetSpellBookItemLevelLearned",
	name = "GetSpellBookItemLevelLearned",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemLevelLearned"],
	funcPath = "C_SpellBook.GetSpellBookItemLevelLearned",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "levelLearned", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSpellBookItemLink"] = {
	key = "C_SpellBook.GetSpellBookItemLink",
	name = "GetSpellBookItemLink",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemLink"],
	funcPath = "C_SpellBook.GetSpellBookItemLink",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
		{ name = "glyphID", type = "number", default = nil },
	},
	returns = { { name = "spellLink", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSpellBookItemLossOfControlCooldown"] = {
	key = "C_SpellBook.GetSpellBookItemLossOfControlCooldown",
	name = "GetSpellBookItemLossOfControlCooldown",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemLossOfControlCooldown"],
	funcPath = "C_SpellBook.GetSpellBookItemLossOfControlCooldown",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = {
		{ name = "startTime", type = "number", canBeSecret = false },
		{ name = "duration", type = "number", canBeSecret = false },
	},
	midnightImpact = "CONDITIONAL",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenSpellBookItemCooldownRestricted",
}

APIDefs["C_SpellBook.GetSpellBookItemLossOfControlCooldownDuration"] = {
	key = "C_SpellBook.GetSpellBookItemLossOfControlCooldownDuration",
	name = "GetSpellBookItemLossOfControlCooldownDuration",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemLossOfControlCooldownDuration"],
	funcPath = "C_SpellBook.GetSpellBookItemLossOfControlCooldownDuration",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSpellBookItemName"] = {
	key = "C_SpellBook.GetSpellBookItemName",
	name = "GetSpellBookItemName",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemName"],
	funcPath = "C_SpellBook.GetSpellBookItemName",
	params = {
		{
			name = "spellBookItemSlotIndex",
			type = "luaIndex",
			default = nil,
			examples = { { value = "i", label = "Narcissus" } },
		},
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = {
		{ name = "name", type = "string", canBeSecret = false },
		{ name = "subName", type = "string", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSpellBookItemPowerCost"] = {
	key = "C_SpellBook.GetSpellBookItemPowerCost",
	name = "GetSpellBookItemPowerCost",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemPowerCost"],
	funcPath = "C_SpellBook.GetSpellBookItemPowerCost",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "powerCosts", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSpellBookItemSkillLineIndex"] = {
	key = "C_SpellBook.GetSpellBookItemSkillLineIndex",
	name = "GetSpellBookItemSkillLineIndex",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemSkillLineIndex"],
	funcPath = "C_SpellBook.GetSpellBookItemSkillLineIndex",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "skillLineIndex", type = "luaIndex", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSpellBookItemTexture"] = {
	key = "C_SpellBook.GetSpellBookItemTexture",
	name = "GetSpellBookItemTexture",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemTexture"],
	funcPath = "C_SpellBook.GetSpellBookItemTexture",
	params = {
		{
			name = "spellBookItemSlotIndex",
			type = "luaIndex",
			default = nil,
			examples = { { value = "spellIndex", label = "Narcissus" }, { value = "i", label = "Narcissus" } },
		},
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "iconID", type = "fileID", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSpellBookItemTradeSkillLink"] = {
	key = "C_SpellBook.GetSpellBookItemTradeSkillLink",
	name = "GetSpellBookItemTradeSkillLink",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemTradeSkillLink"],
	funcPath = "C_SpellBook.GetSpellBookItemTradeSkillLink",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "spellLink", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSpellBookItemType"] = {
	key = "C_SpellBook.GetSpellBookItemType",
	name = "GetSpellBookItemType",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookItemType"],
	funcPath = "C_SpellBook.GetSpellBookItemType",
	params = {
		{
			name = "spellBookItemSlotIndex",
			type = "luaIndex",
			default = nil,
			examples = { { value = "index", label = "Bartender4" }, { value = "spellIndex", label = "Narcissus" } },
		},
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = {
		{ name = "itemType", type = "SpellBookItemType", canBeSecret = false },
		{ name = "actionID", type = "number", canBeSecret = false },
		{ name = "spellID", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.GetSpellBookSkillLineInfo"] = {
	key = "C_SpellBook.GetSpellBookSkillLineInfo",
	name = "GetSpellBookSkillLineInfo",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["GetSpellBookSkillLineInfo"],
	funcPath = "C_SpellBook.GetSpellBookSkillLineInfo",
	params = { { name = "skillLineIndex", type = "luaIndex", default = nil } },
	returns = { { name = "skillLineInfo", type = "SpellBookSkillLineInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.IsAutoAttackSpellBookItem"] = {
	key = "C_SpellBook.IsAutoAttackSpellBookItem",
	name = "IsAutoAttackSpellBookItem",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["IsAutoAttackSpellBookItem"],
	funcPath = "C_SpellBook.IsAutoAttackSpellBookItem",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "isAutoAttack", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.IsClassTalentSpellBookItem"] = {
	key = "C_SpellBook.IsClassTalentSpellBookItem",
	name = "IsClassTalentSpellBookItem",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["IsClassTalentSpellBookItem"],
	funcPath = "C_SpellBook.IsClassTalentSpellBookItem",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "isClassTalent", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.IsPvPTalentSpellBookItem"] = {
	key = "C_SpellBook.IsPvPTalentSpellBookItem",
	name = "IsPvPTalentSpellBookItem",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["IsPvPTalentSpellBookItem"],
	funcPath = "C_SpellBook.IsPvPTalentSpellBookItem",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "isPvPTalent", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.IsRangedAutoAttackSpellBookItem"] = {
	key = "C_SpellBook.IsRangedAutoAttackSpellBookItem",
	name = "IsRangedAutoAttackSpellBookItem",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["IsRangedAutoAttackSpellBookItem"],
	funcPath = "C_SpellBook.IsRangedAutoAttackSpellBookItem",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "isRangedAutoAttack", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.IsSpellBookItemHarmful"] = {
	key = "C_SpellBook.IsSpellBookItemHarmful",
	name = "IsSpellBookItemHarmful",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["IsSpellBookItemHarmful"],
	funcPath = "C_SpellBook.IsSpellBookItemHarmful",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "isHarmful", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.IsSpellBookItemHelpful"] = {
	key = "C_SpellBook.IsSpellBookItemHelpful",
	name = "IsSpellBookItemHelpful",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["IsSpellBookItemHelpful"],
	funcPath = "C_SpellBook.IsSpellBookItemHelpful",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "isHelpful", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.IsSpellBookItemInRange"] = {
	key = "C_SpellBook.IsSpellBookItemInRange",
	name = "IsSpellBookItemInRange",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["IsSpellBookItemInRange"],
	funcPath = "C_SpellBook.IsSpellBookItemInRange",
	params = {
		{
			name = "spellBookItemSlotIndex",
			type = "luaIndex",
			default = nil,
			examples = { { value = "spellIdx", label = "Plater" } },
		},
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
		{ name = "targetUnit", type = "UnitToken", default = "player" },
	},
	returns = { { name = "inRange", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.IsSpellBookItemOffSpec"] = {
	key = "C_SpellBook.IsSpellBookItemOffSpec",
	name = "IsSpellBookItemOffSpec",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["IsSpellBookItemOffSpec"],
	funcPath = "C_SpellBook.IsSpellBookItemOffSpec",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "isOffSpec", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.IsSpellBookItemPassive"] = {
	key = "C_SpellBook.IsSpellBookItemPassive",
	name = "IsSpellBookItemPassive",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["IsSpellBookItemPassive"],
	funcPath = "C_SpellBook.IsSpellBookItemPassive",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "isPassive", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.IsSpellBookItemUsable"] = {
	key = "C_SpellBook.IsSpellBookItemUsable",
	name = "IsSpellBookItemUsable",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["IsSpellBookItemUsable"],
	funcPath = "C_SpellBook.IsSpellBookItemUsable",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = {
		{ name = "isUsable", type = "bool", canBeSecret = false },
		{ name = "insufficientPower", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.IsSpellInSpellBook"] = {
	key = "C_SpellBook.IsSpellInSpellBook",
	name = "IsSpellInSpellBook",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["IsSpellInSpellBook"],
	funcPath = "C_SpellBook.IsSpellInSpellBook",
	params = {
		{ name = "spellID", type = "number", default = nil, examples = { { value = "spellID", label = "Narcissus" } } },
		{ name = "spellBank", type = "SpellBookSpellBank", default = "Player" },
		{ name = "includeOverrides", type = "bool", default = true },
	},
	returns = { { name = "isInSpellBook", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.IsSpellKnown"] = {
	key = "C_SpellBook.IsSpellKnown",
	name = "IsSpellKnown",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["IsSpellKnown"],
	funcPath = "C_SpellBook.IsSpellKnown",
	params = {
		{
			name = "spellID",
			type = "number",
			default = nil,
			examples = {
				{ value = "spell", label = "WeakAuras" },
				{ value = "baseSpell", label = "WeakAuras" },
				{ value = "spell", label = "WeakAuras" },
			},
		},
		{ name = "spellBank", type = "SpellBookSpellBank", default = "Player" },
	},
	returns = { { name = "isKnown", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.IsSpellKnownOrInSpellBook"] = {
	key = "C_SpellBook.IsSpellKnownOrInSpellBook",
	name = "IsSpellKnownOrInSpellBook",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["IsSpellKnownOrInSpellBook"],
	funcPath = "C_SpellBook.IsSpellKnownOrInSpellBook",
	params = {
		{
			name = "spellID",
			type = "number",
			default = nil,
			examples = {
				{ value = "spellID", label = "BigWigs_Core" },
				{ value = "spell", label = "BigWigs_Core" },
				{ value = "spell", label = "BigWigs_Core" },
			},
		},
		{ name = "spellBank", type = "SpellBookSpellBank", default = "Player" },
		{ name = "includeOverrides", type = "bool", default = true },
	},
	returns = { { name = "isKnownOrInSpellBook", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.PickupSpellBookItem"] = {
	key = "C_SpellBook.PickupSpellBookItem",
	name = "PickupSpellBookItem",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["PickupSpellBookItem"],
	funcPath = "C_SpellBook.PickupSpellBookItem",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.SetSpellBookItemAutoCastEnabled"] = {
	key = "C_SpellBook.SetSpellBookItemAutoCastEnabled",
	name = "SetSpellBookItemAutoCastEnabled",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["SetSpellBookItemAutoCastEnabled"],
	funcPath = "C_SpellBook.SetSpellBookItemAutoCastEnabled",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
		{ name = "enabled", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.SpellBookItemHasRange"] = {
	key = "C_SpellBook.SpellBookItemHasRange",
	name = "SpellBookItemHasRange",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["SpellBookItemHasRange"],
	funcPath = "C_SpellBook.SpellBookItemHasRange",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "hasRange", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellBook.ToggleSpellBookItemAutoCast"] = {
	key = "C_SpellBook.ToggleSpellBookItemAutoCast",
	name = "ToggleSpellBookItemAutoCast",
	category = "combat_midnight",
	subcategory = "c_spellbook",
	func = _G["C_SpellBook"] and _G["C_SpellBook"]["ToggleSpellBookItemAutoCast"],
	funcPath = "C_SpellBook.ToggleSpellBookItemAutoCast",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

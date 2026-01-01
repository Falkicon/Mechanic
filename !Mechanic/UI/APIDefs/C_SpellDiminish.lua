-- Generated APIDefinitions for namespace: C_SpellDiminish
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SpellDiminish.GetAllSpellDiminishCategories"] = {
	key = "C_SpellDiminish.GetAllSpellDiminishCategories",
	name = "GetAllSpellDiminishCategories",
	category = "combat_midnight",
	subcategory = "c_spelldiminish",
	func = _G["C_SpellDiminish"] and _G["C_SpellDiminish"]["GetAllSpellDiminishCategories"],
	funcPath = "C_SpellDiminish.GetAllSpellDiminishCategories",
	params = { { name = "ruleset", type = "SpellDiminishRuleset", default = nil } },
	returns = { { name = "categories", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellDiminish.GetSpellDiminishCategoryInfo"] = {
	key = "C_SpellDiminish.GetSpellDiminishCategoryInfo",
	name = "GetSpellDiminishCategoryInfo",
	category = "combat_midnight",
	subcategory = "c_spelldiminish",
	func = _G["C_SpellDiminish"] and _G["C_SpellDiminish"]["GetSpellDiminishCategoryInfo"],
	funcPath = "C_SpellDiminish.GetSpellDiminishCategoryInfo",
	params = { { name = "category", type = "SpellDiminishCategory", default = nil } },
	returns = { { name = "categoryInfo", type = "SpellDiminishCategoryInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SpellDiminish.ShouldTrackSpellDiminishCategory"] = {
	key = "C_SpellDiminish.ShouldTrackSpellDiminishCategory",
	name = "ShouldTrackSpellDiminishCategory",
	category = "combat_midnight",
	subcategory = "c_spelldiminish",
	func = _G["C_SpellDiminish"] and _G["C_SpellDiminish"]["ShouldTrackSpellDiminishCategory"],
	funcPath = "C_SpellDiminish.ShouldTrackSpellDiminishCategory",
	params = {
		{ name = "category", type = "SpellDiminishCategory", default = nil },
		{ name = "ruleset", type = "SpellDiminishRuleset", default = nil },
	},
	returns = { { name = "isTracked", type = "bool", canBeSecret = true } },
	midnightImpact = "HIGH",
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretReturns",
}

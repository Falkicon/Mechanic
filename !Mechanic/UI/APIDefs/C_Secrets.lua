-- Generated APIDefinitions for namespace: C_Secrets
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Secrets.ShouldActionCooldownBeSecret"] = {
	key = "C_Secrets.ShouldActionCooldownBeSecret",
	name = "ShouldActionCooldownBeSecret",
	category = "combat_midnight",
	subcategory = "c_secrets",
	func = _G["C_Secrets"] and _G["C_Secrets"]["ShouldActionCooldownBeSecret"],
	funcPath = "C_Secrets.ShouldActionCooldownBeSecret",
	params = { { name = "actionID", type = "luaIndex", default = nil } },
	returns = { { name = "isCooldownSecret", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldSpellAuraBeSecret"] = {
	key = "C_Secrets.ShouldSpellAuraBeSecret",
	name = "ShouldSpellAuraBeSecret",
	category = "combat_midnight",
	subcategory = "c_secrets",
	func = _G["C_Secrets"] and _G["C_Secrets"]["ShouldSpellAuraBeSecret"],
	funcPath = "C_Secrets.ShouldSpellAuraBeSecret",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "isAuraSecret", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldSpellBookItemCooldownBeSecret"] = {
	key = "C_Secrets.ShouldSpellBookItemCooldownBeSecret",
	name = "ShouldSpellBookItemCooldownBeSecret",
	category = "combat_midnight",
	subcategory = "c_secrets",
	func = _G["C_Secrets"] and _G["C_Secrets"]["ShouldSpellBookItemCooldownBeSecret"],
	funcPath = "C_Secrets.ShouldSpellBookItemCooldownBeSecret",
	params = {
		{ name = "spellBookItemSlotIndex", type = "luaIndex", default = nil },
		{ name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil },
	},
	returns = { { name = "isCooldownSecret", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldSpellCooldownBeSecret"] = {
	key = "C_Secrets.ShouldSpellCooldownBeSecret",
	name = "ShouldSpellCooldownBeSecret",
	category = "combat_midnight",
	subcategory = "c_secrets",
	func = _G["C_Secrets"] and _G["C_Secrets"]["ShouldSpellCooldownBeSecret"],
	funcPath = "C_Secrets.ShouldSpellCooldownBeSecret",
	params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
	returns = { { name = "isCooldownSecret", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitAuraIndexBeSecret"] = {
	key = "C_Secrets.ShouldUnitAuraIndexBeSecret",
	name = "ShouldUnitAuraIndexBeSecret",
	category = "combat_midnight",
	subcategory = "c_secrets",
	func = _G["C_Secrets"] and _G["C_Secrets"]["ShouldUnitAuraIndexBeSecret"],
	funcPath = "C_Secrets.ShouldUnitAuraIndexBeSecret",
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "index", type = "luaIndex", default = nil },
		{ name = "filter", type = "AuraFilters", default = nil },
	},
	returns = { { name = "isAuraSecret", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitAuraInstanceBeSecret"] = {
	key = "C_Secrets.ShouldUnitAuraInstanceBeSecret",
	name = "ShouldUnitAuraInstanceBeSecret",
	category = "combat_midnight",
	subcategory = "c_secrets",
	func = _G["C_Secrets"] and _G["C_Secrets"]["ShouldUnitAuraInstanceBeSecret"],
	funcPath = "C_Secrets.ShouldUnitAuraInstanceBeSecret",
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "auraInstanceID", type = "number", default = nil },
	},
	returns = { { name = "isAuraSecret", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitAuraSlotBeSecret"] = {
	key = "C_Secrets.ShouldUnitAuraSlotBeSecret",
	name = "ShouldUnitAuraSlotBeSecret",
	category = "combat_midnight",
	subcategory = "c_secrets",
	func = _G["C_Secrets"] and _G["C_Secrets"]["ShouldUnitAuraSlotBeSecret"],
	funcPath = "C_Secrets.ShouldUnitAuraSlotBeSecret",
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "slot", type = "number", default = nil },
	},
	returns = { { name = "isAuraSecret", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitComparisonBeSecret"] = {
	key = "C_Secrets.ShouldUnitComparisonBeSecret",
	name = "ShouldUnitComparisonBeSecret",
	category = "combat_midnight",
	subcategory = "c_secrets",
	func = _G["C_Secrets"] and _G["C_Secrets"]["ShouldUnitComparisonBeSecret"],
	funcPath = "C_Secrets.ShouldUnitComparisonBeSecret",
	params = {
		{ name = "unit1", type = "UnitToken", default = "player" },
		{ name = "unit2", type = "UnitToken", default = "player" },
	},
	returns = { { name = "isUnitComparisonSecret", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitIdentityBeSecret"] = {
	key = "C_Secrets.ShouldUnitIdentityBeSecret",
	name = "ShouldUnitIdentityBeSecret",
	category = "combat_midnight",
	subcategory = "c_secrets",
	func = _G["C_Secrets"] and _G["C_Secrets"]["ShouldUnitIdentityBeSecret"],
	funcPath = "C_Secrets.ShouldUnitIdentityBeSecret",
	params = { { name = "unit", type = "UnitToken", default = "player" } },
	returns = { { name = "isUnitIdentitySecret", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitPowerBeSecret"] = {
	key = "C_Secrets.ShouldUnitPowerBeSecret",
	name = "ShouldUnitPowerBeSecret",
	category = "combat_midnight",
	subcategory = "c_secrets",
	func = _G["C_Secrets"] and _G["C_Secrets"]["ShouldUnitPowerBeSecret"],
	funcPath = "C_Secrets.ShouldUnitPowerBeSecret",
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "powerType", type = "PowerType", default = nil },
	},
	returns = { { name = "isUnitPowerSecret", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitPowerMaxBeSecret"] = {
	key = "C_Secrets.ShouldUnitPowerMaxBeSecret",
	name = "ShouldUnitPowerMaxBeSecret",
	category = "combat_midnight",
	subcategory = "c_secrets",
	func = _G["C_Secrets"] and _G["C_Secrets"]["ShouldUnitPowerMaxBeSecret"],
	funcPath = "C_Secrets.ShouldUnitPowerMaxBeSecret",
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "powerType", type = "PowerType", default = nil },
	},
	returns = { { name = "isUnitPowerMaxSecret", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitSpellCastBeSecret"] = {
	key = "C_Secrets.ShouldUnitSpellCastBeSecret",
	name = "ShouldUnitSpellCastBeSecret",
	category = "combat_midnight",
	subcategory = "c_secrets",
	func = _G["C_Secrets"] and _G["C_Secrets"]["ShouldUnitSpellCastBeSecret"],
	funcPath = "C_Secrets.ShouldUnitSpellCastBeSecret",
	params = {
		{ name = "unit", type = "UnitToken", default = "player" },
		{ name = "spellIdentifier", type = "SpellIdentifier", default = nil },
	},
	returns = { { name = "isSpellCastSecret", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitSpellCastingBeSecret"] = {
	key = "C_Secrets.ShouldUnitSpellCastingBeSecret",
	name = "ShouldUnitSpellCastingBeSecret",
	category = "combat_midnight",
	subcategory = "c_secrets",
	func = _G["C_Secrets"] and _G["C_Secrets"]["ShouldUnitSpellCastingBeSecret"],
	funcPath = "C_Secrets.ShouldUnitSpellCastingBeSecret",
	params = { { name = "unit", type = "UnitToken", default = "player" } },
	returns = { { name = "isSpellCastingSecret", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

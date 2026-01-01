-- Generated APIDefinitions for namespace: C_IncomingSummon
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_IncomingSummon.HasIncomingSummon"] = {
	key = "C_IncomingSummon.HasIncomingSummon",
	name = "HasIncomingSummon",
	category = "combat_midnight",
	subcategory = "c_incomingsummon",
	func = _G["C_IncomingSummon"] and _G["C_IncomingSummon"]["HasIncomingSummon"],
	funcPath = "C_IncomingSummon.HasIncomingSummon",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "WeakAuras" } },
		},
	},
	returns = { { name = "summon", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_IncomingSummon.IncomingSummonStatus"] = {
	key = "C_IncomingSummon.IncomingSummonStatus",
	name = "IncomingSummonStatus",
	category = "combat_midnight",
	subcategory = "c_incomingsummon",
	func = _G["C_IncomingSummon"] and _G["C_IncomingSummon"]["IncomingSummonStatus"],
	funcPath = "C_IncomingSummon.IncomingSummonStatus",
	params = {
		{
			name = "unit",
			type = "UnitToken",
			default = "player",
			examples = { { value = "unit", label = "DandersFrames" } },
		},
	},
	returns = { { name = "status", type = "SummonStatus", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

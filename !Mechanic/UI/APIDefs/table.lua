-- Generated APIDefinitions for namespace: table
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["table.count"] = {
	key = "table.count",
	name = "count",
	category = "combat_midnight",
	subcategory = "table",
	func = _G["table"] and _G["table"]["count"],
	funcPath = "table.count",
	params = {
		{
			name = "table",
			type = "LuaValueReference",
			default = nil,
			examples = {
				{ value = "not typical 3", label = "DBM-Party-Legion" },
				{ value = "combatDataString", label = "Details" },
			},
		},
	},
	returns = {
		{ name = "numTableNodes", type = "number", canBeSecret = false },
		{ name = "numArrayNodes", type = "number", canBeSecret = false },
		{ name = "maxArrayIndex", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["table.create"] = {
	key = "table.create",
	name = "create",
	category = "combat_midnight",
	subcategory = "table",
	func = _G["table"] and _G["table"]["create"],
	funcPath = "table.create",
	params = {
		{
			name = "arraySizeHint",
			type = "number",
			default = nil,
			examples = {
				{ value = "region", label = "WeakAuras" },
				{ value = "region", label = "WeakAuras" },
				{ value = "region", label = "WeakAuras" },
			},
		},
		{ name = "nodeSizeHint", type = "number", default = 0 },
	},
	returns = { { name = "table", type = "LuaValueReference", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

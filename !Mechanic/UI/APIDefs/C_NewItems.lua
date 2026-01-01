-- Generated APIDefinitions for namespace: C_NewItems
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_NewItems.IsNewItem"] = {
	key = "C_NewItems.IsNewItem",
	name = "IsNewItem",
	category = "combat_midnight",
	subcategory = "c_newitems",
	func = _G["C_NewItems"] and _G["C_NewItems"]["IsNewItem"],
	funcPath = "C_NewItems.IsNewItem",
	params = {
		{ name = "containerIndex", type = "BagIndex", default = nil },
		{ name = "slotIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "isNew", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NewItems.RemoveNewItem"] = {
	key = "C_NewItems.RemoveNewItem",
	name = "RemoveNewItem",
	category = "combat_midnight",
	subcategory = "c_newitems",
	func = _G["C_NewItems"] and _G["C_NewItems"]["RemoveNewItem"],
	funcPath = "C_NewItems.RemoveNewItem",
	params = {
		{ name = "containerIndex", type = "BagIndex", default = nil },
		{ name = "slotIndex", type = "luaIndex", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

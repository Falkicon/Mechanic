-- Generated APIDefinitions for namespace: C_ItemInteraction
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ItemInteraction.GetItemConversionCurrencyCost"] = {
	key = "C_ItemInteraction.GetItemConversionCurrencyCost",
	name = "GetItemConversionCurrencyCost",
	category = "combat_midnight",
	subcategory = "c_iteminteraction",
	func = _G["C_ItemInteraction"] and _G["C_ItemInteraction"]["GetItemConversionCurrencyCost"],
	funcPath = "C_ItemInteraction.GetItemConversionCurrencyCost",
	params = { { name = "item", type = "ItemLocation", default = nil } },
	returns = { { name = "conversionCost", type = "ConversionCurrencyCost", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemInteraction.SetPendingItem"] = {
	key = "C_ItemInteraction.SetPendingItem",
	name = "SetPendingItem",
	category = "combat_midnight",
	subcategory = "c_iteminteraction",
	func = _G["C_ItemInteraction"] and _G["C_ItemInteraction"]["SetPendingItem"],
	funcPath = "C_ItemInteraction.SetPendingItem",
	params = { { name = "item", type = "ItemLocation", default = nil } },
	returns = { { name = "success", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

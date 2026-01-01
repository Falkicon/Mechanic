-- Generated APIDefinitions for namespace: C_StorePublic
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_StorePublic.DoesGroupHavePurchaseableProducts"] = {
	key = "C_StorePublic.DoesGroupHavePurchaseableProducts",
	name = "DoesGroupHavePurchaseableProducts",
	category = "combat_midnight",
	subcategory = "c_storepublic",
	func = _G["C_StorePublic"] and _G["C_StorePublic"]["DoesGroupHavePurchaseableProducts"],
	funcPath = "C_StorePublic.DoesGroupHavePurchaseableProducts",
	params = { { name = "groupID", type = "number", default = nil } },
	returns = { { name = "hasPurchaseableProducts", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_StorePublic.EventStoreUISetShown"] = {
	key = "C_StorePublic.EventStoreUISetShown",
	name = "EventStoreUISetShown",
	category = "combat_midnight",
	subcategory = "c_storepublic",
	func = _G["C_StorePublic"] and _G["C_StorePublic"]["EventStoreUISetShown"],
	funcPath = "C_StorePublic.EventStoreUISetShown",
	params = {
		{ name = "newShown", type = "bool", default = nil },
		{ name = "contextKey", type = "string", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

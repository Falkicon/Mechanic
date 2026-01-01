-- Generated APIDefinitions for namespace: C_CraftingOrders
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CraftingOrders.CalculateCraftingOrderPostingFee"] = {
	key = "C_CraftingOrders.CalculateCraftingOrderPostingFee",
	name = "CalculateCraftingOrderPostingFee",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["CalculateCraftingOrderPostingFee"],
	funcPath = "C_CraftingOrders.CalculateCraftingOrderPostingFee",
	params = {
		{ name = "skillLineAbilityID", type = "number", default = nil },
		{ name = "orderType", type = "CraftingOrderType", default = nil },
		{ name = "orderDuration", type = "CraftingOrderDuration", default = nil },
	},
	returns = { { name = "deposit", type = "WOWMONEY", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.CanOrderSkillAbility"] = {
	key = "C_CraftingOrders.CanOrderSkillAbility",
	name = "CanOrderSkillAbility",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["CanOrderSkillAbility"],
	funcPath = "C_CraftingOrders.CanOrderSkillAbility",
	params = { { name = "skillLineAbilityID", type = "number", default = nil } },
	returns = { { name = "canOrder", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.CancelOrder"] = {
	key = "C_CraftingOrders.CancelOrder",
	name = "CancelOrder",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["CancelOrder"],
	funcPath = "C_CraftingOrders.CancelOrder",
	params = { { name = "orderID", type = "BigUInteger", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.ClaimOrder"] = {
	key = "C_CraftingOrders.ClaimOrder",
	name = "ClaimOrder",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["ClaimOrder"],
	funcPath = "C_CraftingOrders.ClaimOrder",
	params = {
		{ name = "orderID", type = "BigUInteger", default = nil },
		{ name = "profession", type = "Profession", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.FulfillOrder"] = {
	key = "C_CraftingOrders.FulfillOrder",
	name = "FulfillOrder",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["FulfillOrder"],
	funcPath = "C_CraftingOrders.FulfillOrder",
	params = {
		{ name = "orderID", type = "BigUInteger", default = nil },
		{ name = "crafterNote", type = "string", default = nil },
		{ name = "profession", type = "Profession", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.GetCustomerOptions"] = {
	key = "C_CraftingOrders.GetCustomerOptions",
	name = "GetCustomerOptions",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["GetCustomerOptions"],
	funcPath = "C_CraftingOrders.GetCustomerOptions",
	params = { { name = "params", type = "CraftingOrderCustomerSearchParams", default = nil } },
	returns = { { name = "results", type = "CraftingOrderCustomerSearchResults", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.GetOrderClaimInfo"] = {
	key = "C_CraftingOrders.GetOrderClaimInfo",
	name = "GetOrderClaimInfo",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["GetOrderClaimInfo"],
	funcPath = "C_CraftingOrders.GetOrderClaimInfo",
	params = { { name = "profession", type = "Profession", default = nil } },
	returns = { { name = "claimInfo", type = "CraftingOrderClaimsRemainingInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.IsCustomerOptionFavorited"] = {
	key = "C_CraftingOrders.IsCustomerOptionFavorited",
	name = "IsCustomerOptionFavorited",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["IsCustomerOptionFavorited"],
	funcPath = "C_CraftingOrders.IsCustomerOptionFavorited",
	params = { { name = "recipeID", type = "number", default = nil } },
	returns = { { name = "favorited", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.ListMyOrders"] = {
	key = "C_CraftingOrders.ListMyOrders",
	name = "ListMyOrders",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["ListMyOrders"],
	funcPath = "C_CraftingOrders.ListMyOrders",
	params = { { name = "request", type = "CraftingOrderRequestMyOrdersInfo", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.OrderCanBeRecrafted"] = {
	key = "C_CraftingOrders.OrderCanBeRecrafted",
	name = "OrderCanBeRecrafted",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["OrderCanBeRecrafted"],
	funcPath = "C_CraftingOrders.OrderCanBeRecrafted",
	params = { { name = "orderID", type = "BigUInteger", default = nil } },
	returns = { { name = "recraftable", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.PlaceNewOrder"] = {
	key = "C_CraftingOrders.PlaceNewOrder",
	name = "PlaceNewOrder",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["PlaceNewOrder"],
	funcPath = "C_CraftingOrders.PlaceNewOrder",
	params = { { name = "orderInfo", type = "NewCraftingOrderInfo", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.RejectOrder"] = {
	key = "C_CraftingOrders.RejectOrder",
	name = "RejectOrder",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["RejectOrder"],
	funcPath = "C_CraftingOrders.RejectOrder",
	params = {
		{ name = "orderID", type = "BigUInteger", default = nil },
		{ name = "crafterNote", type = "string", default = nil },
		{ name = "profession", type = "Profession", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.ReleaseOrder"] = {
	key = "C_CraftingOrders.ReleaseOrder",
	name = "ReleaseOrder",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["ReleaseOrder"],
	funcPath = "C_CraftingOrders.ReleaseOrder",
	params = {
		{ name = "orderID", type = "BigUInteger", default = nil },
		{ name = "profession", type = "Profession", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.RequestCrafterOrders"] = {
	key = "C_CraftingOrders.RequestCrafterOrders",
	name = "RequestCrafterOrders",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["RequestCrafterOrders"],
	funcPath = "C_CraftingOrders.RequestCrafterOrders",
	params = { { name = "request", type = "CraftingOrderRequestInfo", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.RequestCustomerOrders"] = {
	key = "C_CraftingOrders.RequestCustomerOrders",
	name = "RequestCustomerOrders",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["RequestCustomerOrders"],
	funcPath = "C_CraftingOrders.RequestCustomerOrders",
	params = { { name = "request", type = "CraftingOrderRequestInfo", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.SetCustomerOptionFavorited"] = {
	key = "C_CraftingOrders.SetCustomerOptionFavorited",
	name = "SetCustomerOptionFavorited",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["SetCustomerOptionFavorited"],
	funcPath = "C_CraftingOrders.SetCustomerOptionFavorited",
	params = {
		{ name = "recipeID", type = "number", default = nil },
		{ name = "favorited", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.SkillLineHasOrders"] = {
	key = "C_CraftingOrders.SkillLineHasOrders",
	name = "SkillLineHasOrders",
	category = "combat_midnight",
	subcategory = "c_craftingorders",
	func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["SkillLineHasOrders"],
	funcPath = "C_CraftingOrders.SkillLineHasOrders",
	params = { { name = "skillLineID", type = "number", default = nil } },
	returns = { { name = "hasOrders", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

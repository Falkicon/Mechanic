-- Generated APIDefinitions for namespace: C_CraftingOrders
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_CraftingOrders.AreOrderNotesDisabled"] = {
    key = "C_CraftingOrders.AreOrderNotesDisabled",
    name = "AreOrderNotesDisabled",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["AreOrderNotesDisabled"],
    funcPath = "C_CraftingOrders.AreOrderNotesDisabled",
    params = {  },
    returns = { { name = "areNotesDisabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CraftingOrders.CalculateCraftingOrderPostingFee"] = {
    key = "C_CraftingOrders.CalculateCraftingOrderPostingFee",
    name = "CalculateCraftingOrderPostingFee",
    category = "combat_midnight",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["CalculateCraftingOrderPostingFee"],
    funcPath = "C_CraftingOrders.CalculateCraftingOrderPostingFee",
    params = { { name = "skillLineAbilityID", type = "number", default = nil }, { name = "orderType", type = "CraftingOrderType", default = nil }, { name = "orderDuration", type = "CraftingOrderDuration", default = nil } },
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
    returns = {  },
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
    params = { { name = "orderID", type = "BigUInteger", default = nil }, { name = "profession", type = "Profession", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.CloseCrafterCraftingOrders"] = {
    key = "C_CraftingOrders.CloseCrafterCraftingOrders",
    name = "CloseCrafterCraftingOrders",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["CloseCrafterCraftingOrders"],
    funcPath = "C_CraftingOrders.CloseCrafterCraftingOrders",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_CraftingOrders.CloseCustomerCraftingOrders"] = {
    key = "C_CraftingOrders.CloseCustomerCraftingOrders",
    name = "CloseCustomerCraftingOrders",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["CloseCustomerCraftingOrders"],
    funcPath = "C_CraftingOrders.CloseCustomerCraftingOrders",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_CraftingOrders.FulfillOrder"] = {
    key = "C_CraftingOrders.FulfillOrder",
    name = "FulfillOrder",
    category = "combat_midnight",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["FulfillOrder"],
    funcPath = "C_CraftingOrders.FulfillOrder",
    params = { { name = "orderID", type = "BigUInteger", default = nil }, { name = "crafterNote", type = "string", default = nil }, { name = "profession", type = "Profession", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.GetClaimedOrder"] = {
    key = "C_CraftingOrders.GetClaimedOrder",
    name = "GetClaimedOrder",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["GetClaimedOrder"],
    funcPath = "C_CraftingOrders.GetClaimedOrder",
    params = {  },
    returns = { { name = "order", type = "CraftingOrderInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CraftingOrders.GetCrafterBuckets"] = {
    key = "C_CraftingOrders.GetCrafterBuckets",
    name = "GetCrafterBuckets",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["GetCrafterBuckets"],
    funcPath = "C_CraftingOrders.GetCrafterBuckets",
    params = {  },
    returns = { { name = "buckets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CraftingOrders.GetCrafterOrders"] = {
    key = "C_CraftingOrders.GetCrafterOrders",
    name = "GetCrafterOrders",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["GetCrafterOrders"],
    funcPath = "C_CraftingOrders.GetCrafterOrders",
    params = {  },
    returns = { { name = "orders", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CraftingOrders.GetCraftingOrderTime"] = {
    key = "C_CraftingOrders.GetCraftingOrderTime",
    name = "GetCraftingOrderTime",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["GetCraftingOrderTime"],
    funcPath = "C_CraftingOrders.GetCraftingOrderTime",
    params = {  },
    returns = { { name = "time", type = "BigUInteger", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CraftingOrders.GetCustomerCategories"] = {
    key = "C_CraftingOrders.GetCustomerCategories",
    name = "GetCustomerCategories",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["GetCustomerCategories"],
    funcPath = "C_CraftingOrders.GetCustomerCategories",
    params = {  },
    returns = { { name = "categories", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["C_CraftingOrders.GetCustomerOrders"] = {
    key = "C_CraftingOrders.GetCustomerOrders",
    name = "GetCustomerOrders",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["GetCustomerOrders"],
    funcPath = "C_CraftingOrders.GetCustomerOrders",
    params = {  },
    returns = { { name = "customerOrders", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CraftingOrders.GetDefaultOrdersSkillLine"] = {
    key = "C_CraftingOrders.GetDefaultOrdersSkillLine",
    name = "GetDefaultOrdersSkillLine",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["GetDefaultOrdersSkillLine"],
    funcPath = "C_CraftingOrders.GetDefaultOrdersSkillLine",
    params = {  },
    returns = { { name = "skillLineID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CraftingOrders.GetMyOrders"] = {
    key = "C_CraftingOrders.GetMyOrders",
    name = "GetMyOrders",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["GetMyOrders"],
    funcPath = "C_CraftingOrders.GetMyOrders",
    params = {  },
    returns = { { name = "myOrders", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CraftingOrders.GetNumFavoriteCustomerOptions"] = {
    key = "C_CraftingOrders.GetNumFavoriteCustomerOptions",
    name = "GetNumFavoriteCustomerOptions",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["GetNumFavoriteCustomerOptions"],
    funcPath = "C_CraftingOrders.GetNumFavoriteCustomerOptions",
    params = {  },
    returns = { { name = "numFavorites", type = "BigUInteger", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["C_CraftingOrders.GetPersonalOrdersInfo"] = {
    key = "C_CraftingOrders.GetPersonalOrdersInfo",
    name = "GetPersonalOrdersInfo",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["GetPersonalOrdersInfo"],
    funcPath = "C_CraftingOrders.GetPersonalOrdersInfo",
    params = {  },
    returns = { { name = "infos", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_CraftingOrders.HasFavoriteCustomerOptions"] = {
    key = "C_CraftingOrders.HasFavoriteCustomerOptions",
    name = "HasFavoriteCustomerOptions",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["HasFavoriteCustomerOptions"],
    funcPath = "C_CraftingOrders.HasFavoriteCustomerOptions",
    params = {  },
    returns = { { name = "hasFavorites", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
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
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.OpenCrafterCraftingOrders"] = {
    key = "C_CraftingOrders.OpenCrafterCraftingOrders",
    name = "OpenCrafterCraftingOrders",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["OpenCrafterCraftingOrders"],
    funcPath = "C_CraftingOrders.OpenCrafterCraftingOrders",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_CraftingOrders.OpenCustomerCraftingOrders"] = {
    key = "C_CraftingOrders.OpenCustomerCraftingOrders",
    name = "OpenCustomerCraftingOrders",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["OpenCustomerCraftingOrders"],
    funcPath = "C_CraftingOrders.OpenCustomerCraftingOrders",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
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

APIDefs["C_CraftingOrders.ParseCustomerOptions"] = {
    key = "C_CraftingOrders.ParseCustomerOptions",
    name = "ParseCustomerOptions",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["ParseCustomerOptions"],
    funcPath = "C_CraftingOrders.ParseCustomerOptions",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_CraftingOrders.PlaceNewOrder"] = {
    key = "C_CraftingOrders.PlaceNewOrder",
    name = "PlaceNewOrder",
    category = "combat_midnight",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["PlaceNewOrder"],
    funcPath = "C_CraftingOrders.PlaceNewOrder",
    params = { { name = "orderInfo", type = "NewCraftingOrderInfo", default = nil } },
    returns = {  },
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
    params = { { name = "orderID", type = "BigUInteger", default = nil }, { name = "crafterNote", type = "string", default = nil }, { name = "profession", type = "Profession", default = nil } },
    returns = {  },
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
    params = { { name = "orderID", type = "BigUInteger", default = nil }, { name = "profession", type = "Profession", default = nil } },
    returns = {  },
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
    returns = {  },
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
    returns = {  },
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
    params = { { name = "recipeID", type = "number", default = nil }, { name = "favorited", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_CraftingOrders.ShouldShowCraftingOrderTab"] = {
    key = "C_CraftingOrders.ShouldShowCraftingOrderTab",
    name = "ShouldShowCraftingOrderTab",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["ShouldShowCraftingOrderTab"],
    funcPath = "C_CraftingOrders.ShouldShowCraftingOrderTab",
    params = {  },
    returns = { { name = "showTab", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
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

APIDefs["C_CraftingOrders.UpdateIgnoreList"] = {
    key = "C_CraftingOrders.UpdateIgnoreList",
    name = "UpdateIgnoreList",
    category = "profession",
    subcategory = "c_craftingorders",
    func = _G["C_CraftingOrders"] and _G["C_CraftingOrders"]["UpdateIgnoreList"],
    funcPath = "C_CraftingOrders.UpdateIgnoreList",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

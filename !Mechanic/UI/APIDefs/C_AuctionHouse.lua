-- Generated APIDefinitions for namespace: C_AuctionHouse
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AuctionHouse.CalculateCommodityDeposit"] = {
	key = "C_AuctionHouse.CalculateCommodityDeposit",
	name = "CalculateCommodityDeposit",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["CalculateCommodityDeposit"],
	funcPath = "C_AuctionHouse.CalculateCommodityDeposit",
	params = {
		{ name = "itemID", type = "number", default = nil },
		{ name = "duration", type = "luaIndex", default = nil },
		{ name = "quantity", type = "number", default = nil },
	},
	returns = { { name = "depositCost", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.CalculateItemDeposit"] = {
	key = "C_AuctionHouse.CalculateItemDeposit",
	name = "CalculateItemDeposit",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["CalculateItemDeposit"],
	funcPath = "C_AuctionHouse.CalculateItemDeposit",
	params = {
		{ name = "item", type = "ItemLocation", default = nil },
		{ name = "duration", type = "luaIndex", default = nil },
		{ name = "quantity", type = "number", default = nil },
	},
	returns = { { name = "depositCost", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.CanCancelAuction"] = {
	key = "C_AuctionHouse.CanCancelAuction",
	name = "CanCancelAuction",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["CanCancelAuction"],
	funcPath = "C_AuctionHouse.CanCancelAuction",
	params = { { name = "ownedAuctionID", type = "number", default = nil } },
	returns = { { name = "canCancelAuction", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.CancelAuction"] = {
	key = "C_AuctionHouse.CancelAuction",
	name = "CancelAuction",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["CancelAuction"],
	funcPath = "C_AuctionHouse.CancelAuction",
	params = { { name = "ownedAuctionID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.ConfirmCommoditiesPurchase"] = {
	key = "C_AuctionHouse.ConfirmCommoditiesPurchase",
	name = "ConfirmCommoditiesPurchase",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["ConfirmCommoditiesPurchase"],
	funcPath = "C_AuctionHouse.ConfirmCommoditiesPurchase",
	params = {
		{ name = "itemID", type = "number", default = nil },
		{ name = "quantity", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.ConfirmPostCommodity"] = {
	key = "C_AuctionHouse.ConfirmPostCommodity",
	name = "ConfirmPostCommodity",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["ConfirmPostCommodity"],
	funcPath = "C_AuctionHouse.ConfirmPostCommodity",
	params = {
		{ name = "item", type = "ItemLocation", default = nil },
		{ name = "duration", type = "luaIndex", default = nil },
		{ name = "quantity", type = "number", default = nil },
		{ name = "unitPrice", type = "BigUInteger", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.ConfirmPostItem"] = {
	key = "C_AuctionHouse.ConfirmPostItem",
	name = "ConfirmPostItem",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["ConfirmPostItem"],
	funcPath = "C_AuctionHouse.ConfirmPostItem",
	params = {
		{ name = "item", type = "ItemLocation", default = nil },
		{ name = "duration", type = "luaIndex", default = nil },
		{ name = "quantity", type = "number", default = nil },
		{ name = "bid", type = "BigUInteger", default = nil },
		{ name = "buyout", type = "BigUInteger", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetAuctionInfoByID"] = {
	key = "C_AuctionHouse.GetAuctionInfoByID",
	name = "GetAuctionInfoByID",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetAuctionInfoByID"],
	funcPath = "C_AuctionHouse.GetAuctionInfoByID",
	params = { { name = "auctionID", type = "number", default = nil } },
	returns = { { name = "priceInfo", type = "AuctionInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetAuctionItemSubClasses"] = {
	key = "C_AuctionHouse.GetAuctionItemSubClasses",
	name = "GetAuctionItemSubClasses",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetAuctionItemSubClasses"],
	funcPath = "C_AuctionHouse.GetAuctionItemSubClasses",
	params = { { name = "classID", type = "number", default = nil } },
	returns = { { name = "subClasses", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetAvailablePostCount"] = {
	key = "C_AuctionHouse.GetAvailablePostCount",
	name = "GetAvailablePostCount",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetAvailablePostCount"],
	funcPath = "C_AuctionHouse.GetAvailablePostCount",
	params = { { name = "item", type = "ItemLocation", default = nil } },
	returns = { { name = "listCount", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetBidInfo"] = {
	key = "C_AuctionHouse.GetBidInfo",
	name = "GetBidInfo",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetBidInfo"],
	funcPath = "C_AuctionHouse.GetBidInfo",
	params = { { name = "bidIndex", type = "luaIndex", default = nil } },
	returns = { { name = "bid", type = "BidInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetBidType"] = {
	key = "C_AuctionHouse.GetBidType",
	name = "GetBidType",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetBidType"],
	funcPath = "C_AuctionHouse.GetBidType",
	params = { { name = "bidTypeIndex", type = "luaIndex", default = nil } },
	returns = { { name = "typeItemKey", type = "ItemKey", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetCancelCost"] = {
	key = "C_AuctionHouse.GetCancelCost",
	name = "GetCancelCost",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetCancelCost"],
	funcPath = "C_AuctionHouse.GetCancelCost",
	params = { { name = "ownedAuctionID", type = "number", default = nil } },
	returns = { { name = "cancelCost", type = "BigUInteger", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetCommoditySearchResultInfo"] = {
	key = "C_AuctionHouse.GetCommoditySearchResultInfo",
	name = "GetCommoditySearchResultInfo",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetCommoditySearchResultInfo"],
	funcPath = "C_AuctionHouse.GetCommoditySearchResultInfo",
	params = {
		{ name = "itemID", type = "number", default = nil, examples = { { value = "itemID", label = "Auctionator" } } },
		{ name = "commoditySearchResultIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "result", type = "CommoditySearchResultInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetCommoditySearchResultsQuantity"] = {
	key = "C_AuctionHouse.GetCommoditySearchResultsQuantity",
	name = "GetCommoditySearchResultsQuantity",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetCommoditySearchResultsQuantity"],
	funcPath = "C_AuctionHouse.GetCommoditySearchResultsQuantity",
	params = { { name = "itemID", type = "number", default = nil } },
	returns = { { name = "totalQuantity", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetExtraBrowseInfo"] = {
	key = "C_AuctionHouse.GetExtraBrowseInfo",
	name = "GetExtraBrowseInfo",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetExtraBrowseInfo"],
	funcPath = "C_AuctionHouse.GetExtraBrowseInfo",
	params = { { name = "itemKey", type = "ItemKey", default = nil } },
	returns = { { name = "extraInfo", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetItemCommodityStatus"] = {
	key = "C_AuctionHouse.GetItemCommodityStatus",
	name = "GetItemCommodityStatus",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetItemCommodityStatus"],
	funcPath = "C_AuctionHouse.GetItemCommodityStatus",
	params = { { name = "item", type = "ItemLocation", default = nil } },
	returns = { { name = "isCommodity", type = "ItemCommodityStatus", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetItemKeyFromItem"] = {
	key = "C_AuctionHouse.GetItemKeyFromItem",
	name = "GetItemKeyFromItem",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetItemKeyFromItem"],
	funcPath = "C_AuctionHouse.GetItemKeyFromItem",
	params = { { name = "item", type = "ItemLocation", default = nil } },
	returns = { { name = "itemKey", type = "ItemKey", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetItemKeyInfo"] = {
	key = "C_AuctionHouse.GetItemKeyInfo",
	name = "GetItemKeyInfo",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetItemKeyInfo"],
	funcPath = "C_AuctionHouse.GetItemKeyInfo",
	params = {
		{
			name = "itemKey",
			type = "ItemKey",
			default = nil,
			examples = { { value = "info.itemKey", label = "Auctionator" } },
		},
		{ name = "restrictQualityToFilter", type = "bool", default = false },
	},
	returns = { { name = "itemKeyInfo", type = "ItemKeyInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetItemKeyRequiredLevel"] = {
	key = "C_AuctionHouse.GetItemKeyRequiredLevel",
	name = "GetItemKeyRequiredLevel",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetItemKeyRequiredLevel"],
	funcPath = "C_AuctionHouse.GetItemKeyRequiredLevel",
	params = { { name = "itemKey", type = "ItemKey", default = nil } },
	returns = { { name = "requiredLevel", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetItemSearchResultInfo"] = {
	key = "C_AuctionHouse.GetItemSearchResultInfo",
	name = "GetItemSearchResultInfo",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetItemSearchResultInfo"],
	funcPath = "C_AuctionHouse.GetItemSearchResultInfo",
	params = {
		{
			name = "itemKey",
			type = "ItemKey",
			default = nil,
			examples = { { value = "itemKey", label = "AllTheThings" }, { value = "itemKey", label = "Auctionator" } },
		},
		{ name = "itemSearchResultIndex", type = "luaIndex", default = nil },
	},
	returns = { { name = "result", type = "ItemSearchResultInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetItemSearchResultsQuantity"] = {
	key = "C_AuctionHouse.GetItemSearchResultsQuantity",
	name = "GetItemSearchResultsQuantity",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetItemSearchResultsQuantity"],
	funcPath = "C_AuctionHouse.GetItemSearchResultsQuantity",
	params = { { name = "itemKey", type = "ItemKey", default = nil } },
	returns = { { name = "totalQuantity", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetMaxCommoditySearchResultPrice"] = {
	key = "C_AuctionHouse.GetMaxCommoditySearchResultPrice",
	name = "GetMaxCommoditySearchResultPrice",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetMaxCommoditySearchResultPrice"],
	funcPath = "C_AuctionHouse.GetMaxCommoditySearchResultPrice",
	params = { { name = "itemID", type = "number", default = nil } },
	returns = { { name = "maxUnitPrice", type = "BigUInteger", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetMaxItemSearchResultBid"] = {
	key = "C_AuctionHouse.GetMaxItemSearchResultBid",
	name = "GetMaxItemSearchResultBid",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetMaxItemSearchResultBid"],
	funcPath = "C_AuctionHouse.GetMaxItemSearchResultBid",
	params = { { name = "itemKey", type = "ItemKey", default = nil } },
	returns = { { name = "maxBid", type = "BigUInteger", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetMaxItemSearchResultBuyout"] = {
	key = "C_AuctionHouse.GetMaxItemSearchResultBuyout",
	name = "GetMaxItemSearchResultBuyout",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetMaxItemSearchResultBuyout"],
	funcPath = "C_AuctionHouse.GetMaxItemSearchResultBuyout",
	params = { { name = "itemKey", type = "ItemKey", default = nil } },
	returns = { { name = "maxBuyout", type = "BigUInteger", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetNumCommoditySearchResults"] = {
	key = "C_AuctionHouse.GetNumCommoditySearchResults",
	name = "GetNumCommoditySearchResults",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetNumCommoditySearchResults"],
	funcPath = "C_AuctionHouse.GetNumCommoditySearchResults",
	params = { { name = "itemID", type = "number", default = nil } },
	returns = { { name = "numSearchResults", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetNumItemSearchResults"] = {
	key = "C_AuctionHouse.GetNumItemSearchResults",
	name = "GetNumItemSearchResults",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetNumItemSearchResults"],
	funcPath = "C_AuctionHouse.GetNumItemSearchResults",
	params = { { name = "itemKey", type = "ItemKey", default = nil } },
	returns = { { name = "numItemSearchResults", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetOwnedAuctionInfo"] = {
	key = "C_AuctionHouse.GetOwnedAuctionInfo",
	name = "GetOwnedAuctionInfo",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetOwnedAuctionInfo"],
	funcPath = "C_AuctionHouse.GetOwnedAuctionInfo",
	params = { { name = "ownedAuctionIndex", type = "luaIndex", default = nil } },
	returns = { { name = "ownedAuction", type = "OwnedAuctionInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetOwnedAuctionType"] = {
	key = "C_AuctionHouse.GetOwnedAuctionType",
	name = "GetOwnedAuctionType",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetOwnedAuctionType"],
	funcPath = "C_AuctionHouse.GetOwnedAuctionType",
	params = { { name = "ownedAuctionTypeIndex", type = "luaIndex", default = nil } },
	returns = { { name = "typeItemKey", type = "ItemKey", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetReplicateItemBattlePetInfo"] = {
	key = "C_AuctionHouse.GetReplicateItemBattlePetInfo",
	name = "GetReplicateItemBattlePetInfo",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetReplicateItemBattlePetInfo"],
	funcPath = "C_AuctionHouse.GetReplicateItemBattlePetInfo",
	params = { { name = "index", type = "number", default = nil } },
	returns = {
		{ name = "creatureID", type = "number", canBeSecret = false },
		{ name = "displayID", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetReplicateItemInfo"] = {
	key = "C_AuctionHouse.GetReplicateItemInfo",
	name = "GetReplicateItemInfo",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetReplicateItemInfo"],
	funcPath = "C_AuctionHouse.GetReplicateItemInfo",
	params = { { name = "index", type = "number", default = nil } },
	returns = {
		{ name = "name", type = "string", canBeSecret = false },
		{ name = "texture", type = "fileID", canBeSecret = false },
		{ name = "count", type = "number", canBeSecret = false },
		{ name = "qualityID", type = "number", canBeSecret = false },
		{ name = "usable", type = "bool", canBeSecret = false },
		{ name = "level", type = "number", canBeSecret = false },
		{ name = "levelType", type = "string", canBeSecret = false },
		{ name = "minBid", type = "BigUInteger", canBeSecret = false },
		{ name = "minIncrement", type = "BigUInteger", canBeSecret = false },
		{ name = "buyoutPrice", type = "BigUInteger", canBeSecret = false },
		{ name = "bidAmount", type = "BigUInteger", canBeSecret = false },
		{ name = "highBidder", type = "string", canBeSecret = false },
		{ name = "bidderFullName", type = "string", canBeSecret = false },
		{ name = "owner", type = "string", canBeSecret = false },
		{ name = "ownerFullName", type = "string", canBeSecret = false },
		{ name = "saleStatus", type = "number", canBeSecret = false },
		{ name = "itemID", type = "number", canBeSecret = false },
		{ name = "hasAllInfo", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetReplicateItemLink"] = {
	key = "C_AuctionHouse.GetReplicateItemLink",
	name = "GetReplicateItemLink",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetReplicateItemLink"],
	funcPath = "C_AuctionHouse.GetReplicateItemLink",
	params = { { name = "index", type = "number", default = nil } },
	returns = { { name = "itemLink", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetReplicateItemTimeLeft"] = {
	key = "C_AuctionHouse.GetReplicateItemTimeLeft",
	name = "GetReplicateItemTimeLeft",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetReplicateItemTimeLeft"],
	funcPath = "C_AuctionHouse.GetReplicateItemTimeLeft",
	params = { { name = "index", type = "number", default = nil } },
	returns = { { name = "timeLeft", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.GetTimeLeftBandInfo"] = {
	key = "C_AuctionHouse.GetTimeLeftBandInfo",
	name = "GetTimeLeftBandInfo",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["GetTimeLeftBandInfo"],
	funcPath = "C_AuctionHouse.GetTimeLeftBandInfo",
	params = { { name = "timeLeftBand", type = "AuctionHouseTimeLeftBand", default = nil } },
	returns = {
		{ name = "timeLeftMinSeconds", type = "number", canBeSecret = false },
		{ name = "timeLeftMaxSeconds", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.HasFullCommoditySearchResults"] = {
	key = "C_AuctionHouse.HasFullCommoditySearchResults",
	name = "HasFullCommoditySearchResults",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["HasFullCommoditySearchResults"],
	funcPath = "C_AuctionHouse.HasFullCommoditySearchResults",
	params = { { name = "itemID", type = "number", default = nil } },
	returns = { { name = "hasFullResults", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.HasFullItemSearchResults"] = {
	key = "C_AuctionHouse.HasFullItemSearchResults",
	name = "HasFullItemSearchResults",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["HasFullItemSearchResults"],
	funcPath = "C_AuctionHouse.HasFullItemSearchResults",
	params = { { name = "itemKey", type = "ItemKey", default = nil } },
	returns = { { name = "hasFullResults", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.HasSearchResults"] = {
	key = "C_AuctionHouse.HasSearchResults",
	name = "HasSearchResults",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["HasSearchResults"],
	funcPath = "C_AuctionHouse.HasSearchResults",
	params = { { name = "itemKey", type = "ItemKey", default = nil } },
	returns = { { name = "hasSearchResults", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.IsFavoriteItem"] = {
	key = "C_AuctionHouse.IsFavoriteItem",
	name = "IsFavoriteItem",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["IsFavoriteItem"],
	funcPath = "C_AuctionHouse.IsFavoriteItem",
	params = { { name = "itemKey", type = "ItemKey", default = nil } },
	returns = { { name = "isFavorite", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.IsSellItemValid"] = {
	key = "C_AuctionHouse.IsSellItemValid",
	name = "IsSellItemValid",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["IsSellItemValid"],
	funcPath = "C_AuctionHouse.IsSellItemValid",
	params = {
		{ name = "item", type = "ItemLocation", default = nil },
		{ name = "displayError", type = "bool", default = true },
	},
	returns = { { name = "valid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.MakeItemKey"] = {
	key = "C_AuctionHouse.MakeItemKey",
	name = "MakeItemKey",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["MakeItemKey"],
	funcPath = "C_AuctionHouse.MakeItemKey",
	params = {
		{ name = "itemID", type = "number", default = nil },
		{ name = "itemLevel", type = "number", default = 0 },
		{ name = "itemSuffix", type = "number", default = 0 },
		{ name = "battlePetSpeciesID", type = "number", default = 0 },
	},
	returns = { { name = "itemKey", type = "ItemKey", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.PlaceBid"] = {
	key = "C_AuctionHouse.PlaceBid",
	name = "PlaceBid",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["PlaceBid"],
	funcPath = "C_AuctionHouse.PlaceBid",
	params = {
		{ name = "auctionID", type = "number", default = nil },
		{ name = "bidAmount", type = "BigUInteger", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.PostCommodity"] = {
	key = "C_AuctionHouse.PostCommodity",
	name = "PostCommodity",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["PostCommodity"],
	funcPath = "C_AuctionHouse.PostCommodity",
	params = {
		{ name = "item", type = "ItemLocation", default = nil },
		{ name = "duration", type = "luaIndex", default = nil },
		{ name = "quantity", type = "number", default = nil },
		{ name = "unitPrice", type = "BigUInteger", default = nil },
	},
	returns = { { name = "needsConfirmation", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.PostItem"] = {
	key = "C_AuctionHouse.PostItem",
	name = "PostItem",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["PostItem"],
	funcPath = "C_AuctionHouse.PostItem",
	params = {
		{ name = "item", type = "ItemLocation", default = nil },
		{ name = "duration", type = "luaIndex", default = nil },
		{ name = "quantity", type = "number", default = nil },
		{ name = "bid", type = "BigUInteger", default = nil },
		{ name = "buyout", type = "BigUInteger", default = nil },
	},
	returns = { { name = "needsConfirmation", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.QueryBids"] = {
	key = "C_AuctionHouse.QueryBids",
	name = "QueryBids",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["QueryBids"],
	funcPath = "C_AuctionHouse.QueryBids",
	params = {
		{ name = "sorts", type = "table", default = nil },
		{ name = "auctionIDs", type = "table", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.QueryOwnedAuctions"] = {
	key = "C_AuctionHouse.QueryOwnedAuctions",
	name = "QueryOwnedAuctions",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["QueryOwnedAuctions"],
	funcPath = "C_AuctionHouse.QueryOwnedAuctions",
	params = {
		{
			name = "sorts",
			type = "table",
			default = nil,
			examples = { { value = "{{sortOrder = 1", label = "Auctionator" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.RefreshCommoditySearchResults"] = {
	key = "C_AuctionHouse.RefreshCommoditySearchResults",
	name = "RefreshCommoditySearchResults",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["RefreshCommoditySearchResults"],
	funcPath = "C_AuctionHouse.RefreshCommoditySearchResults",
	params = { { name = "itemID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.RefreshItemSearchResults"] = {
	key = "C_AuctionHouse.RefreshItemSearchResults",
	name = "RefreshItemSearchResults",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["RefreshItemSearchResults"],
	funcPath = "C_AuctionHouse.RefreshItemSearchResults",
	params = {
		{ name = "itemKey", type = "ItemKey", default = nil },
		{ name = "minLevelFilter", type = "number", default = nil },
		{ name = "maxLevelFilter", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.RequestMoreCommoditySearchResults"] = {
	key = "C_AuctionHouse.RequestMoreCommoditySearchResults",
	name = "RequestMoreCommoditySearchResults",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["RequestMoreCommoditySearchResults"],
	funcPath = "C_AuctionHouse.RequestMoreCommoditySearchResults",
	params = { { name = "itemID", type = "number", default = nil } },
	returns = { { name = "hasFullResults", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.RequestMoreItemSearchResults"] = {
	key = "C_AuctionHouse.RequestMoreItemSearchResults",
	name = "RequestMoreItemSearchResults",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["RequestMoreItemSearchResults"],
	funcPath = "C_AuctionHouse.RequestMoreItemSearchResults",
	params = { { name = "itemKey", type = "ItemKey", default = nil } },
	returns = { { name = "hasFullResults", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.RequestOwnedAuctionBidderInfo"] = {
	key = "C_AuctionHouse.RequestOwnedAuctionBidderInfo",
	name = "RequestOwnedAuctionBidderInfo",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["RequestOwnedAuctionBidderInfo"],
	funcPath = "C_AuctionHouse.RequestOwnedAuctionBidderInfo",
	params = { { name = "auctionID", type = "number", default = nil } },
	returns = { { name = "bidderName", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.SearchForFavorites"] = {
	key = "C_AuctionHouse.SearchForFavorites",
	name = "SearchForFavorites",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["SearchForFavorites"],
	funcPath = "C_AuctionHouse.SearchForFavorites",
	params = { { name = "sorts", type = "table", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.SearchForItemKeys"] = {
	key = "C_AuctionHouse.SearchForItemKeys",
	name = "SearchForItemKeys",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["SearchForItemKeys"],
	funcPath = "C_AuctionHouse.SearchForItemKeys",
	params = { { name = "itemKeys", type = "table", default = nil }, { name = "sorts", type = "table", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.SendBrowseQuery"] = {
	key = "C_AuctionHouse.SendBrowseQuery",
	name = "SendBrowseQuery",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["SendBrowseQuery"],
	funcPath = "C_AuctionHouse.SendBrowseQuery",
	params = {
		{
			name = "query",
			type = "AuctionHouseBrowseQuery",
			default = nil,
			examples = { { value = [=[{searchString = ""]=], label = "Auctionator" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.SendSearchQuery"] = {
	key = "C_AuctionHouse.SendSearchQuery",
	name = "SendSearchQuery",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["SendSearchQuery"],
	funcPath = "C_AuctionHouse.SendSearchQuery",
	params = {
		{ name = "itemKey", type = "ItemKey", default = nil },
		{ name = "sorts", type = "table", default = nil },
		{ name = "separateOwnerItems", type = "bool", default = nil },
		{ name = "minLevelFilter", type = "number", default = 0 },
		{ name = "maxLevelFilter", type = "number", default = 0 },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.SendSellSearchQuery"] = {
	key = "C_AuctionHouse.SendSellSearchQuery",
	name = "SendSellSearchQuery",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["SendSellSearchQuery"],
	funcPath = "C_AuctionHouse.SendSellSearchQuery",
	params = {
		{ name = "itemKey", type = "ItemKey", default = nil },
		{ name = "sorts", type = "table", default = nil },
		{ name = "separateOwnerItems", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.SetFavoriteItem"] = {
	key = "C_AuctionHouse.SetFavoriteItem",
	name = "SetFavoriteItem",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["SetFavoriteItem"],
	funcPath = "C_AuctionHouse.SetFavoriteItem",
	params = {
		{ name = "itemKey", type = "ItemKey", default = nil },
		{ name = "setFavorite", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AuctionHouse.StartCommoditiesPurchase"] = {
	key = "C_AuctionHouse.StartCommoditiesPurchase",
	name = "StartCommoditiesPurchase",
	category = "combat_midnight",
	subcategory = "c_auctionhouse",
	func = _G["C_AuctionHouse"] and _G["C_AuctionHouse"]["StartCommoditiesPurchase"],
	funcPath = "C_AuctionHouse.StartCommoditiesPurchase",
	params = {
		{ name = "itemID", type = "number", default = nil },
		{ name = "quantity", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

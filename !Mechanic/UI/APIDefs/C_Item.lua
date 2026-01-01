-- Generated APIDefinitions for namespace: C_Item
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Item.CanBeRefunded"] = {
	key = "C_Item.CanBeRefunded",
	name = "CanBeRefunded",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["CanBeRefunded"],
	funcPath = "C_Item.CanBeRefunded",
	params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
	returns = { { name = "canBeRefunded", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.CanItemTransmogAppearance"] = {
	key = "C_Item.CanItemTransmogAppearance",
	name = "CanItemTransmogAppearance",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["CanItemTransmogAppearance"],
	funcPath = "C_Item.CanItemTransmogAppearance",
	params = { { name = "itemLoc", type = "ItemLocation", default = nil } },
	returns = {
		{ name = "canTransmog", type = "bool", canBeSecret = false },
		{ name = "errorCode", type = "TransmogOutfitSlotError", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.CanScrapItem"] = {
	key = "C_Item.CanScrapItem",
	name = "CanScrapItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["CanScrapItem"],
	funcPath = "C_Item.CanScrapItem",
	params = { { name = "itemLoc", type = "ItemLocation", default = nil } },
	returns = { { name = "canBeScrapped", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.CanViewItemPowers"] = {
	key = "C_Item.CanViewItemPowers",
	name = "CanViewItemPowers",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["CanViewItemPowers"],
	funcPath = "C_Item.CanViewItemPowers",
	params = { { name = "itemLoc", type = "ItemLocation", default = nil } },
	returns = { { name = "isItemViewable", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.DoesItemContainSpec"] = {
	key = "C_Item.DoesItemContainSpec",
	name = "DoesItemContainSpec",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["DoesItemContainSpec"],
	funcPath = "C_Item.DoesItemContainSpec",
	params = {
		{ name = "itemInfo", type = "ItemInfo", default = nil },
		{ name = "classID", type = "number", default = nil },
		{ name = "specID", type = "number", default = 0 },
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.DoesItemExist"] = {
	key = "C_Item.DoesItemExist",
	name = "DoesItemExist",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["DoesItemExist"],
	funcPath = "C_Item.DoesItemExist",
	params = {
		{
			name = "emptiableItemLocation",
			type = "EmptiableItemLocation",
			default = nil,
			examples = {
				{ value = "item.location", label = "Auctionator" },
				{ value = "target", label = "Baganator" },
				{ value = "item", label = "BagBrother" },
			},
		},
	},
	returns = { { name = "itemExists", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.DoesItemExistByID"] = {
	key = "C_Item.DoesItemExistByID",
	name = "DoesItemExistByID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["DoesItemExistByID"],
	funcPath = "C_Item.DoesItemExistByID",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = { { value = "info[17]", label = "Auctionator" } },
		},
	},
	returns = { { name = "itemExists", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.DoesItemMatchBonusTreeReplacement"] = {
	key = "C_Item.DoesItemMatchBonusTreeReplacement",
	name = "DoesItemMatchBonusTreeReplacement",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["DoesItemMatchBonusTreeReplacement"],
	funcPath = "C_Item.DoesItemMatchBonusTreeReplacement",
	params = { { name = "itemLoc", type = "ItemLocation", default = nil } },
	returns = { { name = "matchesBonusTree", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.DoesItemMatchTargetEnchantingSpell"] = {
	key = "C_Item.DoesItemMatchTargetEnchantingSpell",
	name = "DoesItemMatchTargetEnchantingSpell",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["DoesItemMatchTargetEnchantingSpell"],
	funcPath = "C_Item.DoesItemMatchTargetEnchantingSpell",
	params = { { name = "itemLoc", type = "ItemLocation", default = nil } },
	returns = { { name = "matchesTargetEnchantingSpell", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.DoesItemMatchTrackJump"] = {
	key = "C_Item.DoesItemMatchTrackJump",
	name = "DoesItemMatchTrackJump",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["DoesItemMatchTrackJump"],
	funcPath = "C_Item.DoesItemMatchTrackJump",
	params = { { name = "itemLoc", type = "ItemLocation", default = nil } },
	returns = { { name = "matchesTrackJump", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.DropItemOnUnit"] = {
	key = "C_Item.DropItemOnUnit",
	name = "DropItemOnUnit",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["DropItemOnUnit"],
	funcPath = "C_Item.DropItemOnUnit",
	params = {
		{
			name = "unitGUID",
			type = "UnitToken",
			default = "player",
			examples = { { value = "itemName", label = "Details" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.EndBoundTradeable"] = {
	key = "C_Item.EndBoundTradeable",
	name = "EndBoundTradeable",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["EndBoundTradeable"],
	funcPath = "C_Item.EndBoundTradeable",
	params = { { name = "type", type = "cstring", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.EndRefund"] = {
	key = "C_Item.EndRefund",
	name = "EndRefund",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["EndRefund"],
	funcPath = "C_Item.EndRefund",
	params = { { name = "type", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.EquipItemByName"] = {
	key = "C_Item.EquipItemByName",
	name = "EquipItemByName",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["EquipItemByName"],
	funcPath = "C_Item.EquipItemByName",
	params = {
		{ name = "itemInfo", type = "ItemInfo", default = nil },
		{ name = "dstSlot", type = "luaIndex", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetAppliedItemTransmogInfo"] = {
	key = "C_Item.GetAppliedItemTransmogInfo",
	name = "GetAppliedItemTransmogInfo",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetAppliedItemTransmogInfo"],
	funcPath = "C_Item.GetAppliedItemTransmogInfo",
	params = {
		{
			name = "itemLoc",
			type = "ItemLocation",
			default = nil,
			examples = { { value = "ItemLocation:CreateFromEquipmentSlot(3)", label = "Narcissus" } },
		},
	},
	returns = { { name = "info", type = "ItemTransmogInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetBaseItemTransmogInfo"] = {
	key = "C_Item.GetBaseItemTransmogInfo",
	name = "GetBaseItemTransmogInfo",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetBaseItemTransmogInfo"],
	funcPath = "C_Item.GetBaseItemTransmogInfo",
	params = { { name = "itemLoc", type = "ItemLocation", default = nil } },
	returns = { { name = "info", type = "ItemTransmogInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetCurrentItemLevel"] = {
	key = "C_Item.GetCurrentItemLevel",
	name = "GetCurrentItemLevel",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetCurrentItemLevel"],
	funcPath = "C_Item.GetCurrentItemLevel",
	params = {
		{
			name = "itemLocation",
			type = "ItemLocation",
			default = nil,
			examples = { { value = "item.location", label = "BagBrother" } },
		},
	},
	returns = { { name = "currentItemLevel", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetCurrentItemTransmogInfo"] = {
	key = "C_Item.GetCurrentItemTransmogInfo",
	name = "GetCurrentItemTransmogInfo",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetCurrentItemTransmogInfo"],
	funcPath = "C_Item.GetCurrentItemTransmogInfo",
	params = { { name = "itemLoc", type = "ItemLocation", default = nil } },
	returns = { { name = "info", type = "ItemTransmogInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetDelvePreviewItemLink"] = {
	key = "C_Item.GetDelvePreviewItemLink",
	name = "GetDelvePreviewItemLink",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetDelvePreviewItemLink"],
	funcPath = "C_Item.GetDelvePreviewItemLink",
	params = {
		{ name = "itemID", type = "number", default = nil },
		{ name = "context", type = "ItemCreationContext", default = nil },
	},
	returns = { { name = "itemLink", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetDelvePreviewItemQuality"] = {
	key = "C_Item.GetDelvePreviewItemQuality",
	name = "GetDelvePreviewItemQuality",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetDelvePreviewItemQuality"],
	funcPath = "C_Item.GetDelvePreviewItemQuality",
	params = {
		{ name = "itemID", type = "number", default = nil },
		{ name = "context", type = "ItemCreationContext", default = nil },
	},
	returns = { { name = "itemQuality", type = "ItemQuality", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetDetailedItemLevelInfo"] = {
	key = "C_Item.GetDetailedItemLevelInfo",
	name = "GetDetailedItemLevelInfo",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetDetailedItemLevelInfo"],
	funcPath = "C_Item.GetDetailedItemLevelInfo",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = { { value = "resultWithKey.entries[1].itemLink", label = "Auctionator" } },
		},
	},
	returns = {
		{ name = "actualItemLevel", type = "number", canBeSecret = false },
		{ name = "previewLevel", type = "bool", canBeSecret = false },
		{ name = "sparseItemLevel", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetFirstTriggeredSpellForItem"] = {
	key = "C_Item.GetFirstTriggeredSpellForItem",
	name = "GetFirstTriggeredSpellForItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetFirstTriggeredSpellForItem"],
	funcPath = "C_Item.GetFirstTriggeredSpellForItem",
	params = {
		{ name = "itemID", type = "number", default = nil },
		{ name = "itemQuality", type = "number", default = nil },
	},
	returns = { { name = "spellID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemChildInfo"] = {
	key = "C_Item.GetItemChildInfo",
	name = "GetItemChildInfo",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemChildInfo"],
	funcPath = "C_Item.GetItemChildInfo",
	params = {
		{ name = "itemInfo", type = "ItemInfo", default = nil },
		{ name = "slotID", type = "luaIndex", default = nil },
	},
	returns = { { name = "result", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemClassInfo"] = {
	key = "C_Item.GetItemClassInfo",
	name = "GetItemClassInfo",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemClassInfo"],
	funcPath = "C_Item.GetItemClassInfo",
	params = {
		{
			name = "itemClassID",
			type = "number",
			default = nil,
			examples = {
				{ value = 20, label = "Syndicator" },
				{ value = 5, label = "AllTheThings" },
				{ value = 3, label = "AllTheThings" },
			},
		},
	},
	returns = { { name = "result", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemConversionOutputIcon"] = {
	key = "C_Item.GetItemConversionOutputIcon",
	name = "GetItemConversionOutputIcon",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemConversionOutputIcon"],
	funcPath = "C_Item.GetItemConversionOutputIcon",
	params = { { name = "itemLoc", type = "ItemLocation", default = nil } },
	returns = { { name = "icon", type = "fileID", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemCooldown"] = {
	key = "C_Item.GetItemCooldown",
	name = "GetItemCooldown",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemCooldown"],
	funcPath = "C_Item.GetItemCooldown",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = {
				{ value = "id", label = "WeakAuras" },
				{ value = "id", label = "WeakAuras" },
				{ value = "button.id", label = "Plumber" },
			},
		},
	},
	returns = {
		{ name = "startTimeSeconds", type = "number", canBeSecret = false },
		{ name = "durationSeconds", type = "number", canBeSecret = false },
		{ name = "enableCooldownTimer", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemCount"] = {
	key = "C_Item.GetItemCount",
	name = "GetItemCount",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemCount"],
	funcPath = "C_Item.GetItemCount",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = {
				{ value = [=[itemName or ""]=], label = "WeakAuras" },
				{ value = 194730, label = "Leatrix_Plus" },
				{ value = 194966, label = "Leatrix_Plus" },
			},
		},
		{ name = "includeBank", type = "bool", default = false },
		{ name = "includeUses", type = "bool", default = false },
		{ name = "includeReagentBank", type = "bool", default = false },
		{ name = "includeAccountBank", type = "bool", default = false },
	},
	returns = { { name = "count", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemCreationContext"] = {
	key = "C_Item.GetItemCreationContext",
	name = "GetItemCreationContext",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemCreationContext"],
	funcPath = "C_Item.GetItemCreationContext",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = {
		{ name = "itemID", type = "number", canBeSecret = false },
		{ name = "creationContext", type = "cstring", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemFamily"] = {
	key = "C_Item.GetItemFamily",
	name = "GetItemFamily",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemFamily"],
	funcPath = "C_Item.GetItemFamily",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = {
				{ value = "item.itemID", label = "Baganator" },
				{ value = "id", label = "BagBrother" },
				{ value = "'item:' .. data.link", label = "BagBrother" },
			},
		},
	},
	returns = { { name = "result", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemGUID"] = {
	key = "C_Item.GetItemGUID",
	name = "GetItemGUID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemGUID"],
	funcPath = "C_Item.GetItemGUID",
	params = {
		{
			name = "itemLocation",
			type = "ItemLocation",
			default = nil,
			examples = { { value = "target", label = "Baganator" }, { value = "item", label = "Narcissus" } },
		},
	},
	returns = { { name = "itemGUID", type = "WOWGUID", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemGem"] = {
	key = "C_Item.GetItemGem",
	name = "GetItemGem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemGem"],
	funcPath = "C_Item.GetItemGem",
	params = {
		{
			name = "hyperlink",
			type = "cstring",
			default = nil,
			examples = { { value = "itemLink", label = "Narcissus" } },
		},
		{ name = "index", type = "luaIndex", default = nil },
	},
	returns = {
		{ name = "gemName", type = "string", canBeSecret = false },
		{ name = "gemLink", type = "cstring", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemGemID"] = {
	key = "C_Item.GetItemGemID",
	name = "GetItemGemID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemGemID"],
	funcPath = "C_Item.GetItemGemID",
	params = {
		{ name = "itemInfo", type = "ItemInfo", default = nil },
		{ name = "index", type = "luaIndex", default = nil },
	},
	returns = { { name = "gemID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemID"] = {
	key = "C_Item.GetItemID",
	name = "GetItemID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemID"],
	funcPath = "C_Item.GetItemID",
	params = {
		{
			name = "itemLocation",
			type = "ItemLocation",
			default = nil,
			examples = { { value = "item", label = "Narcissus" } },
		},
	},
	returns = { { name = "itemID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemIDByGUID"] = {
	key = "C_Item.GetItemIDByGUID",
	name = "GetItemIDByGUID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemIDByGUID"],
	funcPath = "C_Item.GetItemIDByGUID",
	params = { { name = "itemGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "itemID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemIDForItemInfo"] = {
	key = "C_Item.GetItemIDForItemInfo",
	name = "GetItemIDForItemInfo",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemIDForItemInfo"],
	funcPath = "C_Item.GetItemIDForItemInfo",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "itemID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemIcon"] = {
	key = "C_Item.GetItemIcon",
	name = "GetItemIcon",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemIcon"],
	funcPath = "C_Item.GetItemIcon",
	params = {
		{
			name = "itemLocation",
			type = "ItemLocation",
			default = nil,
			examples = {
				{ value = "v[2]", label = "AllTheThings" },
				{ value = "id", label = "AllTheThings" },
				{ value = "enchantData[4]", label = "Narcissus" },
			},
		},
	},
	returns = { { name = "icon", type = "fileID", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemIconByID"] = {
	key = "C_Item.GetItemIconByID",
	name = "GetItemIconByID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemIconByID"],
	funcPath = "C_Item.GetItemIconByID",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = {
				{ value = "itemName or ''", label = "WeakAuras" },
				{ value = "value or ''", label = "WeakAurasOptions" },
				{ value = "item", label = "Plumber" },
			},
		},
	},
	returns = { { name = "icon", type = "fileID", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemInfo"] = {
	key = "C_Item.GetItemInfo",
	name = "GetItemInfo",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemInfo"],
	funcPath = "C_Item.GetItemInfo",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = {
				{ value = "itemId or 0", label = "WeakAuras" },
				{ value = "itemname or 0", label = "WeakAuras" },
				{ value = "trigger.itemName or 0", label = "WeakAuras" },
			},
		},
	},
	returns = {
		{ name = "itemName", type = "cstring", canBeSecret = false },
		{ name = "itemLink", type = "cstring", canBeSecret = false },
		{ name = "itemQuality", type = "ItemQuality", canBeSecret = false },
		{ name = "itemLevel", type = "number", canBeSecret = false },
		{ name = "itemMinLevel", type = "number", canBeSecret = false },
		{ name = "itemType", type = "cstring", canBeSecret = false },
		{ name = "itemSubType", type = "cstring", canBeSecret = false },
		{ name = "itemStackCount", type = "number", canBeSecret = false },
		{ name = "itemEquipLoc", type = "cstring", canBeSecret = false },
		{ name = "itemTexture", type = "fileID", canBeSecret = false },
		{ name = "sellPrice", type = "number", canBeSecret = false },
		{ name = "classID", type = "number", canBeSecret = false },
		{ name = "subclassID", type = "number", canBeSecret = false },
		{ name = "bindType", type = "number", canBeSecret = false },
		{ name = "expansionID", type = "number", canBeSecret = false },
		{ name = "setID", type = "number", canBeSecret = false },
		{ name = "isCraftingReagent", type = "bool", canBeSecret = false },
		{ name = "itemDescription", type = "cstring", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemInfoInstant"] = {
	key = "C_Item.GetItemInfoInstant",
	name = "GetItemInfoInstant",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemInfoInstant"],
	funcPath = "C_Item.GetItemInfoInstant",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = {
				{ value = "itemname or 0", label = "WeakAuras" },
				{ value = "trigger.itemName or 0", label = "WeakAuras" },
				{ value = "item.itemID", label = "Baganator" },
			},
		},
	},
	returns = {
		{ name = "itemID", type = "number", canBeSecret = false },
		{ name = "itemType", type = "cstring", canBeSecret = false },
		{ name = "itemSubType", type = "cstring", canBeSecret = false },
		{ name = "itemEquipLoc", type = "cstring", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
		{ name = "classID", type = "number", canBeSecret = false },
		{ name = "subClassID", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemInventorySlotInfo"] = {
	key = "C_Item.GetItemInventorySlotInfo",
	name = "GetItemInventorySlotInfo",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemInventorySlotInfo"],
	funcPath = "C_Item.GetItemInventorySlotInfo",
	params = { { name = "inventorySlot", type = "InventoryType", default = nil } },
	returns = { { name = "result", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemInventorySlotKey"] = {
	key = "C_Item.GetItemInventorySlotKey",
	name = "GetItemInventorySlotKey",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemInventorySlotKey"],
	funcPath = "C_Item.GetItemInventorySlotKey",
	params = { { name = "inventorySlot", type = "InventoryType", default = nil } },
	returns = { { name = "result", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemInventoryType"] = {
	key = "C_Item.GetItemInventoryType",
	name = "GetItemInventoryType",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemInventoryType"],
	funcPath = "C_Item.GetItemInventoryType",
	params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
	returns = { { name = "inventoryType", type = "InventoryType", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemInventoryTypeByID"] = {
	key = "C_Item.GetItemInventoryTypeByID",
	name = "GetItemInventoryTypeByID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemInventoryTypeByID"],
	funcPath = "C_Item.GetItemInventoryTypeByID",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = { { value = "item.itemID", label = "Baganator" } },
		},
	},
	returns = { { name = "inventoryType", type = "InventoryType", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemLearnTransmogSet"] = {
	key = "C_Item.GetItemLearnTransmogSet",
	name = "GetItemLearnTransmogSet",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemLearnTransmogSet"],
	funcPath = "C_Item.GetItemLearnTransmogSet",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "setID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemLink"] = {
	key = "C_Item.GetItemLink",
	name = "GetItemLink",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemLink"],
	funcPath = "C_Item.GetItemLink",
	params = {
		{
			name = "itemLocation",
			type = "ItemLocation",
			default = nil,
			examples = { { value = "item", label = "BagBrother" } },
		},
	},
	returns = { { name = "itemLink", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemLinkByGUID"] = {
	key = "C_Item.GetItemLinkByGUID",
	name = "GetItemLinkByGUID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemLinkByGUID"],
	funcPath = "C_Item.GetItemLinkByGUID",
	params = {
		{
			name = "itemGUID",
			type = "WOWGUID",
			default = nil,
			examples = { { value = "guid", label = "Auctionator" }, { value = "tooltipData.guid", label = "Plumber" } },
		},
	},
	returns = { { name = "itemLink", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemLocation"] = {
	key = "C_Item.GetItemLocation",
	name = "GetItemLocation",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemLocation"],
	funcPath = "C_Item.GetItemLocation",
	params = { { name = "itemGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "itemLocation", type = "ItemLocation", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemMaxStackSize"] = {
	key = "C_Item.GetItemMaxStackSize",
	name = "GetItemMaxStackSize",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemMaxStackSize"],
	funcPath = "C_Item.GetItemMaxStackSize",
	params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
	returns = { { name = "stackSize", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemMaxStackSizeByID"] = {
	key = "C_Item.GetItemMaxStackSizeByID",
	name = "GetItemMaxStackSizeByID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemMaxStackSizeByID"],
	funcPath = "C_Item.GetItemMaxStackSizeByID",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = { { value = "item.itemID", label = "Baganator" }, { value = "item", label = "Plumber" } },
		},
	},
	returns = { { name = "stackSize", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemName"] = {
	key = "C_Item.GetItemName",
	name = "GetItemName",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemName"],
	funcPath = "C_Item.GetItemName",
	params = {
		{
			name = "itemLocation",
			type = "ItemLocation",
			default = nil,
			examples = {
				{ value = "id", label = "Narcissus_Database_Item" },
				{ value = "data[4]", label = "Plumber" },
				{ value = 228942, label = "Plumber" },
			},
		},
	},
	returns = { { name = "itemName", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemNameByID"] = {
	key = "C_Item.GetItemNameByID",
	name = "GetItemNameByID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemNameByID"],
	funcPath = "C_Item.GetItemNameByID",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = {
				{ value = 37705, label = "GatherMate2" },
				{ value = 22572, label = "GatherMate2" },
				{ value = "item", label = "Plumber" },
			},
		},
	},
	returns = { { name = "itemName", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemNumAddedSockets"] = {
	key = "C_Item.GetItemNumAddedSockets",
	name = "GetItemNumAddedSockets",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemNumAddedSockets"],
	funcPath = "C_Item.GetItemNumAddedSockets",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "socketCount", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemNumSockets"] = {
	key = "C_Item.GetItemNumSockets",
	name = "GetItemNumSockets",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemNumSockets"],
	funcPath = "C_Item.GetItemNumSockets",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = { { value = [=[GetInventoryItemLink("player"]=], label = "Narcissus" } },
		},
	},
	returns = { { name = "socketCount", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemQuality"] = {
	key = "C_Item.GetItemQuality",
	name = "GetItemQuality",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemQuality"],
	funcPath = "C_Item.GetItemQuality",
	params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
	returns = { { name = "itemQuality", type = "ItemQuality", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemQualityByID"] = {
	key = "C_Item.GetItemQualityByID",
	name = "GetItemQualityByID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemQualityByID"],
	funcPath = "C_Item.GetItemQualityByID",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = { { value = "item.link", label = "BagBrother" } },
		},
	},
	returns = { { name = "itemQuality", type = "ItemQuality", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemQualityColor"] = {
	key = "C_Item.GetItemQualityColor",
	name = "GetItemQualityColor",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemQualityColor"],
	funcPath = "C_Item.GetItemQualityColor",
	params = {
		{
			name = "quality",
			type = "ItemQuality",
			default = nil,
			examples = {
				{ value = "item.quality", label = "BagBrother" },
				{ value = "itemQuality or 4", label = "MRT" },
				{ value = "itemQuality or 1", label = "MRT" },
			},
		},
	},
	returns = {
		{ name = "colorRGBR", type = "number", canBeSecret = false },
		{ name = "colorRGBG", type = "number", canBeSecret = false },
		{ name = "colorRGBB", type = "number", canBeSecret = false },
		{ name = "qualityString", type = "cstring", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemSetInfo"] = {
	key = "C_Item.GetItemSetInfo",
	name = "GetItemSetInfo",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemSetInfo"],
	funcPath = "C_Item.GetItemSetInfo",
	params = { { name = "setID", type = "number", default = nil } },
	returns = { { name = "result", type = "cstring", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemSpecInfo"] = {
	key = "C_Item.GetItemSpecInfo",
	name = "GetItemSpecInfo",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemSpecInfo"],
	funcPath = "C_Item.GetItemSpecInfo",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "specTable", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemSpell"] = {
	key = "C_Item.GetItemSpell",
	name = "GetItemSpell",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemSpell"],
	funcPath = "C_Item.GetItemSpell",
	params = {
		{ name = "itemInfo", type = "ItemInfo", default = nil, examples = { { value = "item", label = "Plumber" } } },
	},
	returns = {
		{ name = "spellName", type = "cstring", canBeSecret = false },
		{ name = "spellID", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemStatDelta"] = {
	key = "C_Item.GetItemStatDelta",
	name = "GetItemStatDelta",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemStatDelta"],
	funcPath = "C_Item.GetItemStatDelta",
	params = {
		{ name = "itemLink1", type = "cstring", default = nil },
		{ name = "itemLink2", type = "cstring", default = nil },
	},
	returns = { { name = "statTable", type = "LuaValueVariant", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemStats"] = {
	key = "C_Item.GetItemStats",
	name = "GetItemStats",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemStats"],
	funcPath = "C_Item.GetItemStats",
	params = { { name = "itemLink", type = "cstring", default = nil } },
	returns = { { name = "statTable", type = "LuaValueVariant", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemSubClassInfo"] = {
	key = "C_Item.GetItemSubClassInfo",
	name = "GetItemSubClassInfo",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemSubClassInfo"],
	funcPath = "C_Item.GetItemSubClassInfo",
	params = {
		{
			name = "itemClassID",
			type = "number",
			default = nil,
			examples = {
				{ value = 2, label = "WeakAuras" },
				{ value = 4, label = "WeakAuras" },
				{ value = 2, label = "AllTheThings" },
			},
		},
		{ name = "itemSubClassID", type = "number", default = nil },
	},
	returns = {
		{ name = "subClassName", type = "cstring", canBeSecret = false },
		{ name = "subClassUsesInvType", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemUniqueness"] = {
	key = "C_Item.GetItemUniqueness",
	name = "GetItemUniqueness",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemUniqueness"],
	funcPath = "C_Item.GetItemUniqueness",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = {
		{ name = "limitCategory", type = "number", canBeSecret = false },
		{ name = "limitMax", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemUniquenessByID"] = {
	key = "C_Item.GetItemUniquenessByID",
	name = "GetItemUniquenessByID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemUniquenessByID"],
	funcPath = "C_Item.GetItemUniquenessByID",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = {
		{ name = "isUnique", type = "bool", canBeSecret = false },
		{ name = "limitCategoryName", type = "cstring", canBeSecret = false },
		{ name = "limitCategoryCount", type = "number", canBeSecret = false },
		{ name = "limitCategoryID", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetItemUpgradeInfo"] = {
	key = "C_Item.GetItemUpgradeInfo",
	name = "GetItemUpgradeInfo",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetItemUpgradeInfo"],
	funcPath = "C_Item.GetItemUpgradeInfo",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = { { value = "item.itemLink", label = "Baganator" } },
		},
	},
	returns = { { name = "itemUpgradeInfo", type = "ItemUpgradeInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetLimitedCurrencyItemInfo"] = {
	key = "C_Item.GetLimitedCurrencyItemInfo",
	name = "GetLimitedCurrencyItemInfo",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetLimitedCurrencyItemInfo"],
	funcPath = "C_Item.GetLimitedCurrencyItemInfo",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = {
		{ name = "name", type = "cstring", canBeSecret = false },
		{ name = "icon", type = "fileID", canBeSecret = false },
		{ name = "quantity", type = "number", canBeSecret = false },
		{ name = "maxQuantity", type = "number", canBeSecret = false },
		{ name = "totalEarned", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetSetBonusesForSpecializationByItemID"] = {
	key = "C_Item.GetSetBonusesForSpecializationByItemID",
	name = "GetSetBonusesForSpecializationByItemID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetSetBonusesForSpecializationByItemID"],
	funcPath = "C_Item.GetSetBonusesForSpecializationByItemID",
	params = {
		{ name = "specID", type = "number", default = nil },
		{ name = "itemID", type = "number", default = nil },
	},
	returns = { { name = "itemSetSpellIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.GetStackCount"] = {
	key = "C_Item.GetStackCount",
	name = "GetStackCount",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["GetStackCount"],
	funcPath = "C_Item.GetStackCount",
	params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
	returns = { { name = "stackCount", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsAnimaItemByID"] = {
	key = "C_Item.IsAnimaItemByID",
	name = "IsAnimaItemByID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsAnimaItemByID"],
	funcPath = "C_Item.IsAnimaItemByID",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "isAnimaItem", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsArtifactPowerItem"] = {
	key = "C_Item.IsArtifactPowerItem",
	name = "IsArtifactPowerItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsArtifactPowerItem"],
	funcPath = "C_Item.IsArtifactPowerItem",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsBound"] = {
	key = "C_Item.IsBound",
	name = "IsBound",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsBound"],
	funcPath = "C_Item.IsBound",
	params = {
		{
			name = "itemLocation",
			type = "ItemLocation",
			default = nil,
			examples = { { value = "item.location", label = "BagBrother" } },
		},
	},
	returns = { { name = "isBound", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsBoundToAccountUntilEquip"] = {
	key = "C_Item.IsBoundToAccountUntilEquip",
	name = "IsBoundToAccountUntilEquip",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsBoundToAccountUntilEquip"],
	funcPath = "C_Item.IsBoundToAccountUntilEquip",
	params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
	returns = { { name = "isBoundToAccountUntilEquip", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsConsumableItem"] = {
	key = "C_Item.IsConsumableItem",
	name = "IsConsumableItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsConsumableItem"],
	funcPath = "C_Item.IsConsumableItem",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsCorruptedItem"] = {
	key = "C_Item.IsCorruptedItem",
	name = "IsCorruptedItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsCorruptedItem"],
	funcPath = "C_Item.IsCorruptedItem",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsCosmeticItem"] = {
	key = "C_Item.IsCosmeticItem",
	name = "IsCosmeticItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsCosmeticItem"],
	funcPath = "C_Item.IsCosmeticItem",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = { { value = "data.id", label = "Plumber" } },
		},
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsCurioItem"] = {
	key = "C_Item.IsCurioItem",
	name = "IsCurioItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsCurioItem"],
	funcPath = "C_Item.IsCurioItem",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsCurrentItem"] = {
	key = "C_Item.IsCurrentItem",
	name = "IsCurrentItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsCurrentItem"],
	funcPath = "C_Item.IsCurrentItem",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsDecorItem"] = {
	key = "C_Item.IsDecorItem",
	name = "IsDecorItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsDecorItem"],
	funcPath = "C_Item.IsDecorItem",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = { { value = "ItemType: 20", label = "Plumber" } },
		},
	},
	returns = { { name = "isDecor", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsDressableItemByID"] = {
	key = "C_Item.IsDressableItemByID",
	name = "IsDressableItemByID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsDressableItemByID"],
	funcPath = "C_Item.IsDressableItemByID",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = { { value = "item", label = "Narcissus" }, { value = "id", label = "BagBrother" } },
		},
	},
	returns = { { name = "isDressableItem", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsEquippableItem"] = {
	key = "C_Item.IsEquippableItem",
	name = "IsEquippableItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsEquippableItem"],
	funcPath = "C_Item.IsEquippableItem",
	params = {
		{ name = "itemInfo", type = "ItemInfo", default = nil, examples = { { value = "id", label = "BagBrother" } } },
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsEquippedItem"] = {
	key = "C_Item.IsEquippedItem",
	name = "IsEquippedItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsEquippedItem"],
	funcPath = "C_Item.IsEquippedItem",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = { { value = "itemId or ''", label = "WeakAuras" }, { value = "%s or ''", label = "WeakAuras" } },
		},
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsEquippedItemType"] = {
	key = "C_Item.IsEquippedItemType",
	name = "IsEquippedItemType",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsEquippedItemType"],
	funcPath = "C_Item.IsEquippedItemType",
	params = {
		{
			name = "type",
			type = "cstring",
			default = nil,
			examples = {
				{ value = "Private.ExecEnv.GetItemSubClassInfo(itemType) or ''", label = "WeakAuras" },
				{ value = "Private.ExecEnv.GetItemSubClassInfo(%s) or ''", label = "WeakAuras" },
				{ value = "Shields", label = "Plater" },
			},
		},
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsHarmfulItem"] = {
	key = "C_Item.IsHarmfulItem",
	name = "IsHarmfulItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsHarmfulItem"],
	funcPath = "C_Item.IsHarmfulItem",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsHelpfulItem"] = {
	key = "C_Item.IsHelpfulItem",
	name = "IsHelpfulItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsHelpfulItem"],
	funcPath = "C_Item.IsHelpfulItem",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsItemBindToAccount"] = {
	key = "C_Item.IsItemBindToAccount",
	name = "IsItemBindToAccount",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsItemBindToAccount"],
	funcPath = "C_Item.IsItemBindToAccount",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "isItemBindToAccount", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsItemBindToAccountUntilEquip"] = {
	key = "C_Item.IsItemBindToAccountUntilEquip",
	name = "IsItemBindToAccountUntilEquip",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsItemBindToAccountUntilEquip"],
	funcPath = "C_Item.IsItemBindToAccountUntilEquip",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = { { value = "item.itemLink", label = "Baganator" } },
		},
	},
	returns = { { name = "isItemBindToAccountUntilEquip", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsItemConduit"] = {
	key = "C_Item.IsItemConduit",
	name = "IsItemConduit",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsItemConduit"],
	funcPath = "C_Item.IsItemConduit",
	params = { { name = "itemLoc", type = "ItemLocation", default = nil } },
	returns = { { name = "isConduit", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsItemConvertibleAndValidForPlayer"] = {
	key = "C_Item.IsItemConvertibleAndValidForPlayer",
	name = "IsItemConvertibleAndValidForPlayer",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsItemConvertibleAndValidForPlayer"],
	funcPath = "C_Item.IsItemConvertibleAndValidForPlayer",
	params = { { name = "itemLoc", type = "ItemLocation", default = nil } },
	returns = { { name = "isItemConvertibleAndValidForPlayer", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsItemCorrupted"] = {
	key = "C_Item.IsItemCorrupted",
	name = "IsItemCorrupted",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsItemCorrupted"],
	funcPath = "C_Item.IsItemCorrupted",
	params = { { name = "itemLoc", type = "ItemLocation", default = nil } },
	returns = { { name = "isCorrupted", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsItemCorruptionRelated"] = {
	key = "C_Item.IsItemCorruptionRelated",
	name = "IsItemCorruptionRelated",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsItemCorruptionRelated"],
	funcPath = "C_Item.IsItemCorruptionRelated",
	params = { { name = "itemLoc", type = "ItemLocation", default = nil } },
	returns = { { name = "isCorruptionRelated", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsItemCorruptionResistant"] = {
	key = "C_Item.IsItemCorruptionResistant",
	name = "IsItemCorruptionResistant",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsItemCorruptionResistant"],
	funcPath = "C_Item.IsItemCorruptionResistant",
	params = { { name = "itemLoc", type = "ItemLocation", default = nil } },
	returns = { { name = "isCorruptionResistant", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsItemDataCached"] = {
	key = "C_Item.IsItemDataCached",
	name = "IsItemDataCached",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsItemDataCached"],
	funcPath = "C_Item.IsItemDataCached",
	params = {
		{
			name = "itemLocation",
			type = "ItemLocation",
			default = nil,
			examples = { { value = "item", label = "Narcissus" } },
		},
	},
	returns = { { name = "isCached", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsItemDataCachedByID"] = {
	key = "C_Item.IsItemDataCachedByID",
	name = "IsItemDataCachedByID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsItemDataCachedByID"],
	funcPath = "C_Item.IsItemDataCachedByID",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = { { value = "item.itemID", label = "Baganator" }, { value = "self.id", label = "Plumber" } },
		},
	},
	returns = { { name = "isCached", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsItemGUIDInInventory"] = {
	key = "C_Item.IsItemGUIDInInventory",
	name = "IsItemGUIDInInventory",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsItemGUIDInInventory"],
	funcPath = "C_Item.IsItemGUIDInInventory",
	params = { { name = "itemGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "valid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsItemInRange"] = {
	key = "C_Item.IsItemInRange",
	name = "IsItemInRange",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsItemInRange"],
	funcPath = "C_Item.IsItemInRange",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = {
				{ value = "state.itemId", label = "WeakAuras" },
				{ value = "self._state_action", label = "Bartender4" },
				{ value = "item", label = "BigWigs_Core" },
			},
		},
		{ name = "targetToken", type = "cstring", default = nil },
	},
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsItemKeystoneByID"] = {
	key = "C_Item.IsItemKeystoneByID",
	name = "IsItemKeystoneByID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsItemKeystoneByID"],
	funcPath = "C_Item.IsItemKeystoneByID",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "isKeystone", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsItemSpecificToPlayerClass"] = {
	key = "C_Item.IsItemSpecificToPlayerClass",
	name = "IsItemSpecificToPlayerClass",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsItemSpecificToPlayerClass"],
	funcPath = "C_Item.IsItemSpecificToPlayerClass",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "isItemSpecificToPlayerClass", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsLocked"] = {
	key = "C_Item.IsLocked",
	name = "IsLocked",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsLocked"],
	funcPath = "C_Item.IsLocked",
	params = {
		{
			name = "itemLocation",
			type = "ItemLocation",
			default = nil,
			examples = {
				{ value = "target", label = "Baganator" },
				{ value = "move[1]", label = "Baganator" },
				{ value = "move[2]", label = "Baganator" },
			},
		},
	},
	returns = { { name = "isLocked", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsRelicItem"] = {
	key = "C_Item.IsRelicItem",
	name = "IsRelicItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsRelicItem"],
	funcPath = "C_Item.IsRelicItem",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.IsUsableItem"] = {
	key = "C_Item.IsUsableItem",
	name = "IsUsableItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["IsUsableItem"],
	funcPath = "C_Item.IsUsableItem",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = {
		{ name = "usable", type = "bool", canBeSecret = false },
		{ name = "noMana", type = "bool", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.ItemHasRange"] = {
	key = "C_Item.ItemHasRange",
	name = "ItemHasRange",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["ItemHasRange"],
	funcPath = "C_Item.ItemHasRange",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "result", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.LockItem"] = {
	key = "C_Item.LockItem",
	name = "LockItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["LockItem"],
	funcPath = "C_Item.LockItem",
	params = {
		{
			name = "itemLocation",
			type = "ItemLocation",
			default = nil,
			examples = {
				{ value = [=[LeaMapsCB["UnlockMap"]]=], label = "Leatrix_Maps" },
				{ value = [=[LeaMapsCB["ScaleWorldMap"]]=], label = "Leatrix_Maps" },
				{ value = "item", label = "Leatrix_Maps" },
			},
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.LockItemByGUID"] = {
	key = "C_Item.LockItemByGUID",
	name = "LockItemByGUID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["LockItemByGUID"],
	funcPath = "C_Item.LockItemByGUID",
	params = { { name = "itemGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.PickupItem"] = {
	key = "C_Item.PickupItem",
	name = "PickupItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["PickupItem"],
	funcPath = "C_Item.PickupItem",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = {
				{ value = "target", label = "Bartender4" },
				{ value = [=["item:"..gemID]=], label = "Narcissus" },
			},
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.RequestLoadItemData"] = {
	key = "C_Item.RequestLoadItemData",
	name = "RequestLoadItemData",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["RequestLoadItemData"],
	funcPath = "C_Item.RequestLoadItemData",
	params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.RequestLoadItemDataByID"] = {
	key = "C_Item.RequestLoadItemDataByID",
	name = "RequestLoadItemDataByID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["RequestLoadItemDataByID"],
	funcPath = "C_Item.RequestLoadItemDataByID",
	params = {
		{
			name = "itemInfo",
			type = "ItemInfo",
			default = nil,
			examples = { { value = "item.itemID", label = "Baganator" }, { value = "item", label = "Narcissus" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.UnlockItem"] = {
	key = "C_Item.UnlockItem",
	name = "UnlockItem",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["UnlockItem"],
	funcPath = "C_Item.UnlockItem",
	params = { { name = "itemLocation", type = "ItemLocation", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.UnlockItemByGUID"] = {
	key = "C_Item.UnlockItemByGUID",
	name = "UnlockItemByGUID",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["UnlockItemByGUID"],
	funcPath = "C_Item.UnlockItemByGUID",
	params = { { name = "itemGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Item.UseItemByName"] = {
	key = "C_Item.UseItemByName",
	name = "UseItemByName",
	category = "combat_midnight",
	subcategory = "c_item",
	func = _G["C_Item"] and _G["C_Item"]["UseItemByName"],
	funcPath = "C_Item.UseItemByName",
	params = {
		{ name = "itemInfo", type = "ItemInfo", default = nil },
		{ name = "target", type = "cstring", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

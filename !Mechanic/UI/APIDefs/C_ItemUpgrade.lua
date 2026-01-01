-- Generated APIDefinitions for namespace: C_ItemUpgrade
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ItemUpgrade.CanUpgradeItem"] = {
	key = "C_ItemUpgrade.CanUpgradeItem",
	name = "CanUpgradeItem",
	category = "combat_midnight",
	subcategory = "c_itemupgrade",
	func = _G["C_ItemUpgrade"] and _G["C_ItemUpgrade"]["CanUpgradeItem"],
	funcPath = "C_ItemUpgrade.CanUpgradeItem",
	params = { { name = "baseItem", type = "ItemLocation", default = nil } },
	returns = { { name = "isValid", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemUpgrade.GetHighWatermarkForItem"] = {
	key = "C_ItemUpgrade.GetHighWatermarkForItem",
	name = "GetHighWatermarkForItem",
	category = "combat_midnight",
	subcategory = "c_itemupgrade",
	func = _G["C_ItemUpgrade"] and _G["C_ItemUpgrade"]["GetHighWatermarkForItem"],
	funcPath = "C_ItemUpgrade.GetHighWatermarkForItem",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = {
		{ name = "characterHighWatermark", type = "number", canBeSecret = false },
		{ name = "accountHighWatermark", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemUpgrade.GetHighWatermarkForSlot"] = {
	key = "C_ItemUpgrade.GetHighWatermarkForSlot",
	name = "GetHighWatermarkForSlot",
	category = "combat_midnight",
	subcategory = "c_itemupgrade",
	func = _G["C_ItemUpgrade"] and _G["C_ItemUpgrade"]["GetHighWatermarkForSlot"],
	funcPath = "C_ItemUpgrade.GetHighWatermarkForSlot",
	params = { { name = "itemRedundancySlot", type = "number", default = nil } },
	returns = {
		{ name = "characterHighWatermark", type = "number", canBeSecret = false },
		{ name = "accountHighWatermark", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemUpgrade.GetHighWatermarkSlotForItem"] = {
	key = "C_ItemUpgrade.GetHighWatermarkSlotForItem",
	name = "GetHighWatermarkSlotForItem",
	category = "combat_midnight",
	subcategory = "c_itemupgrade",
	func = _G["C_ItemUpgrade"] and _G["C_ItemUpgrade"]["GetHighWatermarkSlotForItem"],
	funcPath = "C_ItemUpgrade.GetHighWatermarkSlotForItem",
	params = { { name = "itemInfo", type = "ItemInfo", default = nil } },
	returns = { { name = "itemRedundancySlot", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemUpgrade.GetItemUpgradeEffect"] = {
	key = "C_ItemUpgrade.GetItemUpgradeEffect",
	name = "GetItemUpgradeEffect",
	category = "combat_midnight",
	subcategory = "c_itemupgrade",
	func = _G["C_ItemUpgrade"] and _G["C_ItemUpgrade"]["GetItemUpgradeEffect"],
	funcPath = "C_ItemUpgrade.GetItemUpgradeEffect",
	params = {
		{ name = "effectIndex", type = "number", default = nil },
		{ name = "numUpgradeLevels", type = "number", default = nil },
	},
	returns = {
		{ name = "outBaseEffect", type = "string", canBeSecret = false },
		{ name = "outUpgradedEffect", type = "string", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemUpgrade.GetItemUpgradePvpItemLevelDeltaValues"] = {
	key = "C_ItemUpgrade.GetItemUpgradePvpItemLevelDeltaValues",
	name = "GetItemUpgradePvpItemLevelDeltaValues",
	category = "combat_midnight",
	subcategory = "c_itemupgrade",
	func = _G["C_ItemUpgrade"] and _G["C_ItemUpgrade"]["GetItemUpgradePvpItemLevelDeltaValues"],
	funcPath = "C_ItemUpgrade.GetItemUpgradePvpItemLevelDeltaValues",
	params = { { name = "numUpgradeLevels", type = "number", default = nil } },
	returns = {
		{ name = "currentPvPItemLevel", type = "number", canBeSecret = false },
		{ name = "upgradedPvPItemLevel", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemUpgrade.SetItemUpgradeFromLocation"] = {
	key = "C_ItemUpgrade.SetItemUpgradeFromLocation",
	name = "SetItemUpgradeFromLocation",
	category = "combat_midnight",
	subcategory = "c_itemupgrade",
	func = _G["C_ItemUpgrade"] and _G["C_ItemUpgrade"]["SetItemUpgradeFromLocation"],
	funcPath = "C_ItemUpgrade.SetItemUpgradeFromLocation",
	params = { { name = "itemToSet", type = "ItemLocation", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ItemUpgrade.UpgradeItem"] = {
	key = "C_ItemUpgrade.UpgradeItem",
	name = "UpgradeItem",
	category = "combat_midnight",
	subcategory = "c_itemupgrade",
	func = _G["C_ItemUpgrade"] and _G["C_ItemUpgrade"]["UpgradeItem"],
	funcPath = "C_ItemUpgrade.UpgradeItem",
	params = { { name = "numUpgrades", type = "number", default = 1 } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_Mail
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Mail.GetCraftingOrderMailInfo"] = {
	key = "C_Mail.GetCraftingOrderMailInfo",
	name = "GetCraftingOrderMailInfo",
	category = "combat_midnight",
	subcategory = "c_mail",
	func = _G["C_Mail"] and _G["C_Mail"]["GetCraftingOrderMailInfo"],
	funcPath = "C_Mail.GetCraftingOrderMailInfo",
	params = { { name = "inboxIndex", type = "luaIndex", default = nil } },
	returns = { { name = "info", type = "CraftingOrderMailInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Mail.HasInboxMoney"] = {
	key = "C_Mail.HasInboxMoney",
	name = "HasInboxMoney",
	category = "combat_midnight",
	subcategory = "c_mail",
	func = _G["C_Mail"] and _G["C_Mail"]["HasInboxMoney"],
	funcPath = "C_Mail.HasInboxMoney",
	params = { { name = "inboxIndex", type = "luaIndex", default = nil } },
	returns = { { name = "inboxItemHasMoneyAttached", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Mail.SetOpeningAll"] = {
	key = "C_Mail.SetOpeningAll",
	name = "SetOpeningAll",
	category = "combat_midnight",
	subcategory = "c_mail",
	func = _G["C_Mail"] and _G["C_Mail"]["SetOpeningAll"],
	funcPath = "C_Mail.SetOpeningAll",
	params = { { name = "openingAll", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

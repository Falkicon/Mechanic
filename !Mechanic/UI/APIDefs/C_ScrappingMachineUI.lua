-- Generated APIDefinitions for namespace: C_ScrappingMachineUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ScrappingMachineUI.DropPendingScrapItemFromCursor"] = {
	key = "C_ScrappingMachineUI.DropPendingScrapItemFromCursor",
	name = "DropPendingScrapItemFromCursor",
	category = "combat_midnight",
	subcategory = "c_scrappingmachineui",
	func = _G["C_ScrappingMachineUI"] and _G["C_ScrappingMachineUI"]["DropPendingScrapItemFromCursor"],
	funcPath = "C_ScrappingMachineUI.DropPendingScrapItemFromCursor",
	params = { { name = "index", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScrappingMachineUI.GetCurrentPendingScrapItemLocationByIndex"] = {
	key = "C_ScrappingMachineUI.GetCurrentPendingScrapItemLocationByIndex",
	name = "GetCurrentPendingScrapItemLocationByIndex",
	category = "combat_midnight",
	subcategory = "c_scrappingmachineui",
	func = _G["C_ScrappingMachineUI"] and _G["C_ScrappingMachineUI"]["GetCurrentPendingScrapItemLocationByIndex"],
	funcPath = "C_ScrappingMachineUI.GetCurrentPendingScrapItemLocationByIndex",
	params = { { name = "index", type = "number", default = nil } },
	returns = { { name = "itemLoc", type = "ItemLocation", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScrappingMachineUI.RemoveItemToScrap"] = {
	key = "C_ScrappingMachineUI.RemoveItemToScrap",
	name = "RemoveItemToScrap",
	category = "combat_midnight",
	subcategory = "c_scrappingmachineui",
	func = _G["C_ScrappingMachineUI"] and _G["C_ScrappingMachineUI"]["RemoveItemToScrap"],
	funcPath = "C_ScrappingMachineUI.RemoveItemToScrap",
	params = { { name = "index", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

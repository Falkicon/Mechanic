-- Generated APIDefinitions for namespace: C_TooltipComparison
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_TooltipComparison.GetItemComparisonDelta"] = {
	key = "C_TooltipComparison.GetItemComparisonDelta",
	name = "GetItemComparisonDelta",
	category = "combat_midnight",
	subcategory = "c_tooltipcomparison",
	func = _G["C_TooltipComparison"] and _G["C_TooltipComparison"]["GetItemComparisonDelta"],
	funcPath = "C_TooltipComparison.GetItemComparisonDelta",
	params = {
		{ name = "comparisonItem", type = "TooltipComparisonItem", default = nil },
		{ name = "equippedItem", type = "TooltipComparisonItem", default = nil },
		{ name = "pairedItem", type = "TooltipComparisonItem", default = nil },
		{ name = "addPairedStats", type = "bool", default = nil },
	},
	returns = { { name = "lines", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipComparison.GetItemComparisonInfo"] = {
	key = "C_TooltipComparison.GetItemComparisonInfo",
	name = "GetItemComparisonInfo",
	category = "combat_midnight",
	subcategory = "c_tooltipcomparison",
	func = _G["C_TooltipComparison"] and _G["C_TooltipComparison"]["GetItemComparisonInfo"],
	funcPath = "C_TooltipComparison.GetItemComparisonInfo",
	params = { { name = "comparisonItem", type = "TooltipComparisonItem", default = nil } },
	returns = { { name = "info", type = "TooltipItemComparisonInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

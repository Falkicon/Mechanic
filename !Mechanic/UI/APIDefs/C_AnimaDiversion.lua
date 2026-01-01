-- Generated APIDefinitions for namespace: C_AnimaDiversion
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AnimaDiversion.SelectAnimaNode"] = {
	key = "C_AnimaDiversion.SelectAnimaNode",
	name = "SelectAnimaNode",
	category = "combat_midnight",
	subcategory = "c_animadiversion",
	func = _G["C_AnimaDiversion"] and _G["C_AnimaDiversion"]["SelectAnimaNode"],
	funcPath = "C_AnimaDiversion.SelectAnimaNode",
	params = {
		{ name = "talentID", type = "number", default = nil },
		{ name = "temporary", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

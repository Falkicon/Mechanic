-- Generated APIDefinitions for namespace: C_SocialRestrictions
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SocialRestrictions.SetChatDisabled"] = {
	key = "C_SocialRestrictions.SetChatDisabled",
	name = "SetChatDisabled",
	category = "combat_midnight",
	subcategory = "c_socialrestrictions",
	func = _G["C_SocialRestrictions"] and _G["C_SocialRestrictions"]["SetChatDisabled"],
	funcPath = "C_SocialRestrictions.SetChatDisabled",
	params = { { name = "disabled", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

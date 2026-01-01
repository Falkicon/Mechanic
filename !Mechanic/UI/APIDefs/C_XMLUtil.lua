-- Generated APIDefinitions for namespace: C_XMLUtil
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_XMLUtil.GetTemplateInfo"] = {
	key = "C_XMLUtil.GetTemplateInfo",
	name = "GetTemplateInfo",
	category = "combat_midnight",
	subcategory = "c_xmlutil",
	func = _G["C_XMLUtil"] and _G["C_XMLUtil"]["GetTemplateInfo"],
	funcPath = "C_XMLUtil.GetTemplateInfo",
	params = {
		{
			name = "name",
			type = "cstring",
			default = nil,
			examples = { { value = "BackpackTokenTemplate", label = "Baganator" } },
		},
	},
	returns = { { name = "info", type = "XMLTemplateInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

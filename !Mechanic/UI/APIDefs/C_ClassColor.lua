-- Generated APIDefinitions for namespace: C_ClassColor
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ClassColor.GetClassColor"] = {
	key = "C_ClassColor.GetClassColor",
	name = "GetClassColor",
	category = "combat_midnight",
	subcategory = "c_classcolor",
	func = _G["C_ClassColor"] and _G["C_ClassColor"]["GetClassColor"],
	funcPath = "C_ClassColor.GetClassColor",
	params = {
		{
			name = "className",
			type = "string",
			default = nil,
			examples = { { value = [=[cooldownLine.class or "PRIEST"]=], label = "Details" } },
		},
	},
	returns = { { name = "classColor", type = "colorRGB", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

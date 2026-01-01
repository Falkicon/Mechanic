-- Generated APIDefinitions for namespace: C_RemixArtifactUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_RemixArtifactUI.GetAppearanceInfoByID"] = {
	key = "C_RemixArtifactUI.GetAppearanceInfoByID",
	name = "GetAppearanceInfoByID",
	category = "combat_midnight",
	subcategory = "c_remixartifactui",
	func = _G["C_RemixArtifactUI"] and _G["C_RemixArtifactUI"]["GetAppearanceInfoByID"],
	funcPath = "C_RemixArtifactUI.GetAppearanceInfoByID",
	params = { { name = "artifactAppearanceID", type = "number", default = nil } },
	returns = {
		{ name = "uiCameraID", type = "number", canBeSecret = false },
		{ name = "altHandUICameraID", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_RemixArtifactUI.ItemInSlotIsRemixArtifact"] = {
	key = "C_RemixArtifactUI.ItemInSlotIsRemixArtifact",
	name = "ItemInSlotIsRemixArtifact",
	category = "combat_midnight",
	subcategory = "c_remixartifactui",
	func = _G["C_RemixArtifactUI"] and _G["C_RemixArtifactUI"]["ItemInSlotIsRemixArtifact"],
	funcPath = "C_RemixArtifactUI.ItemInSlotIsRemixArtifact",
	params = {
		{ name = "invSlot", type = "luaIndex", default = nil, examples = { { value = 16, label = "Plumber" } } },
	},
	returns = { { name = "isRemixArtifact", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

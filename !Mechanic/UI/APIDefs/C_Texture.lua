-- Generated APIDefinitions for namespace: C_Texture
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Texture.ClearTitleIconTexture"] = {
	key = "C_Texture.ClearTitleIconTexture",
	name = "ClearTitleIconTexture",
	category = "combat_midnight",
	subcategory = "c_texture",
	func = _G["C_Texture"] and _G["C_Texture"]["ClearTitleIconTexture"],
	funcPath = "C_Texture.ClearTitleIconTexture",
	params = { { name = "texture", type = "SimpleTexture", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Texture.GetAtlasElementID"] = {
	key = "C_Texture.GetAtlasElementID",
	name = "GetAtlasElementID",
	category = "combat_midnight",
	subcategory = "c_texture",
	func = _G["C_Texture"] and _G["C_Texture"]["GetAtlasElementID"],
	funcPath = "C_Texture.GetAtlasElementID",
	params = { { name = "atlas", type = "textureAtlas", default = nil } },
	returns = { { name = "elementID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Texture.GetAtlasExists"] = {
	key = "C_Texture.GetAtlasExists",
	name = "GetAtlasExists",
	category = "combat_midnight",
	subcategory = "c_texture",
	func = _G["C_Texture"] and _G["C_Texture"]["GetAtlasExists"],
	funcPath = "C_Texture.GetAtlasExists",
	params = { { name = "atlas", type = "textureAtlas", default = nil } },
	returns = { { name = "atlasExists", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Texture.GetAtlasID"] = {
	key = "C_Texture.GetAtlasID",
	name = "GetAtlasID",
	category = "combat_midnight",
	subcategory = "c_texture",
	func = _G["C_Texture"] and _G["C_Texture"]["GetAtlasID"],
	funcPath = "C_Texture.GetAtlasID",
	params = { { name = "atlas", type = "textureAtlas", default = nil } },
	returns = { { name = "atlasID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Texture.GetAtlasInfo"] = {
	key = "C_Texture.GetAtlasInfo",
	name = "GetAtlasInfo",
	category = "combat_midnight",
	subcategory = "c_texture",
	func = _G["C_Texture"] and _G["C_Texture"]["GetAtlasInfo"],
	funcPath = "C_Texture.GetAtlasInfo",
	params = {
		{
			name = "atlas",
			type = "textureAtlas",
			default = nil,
			examples = {
				{ value = "AnimCreate_Icon_Folder", label = "Baganator" },
				{ value = "D4:GetRaceAtlas(race", label = "MoveAny" },
				{ value = "ShipMissionIcon-Bonus-MapBadge", label = "MRT" },
			},
		},
	},
	returns = { { name = "info", type = "AtlasInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Texture.GetFilenameFromFileDataID"] = {
	key = "C_Texture.GetFilenameFromFileDataID",
	name = "GetFilenameFromFileDataID",
	category = "combat_midnight",
	subcategory = "c_texture",
	func = _G["C_Texture"] and _G["C_Texture"]["GetFilenameFromFileDataID"],
	funcPath = "C_Texture.GetFilenameFromFileDataID",
	params = { { name = "fileDataID", type = "number", default = nil } },
	returns = { { name = "filename", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Texture.GetTitleIconTexture"] = {
	key = "C_Texture.GetTitleIconTexture",
	name = "GetTitleIconTexture",
	category = "combat_midnight",
	subcategory = "c_texture",
	func = _G["C_Texture"] and _G["C_Texture"]["GetTitleIconTexture"],
	funcPath = "C_Texture.GetTitleIconTexture",
	params = {
		{ name = "titleID", type = "string", default = nil },
		{ name = "version", type = "TitleIconVersion", default = nil },
		{ name = "callback", type = "GetTitleIconTextureCallback", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Texture.IsTitleIconTextureReady"] = {
	key = "C_Texture.IsTitleIconTextureReady",
	name = "IsTitleIconTextureReady",
	category = "combat_midnight",
	subcategory = "c_texture",
	func = _G["C_Texture"] and _G["C_Texture"]["IsTitleIconTextureReady"],
	funcPath = "C_Texture.IsTitleIconTextureReady",
	params = {
		{ name = "titleID", type = "string", default = nil },
		{ name = "version", type = "TitleIconVersion", default = nil },
	},
	returns = { { name = "ready", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Texture.SetTitleIconTexture"] = {
	key = "C_Texture.SetTitleIconTexture",
	name = "SetTitleIconTexture",
	category = "combat_midnight",
	subcategory = "c_texture",
	func = _G["C_Texture"] and _G["C_Texture"]["SetTitleIconTexture"],
	funcPath = "C_Texture.SetTitleIconTexture",
	params = {
		{ name = "texture", type = "SimpleTexture", default = nil },
		{ name = "titleID", type = "string", default = nil },
		{ name = "version", type = "TitleIconVersion", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Texture.SetURLTexture"] = {
	key = "C_Texture.SetURLTexture",
	name = "SetURLTexture",
	category = "combat_midnight",
	subcategory = "c_texture",
	func = _G["C_Texture"] and _G["C_Texture"]["SetURLTexture"],
	funcPath = "C_Texture.SetURLTexture",
	params = {
		{ name = "texture", type = "SimpleTexture", default = nil },
		{ name = "url", type = "cstring", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

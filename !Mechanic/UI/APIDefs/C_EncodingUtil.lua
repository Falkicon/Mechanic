-- Generated APIDefinitions for namespace: C_EncodingUtil
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_EncodingUtil.CompressString"] = {
	key = "C_EncodingUtil.CompressString",
	name = "CompressString",
	category = "combat_midnight",
	subcategory = "c_encodingutil",
	func = _G["C_EncodingUtil"] and _G["C_EncodingUtil"]["CompressString"],
	funcPath = "C_EncodingUtil.CompressString",
	params = {
		{ name = "source", type = "stringView", default = nil },
		{ name = "method", type = "CompressionMethod", default = "Deflate" },
		{ name = "level", type = "CompressionLevel", default = "Default" },
	},
	returns = { { name = "output", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncodingUtil.DecodeBase64"] = {
	key = "C_EncodingUtil.DecodeBase64",
	name = "DecodeBase64",
	category = "combat_midnight",
	subcategory = "c_encodingutil",
	func = _G["C_EncodingUtil"] and _G["C_EncodingUtil"]["DecodeBase64"],
	funcPath = "C_EncodingUtil.DecodeBase64",
	params = {
		{
			name = "source",
			type = "stringView",
			default = nil,
			examples = { { value = "string.gsub(data", label = "Plater" } },
		},
		{ name = "variant", type = "Base64Variant", default = "Standard" },
	},
	returns = { { name = "output", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncodingUtil.DecodeHex"] = {
	key = "C_EncodingUtil.DecodeHex",
	name = "DecodeHex",
	category = "combat_midnight",
	subcategory = "c_encodingutil",
	func = _G["C_EncodingUtil"] and _G["C_EncodingUtil"]["DecodeHex"],
	funcPath = "C_EncodingUtil.DecodeHex",
	params = { { name = "source", type = "string", default = nil } },
	returns = { { name = "output", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncodingUtil.DecompressString"] = {
	key = "C_EncodingUtil.DecompressString",
	name = "DecompressString",
	category = "combat_midnight",
	subcategory = "c_encodingutil",
	func = _G["C_EncodingUtil"] and _G["C_EncodingUtil"]["DecompressString"],
	funcPath = "C_EncodingUtil.DecompressString",
	params = {
		{ name = "source", type = "stringView", default = nil },
		{ name = "method", type = "CompressionMethod", default = "Deflate" },
	},
	returns = { { name = "output", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncodingUtil.DeserializeCBOR"] = {
	key = "C_EncodingUtil.DeserializeCBOR",
	name = "DeserializeCBOR",
	category = "combat_midnight",
	subcategory = "c_encodingutil",
	func = _G["C_EncodingUtil"] and _G["C_EncodingUtil"]["DeserializeCBOR"],
	funcPath = "C_EncodingUtil.DeserializeCBOR",
	params = { { name = "source", type = "stringView", default = nil } },
	returns = { { name = "value", type = "LuaValueVariant", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncodingUtil.DeserializeJSON"] = {
	key = "C_EncodingUtil.DeserializeJSON",
	name = "DeserializeJSON",
	category = "combat_midnight",
	subcategory = "c_encodingutil",
	func = _G["C_EncodingUtil"] and _G["C_EncodingUtil"]["DeserializeJSON"],
	funcPath = "C_EncodingUtil.DeserializeJSON",
	params = { { name = "source", type = "string", default = nil } },
	returns = { { name = "value", type = "LuaValueVariant", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncodingUtil.EncodeBase64"] = {
	key = "C_EncodingUtil.EncodeBase64",
	name = "EncodeBase64",
	category = "combat_midnight",
	subcategory = "c_encodingutil",
	func = _G["C_EncodingUtil"] and _G["C_EncodingUtil"]["EncodeBase64"],
	funcPath = "C_EncodingUtil.EncodeBase64",
	params = {
		{ name = "source", type = "stringView", default = nil },
		{ name = "variant", type = "Base64Variant", default = "Standard" },
	},
	returns = { { name = "output", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncodingUtil.EncodeHex"] = {
	key = "C_EncodingUtil.EncodeHex",
	name = "EncodeHex",
	category = "combat_midnight",
	subcategory = "c_encodingutil",
	func = _G["C_EncodingUtil"] and _G["C_EncodingUtil"]["EncodeHex"],
	funcPath = "C_EncodingUtil.EncodeHex",
	params = { { name = "source", type = "stringView", default = nil } },
	returns = { { name = "output", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncodingUtil.SerializeCBOR"] = {
	key = "C_EncodingUtil.SerializeCBOR",
	name = "SerializeCBOR",
	category = "combat_midnight",
	subcategory = "c_encodingutil",
	func = _G["C_EncodingUtil"] and _G["C_EncodingUtil"]["SerializeCBOR"],
	funcPath = "C_EncodingUtil.SerializeCBOR",
	params = {
		{ name = "value", type = "LuaValueVariant", default = nil },
		{ name = "options", type = "CBORSerializationOptions", default = nil },
	},
	returns = { { name = "output", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncodingUtil.SerializeJSON"] = {
	key = "C_EncodingUtil.SerializeJSON",
	name = "SerializeJSON",
	category = "combat_midnight",
	subcategory = "c_encodingutil",
	func = _G["C_EncodingUtil"] and _G["C_EncodingUtil"]["SerializeJSON"],
	funcPath = "C_EncodingUtil.SerializeJSON",
	params = {
		{ name = "value", type = "LuaValueVariant", default = nil },
		{ name = "options", type = "JSONSerializationOptions", default = nil },
	},
	returns = { { name = "output", type = "string", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

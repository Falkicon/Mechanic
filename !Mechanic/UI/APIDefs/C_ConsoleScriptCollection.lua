-- Generated APIDefinitions for namespace: C_ConsoleScriptCollection
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ConsoleScriptCollection.GetCollectionDataByID"] = {
	key = "C_ConsoleScriptCollection.GetCollectionDataByID",
	name = "GetCollectionDataByID",
	category = "combat_midnight",
	subcategory = "c_consolescriptcollection",
	func = _G["C_ConsoleScriptCollection"] and _G["C_ConsoleScriptCollection"]["GetCollectionDataByID"],
	funcPath = "C_ConsoleScriptCollection.GetCollectionDataByID",
	params = { { name = "collectionID", type = "number", default = nil } },
	returns = { { name = "data", type = "ConsoleScriptCollectionData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ConsoleScriptCollection.GetCollectionDataByTag"] = {
	key = "C_ConsoleScriptCollection.GetCollectionDataByTag",
	name = "GetCollectionDataByTag",
	category = "combat_midnight",
	subcategory = "c_consolescriptcollection",
	func = _G["C_ConsoleScriptCollection"] and _G["C_ConsoleScriptCollection"]["GetCollectionDataByTag"],
	funcPath = "C_ConsoleScriptCollection.GetCollectionDataByTag",
	params = { { name = "collectionTag", type = "string", default = nil } },
	returns = { { name = "data", type = "ConsoleScriptCollectionData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ConsoleScriptCollection.GetElements"] = {
	key = "C_ConsoleScriptCollection.GetElements",
	name = "GetElements",
	category = "combat_midnight",
	subcategory = "c_consolescriptcollection",
	func = _G["C_ConsoleScriptCollection"] and _G["C_ConsoleScriptCollection"]["GetElements"],
	funcPath = "C_ConsoleScriptCollection.GetElements",
	params = { { name = "collectionID", type = "number", default = nil } },
	returns = { { name = "elementIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ConsoleScriptCollection.GetScriptData"] = {
	key = "C_ConsoleScriptCollection.GetScriptData",
	name = "GetScriptData",
	category = "combat_midnight",
	subcategory = "c_consolescriptcollection",
	func = _G["C_ConsoleScriptCollection"] and _G["C_ConsoleScriptCollection"]["GetScriptData"],
	funcPath = "C_ConsoleScriptCollection.GetScriptData",
	params = { { name = "consoleScriptID", type = "number", default = nil } },
	returns = { { name = "data", type = "ConsoleScriptData", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_HouseEditor
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HouseEditor.ActivateHouseEditorMode"] = {
	key = "C_HouseEditor.ActivateHouseEditorMode",
	name = "ActivateHouseEditorMode",
	category = "combat_midnight",
	subcategory = "c_houseeditor",
	func = _G["C_HouseEditor"] and _G["C_HouseEditor"]["ActivateHouseEditorMode"],
	funcPath = "C_HouseEditor.ActivateHouseEditorMode",
	params = { { name = "editMode", type = "HouseEditorMode", default = nil } },
	returns = { { name = "result", type = "HousingResult", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HouseEditor.GetHouseEditorModeAvailability"] = {
	key = "C_HouseEditor.GetHouseEditorModeAvailability",
	name = "GetHouseEditorModeAvailability",
	category = "combat_midnight",
	subcategory = "c_houseeditor",
	func = _G["C_HouseEditor"] and _G["C_HouseEditor"]["GetHouseEditorModeAvailability"],
	funcPath = "C_HouseEditor.GetHouseEditorModeAvailability",
	params = { { name = "editMode", type = "HouseEditorMode", default = nil } },
	returns = { { name = "result", type = "HousingResult", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HouseEditor.IsHouseEditorModeActive"] = {
	key = "C_HouseEditor.IsHouseEditorModeActive",
	name = "IsHouseEditorModeActive",
	category = "combat_midnight",
	subcategory = "c_houseeditor",
	func = _G["C_HouseEditor"] and _G["C_HouseEditor"]["IsHouseEditorModeActive"],
	funcPath = "C_HouseEditor.IsHouseEditorModeActive",
	params = { { name = "editMode", type = "HouseEditorMode", default = nil } },
	returns = { { name = "isModeActive", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

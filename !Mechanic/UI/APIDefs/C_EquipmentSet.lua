-- Generated APIDefinitions for namespace: C_EquipmentSet
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_EquipmentSet.AssignSpecToEquipmentSet"] = {
	key = "C_EquipmentSet.AssignSpecToEquipmentSet",
	name = "AssignSpecToEquipmentSet",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["AssignSpecToEquipmentSet"],
	funcPath = "C_EquipmentSet.AssignSpecToEquipmentSet",
	params = {
		{ name = "equipmentSetID", type = "number", default = nil },
		{ name = "specIndex", type = "luaIndex", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.CreateEquipmentSet"] = {
	key = "C_EquipmentSet.CreateEquipmentSet",
	name = "CreateEquipmentSet",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["CreateEquipmentSet"],
	funcPath = "C_EquipmentSet.CreateEquipmentSet",
	params = {
		{ name = "equipmentSetName", type = "cstring", default = nil },
		{ name = "icon", type = "cstring", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.DeleteEquipmentSet"] = {
	key = "C_EquipmentSet.DeleteEquipmentSet",
	name = "DeleteEquipmentSet",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["DeleteEquipmentSet"],
	funcPath = "C_EquipmentSet.DeleteEquipmentSet",
	params = { { name = "equipmentSetID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.EquipmentSetContainsLockedItems"] = {
	key = "C_EquipmentSet.EquipmentSetContainsLockedItems",
	name = "EquipmentSetContainsLockedItems",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["EquipmentSetContainsLockedItems"],
	funcPath = "C_EquipmentSet.EquipmentSetContainsLockedItems",
	params = { { name = "equipmentSetID", type = "number", default = nil } },
	returns = { { name = "hasLockedItems", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.GetEquipmentSetAssignedSpec"] = {
	key = "C_EquipmentSet.GetEquipmentSetAssignedSpec",
	name = "GetEquipmentSetAssignedSpec",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["GetEquipmentSetAssignedSpec"],
	funcPath = "C_EquipmentSet.GetEquipmentSetAssignedSpec",
	params = { { name = "equipmentSetID", type = "number", default = nil } },
	returns = { { name = "specIndex", type = "luaIndex", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.GetEquipmentSetForSpec"] = {
	key = "C_EquipmentSet.GetEquipmentSetForSpec",
	name = "GetEquipmentSetForSpec",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["GetEquipmentSetForSpec"],
	funcPath = "C_EquipmentSet.GetEquipmentSetForSpec",
	params = { { name = "specIndex", type = "luaIndex", default = nil } },
	returns = { { name = "equipmentSetID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.GetEquipmentSetID"] = {
	key = "C_EquipmentSet.GetEquipmentSetID",
	name = "GetEquipmentSetID",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["GetEquipmentSetID"],
	funcPath = "C_EquipmentSet.GetEquipmentSetID",
	params = { { name = "equipmentSetName", type = "cstring", default = nil } },
	returns = { { name = "equipmentSetID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.GetEquipmentSetInfo"] = {
	key = "C_EquipmentSet.GetEquipmentSetInfo",
	name = "GetEquipmentSetInfo",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["GetEquipmentSetInfo"],
	funcPath = "C_EquipmentSet.GetEquipmentSetInfo",
	params = {
		{
			name = "equipmentSetID",
			type = "number",
			default = nil,
			examples = {
				{ value = "id", label = "WeakAuras" },
				{ value = "location", label = "Baganator" },
				{ value = "location", label = "Baganator" },
			},
		},
	},
	returns = {
		{ name = "name", type = "string", canBeSecret = false },
		{ name = "iconFileID", type = "number", canBeSecret = false },
		{ name = "setID", type = "number", canBeSecret = false },
		{ name = "isEquipped", type = "bool", canBeSecret = false },
		{ name = "numItems", type = "number", canBeSecret = false },
		{ name = "numEquipped", type = "number", canBeSecret = false },
		{ name = "numInInventory", type = "number", canBeSecret = false },
		{ name = "numLost", type = "number", canBeSecret = false },
		{ name = "numIgnored", type = "number", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.GetIgnoredSlots"] = {
	key = "C_EquipmentSet.GetIgnoredSlots",
	name = "GetIgnoredSlots",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["GetIgnoredSlots"],
	funcPath = "C_EquipmentSet.GetIgnoredSlots",
	params = { { name = "equipmentSetID", type = "number", default = nil } },
	returns = { { name = "slotIgnored", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.GetItemIDs"] = {
	key = "C_EquipmentSet.GetItemIDs",
	name = "GetItemIDs",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["GetItemIDs"],
	funcPath = "C_EquipmentSet.GetItemIDs",
	params = { { name = "equipmentSetID", type = "number", default = nil } },
	returns = { { name = "itemIDs", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.GetItemLocations"] = {
	key = "C_EquipmentSet.GetItemLocations",
	name = "GetItemLocations",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["GetItemLocations"],
	funcPath = "C_EquipmentSet.GetItemLocations",
	params = { { name = "equipmentSetID", type = "number", default = nil } },
	returns = { { name = "locations", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.IgnoreSlotForSave"] = {
	key = "C_EquipmentSet.IgnoreSlotForSave",
	name = "IgnoreSlotForSave",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["IgnoreSlotForSave"],
	funcPath = "C_EquipmentSet.IgnoreSlotForSave",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.IsSlotIgnoredForSave"] = {
	key = "C_EquipmentSet.IsSlotIgnoredForSave",
	name = "IsSlotIgnoredForSave",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["IsSlotIgnoredForSave"],
	funcPath = "C_EquipmentSet.IsSlotIgnoredForSave",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = { { name = "isSlotIgnored", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.ModifyEquipmentSet"] = {
	key = "C_EquipmentSet.ModifyEquipmentSet",
	name = "ModifyEquipmentSet",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["ModifyEquipmentSet"],
	funcPath = "C_EquipmentSet.ModifyEquipmentSet",
	params = {
		{ name = "equipmentSetID", type = "number", default = nil },
		{ name = "newName", type = "cstring", default = nil },
		{ name = "newIcon", type = "cstring", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.PickupEquipmentSet"] = {
	key = "C_EquipmentSet.PickupEquipmentSet",
	name = "PickupEquipmentSet",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["PickupEquipmentSet"],
	funcPath = "C_EquipmentSet.PickupEquipmentSet",
	params = {
		{
			name = "equipmentSetID",
			type = "number",
			default = nil,
			examples = { { value = "target", label = "Bartender4" } },
		},
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.SaveEquipmentSet"] = {
	key = "C_EquipmentSet.SaveEquipmentSet",
	name = "SaveEquipmentSet",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["SaveEquipmentSet"],
	funcPath = "C_EquipmentSet.SaveEquipmentSet",
	params = {
		{ name = "equipmentSetID", type = "number", default = nil },
		{ name = "icon", type = "cstring", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.UnassignEquipmentSetSpec"] = {
	key = "C_EquipmentSet.UnassignEquipmentSetSpec",
	name = "UnassignEquipmentSetSpec",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["UnassignEquipmentSetSpec"],
	funcPath = "C_EquipmentSet.UnassignEquipmentSetSpec",
	params = { { name = "equipmentSetID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.UnignoreSlotForSave"] = {
	key = "C_EquipmentSet.UnignoreSlotForSave",
	name = "UnignoreSlotForSave",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["UnignoreSlotForSave"],
	funcPath = "C_EquipmentSet.UnignoreSlotForSave",
	params = { { name = "slot", type = "luaIndex", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EquipmentSet.UseEquipmentSet"] = {
	key = "C_EquipmentSet.UseEquipmentSet",
	name = "UseEquipmentSet",
	category = "combat_midnight",
	subcategory = "c_equipmentset",
	func = _G["C_EquipmentSet"] and _G["C_EquipmentSet"]["UseEquipmentSet"],
	funcPath = "C_EquipmentSet.UseEquipmentSet",
	params = { { name = "equipmentSetID", type = "number", default = nil } },
	returns = { { name = "setWasEquipped", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_HousingLayout
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HousingLayout.AnyRoomsOnFloor"] = {
	key = "C_HousingLayout.AnyRoomsOnFloor",
	name = "AnyRoomsOnFloor",
	category = "combat_midnight",
	subcategory = "c_housinglayout",
	func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["AnyRoomsOnFloor"],
	funcPath = "C_HousingLayout.AnyRoomsOnFloor",
	params = { { name = "floor", type = "number", default = nil } },
	returns = { { name = "anyRooms", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingLayout.ConfirmStairChoice"] = {
	key = "C_HousingLayout.ConfirmStairChoice",
	name = "ConfirmStairChoice",
	category = "combat_midnight",
	subcategory = "c_housinglayout",
	func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["ConfirmStairChoice"],
	funcPath = "C_HousingLayout.ConfirmStairChoice",
	params = { { name = "choice", type = "HousingLayoutStairDirection", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingLayout.HasStairs"] = {
	key = "C_HousingLayout.HasStairs",
	name = "HasStairs",
	category = "combat_midnight",
	subcategory = "c_housinglayout",
	func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["HasStairs"],
	funcPath = "C_HousingLayout.HasStairs",
	params = { { name = "roomRecordID", type = "number", default = nil } },
	returns = { { name = "hasStairs", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingLayout.HasValidConnection"] = {
	key = "C_HousingLayout.HasValidConnection",
	name = "HasValidConnection",
	category = "combat_midnight",
	subcategory = "c_housinglayout",
	func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["HasValidConnection"],
	funcPath = "C_HousingLayout.HasValidConnection",
	params = {
		{ name = "roomGUID", type = "WOWGUID", default = nil },
		{ name = "componentID", type = "number", default = nil },
		{ name = "roomId", type = "number", default = nil },
	},
	returns = { { name = "canPlace", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingLayout.IsBaseRoom"] = {
	key = "C_HousingLayout.IsBaseRoom",
	name = "IsBaseRoom",
	category = "combat_midnight",
	subcategory = "c_housinglayout",
	func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["IsBaseRoom"],
	funcPath = "C_HousingLayout.IsBaseRoom",
	params = { { name = "roomGUID", type = "WOWGUID", default = nil } },
	returns = { { name = "isBaseRoom", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingLayout.MoveDraggedRoom"] = {
	key = "C_HousingLayout.MoveDraggedRoom",
	name = "MoveDraggedRoom",
	category = "combat_midnight",
	subcategory = "c_housinglayout",
	func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["MoveDraggedRoom"],
	funcPath = "C_HousingLayout.MoveDraggedRoom",
	params = {
		{ name = "sourceDoorIndex", type = "number", default = nil },
		{ name = "destRoom", type = "WOWGUID", default = nil },
		{ name = "destDoorIndex", type = "number", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingLayout.MoveLayoutCamera"] = {
	key = "C_HousingLayout.MoveLayoutCamera",
	name = "MoveLayoutCamera",
	category = "combat_midnight",
	subcategory = "c_housinglayout",
	func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["MoveLayoutCamera"],
	funcPath = "C_HousingLayout.MoveLayoutCamera",
	params = {
		{ name = "direction", type = "HousingLayoutCameraDirection", default = nil },
		{ name = "isPressed", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingLayout.RemoveRoom"] = {
	key = "C_HousingLayout.RemoveRoom",
	name = "RemoveRoom",
	category = "combat_midnight",
	subcategory = "c_housinglayout",
	func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["RemoveRoom"],
	funcPath = "C_HousingLayout.RemoveRoom",
	params = { { name = "roomGUID", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingLayout.RotateFocusedRoom"] = {
	key = "C_HousingLayout.RotateFocusedRoom",
	name = "RotateFocusedRoom",
	category = "combat_midnight",
	subcategory = "c_housinglayout",
	func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["RotateFocusedRoom"],
	funcPath = "C_HousingLayout.RotateFocusedRoom",
	params = { { name = "isLeft", type = "bool", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingLayout.RotateRoom"] = {
	key = "C_HousingLayout.RotateRoom",
	name = "RotateRoom",
	category = "combat_midnight",
	subcategory = "c_housinglayout",
	func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["RotateRoom"],
	funcPath = "C_HousingLayout.RotateRoom",
	params = {
		{ name = "roomGUID", type = "WOWGUID", default = nil },
		{ name = "isLeft", type = "bool", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingLayout.SelectFloorplan"] = {
	key = "C_HousingLayout.SelectFloorplan",
	name = "SelectFloorplan",
	category = "combat_midnight",
	subcategory = "c_housinglayout",
	func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["SelectFloorplan"],
	funcPath = "C_HousingLayout.SelectFloorplan",
	params = { { name = "roomID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingLayout.SetViewedFloor"] = {
	key = "C_HousingLayout.SetViewedFloor",
	name = "SetViewedFloor",
	category = "combat_midnight",
	subcategory = "c_housinglayout",
	func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["SetViewedFloor"],
	funcPath = "C_HousingLayout.SetViewedFloor",
	params = { { name = "floor", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingLayout.ZoomLayoutCamera"] = {
	key = "C_HousingLayout.ZoomLayoutCamera",
	name = "ZoomLayoutCamera",
	category = "combat_midnight",
	subcategory = "c_housinglayout",
	func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["ZoomLayoutCamera"],
	funcPath = "C_HousingLayout.ZoomLayoutCamera",
	params = { { name = "zoomIn", type = "bool", default = nil } },
	returns = { { name = "zoomChanged", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

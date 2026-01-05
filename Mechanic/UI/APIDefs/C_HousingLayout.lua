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

APIDefs["C_HousingLayout.CancelActiveLayoutEditing"] = {
    key = "C_HousingLayout.CancelActiveLayoutEditing",
    name = "CancelActiveLayoutEditing",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["CancelActiveLayoutEditing"],
    funcPath = "C_HousingLayout.CancelActiveLayoutEditing",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.ConfirmStairChoice"] = {
    key = "C_HousingLayout.ConfirmStairChoice",
    name = "ConfirmStairChoice",
    category = "combat_midnight",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["ConfirmStairChoice"],
    funcPath = "C_HousingLayout.ConfirmStairChoice",
    params = { { name = "choice", type = "HousingLayoutStairDirection", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingLayout.DeselectFloorplan"] = {
    key = "C_HousingLayout.DeselectFloorplan",
    name = "DeselectFloorplan",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["DeselectFloorplan"],
    funcPath = "C_HousingLayout.DeselectFloorplan",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.DeselectRoomOrDoor"] = {
    key = "C_HousingLayout.DeselectRoomOrDoor",
    name = "DeselectRoomOrDoor",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["DeselectRoomOrDoor"],
    funcPath = "C_HousingLayout.DeselectRoomOrDoor",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.GetNumActiveRooms"] = {
    key = "C_HousingLayout.GetNumActiveRooms",
    name = "GetNumActiveRooms",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["GetNumActiveRooms"],
    funcPath = "C_HousingLayout.GetNumActiveRooms",
    params = {  },
    returns = { { name = "numRooms", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.GetRoomPlacementBudget"] = {
    key = "C_HousingLayout.GetRoomPlacementBudget",
    name = "GetRoomPlacementBudget",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["GetRoomPlacementBudget"],
    funcPath = "C_HousingLayout.GetRoomPlacementBudget",
    params = {  },
    returns = { { name = "placementBudget", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.GetSelectedDoor"] = {
    key = "C_HousingLayout.GetSelectedDoor",
    name = "GetSelectedDoor",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["GetSelectedDoor"],
    funcPath = "C_HousingLayout.GetSelectedDoor",
    params = {  },
    returns = { { name = "selectedDoorComponentID", type = "number", canBeSecret = false }, { name = "roomGUID", type = "WOWGUID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.GetSelectedFloorplan"] = {
    key = "C_HousingLayout.GetSelectedFloorplan",
    name = "GetSelectedFloorplan",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["GetSelectedFloorplan"],
    funcPath = "C_HousingLayout.GetSelectedFloorplan",
    params = {  },
    returns = { { name = "roomID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.GetSelectedRoom"] = {
    key = "C_HousingLayout.GetSelectedRoom",
    name = "GetSelectedRoom",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["GetSelectedRoom"],
    funcPath = "C_HousingLayout.GetSelectedRoom",
    params = {  },
    returns = { { name = "roomGUID", type = "WOWGUID", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.GetSelectedStairwellRoomCount"] = {
    key = "C_HousingLayout.GetSelectedStairwellRoomCount",
    name = "GetSelectedStairwellRoomCount",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["GetSelectedStairwellRoomCount"],
    funcPath = "C_HousingLayout.GetSelectedStairwellRoomCount",
    params = {  },
    returns = { { name = "stairwellRoomCount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.GetSpentPlacementBudget"] = {
    key = "C_HousingLayout.GetSpentPlacementBudget",
    name = "GetSpentPlacementBudget",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["GetSpentPlacementBudget"],
    funcPath = "C_HousingLayout.GetSpentPlacementBudget",
    params = {  },
    returns = { { name = "spentPlacementBudget", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.GetViewedFloor"] = {
    key = "C_HousingLayout.GetViewedFloor",
    name = "GetViewedFloor",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["GetViewedFloor"],
    funcPath = "C_HousingLayout.GetViewedFloor",
    params = {  },
    returns = { { name = "floor", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.HasAnySelections"] = {
    key = "C_HousingLayout.HasAnySelections",
    name = "HasAnySelections",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["HasAnySelections"],
    funcPath = "C_HousingLayout.HasAnySelections",
    params = {  },
    returns = { { name = "hasAnySelections", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.HasRoomPlacementBudget"] = {
    key = "C_HousingLayout.HasRoomPlacementBudget",
    name = "HasRoomPlacementBudget",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["HasRoomPlacementBudget"],
    funcPath = "C_HousingLayout.HasRoomPlacementBudget",
    params = {  },
    returns = { { name = "hasBudget", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.HasSelectedDoor"] = {
    key = "C_HousingLayout.HasSelectedDoor",
    name = "HasSelectedDoor",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["HasSelectedDoor"],
    funcPath = "C_HousingLayout.HasSelectedDoor",
    params = {  },
    returns = { { name = "hasSelectedDoor", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.HasSelectedFloorplan"] = {
    key = "C_HousingLayout.HasSelectedFloorplan",
    name = "HasSelectedFloorplan",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["HasSelectedFloorplan"],
    funcPath = "C_HousingLayout.HasSelectedFloorplan",
    params = {  },
    returns = { { name = "hasSelectedFloorplan", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.HasSelectedRoom"] = {
    key = "C_HousingLayout.HasSelectedRoom",
    name = "HasSelectedRoom",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["HasSelectedRoom"],
    funcPath = "C_HousingLayout.HasSelectedRoom",
    params = {  },
    returns = { { name = "hasSelectedRoom", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
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
    params = { { name = "roomGUID", type = "WOWGUID", default = nil }, { name = "componentID", type = "number", default = nil }, { name = "roomId", type = "number", default = nil } },
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

APIDefs["C_HousingLayout.IsDraggingRoom"] = {
    key = "C_HousingLayout.IsDraggingRoom",
    name = "IsDraggingRoom",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["IsDraggingRoom"],
    funcPath = "C_HousingLayout.IsDraggingRoom",
    params = {  },
    returns = { { name = "isDragging", type = "bool", canBeSecret = false }, { name = "isAccessibleDrag", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.MoveDraggedRoom"] = {
    key = "C_HousingLayout.MoveDraggedRoom",
    name = "MoveDraggedRoom",
    category = "combat_midnight",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["MoveDraggedRoom"],
    funcPath = "C_HousingLayout.MoveDraggedRoom",
    params = { { name = "sourceDoorIndex", type = "number", default = nil }, { name = "destRoom", type = "WOWGUID", default = nil }, { name = "destDoorIndex", type = "number", default = nil } },
    returns = {  },
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
    params = { { name = "direction", type = "HousingLayoutCameraDirection", default = nil }, { name = "isPressed", type = "bool", default = nil } },
    returns = {  },
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
    returns = {  },
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
    returns = {  },
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
    params = { { name = "roomGUID", type = "WOWGUID", default = nil }, { name = "isLeft", type = "bool", default = nil } },
    returns = {  },
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
    returns = {  },
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
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingLayout.StartDrag"] = {
    key = "C_HousingLayout.StartDrag",
    name = "StartDrag",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["StartDrag"],
    funcPath = "C_HousingLayout.StartDrag",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.StopDrag"] = {
    key = "C_HousingLayout.StopDrag",
    name = "StopDrag",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["StopDrag"],
    funcPath = "C_HousingLayout.StopDrag",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HousingLayout.StopDraggingRoom"] = {
    key = "C_HousingLayout.StopDraggingRoom",
    name = "StopDraggingRoom",
    category = "general",
    subcategory = "c_housinglayout",
    func = _G["C_HousingLayout"] and _G["C_HousingLayout"]["StopDraggingRoom"],
    funcPath = "C_HousingLayout.StopDraggingRoom",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
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

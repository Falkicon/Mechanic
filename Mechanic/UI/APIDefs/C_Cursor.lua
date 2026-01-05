-- Generated APIDefinitions for namespace: C_Cursor
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Cursor.GetCursorItem"] = {
    key = "C_Cursor.GetCursorItem",
    name = "GetCursorItem",
    category = "general",
    subcategory = "c_cursor",
    func = _G["C_Cursor"] and _G["C_Cursor"]["GetCursorItem"],
    funcPath = "C_Cursor.GetCursorItem",
    params = {  },
    returns = { { name = "item", type = "ItemLocation", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

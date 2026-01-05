-- Generated APIDefinitions for namespace: C_HouseExterior
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HouseExterior.CancelActiveExteriorEditing"] = {
    key = "C_HouseExterior.CancelActiveExteriorEditing",
    name = "CancelActiveExteriorEditing",
    category = "general",
    subcategory = "c_houseexterior",
    func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["CancelActiveExteriorEditing"],
    funcPath = "C_HouseExterior.CancelActiveExteriorEditing",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HouseExterior.GetCoreFixtureOptionsInfo"] = {
    key = "C_HouseExterior.GetCoreFixtureOptionsInfo",
    name = "GetCoreFixtureOptionsInfo",
    category = "combat_midnight",
    subcategory = "c_houseexterior",
    func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["GetCoreFixtureOptionsInfo"],
    funcPath = "C_HouseExterior.GetCoreFixtureOptionsInfo",
    params = { { name = "coreFixtureType", type = "HousingFixtureType", default = nil } },
    returns = { { name = "coreFixtureOptionsInfo", type = "HousingCoreFixtureInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HouseExterior.GetCurrentHouseExteriorSize"] = {
    key = "C_HouseExterior.GetCurrentHouseExteriorSize",
    name = "GetCurrentHouseExteriorSize",
    category = "general",
    subcategory = "c_houseexterior",
    func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["GetCurrentHouseExteriorSize"],
    funcPath = "C_HouseExterior.GetCurrentHouseExteriorSize",
    params = {  },
    returns = { { name = "houseExteriorSize", type = "HousingFixtureSize", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HouseExterior.GetCurrentHouseExteriorType"] = {
    key = "C_HouseExterior.GetCurrentHouseExteriorType",
    name = "GetCurrentHouseExteriorType",
    category = "general",
    subcategory = "c_houseexterior",
    func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["GetCurrentHouseExteriorType"],
    funcPath = "C_HouseExterior.GetCurrentHouseExteriorType",
    params = {  },
    returns = { { name = "houseExteriorTypeID", type = "number", canBeSecret = false }, { name = "houseExteriorTypeName", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HouseExterior.GetHouseExteriorSizeOptions"] = {
    key = "C_HouseExterior.GetHouseExteriorSizeOptions",
    name = "GetHouseExteriorSizeOptions",
    category = "general",
    subcategory = "c_houseexterior",
    func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["GetHouseExteriorSizeOptions"],
    funcPath = "C_HouseExterior.GetHouseExteriorSizeOptions",
    params = {  },
    returns = { { name = "options", type = "HouseExteriorSizeOptionsInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HouseExterior.GetHouseExteriorTypeOptions"] = {
    key = "C_HouseExterior.GetHouseExteriorTypeOptions",
    name = "GetHouseExteriorTypeOptions",
    category = "general",
    subcategory = "c_houseexterior",
    func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["GetHouseExteriorTypeOptions"],
    funcPath = "C_HouseExterior.GetHouseExteriorTypeOptions",
    params = {  },
    returns = { { name = "options", type = "HouseExteriorTypeOptionsInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HouseExterior.GetSelectedFixturePointInfo"] = {
    key = "C_HouseExterior.GetSelectedFixturePointInfo",
    name = "GetSelectedFixturePointInfo",
    category = "general",
    subcategory = "c_houseexterior",
    func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["GetSelectedFixturePointInfo"],
    funcPath = "C_HouseExterior.GetSelectedFixturePointInfo",
    params = {  },
    returns = { { name = "fixturePointInfo", type = "HousingFixturePointInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HouseExterior.HasHoveredFixture"] = {
    key = "C_HouseExterior.HasHoveredFixture",
    name = "HasHoveredFixture",
    category = "general",
    subcategory = "c_houseexterior",
    func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["HasHoveredFixture"],
    funcPath = "C_HouseExterior.HasHoveredFixture",
    params = {  },
    returns = { { name = "anyHoveredFixture", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HouseExterior.HasSelectedFixturePoint"] = {
    key = "C_HouseExterior.HasSelectedFixturePoint",
    name = "HasSelectedFixturePoint",
    category = "general",
    subcategory = "c_houseexterior",
    func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["HasSelectedFixturePoint"],
    funcPath = "C_HouseExterior.HasSelectedFixturePoint",
    params = {  },
    returns = { { name = "anySelectedFixturePoint", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_HouseExterior.RemoveFixtureFromSelectedPoint"] = {
    key = "C_HouseExterior.RemoveFixtureFromSelectedPoint",
    name = "RemoveFixtureFromSelectedPoint",
    category = "general",
    subcategory = "c_houseexterior",
    func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["RemoveFixtureFromSelectedPoint"],
    funcPath = "C_HouseExterior.RemoveFixtureFromSelectedPoint",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_HouseExterior.SelectCoreFixtureOption"] = {
    key = "C_HouseExterior.SelectCoreFixtureOption",
    name = "SelectCoreFixtureOption",
    category = "combat_midnight",
    subcategory = "c_houseexterior",
    func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["SelectCoreFixtureOption"],
    funcPath = "C_HouseExterior.SelectCoreFixtureOption",
    params = { { name = "fixtureID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HouseExterior.SelectFixtureOption"] = {
    key = "C_HouseExterior.SelectFixtureOption",
    name = "SelectFixtureOption",
    category = "combat_midnight",
    subcategory = "c_houseexterior",
    func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["SelectFixtureOption"],
    funcPath = "C_HouseExterior.SelectFixtureOption",
    params = { { name = "fixtureID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HouseExterior.SetHouseExteriorSize"] = {
    key = "C_HouseExterior.SetHouseExteriorSize",
    name = "SetHouseExteriorSize",
    category = "combat_midnight",
    subcategory = "c_houseexterior",
    func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["SetHouseExteriorSize"],
    funcPath = "C_HouseExterior.SetHouseExteriorSize",
    params = { { name = "size", type = "HousingFixtureSize", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HouseExterior.SetHouseExteriorType"] = {
    key = "C_HouseExterior.SetHouseExteriorType",
    name = "SetHouseExteriorType",
    category = "combat_midnight",
    subcategory = "c_houseexterior",
    func = _G["C_HouseExterior"] and _G["C_HouseExterior"]["SetHouseExteriorType"],
    funcPath = "C_HouseExterior.SetHouseExteriorType",
    params = { { name = "houseExteriorTypeID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

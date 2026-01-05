-- Generated APIDefinitions for namespace: C_GamePad
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_GamePad.AddSDLMapping"] = {
    key = "C_GamePad.AddSDLMapping",
    name = "AddSDLMapping",
    category = "combat_midnight",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["AddSDLMapping"],
    funcPath = "C_GamePad.AddSDLMapping",
    params = { { name = "platform", type = "ClientPlatformType", default = nil }, { name = "mapping", type = "cstring", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.ApplyConfigs"] = {
    key = "C_GamePad.ApplyConfigs",
    name = "ApplyConfigs",
    category = "general",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["ApplyConfigs"],
    funcPath = "C_GamePad.ApplyConfigs",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_GamePad.AxisIndexToConfigName"] = {
    key = "C_GamePad.AxisIndexToConfigName",
    name = "AxisIndexToConfigName",
    category = "combat_midnight",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["AxisIndexToConfigName"],
    funcPath = "C_GamePad.AxisIndexToConfigName",
    params = { { name = "axisIndex", type = "number", default = nil } },
    returns = { { name = "configName", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.ButtonBindingToIndex"] = {
    key = "C_GamePad.ButtonBindingToIndex",
    name = "ButtonBindingToIndex",
    category = "combat_midnight",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["ButtonBindingToIndex"],
    funcPath = "C_GamePad.ButtonBindingToIndex",
    params = { { name = "bindingName", type = "cstring", default = nil } },
    returns = { { name = "buttonIndex", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.ButtonIndexToBinding"] = {
    key = "C_GamePad.ButtonIndexToBinding",
    name = "ButtonIndexToBinding",
    category = "combat_midnight",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["ButtonIndexToBinding"],
    funcPath = "C_GamePad.ButtonIndexToBinding",
    params = { { name = "buttonIndex", type = "number", default = nil } },
    returns = { { name = "bindingName", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.ButtonIndexToConfigName"] = {
    key = "C_GamePad.ButtonIndexToConfigName",
    name = "ButtonIndexToConfigName",
    category = "combat_midnight",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["ButtonIndexToConfigName"],
    funcPath = "C_GamePad.ButtonIndexToConfigName",
    params = { { name = "buttonIndex", type = "number", default = nil } },
    returns = { { name = "configName", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.ClearLedColor"] = {
    key = "C_GamePad.ClearLedColor",
    name = "ClearLedColor",
    category = "general",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["ClearLedColor"],
    funcPath = "C_GamePad.ClearLedColor",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_GamePad.DeleteConfig"] = {
    key = "C_GamePad.DeleteConfig",
    name = "DeleteConfig",
    category = "combat_midnight",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["DeleteConfig"],
    funcPath = "C_GamePad.DeleteConfig",
    params = { { name = "configID", type = "GamePadConfigID", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.GetActiveDeviceID"] = {
    key = "C_GamePad.GetActiveDeviceID",
    name = "GetActiveDeviceID",
    category = "general",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["GetActiveDeviceID"],
    funcPath = "C_GamePad.GetActiveDeviceID",
    params = {  },
    returns = { { name = "deviceID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GamePad.GetAllConfigIDs"] = {
    key = "C_GamePad.GetAllConfigIDs",
    name = "GetAllConfigIDs",
    category = "general",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["GetAllConfigIDs"],
    funcPath = "C_GamePad.GetAllConfigIDs",
    params = {  },
    returns = { { name = "configIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GamePad.GetAllDeviceIDs"] = {
    key = "C_GamePad.GetAllDeviceIDs",
    name = "GetAllDeviceIDs",
    category = "general",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["GetAllDeviceIDs"],
    funcPath = "C_GamePad.GetAllDeviceIDs",
    params = {  },
    returns = { { name = "deviceIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GamePad.GetCombinedDeviceID"] = {
    key = "C_GamePad.GetCombinedDeviceID",
    name = "GetCombinedDeviceID",
    category = "general",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["GetCombinedDeviceID"],
    funcPath = "C_GamePad.GetCombinedDeviceID",
    params = {  },
    returns = { { name = "deviceID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GamePad.GetConfig"] = {
    key = "C_GamePad.GetConfig",
    name = "GetConfig",
    category = "combat_midnight",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["GetConfig"],
    funcPath = "C_GamePad.GetConfig",
    params = { { name = "configID", type = "GamePadConfigID", default = nil } },
    returns = { { name = "config", type = "GamePadConfig", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.GetDeviceMappedState"] = {
    key = "C_GamePad.GetDeviceMappedState",
    name = "GetDeviceMappedState",
    category = "combat_midnight",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["GetDeviceMappedState"],
    funcPath = "C_GamePad.GetDeviceMappedState",
    params = { { name = "deviceID", type = "number", default = nil } },
    returns = { { name = "state", type = "GamePadMappedState", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.GetDeviceRawState"] = {
    key = "C_GamePad.GetDeviceRawState",
    name = "GetDeviceRawState",
    category = "combat_midnight",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["GetDeviceRawState"],
    funcPath = "C_GamePad.GetDeviceRawState",
    params = { { name = "deviceID", type = "number", default = nil } },
    returns = { { name = "rawState", type = "GamePadRawState", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.GetLedColor"] = {
    key = "C_GamePad.GetLedColor",
    name = "GetLedColor",
    category = "general",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["GetLedColor"],
    funcPath = "C_GamePad.GetLedColor",
    params = {  },
    returns = { { name = "color", type = "colorRGB", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GamePad.GetPowerLevel"] = {
    key = "C_GamePad.GetPowerLevel",
    name = "GetPowerLevel",
    category = "combat_midnight",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["GetPowerLevel"],
    funcPath = "C_GamePad.GetPowerLevel",
    params = { { name = "deviceID", type = "number", default = nil } },
    returns = { { name = "powerLevel", type = "GamePadPowerLevel", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.IsEnabled"] = {
    key = "C_GamePad.IsEnabled",
    name = "IsEnabled",
    category = "general",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["IsEnabled"],
    funcPath = "C_GamePad.IsEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_GamePad.SetConfig"] = {
    key = "C_GamePad.SetConfig",
    name = "SetConfig",
    category = "combat_midnight",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["SetConfig"],
    funcPath = "C_GamePad.SetConfig",
    params = { { name = "config", type = "GamePadConfig", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.SetLedColor"] = {
    key = "C_GamePad.SetLedColor",
    name = "SetLedColor",
    category = "combat_midnight",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["SetLedColor"],
    funcPath = "C_GamePad.SetLedColor",
    params = { { name = "color", type = "colorRGB", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.SetVibration"] = {
    key = "C_GamePad.SetVibration",
    name = "SetVibration",
    category = "combat_midnight",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["SetVibration"],
    funcPath = "C_GamePad.SetVibration",
    params = { { name = "vibrationType", type = "cstring", default = nil }, { name = "intensity", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.StickIndexToConfigName"] = {
    key = "C_GamePad.StickIndexToConfigName",
    name = "StickIndexToConfigName",
    category = "combat_midnight",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["StickIndexToConfigName"],
    funcPath = "C_GamePad.StickIndexToConfigName",
    params = { { name = "stickIndex", type = "number", default = nil } },
    returns = { { name = "configName", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GamePad.StopVibration"] = {
    key = "C_GamePad.StopVibration",
    name = "StopVibration",
    category = "general",
    subcategory = "c_gamepad",
    func = _G["C_GamePad"] and _G["C_GamePad"]["StopVibration"],
    funcPath = "C_GamePad.StopVibration",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

-- Generated APIDefinitions for namespace: C_TTSSettings
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_TTSSettings.GetChannelEnabled"] = {
    key = "C_TTSSettings.GetChannelEnabled",
    name = "GetChannelEnabled",
    category = "combat_midnight",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["GetChannelEnabled"],
    funcPath = "C_TTSSettings.GetChannelEnabled",
    params = { { name = "channelInfo", type = "ChatChannelInfo", default = nil } },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TTSSettings.GetCharacterSettingsSaved"] = {
    key = "C_TTSSettings.GetCharacterSettingsSaved",
    name = "GetCharacterSettingsSaved",
    category = "ui",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["GetCharacterSettingsSaved"],
    funcPath = "C_TTSSettings.GetCharacterSettingsSaved",
    params = {  },
    returns = { { name = "settingsBeenSaved", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TTSSettings.GetChatTypeEnabled"] = {
    key = "C_TTSSettings.GetChatTypeEnabled",
    name = "GetChatTypeEnabled",
    category = "combat_midnight",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["GetChatTypeEnabled"],
    funcPath = "C_TTSSettings.GetChatTypeEnabled",
    params = { { name = "chatName", type = "cstring", default = nil } },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TTSSettings.GetSetting"] = {
    key = "C_TTSSettings.GetSetting",
    name = "GetSetting",
    category = "combat_midnight",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["GetSetting"],
    funcPath = "C_TTSSettings.GetSetting",
    params = { { name = "setting", type = "TtsBoolSetting", default = nil } },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TTSSettings.GetSpeechRate"] = {
    key = "C_TTSSettings.GetSpeechRate",
    name = "GetSpeechRate",
    category = "ui",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["GetSpeechRate"],
    funcPath = "C_TTSSettings.GetSpeechRate",
    params = {  },
    returns = { { name = "rate", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TTSSettings.GetSpeechVolume"] = {
    key = "C_TTSSettings.GetSpeechVolume",
    name = "GetSpeechVolume",
    category = "ui",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["GetSpeechVolume"],
    funcPath = "C_TTSSettings.GetSpeechVolume",
    params = {  },
    returns = { { name = "volume", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_TTSSettings.GetVoiceOptionID"] = {
    key = "C_TTSSettings.GetVoiceOptionID",
    name = "GetVoiceOptionID",
    category = "combat_midnight",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["GetVoiceOptionID"],
    funcPath = "C_TTSSettings.GetVoiceOptionID",
    params = { { name = "voiceType", type = "TtsVoiceType", default = nil } },
    returns = { { name = "voiceID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TTSSettings.GetVoiceOptionName"] = {
    key = "C_TTSSettings.GetVoiceOptionName",
    name = "GetVoiceOptionName",
    category = "combat_midnight",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["GetVoiceOptionName"],
    funcPath = "C_TTSSettings.GetVoiceOptionName",
    params = { { name = "voiceType", type = "TtsVoiceType", default = nil } },
    returns = { { name = "voiceName", type = "cstring", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TTSSettings.MarkCharacterSettingsSaved"] = {
    key = "C_TTSSettings.MarkCharacterSettingsSaved",
    name = "MarkCharacterSettingsSaved",
    category = "ui",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["MarkCharacterSettingsSaved"],
    funcPath = "C_TTSSettings.MarkCharacterSettingsSaved",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_TTSSettings.SetChannelEnabled"] = {
    key = "C_TTSSettings.SetChannelEnabled",
    name = "SetChannelEnabled",
    category = "combat_midnight",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["SetChannelEnabled"],
    funcPath = "C_TTSSettings.SetChannelEnabled",
    params = { { name = "channelInfo", type = "ChatChannelInfo", default = nil }, { name = "newVal", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TTSSettings.SetChannelKeyEnabled"] = {
    key = "C_TTSSettings.SetChannelKeyEnabled",
    name = "SetChannelKeyEnabled",
    category = "combat_midnight",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["SetChannelKeyEnabled"],
    funcPath = "C_TTSSettings.SetChannelKeyEnabled",
    params = { { name = "channelKey", type = "string", default = nil }, { name = "newVal", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TTSSettings.SetChatTypeEnabled"] = {
    key = "C_TTSSettings.SetChatTypeEnabled",
    name = "SetChatTypeEnabled",
    category = "combat_midnight",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["SetChatTypeEnabled"],
    funcPath = "C_TTSSettings.SetChatTypeEnabled",
    params = { { name = "chatName", type = "cstring", default = nil }, { name = "newVal", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TTSSettings.SetDefaultSettings"] = {
    key = "C_TTSSettings.SetDefaultSettings",
    name = "SetDefaultSettings",
    category = "ui",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["SetDefaultSettings"],
    funcPath = "C_TTSSettings.SetDefaultSettings",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_TTSSettings.SetSetting"] = {
    key = "C_TTSSettings.SetSetting",
    name = "SetSetting",
    category = "combat_midnight",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["SetSetting"],
    funcPath = "C_TTSSettings.SetSetting",
    params = { { name = "setting", type = "TtsBoolSetting", default = nil }, { name = "newVal", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TTSSettings.SetSpeechRate"] = {
    key = "C_TTSSettings.SetSpeechRate",
    name = "SetSpeechRate",
    category = "combat_midnight",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["SetSpeechRate"],
    funcPath = "C_TTSSettings.SetSpeechRate",
    params = { { name = "newVal", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TTSSettings.SetSpeechVolume"] = {
    key = "C_TTSSettings.SetSpeechVolume",
    name = "SetSpeechVolume",
    category = "combat_midnight",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["SetSpeechVolume"],
    funcPath = "C_TTSSettings.SetSpeechVolume",
    params = { { name = "newVal", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TTSSettings.SetVoiceOption"] = {
    key = "C_TTSSettings.SetVoiceOption",
    name = "SetVoiceOption",
    category = "combat_midnight",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["SetVoiceOption"],
    funcPath = "C_TTSSettings.SetVoiceOption",
    params = { { name = "voiceType", type = "TtsVoiceType", default = nil }, { name = "voiceID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TTSSettings.SetVoiceOptionName"] = {
    key = "C_TTSSettings.SetVoiceOptionName",
    name = "SetVoiceOptionName",
    category = "combat_midnight",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["SetVoiceOptionName"],
    funcPath = "C_TTSSettings.SetVoiceOptionName",
    params = { { name = "voiceType", type = "TtsVoiceType", default = nil }, { name = "voiceName", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TTSSettings.ShouldOverrideMessage"] = {
    key = "C_TTSSettings.ShouldOverrideMessage",
    name = "ShouldOverrideMessage",
    category = "combat_midnight",
    subcategory = "c_ttssettings",
    func = _G["C_TTSSettings"] and _G["C_TTSSettings"]["ShouldOverrideMessage"],
    funcPath = "C_TTSSettings.ShouldOverrideMessage",
    params = { { name = "language", type = "number", default = nil }, { name = "messageText", type = "string", default = nil } },
    returns = { { name = "overrideMessage", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_Sound
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Sound.GetSoundScaledVolume"] = {
    key = "C_Sound.GetSoundScaledVolume",
    name = "GetSoundScaledVolume",
    category = "general",
    subcategory = "c_sound",
    funcPath = "C_Sound.GetSoundScaledVolume",
    params = { { name = "soundHandle", type = "number", default = nil } },
    returns = { { name = "scaledVolume", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Sound.IsPlaying"] = {
    key = "C_Sound.IsPlaying",
    name = "IsPlaying",
    category = "general",
    subcategory = "c_sound",
    funcPath = "C_Sound.IsPlaying",
    params = { { name = "soundHandle", type = "number", default = nil } },
    returns = { { name = "isPlaying", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Sound.PlayItemSound"] = {
    key = "C_Sound.PlayItemSound",
    name = "PlayItemSound",
    category = "general",
    subcategory = "c_sound",
    funcPath = "C_Sound.PlayItemSound",
    params = { { name = "soundType", type = "ItemSoundType", default = nil }, { name = "itemLocation", type = "ItemLocation", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Sound.PlaySound"] = {
    key = "C_Sound.PlaySound",
    name = "PlaySound",
    category = "general",
    subcategory = "c_sound",
    funcPath = "C_Sound.PlaySound",
    params = { { name = "soundKitID", type = "number", default = nil }, { name = "uiSoundSubType", type = "UISoundSubType", default = "g_defaultSI3UISoundSubTypeForLua" }, { name = "forceNoDuplicates", type = "bool", default = false }, { name = "runFinishCallback", type = "bool", default = false }, { name = "overridePriority", type = "number", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false }, { name = "soundHandle", type = "SoundHandle", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Sound.PlayVocalErrorSound"] = {
    key = "C_Sound.PlayVocalErrorSound",
    name = "PlayVocalErrorSound",
    category = "general",
    subcategory = "c_sound",
    funcPath = "C_Sound.PlayVocalErrorSound",
    params = { { name = "vocalErrorSoundID", type = "Vocalerrorsounds", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

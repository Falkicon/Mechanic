-- Generated APIDefinitions for namespace: C_VoiceChat
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_VoiceChat.ActivateChannel"] = {
    key = "C_VoiceChat.ActivateChannel",
    name = "ActivateChannel",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["ActivateChannel"],
    funcPath = "C_VoiceChat.ActivateChannel",
    params = { { name = "channelID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.ActivateChannelTranscription"] = {
    key = "C_VoiceChat.ActivateChannelTranscription",
    name = "ActivateChannelTranscription",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["ActivateChannelTranscription"],
    funcPath = "C_VoiceChat.ActivateChannelTranscription",
    params = { { name = "channelID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.BeginLocalCapture"] = {
    key = "C_VoiceChat.BeginLocalCapture",
    name = "BeginLocalCapture",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["BeginLocalCapture"],
    funcPath = "C_VoiceChat.BeginLocalCapture",
    params = { { name = "listenToLocalUser", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.CanAccessSettings"] = {
    key = "C_VoiceChat.CanAccessSettings",
    name = "CanAccessSettings",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["CanAccessSettings"],
    funcPath = "C_VoiceChat.CanAccessSettings",
    params = {  },
    returns = { { name = "canAccess", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.CanPlayerUseVoiceChat"] = {
    key = "C_VoiceChat.CanPlayerUseVoiceChat",
    name = "CanPlayerUseVoiceChat",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["CanPlayerUseVoiceChat"],
    funcPath = "C_VoiceChat.CanPlayerUseVoiceChat",
    params = {  },
    returns = { { name = "canUseVoiceChat", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.CreateChannel"] = {
    key = "C_VoiceChat.CreateChannel",
    name = "CreateChannel",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["CreateChannel"],
    funcPath = "C_VoiceChat.CreateChannel",
    params = { { name = "channelDisplayName", type = "cstring", default = nil } },
    returns = { { name = "status", type = "VoiceChatStatusCode", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.DeactivateChannel"] = {
    key = "C_VoiceChat.DeactivateChannel",
    name = "DeactivateChannel",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["DeactivateChannel"],
    funcPath = "C_VoiceChat.DeactivateChannel",
    params = { { name = "channelID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.DeactivateChannelTranscription"] = {
    key = "C_VoiceChat.DeactivateChannelTranscription",
    name = "DeactivateChannelTranscription",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["DeactivateChannelTranscription"],
    funcPath = "C_VoiceChat.DeactivateChannelTranscription",
    params = { { name = "channelID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.EndLocalCapture"] = {
    key = "C_VoiceChat.EndLocalCapture",
    name = "EndLocalCapture",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["EndLocalCapture"],
    funcPath = "C_VoiceChat.EndLocalCapture",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetActiveChannelID"] = {
    key = "C_VoiceChat.GetActiveChannelID",
    name = "GetActiveChannelID",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetActiveChannelID"],
    funcPath = "C_VoiceChat.GetActiveChannelID",
    params = {  },
    returns = { { name = "channelID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetActiveChannelType"] = {
    key = "C_VoiceChat.GetActiveChannelType",
    name = "GetActiveChannelType",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetActiveChannelType"],
    funcPath = "C_VoiceChat.GetActiveChannelType",
    params = {  },
    returns = { { name = "channelType", type = "ChatChannelType", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetAvailableInputDevices"] = {
    key = "C_VoiceChat.GetAvailableInputDevices",
    name = "GetAvailableInputDevices",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetAvailableInputDevices"],
    funcPath = "C_VoiceChat.GetAvailableInputDevices",
    params = {  },
    returns = { { name = "inputDevices", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetAvailableOutputDevices"] = {
    key = "C_VoiceChat.GetAvailableOutputDevices",
    name = "GetAvailableOutputDevices",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetAvailableOutputDevices"],
    funcPath = "C_VoiceChat.GetAvailableOutputDevices",
    params = {  },
    returns = { { name = "outputDevices", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetChannel"] = {
    key = "C_VoiceChat.GetChannel",
    name = "GetChannel",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetChannel"],
    funcPath = "C_VoiceChat.GetChannel",
    params = { { name = "channelID", type = "number", default = nil } },
    returns = { { name = "channel", type = "VoiceChatChannel", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.GetChannelForChannelType"] = {
    key = "C_VoiceChat.GetChannelForChannelType",
    name = "GetChannelForChannelType",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetChannelForChannelType"],
    funcPath = "C_VoiceChat.GetChannelForChannelType",
    params = { { name = "channelType", type = "ChatChannelType", default = nil } },
    returns = { { name = "channel", type = "VoiceChatChannel", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.GetChannelForCommunityStream"] = {
    key = "C_VoiceChat.GetChannelForCommunityStream",
    name = "GetChannelForCommunityStream",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetChannelForCommunityStream"],
    funcPath = "C_VoiceChat.GetChannelForCommunityStream",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil } },
    returns = { { name = "channel", type = "VoiceChatChannel", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.GetCommunicationMode"] = {
    key = "C_VoiceChat.GetCommunicationMode",
    name = "GetCommunicationMode",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetCommunicationMode"],
    funcPath = "C_VoiceChat.GetCommunicationMode",
    params = {  },
    returns = { { name = "communicationMode", type = "CommunicationMode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetCurrentVoiceChatConnectionStatusCode"] = {
    key = "C_VoiceChat.GetCurrentVoiceChatConnectionStatusCode",
    name = "GetCurrentVoiceChatConnectionStatusCode",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetCurrentVoiceChatConnectionStatusCode"],
    funcPath = "C_VoiceChat.GetCurrentVoiceChatConnectionStatusCode",
    params = {  },
    returns = { { name = "statusCode", type = "VoiceChatStatusCode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetInputVolume"] = {
    key = "C_VoiceChat.GetInputVolume",
    name = "GetInputVolume",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetInputVolume"],
    funcPath = "C_VoiceChat.GetInputVolume",
    params = {  },
    returns = { { name = "volume", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetJoinClubVoiceChannelError"] = {
    key = "C_VoiceChat.GetJoinClubVoiceChannelError",
    name = "GetJoinClubVoiceChannelError",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetJoinClubVoiceChannelError"],
    funcPath = "C_VoiceChat.GetJoinClubVoiceChannelError",
    params = { { name = "clubId", type = "ClubId", default = nil } },
    returns = { { name = "errorReason", type = "VoiceChannelErrorReason", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.GetLocalPlayerActiveChannelMemberInfo"] = {
    key = "C_VoiceChat.GetLocalPlayerActiveChannelMemberInfo",
    name = "GetLocalPlayerActiveChannelMemberInfo",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetLocalPlayerActiveChannelMemberInfo"],
    funcPath = "C_VoiceChat.GetLocalPlayerActiveChannelMemberInfo",
    params = {  },
    returns = { { name = "memberInfo", type = "VoiceChatMember", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetLocalPlayerMemberID"] = {
    key = "C_VoiceChat.GetLocalPlayerMemberID",
    name = "GetLocalPlayerMemberID",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetLocalPlayerMemberID"],
    funcPath = "C_VoiceChat.GetLocalPlayerMemberID",
    params = { { name = "channelID", type = "number", default = nil } },
    returns = { { name = "memberID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.GetMasterVolumeScale"] = {
    key = "C_VoiceChat.GetMasterVolumeScale",
    name = "GetMasterVolumeScale",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetMasterVolumeScale"],
    funcPath = "C_VoiceChat.GetMasterVolumeScale",
    params = {  },
    returns = { { name = "scale", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetMemberGUID"] = {
    key = "C_VoiceChat.GetMemberGUID",
    name = "GetMemberGUID",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetMemberGUID"],
    funcPath = "C_VoiceChat.GetMemberGUID",
    params = { { name = "memberID", type = "number", default = nil }, { name = "channelID", type = "number", default = nil } },
    returns = { { name = "memberGUID", type = "WOWGUID", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.GetMemberID"] = {
    key = "C_VoiceChat.GetMemberID",
    name = "GetMemberID",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetMemberID"],
    funcPath = "C_VoiceChat.GetMemberID",
    params = { { name = "channelID", type = "number", default = nil }, { name = "memberGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "memberID", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.GetMemberInfo"] = {
    key = "C_VoiceChat.GetMemberInfo",
    name = "GetMemberInfo",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetMemberInfo"],
    funcPath = "C_VoiceChat.GetMemberInfo",
    params = { { name = "memberID", type = "number", default = nil }, { name = "channelID", type = "number", default = nil } },
    returns = { { name = "memberInfo", type = "VoiceChatMember", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.GetMemberName"] = {
    key = "C_VoiceChat.GetMemberName",
    name = "GetMemberName",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetMemberName"],
    funcPath = "C_VoiceChat.GetMemberName",
    params = { { name = "memberID", type = "number", default = nil }, { name = "channelID", type = "number", default = nil } },
    returns = { { name = "memberName", type = "string", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.GetMemberVolume"] = {
    key = "C_VoiceChat.GetMemberVolume",
    name = "GetMemberVolume",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetMemberVolume"],
    funcPath = "C_VoiceChat.GetMemberVolume",
    params = { { name = "playerLocation", type = "PlayerLocation", default = nil } },
    returns = { { name = "volume", type = "number", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.GetOutputVolume"] = {
    key = "C_VoiceChat.GetOutputVolume",
    name = "GetOutputVolume",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetOutputVolume"],
    funcPath = "C_VoiceChat.GetOutputVolume",
    params = {  },
    returns = { { name = "volume", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetPTTButtonPressedState"] = {
    key = "C_VoiceChat.GetPTTButtonPressedState",
    name = "GetPTTButtonPressedState",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetPTTButtonPressedState"],
    funcPath = "C_VoiceChat.GetPTTButtonPressedState",
    params = {  },
    returns = { { name = "isPressed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetProcesses"] = {
    key = "C_VoiceChat.GetProcesses",
    name = "GetProcesses",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetProcesses"],
    funcPath = "C_VoiceChat.GetProcesses",
    params = {  },
    returns = { { name = "processes", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetPushToTalkBinding"] = {
    key = "C_VoiceChat.GetPushToTalkBinding",
    name = "GetPushToTalkBinding",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetPushToTalkBinding"],
    funcPath = "C_VoiceChat.GetPushToTalkBinding",
    params = {  },
    returns = { { name = "keys", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetRemoteTtsVoices"] = {
    key = "C_VoiceChat.GetRemoteTtsVoices",
    name = "GetRemoteTtsVoices",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetRemoteTtsVoices"],
    funcPath = "C_VoiceChat.GetRemoteTtsVoices",
    params = {  },
    returns = { { name = "ttsVoices", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetTtsVoices"] = {
    key = "C_VoiceChat.GetTtsVoices",
    name = "GetTtsVoices",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetTtsVoices"],
    funcPath = "C_VoiceChat.GetTtsVoices",
    params = {  },
    returns = { { name = "ttsVoices", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.GetVADSensitivity"] = {
    key = "C_VoiceChat.GetVADSensitivity",
    name = "GetVADSensitivity",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetVADSensitivity"],
    funcPath = "C_VoiceChat.GetVADSensitivity",
    params = {  },
    returns = { { name = "sensitivity", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.IsChannelJoinPending"] = {
    key = "C_VoiceChat.IsChannelJoinPending",
    name = "IsChannelJoinPending",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsChannelJoinPending"],
    funcPath = "C_VoiceChat.IsChannelJoinPending",
    params = { { name = "channelType", type = "ChatChannelType", default = nil }, { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil } },
    returns = { { name = "isPending", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.IsDeafened"] = {
    key = "C_VoiceChat.IsDeafened",
    name = "IsDeafened",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsDeafened"],
    funcPath = "C_VoiceChat.IsDeafened",
    params = {  },
    returns = { { name = "isDeafened", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.IsEnabled"] = {
    key = "C_VoiceChat.IsEnabled",
    name = "IsEnabled",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsEnabled"],
    funcPath = "C_VoiceChat.IsEnabled",
    params = {  },
    returns = { { name = "isEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.IsLoggedIn"] = {
    key = "C_VoiceChat.IsLoggedIn",
    name = "IsLoggedIn",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsLoggedIn"],
    funcPath = "C_VoiceChat.IsLoggedIn",
    params = {  },
    returns = { { name = "isLoggedIn", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.IsMemberLocalPlayer"] = {
    key = "C_VoiceChat.IsMemberLocalPlayer",
    name = "IsMemberLocalPlayer",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsMemberLocalPlayer"],
    funcPath = "C_VoiceChat.IsMemberLocalPlayer",
    params = { { name = "memberID", type = "number", default = nil }, { name = "channelID", type = "number", default = nil } },
    returns = { { name = "isLocalPlayer", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.IsMemberMuted"] = {
    key = "C_VoiceChat.IsMemberMuted",
    name = "IsMemberMuted",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsMemberMuted"],
    funcPath = "C_VoiceChat.IsMemberMuted",
    params = { { name = "playerLocation", type = "PlayerLocation", default = nil } },
    returns = { { name = "mutedForMe", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.IsMemberMutedForAll"] = {
    key = "C_VoiceChat.IsMemberMutedForAll",
    name = "IsMemberMutedForAll",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsMemberMutedForAll"],
    funcPath = "C_VoiceChat.IsMemberMutedForAll",
    params = { { name = "memberID", type = "number", default = nil }, { name = "channelID", type = "number", default = nil } },
    returns = { { name = "mutedForAll", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.IsMemberSilenced"] = {
    key = "C_VoiceChat.IsMemberSilenced",
    name = "IsMemberSilenced",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsMemberSilenced"],
    funcPath = "C_VoiceChat.IsMemberSilenced",
    params = { { name = "memberID", type = "number", default = nil }, { name = "channelID", type = "number", default = nil } },
    returns = { { name = "silenced", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.IsMuted"] = {
    key = "C_VoiceChat.IsMuted",
    name = "IsMuted",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsMuted"],
    funcPath = "C_VoiceChat.IsMuted",
    params = {  },
    returns = { { name = "isMuted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.IsParentalDisabled"] = {
    key = "C_VoiceChat.IsParentalDisabled",
    name = "IsParentalDisabled",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsParentalDisabled"],
    funcPath = "C_VoiceChat.IsParentalDisabled",
    params = {  },
    returns = { { name = "isParentalDisabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.IsParentalMuted"] = {
    key = "C_VoiceChat.IsParentalMuted",
    name = "IsParentalMuted",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsParentalMuted"],
    funcPath = "C_VoiceChat.IsParentalMuted",
    params = {  },
    returns = { { name = "isParentalMuted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.IsPlayerUsingVoice"] = {
    key = "C_VoiceChat.IsPlayerUsingVoice",
    name = "IsPlayerUsingVoice",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsPlayerUsingVoice"],
    funcPath = "C_VoiceChat.IsPlayerUsingVoice",
    params = { { name = "playerLocation", type = "PlayerLocation", default = nil } },
    returns = { { name = "isUsingVoice", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.IsSilenced"] = {
    key = "C_VoiceChat.IsSilenced",
    name = "IsSilenced",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsSilenced"],
    funcPath = "C_VoiceChat.IsSilenced",
    params = {  },
    returns = { { name = "isSilenced", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.IsSpeakForMeActive"] = {
    key = "C_VoiceChat.IsSpeakForMeActive",
    name = "IsSpeakForMeActive",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsSpeakForMeActive"],
    funcPath = "C_VoiceChat.IsSpeakForMeActive",
    params = {  },
    returns = { { name = "isActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.IsSpeakForMeAllowed"] = {
    key = "C_VoiceChat.IsSpeakForMeAllowed",
    name = "IsSpeakForMeAllowed",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsSpeakForMeAllowed"],
    funcPath = "C_VoiceChat.IsSpeakForMeAllowed",
    params = {  },
    returns = { { name = "isAllowed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.IsTranscribing"] = {
    key = "C_VoiceChat.IsTranscribing",
    name = "IsTranscribing",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsTranscribing"],
    funcPath = "C_VoiceChat.IsTranscribing",
    params = {  },
    returns = { { name = "isTranscribing", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.IsTranscriptionAllowed"] = {
    key = "C_VoiceChat.IsTranscriptionAllowed",
    name = "IsTranscriptionAllowed",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsTranscriptionAllowed"],
    funcPath = "C_VoiceChat.IsTranscriptionAllowed",
    params = {  },
    returns = { { name = "isAllowed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.IsVoiceChatConnected"] = {
    key = "C_VoiceChat.IsVoiceChatConnected",
    name = "IsVoiceChatConnected",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsVoiceChatConnected"],
    funcPath = "C_VoiceChat.IsVoiceChatConnected",
    params = {  },
    returns = { { name = "connected", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.LeaveChannel"] = {
    key = "C_VoiceChat.LeaveChannel",
    name = "LeaveChannel",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["LeaveChannel"],
    funcPath = "C_VoiceChat.LeaveChannel",
    params = { { name = "channelID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.Login"] = {
    key = "C_VoiceChat.Login",
    name = "Login",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["Login"],
    funcPath = "C_VoiceChat.Login",
    params = {  },
    returns = { { name = "status", type = "VoiceChatStatusCode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.Logout"] = {
    key = "C_VoiceChat.Logout",
    name = "Logout",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["Logout"],
    funcPath = "C_VoiceChat.Logout",
    params = {  },
    returns = { { name = "status", type = "VoiceChatStatusCode", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.MarkChannelsDiscovered"] = {
    key = "C_VoiceChat.MarkChannelsDiscovered",
    name = "MarkChannelsDiscovered",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["MarkChannelsDiscovered"],
    funcPath = "C_VoiceChat.MarkChannelsDiscovered",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.RequestJoinAndActivateCommunityStreamChannel"] = {
    key = "C_VoiceChat.RequestJoinAndActivateCommunityStreamChannel",
    name = "RequestJoinAndActivateCommunityStreamChannel",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["RequestJoinAndActivateCommunityStreamChannel"],
    funcPath = "C_VoiceChat.RequestJoinAndActivateCommunityStreamChannel",
    params = { { name = "clubId", type = "ClubId", default = nil }, { name = "streamId", type = "ClubStreamId", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.RequestJoinChannelByChannelType"] = {
    key = "C_VoiceChat.RequestJoinChannelByChannelType",
    name = "RequestJoinChannelByChannelType",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["RequestJoinChannelByChannelType"],
    funcPath = "C_VoiceChat.RequestJoinChannelByChannelType",
    params = { { name = "channelType", type = "ChatChannelType", default = nil }, { name = "autoActivate", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.SetCommunicationMode"] = {
    key = "C_VoiceChat.SetCommunicationMode",
    name = "SetCommunicationMode",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SetCommunicationMode"],
    funcPath = "C_VoiceChat.SetCommunicationMode",
    params = { { name = "communicationMode", type = "CommunicationMode", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.SetDeafened"] = {
    key = "C_VoiceChat.SetDeafened",
    name = "SetDeafened",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SetDeafened"],
    funcPath = "C_VoiceChat.SetDeafened",
    params = { { name = "isDeafened", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.SetInputDevice"] = {
    key = "C_VoiceChat.SetInputDevice",
    name = "SetInputDevice",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SetInputDevice"],
    funcPath = "C_VoiceChat.SetInputDevice",
    params = { { name = "deviceID", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.SetInputVolume"] = {
    key = "C_VoiceChat.SetInputVolume",
    name = "SetInputVolume",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SetInputVolume"],
    funcPath = "C_VoiceChat.SetInputVolume",
    params = { { name = "volume", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.SetMasterVolumeScale"] = {
    key = "C_VoiceChat.SetMasterVolumeScale",
    name = "SetMasterVolumeScale",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SetMasterVolumeScale"],
    funcPath = "C_VoiceChat.SetMasterVolumeScale",
    params = { { name = "scale", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.SetMemberMuted"] = {
    key = "C_VoiceChat.SetMemberMuted",
    name = "SetMemberMuted",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SetMemberMuted"],
    funcPath = "C_VoiceChat.SetMemberMuted",
    params = { { name = "playerLocation", type = "PlayerLocation", default = nil }, { name = "muted", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.SetMemberVolume"] = {
    key = "C_VoiceChat.SetMemberVolume",
    name = "SetMemberVolume",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SetMemberVolume"],
    funcPath = "C_VoiceChat.SetMemberVolume",
    params = { { name = "playerLocation", type = "PlayerLocation", default = nil }, { name = "volume", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.SetMuted"] = {
    key = "C_VoiceChat.SetMuted",
    name = "SetMuted",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SetMuted"],
    funcPath = "C_VoiceChat.SetMuted",
    params = { { name = "isMuted", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.SetOutputDevice"] = {
    key = "C_VoiceChat.SetOutputDevice",
    name = "SetOutputDevice",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SetOutputDevice"],
    funcPath = "C_VoiceChat.SetOutputDevice",
    params = { { name = "deviceID", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.SetOutputVolume"] = {
    key = "C_VoiceChat.SetOutputVolume",
    name = "SetOutputVolume",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SetOutputVolume"],
    funcPath = "C_VoiceChat.SetOutputVolume",
    params = { { name = "volume", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.SetPortraitTexture"] = {
    key = "C_VoiceChat.SetPortraitTexture",
    name = "SetPortraitTexture",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SetPortraitTexture"],
    funcPath = "C_VoiceChat.SetPortraitTexture",
    params = { { name = "textureObject", type = "SimpleTexture", default = nil }, { name = "memberID", type = "number", default = nil }, { name = "channelID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.SetPushToTalkBinding"] = {
    key = "C_VoiceChat.SetPushToTalkBinding",
    name = "SetPushToTalkBinding",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SetPushToTalkBinding"],
    funcPath = "C_VoiceChat.SetPushToTalkBinding",
    params = { { name = "keys", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.SetVADSensitivity"] = {
    key = "C_VoiceChat.SetVADSensitivity",
    name = "SetVADSensitivity",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SetVADSensitivity"],
    funcPath = "C_VoiceChat.SetVADSensitivity",
    params = { { name = "sensitivity", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.ShouldDiscoverChannels"] = {
    key = "C_VoiceChat.ShouldDiscoverChannels",
    name = "ShouldDiscoverChannels",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["ShouldDiscoverChannels"],
    funcPath = "C_VoiceChat.ShouldDiscoverChannels",
    params = {  },
    returns = { { name = "shouldDiscoverChannels", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.SpeakRemoteTextSample"] = {
    key = "C_VoiceChat.SpeakRemoteTextSample",
    name = "SpeakRemoteTextSample",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SpeakRemoteTextSample"],
    funcPath = "C_VoiceChat.SpeakRemoteTextSample",
    params = { { name = "text", type = "string", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.SpeakText"] = {
    key = "C_VoiceChat.SpeakText",
    name = "SpeakText",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SpeakText"],
    funcPath = "C_VoiceChat.SpeakText",
    params = { { name = "voiceID", type = "number", default = nil }, { name = "text", type = "cstring", default = nil }, { name = "rate", type = "number", default = nil }, { name = "volume", type = "number", default = nil }, { name = "overlap", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_VoiceChat.StopSpeakingText"] = {
    key = "C_VoiceChat.StopSpeakingText",
    name = "StopSpeakingText",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["StopSpeakingText"],
    funcPath = "C_VoiceChat.StopSpeakingText",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.ToggleDeafened"] = {
    key = "C_VoiceChat.ToggleDeafened",
    name = "ToggleDeafened",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["ToggleDeafened"],
    funcPath = "C_VoiceChat.ToggleDeafened",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

APIDefs["C_VoiceChat.ToggleMemberMuted"] = {
    key = "C_VoiceChat.ToggleMemberMuted",
    name = "ToggleMemberMuted",
    category = "combat_midnight",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["ToggleMemberMuted"],
    funcPath = "C_VoiceChat.ToggleMemberMuted",
    params = { { name = "playerLocation", type = "PlayerLocation", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.ToggleMuted"] = {
    key = "C_VoiceChat.ToggleMuted",
    name = "ToggleMuted",
    category = "social",
    subcategory = "c_voicechat",
    func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["ToggleMuted"],
    funcPath = "C_VoiceChat.ToggleMuted",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
}

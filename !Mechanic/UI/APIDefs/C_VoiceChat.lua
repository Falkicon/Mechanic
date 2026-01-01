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
	returns = {},
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
	returns = {},
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
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
	returns = {},
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
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
	},
	returns = { { name = "channel", type = "VoiceChatChannel", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["C_VoiceChat.GetMemberGUID"] = {
	key = "C_VoiceChat.GetMemberGUID",
	name = "GetMemberGUID",
	category = "combat_midnight",
	subcategory = "c_voicechat",
	func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["GetMemberGUID"],
	funcPath = "C_VoiceChat.GetMemberGUID",
	params = {
		{ name = "memberID", type = "number", default = nil },
		{ name = "channelID", type = "number", default = nil },
	},
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
	params = {
		{ name = "channelID", type = "number", default = nil },
		{ name = "memberGUID", type = "WOWGUID", default = nil },
	},
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
	params = {
		{ name = "memberID", type = "number", default = nil },
		{ name = "channelID", type = "number", default = nil },
	},
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
	params = {
		{ name = "memberID", type = "number", default = nil },
		{ name = "channelID", type = "number", default = nil },
	},
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

APIDefs["C_VoiceChat.IsChannelJoinPending"] = {
	key = "C_VoiceChat.IsChannelJoinPending",
	name = "IsChannelJoinPending",
	category = "combat_midnight",
	subcategory = "c_voicechat",
	func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsChannelJoinPending"],
	funcPath = "C_VoiceChat.IsChannelJoinPending",
	params = {
		{ name = "channelType", type = "ChatChannelType", default = nil },
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
	},
	returns = { { name = "isPending", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.IsMemberLocalPlayer"] = {
	key = "C_VoiceChat.IsMemberLocalPlayer",
	name = "IsMemberLocalPlayer",
	category = "combat_midnight",
	subcategory = "c_voicechat",
	func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["IsMemberLocalPlayer"],
	funcPath = "C_VoiceChat.IsMemberLocalPlayer",
	params = {
		{ name = "memberID", type = "number", default = nil },
		{ name = "channelID", type = "number", default = nil },
	},
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
	params = {
		{ name = "memberID", type = "number", default = nil },
		{ name = "channelID", type = "number", default = nil },
	},
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
	params = {
		{ name = "memberID", type = "number", default = nil },
		{ name = "channelID", type = "number", default = nil },
	},
	returns = { { name = "silenced", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
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

APIDefs["C_VoiceChat.LeaveChannel"] = {
	key = "C_VoiceChat.LeaveChannel",
	name = "LeaveChannel",
	category = "combat_midnight",
	subcategory = "c_voicechat",
	func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["LeaveChannel"],
	funcPath = "C_VoiceChat.LeaveChannel",
	params = { { name = "channelID", type = "number", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.RequestJoinAndActivateCommunityStreamChannel"] = {
	key = "C_VoiceChat.RequestJoinAndActivateCommunityStreamChannel",
	name = "RequestJoinAndActivateCommunityStreamChannel",
	category = "combat_midnight",
	subcategory = "c_voicechat",
	func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["RequestJoinAndActivateCommunityStreamChannel"],
	funcPath = "C_VoiceChat.RequestJoinAndActivateCommunityStreamChannel",
	params = {
		{ name = "clubId", type = "ClubId", default = nil },
		{ name = "streamId", type = "ClubStreamId", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "channelType", type = "ChatChannelType", default = nil },
		{ name = "autoActivate", type = "bool", default = nil },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{ name = "playerLocation", type = "PlayerLocation", default = nil },
		{ name = "muted", type = "bool", default = nil },
	},
	returns = {},
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
	params = {
		{ name = "playerLocation", type = "PlayerLocation", default = nil },
		{ name = "volume", type = "number", default = nil },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
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
	returns = {},
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
	params = {
		{
			name = "textureObject",
			type = "SimpleTexture",
			default = nil,
			examples = {
				{ value = "self", label = "AllTheThings" },
				{ value = "self.Icon", label = "BagBrother" },
				{ value = 133139, label = "Narcissus" },
			},
		},
		{ name = "memberID", type = "number", default = nil },
		{ name = "channelID", type = "number", default = nil },
	},
	returns = {},
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
	returns = {},
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
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VoiceChat.SpeakRemoteTextSample"] = {
	key = "C_VoiceChat.SpeakRemoteTextSample",
	name = "SpeakRemoteTextSample",
	category = "combat_midnight",
	subcategory = "c_voicechat",
	func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["SpeakRemoteTextSample"],
	funcPath = "C_VoiceChat.SpeakRemoteTextSample",
	params = { { name = "text", type = "string", default = nil } },
	returns = {},
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
	params = {
		{ name = "voiceID", type = "number", default = nil },
		{ name = "text", type = "cstring", default = nil },
		{ name = "rate", type = "number", default = nil },
		{ name = "volume", type = "number", default = nil },
		{ name = "overlap", type = "bool", default = false },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_VoiceChat.ToggleMemberMuted"] = {
	key = "C_VoiceChat.ToggleMemberMuted",
	name = "ToggleMemberMuted",
	category = "combat_midnight",
	subcategory = "c_voicechat",
	func = _G["C_VoiceChat"] and _G["C_VoiceChat"]["ToggleMemberMuted"],
	funcPath = "C_VoiceChat.ToggleMemberMuted",
	params = { { name = "playerLocation", type = "PlayerLocation", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

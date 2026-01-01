-- Generated APIDefinitions for namespace: C_EncounterTimeline
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_EncounterTimeline.AddScriptEvent"] = {
	key = "C_EncounterTimeline.AddScriptEvent",
	name = "AddScriptEvent",
	category = "combat_midnight",
	subcategory = "c_encountertimeline",
	func = _G["C_EncounterTimeline"] and _G["C_EncounterTimeline"]["AddScriptEvent"],
	funcPath = "C_EncounterTimeline.AddScriptEvent",
	params = {
		{
			name = "eventInfo",
			type = "EncounterTimelineScriptEventRequest",
			default = nil,
			examples = { { value = "{duration = duration", label = "DBM-Core" } },
		},
	},
	returns = { { name = "eventID", type = "EncounterTimelineEventID", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_EncounterTimeline.CancelScriptEvent"] = {
	key = "C_EncounterTimeline.CancelScriptEvent",
	name = "CancelScriptEvent",
	category = "combat_midnight",
	subcategory = "c_encountertimeline",
	func = _G["C_EncounterTimeline"] and _G["C_EncounterTimeline"]["CancelScriptEvent"],
	funcPath = "C_EncounterTimeline.CancelScriptEvent",
	params = { { name = "eventID", type = "EncounterTimelineEventID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_EncounterTimeline.FinishScriptEvent"] = {
	key = "C_EncounterTimeline.FinishScriptEvent",
	name = "FinishScriptEvent",
	category = "combat_midnight",
	subcategory = "c_encountertimeline",
	func = _G["C_EncounterTimeline"] and _G["C_EncounterTimeline"]["FinishScriptEvent"],
	funcPath = "C_EncounterTimeline.FinishScriptEvent",
	params = { { name = "eventID", type = "EncounterTimelineEventID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_EncounterTimeline.GetEventCountBySource"] = {
	key = "C_EncounterTimeline.GetEventCountBySource",
	name = "GetEventCountBySource",
	category = "combat_midnight",
	subcategory = "c_encountertimeline",
	func = _G["C_EncounterTimeline"] and _G["C_EncounterTimeline"]["GetEventCountBySource"],
	funcPath = "C_EncounterTimeline.GetEventCountBySource",
	params = { { name = "source", type = "EncounterTimelineEventSource", default = nil } },
	returns = { { name = "count", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_EncounterTimeline.GetEventInfo"] = {
	key = "C_EncounterTimeline.GetEventInfo",
	name = "GetEventInfo",
	category = "combat_midnight",
	subcategory = "c_encountertimeline",
	func = _G["C_EncounterTimeline"] and _G["C_EncounterTimeline"]["GetEventInfo"],
	funcPath = "C_EncounterTimeline.GetEventInfo",
	params = { { name = "eventID", type = "EncounterTimelineEventID", default = nil } },
	returns = { { name = "info", type = "EncounterTimelineEventInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretBasedOnTimelineEventSource, SecretArguments=NotAllowed",
}

APIDefs["C_EncounterTimeline.GetEventState"] = {
	key = "C_EncounterTimeline.GetEventState",
	name = "GetEventState",
	category = "combat_midnight",
	subcategory = "c_encountertimeline",
	func = _G["C_EncounterTimeline"] and _G["C_EncounterTimeline"]["GetEventState"],
	funcPath = "C_EncounterTimeline.GetEventState",
	params = { { name = "eventID", type = "EncounterTimelineEventID", default = nil } },
	returns = { { name = "state", type = "EncounterTimelineEventState", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_EncounterTimeline.GetEventTimeElapsed"] = {
	key = "C_EncounterTimeline.GetEventTimeElapsed",
	name = "GetEventTimeElapsed",
	category = "combat_midnight",
	subcategory = "c_encountertimeline",
	func = _G["C_EncounterTimeline"] and _G["C_EncounterTimeline"]["GetEventTimeElapsed"],
	funcPath = "C_EncounterTimeline.GetEventTimeElapsed",
	params = { { name = "eventID", type = "EncounterTimelineEventID", default = nil } },
	returns = { { name = "timeElapsed", type = "DurationSeconds", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_EncounterTimeline.GetEventTimeRemaining"] = {
	key = "C_EncounterTimeline.GetEventTimeRemaining",
	name = "GetEventTimeRemaining",
	category = "combat_midnight",
	subcategory = "c_encountertimeline",
	func = _G["C_EncounterTimeline"] and _G["C_EncounterTimeline"]["GetEventTimeRemaining"],
	funcPath = "C_EncounterTimeline.GetEventTimeRemaining",
	params = { { name = "eventID", type = "EncounterTimelineEventID", default = nil } },
	returns = { { name = "timeRemaining", type = "DurationSeconds", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_EncounterTimeline.GetEventTrack"] = {
	key = "C_EncounterTimeline.GetEventTrack",
	name = "GetEventTrack",
	category = "combat_midnight",
	subcategory = "c_encountertimeline",
	func = _G["C_EncounterTimeline"] and _G["C_EncounterTimeline"]["GetEventTrack"],
	funcPath = "C_EncounterTimeline.GetEventTrack",
	params = { { name = "eventID", type = "EncounterTimelineEventID", default = nil } },
	returns = {
		{ name = "track", type = "EncounterTimelineTrack", canBeSecret = false },
		{ name = "trackSortIndex", type = "luaIndex", canBeSecret = false },
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_EncounterTimeline.GetTrackInfo"] = {
	key = "C_EncounterTimeline.GetTrackInfo",
	name = "GetTrackInfo",
	category = "combat_midnight",
	subcategory = "c_encountertimeline",
	func = _G["C_EncounterTimeline"] and _G["C_EncounterTimeline"]["GetTrackInfo"],
	funcPath = "C_EncounterTimeline.GetTrackInfo",
	params = { { name = "track", type = "EncounterTimelineTrack", default = nil } },
	returns = { { name = "trackInfo", type = "EncounterTimelineTrackInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_EncounterTimeline.IsEventBlocked"] = {
	key = "C_EncounterTimeline.IsEventBlocked",
	name = "IsEventBlocked",
	category = "combat_midnight",
	subcategory = "c_encountertimeline",
	func = _G["C_EncounterTimeline"] and _G["C_EncounterTimeline"]["IsEventBlocked"],
	funcPath = "C_EncounterTimeline.IsEventBlocked",
	params = { { name = "eventID", type = "EncounterTimelineEventID", default = nil } },
	returns = { { name = "blocked", type = "bool", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_EncounterTimeline.PauseScriptEvent"] = {
	key = "C_EncounterTimeline.PauseScriptEvent",
	name = "PauseScriptEvent",
	category = "combat_midnight",
	subcategory = "c_encountertimeline",
	func = _G["C_EncounterTimeline"] and _G["C_EncounterTimeline"]["PauseScriptEvent"],
	funcPath = "C_EncounterTimeline.PauseScriptEvent",
	params = { { name = "eventID", type = "EncounterTimelineEventID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_EncounterTimeline.ResumeScriptEvent"] = {
	key = "C_EncounterTimeline.ResumeScriptEvent",
	name = "ResumeScriptEvent",
	category = "combat_midnight",
	subcategory = "c_encountertimeline",
	func = _G["C_EncounterTimeline"] and _G["C_EncounterTimeline"]["ResumeScriptEvent"],
	funcPath = "C_EncounterTimeline.ResumeScriptEvent",
	params = { { name = "eventID", type = "EncounterTimelineEventID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=NotAllowed",
}

APIDefs["C_EncounterTimeline.SetEventIconTextures"] = {
	key = "C_EncounterTimeline.SetEventIconTextures",
	name = "SetEventIconTextures",
	category = "combat_midnight",
	subcategory = "c_encountertimeline",
	func = _G["C_EncounterTimeline"] and _G["C_EncounterTimeline"]["SetEventIconTextures"],
	funcPath = "C_EncounterTimeline.SetEventIconTextures",
	params = {
		{ name = "eventID", type = "EncounterTimelineEventID", default = nil },
		{ name = "includeIcons", type = "EncounterEventIconmask", default = nil },
		{ name = "textures", type = "table", default = nil },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

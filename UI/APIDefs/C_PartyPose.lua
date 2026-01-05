-- Generated APIDefinitions for namespace: C_PartyPose
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PartyPose.ExtraAction"] = {
    key = "C_PartyPose.ExtraAction",
    name = "ExtraAction",
    category = "combat_midnight",
    subcategory = "c_partypose",
    func = _G["C_PartyPose"] and _G["C_PartyPose"]["ExtraAction"],
    funcPath = "C_PartyPose.ExtraAction",
    params = { { name = "partyPoseID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyPose.GetPartyPoseInfoByID"] = {
    key = "C_PartyPose.GetPartyPoseInfoByID",
    name = "GetPartyPoseInfoByID",
    category = "combat_midnight",
    subcategory = "c_partypose",
    func = _G["C_PartyPose"] and _G["C_PartyPose"]["GetPartyPoseInfoByID"],
    funcPath = "C_PartyPose.GetPartyPoseInfoByID",
    params = { { name = "mapID", type = "number", default = nil } },
    returns = { { name = "info", type = "PartyPoseInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyPose.GetPartyPoseInfoByMapID"] = {
    key = "C_PartyPose.GetPartyPoseInfoByMapID",
    name = "GetPartyPoseInfoByMapID",
    category = "combat_midnight",
    subcategory = "c_partypose",
    func = _G["C_PartyPose"] and _G["C_PartyPose"]["GetPartyPoseInfoByMapID"],
    funcPath = "C_PartyPose.GetPartyPoseInfoByMapID",
    params = { { name = "mapID", type = "number", default = nil } },
    returns = { { name = "info", type = "PartyPoseInfo", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyPose.HasExtraAction"] = {
    key = "C_PartyPose.HasExtraAction",
    name = "HasExtraAction",
    category = "combat_midnight",
    subcategory = "c_partypose",
    func = _G["C_PartyPose"] and _G["C_PartyPose"]["HasExtraAction"],
    funcPath = "C_PartyPose.HasExtraAction",
    params = { { name = "partyPoseID", type = "number", default = nil } },
    returns = { { name = "hasExtraAction", type = "bool", canBeSecret = false } },
    midnightImpact = "RESTRICTED",
    protected = true,
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

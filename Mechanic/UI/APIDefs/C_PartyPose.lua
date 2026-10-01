-- Generated APIDefinitions for namespace: C_PartyPose
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PartyPose.ExtraAction"] = {
    key = "C_PartyPose.ExtraAction",
    name = "ExtraAction",
    category = "unit",
    subcategory = "c_partypose",
    funcPath = "C_PartyPose.ExtraAction",
    params = { { name = "partyPoseID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyPose.GetPartyPoseInfoByID"] = {
    key = "C_PartyPose.GetPartyPoseInfoByID",
    name = "GetPartyPoseInfoByID",
    category = "unit",
    subcategory = "c_partypose",
    funcPath = "C_PartyPose.GetPartyPoseInfoByID",
    params = { { name = "mapID", type = "number", default = nil } },
    returns = { { name = "info", type = "PartyPoseInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyPose.GetPartyPoseInfoByMapID"] = {
    key = "C_PartyPose.GetPartyPoseInfoByMapID",
    name = "GetPartyPoseInfoByMapID",
    category = "unit",
    subcategory = "c_partypose",
    funcPath = "C_PartyPose.GetPartyPoseInfoByMapID",
    params = { { name = "mapID", type = "number", default = nil } },
    returns = { { name = "info", type = "PartyPoseInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PartyPose.HasExtraAction"] = {
    key = "C_PartyPose.HasExtraAction",
    name = "HasExtraAction",
    category = "unit",
    subcategory = "c_partypose",
    funcPath = "C_PartyPose.HasExtraAction",
    params = { { name = "partyPoseID", type = "number", default = nil } },
    returns = { { name = "hasExtraAction", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

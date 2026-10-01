-- Generated APIDefinitions for namespace: C_ModelInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ModelInfo.AddActiveModelScene"] = {
    key = "C_ModelInfo.AddActiveModelScene",
    name = "AddActiveModelScene",
    category = "general",
    subcategory = "c_modelinfo",
    funcPath = "C_ModelInfo.AddActiveModelScene",
    params = { { name = "modelSceneFrame", type = "ModelSceneFrame", default = nil }, { name = "modelSceneID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ModelInfo.AddActiveModelSceneActor"] = {
    key = "C_ModelInfo.AddActiveModelSceneActor",
    name = "AddActiveModelSceneActor",
    category = "general",
    subcategory = "c_modelinfo",
    funcPath = "C_ModelInfo.AddActiveModelSceneActor",
    params = { { name = "modelSceneFrameActor", type = "ModelSceneFrameActor", default = nil }, { name = "modelSceneActorID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ModelInfo.ClearActiveModelScene"] = {
    key = "C_ModelInfo.ClearActiveModelScene",
    name = "ClearActiveModelScene",
    category = "general",
    subcategory = "c_modelinfo",
    funcPath = "C_ModelInfo.ClearActiveModelScene",
    params = { { name = "modelSceneFrame", type = "ModelSceneFrame", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ModelInfo.ClearActiveModelSceneActor"] = {
    key = "C_ModelInfo.ClearActiveModelSceneActor",
    name = "ClearActiveModelSceneActor",
    category = "general",
    subcategory = "c_modelinfo",
    funcPath = "C_ModelInfo.ClearActiveModelSceneActor",
    params = { { name = "modelSceneFrameActor", type = "ModelSceneFrameActor", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ModelInfo.GetModelSceneActorDisplayInfoByID"] = {
    key = "C_ModelInfo.GetModelSceneActorDisplayInfoByID",
    name = "GetModelSceneActorDisplayInfoByID",
    category = "general",
    subcategory = "c_modelinfo",
    funcPath = "C_ModelInfo.GetModelSceneActorDisplayInfoByID",
    params = { { name = "modelActorDisplayID", type = "number", default = nil } },
    returns = { { name = "actorDisplayInfo", type = "UIModelSceneActorDisplayInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ModelInfo.GetModelSceneActorInfoByID"] = {
    key = "C_ModelInfo.GetModelSceneActorInfoByID",
    name = "GetModelSceneActorInfoByID",
    category = "general",
    subcategory = "c_modelinfo",
    funcPath = "C_ModelInfo.GetModelSceneActorInfoByID",
    params = { { name = "modelActorID", type = "number", default = nil } },
    returns = { { name = "actorInfo", type = "UIModelSceneActorInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ModelInfo.GetModelSceneCameraInfoByID"] = {
    key = "C_ModelInfo.GetModelSceneCameraInfoByID",
    name = "GetModelSceneCameraInfoByID",
    category = "general",
    subcategory = "c_modelinfo",
    funcPath = "C_ModelInfo.GetModelSceneCameraInfoByID",
    params = { { name = "modelSceneCameraID", type = "number", default = nil } },
    returns = { { name = "modelSceneCameraInfo", type = "UIModelSceneCameraInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ModelInfo.GetModelSceneInfoByID"] = {
    key = "C_ModelInfo.GetModelSceneInfoByID",
    name = "GetModelSceneInfoByID",
    category = "general",
    subcategory = "c_modelinfo",
    funcPath = "C_ModelInfo.GetModelSceneInfoByID",
    params = { { name = "modelSceneID", type = "number", default = nil } },
    returns = { { name = "modelSceneType", type = "ModelSceneType", canBeSecret = false }, { name = "modelCameraIDs", type = "table", canBeSecret = false }, { name = "modelActorsIDs", type = "table", canBeSecret = false }, { name = "flags", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

-- Generated APIDefinitions for namespace: C_UIWidgetManager
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_UIWidgetManager.GetAllWidgetsBySetID"] = {
    key = "C_UIWidgetManager.GetAllWidgetsBySetID",
    name = "GetAllWidgetsBySetID",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetAllWidgetsBySetID",
    params = { { name = "setID", type = "number", default = nil } },
    returns = { { name = "widgets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetBelowMinimapWidgetSetID"] = {
    key = "C_UIWidgetManager.GetBelowMinimapWidgetSetID",
    name = "GetBelowMinimapWidgetSetID",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetBelowMinimapWidgetSetID",
    params = {  },
    returns = { { name = "setID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_UIWidgetManager.GetBulletTextListWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetBulletTextListWidgetVisualizationInfo",
    name = "GetBulletTextListWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetBulletTextListWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "BulletTextListWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetButtonHeaderWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetButtonHeaderWidgetVisualizationInfo",
    name = "GetButtonHeaderWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetButtonHeaderWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "ButtonHeaderWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetCaptureBarWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetCaptureBarWidgetVisualizationInfo",
    name = "GetCaptureBarWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetCaptureBarWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "CaptureBarWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetCaptureZoneVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetCaptureZoneVisualizationInfo",
    name = "GetCaptureZoneVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetCaptureZoneVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "CaptureZoneVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetDiscreteProgressStepsVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetDiscreteProgressStepsVisualizationInfo",
    name = "GetDiscreteProgressStepsVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetDiscreteProgressStepsVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "DiscreteProgressStepsVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetDoubleIconAndTextWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetDoubleIconAndTextWidgetVisualizationInfo",
    name = "GetDoubleIconAndTextWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetDoubleIconAndTextWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "DoubleIconAndTextWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetDoubleStateIconRowVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetDoubleStateIconRowVisualizationInfo",
    name = "GetDoubleStateIconRowVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetDoubleStateIconRowVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "DoubleStateIconRowVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetDoubleStatusBarWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetDoubleStatusBarWidgetVisualizationInfo",
    name = "GetDoubleStatusBarWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetDoubleStatusBarWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "DoubleStatusBarWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetFillUpFramesWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetFillUpFramesWidgetVisualizationInfo",
    name = "GetFillUpFramesWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetFillUpFramesWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "FillUpFramesWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetHorizontalCurrenciesWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetHorizontalCurrenciesWidgetVisualizationInfo",
    name = "GetHorizontalCurrenciesWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetHorizontalCurrenciesWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "HorizontalCurrenciesWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetIconAndTextWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetIconAndTextWidgetVisualizationInfo",
    name = "GetIconAndTextWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetIconAndTextWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "IconAndTextWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetIconTextAndBackgroundWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetIconTextAndBackgroundWidgetVisualizationInfo",
    name = "GetIconTextAndBackgroundWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetIconTextAndBackgroundWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "IconTextAndBackgroundWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetIconTextAndCurrenciesWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetIconTextAndCurrenciesWidgetVisualizationInfo",
    name = "GetIconTextAndCurrenciesWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetIconTextAndCurrenciesWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "IconTextAndCurrenciesWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetItemDisplayVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetItemDisplayVisualizationInfo",
    name = "GetItemDisplayVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetItemDisplayVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "ItemDisplayVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetMapPinAnimationWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetMapPinAnimationWidgetVisualizationInfo",
    name = "GetMapPinAnimationWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetMapPinAnimationWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "MapPinAnimationWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetObjectiveTrackerWidgetSetID"] = {
    key = "C_UIWidgetManager.GetObjectiveTrackerWidgetSetID",
    name = "GetObjectiveTrackerWidgetSetID",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetObjectiveTrackerWidgetSetID",
    params = {  },
    returns = { { name = "setID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_UIWidgetManager.GetPowerBarWidgetSetID"] = {
    key = "C_UIWidgetManager.GetPowerBarWidgetSetID",
    name = "GetPowerBarWidgetSetID",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetPowerBarWidgetSetID",
    params = {  },
    returns = { { name = "setID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_UIWidgetManager.GetPreyHuntProgressWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetPreyHuntProgressWidgetVisualizationInfo",
    name = "GetPreyHuntProgressWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetPreyHuntProgressWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "PreyHuntProgressWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo",
    name = "GetScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "ScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetScenarioHeaderDelvesWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetScenarioHeaderDelvesWidgetVisualizationInfo",
    name = "GetScenarioHeaderDelvesWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetScenarioHeaderDelvesWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "ScenarioHeaderDelvesWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetScenarioHeaderTimerWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetScenarioHeaderTimerWidgetVisualizationInfo",
    name = "GetScenarioHeaderTimerWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetScenarioHeaderTimerWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "ScenarioHeaderTimerWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetSpacerVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetSpacerVisualizationInfo",
    name = "GetSpacerVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetSpacerVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "SpacerVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetSpellDisplayVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetSpellDisplayVisualizationInfo",
    name = "GetSpellDisplayVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetSpellDisplayVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "SpellDisplayVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetStackedResourceTrackerWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetStackedResourceTrackerWidgetVisualizationInfo",
    name = "GetStackedResourceTrackerWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetStackedResourceTrackerWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "StackedResourceTrackerWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetStatusBarWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetStatusBarWidgetVisualizationInfo",
    name = "GetStatusBarWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetStatusBarWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "StatusBarWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetTextColumnRowVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetTextColumnRowVisualizationInfo",
    name = "GetTextColumnRowVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetTextColumnRowVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "TextColumnRowVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo",
    name = "GetTextWithStateWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "TextWithStateWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetTextWithSubtextWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetTextWithSubtextWidgetVisualizationInfo",
    name = "GetTextWithSubtextWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetTextWithSubtextWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "TextWithSubtextWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetTextureAndTextRowVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetTextureAndTextRowVisualizationInfo",
    name = "GetTextureAndTextRowVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetTextureAndTextRowVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "TextureAndTextRowVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetTextureAndTextVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetTextureAndTextVisualizationInfo",
    name = "GetTextureAndTextVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetTextureAndTextVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "TextureAndTextVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetTextureWithAnimationVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetTextureWithAnimationVisualizationInfo",
    name = "GetTextureWithAnimationVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetTextureWithAnimationVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "TextureWithAnimationVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetTopCenterWidgetSetID"] = {
    key = "C_UIWidgetManager.GetTopCenterWidgetSetID",
    name = "GetTopCenterWidgetSetID",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetTopCenterWidgetSetID",
    params = {  },
    returns = { { name = "setID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}

APIDefs["C_UIWidgetManager.GetTugOfWarWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetTugOfWarWidgetVisualizationInfo",
    name = "GetTugOfWarWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetTugOfWarWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "TugOfWarWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetUnitPowerBarWidgetVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetUnitPowerBarWidgetVisualizationInfo",
    name = "GetUnitPowerBarWidgetVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetUnitPowerBarWidgetVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "UnitPowerBarWidgetVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetWidgetSetInfo"] = {
    key = "C_UIWidgetManager.GetWidgetSetInfo",
    name = "GetWidgetSetInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetWidgetSetInfo",
    params = { { name = "widgetSetID", type = "number", default = nil } },
    returns = { { name = "widgetSetInfo", type = "UIWidgetSetInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetZoneControlVisualizationInfo"] = {
    key = "C_UIWidgetManager.GetZoneControlVisualizationInfo",
    name = "GetZoneControlVisualizationInfo",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.GetZoneControlVisualizationInfo",
    params = { { name = "widgetID", type = "number", default = nil } },
    returns = { { name = "widgetInfo", type = "ZoneControlVisualizationInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.RegisterUnitForWidgetUpdates"] = {
    key = "C_UIWidgetManager.RegisterUnitForWidgetUpdates",
    name = "RegisterUnitForWidgetUpdates",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.RegisterUnitForWidgetUpdates",
    params = { { name = "unitToken", type = "string", default = nil }, { name = "isGuid", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.SetProcessingUnit"] = {
    key = "C_UIWidgetManager.SetProcessingUnit",
    name = "SetProcessingUnit",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.SetProcessingUnit",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.SetProcessingUnitGuid"] = {
    key = "C_UIWidgetManager.SetProcessingUnitGuid",
    name = "SetProcessingUnitGuid",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.SetProcessingUnitGuid",
    params = { { name = "unit", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.UnregisterUnitForWidgetUpdates"] = {
    key = "C_UIWidgetManager.UnregisterUnitForWidgetUpdates",
    name = "UnregisterUnitForWidgetUpdates",
    category = "ui",
    subcategory = "c_uiwidgetmanager",
    funcPath = "C_UIWidgetManager.UnregisterUnitForWidgetUpdates",
    params = { { name = "unitToken", type = "string", default = nil }, { name = "isGuid", type = "bool", default = false } },
    returns = {  },
    midnightImpact = "NORMAL",
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

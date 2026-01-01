-- Generated APIDefinitions for namespace: C_UIWidgetManager
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_UIWidgetManager.GetAllWidgetsBySetID"] = {
	key = "C_UIWidgetManager.GetAllWidgetsBySetID",
	name = "GetAllWidgetsBySetID",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetAllWidgetsBySetID"],
	funcPath = "C_UIWidgetManager.GetAllWidgetsBySetID",
	params = { { name = "setID", type = "number", default = nil } },
	returns = { { name = "widgets", type = "table", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetBulletTextListWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetBulletTextListWidgetVisualizationInfo",
	name = "GetBulletTextListWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetBulletTextListWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetBulletTextListWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "BulletTextListWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetButtonHeaderWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetButtonHeaderWidgetVisualizationInfo",
	name = "GetButtonHeaderWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetButtonHeaderWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetButtonHeaderWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "ButtonHeaderWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetCaptureBarWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetCaptureBarWidgetVisualizationInfo",
	name = "GetCaptureBarWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetCaptureBarWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetCaptureBarWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "CaptureBarWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetCaptureZoneVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetCaptureZoneVisualizationInfo",
	name = "GetCaptureZoneVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetCaptureZoneVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetCaptureZoneVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "CaptureZoneVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetDiscreteProgressStepsVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetDiscreteProgressStepsVisualizationInfo",
	name = "GetDiscreteProgressStepsVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetDiscreteProgressStepsVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetDiscreteProgressStepsVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "DiscreteProgressStepsVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetDoubleIconAndTextWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetDoubleIconAndTextWidgetVisualizationInfo",
	name = "GetDoubleIconAndTextWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetDoubleIconAndTextWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetDoubleIconAndTextWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "DoubleIconAndTextWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetDoubleStateIconRowVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetDoubleStateIconRowVisualizationInfo",
	name = "GetDoubleStateIconRowVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetDoubleStateIconRowVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetDoubleStateIconRowVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "DoubleStateIconRowVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetDoubleStatusBarWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetDoubleStatusBarWidgetVisualizationInfo",
	name = "GetDoubleStatusBarWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetDoubleStatusBarWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetDoubleStatusBarWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "DoubleStatusBarWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetFillUpFramesWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetFillUpFramesWidgetVisualizationInfo",
	name = "GetFillUpFramesWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetFillUpFramesWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetFillUpFramesWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "FillUpFramesWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetHorizontalCurrenciesWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetHorizontalCurrenciesWidgetVisualizationInfo",
	name = "GetHorizontalCurrenciesWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetHorizontalCurrenciesWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetHorizontalCurrenciesWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "HorizontalCurrenciesWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetIconAndTextWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetIconAndTextWidgetVisualizationInfo",
	name = "GetIconAndTextWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetIconAndTextWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetIconAndTextWidgetVisualizationInfo",
	params = {
		{ name = "widgetID", type = "number", default = nil, examples = { { value = "id", label = "DBM-Party-BC" } } },
	},
	returns = { { name = "widgetInfo", type = "IconAndTextWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetIconTextAndBackgroundWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetIconTextAndBackgroundWidgetVisualizationInfo",
	name = "GetIconTextAndBackgroundWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetIconTextAndBackgroundWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetIconTextAndBackgroundWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "IconTextAndBackgroundWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetIconTextAndCurrenciesWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetIconTextAndCurrenciesWidgetVisualizationInfo",
	name = "GetIconTextAndCurrenciesWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetIconTextAndCurrenciesWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetIconTextAndCurrenciesWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "IconTextAndCurrenciesWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetItemDisplayVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetItemDisplayVisualizationInfo",
	name = "GetItemDisplayVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetItemDisplayVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetItemDisplayVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "ItemDisplayVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetMapPinAnimationWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetMapPinAnimationWidgetVisualizationInfo",
	name = "GetMapPinAnimationWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetMapPinAnimationWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetMapPinAnimationWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "MapPinAnimationWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetPreyHuntProgressWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetPreyHuntProgressWidgetVisualizationInfo",
	name = "GetPreyHuntProgressWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetPreyHuntProgressWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetPreyHuntProgressWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "PreyHuntProgressWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo",
	name = "GetScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"]
		and _G["C_UIWidgetManager"]["GetScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = {
		{
			name = "widgetInfo",
			type = "ScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo",
			canBeSecret = false,
		},
	},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetScenarioHeaderDelvesWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetScenarioHeaderDelvesWidgetVisualizationInfo",
	name = "GetScenarioHeaderDelvesWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetScenarioHeaderDelvesWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetScenarioHeaderDelvesWidgetVisualizationInfo",
	params = {
		{
			name = "widgetID",
			type = "number",
			default = nil,
			examples = {
				{ value = 6183, label = "BigWigs_Plugins" },
				{ value = 6184, label = "BigWigs_Plugins" },
				{ value = 6185, label = "BigWigs_Plugins" },
			},
		},
	},
	returns = { { name = "widgetInfo", type = "ScenarioHeaderDelvesWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetScenarioHeaderTimerWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetScenarioHeaderTimerWidgetVisualizationInfo",
	name = "GetScenarioHeaderTimerWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetScenarioHeaderTimerWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetScenarioHeaderTimerWidgetVisualizationInfo",
	params = {
		{ name = "widgetID", type = "number", default = nil, examples = { { value = 4997, label = "Plumber" } } },
	},
	returns = { { name = "widgetInfo", type = "ScenarioHeaderTimerWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetSpacerVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetSpacerVisualizationInfo",
	name = "GetSpacerVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetSpacerVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetSpacerVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "SpacerVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetSpellDisplayVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetSpellDisplayVisualizationInfo",
	name = "GetSpellDisplayVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetSpellDisplayVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetSpellDisplayVisualizationInfo",
	params = {
		{ name = "widgetID", type = "number", default = nil, examples = { { value = 6023, label = "Plumber" } } },
	},
	returns = { { name = "widgetInfo", type = "SpellDisplayVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetStackedResourceTrackerWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetStackedResourceTrackerWidgetVisualizationInfo",
	name = "GetStackedResourceTrackerWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetStackedResourceTrackerWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetStackedResourceTrackerWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "StackedResourceTrackerWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetStatusBarWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetStatusBarWidgetVisualizationInfo",
	name = "GetStatusBarWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetStatusBarWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetStatusBarWidgetVisualizationInfo",
	params = {
		{
			name = "widgetID",
			type = "number",
			default = nil,
			examples = {
				{ value = 5136, label = "Plumber" },
				{ value = 4969, label = "Plumber" },
				{ value = "id", label = "BigWigs_Core" },
			},
		},
	},
	returns = { { name = "widgetInfo", type = "StatusBarWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetTextColumnRowVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetTextColumnRowVisualizationInfo",
	name = "GetTextColumnRowVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetTextColumnRowVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetTextColumnRowVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "TextColumnRowVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo",
	name = "GetTextWithStateWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetTextWithStateWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo",
	params = {
		{
			name = "widgetID",
			type = "number",
			default = nil,
			examples = { { value = 5328, label = "Plumber" }, { value = "id", label = "BigWigs_Core" } },
		},
	},
	returns = { { name = "widgetInfo", type = "TextWithStateWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetTextWithSubtextWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetTextWithSubtextWidgetVisualizationInfo",
	name = "GetTextWithSubtextWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetTextWithSubtextWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetTextWithSubtextWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "TextWithSubtextWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetTextureAndTextRowVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetTextureAndTextRowVisualizationInfo",
	name = "GetTextureAndTextRowVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetTextureAndTextRowVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetTextureAndTextRowVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "TextureAndTextRowVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetTextureAndTextVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetTextureAndTextVisualizationInfo",
	name = "GetTextureAndTextVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetTextureAndTextVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetTextureAndTextVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "TextureAndTextVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetTextureWithAnimationVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetTextureWithAnimationVisualizationInfo",
	name = "GetTextureWithAnimationVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetTextureWithAnimationVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetTextureWithAnimationVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "TextureWithAnimationVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetTugOfWarWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetTugOfWarWidgetVisualizationInfo",
	name = "GetTugOfWarWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetTugOfWarWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetTugOfWarWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "TugOfWarWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetUnitPowerBarWidgetVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetUnitPowerBarWidgetVisualizationInfo",
	name = "GetUnitPowerBarWidgetVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetUnitPowerBarWidgetVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetUnitPowerBarWidgetVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "UnitPowerBarWidgetVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetWidgetSetInfo"] = {
	key = "C_UIWidgetManager.GetWidgetSetInfo",
	name = "GetWidgetSetInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetWidgetSetInfo"],
	funcPath = "C_UIWidgetManager.GetWidgetSetInfo",
	params = { { name = "widgetSetID", type = "number", default = nil } },
	returns = { { name = "widgetSetInfo", type = "UIWidgetSetInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.GetZoneControlVisualizationInfo"] = {
	key = "C_UIWidgetManager.GetZoneControlVisualizationInfo",
	name = "GetZoneControlVisualizationInfo",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["GetZoneControlVisualizationInfo"],
	funcPath = "C_UIWidgetManager.GetZoneControlVisualizationInfo",
	params = { { name = "widgetID", type = "number", default = nil } },
	returns = { { name = "widgetInfo", type = "ZoneControlVisualizationInfo", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.RegisterUnitForWidgetUpdates"] = {
	key = "C_UIWidgetManager.RegisterUnitForWidgetUpdates",
	name = "RegisterUnitForWidgetUpdates",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["RegisterUnitForWidgetUpdates"],
	funcPath = "C_UIWidgetManager.RegisterUnitForWidgetUpdates",
	params = {
		{ name = "unitToken", type = "string", default = nil },
		{ name = "isGuid", type = "bool", default = false },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.SetProcessingUnit"] = {
	key = "C_UIWidgetManager.SetProcessingUnit",
	name = "SetProcessingUnit",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["SetProcessingUnit"],
	funcPath = "C_UIWidgetManager.SetProcessingUnit",
	params = { { name = "unit", type = "UnitToken", default = "player" } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.SetProcessingUnitGuid"] = {
	key = "C_UIWidgetManager.SetProcessingUnitGuid",
	name = "SetProcessingUnitGuid",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["SetProcessingUnitGuid"],
	funcPath = "C_UIWidgetManager.SetProcessingUnitGuid",
	params = { { name = "unit", type = "WOWGUID", default = nil } },
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIWidgetManager.UnregisterUnitForWidgetUpdates"] = {
	key = "C_UIWidgetManager.UnregisterUnitForWidgetUpdates",
	name = "UnregisterUnitForWidgetUpdates",
	category = "combat_midnight",
	subcategory = "c_uiwidgetmanager",
	func = _G["C_UIWidgetManager"] and _G["C_UIWidgetManager"]["UnregisterUnitForWidgetUpdates"],
	funcPath = "C_UIWidgetManager.UnregisterUnitForWidgetUpdates",
	params = {
		{ name = "unitToken", type = "string", default = nil },
		{ name = "isGuid", type = "bool", default = false },
	},
	returns = {},
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

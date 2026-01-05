-- Central Luacheck configuration for WoW Addon development
-- This file defines the common WoW API globals and Ace3 framework.
-- Per-addon .luacheckrc files should extend this one.

std = "lua51"
max_line_length = 120
codes = true

-- Basic WoW Globals (Reference: https://warcraft.wiki.gg/wiki/Global_functions)
globals = {
    -- WoW Framework & Namespaces
    "LibStub", "AceAddon-3.0", "AceConfig-3.0", "AceDB-3.0", "AceEvent-3.0",
    "AceGUI-3.0", "AceHook-3.0", "AceLocale-3.0", "AceTimer-3.0", "CallbackHandler-1.0",
    
    -- Common Blizzard Namespaces
    "C_ActionBar", "C_AreaPoiInfo", "C_BattleNet", "C_ChatInfo", "C_ClassColor",
    "C_Container", "C_CurrencyInfo", "C_DateAndTime", "C_EditMode", "C_GossipInfo",
    "C_Item", "C_LossOfControl", "C_LootHistory", "C_Map", "C_MountJournal",
    "C_PetJournal", "C_PlayerInfo", "C_QuestLog", "C_Spell", "C_SpellBook",
    "C_SpecializationInfo", "C_System", "C_Timer", "C_TooltipInfo", "C_UnitAuras",
    "C_VideoOptions", "C_VoiceChat",
    
    -- Global Functions (Always safe)
    "CreateFrame", "GetTime", "GetInstanceInfo", "InCombatLockdown", "UnitName",
    "UnitGUID", "UnitClass", "UnitIsPlayer", "UnitExists", "GetBuildInfo",
    "hooksecurefunc", "UnitHealthPercent", "UnitHealthMissing", "issecretvalue",
    "PlaySound", "print", "tinsert", "tremove", "wipe", "unpack", "select",
    "tonumber", "tostring", "type", "pairs", "ipairs", "next", "pcall", "xpcall",
    "assert", "error", "getmetatable", "setmetatable", "rawequal", "rawget", "rawset",
    "GetRealmName", "GetSpecializationInfo", "IsTestBuild", "IsBetaBuild", "GetCVar",
    "ReloadUI", "geterrorhandler", "IsLoggedIn", "CloseSpecialWindows", "GetCurrentRegion",
    "GetCurrentRegionName", "securecallfunction", "debugstack", "strsplit", "strlower",
    "GetCursorPosition", "GetMinimapShape", "strmatch", "debugprofilestop",
    "UpdateAddOnMemoryUsage", "GetAddOnMemoryUsage", "UpdateAddOnCPUUsage", "GetAddOnCPUUsage",
    "UnitHealth", "UnitHealthMax", "GetFramerate", "GetNetStats", "GetCVarBool",
    "StaticPopup_Show", "ResetCPUUsage", "SetCVar", "CloseDropDownMenus", "EasyMenu",
    "time", "date", "GetCursorInfo", "ClearCursor", "GetSpellInfo", "GetMacroInfo",
    "CreateFont", "IsShiftKeyDown", "IsControlKeyDown", "IsAltKeyDown", "issecurevariable",
    "SetDesaturation", "WOW_PROJECT_ID", "WOW_PROJECT_MAINLINE", "UnitFactionGroup",
    "UnitRace", "GetLocale", "CreateColor", "C_AddOns", "FenUI", "FenUIDB",
    "math", "table", "string", "debug", "coroutine",
    "C_UI", "GetMouseFoci", "GetMouseFocus", "C_Texture",
    "CLOSE", "AceGUIEditBoxInsertLink", "ChatFrameUtil", "ChatEdit_InsertLink",
    "AceGUIMultiLineEditBoxInsertLink", "GAME_LOCALE",
    
    -- UI & Frame Globals
    "UIParent", "GameTooltip", "ChatFrame1", "SlashCmdList", "UIPARENT_MANAGED_FRAME_POSITIONS",
    "RAID_CLASS_COLORS", "PowerBarColor", "ITEM_QUALITY_COLORS", "Settings",
    "InterfaceOptionsFrame_OpenToCategory", "SELECTED_CHAT_FRAME", "DEFAULT_CHAT_FRAME",
    "NORMAL_FONT_COLOR", "GameFontNormal", "GameFontHighlight", "ACCEPT", "CANCEL",
    "GameFontHighlightLarge", "GameFontHighlightSmall", "C_SettingsUtil", "NORMAL_FONT_COLOR_CODE",
    "FONT_COLOR_CODE_CLOSE", "NineSliceLayouts", "NineSliceUtil", "Minimap", "arg1", "this",
    "StaticPopupDialogs", "ChatFontNormal", "OKAY", "NOT_BOUND", "GameFontNormalSmall",
    "GameFontDisableSmall", "ColorPickerFrame", "OpacitySliderFrame",
    "InterfaceOptionsFramePanelContainer", "GameFontNormalHuge",
    
    -- Mechanic addon-specific globals
    "Mechanic",
    "MechanicDB",
}

-- Deprecated/Removed APIs (Marked as read-only but will trigger warnings if used incorrectly)
read_globals = {
    -- Deprecated/Removed APIs (Auto-synced from DeprecationScanner)
    "C_ChallengeMode.GetMapUIInfo", "C_GUIDUtil.GetCreatureID", "C_Garrison.GetTalentTreeTalentPointResearchInfo", "C_HouseExterior.GetCurrentHouseExteriorTypeName",
    "C_SpecializationInfo.GetNumSpecializationsForClassID", "C_UnitAuras.GetAuraDurationRemainingByAuraInstanceID", "CombatLogGetCurrentEventInfo", "GetActionAutocast",
    "GetActionBarPage", "GetActionCharges", "GetActionCooldown", "GetActionText",
    "GetActionTexture", "GetRestrictedActionStatus", "GetSpecialization", "GetSpecializationMasterySpells",
    "HasAction", "IsActionInRange", "IsConsumableSpell", "IsPlayerSpell",
    "IsUsableAction", "SetPortraitToTexture", "StripHyperlinks", "UnitHealthPercentColor",
    -- Other read-only globals
    "_G",
}

-- Patterns to ignore
ignore = {
    "211", -- Unused local variable
    "212", -- Unused argument
    "213", -- Unused loop variable
    "421", -- Shadowing a local variable
    "422", -- Shadowing an argument
    "431", -- Shadowing an upvalue
    "432", -- Shadowing an upvalue argument
    "631", -- Line too long
}

-- Exclude third-party libraries
exclude_files = {
    "**/Libs/**",
    "**/.git/**",
}

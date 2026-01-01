-- TemplateAddon Luacheck configuration
-- Standalone config (does not depend on external files)

std = "lua51"
max_line_length = 160
codes = true

ignore = {
    "212", -- Unused argument
    "213", -- Unused loop variable
}

exclude_files = {
    "Libs/",
    ".luacheckrc",
}

-- WoW globals
read_globals = {
    -- Lua globals
    "bit", "strmatch", "strfind", "format", "tinsert", "tremove", "wipe",
    -- WoW API (common)
    "CreateFrame", "GetTime", "print", "ReloadUI",
    "UnitName", "UnitClass", "UnitLevel", "UnitHealth", "UnitHealthMax",
    "GetSpellInfo", "GetSpellCooldown", "IsSpellKnown",
    "hooksecurefunc", "securecall", "issecurevariable",
    -- WoW Frames
    "UIParent", "WorldFrame", "GameTooltip", "DEFAULT_CHAT_FRAME",
    -- Libraries
    "LibStub",
}

-- Addon globals (read/write)
globals = {
    "TemplateAddon",
    "TemplateAddonDB",
}


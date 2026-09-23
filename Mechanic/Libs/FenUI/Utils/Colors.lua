--------------------------------------------------------------------------------
-- FenUI.Utils.Colors
-- Shared color constants and color utility functions.
--------------------------------------------------------------------------------

local Utils = FenUI.Utils

Utils.Colors = Utils.Colors or {}

-- Standard status colors
Utils.Colors.Status = {
	pass = "|cff00ff00", -- Green
	warn = "|cffffff00", -- Yellow
	fail = "|cffff0000", -- Red
	pending = "|cffffcc00", -- Yellow-orange
	default = "|cffffffff", -- White
	not_run = "|cff888888", -- Grey
}

-- API Impact colors
Utils.Colors.Impact = {
	HIGH = "|cffff4444", -- Red
	CONDITIONAL = "|cffffaa00", -- Orange
	RESTRICTED = "|cffffff00", -- Yellow
	LOW = "|cff00ff00", -- Green
}

-- Log/Console Category colors
Utils.Colors.Categories = {
	["[Secret]"] = "|cffaa00ff", -- Purple
	["[Trigger]"] = "|cff00ccff", -- Cyan
	["[Event]"] = "|cff88ff88", -- Light green
	["[Validation]"] = "|cffffff00", -- Yellow
	["[Perf]"] = "|cffff8800", -- Orange
	["[Core]"] = "|cff8888ff", -- Light blue
	["[Region]"] = "|cffaaaaaa", -- Grey
	["[API]"] = "|cff00ffcc", -- Teal
	["[Cooldown]"] = "|cffffcc00", -- Yellow-orange
	["[Load]"] = "|cffccff00", -- Lime
	["[Error]"] = "|cffff4444", -- Soft red
}

--- Wraps a string in a color hex code.
---@param text string The text to colorize
---@param hex string The hex color code: "ff00ff00" (AARRGGBB) or "00ff00" (RRGGBB, e.g. from FenUI:GetColorHex)
---@return string colorized
function Utils:Colorize(text, hex)
	if not hex:find("|c") then
		if #hex == 6 then
			hex = "ff" .. hex -- |c escapes require an alpha byte
		end
		hex = "|c" .. hex
	end
	return hex .. text .. "|r"
end

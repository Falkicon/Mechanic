--------------------------------------------------------------------------------
-- FenUI v2 - Fonts
--
-- Creates the FenUI type scale as font objects and resolves the mono font.
--
--   Object            Size  Line spacing  Use
--   FenUIFontCaption  10    +2            metadata, counts, timestamps
--   FenUIFontSmall    11    +3            dense lists, secondary text, form labels
--   FenUIFontBody     12    +3            default text, buttons, inputs
--   FenUIFontHeading  14    +4            section headings, window title
--   FenUIFontTitle    16    +4            page/panel titles
--   FenUIFontDisplay  20    +4            hero text
--   FenUIFontMono     (ChatFontSmall)  +2  logs, code, data
--
-- Line spacing is the extra gap between wrapped lines (WoW's equivalent of
-- line-height), roughly 1.25-1.3x the font size so paragraphs breathe.
--
-- Face and flags come from Blizzard's GameFontHighlight so localized clients
-- keep their own font files. Objects are white with the standard drop shadow;
-- widgets tint them with text tokens.
--------------------------------------------------------------------------------

local FenUI = FenUI

local TYPE_SCALE = {
	-- name = { size, line spacing }
	FenUIFontCaption = { 10, 2 },
	FenUIFontSmall = { 11, 3 },
	FenUIFontBody = { 12, 3 },
	FenUIFontHeading = { 14, 4 },
	FenUIFontTitle = { 16, 4 },
	FenUIFontDisplay = { 20, 4 },
}

local MONO_SPACING = 2

local function CreateTypeScale()
	local base = _G.GameFontHighlight
	local path, _, flags
	if base and base.GetFont then
		path, _, flags = base:GetFont()
	end
	path = path or _G.STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF"

	for name, spec in pairs(TYPE_SCALE) do
		-- Several addons embed FenUI; reuse the object if another copy made it
		local font = _G[name] or CreateFont(name)
		font:SetFont(path, spec[1], flags or "")
		font:SetSpacing(spec[2])
		font:SetTextColor(1, 1, 1)
		font:SetShadowColor(0, 0, 0, 1)
		font:SetShadowOffset(1, -1)
	end
end

--- FenUIFontMono: same face/size as the chosen Blizzard mono font, plus line
--- spacing. A copy, so Blizzard's global font object (used by chat) is untouched.
local function CreateMonoFont(baseName)
	local base = _G[baseName]
	if not (base and base.GetFont) then
		return baseName
	end
	local path, size, flags = base:GetFont()
	if not path then
		return baseName
	end
	local font = _G.FenUIFontMono or CreateFont("FenUIFontMono")
	font:SetFont(path, size, flags or "")
	font:SetSpacing(MONO_SPACING)
	font:SetTextColor(1, 1, 1)
	font:SetShadowColor(0, 0, 0, 1)
	font:SetShadowOffset(1, -1)
	return "FenUIFontMono"
end

local function UpgradeFonts()
	-- Reverting to native ChatFontSmall per user request for smaller fields.
	-- While not strictly monospaced for letters, it is the safest native choice.
	if _G.ChatFontSmall then
		FenUI.Tokens.fonts.mono = CreateMonoFont("ChatFontSmall")
	elseif _G.ChatFontNormal then
		FenUI.Tokens.fonts.mono = CreateMonoFont("ChatFontNormal")
	else
		-- Absolute fallback
		FenUI.Tokens.fonts.mono = "GameFontNormal"
	end
end

-- Initialize fonts
CreateTypeScale()
UpgradeFonts()

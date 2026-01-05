--------------------------------------------------------------------------------
-- FenUI v2 - Font Registration (Native Only)
--
-- Handles native font object resolution and fallback logic.
--------------------------------------------------------------------------------

local FenUI = FenUI

local function UpgradeFonts()
	-- Reverting to native ChatFontSmall per user request for smaller fields.
	-- While not strictly monospaced for letters, it is the safest native choice.
	if _G.ChatFontSmall then
		FenUI.Tokens.fonts.mono = "ChatFontSmall"
	elseif _G.ChatFontNormal then
		FenUI.Tokens.fonts.mono = "ChatFontNormal"
	else
		-- Absolute fallback
		FenUI.Tokens.fonts.mono = "GameFontNormal"
	end
end

-- Initialize fonts
UpgradeFonts()

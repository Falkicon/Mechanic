-- British English locale for Mechanic (inherits from enUS with spelling differences)
local L = LibStub("AceLocale-3.0"):NewLocale("Mechanic", "enGB")
if not L then return end

-- Only override terms with British spelling differences
L["Color"] = "Colour"
L["Text Color"] = "Text Colour"
L["Vertex Color"] = "Vertex Colour"
L["Colorize"] = "Colourise"

-- The rest inherits from enUS

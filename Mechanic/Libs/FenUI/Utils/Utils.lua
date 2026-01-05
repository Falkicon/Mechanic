--------------------------------------------------------------------------------
-- FenUI.Utils
-- Main namespace and loader for modular utilities.
--------------------------------------------------------------------------------

FenUI.Utils = FenUI.Utils or {}
local Utils = FenUI.Utils

-- Simple version tracking for the utils library
Utils.VERSION = "1.0.0"

--- Returns the utils module
---@return table
function FenUI:GetUtils()
	return self.Utils
end

return Utils

--------------------------------------------------------------------------------
-- FenUI.Utils.Tables
-- Table manipulation, deep copy, and safe comparison.
--------------------------------------------------------------------------------

local Utils = FenUI.Utils

--- Performs a deep copy of a table.
---@param orig table The table to copy
---@return table copy
function Utils:DeepCopy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == "table" then
		copy = {}
		for orig_key, orig_value in next, orig, nil do
			copy[self:DeepCopy(orig_key)] = self:DeepCopy(orig_value)
		end
		setmetatable(copy, self:DeepCopy(getmetatable(orig)))
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

--- Safe comparison that handles secret values in Midnight.
--- Returns nil if comparison is not possible.
---@param a any
---@param b any
---@param op string? "<", ">", "<=", ">=", "==", "~="
---@return boolean|nil result
function Utils:SafeCompare(a, b, op)
	op = op or "=="
	local ok, result = pcall(function()
		if a == nil or b == nil then
			return a == b
		end

		local aSecret = self:IsValueSecret(a)
		local bSecret = self:IsValueSecret(b)

		if aSecret or bSecret then
			-- In Midnight, secrets cannot be compared with operators.
			-- We only allow equality checks if they are the exact same object.
			if op == "==" then
				return rawequal(a, b)
			elseif op == "~=" then
				return not rawequal(a, b)
			end
			return nil -- Comparison not possible
		end

		if type(a) == "table" and type(b) == "table" and op == "==" then
			-- Simple deep compare for table values
			for k, v in pairs(a) do
				if not self:SafeCompare(v, b[k], "==") then
					return false
				end
			end
			for k, v in pairs(b) do
				if a[k] == nil then
					return false
				end
			end
			return true
		end

		if op == ">" then
			return a > b
		elseif op == "<" then
			return a < b
		elseif op == ">=" then
			return a >= b
		elseif op == "<=" then
			return a <= b
		elseif op == "==" then
			return a == b
		elseif op == "~=" then
			return a ~= b
		end
		return a == b
	end)

	if ok then
		return result
	else
		return nil
	end
end

--- Efficiently wipes a table if it exists.
---@param t table|nil
function Utils:Wipe(t)
	if t and type(t) == "table" then
		wipe(t)
	end
end

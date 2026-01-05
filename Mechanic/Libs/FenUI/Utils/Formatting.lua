--------------------------------------------------------------------------------
-- FenUI.Utils.Formatting
-- Memory, duration, and complex value formatting.
--------------------------------------------------------------------------------

local Utils = FenUI.Utils

--- Formats memory usage in KB or MB.
---@param kb number Memory in KB
---@return string formatted
function Utils:FormatMemory(kb)
	if kb >= 1024 then
		return string.format("%.1f MB", kb / 1024)
	else
		return string.format("%.0f KB", kb)
	end
end

--- Formats a duration in seconds to "Xm Ys" or more robust formats.
---@param seconds number
---@param useRoyal boolean? If true, tries to use Midnight SecondsFormatter
---@return string formatted
function Utils:FormatDuration(seconds, useRoyal)
	if seconds == nil then
		return ""
	end

	if useRoyal and self.Cap.HasSecondsFormatter then
		if not self.formatter then
			self.formatter = _G.CreateSecondsFormatter()
			if self.formatter then
				self.formatter:SetMinimumComponents(1)
			end
		end
		if self.formatter then
			return self.formatter:Format(seconds)
		end
	end

	if seconds >= 3600 then
		return string.format("%dh %dm", math.floor(seconds / 3600), math.floor((seconds % 3600) / 60))
	elseif seconds >= 60 then
		return string.format("%dm %ds", math.floor(seconds / 60), math.floor(seconds % 60))
	end
	return string.format("%.1fs", seconds)
end

--- Sanitizes text for Blizzard SetText calls, handling AceLocale 'true' values.
---@param text any
---@param fallback string?
---@return string|number sanitized
function Utils:SanitizeText(text, fallback)
	if text == true then
		return fallback or ""
	end
	if text == nil then
		return fallback or ""
	end
	-- Blizzard SetText accepts strings and numbers
	if type(text) == "string" or type(text) == "number" then
		return text
	end
	return tostring(text)
end

--- Strips Blizzard color codes (|c...|r) from a string.
---@param text string
---@return string plainText
function Utils:StripColors(text)
	if type(text) ~= "string" then
		return text
	end
	return text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
end

--- Alias for StripColors
---@param text string
---@return string plainText
function Utils:StripColorCodes(text)
	return self:StripColors(text)
end

--- Truncates a string to a max length with ellipsis.
---@param text string
---@param maxLength number
---@return string truncated
function Utils:TruncateText(text, maxLength)
	if type(text) ~= "string" or #text <= maxLength then
		return text
	end
	return text:sub(1, maxLength) .. "..."
end

--- Formats a value for display, handling secrets and tables.
---@param value any The value to format
---@param options table? {fields: string[], plain: boolean, maxDepth: number, maxItems: number}
---@return string formatted
function Utils:FormatValue(value, options)
	options = options or {}
	local maxDepth = options.maxDepth or 3
	local maxItems = options.maxItems or 20

	local function serialize(val, depth)
		if val == nil then
			return "nil"
		end

		local isSecret = self:IsValueSecret(val)
		local secretTag = isSecret and (options.plain and " (SECRET)" or " |cffaa00ff(SECRET)|r") or ""

		if type(val) == "table" then
			if next(val) == nil then
				return "{...}" -- Handle empty table
			end

			if depth >= maxDepth then
				return options.plain and "{...}" or "|cff888888{...}|r"
			end

			local parts = {}
			if not options.plain then
				table.insert(parts, "{")
			end

			local count = 0
			for k, v in pairs(val) do
				count = count + 1
				if count > maxItems then
					table.insert(parts, "  ...")
					break
				end

				local fieldSecret = self:IsValueSecret(v)
				local fieldSecretTag = fieldSecret and (options.plain and " (SECRET)" or " |cffaa00ff(SECRET)|r") or ""
				table.insert(parts, string.format("  .%s = %s%s", tostring(k), serialize(v, depth + 1), fieldSecretTag))
			end

			if not options.plain then
				table.insert(parts, "}")
				return table.concat(parts, "\n")
			else
				return string.format("{\n%s\n  }", table.concat(parts, "\n"))
			end
		end

		return string.format("%s%s", tostring(val), secretTag)
	end

	return serialize(value, 0)
end

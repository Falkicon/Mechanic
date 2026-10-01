-- UI/Shared/FrameResolver.lua
-- !Mechanic - Frame Path Resolver Utility (Phase 8)
--
-- Utilities for converting between string paths and frame references, plus the
-- secret-value-safe value helpers shared by the Inspect panels (this file loads
-- before every other UI module, so both live on the addon namespace from here).

local ADDON_NAME, ns = ...
local FrameResolver = {}
ns.FrameResolver = FrameResolver

local SafeValue = {}
ns.SafeValue = SafeValue

--------------------------------------------------------------------------------
-- SafeValue: helpers for rendering values that may be secret (12.0+)
--------------------------------------------------------------------------------

--- True when the value is a restricted "secret" value that must not be
--- compared, concatenated, indexed or used in arithmetic.
function SafeValue.IsSecret(value)
	return issecretvalue ~= nil and issecretvalue(value) == true
end

--- Short, stable tag for a function value ("function: 0x..." -> last 8 hex digits).
function SafeValue.FunctionAddress(str)
	local addr = str:match(":(%s*0x%x+)") or str:match(":%s*(%x+)") or str:match("(%x+)") or "ptr"
	addr = addr:gsub("%s", ""):gsub("^0x", "")
	if #addr > 8 then
		addr = addr:sub(-8)
	end
	return addr
end

--- tostring that never errors and never touches a secret value.
--- opts.numberFormat: string.format pattern applied to plain numbers.
function SafeValue.ToString(value, opts)
	if value == nil then
		return "nil"
	end
	if SafeValue.IsSecret(value) then
		return "[secret]"
	end
	local ok, str = pcall(tostring, value)
	if not ok then
		return "[error]"
	end
	local valueType = type(value)
	if valueType == "function" then
		return "[" .. SafeValue.FunctionAddress(str) .. "]"
	end
	if valueType == "number" and opts and opts.numberFormat then
		return string.format(opts.numberFormat, value)
	end
	return str
end

--- Call obj:method(...) protected. Returns value1, value2, isSecret.
--- Returns nil when the method is missing or errors; secret results are
--- withheld (nil, nil, true) so callers never compare or format them.
function SafeValue.Get(obj, method, ...)
	if type(obj) ~= "table" or not obj[method] then
		return nil
	end
	local ok, v1, v2 = pcall(obj[method], obj, ...)
	if not ok then
		return nil
	end
	if SafeValue.IsSecret(v1) or SafeValue.IsSecret(v2) then
		return nil, nil, true
	end
	return v1, v2, false
end

--- Format a number with string.format, or a placeholder for secret/non-numbers.
function SafeValue.FormatNumber(value, pattern, fallback)
	if SafeValue.IsSecret(value) then
		return "[secret]"
	end
	if type(value) == "number" then
		return string.format(pattern, value)
	end
	return fallback or "?"
end

--------------------------------------------------------------------------------
-- FrameResolver
--------------------------------------------------------------------------------

local function indexSegment(current, segment)
	local value = current[segment]
	if value == nil then
		-- GetFramePath emits tostring(key), so array members come back as "3".
		local index = tonumber(segment)
		if index then
			value = current[index]
		end
	end
	return value
end

--- Resolve a string path to a frame reference.
--- Supports global names (e.g. "UIParent") and dot-notation (e.g. "PlayerFrame.health"),
--- including numeric array members (e.g. "Items.3").
---@param path string The path to resolve
---@return Frame|nil frame The resolved frame or nil if not found
function FrameResolver:ResolvePath(path)
	if not path or path == "" then
		return nil
	end

	-- Split path by dots
	local parts = {}
	for part in string.gmatch(path, "([^%.]+)") do
		table.insert(parts, part)
	end

	if #parts == 0 then
		return nil
	end

	-- Start with global frame
	local current = _G[parts[1]]
	if not current then
		return nil
	end

	-- Traverse children/members
	for i = 2, #parts do
		if type(current) ~= "table" then
			return nil
		end
		current = indexSegment(current, parts[i])
		if not current then
			return nil
		end
	end

	return (type(current) == "table" and current.GetObjectType) and current or nil
end

--- Run fn(...) with a member-name cache active so repeated GetFramePath calls
--- for siblings scan each parent only once. Errors are re-raised after the
--- cache is released.
function FrameResolver:WithCache(fn, ...)
	if self.memberCache then
		return fn(...)
	end
	self.memberCache = {}
	local results = { pcall(fn, ...) }
	self.memberCache = nil
	if not results[1] then
		error(results[2], 0)
	end
	return unpack(results, 2)
end

-- Find the member key under which `child` is stored on `parent`.
function FrameResolver:FindMemberKey(parent, child)
	local cache = self.memberCache
	if cache then
		local map = cache[parent]
		if not map then
			map = {}
			for k, v in pairs(parent) do
				if type(v) == "table" and map[v] == nil then
					map[v] = tostring(k)
				end
			end
			cache[parent] = map
		end
		return map[child]
	end

	for k, v in pairs(parent) do
		if v == child then
			return tostring(k)
		end
	end
	return nil
end

--- Get a string path for a frame reference.
--- Tries to find the most concise path starting from a global parent.
---@param frame Frame The frame reference
---@return string|nil path The path string or nil if it cannot be resolved
function FrameResolver:GetFramePath(frame)
	if not frame or type(frame) ~= "table" or not frame.GetObjectType then
		return nil
	end

	-- If it has a global name, return it
	local name
	if frame.GetName then
		local ok, n = pcall(frame.GetName, frame)
		if ok then
			name = n
		end
	end

	if name then
		return name
	end

	-- If anonymous, try to traverse up to a named parent
	local parts = {}
	local current = frame
	while current do
		local currentName
		if current.GetName then
			local ok, n = pcall(current.GetName, current)
			if ok then
				currentName = n
			end
		end

		if currentName then
			table.insert(parts, 1, currentName)
			return table.concat(parts, ".")
		end

		-- If no name, look for this frame in the parent's members
		local parent
		if current.GetParent then
			local ok, p = pcall(current.GetParent, current)
			if ok then
				parent = p
			end
		end

		if parent then
			-- Frames cannot be enumerated by key, but many parents store children as members.
			local key = self:FindMemberKey(parent, current)
			if not key then
				-- Not a member: no reliable dot-path can be built
				table.insert(parts, 1, "?")
				return table.concat(parts, ".")
			end
			table.insert(parts, 1, key)
			current = parent
		else
			-- No parent and no name?
			table.insert(parts, 1, "<anonymous>")
			return table.concat(parts, ".")
		end
	end

	return nil
end

local function safeString(obj, method)
	if type(obj) ~= "table" or not obj[method] then
		return nil
	end
	local ok, value = pcall(obj[method], obj)
	if ok and type(value) == "string" and not SafeValue.IsSecret(value) and value ~= "" then
		return value
	end
	return nil
end

--- Short label for a frame or table: global name, else the leaf of its member
--- path, else "<ObjectType>". Pass `path` when the caller already has it to
--- avoid a second member scan.
---@param frame any
---@param path string|nil Precomputed GetFramePath(frame)
---@return string
function FrameResolver:GetDisplayName(frame, path)
	if not frame or type(frame) ~= "table" then
		return tostring(frame or "<nil>")
	end

	local name = safeString(frame, "GetName")
	if name then
		return name
	end

	path = path or self:GetFramePath(frame)
	if type(path) == "string" and path ~= "<anonymous>" then
		local leaf = path:match("%.([^%.]+)$") or path
		if leaf ~= "?" then
			return leaf
		end
	end

	local objType = safeString(frame, "GetObjectType")
	if objType then
		return "<" .. objType .. ">"
	end
	return frame.GetObjectType and "<anonymous>" or "<table>"
end

--- Label used by pick mode: debug name, else global name, else "<ObjectType>".
---@param frame any
---@return string
function FrameResolver:GetDebugName(frame)
	local name = safeString(frame, "GetDebugName") or safeString(frame, "GetName")
	if name then
		return name
	end
	local objType = safeString(frame, "GetObjectType")
	if objType then
		return "<" .. objType .. ">"
	end
	return "<anonymous>"
end

return FrameResolver

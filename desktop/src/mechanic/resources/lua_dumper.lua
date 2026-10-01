-- lua_dumper.lua
-- Parses one Blizzard API documentation file and prints it as JSON.
-- Used by api.populate to extract API definitions. Usage: lua lua_dumper.lua <file>
-- The documentation file runs in an empty environment that only provides
-- APIDocumentation:AddDocumentationTable, so it cannot reach os/io/etc.

local filename = arg and arg[1]
if not filename then
	io.stderr:write("Error: No filename provided\n")
	os.exit(1)
end

local extracted

local env = {
	APIDocumentation = {
		AddDocumentationTable = function(_, tbl)
			extracted = tbl
		end,
	},
}

local chunk, err = loadfile(filename)
if not chunk then
	io.stderr:write("Error loading file: " .. tostring(err) .. "\n")
	os.exit(1)
end
setfenv(chunk, env)

-- Some documentation files may reference globals that do not exist here; the
-- table is usually registered before such a failure, so keep what was captured.
pcall(chunk)

local function escape_char(c)
	local map = { ["\\"] = "\\\\", ['"'] = '\\"', ["\n"] = "\\n", ["\r"] = "\\r", ["\t"] = "\\t", ["\b"] = "\\b", ["\f"] = "\\f" }
	return map[c] or string.format("\\u%04x", string.byte(c))
end

local function serialize(val)
	local kind = type(val)
	if kind == "string" then
		return '"' .. val:gsub('[%c"\\]', escape_char) .. '"'
	elseif kind == "number" then
		if val ~= val or val == math.huge or val == -math.huge then
			return "null"
		end
		return string.format("%.14g", val)
	elseif kind == "boolean" then
		return tostring(val)
	elseif kind == "table" then
		local count = 0
		local is_array = true
		for k in pairs(val) do
			count = count + 1
			if type(k) ~= "number" then
				is_array = false
			end
		end
		is_array = is_array and count == #val

		local parts = {}
		if is_array then
			for i = 1, count do
				parts[#parts + 1] = serialize(val[i])
			end
			return "[" .. table.concat(parts, ", ") .. "]"
		end

		local keys = {}
		for k in pairs(val) do
			keys[#keys + 1] = k
		end
		table.sort(keys, function(a, b)
			return tostring(a) < tostring(b)
		end)
		for _, k in ipairs(keys) do
			parts[#parts + 1] = serialize(tostring(k)) .. ": " .. serialize(val[k])
		end
		return "{" .. table.concat(parts, ", ") .. "}"
	end
	return "null"
end

if extracted then
	print(serialize(extracted))
end

-- lua_dumper.lua
-- Parses Blizzard API documentation files and outputs JSON
-- Used by api.populate command to extract API definitions

local filename = arg[1]
if not filename then
    print("Error: No filename provided")
    os.exit(1)
end

-- Add string.replace if not exists
if not string.replace then
    function string.replace(s, old, new)
        local pattern = old:gsub("([^%w])", "%%%1")
        local replacement = new:gsub("%%", "%%%%")
        return s:gsub(pattern, replacement)
    end
end

-- Mock APIDocumentation
local APIDocumentation = {}
function APIDocumentation:AddDocumentationTable(tbl)
    _G.extracted_table = tbl
end
_G.APIDocumentation = APIDocumentation

-- Load and execute the file
local chunk, err = loadfile(filename)
if not chunk then
    print("Error loading file: " .. tostring(err))
    os.exit(1)
end

-- Use a protected call to catch any runtime errors in the documentation file
local status, exec_err = pcall(chunk)
if not status then
    -- Some files might fail if they depend on other globals, but mostly they should be self-contained tables
    -- Silently ignore - we'll skip files that can't be parsed
end

-- Simple JSON-ish serializer
local function serialize(val)
    if type(val) == "string" then
        -- Escape backslashes and quotes for JSON
        local s = val:replace("\\", "\\\\"):replace("\"", "\\\""):replace("\n", "\\n"):replace("\r", "\\r")
        return "\"" .. s .. "\""
    elseif type(val) == "number" or type(val) == "boolean" then
        return tostring(val)
    elseif type(val) == "table" then
        local parts = {}
        -- Heuristic for array vs object
        local is_array = true
        local count = 0
        for k, v in pairs(val) do
            count = count + 1
            if type(k) ~= "number" then
                is_array = false
            end
        end

        if is_array then
            for i = 1, count do
                table.insert(parts, serialize(val[i]))
            end
            return "[" .. table.concat(parts, ", ") .. "]"
        else
            for k, v in pairs(val) do
                table.insert(parts, string.format("%q: %s", tostring(k), serialize(v)))
            end
            return "{" .. table.concat(parts, ", ") .. "}"
        end
    else
        return "null"
    end
end

if _G.extracted_table then
    print(serialize(_G.extracted_table))
end

-- sandbox_runner.lua
-- Runs WoW addon Lua inside a restricted environment. Usage: lua sandbox_runner.lua <config.lua>
--
-- The runner itself keeps the real globals (it needs loadfile/setfenv/os.exit);
-- everything it loads (stubs, addon files, specs, user code) runs against `env`,
-- a whitelist of safe globals. os, io, package, debug, require, dofile,
-- loadfile, load, getfenv, setfenv and string.dump are not reachable from it,
-- and loadstring refuses precompiled bytecode.

local real_loadfile = loadfile
local real_loadstring = loadstring
local real_setfenv = setfenv
local real_print = print
local real_getmetatable = getmetatable
local real_collectgarbage = collectgarbage
local real_exit = os.exit
local real_stderr = io.stderr

local config_path = arg and arg[1]
if not config_path then
	real_stderr:write("sandbox_runner: no config path\n")
	real_exit(2)
end

local config_chunk, config_err = real_loadfile(config_path)
if not config_chunk then
	real_stderr:write("sandbox_runner: cannot read config: " .. tostring(config_err) .. "\n")
	real_exit(2)
end
local cfg = config_chunk()

local MAX_OUTPUT = cfg.max_output or 262144
local written = 0

local function capped_print(...)
	local n = select("#", ...)
	local parts = {}
	for i = 1, n do
		parts[i] = tostring((select(i, ...)))
	end
	local line = table.concat(parts, "\t")
	written = written + #line + 1
	if written > MAX_OUTPUT then
		error("sandbox output limit exceeded (" .. MAX_OUTPUT .. " bytes)", 0)
	end
	real_print(line)
end

local function copy_table(source, skip)
	local result = {}
	for key, value in pairs(source) do
		if not (skip and skip[key]) then
			result[key] = value
		end
	end
	return result
end

local env = {}
for _, name in ipairs({
	"assert",
	"error",
	"ipairs",
	"next",
	"pairs",
	"pcall",
	"rawequal",
	"rawget",
	"rawset",
	"select",
	"setmetatable",
	"tonumber",
	"tostring",
	"type",
	"unpack",
	"xpcall",
}) do
	env[name] = _G[name]
end
env.math = copy_table(math)
env.string = copy_table(string, { dump = true })
env.table = copy_table(table)
env.coroutine = copy_table(coroutine)
env._G = env
env.print = capped_print

-- Hide the real string metatable (its __index is the unrestricted string table).
env.getmetatable = function(value)
	if type(value) == "string" then
		return nil
	end
	return real_getmetatable(value)
end

env.collectgarbage = function(option)
	if option == nil or option == "collect" or option == "count" then
		return real_collectgarbage(option)
	end
	return 0
end

env.loadstring = function(source, chunkname)
	if type(source) ~= "string" then
		error("bad argument #1 to 'loadstring' (string expected)", 2)
	end
	if source:byte(1) == 27 then
		return nil, "precompiled chunks are not allowed in the sandbox"
	end
	local fn, err = real_loadstring(source, chunkname)
	if fn then
		real_setfenv(fn, env)
	end
	return fn, err
end

local function load_in_env(path)
	local fn, err = real_loadfile(path)
	if not fn then
		error(err, 0)
	end
	real_setfenv(fn, env)
	return fn()
end

-- require is only available to spec runs and only resolves modules beneath the
-- addon folder (no absolute paths, no "..").
if cfg.require_root then
	local loaded = {}
	env.require = function(name)
		if type(name) ~= "string" or not name:match("^[%w_%.]+$") or name:find("..", 1, true) then
			error("module name not allowed in the sandbox: " .. tostring(name), 2)
		end
		if loaded[name] ~= nil then
			return loaded[name]
		end
		local base = cfg.require_root .. "/" .. name:gsub("%.", "/")
		local path
		for _, candidate in ipairs({ base .. ".lua", base .. "/init.lua" }) do
			local handle = io.open(candidate, "r")
			if handle then
				handle:close()
				path = candidate
				break
			end
		end
		if not path then
			error("module '" .. name .. "' not found beneath the addon folder", 2)
		end
		local result = load_in_env(path)
		if result == nil then
			result = true
		end
		loaded[name] = result
		return result
	end
end

local function load_list(paths, what)
	for _, path in ipairs(paths or {}) do
		local ok, err = pcall(load_in_env, path)
		if not ok then
			real_stderr:write(string.format("sandbox_runner: failed loading %s %s: %s\n", what, path, tostring(err)))
			real_exit(3)
		end
	end
end

if cfg.stubs then
	load_list({ cfg.stubs }, "stubs")
end

if cfg.mode == "exec" then
	load_list(cfg.sources, "addon file")

	local handle = io.open(cfg.code_file, "rb")
	if not handle then
		real_stderr:write("sandbox_runner: cannot read user code\n")
		real_exit(2)
	end
	local source = handle:read("*a")
	handle:close()

	if source:byte(1) == 27 then
		real_stderr:write("precompiled chunks are not allowed in the sandbox\n")
		real_exit(1)
	end
	local fn, err = real_loadstring(source, "=user")
	if not fn then
		real_stderr:write(tostring(err) .. "\n")
		real_exit(1)
	end
	real_setfenv(fn, env)

	local ok, result = pcall(fn)
	if not ok then
		real_stderr:write(tostring(result) .. "\n")
		real_exit(1)
	end

	local marker = cfg.marker .. "RESULT:"
	if result == nil then
		real_print(marker .. "nil")
	elseif type(result) == "table" then
		local parts = {}
		for key, value in pairs(result) do
			parts[#parts + 1] = tostring(key) .. "=" .. tostring(value)
		end
		real_print(marker .. "{" .. table.concat(parts, ", ") .. "}")
	else
		real_print(marker .. tostring(result))
	end
elseif cfg.mode == "test" then
	load_list({ cfg.framework }, "test framework")
	load_list(cfg.sources, "addon file")

	if cfg.filter then
		env._TestRunner.filter = cfg.filter
	end

	for _, spec in ipairs(cfg.specs or {}) do
		local ok, err = pcall(load_in_env, spec.path)
		if not ok then
			env.describe("spec load errors", function()
				env.it(spec.name, function()
					error(err, 0)
				end)
			end)
		end
	end

	env._TestRunner.runAndPrint()
else
	real_stderr:write("sandbox_runner: unknown mode\n")
	real_exit(2)
end

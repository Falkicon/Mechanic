-- !Mechanic Luacheck configuration
-- Extends the central configuration

local base = dofile("../ADDON_DEV/Linting/.luacheckrc")

-- Inherit everything from base
std = base.std
max_line_length = base.max_line_length
codes = base.codes
ignore = base.ignore
exclude_files = base.exclude_files
read_globals = base.read_globals

-- Addon-specific globals
globals = base.globals
table.insert(globals, "!Mechanic")
table.insert(globals, "!MechanicDB")



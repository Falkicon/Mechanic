# Mechanic Tools

This directory contains development tools downloaded by `mech setup`.

## Tools

| Tool | Purpose | Version |
|------|---------|---------|
| luacheck.exe | Lua linter | 0.23.0 |
| stylua.exe | Lua formatter | 2.3.1 |
| lua.exe | Lua runtime (optional) | 5.1.5 |

## Setup

```bash
# Download all required tools
mech setup

# Verify installation
mech setup --verify

# Force re-download
mech setup --force
```

## Manual Installation

If automatic download fails, you can download manually:

- **Luacheck**: https://github.com/mpeterv/luacheck/releases
- **StyLua**: https://github.com/JohnnyMorganz/StyLua/releases
- **Lua 5.1**: http://luabinaries.sourceforge.net/download.html

Place executables in this directory.

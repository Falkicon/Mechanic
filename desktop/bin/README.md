# Mechanic Tools

In a source checkout, this directory holds the development tools downloaded by `mech setup`. The binaries are git-ignored (`.gitignore` here). When Mechanic is installed from a wheel there is no `desktop/bin`, so `mech setup` installs tools to `~/.mechanic/bin` instead.

The tool manifest, download URLs and SHA-256 checksums live in the package at `desktop/src/mechanic/resources/checksums.json`, not in this directory. `mech setup` verifies each download against it before writing the file and refuses entries whose checksum is missing, `skip` or `placeholder`.

## Tools

| Tool | Purpose | Version | Required |
|------|---------|---------|----------|
| luacheck.exe | Lua linter | 0.23.0 | yes |
| stylua.exe | Lua formatter | 2.3.1 | yes |
| lua.exe (+ `lua5.1.dll`) | Lua 5.1 runtime for sandbox and contract tests | 5.1.5 | no |
| busted | Test runner (installed with LuaRocks) | latest | no |

Direct downloads exist for Windows. On macOS `mech setup` prints instructions (for example `brew install lua@5.1`, `luarocks install luacheck`) and downloads StyLua; Linux is not supported by the downloader.

`busted.bat` is generated for your machine by `mech setup-busted` (Windows only, after `luarocks install busted`). It contains local paths, so it is git-ignored and not shipped.

## Setup

```bash
# Download all required tools
mech setup

# Verify installation without downloading
mech setup --verify

# Force re-download
mech setup --force

# Skip the path prompts and set up tools only
mech setup --skip-config
```

`mech setup` also merges the discovered paths into `~/.mechanic/config.json` (it does not overwrite your other keys).

## Manual Installation

If automatic download fails, you can download manually:

- **Luacheck**: https://github.com/mpeterv/luacheck/releases
- **StyLua**: https://github.com/JohnnyMorganz/StyLua/releases
- **Lua 5.1**: http://luabinaries.sourceforge.net/download.html

Place executables in this directory (checkout) or in `~/.mechanic/bin` (installed wheel); `mech call tools.status` reports what Mechanic finds. Tools on your system `PATH` are also used.

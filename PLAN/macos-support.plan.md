# macOS Support Plan

**Status**: Partially implemented; remaining work is unverified on real macOS hardware (reviewed 2026-09-30)  
**Priority**: Medium

The original target version (v0.3.0) was superseded: the desktop package is at 0.5.0 and macOS support has not been completed or tested on a Mac. Mechanic Desktop declares macOS in its package classifiers, and a macOS user can run the CLI, dashboard and MCP server, but tool setup is guidance rather than automation.

---

## Overview

Add native macOS support for Mechanic Desktop, including tool installation and platform-specific functionality.

---

## Tool Installation Strategy

| Tool | Installation Method | Notes |
|------|---------------------|-------|
| Lua 5.1 | `brew install lua@5.1` | Homebrew preferred |
| Luacheck | `luarocks install luacheck` | Requires LuaRocks |
| StyLua | Direct download | Binary available |
| Busted | `luarocks install busted` | Requires LuaRocks |

### Prerequisites for macOS

```bash
# Install Homebrew (if not present)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Lua and LuaRocks
brew install lua@5.1 luarocks

# Install Lua tools
luarocks install luacheck
luarocks install busted
```

---

## Implementation Status

### Phase 1: Detection & Fallback (done, in `desktop/src/mechanic/setup.py`)
- [x] Detect platform (`get_platform`)
- [x] Provide clear instructions when a tool is missing (`get_macos_instructions`, driven by the `darwin` entries in `desktop/src/mechanic/resources/checksums.json`)
- [ ] Check for Homebrew presence
- [ ] Check for LuaRocks presence

### Phase 2: Direct Downloads (not done)
- [ ] Download StyLua for macOS. The manifest has a `darwin` URL for the x86_64 build, but its checksum is `placeholder`, and `mech setup` now refuses any download without a real SHA-256, so macOS still gets instructions only.
- [ ] Handle ARM64 vs x86_64 architectures

### Phase 3: Integration
- [x] Remote reload helper: `--auto-reload` uses an AppleScript keystroke on macOS (`_trigger_reload_macos` in `utils.py`) and still requires the CLI key to match the in-game binding
- [x] WoW path discovery for `/Applications/World of Warcraft` (`config.get_common_wow_roots`) and `XDG_CONFIG_HOME` / `~/.config/mechanic/config.json`
- [ ] Test `addon.lint` on macOS
- [ ] Test `addon.format` on macOS
- [ ] Test the AppleScript reload helper on a real client
- [x] Documentation: `desktop/README.md` describes the macOS limits

---

## Platform Differences

| Feature | Windows | macOS |
|---------|---------|-------|
| Remote Reload | PowerShell `SendKeys` to the WoW window | AppleScript keystroke (implemented, untested) |
| Tool Location | `desktop/bin/*.exe` (checkout) or `~/.mechanic/bin` (wheel) | Tools from Homebrew/LuaRocks on `PATH` |
| WoW Path | `C:\Program Files (x86)\World of Warcraft` | `/Applications/World of Warcraft` |
| Addon links | Junctions (PowerShell `New-Item -ItemType Junction`) | Symlinks (`addon.sync`) |

---

## Testing Requirements

- [ ] Fresh macOS install (no tools)
- [ ] `mech setup` provides clear instructions
- [ ] Tools work after manual installation
- [ ] Dashboard functions correctly
- [ ] Symlinks created by `addon.sync` load in the game

---

## Related Files

- `desktop/src/mechanic/setup.py` - Setup module
- `desktop/src/mechanic/resources/checksums.json` - Tool manifest (moved from `desktop/bin/checksums.json`)
- `desktop/src/mechanic/utils.py` - Reload helper
- `desktop/src/mechanic/commands/development.py` - Tool commands

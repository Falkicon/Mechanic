# macOS Support Plan

**Status**: Planned  
**Target Version**: v0.3.0  
**Priority**: Medium

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

## Implementation Tasks

### Phase 1: Detection & Fallback
- [ ] Detect platform in setup.py
- [ ] Check for Homebrew presence
- [ ] Check for LuaRocks presence
- [ ] Provide clear instructions when missing

### Phase 2: Direct Downloads
- [ ] Add macOS URLs to checksums.json
- [ ] Download StyLua for macOS (binary available)
- [ ] Handle ARM64 vs x86_64 architectures

### Phase 3: Integration
- [ ] Test `addon.lint` on macOS
- [ ] Test `addon.format` on macOS
- [ ] Test remote reload (SendKeys alternative needed)
- [ ] Update documentation

---

## Platform Differences

| Feature | Windows | macOS |
|---------|---------|-------|
| Remote Reload | SendKeys to WoW window | AppleScript or similar |
| Tool Location | `bin/*.exe` | `bin/*` (no extension) |
| WoW Path | `C:\Program Files (x86)\World of Warcraft` | `/Applications/World of Warcraft` |

---

## Testing Requirements

- [ ] Fresh macOS install (no tools)
- [ ] `mech setup` provides clear instructions
- [ ] Tools work after manual installation
- [ ] Dashboard functions correctly
- [ ] Junction links work (macOS uses symlinks)

---

## Related Files

- `desktop/src/mechanic/setup.py` - Setup module
- `desktop/bin/checksums.json` - Tool manifest
- `desktop/src/mechanic/commands/development.py` - Tool commands

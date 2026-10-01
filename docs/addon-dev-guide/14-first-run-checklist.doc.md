# First-Run Checklist

> Part of the [Addon Development Guide](./AGENTS.md)

Last updated: 2026-09-30

---

## Overview

Use this checklist before releasing or after major changes to ensure your addon works correctly.

**Midnight Note**: Add instance testing to your checklist. Secret values only activate in M+/raids.

---

## Workspace Health Check

Before individual addon validation, ensure your overall development environment is healthy.

- [ ] **Tools**: `mech call tools.status` reports Luacheck, StyLua and Lua as available
- [ ] **Environment**: `mech call env.status` shows your WoW root, dev path and installed flavors
- [ ] **Dashboard**: `mech dashboard` opens and shows your diagnostic target
- [ ] **Setup**: If binaries are missing, run `mech setup`

---

## Pre-Release Checklist

### Environment and Setup

- [ ] `mech call tools.status` reports all tools available
- [ ] Required binaries (`lua`, `luacheck`, `stylua`) are installed by `mech setup`
- [ ] API keys (e.g., `GEMINI_API_KEY`) are set in `.env`

### TOC and Loading

- [ ] `## Interface` matches current client version
- [ ] Addon appears in AddOns list
- [ ] Addon loads without Lua errors
- [ ] Dependencies load in correct order

### Basic Functionality

- [ ] Main frame shows under intended conditions
- [ ] Main frame hides when appropriate
- [ ] All slash commands work
- [ ] Settings UI opens correctly

### SavedVariables

- [ ] Fresh install uses correct defaults
- [ ] Settings persist across `/reload`
- [ ] Settings persist across game restart
- [ ] Old SavedVariables upgrade correctly (if applicable)

### Debug Output

- [ ] Status command shows useful summary
- [ ] Debug dump includes all relevant state
- [ ] Error messages are informative

---

## Testing Commands

```lua
-- Check addon loaded
/run print(C_AddOns.IsAddOnLoaded("YourAddon"))

-- Check interface version
/dump select(4, GetBuildInfo())

-- Check SavedVariables
/dump YourAddonDB

-- Enable script errors
/console scriptErrors 1
```

---

## Combat Testing

- [ ] Addon works while in combat
- [ ] No "action blocked" errors
- [ ] Protected changes queue correctly
- [ ] Changes apply after combat ends

---

## Midnight Testing (12.0+)

### Open World

- [ ] All features work normally
- [ ] No errors with `/console scriptErrors 1`

### Instance Testing (M+/Raid)

- [ ] Addon loads in instance
- [ ] **Out of combat**: All features work
- [ ] **Enter combat**: Graceful degradation
  - [ ] No Lua errors
  - [ ] Degraded UI displays correctly
  - [ ] Passthrough features work (bars, cooldowns)
- [ ] **Exit combat**: Full functionality restores
- [ ] **Leave instance**: Normal operation resumes

### Secret Value Handling

- [ ] `issecretvalue()` checks don't error
- [ ] StatusBar passthrough works
- [ ] Cooldown passthrough works
- [ ] Text displays show fallback ("..." or hidden)

---

## Edge Cases

### Zone transitions

- [ ] Works after login
- [ ] Works after `/reload`
- [ ] Works after zone change
- [ ] Works after instance entry/exit

### State changes

- [ ] Works after spec change (if relevant)
- [ ] Works after talent change (if relevant)
- [ ] Works in different stances/forms (if relevant)

---

## Performance Check

```lua
-- CPU usage
/run UpdateAddOnCPUUsage(); print("CPU:", GetAddOnCPUUsage("YourAddon"), "ms")

-- Memory usage  
/run UpdateAddOnMemoryUsage(); print("Memory:", GetAddOnMemoryUsage("YourAddon"), "KB")
```

### Acceptable ranges

| Metric | Idle | Active |
|--------|------|--------|
| CPU | <1 ms/s | <10 ms/s |
| Memory | <500 KB | <2 MB |

---

## Release Preparation

- [ ] Version bumped in TOC
- [ ] Changelog updated
- [ ] README accurate
- [ ] GitHub templates (`.github/`) up to date
- [ ] No debug prints enabled
- [ ] No test code left in

### Midnight Release Additional

- [ ] Interface version set to the current client (for example `120100`, or multi-version such as `120100, 16001`)
- [ ] Compat layer included
- [ ] Degradation tested in instances
- [ ] Release notes explain Midnight limitations

---

## Post-Release Verification

After uploading to distribution platform:

- [ ] Download and install fresh copy
- [ ] Verify version matches
- [ ] Run through basic checklist again
- [ ] Check for user error reports (24-48 hours)

---

## Quick Debug Commands Reference

```lua
-- Frame inspection
/fstack

-- Event trace
/etrace

-- Dump any table
/dump YourAddonDB

-- Check specific addon memory
/run UpdateAddOnMemoryUsage(); print(GetAddOnMemoryUsage("YourAddon"))

-- Test secret values (Midnight)
/run local i=C_Spell.GetSpellCharges(372608); print(i and issecretvalue and issecretvalue(i.currentCharges))

-- Check combat lockdown
/run print("In combat:", InCombatLockdown())

-- Check instance type
/run print(select(2, GetInstanceInfo()))
```

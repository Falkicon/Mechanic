# TOC Best Practices

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2026-01-02

---

## Overview

The `.toc` file is your addon's manifest. It controls metadata, load order, and saved variable declarations.

**Midnight Note**: The interface version will change significantly with 12.0. Plan for updating your TOC when the pre-patch launches (January 20, 2026).

---

## Essential Fields

### Interface Version

```toc
## Interface: 120001
```

- Set to the current build's interface number.
- Find current version: `/dump select(4, GetBuildInfo())`
- If the interface number doesn't match, the addon is skipped unless the user enables "Load out of date addons."

**Finding the correct version**: Always verify using `/dump select(4, GetBuildInfo())` in-game. Interface numbers change with patches and vary by client.

### Multi-Client Support

For addons supporting multiple WoW editions (Retail, Classic, Cata), use **separate TOC files** with edition-specific suffixes:

```
MyAddon.toc              # Default / Retail
MyAddon_Vanilla.toc      # Classic Era
MyAddon_Cata.toc         # Cataclysm Classic
MyAddon_Wrath.toc        # Wrath Classic (if applicable)
```

Each TOC file contains its own `## Interface` line matching that client's version. The game client selects the appropriate TOC by filename.

You can also use file-line directives to conditionally include files:

```toc
## AllowLoadGameType: mainline
```

**Note**: For developer addons targeting only Retail/PTR/Beta, a single TOC file with one `## Interface` line is sufficient.

### SavedVariables

```toc
## SavedVariables: AddonDB
## SavedVariablesPerCharacter: AddonCharDB
```

- Use `SavedVariables` for account-wide data.
- Use `SavedVariablesPerCharacter` only when truly needed.
- Keep names unique to avoid conflicts with other addons.

---

## Load Order

Keep the file list ordered by dependency:

```toc
# Libraries first
Libs\LibStub\LibStub.lua
Libs\CallbackHandler-1.0\CallbackHandler-1.0.lua
Libs\AceAddon-3.0\AceAddon-3.0.lua

# Compatibility layer early (for Midnight)
Compat.lua

# Core before dependent files
Core.lua
Data.lua

# UI after core
UI.lua

# Config last
Config.lua
```

**Why**: Files load in order. A file cannot reference something defined in a later file.

---

## Metadata Best Practices

```toc
## Title: My Addon
## Notes: Brief description of what it does.
## Author: YourName
## Version: 1.0.0
## X-Website: https://github.com/yourname/myaddon
## X-Category: Interface Enhancements
```

- Keep titles and notes concise.
- **Localization**: TOC tags like `Title` and `Notes` support locale suffixes (e.g., `## Title-frFR: Mon Addon`), but runtime localization is often preferred for maintainability.
- Keep `## Version` in sync with your release tags.
- Use `X-` prefixed fields for custom metadata.

---

## Optional Fields

```toc
## Dependencies: SomeOtherAddon
## OptionalDeps: AceAddon-3.0
## LoadOnDemand: 1
## DefaultState: enabled
## IconTexture: Interface\AddOns\MyAddon\icon
```

| Field | Use Case |
|-------|----------|
| `Dependencies` | Hard requirement - addon won't load without it |
| `OptionalDeps` | Soft dependency - loads first if present |
| `LoadOnDemand` | Addon only loads when explicitly requested |
| `DefaultState` | Whether addon is enabled by default |
| `IconTexture` | Icon shown in addon list (supported in modern Retail) |

---

## Common Mistakes

1. **Wrong interface number** - Addon skipped at load (unless "Load out of date addons" is enabled).
2. **Misspelled SavedVariables** - Data doesn't persist.
3. **Wrong load order** - Lua errors on startup.
4. **Using `## Interface-Retail` style in single TOC** - Use separate TOC files per edition instead.

---

## Midnight Preparation

### Version Check Pattern

Include version checking in your addon for graceful transitions:

```lua
-- In Core.lua or Compat.lua
-- The 4th return of GetBuildInfo() is the interface number
local interfaceVersion = select(4, GetBuildInfo())

-- These thresholds are common conventions used by addon authors
-- Always verify actual values via /dump select(4, GetBuildInfo())
local IS_RETAIL = interfaceVersion >= 100000
local IS_TWW = interfaceVersion >= 110000
local IS_MIDNIGHT = interfaceVersion >= 120000  -- Convention, verify in-game

-- Feature flags
local SUPPORTS_SECRET_VALUES = IS_MIDNIGHT and issecretvalue ~= nil
```

### Pre-Patch Checklist

When Midnight pre-patch launches (January 2026):

- [ ] Update `## Interface` to match the new version (use `/dump select(4, GetBuildInfo())` to find it)
- [ ] Test all API calls for deprecation warnings
- [ ] Check combat functionality with new restrictions
- [ ] Verify SavedVariables migrate correctly
- [ ] Test with `/console scriptErrors 1` enabled
- [ ] Run `addon-dev fix-deprecations <name>` to find and fix deprecated APIs

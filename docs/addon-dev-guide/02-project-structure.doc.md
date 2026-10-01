# Project Structure

> Part of the [Addon Development Guide](./AGENTS.md)

Last updated: 2026-09-30

---

## Recommended File Layout

Addons are developed in the `_dev_` root folder and linked to WoW clients via junctions.

```
AddonName/
├── .github/           # GitHub repository configuration
│   ├── ISSUE_TEMPLATE/ # Structured bug reports and feature requests
│   ├── PULL_REQUEST_TEMPLATE.md
│   ├── CODEOWNERS      # Auto-assign reviewers
│   └── CONTRIBUTING.md # Contributor guidelines
├── Tests/             # Unit tests (*_spec.lua)
├── .stylua.toml       # Code formatting configuration
├── AddonName.toc      # Metadata and load order
├── Core.lua           # Initialization, SavedVariables defaults, event routing
├── UI.lua             # Frame construction and layout
├── Data.lua           # Spell IDs, constants, lookup tables
├── Config.lua         # Slash commands, optional options UI
├── Compat.lua         # API compatibility layer (recommended for Midnight)
├── Debug.lua          # Optional, if debug code grows
├── README.md          # User documentation
├── AGENTS.md          # AI agent documentation
└── Libs/              # Local copies of shared libraries (managed with libs.check / libs.sync)
```

---

## Tooling

Addons are developed with the **Mechanic Desktop** `mech` CLI, the dashboard, and the MCP server (`mech mcp`). Every capability is a registered command: run `mech commands` for the list and `mech --json call commands.list` for the schemas. Call a command with `mech call <command> '<json>'`; MCP clients call the same commands as tools (dashes instead of dots, for example `addon-lint`).

### Commands (replacing the old `addon-dev` tools)

| Task | Command |
|------|---------|
| Bootstrap a new addon from `_TemplateAddon` | `addon.create` |
| Lint (Luacheck) | `addon.lint` |
| Unit tests (Busted) and offline sandbox tests | `addon.test`, `sandbox.test` |
| Performance baselines and regressions | `perf.baseline`, `perf.compare`, `perf.report`, `perf.list` |
| Extract and validate translations | `locale.extract`, `locale.validate` |
| Format (StyLua) | `addon.format` |
| Link addons into WoW clients | `addon.sync` |
| Version, changelog, commit, tag | `release.all` or `mech release` |
| Validate TOC metadata and files | `addon.validate` |
| Deprecated API scan | `addon.deprecations` |
| Library status and sync | `libs.check`, `libs.sync` |
| Research (needs `GEMINI_API_KEY`) | `research.query` |
| Atlas icon search | `atlas.scan`, `atlas.search` |

The old `addon-dev` CLI is deprecated; see the [migration guide](../migration-from-addon-dev.md) for the full mapping.

---
## Why This Structure

- **Keeps load order explicit** - TOC file controls exactly what loads when.
- **Separates concerns** - API-facing code stays distinct from UI and config.
- **Scales well** - Add new files as features grow without reorganizing.
- **Compat layer** - Isolates version-specific code for Midnight transition.
- **Performance** - Smaller, modular files reduce parsing latency and improve initial display speed. See [Performance Guide](./08-performance.doc.md#impact-of-modularization) for details.

---

## Recommended Tools (VS Code / Cursor)

If using VS Code or Cursor, these extensions are highly recommended for WoW development:

| Extension | Purpose |
|-----------|---------|
| **Ketho's WoW API** | IntelliSense for WoW Lua API |
| **Septh's WoW Bundle** | Collection of useful dev tools |
| **Stanzilla's WoW TOC** | Syntax highlighting for `.toc` files |

---

## Blizzard UI Source Reference

**Critical Resource**: The official Blizzard UI source code is available and should be your primary reference for understanding how Blizzard implements UI features.

### Local Repositories

- **Live**: `../../_retail_/Interface/wow-ui-source-live/`
- **Beta**: `../../_beta_/Interface/wow-ui-source-beta/`

This repository ([Gethe/wow-ui-source](https://github.com/Gethe/wow-ui-source)) mirrors Blizzard's UI code (Live) and is invaluable for:

- Understanding frame templates and inheritance
- Learning Blizzard's coding patterns
- Finding correct API usage examples
- Reverse-engineering complex UI behaviors

### Key Directories

```
wow-ui-source-live/Interface/AddOns/
├── Blizzard_APIDocumentationGenerated/  # API documentation (SpellDocumentation.lua, etc.)
├── Blizzard_Deprecated/                 # API transition guides (essential for updates!)
├── Blizzard_ActionBar/                  # Action bar implementation
├── Blizzard_UnitFrame/                  # Unit frame implementation
├── Blizzard_NamePlates/                 # Nameplate implementation
└── ...
```

### Using for Development

1. **Find examples**: Search for how Blizzard uses a specific API.
2. **Understand templates**: Study XML files for frame inheritance.
3. **API transitions**: Check `Blizzard_Deprecated/` for migration guides (like `11_0_0_SpellBookAPITransitionGuide.lua`).
4. **Stay current**: Repository updates with each patch.

### Update the Repository

Pull the branch that matches your local checkout. The [Gethe/wow-ui-source](https://github.com/Gethe/wow-ui-source) mirror uses specific branch names per client line (e.g., `live`, `ptr`, `beta`).

```bash
# Example: update your local checkout
cd "<path-to-your-wow-ui-source-clone>"
git pull origin <branch>   # e.g., live, ptr, beta
```

> **Note**: Branch names follow the client line, not a generic `main` branch. Check `git branch -a` to see available remote branches.

---

## File Responsibilities

### Core.lua

- Addon initialization (`ADDON_LOADED` handling)
- SavedVariables loading and defaults
- Event registration and routing
- Global state management

### UI.lua

- Frame creation and layout
- Visual updates
- User interaction handling

### Data.lua

- Spell IDs and ability constants
- Lookup tables
- Static configuration data

### Config.lua

- Slash command registration
- Settings UI (if using AceConfig or Blizzard Settings)
- User preference handling

### Compat.lua (Recommended for Midnight)

- API wrappers with fallbacks
- Version detection (convention: `IS_MIDNIGHT = select(4, GetBuildInfo()) >= 120000`)
- Secret value handling utilities

> **Note**: The 4th return of `GetBuildInfo()` is the interface/TOC version number. The `>= 120000` threshold is a common addon author convention for detecting Midnight, not an officially guaranteed boundary.

```lua
-- Example Compat.lua structure
local _, ns = ...
ns.Compat = {}

-- Convention: detect Midnight via interface version
-- select(4, GetBuildInfo()) returns the interface number (e.g., 120000 for 12.0)
local IS_MIDNIGHT = (select(4, GetBuildInfo()) >= 120000)
ns.Compat.IS_MIDNIGHT = IS_MIDNIGHT

-- Wrap APIs that may return secret values
-- issecretvalue() is Blizzard's API for testing if a value is a Secret Value
ns.Compat.SafeGetSpellCharges = function(spellID)
    local ok, info = pcall(C_Spell.GetSpellCharges, spellID)
    if not ok or not info then return nil end
    
    -- In Midnight, tainted code can receive secrets and pass them to some APIs,
    -- but can't compare or perform arithmetic on them
    if IS_MIDNIGHT and issecretvalue and issecretvalue(info.currentCharges) then
        return nil, true  -- Return nil and flag as secret
    end
    
    return info, false
end
```

### Debug.lua (optional)

- Debug output functions
- State inspection utilities
- Development-only features

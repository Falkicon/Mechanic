# Community Resources

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2025-12-18

---

## Overview

Essential resources for WoW addon development, from documentation to community help.

---

## Documentation

### Primary References

| Resource | URL | Notes |
|----------|-----|-------|
| **Warcraft Wiki** | warcraft.wiki.gg | Most up-to-date API reference |
| **Blizzard UI Source** | Local + GitHub | Authoritative frame templates |
| **Wowpedia** | wowpedia.fandom.com | Legacy reference, still useful |

### Blizzard UI Source

**GitHub Mirror**: [Gethe/wow-ui-source](https://github.com/Gethe/wow-ui-source)

**Local Repositories**:
- **Live**: `../../_retail_/Interface/wow-ui-source-live/`
- **Beta**: `../../_beta_/Interface/wow-ui-source-beta/`

This is your most valuable resource for:
- Understanding frame templates and inheritance
- Learning Blizzard's coding patterns
- Finding correct API usage examples
- Reverse-engineering complex UI behaviors

### Key Directories in UI Source

```
wow-ui-source-live/Interface/AddOns/
├── Blizzard_APIDocumentationGenerated/  # Official API docs
│   ├── SpellDocumentation.lua           # C_Spell namespace
│   ├── UnitDocumentation.lua            # Unit functions
│   └── ...
├── Blizzard_Deprecated/                 # API transition guides!
│   └── 11_0_0_SpellBookAPITransitionGuide.lua
├── Blizzard_ActionBar/                  # Action bar code
├── Blizzard_UnitFrame/                  # Unit frame code
├── Blizzard_NamePlates/                 # Nameplate code
├── Blizzard_Cooldown/                   # Cooldown frame code
├── Blizzard_Settings/                   # Settings panel code
└── Blizzard_DebugTools/                 # /dump, /fstack, etc.
```

### Updating UI Source

**Live**:
```bash
cd "../../_retail_/Interface/wow-ui-source-live/wow-ui-source-live"
git pull origin live
```

**Beta**:
```bash
cd "../../_beta_/Interface/wow-ui-source-beta/wow-ui-source-beta"
git pull origin main
```

---

## Help and Discussion

### Real-Time Help

| Platform | Best For |
|----------|----------|
| **WoWUIDev Discord** | Real-time developer help, most active |
| **WoWInterface Forums** | Long-form discussions, archives |
| **Reddit (r/wowaddons)** | General questions, user feedback |

### Discord Tips

- Search before asking - many questions already answered.
- Include error messages and code snippets.
- Specify client version (Retail, Classic, etc.).
- For Midnight questions, mention you're testing 12.0.

---

## Distribution Platforms

### CurseForge

- **URL**: curseforge.com/wow/addons
- **Audience**: Largest user base
- **Features**: Auto-packaging from Git, version management
- **Best for**: Wide distribution

### Wago.io

- **URL**: wago.io
- **Audience**: Growing platform
- **Features**: WeakAuras/Plater support, modern UI
- **Best for**: Addons with companion imports

### WoWInterface

- **URL**: wowinterface.com
- **Audience**: Developer-focused community
- **Features**: Detailed addon pages, forums
- **Best for**: Niche or technical addons

---

## Libraries

### Core Libraries

| Library | Purpose | Source |
|---------|---------|--------|
| **Ace3** | Full addon framework | github.com/WoWUIDev/Ace3 |
| **LibStub** | Library versioning | github.com/lua-wow/LibStub |
| **CallbackHandler** | Event system | Included in Ace3 |

### Common Extensions

| Library | Purpose |
|---------|---------|
| **LibDataBroker** | Data feed standard |
| **LibDBIcon** | Minimap buttons |
| **LibSharedMedia** | Fonts, textures, sounds |

See **[Library Reference](../integration/libraries.md)** for local documentation.

---

## Development Tools

### VS Code / Cursor Extensions

| Extension | Purpose |
|-----------|---------|
| **Ketho's WoW API** | IntelliSense for WoW Lua |
| **Septh's WoW Bundle** | Dev tool collection |
| **Stanzilla's WoW TOC** | TOC syntax highlighting |

### In-Game Tools

| Addon/Command | Purpose |
|---------------|---------|
| **BugGrabber + BugSack** | Error capture and display |
| `/dump` | Inspect variables |
| `/fstack` | Frame inspection |
| `/etrace` | Event tracing |

---

## Learning Resources

### Getting Started

1. Read Blizzard UI source for examples.
2. Start with simple display-only addon.
3. Add features incrementally.
4. Join WoWUIDev Discord for questions.

### Recommended Path

1. **Hello World** - Basic frame, slash command
2. **SavedVariables** - Persist settings
3. **Events** - React to game state
4. **Settings UI** - User configuration
5. **Libraries** - Ace3 integration

---

## Staying Updated

### Patch Preparation

- Watch for PTR/beta announcements.
- Test addons before patches go live.
- Monitor WoWUIDev Discord for breaking changes.
- Read official Blizzard forums for API announcements.

### Midnight Resources

| Resource | URL |
|----------|-----|
| Combat Philosophy Blog | worldofwarcraft.blizzard.com/news/24246290 |
| Warcraft Wiki API Changes | warcraft.wiki.gg/wiki/Patch_12.0.0/API_changes |
| Alpha/Beta Forums | forums.blizzard.com (when available) |

### Version Tracking

- Keep `## Interface` current in TOC.
- Update addon when major patches release.
- Communicate with users about compatibility.

---

## Midnight-Specific Resources

### Official Announcements

- [Combat Philosophy and Addon Disarmament](https://worldofwarcraft.blizzard.com/en-gb/news/24246290/combat-philosophy-and-addon-disarmament-in-midnight) - Blizzard's explanation
- [Day 1 Alpha UI Update](https://eu.forums.blizzard.com/en/wow/t/day-1-alpha-ui-and-addons-update/590772) - Refinements based on feedback

### Key Dates

| Event | Date |
|-------|------|
| Pre-patch | January 20, 2026 |
| Full release | March 2, 2026 |

### What Blizzard Is Adding

Blizzard is building native replacements for common addon functionality:

| Native Feature | Replaces |
|----------------|----------|
| Damage/Healing Meters | Details!, Skada, Recount |
| Boss Alerts | DBM, BigWigs timers |
| Cooldown Tracking | WeakAuras cooldown tracking |
| Enhanced Nameplates | Plater, TidyPlates |

Addons in these categories should consider:
- Complementing rather than replacing native features
- Focusing on customization and organization
- Providing out-of-combat functionality

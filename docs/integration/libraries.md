# Library Reference - Agent Documentation

Technical reference for addon libraries, dependency management, and automation.

---

## Library Management

Use the `mech` CLI for all library operations:

```bash
# Check library status against libs.json config
mech call libs.check '{"addon": "MyAddon"}'

# Sync libraries based on libs.json
mech call libs.sync '{"addon": "MyAddon"}'

# Initialize libs.json from currently installed libraries
mech call libs.init '{"addon": "MyAddon"}'

# Preview changes without applying (dry run)
mech call libs.sync '{"addon": "MyAddon", "dry_run": true}'

# Force update existing libraries
mech call libs.sync '{"addon": "MyAddon", "force": true}'
```

**DO NOT** manually update libraries in `Libs` folders. Use `libs.sync` to maintain consistency.

---

## Library Workflow

1. **Check Status**: Run `mech call libs.check` to see which libraries need updates
2. **Sync**: Run `mech call libs.sync` to update libraries from the source
3. **Reference**: Consult the library's README or source code for API usage

---

## Library Index

### Ace3 Framework
**Repository**: `WoWUIDev/Ace3`
**Purpose**: A comprehensive framework for facilitating rapid and robust addon development. It is modular; you can use the entire suite or individual libraries.

*   **AceAddon-3.0**: The core of the framework. Handles addon initialization (`OnInitialize`, `OnEnable`), modules, and embedding.
*   **AceDB-3.0**: Managing saved variables (profiles, character specific settings, defaults).
*   **AceConfig-3.0**: Building configuration options tables that can be displayed as GUI or handled via slash commands.
*   **AceGUI-3.0**: Widget library for creating graphical user interfaces (Dropdowns, scrollframes, windows). Used by AceConfigDialog.
*   **AceEvent-3.0**: Simplified event registration and handling (`RegisterEvent`, `SendMessage`).
*   **AceConsole-3.0**: Handling slash commands and chat output.
*   **AceLocale-3.0**: Localization system.
*   **CallbackHandler-1.0**: (Backend) The fundamental mixin that powers the event/message systems of Ace3. **Critical Dependency**.

### LibStub
**Repository**: `lua-wow/LibStub`
**Purpose**: The versioning library. **Required by almost all other libraries.**
**Usage**: `local lib = LibStub("LibraryName-1.0")`
It ensures that only the newest version of a library is loaded into memory, even if multiple addons include different versions.

### LibDataBroker-1.1 (LDB)
**Repository**: `tekkub/libdatabroker-1-1`
**Purpose**: A data-feed standard. Allows your addon to provide data (text, icon, tooltip) to display addons (like Bazooka, Titan Panel, ChocolateBar) without creating your own display frame.
**Features**:
*   Provide a "Launcher" icon.
*   Provide status text (gold, durability, dps, etc).

### LibDBIcon-1.0
**Repository**: `zerosnake0/LibDBIcon-1.0`
**Purpose**: An extension to LDB. It takes an LDB data object and automatically creates a **Minimap Button** for it.
**Usage**: Use this if you want your addon to have a minimap button that respects standard storage/hiding preferences.

### SharedMedia
**Repository**: `bkader/SharedMedia`
**Purpose**: A collection of Fonts, Textures (Statusbars, Backgrounds, Borders), and Sounds shared globally between addons.
**Usage**:
*   **LibSharedMedia-3.0**: The library (usually inside `Libs`) to register and retrieve media.
*   **Assets**: The repo contains the actual media files (`MyMedia.ttf`, `Texture.tga`).
*   Allows users to select "MyCustomFont" in your addon's AceConfig settings if you support LSM.

---

## Common Dependency Chains

*   **Standard Ace Addon**:
    *   `LibStub`
    *   `CallbackHandler-1.0` (from Ace3)
    *   `AceAddon-3.0`
    *   `AceEvent-3.0`
    *   `AceDB-3.0` (if saving settings)
    *   `AceConsole-3.0` (if has slash commands)

*   **Config UI**:
    *   All of the above +
    *   `AceGUI-3.0`
    *   `AceConfig-3.0`

*   **Minimap Button**:
    *   `LibStub`
    *   `CallbackHandler-1.0`
    *   `LibDataBroker-1.1`
    *   `LibDBIcon-1.0`

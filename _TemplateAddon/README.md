# TemplateAddon

Minimalist Ace3-based World of Warcraft addon template.

## Features
- AceAddon-3.0 initialization
- AceDB-3.0 configuration management
- AceConsole-3.0 slash command support
- AceLocale-3.0 localization support
- CurseForge-ready `.pkgmeta`
- Development mode detection via `DevMarker.lua`
- GitHub issue templates included

## Quick Start

1. **Copy the template**: Copy `TemplateAddon/` to your addon location
2. **Rename**: Replace all instances of `TemplateAddon` with your addon name:
   - Folder name
   - `.toc` filename and contents
   - `Core.lua` references
   - `Locales/enUS.lua` locale name
   - `.luacheckrc` globals
   - `.pkgmeta` package name
3. **Update metadata**: Edit the `.toc` file with your author name and notes
4. **Start coding**: Add your addon logic to `Core.lua`

## File Structure

```
TemplateAddon/
├── TemplateAddon.toc    # Addon manifest
├── Core.lua             # Main addon logic
├── DevMarker.lua        # Dev mode flag (excluded from releases)
├── embeds.xml           # Library loading
├── .pkgmeta             # CurseForge packaging config
├── .luacheckrc          # Linting configuration
├── Libs/                # Embedded libraries
└── Locales/
    └── enUS.lua         # English strings
```

## Slash Commands

- `/ta` or `/templateaddon` - Main command
- `/ta debug` - Toggle debug mode

## License

GPL-3.0

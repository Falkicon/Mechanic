# TemplateAddon

Minimalist Ace3-based World of Warcraft addon template. It is the template Mechanic's `addon.create` command copies.

## Features
- AceAddon-3.0 initialization
- AceDB-3.0 configuration management
- AceConsole-3.0 slash command support
- AceLocale-3.0 localization support
- CurseForge-ready `.pkgmeta`
- Development mode detection via `DevMarker.lua`
- Optional [Mechanic](https://github.com/Falkicon/Mechanic) integration through `MechanicLib` (a no-op when Mechanic is not installed)
- Luacheck configuration and a GitHub Actions lint workflow
- GitHub issue templates included

## Quick Start

### With Mechanic (recommended)

```bash
mech call addon.create '{"name": "MyAddon", "author": "YourName"}'
```

`addon.create` copies this folder to `_dev_/MyAddon/`, renames `TemplateAddon` to your addon name in every file name and text file (the TOC, `Core.lua`, `Locales/enUS.lua`, `.luacheckrc`, `.pkgmeta`, the workflow and the docs), replaces the `YourName` author placeholder when you pass `author`, and skips `Libs/`. It looks for the template at the `template_path` config key, then `_dev_/Mechanic/_TemplateAddon`, then `_dev_/_TemplateAddon`. Then run `mech call addon.sync` to link it into your WoW client and `mech call addon.validate` to check the TOC.

### By hand

1. **Copy the template**: copy `TemplateAddon/` to your addon location
2. **Rename**: replace all instances of `TemplateAddon` with your addon name:
   - Folder name
   - `.toc` filename and contents
   - `Core.lua` references
   - `Locales/enUS.lua` locale name
   - `.luacheckrc` globals
   - `.pkgmeta` package name
   - `.github/workflows/ci.yml` folder name
3. **Update metadata**: edit the `.toc` file with your author name and notes
4. **Start coding**: add your addon logic to `Core.lua`

Either way, the `/ta` slash command and its `L["..."]` strings are not renamed automatically; change them yourself.

## File Structure

```
TemplateAddon/
├── TemplateAddon.toc    # Addon manifest (Interface 120100)
├── Core.lua             # Main addon logic
├── DevMarker.lua        # Dev mode flag (excluded from releases)
├── embeds.xml           # Library loading
├── .pkgmeta             # CurseForge packaging config
├── .luacheckrc          # Linting configuration
├── Libs/                # Embedded libraries
└── Locales/
    └── enUS.lua         # English strings
```

The repository around the addon folder has `.github/` (issue templates and a Luacheck workflow), `AGENTS.md`, `LICENSE` and this README.

## Slash Commands

- `/ta` or `/templateaddon` - Main command
- `/ta debug` - Toggle debug mode

## Development mode and Mechanic

`DevMarker.lua` sets `ns.IS_DEV_MODE`. The file is only present in a git checkout: the TOC wraps it in a `#@debug@` block and `.pkgmeta` ignores it, so released packages never load it. It works with or without Mechanic installed. If you prefer to key debug features on Mechanic itself, `LibStub("MechanicLib-1.0", true)` returns `nil` without Mechanic and otherwise offers `MechanicLib:IsEnabled()`. `Core.lua` already registers the addon with MechanicLib in `OnEnable` (the TOC lists `!Mechanic` as an optional dependency, so it loads first); extend that table with `getDebugBuffer`, `tests`, `performance`, `tools` or `inspect` hooks as described in the Mechanic integration guide (`docs/integration/mechaniclib.md` in the Mechanic repository).

## Libraries

`Libs/` holds embedded copies of LibStub, CallbackHandler and the Ace3 libraries so the addon runs from a git checkout. For releases, `.pkgmeta` lists CurseForge externals that the packager fetches fresh. `Libs/` is skipped by Luacheck and by `addon.create`'s text rewriting.

## License

GPL-3.0

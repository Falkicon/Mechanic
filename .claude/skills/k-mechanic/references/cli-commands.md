# Mechanic CLI Commands

Complete reference for the `mech` command-line interface.

## Starting the Dashboard

```bash
mech                        # Start server + open dashboard
mech dashboard              # Same as above
mech dashboard --port 8080  # Custom port
mech dashboard --no-browser # Don't auto-open browser
```

## Development Commands

### Linting
```bash
mech lint <addon>           # Run Luacheck on addon
mech lint <addon> --fix     # Auto-fix issues (where possible)
mech call addon.lint '{"addon": "MyAddon"}'  # AFD version
```

### Testing
```bash
mech test <addon>           # Run Busted unit tests
mech test <addon> --coverage # Include coverage report
mech call addon.test '{"addon": "MyAddon", "coverage": true}'
```

### Formatting
```bash
mech format <addon>         # Format with StyLua
mech format <addon> --check # Check only, don't modify
mech call addon.format '{"addon": "MyAddon"}'
```

### Validation
```bash
mech call addon.validate '{"addon": "MyAddon"}'  # Validate .toc file
mech call addon.deprecations '{"addon": "MyAddon"}'  # Scan for deprecated APIs
mech call addon.deprecations '{"addon": "MyAddon", "fix": true}'  # Auto-fix
```

## Release Workflow

### Full Release (Convenience Command)
```bash
mech release <addon> <version> <message>
# Example:
mech release MyAddon 1.2.0 "Added new feature"
```

This chains: `version.bump` → `changelog.add` → `git.commit` → `git.tag`

### Full Release (AFD Command)
```bash
mech call release.all '{"addon": "MyAddon", "version": "1.2.0", "message": "Added feature"}'
mech call release.all '{"addon": "MyAddon", "version": "1.2.0", "message": "Bug fix", "category": "Fixed"}'
```

### Individual Release Commands
```bash
mech call version.bump '{"addon": "MyAddon", "version": "1.2.0"}'
mech call changelog.add '{"addon": "MyAddon", "version": "1.2.0", "message": "Added feature", "category": "Added"}'
mech call git.commit '{"addon": "MyAddon", "message": "Release 1.2.0"}'
mech call git.tag '{"addon": "MyAddon", "version": "1.2.0"}'
```

## Environment Commands

### Create New Addon
```bash
mech call addon.create '{"name": "MyNewAddon", "author": "YourName"}'
mech call addon.create '{"name": "MyAddon", "template": "minimal"}'
```

### Sync Junction Links
```bash
mech call addon.sync '{"addon": "MyAddon"}'
mech call addon.sync '{"addon": "MyAddon", "flavors": ["retail", "ptr"]}'
```

### Check Libraries
```bash
mech call libs.check '{"addon": "MyAddon"}'  # Check library status
```

### Initialize Library Config
```bash
mech call libs.init '{"addon": "MyAddon"}'  # Create libs.json from installed libs
mech call libs.init '{"addon": "MyAddon", "overwrite": true}'  # Overwrite existing
```

### Sync Libraries
```bash
mech call libs.sync '{"addon": "MyAddon"}'  # Sync libs based on libs.json
mech call libs.sync '{"addon": "MyAddon", "dry_run": true}'  # Preview changes
mech call libs.sync '{"addon": "MyAddon", "force": true}'  # Force overwrite
```

### Environment Status
```bash
mech call env.status  # Get environment config and paths
```

### File Picker
```bash
mech call system.pick_file  # Open native file picker
mech call system.pick_file '{"title": "Select .toc file", "filter": "*.toc"}'
```

## Utility Commands

### Reload WoW (User Only - NOT for Agents)

> **IMPORTANT**: Agents should NOT use `reload.trigger`. The timing between reload and SavedVariables sync is unpredictable. Instead, **ask the user to `/reload` in WoW** and wait for their confirmation before calling `addon.output`.

```bash
# For human users only (via Dashboard or CLI):
mech reload                 # Focus WoW window + send reload key
```

### Get Addon Output (Agent Mode)
```bash
mech call addon.output                    # Full output
mech call addon.output --agent            # Compressed for AI (~70% smaller)
mech --agent call addon.output            # Same effect
```

Agent mode applies smart compression:
- Groups errors by addon
- Deduplicates by file:line
- Shows top 5 errors per addon with occurrence counts

### SavedVariables
```bash
mech call sv.discover                     # Find WoW accounts
mech call sv.parse '{"file_path": "path/to/SV.lua"}'
```

### Server Management
```bash
mech stop                   # Gracefully stop running server
mech call server.shutdown   # Same via AFD
```

## Lua Eval Queue (Round-Trip)

Execute Lua code in-game and retrieve results.

### Queue Code for Execution
```bash
# Queue single snippet
mech call lua.queue '{"code": ["GetMoney()/10000"], "labels": ["gold"]}'

# Queue multiple snippets
mech call lua.queue '{"code": ["UnitName(\"player\")", "UnitLevel(\"player\")"], "labels": ["name", "level"]}'
```

### Read Results (after /reload)
```bash
mech call lua.results
```

### Workflow
1. `mech call lua.queue` — Write snippets to MechanicQueue.lua
2. `/reload` in WoW — Addon executes queue on load
3. `mech call lua.results` — Read from MechanicDB.luaEvalResults

Results are also included in `addon.output`.

## API Commands (Offline)

Search and explore WoW APIs without launching the game.

### Search APIs
```bash
mech call api.search '{"query": "*Spell*", "limit": 10}'
mech call api.search '{"query": "GetItem*", "namespace": "C_Item"}'
```

### Get API Details
```bash
mech call api.info '{"api_name": "C_Spell.GetSpellInfo"}'
```

### List by Namespace
```bash
mech call api.list '{"namespace": "C_Spell", "limit": 20}'
mech call api.list '{"category": "combat"}'
```

### Queue API Tests
```bash
# Queue APIs to test in-game
mech call api.queue '{"apis": ["C_Spell.GetSpellInfo", "C_Item.GetItemInfo"]}'

# With parameters
mech call api.queue '{"apis": ["C_Spell.GetSpellInfo"], "params": {"C_Spell.GetSpellInfo": {"spellID": 8690}}}'
```

### API Statistics
```bash
mech call api.stats
```

## Sandbox Commands (Offline Lua)

Test Lua code without launching WoW.

### Generate API Stubs
```bash
mech call sandbox.generate                         # Generate all stubs
mech call sandbox.generate '{"namespace": "C_Spell"}'  # Single namespace
mech call sandbox.generate '{"force": true}'       # Regenerate
```

### Execute Lua in Sandbox
```bash
mech call sandbox.exec '{"code": "return 1 + 1"}'
mech call sandbox.exec '{"code": "return C_Spell.GetSpellInfo(8690)", "load_stubs": true}'
mech call sandbox.exec '{"code": "return MyAddon.DoThing()", "addon": "MyAddon"}'
```

## Tools Status

Check installation status of development tools.

```bash
mech call tools.status
```

Returns status of: luacheck, stylua, lua, busted

## Self-Documentation

Regenerate CLI reference from command registry.

```bash
mech docs                        # Shortcut to generate docs
mech call docs.generate          # Default: outputs to docs/cli-reference.md
mech call docs.generate '{"format": "json"}'  # JSON format
mech call docs.generate '{"output_path": "my-docs.md"}'  # Custom path
```

The generated reference is always up-to-date with all registered commands.

## Localization Commands

```bash
mech call locale.validate '{"addon": "MyAddon"}'   # Check coverage
mech call locale.extract '{"addon": "MyAddon"}'    # Find strings to localize
mech call atlas.search '{"query": "sword", "limit": 20}'  # Search Blizzard icons
```

## Global Flags

| Flag | Description | Example |
|------|-------------|---------|
| `--json` | Output raw JSON | `mech lint MyAddon --json` |
| `--quiet` | Suppress non-essential output | `mech test MyAddon --quiet` |
| `--agent` | Smart compression for AI agents | `mech --agent call addon.output` |

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | Command failed |
| 2 | Invalid arguments |

## Environment Requirements

- Python 3.10+
- `mech` installed via `pip install -e .` from `desktop/` folder
- Lua tools in PATH or `desktop/bin/`: `luacheck.exe`, `stylua.exe`, `busted.bat`

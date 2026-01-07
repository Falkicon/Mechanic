# Migration Guide: addon-dev to mech CLI

This guide helps you migrate from the deprecated `addon-dev` CLI to the new `mech` CLI.

## Why Migrate?

The `mech` CLI is the unified command interface for all WoW addon development tools:

- **Structured commands**: Typed input/output with Pydantic schemas
- **Consistent patterns**: All commands follow `mech call <namespace>.<action> '{json}'`
- **Better error handling**: Actionable error messages with suggestions
- **Agent-optimized**: `--agent` flag for AI-friendly compressed output
- **Extensible**: Easy to add new commands following structured patterns

## Command Mapping

### Development Commands

| addon-dev Command | mech Command |
|-------------------|--------------|
| `addon-dev lint MyAddon` | `mech call addon.lint '{"addon": "MyAddon"}'` |
| `addon-dev test MyAddon` | `mech call addon.test '{"addon": "MyAddon"}'` |
| `addon-dev test MyAddon --coverage` | `mech call addon.test '{"addon": "MyAddon", "coverage": true}'` |
| `addon-dev format MyAddon` | `mech call addon.format '{"addon": "MyAddon"}'` |
| `addon-dev format MyAddon --check` | `mech call addon.format '{"addon": "MyAddon", "check": true}'` |
| `addon-dev validate MyAddon` | `mech call addon.validate '{"addon": "MyAddon"}'` |
| `addon-dev fix-deprecations MyAddon` | `mech call addon.deprecations '{"addon": "MyAddon", "fix": true}'` |

### Environment Commands

| addon-dev Command | mech Command |
|-------------------|--------------|
| `addon-dev create MyAddon` | `mech call addon.create '{"name": "MyAddon"}'` |
| `addon-dev sync MyAddon` | `mech call addon.sync '{"addon": "MyAddon"}'` |
| `addon-dev doctor` | `mech call tools.status` |
| `addon-dev status` | `mech call env.status` |

### Localization Commands

| addon-dev Command | mech Command |
|-------------------|--------------|
| `addon-dev localize validate MyAddon` | `mech call locale.validate '{"addon": "MyAddon"}'` |
| `addon-dev localize extract MyAddon` | `mech call locale.extract '{"addon": "MyAddon"}'` |
| `addon-dev atlas search sword` | `mech call atlas.search '{"query": "sword"}'` |

### Library Commands

| addon-dev Command | mech Command |
|-------------------|--------------|
| (PowerShell script) | `mech call libs.check '{"addon": "MyAddon"}'` |
| (PowerShell script) | `mech call libs.sync '{"addon": "MyAddon"}'` |

### Release Commands

| addon-dev Command | mech Command |
|-------------------|--------------|
| `addon-dev release MyAddon 1.2.0 "Message"` | `mech release MyAddon 1.2.0 "Message"` |

Or use individual commands:

```bash
mech call version.bump '{"addon": "MyAddon", "version": "1.2.0"}'
mech call changelog.add '{"addon": "MyAddon", "version": "1.2.0", "message": "..."}'
mech call git.commit '{"addon": "MyAddon", "message": "Release 1.2.0"}'
mech call git.tag '{"addon": "MyAddon", "version": "1.2.0"}'
```

### Research Commands

| addon-dev Command | mech Command |
|-------------------|--------------|
| `addon-dev research "query"` | `mech call research.query '{"query": "..."}'` |
| `addon-dev research "query" --mode thinking` | `mech call research.query '{"query": "...", "mode": "thinking"}'` |

> **Note**: Research commands require `GEMINI_API_KEY` in your environment.
> See `desktop/.env.example` for setup instructions.

### API Definition Commands (formerly APIPopulator)

| Old Tool | mech Command |
|----------|--------------|
| `python blizzard_parser.py --source /path` | `mech call api.populate '{"source_path": "/path/to/wow-ui-source"}'` |
| `python merge_to_lua.py` | `mech call api.generate '{}'` |
| Both in one step | `mech call api.refresh '{"source_path": "/path/to/wow-ui-source"}'` |

> **Note**: Requires a local clone of [wow-ui-source](https://github.com/Gethe/wow-ui-source).

### Atlas Commands (formerly AtlasScanner)

| Old Tool | mech Command |
|----------|--------------|
| `python atlas_scanner.py --scan` | `mech call atlas.scan '{"source_path": "/path/to/wow-ui-source"}'` |
| `python atlas_scanner.py --query sword` | `mech call atlas.search '{"query": "sword"}'` |

> **Note**: Supports wildcards in search: `atlas.search '{"query": "UI-*-Icon"}'`

## Output Modes

### Default Output
```bash
mech call addon.lint '{"addon": "MyAddon"}'
```
Shows formatted human-readable output.

### JSON Output
```bash
mech --json call addon.lint '{"addon": "MyAddon"}'
```
Returns raw JSON for programmatic parsing.

### Agent Output
```bash
mech --agent call addon.lint '{"addon": "MyAddon"}'
```
Smart compression for AI agents (groups errors, deduplicates, limits output).

## Convenience Commands

Some operations have shorthand versions:

```bash
# Instead of: mech call addon.output
mech addon.output

# List all available commands
mech commands

# Generate CLI documentation
mech docs
```

## Common Patterns

### Running Multiple Commands

```bash
# Validate, lint, and test
mech call addon.validate '{"addon": "MyAddon"}'
mech call addon.lint '{"addon": "MyAddon"}'
mech call addon.test '{"addon": "MyAddon"}'
```

### Checking Tool Status

```bash
mech call tools.status
```

### Full Release Workflow

```bash
mech release MyAddon 1.2.0 "Added new feature"
```

This runs: version.bump → changelog.add → git.commit → git.tag

## Getting Help

```bash
# List all commands
mech commands

# Get help on a specific command
mech call --help

# View CLI reference
mech docs
```

## Troubleshooting

### "Command not found: mech"

Make sure Mechanic Desktop is installed:
```bash
cd !Mechanic/desktop
pip install -e .
```

### "Tool not found" errors

Run setup to install required binaries:
```bash
mech setup
```

### Research commands fail

Ensure `GEMINI_API_KEY` is set:
```bash
# Copy example and add your key
cp desktop/.env.example desktop/.env
# Edit .env and add your Gemini API key
```

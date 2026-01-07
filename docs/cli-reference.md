# CLI Reference

> Auto-generated from `mechanic-desktop` v0.1.0 on 2026-01-07

This document lists all available Mechanic CLI commands with their inputs and outputs.

## Quick Reference

| Command | Description |
|---------|-------------|
| `dashboard.metrics` | Get the latest reload and test metrics from the local histor... |
| `server.shutdown` | Gracefully shut down the Mechanic Desktop server |
| `sv.discover` | Automatically discover SavedVariables paths for all WoW flav... |
| `sv.parse` | Parse a WoW SavedVariables file and extract !Mechanic data |
| `addon.complexity` | Detect code complexity issues in a WoW addon (nesting, long ... |
| `addon.create` | Create a new WoW addon from a template |
| `addon.deadcode` | Detect dead code in a WoW addon (unused functions, orphaned ... |
| `addon.deprecations` | Scan a WoW addon for deprecated API calls (100+ APIs, 11.0-1... |
| `addon.format` | Run StyLua formatter on a WoW addon |
| `addon.lint` | Run Luacheck linter on a WoW addon |
| `addon.output` | Get all addon output (errors, tests, console) for agent cons... |
| `addon.security` | Detect security issues in a WoW addon (combat lockdown, secr... |
| `addon.sync` | Create junction links from development addon to WoW client f... |
| `addon.test` | Run Busted unit tests on a WoW addon |
| `addon.validate` | Validate a WoW addon's .toc file for common issues |
| `changelog.add` | Add an entry to the addon's CHANGELOG.md |
| `version.bump` | Update the version in a WoW addon's .toc file |
| `atlas.scan` | Scan wow-ui-source for atlas icons and generate searchable i... |
| `atlas.search` | Search Blizzard UI atlas icons by name pattern (supports wil... |
| `locale.extract` | Extract potential localizable strings from addon code |
| `locale.validate` | Validate locale coverage against the enUS baseline |
| `libs.check` | Check addon library status against libs.json config |
| `libs.init` | Creates a libs.json config file from currently installed lib... |
| `libs.sync` | Sync addon libraries based on libs.json config |
| `tools.status` | Check the status of development tools (luacheck, stylua, etc... |
| `docs.generate` | Generate CLI reference documentation from registered command... |
| `docs.stale` | Detect stale or broken documentation in a WoW addon |
| `api.download` | Download FrameXML from Townlong Yak and optionally refresh A... |
| `api.generate` | Generate APIDefs Lua files from api_database.json for Mechan... |
| `api.info` | Get detailed information about a specific WoW API |
| `api.list` | List APIs by namespace or category |
| `api.populate` | Parse Blizzard API documentation and generate api_database.j... |
| `api.queue` | Queue API tests for in-game execution. After running this, /... |
| `api.refresh` | Full refresh: parse Blizzard docs and regenerate all APIDefs... |
| `api.search` | Search WoW APIs by name pattern. Works offline (reads static... |
| `api.stats` | Get statistics about available WoW APIs |
| `assets.list` | List asset files in an addon's assets_source and assets fold... |
| `assets.sync` | Sync addon assets: convert PNG to TGA and copy other files f... |
| `env.status` | Get Mechanic environment configuration and status |
| `fencore-catalog` | Get full catalog of FenCore logic domains and functions |
| `fencore-info` | Get detailed info about a specific FenCore function |
| `fencore-search` | Search FenCore functions by name or description |
| `lua.queue` | Queue Lua code snippets for in-game execution. After running... |
| `lua.results` | Get results from the last Lua eval queue execution |
| `perf.baseline` | Record a performance baseline measurement for an addon |
| `perf.compare` | Compare current performance against baseline and detect regr... |
| `perf.list` | List all addons with performance baselines |
| `perf.report` | Generate a performance report showing history and trends |
| `research.query` | Search the web for addon development information using Gemin... |
| `sandbox.exec` | Execute Lua code in sandbox environment with WoW API stubs |
| `sandbox.generate` | Generate WoW API stubs from APIDefs database for sandbox tes... |
| `sandbox.status` | Get status of generated WoW API stubs |
| `sandbox.test` | Run Busted tests for an addon's Core layer with WoW API stub... |
| `system.pick_file` | Open a native file picker dialog to select a file |

---

## Core Commands

### `dashboard.metrics`

Get the latest reload and test metrics from the local history

**Parameters:** None

**Example:**

```bash
mech dashboard.metrics
```

---

### `server.shutdown`

Gracefully shut down the Mechanic Desktop server

**Parameters:** None

**Example:**

```bash
mech server.shutdown
```

---

### `sv.discover`

Automatically discover SavedVariables paths for all WoW flavors

**Parameters:** None

**Example:**

```bash
mech sv.discover
```

---

### `sv.parse`

Parse a WoW SavedVariables file and extract !Mechanic data

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `file_path` | `string` | Yes | Absolute path to the !Mechanic.lua file |

**Example:**

```bash
mech call sv.parse -i '{"file_path": "<file_path>"}'
```

---

## Development Commands

### `addon.complexity`

Detect code complexity issues in a WoW addon (nesting, long functions, magic numbers)

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to analyze |
| `path` | `string` | No (default: `None`) | Override path to addon folder |
| `categories` | `string` | No (default: `None`) | Specific categories to check (default: all) |
| `max_nesting` | `number` | No (default: `5`) | Maximum allowed nesting depth |
| `max_function_lines` | `number` | No (default: `100`) | Maximum lines per function |
| `max_file_lines` | `number` | No (default: `500`) | Maximum lines per file |

**Example:**

```bash
mech call addon.complexity -i '{"addon": "<addon>"}'
```

---

### `addon.create`

Create a new WoW addon from a template

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | `string` | Yes | Name for the new addon |
| `template` | `string` | No (default: `None`) | Template to use (defaults to _TemplateAddon) |
| `author` | `string` | No (default: `None`) | Author name for metadata |

**Example:**

```bash
mech call addon.create -i '{"name": "<name>"}'
```

---

### `addon.deadcode`

Detect dead code in a WoW addon (unused functions, orphaned files, etc.)

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to analyze |
| `path` | `string` | No (default: `None`) | Override path to addon folder |
| `categories` | `string` | No (default: `None`) | Specific categories to check (default: all) |
| `include_suspicious` | `boolean` | No (default: `True`) | Include lower-confidence findings |

**Example:**

```bash
mech call addon.deadcode -i '{"addon": "<addon>"}'
```

---

### `addon.deprecations`

Scan a WoW addon for deprecated API calls (100+ APIs, 11.0-12.0)

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to scan |
| `path` | `string` | No (default: `None`) | Override path to addon folder |
| `fix` | `boolean` | No (default: `False`) | Attempt to auto-fix deprecated calls |
| `category` | `string` | No (default: `None`) | Filter by category (e.g., spells, items, containers) |
| `min_severity` | `string` | No (default: `'warning'`) | Minimum severity: info, warning, or error |

**Example:**

```bash
mech call addon.deprecations -i '{"addon": "<addon>"}'
```

---

### `addon.format`

Run StyLua formatter on a WoW addon

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to format |
| `path` | `string` | No (default: `None`) | Override path to addon folder |
| `check` | `boolean` | No (default: `False`) | Only check formatting, don't modify files |

**Example:**

```bash
mech call addon.format -i '{"addon": "<addon>"}'
```

---

### `addon.lint`

Run Luacheck linter on a WoW addon

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to lint |
| `path` | `string` | No (default: `None`) | Override path to addon folder |
| `fix` | `boolean` | No (default: `False`) | Not applicable for Luacheck (read-only) |

**Example:**

```bash
mech call addon.lint -i '{"addon": "<addon>"}'
```

---

### `addon.output`

Get all addon output (errors, tests, console) for agent consumption. Use agent_mode=true for compressed output.

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `agent_mode` | `boolean` | No (default: `False`) | Enable smart compression for AI agents |

**Example:**

```bash
mech addon.output
```

---

### `addon.security`

Detect security issues in a WoW addon (combat lockdown, secret values, taint)

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to analyze |
| `path` | `string` | No (default: `None`) | Override path to addon folder |
| `categories` | `string` | No (default: `None`) | Specific categories to check (default: all) |
| `include_suspicious` | `boolean` | No (default: `True`) | Include lower-confidence findings |

**Example:**

```bash
mech call addon.security -i '{"addon": "<addon>"}'
```

---

### `addon.sync`

Create junction links from development addon to WoW client folders

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to sync |
| `flavors` | `string` | No (default: `None`) | WoW flavors to sync to (defaults to all) |

**Example:**

```bash
mech call addon.sync -i '{"addon": "<addon>"}'
```

---

### `addon.test`

Run Busted unit tests on a WoW addon

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to test |
| `path` | `string` | No (default: `None`) | Override path to addon folder |
| `coverage` | `boolean` | No (default: `False`) | Generate code coverage report |

**Example:**

```bash
mech call addon.test -i '{"addon": "<addon>"}'
```

---

### `addon.validate`

Validate a WoW addon's .toc file for common issues

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to operate on |
| `path` | `string` | No (default: `None`) | Override path to addon folder |

**Example:**

```bash
mech call addon.validate -i '{"addon": "<addon>"}'
```

---

## Release Commands

### `changelog.add`

Add an entry to the addon's CHANGELOG.md

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `version` | `string` | Yes | Version for the changelog entry |
| `message` | `string` | Yes | Change description |
| `category` | `string` | No (default: `'Changed'`) | Category: Added, Changed, Fixed, Removed |
| `path` | `string` | No (default: `None`) | Override path to addon folder |

**Example:**

```bash
mech call changelog.add -i '{"addon": "<addon>", "version": "<version>", "message": "<message>"}'
```

---

### `version.bump`

Update the version in a WoW addon's .toc file

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `version` | `string` | Yes | New version string (e.g., '1.2.0') |
| `path` | `string` | No (default: `None`) | Override path to addon folder |

**Example:**

```bash
mech call version.bump -i '{"addon": "<addon>", "version": "<version>"}'
```

---

## Localization Commands

### `atlas.scan`

Scan wow-ui-source for atlas icons and generate searchable index

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `source_path` | `string` | Yes | Path to wow-ui-source repository root |
| `output_path` | `string` | No (default: `None`) | Output path for atlas_index.json (defaults to data_dir) |

**Example:**

```bash
mech call atlas.scan -i '{"source_path": "<source_path>"}'
```

---

### `atlas.search`

Search Blizzard UI atlas icons by name pattern (supports wildcards)

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `query` | `string` | Yes | Search query for atlas icons (supports * wildcards) |
| `limit` | `number` | No (default: `20`) | Maximum results to return |
| `include_files` | `boolean` | No (default: `False`) | Include source file paths in results |

**Example:**

```bash
mech call atlas.search -i '{"query": "<query>"}'
```

---

### `locale.extract`

Extract potential localizable strings from addon code

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `path` | `string` | No (default: `None`) | Override path to addon folder |

**Example:**

```bash
mech call locale.extract -i '{"addon": "<addon>"}'
```

---

### `locale.validate`

Validate locale coverage against the enUS baseline

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to validate |
| `path` | `string` | No (default: `None`) | Override path to addon folder |

**Example:**

```bash
mech call locale.validate -i '{"addon": "<addon>"}'
```

---

## Environment Commands

### `libs.check`

Check addon library status against libs.json config

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to check |

**Example:**

```bash
mech call libs.check -i '{"addon": "<addon>"}'
```

---

### `libs.init`

Creates a libs.json config file from currently installed libraries. ⚠️ Will NOT overwrite existing config unless overwrite=true is set.

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `mode` | `string` | No (default: `'include'`) | Config mode: 'include' (whitelist) or 'exclude' (blocklist) |
| `overwrite` | `boolean` | No (default: `False`) | Overwrite existing libs.json |

**Example:**

```bash
mech call libs.init -i '{"addon": "<addon>"}'
```

---

### `libs.sync`

Sync addon libraries based on libs.json config

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to sync |
| `source` | `string` | No (default: `None`) | Source library path (defaults to ADDON_DEV Libs) |
| `dry_run` | `boolean` | No (default: `False`) | Preview changes without applying |
| `force` | `boolean` | No (default: `False`) | Force update existing libraries (replaces them) |
| `remove_extra` | `boolean` | No (default: `False`) | Remove libraries not in config |

**Example:**

```bash
mech call libs.sync -i '{"addon": "<addon>"}'
```

---

## Tools Commands

### `tools.status`

Check the status of development tools (luacheck, stylua, etc.)

**Parameters:** None

**Example:**

```bash
mech tools.status
```

---

## Documentation Commands

### `docs.generate`

Generate CLI reference documentation from registered commands

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `output_path` | `string` | No (default: `None`) | Output file path. Defaults to docs/cli-reference.md |
| `format` | `string` | No (default: `'markdown'`) | Output format: 'markdown' or 'json' |

**Example:**

```bash
mech docs.generate
```

---

### `docs.stale`

Detect stale or broken documentation in a WoW addon

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to analyze |
| `path` | `string` | No (default: `None`) | Override path to addon folder |
| `include_suspicious` | `boolean` | No (default: `True`) | Include lower-confidence findings |
| `commits_threshold` | `number` | No (default: `10`) | Flag docs not updated in this many commits |

**Example:**

```bash
mech call docs.stale -i '{"addon": "<addon>"}'
```

---

## Other Commands

### `api.download`

Download FrameXML from Townlong Yak and optionally refresh API definitions

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `build_id` | `string` | No (default: `None`) | Specific build ID to download (e.g., '64889'). If not provided, fetches latest. |
| `output_path` | `string` | No (default: `None`) | Where to extract the download. Defaults to _dev_/framexml/{version} |
| `refresh` | `boolean` | No (default: `True`) | Run api.refresh after download |

**Example:**

```bash
mech api.download
```

---

### `api.generate`

Generate APIDefs Lua files from api_database.json for Mechanic

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `database_path` | `string` | No (default: `None`) | Path to api_database.json (defaults to data_dir) |
| `output_path` | `string` | No (default: `None`) | Output path for APIDefs (defaults to Mechanic/UI/APIDefs) |

**Example:**

```bash
mech api.generate
```

---

### `api.info`

Get detailed information about a specific WoW API

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `api_name` | `string` | Yes | Full API name (e.g., C_Spell.GetSpellInfo) |

**Example:**

```bash
mech call api.info -i '{"api_name": "<api_name>"}'
```

---

### `api.list`

List APIs by namespace or category

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `namespace` | `string` | No (default: `None`) | Namespace to list (e.g., C_Spell) |
| `category` | `string` | No (default: `None`) | Category to list |
| `limit` | `number` | No (default: `50`) | Max results |

**Example:**

```bash
mech api.list
```

---

### `api.populate`

Parse Blizzard API documentation and generate api_database.json

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `source_path` | `string` | Yes | Path to wow-ui-source repository root |
| `output_path` | `string` | No (default: `None`) | Output path for api_database.json (defaults to data_dir) |

**Example:**

```bash
mech call api.populate -i '{"source_path": "<source_path>"}'
```

---

### `api.queue`

Queue API tests for in-game execution. After running this, /reload in WoW to execute tests.

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `apis` | `array` | Yes | List of API names to queue for testing |
| `params` | `string` | No (default: `None`) | Optional parameters per API: {'C_Spell.GetSpellInfo': {'spellID': 8690}} |

**Example:**

```bash
mech call api.queue -i '{"apis": "<apis>"}'
```

---

### `api.refresh`

Full refresh: parse Blizzard docs and regenerate all APIDefs in one step

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `source_path` | `string` | Yes | Path to wow-ui-source repository root or Townlong Yak extract |

**Example:**

```bash
mech call api.refresh -i '{"source_path": "<source_path>"}'
```

---

### `api.search`

Search WoW APIs by name pattern. Works offline (reads static definitions).

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `query` | `string` | Yes | Search pattern (supports * wildcards) |
| `category` | `string` | No (default: `None`) | Filter by category |
| `namespace` | `string` | No (default: `None`) | Filter by namespace |
| `limit` | `number` | No (default: `20`) | Max results to return |

**Example:**

```bash
mech call api.search -i '{"query": "<query>"}'
```

---

### `api.stats`

Get statistics about available WoW APIs

**Parameters:** None

**Example:**

```bash
mech api.stats
```

---

### `assets.list`

List asset files in an addon's assets_source and assets folders

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |

**Example:**

```bash
mech call assets.list -i '{"addon": "<addon>"}'
```

---

### `assets.sync`

Sync addon assets: convert PNG to TGA and copy other files from assets_source to assets

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to sync assets for |
| `verbose` | `boolean` | No (default: `False`) | Show detailed output |

**Example:**

```bash
mech call assets.sync -i '{"addon": "<addon>"}'
```

---

### `env.status`

Get Mechanic environment configuration and status

**Parameters:** None

**Example:**

```bash
mech env.status
```

---

### `fencore-catalog`

Get full catalog of FenCore logic domains and functions

**Parameters:** None

**Example:**

```bash
mech fencore-catalog
```

---

### `fencore-info`

Get detailed info about a specific FenCore function

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `domain` | `string` | Yes | Domain name (e.g., 'Math') |
| `function` | `string` | Yes | Function name (e.g., 'Clamp') |

**Example:**

```bash
mech call fencore-info -i '{"domain": "<domain>", "function": "<function>"}'
```

---

### `fencore-search`

Search FenCore functions by name or description

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `query` | `string` | Yes | Search query (partial match on name or description) |
| `limit` | `number` | No (default: `20`) | Maximum results to return |

**Example:**

```bash
mech call fencore-search -i '{"query": "<query>"}'
```

---

### `lua.queue`

Queue Lua code snippets for in-game execution. After running this, /reload in WoW to execute.

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `code` | `array` | Yes | List of Lua code snippets to execute. Each snippet should return a value. |
| `labels` | `string` | No (default: `None`) | Optional labels for each snippet (for easier identification in results) |

**Example:**

```bash
mech call lua.queue -i '{"code": "<code>"}'
```

---

### `lua.results`

Get results from the last Lua eval queue execution

**Parameters:** None

**Example:**

```bash
mech lua.results
```

---

### `perf.baseline`

Record a performance baseline measurement for an addon

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `version` | `string` | Yes | Version being measured |
| `memory_kb` | `number` | Yes | Memory usage in KB |
| `cpu_ms` | `number` | Yes | CPU time in milliseconds |

**Example:**

```bash
mech call perf.baseline -i '{"addon": "<addon>", "version": "<version>", "memory_kb": "<memory_kb>", "cpu_ms": "<cpu_ms>"}'
```

---

### `perf.compare`

Compare current performance against baseline and detect regressions

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `memory_kb` | `number` | Yes | Current memory usage in KB |
| `cpu_ms` | `number` | Yes | Current CPU time in milliseconds |
| `memory_threshold` | `number` | No (default: `1.5`) | Memory increase factor that triggers warning |
| `cpu_threshold` | `number` | No (default: `2.0`) | CPU increase factor that triggers warning |

**Example:**

```bash
mech call perf.compare -i '{"addon": "<addon>", "memory_kb": "<memory_kb>", "cpu_ms": "<cpu_ms>"}'
```

---

### `perf.list`

List all addons with performance baselines

**Parameters:** None

**Example:**

```bash
mech perf.list
```

---

### `perf.report`

Generate a performance report showing history and trends

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `limit` | `number` | No (default: `10`) | Number of recent measurements to show |

**Example:**

```bash
mech call perf.report -i '{"addon": "<addon>"}'
```

---

### `research.query`

Search the web for addon development information using Gemini with Google Search grounding

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `query` | `string` | Yes | Search query or question |
| `mode` | `string` | No (default: `'fast'`) | Search mode: 'fast' (Gemini Flash, ~15-30s) or 'thinking' (Gemini Pro, ~30-90s) |
| `json_output` | `boolean` | No (default: `False`) | Request structured JSON response |

**Example:**

```bash
mech call research.query -i '{"query": "<query>"}'
```

---

### `sandbox.exec`

Execute Lua code in sandbox environment with WoW API stubs

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `code` | `string` | Yes | Lua code to execute |
| `addon` | `string` | No (default: `None`) | Name of addon to load before execution (looks in _dev_ folder) |
| `load_stubs` | `boolean` | No (default: `True`) | Whether to load WoW API stubs |

**Example:**

```bash
mech call sandbox.exec -i '{"code": "<code>"}'
```

---

### `sandbox.generate`

Generate WoW API stubs from APIDefs database for sandbox testing

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `namespace` | `string` | No (default: `None`) | Specific namespace to generate (e.g., 'C_Spell'). If not provided, generates all. |
| `force` | `boolean` | No (default: `False`) | Regenerate even if stubs exist |

**Example:**

```bash
mech sandbox.generate
```

---

### `sandbox.status`

Get status of generated WoW API stubs

**Parameters:** None

**Example:**

```bash
mech sandbox.status
```

---

### `sandbox.test`

Run Busted tests for an addon's Core layer with WoW API stubs

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of addon to test (looks in _dev_ folder) |
| `filter` | `string` | No (default: `None`) | Filter pattern for test names |

**Example:**

```bash
mech call sandbox.test -i '{"addon": "<addon>"}'
```

---

### `system.pick_file`

Open a native file picker dialog to select a file

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `title` | `string` | No (default: `'Select File'`) | Title of the dialog window |
| `filter` | `string` | No (default: `'All Files (*.*)|*.*'`) | File filter (e.g., 'Text Files (*.txt)|*.txt') |

**Example:**

```bash
mech system.pick_file
```

---

## Usage Notes

### Global Flags

| Flag | Description |
|------|-------------|
| `--json` | Output raw JSON (for parsing) |
| `--quiet` | Suppress non-essential output |
| `--agent` | Smart compression for AI agents |

### Calling Commands

```bash
# Standard call with input
mech call <command> -i '{"param": "value"}'

# Shorthand for common commands
mech addon.output  # Direct command shortcut
```

---

<p align="center">
  <em>Generated by <code>mech call docs.generate</code></em>
</p>
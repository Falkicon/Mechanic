# CLI Reference

> Auto-generated from `mechanic-desktop` v0.2.1 on 2026-09-05

This document lists all available Mechanic CLI commands and their input parameters.
Examples are invocation templates: replace placeholders and supply valid values for your addon. Empty arrays/objects and numeric samples illustrate JSON types, not every command's validation rules. For complete schemas and mutation metadata, use `mech --json call commands.list`.

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
| `addon.sync` | Preflight and create addon junction links; supports dry_run |
| `addon.test` | Run Busted unit tests on a WoW addon |
| `addon.validate` | Validate a WoW addon's .toc file for common issues |
| `changelog.add` | Add an entry to the addon's CHANGELOG.md |
| `git.commit` | Stage all addon changes and create a git commit |
| `git.tag` | Create an annotated git tag for an addon release |
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
| `commands.list` | List command schemas and mutation metadata |
| `diagnostic.metrics` | Read bounded desktop overhead and optional explicitly select... |
| `diagnostic.targets` | List deterministic client/account/character/profile diagnost... |
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
| `release.all` | Preflight and run version bump, changelog, commit and tag; s... |
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
mech call dashboard.metrics '{}'
```

---

### `server.shutdown`

Gracefully shut down the Mechanic Desktop server

**Parameters:** None

**Example:**

```bash
mech call server.shutdown '{}'
```

---

### `sv.discover`

Automatically discover SavedVariables paths for all WoW flavors

**Parameters:** None

**Example:**

```bash
mech call sv.discover '{}'
```

---

### `sv.parse`

Parse a WoW SavedVariables file and extract !Mechanic data

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `target` | `object \| null` | No (default: `None`) |  |
| `file_path` | `string` | Yes | Absolute path to the !Mechanic.lua file |

**Example:**

```bash
mech call sv.parse '{"file_path": "<file_path>"}'
```

---

## Development Commands

### `addon.complexity`

Detect code complexity issues in a WoW addon (nesting, long functions, magic numbers)

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to analyze |
| `path` | `string \| null` | No (default: `None`) | Override path to addon folder |
| `categories` | `array \| null` | No (default: `None`) | Specific categories to check (default: all) |
| `max_nesting` | `integer` | No (default: `5`) | Maximum allowed nesting depth |
| `max_function_lines` | `integer` | No (default: `100`) | Maximum lines per function |
| `max_file_lines` | `integer` | No (default: `500`) | Maximum lines per file |

**Example:**

```bash
mech call addon.complexity '{"addon": "<addon>"}'
```

---

### `addon.create`

Create a new WoW addon from a template

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | `string` | Yes | Name for the new addon |
| `template` | `string \| null` | No (default: `None`) | Template to use (defaults to _TemplateAddon) |
| `author` | `string \| null` | No (default: `None`) | Author name for metadata |

**Example:**

```bash
mech call addon.create '{"name": "<name>"}'
```

---

### `addon.deadcode`

Detect dead code in a WoW addon (unused functions, orphaned files, etc.)

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to analyze |
| `path` | `string \| null` | No (default: `None`) | Override path to addon folder |
| `categories` | `array \| null` | No (default: `None`) | Specific categories to check (default: all) |
| `include_suspicious` | `boolean` | No (default: `True`) | Include lower-confidence findings |

**Example:**

```bash
mech call addon.deadcode '{"addon": "<addon>"}'
```

---

### `addon.deprecations`

Scan a WoW addon for deprecated API calls (100+ APIs, 11.0-12.0)

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to scan |
| `path` | `string \| null` | No (default: `None`) | Override path to addon folder |
| `fix` | `boolean` | No (default: `False`) | Attempt to auto-fix deprecated calls |
| `category` | `string \| null` | No (default: `None`) | Filter by category (e.g., spells, items, containers) |
| `min_severity` | `string` | No (default: `'warning'`) | Minimum severity: info, warning, or error |

**Example:**

```bash
mech call addon.deprecations '{"addon": "<addon>"}'
```

---

### `addon.format`

Run StyLua formatter on a WoW addon

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to format |
| `path` | `string \| null` | No (default: `None`) | Override path to addon folder |
| `check` | `boolean` | No (default: `False`) | Only check formatting, don't modify files |

**Example:**

```bash
mech call addon.format '{"addon": "<addon>"}'
```

---

### `addon.lint`

Run Luacheck linter on a WoW addon

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to lint |
| `path` | `string \| null` | No (default: `None`) | Override path to addon folder |
| `fix` | `boolean` | No (default: `False`) | Not applicable for Luacheck (read-only) |

**Example:**

```bash
mech call addon.lint '{"addon": "<addon>"}'
```

---

### `addon.output`

Get all addon output (errors, tests, console) for agent consumption. Use agent_mode=true for compressed output.

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `target` | `object \| null` | No (default: `None`) |  |
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
| `path` | `string \| null` | No (default: `None`) | Override path to addon folder |
| `categories` | `array \| null` | No (default: `None`) | Specific categories to check (default: all) |
| `include_suspicious` | `boolean` | No (default: `True`) | Include lower-confidence findings |

**Example:**

```bash
mech call addon.security '{"addon": "<addon>"}'
```

---

### `addon.sync`

Preflight and create addon junction links; supports dry_run

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to sync |
| `flavors` | `array \| null` | No (default: `None`) | WoW flavors to sync to (defaults to all) |
| `dry_run` | `boolean` | No (default: `False`) | Validate and preview junctions without creating directories or links |

**Example:**

```bash
mech call addon.sync '{"addon": "<addon>"}'
```

---

### `addon.test`

Run Busted unit tests on a WoW addon

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to test |
| `path` | `string \| null` | No (default: `None`) | Override path to addon folder |
| `coverage` | `boolean` | No (default: `False`) | Generate code coverage report |

**Example:**

```bash
mech call addon.test '{"addon": "<addon>"}'
```

---

### `addon.validate`

Validate a WoW addon's .toc file for common issues

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to operate on |
| `path` | `string \| null` | No (default: `None`) | Override path to addon folder |

**Example:**

```bash
mech call addon.validate '{"addon": "<addon>"}'
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
| `path` | `string \| null` | No (default: `None`) | Override path to addon folder |

**Example:**

```bash
mech call changelog.add '{"addon": "<addon>","version": "<version>","message": "<message>"}'
```

---

### `git.commit`

Stage all addon changes and create a git commit

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `message` | `string` | Yes | Commit message |
| `path` | `string \| null` | No (default: `None`) | Override path to addon folder |

**Example:**

```bash
mech call git.commit '{"addon": "<addon>","message": "<message>"}'
```

---

### `git.tag`

Create an annotated git tag for an addon release

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `version` | `string` | Yes | Version to tag (e.g., '1.2.0') |
| `message` | `string \| null` | No (default: `None`) | Tag message (defaults to version) |
| `path` | `string \| null` | No (default: `None`) | Override path to addon folder |

**Example:**

```bash
mech call git.tag '{"addon": "<addon>","version": "<version>"}'
```

---

### `version.bump`

Update the version in a WoW addon's .toc file

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `version` | `string` | Yes | New version string (e.g., '1.2.0') |
| `path` | `string \| null` | No (default: `None`) | Override path to addon folder |

**Example:**

```bash
mech call version.bump '{"addon": "<addon>","version": "<version>"}'
```

---

## Localization Commands

### `atlas.scan`

Scan wow-ui-source for atlas icons and generate searchable index

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `source_path` | `string` | Yes | Path to wow-ui-source repository root |
| `output_path` | `string \| null` | No (default: `None`) | Output path for atlas_index.json (defaults to data_dir) |

**Example:**

```bash
mech call atlas.scan '{"source_path": "<source_path>"}'
```

---

### `atlas.search`

Search Blizzard UI atlas icons by name pattern (supports wildcards)

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `query` | `string` | Yes | Search query for atlas icons (supports * wildcards) |
| `limit` | `integer` | No (default: `20`) | Maximum results to return |
| `include_files` | `boolean` | No (default: `False`) | Include source file paths in results |

**Example:**

```bash
mech call atlas.search '{"query": "<query>"}'
```

---

### `locale.extract`

Extract potential localizable strings from addon code

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `path` | `string \| null` | No (default: `None`) | Override path to addon folder |

**Example:**

```bash
mech call locale.extract '{"addon": "<addon>"}'
```

---

### `locale.validate`

Validate locale coverage against the enUS baseline

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to validate |
| `path` | `string \| null` | No (default: `None`) | Override path to addon folder |

**Example:**

```bash
mech call locale.validate '{"addon": "<addon>"}'
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
mech call libs.check '{"addon": "<addon>"}'
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
mech call libs.init '{"addon": "<addon>"}'
```

---

### `libs.sync`

Sync addon libraries based on libs.json config

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to sync |
| `source` | `string \| null` | No (default: `None`) | Source library path (defaults to ADDON_DEV Libs) |
| `dry_run` | `boolean` | No (default: `False`) | Preview changes without applying |
| `force` | `boolean` | No (default: `False`) | Force update existing libraries (replaces them) |
| `remove_extra` | `boolean` | No (default: `False`) | Remove libraries not in config |

**Example:**

```bash
mech call libs.sync '{"addon": "<addon>"}'
```

---

## Tools Commands

### `tools.status`

Check the status of development tools (luacheck, stylua, etc.)

**Parameters:** None

**Example:**

```bash
mech call tools.status '{}'
```

---

## Documentation Commands

### `docs.generate`

Generate CLI reference documentation from registered commands

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `output_path` | `string \| null` | No (default: `None`) | Output file path. Defaults to docs/cli-reference.md |
| `format` | `string` | No (default: `'markdown'`) | Output format: 'markdown' or 'json' |

**Example:**

```bash
mech call docs.generate '{}'
```

---

### `docs.stale`

Detect stale or broken documentation in a WoW addon

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to analyze |
| `path` | `string \| null` | No (default: `None`) | Override path to addon folder |
| `include_suspicious` | `boolean` | No (default: `True`) | Include lower-confidence findings |
| `commits_threshold` | `integer` | No (default: `10`) | Flag docs not updated in this many commits |

**Example:**

```bash
mech call docs.stale '{"addon": "<addon>"}'
```

---

## Other Commands

### `api.download`

Download FrameXML from Townlong Yak and optionally refresh API definitions

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `build_id` | `string \| null` | No (default: `None`) | Specific build ID to download (e.g., '64889'). If not provided, fetches latest. |
| `output_path` | `string \| null` | No (default: `None`) | Where to extract the download. Defaults to _dev_/framexml/{version} |
| `refresh` | `boolean` | No (default: `True`) | Run api.refresh after download |

**Example:**

```bash
mech call api.download '{}'
```

---

### `api.generate`

Generate APIDefs Lua files from api_database.json for Mechanic

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `database_path` | `string \| null` | No (default: `None`) | Path to api_database.json (defaults to data_dir) |
| `output_path` | `string \| null` | No (default: `None`) | Output path for APIDefs (defaults to Mechanic/UI/APIDefs) |

**Example:**

```bash
mech call api.generate '{}'
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
mech call api.info '{"api_name": "<api_name>"}'
```

---

### `api.list`

List APIs by namespace or category

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `namespace` | `string \| null` | No (default: `None`) | Namespace to list (e.g., C_Spell) |
| `category` | `string \| null` | No (default: `None`) | Category to list |
| `limit` | `integer` | No (default: `50`) | Max results |

**Example:**

```bash
mech call api.list '{}'
```

---

### `api.populate`

Parse Blizzard API documentation and generate api_database.json

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `source_path` | `string` | Yes | Path to wow-ui-source repository root |
| `output_path` | `string \| null` | No (default: `None`) | Output path for api_database.json (defaults to data_dir) |

**Example:**

```bash
mech call api.populate '{"source_path": "<source_path>"}'
```

---

### `api.queue`

Queue API tests for in-game execution. After running this, /reload in WoW to execute tests.

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `target` | `object \| null` | No (default: `None`) |  |
| `apis` | `array` | Yes | List of API names to queue for testing |
| `params` | `object \| null` | No (default: `None`) | Optional parameters per API: {'C_Spell.GetSpellInfo': {'spellID': 8690}} |

**Example:**

```bash
mech call api.queue '{"apis": []}'
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
mech call api.refresh '{"source_path": "<source_path>"}'
```

---

### `api.search`

Search WoW APIs by name pattern. Works offline (reads static definitions).

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `query` | `string` | Yes | Search pattern (supports * wildcards) |
| `category` | `string \| null` | No (default: `None`) | Filter by category |
| `namespace` | `string \| null` | No (default: `None`) | Filter by namespace |
| `limit` | `integer` | No (default: `20`) | Max results to return |

**Example:**

```bash
mech call api.search '{"query": "<query>"}'
```

---

### `api.stats`

Get statistics about available WoW APIs

**Parameters:** None

**Example:**

```bash
mech call api.stats '{}'
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
mech call assets.list '{"addon": "<addon>"}'
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
mech call assets.sync '{"addon": "<addon>"}'
```

---

### `commands.list`

List command schemas and mutation metadata

**Parameters:** None

**Example:**

```bash
mech call commands.list '{}'
```

---

### `diagnostic.metrics`

Read bounded desktop overhead and optional explicitly selected addon snapshot

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `target` | `object \| null` | No (default: `None`) | Explicit target to include its last saved addon overhead snapshot |

**Example:**

```bash
mech call diagnostic.metrics '{}'
```

---

### `diagnostic.targets`

List deterministic client/account/character/profile diagnostic targets

**Parameters:** None

**Example:**

```bash
mech call diagnostic.targets '{}'
```

---

### `env.status`

Get Mechanic environment configuration and status

**Parameters:** None

**Example:**

```bash
mech call env.status '{}'
```

---

### `fencore-catalog`

Get full catalog of FenCore logic domains and functions

**Parameters:** None

**Example:**

```bash
mech call fencore-catalog '{}'
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
mech call fencore-info '{"domain": "<domain>","function": "<function>"}'
```

---

### `fencore-search`

Search FenCore functions by name or description

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `query` | `string` | Yes | Search query (partial match on name or description) |
| `limit` | `integer` | No (default: `20`) | Maximum results to return |

**Example:**

```bash
mech call fencore-search '{"query": "<query>"}'
```

---

### `lua.queue`

Queue Lua code snippets for in-game execution. After running this, /reload in WoW to execute.

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `target` | `object \| null` | No (default: `None`) |  |
| `code` | `array` | Yes | List of Lua code snippets to execute. Each snippet should return a value. |
| `labels` | `array \| null` | No (default: `None`) | Optional labels for each snippet (for easier identification in results) |

**Example:**

```bash
mech call lua.queue '{"code": []}'
```

---

### `lua.results`

Get results from the last Lua eval queue execution

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `target` | `object \| null` | No (default: `None`) |  |

**Example:**

```bash
mech call lua.results '{}'
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
mech call perf.baseline '{"addon": "<addon>","version": "<version>","memory_kb": 0,"cpu_ms": 0}'
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
mech call perf.compare '{"addon": "<addon>","memory_kb": 0,"cpu_ms": 0}'
```

---

### `perf.list`

List all addons with performance baselines

**Parameters:** None

**Example:**

```bash
mech call perf.list '{}'
```

---

### `perf.report`

Generate a performance report showing history and trends

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `limit` | `integer` | No (default: `10`) | Number of recent measurements to show |

**Example:**

```bash
mech call perf.report '{"addon": "<addon>"}'
```

---

### `release.all`

Preflight and run version bump, changelog, commit and tag; supports dry_run

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `version` | `string` | Yes | New version string |
| `message` | `string` | Yes | Changelog entry and release description |
| `category` | `string` | No (default: `'Changed'`) | Changelog category |
| `path` | `string \| null` | No (default: `None`) | Override path |
| `dry_run` | `boolean` | No (default: `False`) | Validate and preview without changing files, index, commits or tags |

**Example:**

```bash
mech call release.all '{"addon": "<addon>","version": "<version>","message": "<message>"}'
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
mech call research.query '{"query": "<query>"}'
```

---

### `sandbox.exec`

Execute Lua code in sandbox environment with WoW API stubs

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `code` | `string` | Yes | Lua code to execute |
| `addon` | `string \| null` | No (default: `None`) | Name of addon to load before execution (looks in _dev_ folder) |
| `load_stubs` | `boolean` | No (default: `True`) | Whether to load WoW API stubs |

**Example:**

```bash
mech call sandbox.exec '{"code": "<code>"}'
```

---

### `sandbox.generate`

Generate WoW API stubs from APIDefs database for sandbox testing

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `namespace` | `string \| null` | No (default: `None`) | Specific namespace to generate (e.g., 'C_Spell'). If not provided, generates all. |
| `force` | `boolean` | No (default: `False`) | Regenerate even if stubs exist |

**Example:**

```bash
mech call sandbox.generate '{}'
```

---

### `sandbox.status`

Get status of generated WoW API stubs

**Parameters:** None

**Example:**

```bash
mech call sandbox.status '{}'
```

---

### `sandbox.test`

Run Busted tests for an addon's Core layer with WoW API stubs

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of addon to test (looks in _dev_ folder) |
| `filter` | `string \| null` | No (default: `None`) | Filter pattern for test names |

**Example:**

```bash
mech call sandbox.test '{"addon": "<addon>"}'
```

---

### `system.pick_file`

Open a native file picker dialog to select a file

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `title` | `string` | No (default: `'Select File'`) | Title of the dialog window |
| `filter` | `string` | No (default: `'All Files (*.*)\|*.*'`) | File filter (e.g., 'Text Files (*.txt)\|*.txt') |

**Example:**

```bash
mech call system.pick_file '{}'
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
# Standard call with JSON input
mech call <command> '{"param": "value"}'

# Standard call without input
mech call <command> '{}'

# The one dedicated shortcut
mech addon.output  # Direct command shortcut
```

---

<p align="center">
  <em>Generated by <code>mech call docs.generate</code></em>
</p>
# Mechanic command reference

<!-- GENERATED FILE. Do not edit by hand.
     Regenerate: python .claude/gen_command_reference.py   (then python .claude/sync_ide.py)
     Source: the command registry (the data `commands.list` returns).
     Guard: desktop/tests/test_agent_docs.py fails when this file is stale. -->

60 registered commands: 33 read-only, 27 mutating. The registry uses dotted
names (`addon.output`); the MCP adapter exposes the same commands with dashes
(`addon-output`). `fencore-*` commands are registered with dashes already. Protocol for
`target`, reload and previews: see [using-mechanic](../SKILL.md).

`Mutating` is the audited flag from `commands/catalog.py`: it covers persistent writes,
launched processes or UI, and code execution. Commands with a preview (`dry_run`) stay
mutating. Call `commands.list` for the full machine-readable JSON schemas.

`target` is the optional diagnostic target object `{client, account, character,
profile}` (all strings or null); take its values from `diagnostic.targets`.

## Summary

| Command | Mutating | Required inputs | Description |
|---|---|---|---|
| `addon.complexity` | no | `addon` | Detect code complexity issues in a WoW addon (nesting, long functions, magic numbers) |
| `addon.create` | yes | `name` | Create a new WoW addon from a template |
| `addon.deadcode` | no | `addon` | Detect dead code in a WoW addon (unused functions, orphaned files, etc.) |
| `addon.deprecations` | no | `addon` | Scan a WoW addon's Lua files for deprecated API calls |
| `addon.format` | yes | `addon` | Run StyLua formatter on a WoW addon |
| `addon.lint` | no | `addon` | Run Luacheck linter on a WoW addon |
| `addon.output` | no | none | Get all addon output (errors, tests, console) for agent consumption. Use agent_mode=true for compressed output. |
| `addon.security` | no | `addon` | Detect security issues in a WoW addon (combat lockdown, secret values, taint) |
| `addon.sync` | yes | `addon` | Preflight and create addon junction links; supports dry_run |
| `addon.test` | yes | `addon` | Run Busted unit tests on a WoW addon |
| `addon.validate` | no | `addon` | Validate a WoW addon's .toc file for common issues |
| `api.download` | yes | none | Download FrameXML from Townlong Yak and optionally refresh API definitions |
| `api.generate` | yes | none | Generate APIDefs Lua files from api_database.json for Mechanic (defaults to the repository's Mechanic/UI/APIDefs) |
| `api.info` | no | `api_name` | Get detailed information about a specific WoW API |
| `api.list` | no | none | List APIs by namespace or category |
| `api.populate` | yes | `source_path` | Parse Blizzard API documentation and generate api_database.json |
| `api.queue` | yes | `apis` | Queue API tests for in-game execution. After running this, /reload in WoW to execute tests. |
| `api.refresh` | yes | `source_path` | Full refresh: parse Blizzard docs and regenerate all APIDefs in one step |
| `api.search` | no | `query` | Search WoW APIs by name pattern. Works offline (reads static definitions). |
| `api.stats` | no | none | Get statistics about available WoW APIs |
| `assets.list` | no | `addon` | List asset files in an addon's assets_source and assets folders |
| `assets.sync` | yes | `addon` | Sync addon assets: convert PNG to TGA and copy other files from assets_source to assets; removes only files a previous sync generated; supports dry_run |
| `atlas.scan` | yes | `source_path` | Scan wow-ui-source for atlas icons and generate searchable index |
| `atlas.search` | no | `query` | Search Blizzard UI atlas icons by name pattern (supports wildcards) |
| `changelog.add` | yes | `addon`, `version`, `message` | Add an entry to the addon's CHANGELOG.md |
| `commands.list` | no | none | List command schemas and mutation metadata |
| `dashboard.metrics` | no | none | Get the latest reload and test metrics from the local history |
| `diagnostic.metrics` | no | none | Read bounded desktop overhead and optional explicitly selected addon snapshot |
| `diagnostic.targets` | no | none | List deterministic client/account/character/profile diagnostic targets |
| `docs.generate` | yes | none | Generate CLI reference documentation from registered commands |
| `docs.stale` | no | `addon` | Detect stale or broken documentation in a WoW addon |
| `env.status` | no | none | Get Mechanic environment configuration and status |
| `fencore-catalog` | no | none | Get full catalog of FenCore logic domains and functions |
| `fencore-info` | no | `domain`, `function` | Get detailed info about a specific FenCore function |
| `fencore-search` | no | `query` | Search FenCore functions by name or description |
| `git.commit` | yes | `addon`, `message` | Stage all addon changes and create a git commit limited to the addon folder |
| `git.tag` | yes | `addon`, `version` | Create an annotated git tag for an addon release |
| `libs.check` | no | `addon` | Check addon library status against libs.json config |
| `libs.init` | yes | `addon` | Creates a libs.json config file from currently installed libraries. ⚠️ Will NOT overwrite existing config unless overwrite=true is set. |
| `libs.sync` | yes | `addon` | Sync addon libraries based on libs.json config |
| `locale.extract` | no | `addon` | Extract potential localizable strings from addon code |
| `locale.validate` | no | `addon` | Validate locale coverage against the enUS baseline |
| `lua.queue` | yes | `code` | Queue Lua code snippets for in-game execution. After running this, /reload in WoW to execute. |
| `lua.results` | no | none | Get results from the last Lua eval queue execution |
| `perf.baseline` | yes | `addon`, `version`, `memory_kb`, `cpu_ms` | Record a performance baseline measurement for an addon |
| `perf.compare` | no | `addon`, `memory_kb`, `cpu_ms` | Compare current performance against baseline and detect regressions |
| `perf.list` | no | none | List all addons with performance baselines |
| `perf.report` | no | `addon` | Generate a performance report showing history and trends |
| `release.all` | yes | `addon`, `version`, `message` | Preflight and run version bump, changelog, commit and tag; supports dry_run |
| `research.query` | yes | `query` | Search the web for addon development information using Gemini with Google Search grounding |
| `sandbox.exec` | yes | `code` | Execute Lua code in a restricted sandbox with WoW API stubs. User code sees only whitelisted globals (no os, io, package, debug, require, dofile, loadfile, string.dump or bytecode loading); runs for at most 30s and prints at most 256 KB. |
| `sandbox.generate` | yes | none | Generate WoW API stubs from APIDefs for sandbox testing. A namespace is regenerated in place; existing stubs are kept unless force is set or the APIDefs are newer. |
| `sandbox.status` | no | none | Get status of generated WoW API stubs |
| `sandbox.test` | yes | `addon` | Run an addon's *_spec.lua tests (Core/ and Tests/) in the restricted sandbox with WoW API stubs and the bundled busted-style framework. filter limits tests by name; failures are listed first. |
| `server.shutdown` | yes | none | Gracefully shut down the Mechanic Desktop server |
| `sv.discover` | no | none | Automatically discover SavedVariables paths for all WoW flavors |
| `sv.parse` | no | `file_path` | Parse a WoW SavedVariables file and extract !Mechanic data |
| `system.pick_file` | yes | none | Open a native file picker dialog to select a file (Windows only) |
| `tools.status` | no | none | Check the status of development tools (luacheck, stylua, etc.) |
| `version.bump` | yes | `addon`, `version` | Update the version in a WoW addon's .toc file |

## Commands by group

### addon

#### `addon.complexity` (read-only)

Detect code complexity issues in a WoW addon (nesting, long functions, magic numbers)

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon to analyze |
| `path` | string | no | null | Override path to addon folder |
| `categories` | array of string | no | null | Specific categories to check (default: all) |
| `max_nesting` | integer | no | `5` | Maximum allowed nesting depth |
| `max_function_lines` | integer | no | `100` | Maximum lines per function |
| `max_file_lines` | integer | no | `500` | Maximum lines per file |
| `limit` | integer | no | `200` | Maximum issues returned, most severe first (counts cover all issues) |

Output fields: `addon`, `files_analyzed`, `issues`, `summary`, `analysis_time_ms`, `truncated`, `total_issues`, `read_errors`

#### `addon.create` (mutating)

Create a new WoW addon from a template

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `name` | string | yes |  | Name for the new addon |
| `template` | string | no | null | Template to use (defaults to _TemplateAddon) |
| `author` | string | no | null | Author name for metadata |

Output fields: `name`, `path`, `files_created`, `next_steps`

#### `addon.deadcode` (read-only)

Detect dead code in a WoW addon (unused functions, orphaned files, etc.)

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon to analyze |
| `path` | string | no | null | Override path to addon folder |
| `categories` | array of string | no | null | Specific categories to check (default: all) |
| `include_suspicious` | boolean | no | `true` | Include lower-confidence findings |
| `limit` | integer | no | `200` | Maximum issues returned, most severe first (counts cover all issues) |

Output fields: `addon`, `files_analyzed`, `issues`, `summary`, `analysis_time_ms`, `truncated`, `total_issues`, `read_errors`

#### `addon.deprecations` (read-only)

Scan a WoW addon's Lua files for deprecated API calls

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon to scan |
| `path` | string | no | null | Override path to addon folder |
| `category` | string | no | null | Filter by category (e.g., spells, items, containers) |
| `min_severity` | string | no | `"warning"` | Minimum severity: info, warning, or error |

Output fields: `addon`, `clean`, `issue_count`, `issues`, `by_category`, `by_severity`, `database_version`

#### `addon.format` (mutating)

Run StyLua formatter on a WoW addon

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon to format |
| `path` | string | no | null | Override path to addon folder |
| `check` | boolean | no | `false` | Only check formatting, don't modify files |

Output fields: `addon`, `formatted`, `files_checked`, `files_changed`, `unformatted_files`

#### `addon.lint` (read-only)

Run Luacheck linter on a WoW addon

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon to lint |
| `path` | string | no | null | Override path to addon folder |

Output fields: `addon`, `passed`, `error_count`, `warning_count`, `issues`

#### `addon.output` (read-only)

Get all addon output (errors, tests, console) for agent consumption. Use agent_mode=true for compressed output.

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `target` | `target` object | no | null |  |
| `agent_mode` | boolean | no | `false` | Enable smart compression for AI agents |

Output fields: `target`, `output`, `error_count`, `test_count`, `console_count`, `api_test_count`, `lua_eval_count`, `timestamp`, `errors`, `tests`, `console`, `libraries`, `perf`, `api_tests`, `lua_eval`

#### `addon.security` (read-only)

Detect security issues in a WoW addon (combat lockdown, secret values, taint)

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon to analyze |
| `path` | string | no | null | Override path to addon folder |
| `categories` | array of string | no | null | Specific categories to check (default: all) |
| `include_suspicious` | boolean | no | `true` | Include lower-confidence findings |
| `limit` | integer | no | `200` | Maximum issues returned, most severe first (counts cover all issues) |

Output fields: `addon`, `files_analyzed`, `issues`, `summary`, `analysis_time_ms`, `truncated`, `total_issues`, `read_errors`

#### `addon.sync` (mutating)

Preflight and create addon junction links; supports dry_run

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon to sync |
| `flavors` | array of string | no | null | WoW flavors to sync to (defaults to all) |
| `dry_run` | boolean | no | `false` | Validate and preview junctions without creating directories or links |

Output fields: `addon`, `dry_run`, `links`, `success_count`, `error_count`, `steps_completed`, `recovery`

#### `addon.test` (mutating)

Run Busted unit tests on a WoW addon

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon to test |
| `path` | string | no | null | Override path to addon folder |
| `coverage` | boolean | no | `false` | Generate code coverage report |

Output fields: `addon`, `passed`, `total`, `passed_count`, `failed_count`, `tests`, `error`

#### `addon.validate` (read-only)

Validate a WoW addon's .toc file for common issues

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon to operate on |
| `path` | string | no | null | Override path to addon folder |

Output fields: `addon`, `valid`, `interface_version`, `version`, `file_count`, `errors`, `warnings`, `info`

### api

#### `api.download` (mutating)

Download FrameXML from Townlong Yak and optionally refresh API definitions

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `build_id` | string | no | null | Build ID to download (digits only, e.g., '64889'). Required. |
| `output_path` | string | no | null | Where to extract the download. Defaults to <data_dir>/framexml/{version} |
| `refresh` | boolean | no | `true` | Run api.refresh after download |

Output fields: `build_id`, `version`, `output_path`, `file_count`, `api_count`

#### `api.generate` (mutating)

Generate APIDefs Lua files from api_database.json for Mechanic (defaults to the repository's Mechanic/UI/APIDefs)

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `database_path` | string | no | null | Path to api_database.json (defaults to data_dir) |
| `output_path` | string | no | null | Output folder for APIDefs (defaults to the repository's Mechanic/UI/APIDefs). Must be named 'APIDefs' unless allow_any_output_dir is set. |
| `allow_any_output_dir` | boolean | no | `false` | Allow an output folder that is not named 'APIDefs' |

Output fields: `api_count`, `namespace_count`, `output_dir`, `files`

#### `api.info` (read-only)

Get detailed information about a specific WoW API

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `api_name` | string | yes |  | Full API name (e.g., C_Spell.GetSpellInfo) |

Output fields: `api`, `found`

#### `api.list` (read-only)

List APIs by namespace or category

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `namespace` | string | no | null | Namespace to list (e.g., C_Spell) |
| `category` | string | no | null | Category to list |
| `limit` | integer | no | `50` | Max results |

Output fields: `apis`, `total`, `filter`

#### `api.populate` (mutating)

Parse Blizzard API documentation and generate api_database.json

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `source_path` | string | yes |  | Path to wow-ui-source repository root |
| `output_path` | string | no | null | Output path for api_database.json (defaults to data_dir) |

Output fields: `api_count`, `category_counts`, `output_file`, `wow_version`, `skipped_files`

#### `api.queue` (mutating)

Queue API tests for in-game execution. After running this, /reload in WoW to execute tests.

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `target` | `target` object | no | null |  |
| `apis` | array of string | yes |  | List of API names to queue for testing |
| `params` | object of object | no | null | Optional parameters per API: {'C_Spell.GetSpellInfo': {'spellID': 8690}} |

Output fields: `target`, `queued`, `queue_file`, `message`

#### `api.refresh` (mutating)

Full refresh: parse Blizzard docs and regenerate all APIDefs in one step

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `source_path` | string | yes |  | Path to wow-ui-source repository root or Townlong Yak extract |
| `output_path` | string | no | null | APIDefs output folder (see api.generate) |
| `database_path` | string | no | null | api_database.json location (defaults to data_dir) |
| `allow_any_output_dir` | boolean | no | `false` | Allow an output folder that is not named 'APIDefs' |

Output fields: `api_count`, `namespace_count`, `database_file`, `apidefs_dir`

#### `api.search` (read-only)

Search WoW APIs by name pattern. Works offline (reads static definitions).

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `query` | string | yes |  | Search pattern (supports * wildcards) |
| `category` | string | no | null | Filter by category |
| `namespace` | string | no | null | Filter by namespace |
| `limit` | integer | no | `20` | Max results to return |

Output fields: `apis`, `total`, `query`

#### `api.stats` (read-only)

Get statistics about available WoW APIs

Input: none.

Output fields: `total`, `by_category`, `by_namespace`, `with_secrets`, `protected`

### assets

#### `assets.list` (read-only)

List asset files in an addon's assets_source and assets folders

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon |

Output fields: `addon`, `source_count`, `target_count`, `source_files`, `target_files`

#### `assets.sync` (mutating)

Sync addon assets: convert PNG to TGA and copy other files from assets_source to assets; removes only files a previous sync generated; supports dry_run

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon to sync assets for |
| `dry_run` | boolean | no | `false` | Report what would be converted, copied and removed without changing files |

Output fields: `addon`, `dry_run`, `converted`, `copied`, `removed`, `removed_files`, `warnings`

### atlas

#### `atlas.scan` (mutating)

Scan wow-ui-source for atlas icons and generate searchable index

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `source_path` | string | yes |  | Path to wow-ui-source repository root |
| `output_path` | string | no | null | Output path for atlas_index.json (defaults to data_dir) |

Output fields: `atlas_count`, `xml_count`, `lua_count`, `output_file`

#### `atlas.search` (read-only)

Search Blizzard UI atlas icons by name pattern (supports wildcards)

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `query` | string | yes |  | Search query for atlas icons (supports * wildcards) |
| `limit` | integer | no | `20` | Maximum results to return |
| `include_files` | boolean | no | `false` | Include source file paths in results |

Output fields: `query`, `count`, `icons`, `truncated`

### changelog

#### `changelog.add` (mutating)

Add an entry to the addon's CHANGELOG.md

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon |
| `version` | string | yes |  | Version for the changelog entry |
| `message` | string | yes |  | Change description |
| `category` | string | no | `"Changed"` | Category: Added, Changed, Deprecated, Removed, Fixed, Security |
| `path` | string | no | null | Override path to addon folder |

Output fields: `addon`, `version`, `changelog_file`, `entry_added`

### commands

#### `commands.list` (read-only)

List command schemas and mutation metadata

Input: none.

Output fields: `commands`

### dashboard

#### `dashboard.metrics` (read-only)

Get the latest reload and test metrics from the local history

Input: none.

Output fields: (none)

### diagnostic

#### `diagnostic.metrics` (read-only)

Read bounded desktop overhead and optional explicitly selected addon snapshot

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `target` | `target` object | no | null | Explicit target to include its last saved addon overhead snapshot |

Output fields: `desktop`, `runtime`, `history`, `target`, `addon`, `addon_status`

#### `diagnostic.targets` (read-only)

List deterministic client/account/character/profile diagnostic targets

Input: none.

Output fields: `targets`

### docs

#### `docs.generate` (mutating)

Generate CLI reference documentation from registered commands

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `output_path` | string | no | null | Output file path. Defaults to docs/cli-reference.md |
| `format` | string | no | `"markdown"` | Output format: 'markdown' or 'json' |

Output fields: `path`, `command_count`, `categories`

#### `docs.stale` (read-only)

Detect stale or broken documentation in a WoW addon

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon to analyze |
| `path` | string | no | null | Override path to addon folder |
| `include_suspicious` | boolean | no | `true` | Include lower-confidence findings |
| `commits_threshold` | integer | no | `10` | Flag docs not updated in this many code commits |
| `limit` | integer | no | `200` | Maximum issues returned, most severe first (counts cover all issues) |

Output fields: `addon`, `docs_analyzed`, `issues`, `summary`, `analysis_time_ms`, `git_available`, `truncated`, `total_issues`, `read_errors`

### env

#### `env.status` (read-only)

Get Mechanic environment configuration and status

Input: none.

Output fields: `wow_root`, `dev_path`, `data_dir`, `flavors`

### fencore

#### `fencore-catalog` (read-only)

Get full catalog of FenCore logic domains and functions

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `target` | `target` object | no | null |  |

Output fields: `version`, `domains`, `total_functions`

#### `fencore-info` (read-only)

Get detailed info about a specific FenCore function

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `target` | `target` object | no | null |  |
| `domain` | string | yes |  | Domain name (e.g., 'Math') |
| `function` | string | yes |  | Function name (e.g., 'Clamp') |

Output fields: `domain`, `name`, `full_name`, `description`, `params`, `returns`, `example`

#### `fencore-search` (read-only)

Search FenCore functions by name or description

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `target` | `target` object | no | null |  |
| `query` | string | yes |  | Search query (partial match on name or description) |
| `limit` | integer | no | `20` | Maximum results to return |

Output fields: `query`, `results`, `total`

### git

#### `git.commit` (mutating)

Stage all addon changes and create a git commit limited to the addon folder

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon |
| `message` | string | yes |  | Commit message |
| `path` | string | no | null | Override path to addon folder |

Output fields: `addon`, `commit_hash`, `message`, `files_staged`

#### `git.tag` (mutating)

Create an annotated git tag for an addon release

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon |
| `version` | string | yes |  | Version to tag (e.g., '1.2.0') |
| `message` | string | no | null | Tag message (defaults to version) |
| `path` | string | no | null | Override path to addon folder |

Output fields: `addon`, `tag`, `created`

### libs

#### `libs.check` (read-only)

Check addon library status against libs.json config

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon to check |

Output fields: `addon`, `has_config`, `config_mode`, `libraries`, `issues`

#### `libs.init` (mutating)

Creates a libs.json config file from currently installed libraries. ⚠️ Will NOT overwrite existing config unless overwrite=true is set.

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon |
| `mode` | string | no | `"include"` | Config mode: 'include' (whitelist) or 'exclude' (blocklist) |
| `overwrite` | boolean | no | `false` | Overwrite existing libs.json |

Output fields: `addon`, `config_path`, `libraries_count`, `libraries`

#### `libs.sync` (mutating)

Sync addon libraries based on libs.json config

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon to sync |
| `source` | string | no | null | Source library path (defaults to <dev_path>/Libs, then <dev_path>/MechanicLocal/Libs) |
| `dry_run` | boolean | no | `false` | Preview changes without applying |
| `force` | boolean | no | `false` | Force update existing libraries (replaces them) |
| `remove_extra` | boolean | no | `false` | Remove libraries not in config |

Output fields: `addon`, `dry_run`, `actions`, `copied`, `updated`, `skipped`, `removed`, `errors`, `steps_completed`, `recovery`

### locale

#### `locale.extract` (read-only)

Extract potential localizable strings from addon code

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon |
| `path` | string | no | null | Override path to addon folder |

Output fields: `addon`, `strings_found`, `strings`

#### `locale.validate` (read-only)

Validate locale coverage against the enUS baseline

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon to validate |
| `path` | string | no | null | Override path to addon folder |

Output fields: `addon`, `valid`, `baseline_keys`, `locales_found`, `missing`

### lua

#### `lua.queue` (mutating)

Queue Lua code snippets for in-game execution. After running this, /reload in WoW to execute.

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `target` | `target` object | no | null |  |
| `code` | array of string | yes |  | List of Lua code snippets to execute. Each snippet should return a value. |
| `labels` | array of string | no | null | Optional labels for each snippet (for easier identification in results) |

Output fields: `target`, `queued`, `queue_file`, `snippets`, `message`

#### `lua.results` (read-only)

Get results from the last Lua eval queue execution

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `target` | `target` object | no | null |  |

Output fields: `target`, `results`, `total`, `last_run`

### perf

#### `perf.baseline` (mutating)

Record a performance baseline measurement for an addon

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon |
| `version` | string | yes |  | Version being measured |
| `memory_kb` | number | yes |  | Memory usage in KB |
| `cpu_ms` | number | yes |  | CPU time in milliseconds |

Output fields: `addon`, `version`, `memory_kb`, `cpu_ms`, `timestamp`, `history_count`

#### `perf.compare` (read-only)

Compare current performance against baseline and detect regressions

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon |
| `memory_kb` | number | yes |  | Current memory usage in KB |
| `cpu_ms` | number | yes |  | Current CPU time in milliseconds |
| `memory_threshold` | number | no | `1.5` | Memory increase factor that triggers warning |
| `cpu_threshold` | number | no | `2.0` | CPU increase factor that triggers warning |

Output fields: `addon`, `has_regression`, `memory_regression`, `cpu_regression`, `memory_ratio`, `cpu_ratio`, `previous`, `current`, `message`

#### `perf.list` (read-only)

List all addons with performance baselines

Input: none.

Output fields: `addons`, `count`

#### `perf.report` (read-only)

Generate a performance report showing history and trends

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon |
| `limit` | integer | no | `10` | Number of recent measurements to show |

Output fields: `addon`, `history`, `trend`, `report`

### release

#### `release.all` (mutating)

Preflight and run version bump, changelog, commit and tag; supports dry_run

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon |
| `version` | string | yes |  | New version string |
| `message` | string | yes |  | Changelog entry and release description |
| `category` | string | no | `"Changed"` | Changelog category |
| `path` | string | no | null | Override path |
| `dry_run` | boolean | no | `false` | Validate and preview without changing files, index, commits or tags |

Output fields: `addon`, `version`, `dry_run`, `steps_planned`, `steps_completed`, `commit_hash`, `failed_step`, `recovery`

### research

#### `research.query` (mutating)

Search the web for addon development information using Gemini with Google Search grounding

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `query` | string | yes |  | Search query or question |
| `mode` | "fast" / "thinking" | no | `"fast"` | Search mode: 'fast' (Gemini Flash, ~15-30s) or 'thinking' (Gemini Pro, ~30-90s) |
| `json_output` | boolean | no | `false` | Request structured JSON response |

Output fields: `answer`, `mode`, `sources`

### sandbox

#### `sandbox.exec` (mutating)

Execute Lua code in a restricted sandbox with WoW API stubs. User code sees only whitelisted globals (no os, io, package, debug, require, dofile, loadfile, string.dump or bytecode loading); runs for at most 30s and prints at most 256 KB.

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `code` | string | yes |  | Lua code to execute |
| `addon` | string | no | null | Name of addon to load before execution (looks in _dev_ folder) |
| `load_stubs` | boolean | no | `true` | Whether to load WoW API stubs |

Output fields: `result`, `output`, `error`, `exit_code`

#### `sandbox.generate` (mutating)

Generate WoW API stubs from APIDefs for sandbox testing. A namespace is regenerated in place; existing stubs are kept unless force is set or the APIDefs are newer.

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `namespace` | string | no | null | Specific namespace to regenerate in place (e.g., 'C_Spell'); the other namespaces in an existing stubs file are kept. If not provided, generates all. |
| `force` | boolean | no | `false` | Regenerate all stubs even if they are newer than the APIDefs |

Output fields: `stubs_generated`, `namespaces_processed`, `output_path`, `protected_count`, `normal_count`

#### `sandbox.status` (read-only)

Get status of generated WoW API stubs

Input: none.

Output fields: `stubs_exist`, `stubs_path`, `stubs_generated`, `protected_count`, `normal_count`, `last_modified`

#### `sandbox.test` (mutating)

Run an addon's *_spec.lua tests (Core/ and Tests/) in the restricted sandbox with WoW API stubs and the bundled busted-style framework. filter limits tests by name; failures are listed first.

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of addon to test (looks in _dev_ folder) |
| `filter` | string | no | null | Only run tests whose full name contains this text (case-insensitive) |

Output fields: `addon`, `passed`, `total`, `passed_count`, `failed_count`, `tests`, `source_files`, `spec_files`, `duration_ms`

### server

#### `server.shutdown` (mutating)

Gracefully shut down the Mechanic Desktop server

Input: none.

Output fields: `status`, `message`

### sv

#### `sv.discover` (read-only)

Automatically discover SavedVariables paths for all WoW flavors

Input: none.

Output fields: `paths`

#### `sv.parse` (read-only)

Parse a WoW SavedVariables file and extract !Mechanic data

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `target` | `target` object | no | null |  |
| `file_path` | string | yes |  | Absolute path to the !Mechanic.lua file |

Output fields: `target`, `addons`

### system

#### `system.pick_file` (mutating)

Open a native file picker dialog to select a file (Windows only)

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `title` | string | no | `"Select File"` | Title of the dialog window |
| `filter` | string | no | `"All Files (*.*)|*.*"` | File filter (e.g., 'Text Files (*.txt)\|*.txt') |

Output fields: `path`, `filename`, `directory`

### tools

#### `tools.status` (read-only)

Check the status of development tools (luacheck, stylua, etc.)

Input: none.

Output fields: `platform`, `installed_count`, `missing_count`, `required_missing`, `tools`

### version

#### `version.bump` (mutating)

Update the version in a WoW addon's .toc file

| Input | Type | Required | Default | Description |
|---|---|---|---|---|
| `addon` | string | yes |  | Name of the addon |
| `version` | string | yes |  | New version string (e.g., '1.2.0') |
| `path` | string | no | null | Override path to addon folder |

Output fields: `addon`, `old_version`, `new_version`, `toc_file`

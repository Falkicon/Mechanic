# CLI Reference

> Auto-generated from `mechanic-desktop` v0.1.0 on 2026-01-01

This document lists all available Mechanic CLI commands with their inputs and outputs.

## Quick Reference

| Command | Description |
|---------|-------------|
| `dashboard.metrics` | Get the latest reload and test metrics from the local histor... |
| `reload.trigger` | Focus WoW and trigger an in-game /reload |
| `server.shutdown` | Gracefully shut down the Mechanic Desktop server |
| `sv.discover` | Automatically discover SavedVariables paths for all WoW flav... |
| `sv.parse` | Parse a WoW SavedVariables file and extract !Mechanic data |
| `addon.create` | Create a new WoW addon from a template |
| `addon.deprecations` | Scan a WoW addon for deprecated API calls (Midnight prep) |
| `addon.format` | Run StyLua formatter on a WoW addon |
| `addon.lint` | Run Luacheck linter on a WoW addon |
| `addon.output` | Get all addon output (errors, tests, console) for agent cons... |
| `addon.sync` | Create junction links from development addon to WoW client f... |
| `addon.test` | Run Busted unit tests on a WoW addon |
| `addon.validate` | Validate a WoW addon's .toc file for common issues |
| `changelog.add` | Add an entry to the addon's CHANGELOG.md |
| `git.commit` | Stage all changes and commit in the addon's git repository |
| `git.tag` | Create a git tag for a version release |
| `version.bump` | Update the version in a WoW addon's .toc file |
| `atlas.search` | Search Blizzard UI Atlas icons by name pattern |
| `locale.extract` | Extract potential localizable strings from addon code |
| `locale.validate` | Validate locale coverage against the enUS baseline |
| `libs.check` | Check addon library status against libs.json config |
| `libs.init` | Creates a libs.json config file from currently installed lib... |
| `libs.sync` | Sync addon libraries based on libs.json config |
| `tools.status` | Check the status of development tools (luacheck, stylua, etc... |
| `docs.generate` | Generate CLI reference documentation from registered command... |
| `api.info` | Get detailed information about a specific WoW API |
| `api.list` | List APIs by namespace or category |
| `api.queue` | Queue API tests for in-game execution. After running this, /... |
| `api.search` | Search WoW APIs by name pattern. Works offline (reads static... |
| `api.stats` | Get statistics about available WoW APIs |
| `env.status` | Get Mechanic environment configuration and status |
| `lua.queue` | Queue Lua code snippets for in-game execution. After running... |
| `lua.results` | Get results from the last Lua eval queue execution |
| `release.all` | Run full release: bump version, update changelog, commit, an... |
| `sandbox.exec` | Execute Lua code in sandbox environment with WoW API stubs |
| `sandbox.generate` | Generate WoW API stubs from APIDefs database for sandbox tes... |
| `sandbox.test` | Run Busted tests for an addon's Core layer with WoW API stub... |
| `system.pick_file` | Open a native file picker dialog to select a file |

---

## Core Commands

### `dashboard.metrics`

Get the latest reload and test metrics from the local history

**Parameters:** None

**Example:**

```bash
mech call dashboard.metrics
```

---

### `reload.trigger`

Focus WoW and trigger an in-game /reload

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `key` | `string` | No (default: `'^+r'`) | SendKeys sequence (default: ^+r = CTRL+SHIFT+R for Mechanic keybinding) |

**Example:**

```bash
mech call reload.trigger
```

---

### `server.shutdown`

Gracefully shut down the Mechanic Desktop server

**Parameters:** None

**Example:**

```bash
mech call server.shutdown
```

---

### `sv.discover`

Automatically discover SavedVariables paths for all WoW flavors

**Parameters:** None

**Example:**

```bash
mech call sv.discover
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

### `addon.deprecations`

Scan a WoW addon for deprecated API calls (Midnight prep)

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon to scan |
| `path` | `string` | No (default: `None`) | Override path to addon folder |
| `fix` | `boolean` | No (default: `False`) | Attempt to auto-fix deprecated calls |

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
mech call addon.output
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

### `git.commit`

Stage all changes and commit in the addon's git repository

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `message` | `string` | Yes | Commit message |
| `path` | `string` | No (default: `None`) | Override path to addon folder |

**Example:**

```bash
mech call git.commit -i '{"addon": "<addon>", "message": "<message>"}'
```

---

### `git.tag`

Create a git tag for a version release

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `version` | `string` | Yes | Version to tag (e.g., '1.2.0') |
| `message` | `string` | No (default: `None`) | Tag message (defaults to version) |
| `path` | `string` | No (default: `None`) | Override path to addon folder |

**Example:**

```bash
mech call git.tag -i '{"addon": "<addon>", "version": "<version>"}'
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

### `atlas.search`

Search Blizzard UI Atlas icons by name pattern

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `query` | `string` | Yes | Search query for atlas icons |
| `limit` | `number` | No (default: `20`) | Maximum results to return |

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
mech call tools.status
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
mech call docs.generate
```

---

## Other Commands

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
mech call api.list
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
mech call api.stats
```

---

### `env.status`

Get Mechanic environment configuration and status

**Parameters:** None

**Example:**

```bash
mech call env.status
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
mech call lua.results
```

---

### `release.all`

Run full release: bump version, update changelog, commit, and tag

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `addon` | `string` | Yes | Name of the addon |
| `version` | `string` | Yes | New version string |
| `message` | `string` | Yes | Changelog entry and release description |
| `category` | `string` | No (default: `'Changed'`) | Changelog category |
| `path` | `string` | No (default: `None`) | Override path |

**Example:**

```bash
mech call release.all -i '{"addon": "<addon>", "version": "<version>", "message": "<message>"}'
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
mech call sandbox.generate
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
mech call system.pick_file
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
mech reload        # Equivalent to: mech call reload.trigger
mech addon.output  # Direct command shortcut
```

---

<p align="center">
  <em>Generated by <code>mech call docs.generate</code></em>
</p>
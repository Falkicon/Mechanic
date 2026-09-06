# Mechanic command reference

Generated from registered command schemas. Use `commands.list` for complete machine-readable input/output schemas and current mutation metadata.

See [diagnostic workflow](../../../../docs/quality-improvements.md) for targets, previews, and metrics.

| Command | Mutation | Description |
|---|---|---|
| `addon.complexity` | no | Detect code complexity issues in a WoW addon (nesting, long functions, magic numbers) |
| `addon.create` | yes | Create a new WoW addon from a template |
| `addon.deadcode` | no | Detect dead code in a WoW addon (unused functions, orphaned files, etc.) |
| `addon.deprecations` | no | Scan a WoW addon for deprecated API calls (100+ APIs, 11.0-12.0) |
| `addon.format` | yes | Run StyLua formatter on a WoW addon |
| `addon.lint` | no | Run Luacheck linter on a WoW addon |
| `addon.output` | no | Get all addon output (errors, tests, console) for agent consumption. Use agent_mode=true for compressed output. |
| `addon.security` | no | Detect security issues in a WoW addon (combat lockdown, secret values, taint) |
| `addon.sync` | yes | Preflight and create addon junction links; supports dry_run |
| `addon.test` | yes | Run Busted unit tests on a WoW addon |
| `addon.validate` | no | Validate a WoW addon's .toc file for common issues |
| `api.download` | yes | Download FrameXML from Townlong Yak and optionally refresh API definitions |
| `api.generate` | yes | Generate APIDefs Lua files from api_database.json for Mechanic |
| `api.info` | no | Get detailed information about a specific WoW API |
| `api.list` | no | List APIs by namespace or category |
| `api.populate` | yes | Parse Blizzard API documentation and generate api_database.json |
| `api.queue` | yes | Queue API tests for in-game execution. After running this, /reload in WoW to execute tests. |
| `api.refresh` | yes | Full refresh: parse Blizzard docs and regenerate all APIDefs in one step |
| `api.search` | no | Search WoW APIs by name pattern. Works offline (reads static definitions). |
| `api.stats` | no | Get statistics about available WoW APIs |
| `assets.list` | no | List asset files in an addon's assets_source and assets folders |
| `assets.sync` | yes | Sync addon assets: convert PNG to TGA and copy other files from assets_source to assets |
| `atlas.scan` | yes | Scan wow-ui-source for atlas icons and generate searchable index |
| `atlas.search` | no | Search Blizzard UI atlas icons by name pattern (supports wildcards) |
| `changelog.add` | yes | Add an entry to the addon's CHANGELOG.md |
| `commands.list` | no | List command schemas and mutation metadata |
| `dashboard.metrics` | no | Get the latest reload and test metrics from the local history |
| `diagnostic.metrics` | no | Read bounded desktop overhead and optional explicitly selected addon snapshot |
| `diagnostic.targets` | no | List deterministic client/account/character/profile diagnostic targets |
| `docs.generate` | yes | Generate CLI reference documentation from registered commands |
| `docs.stale` | no | Detect stale or broken documentation in a WoW addon |
| `env.status` | no | Get Mechanic environment configuration and status |
| `fencore-catalog` | no | Get full catalog of FenCore logic domains and functions |
| `fencore-info` | no | Get detailed info about a specific FenCore function |
| `fencore-search` | no | Search FenCore functions by name or description |
| `git.commit` | yes | Stage all addon changes and create a git commit |
| `git.tag` | yes | Create an annotated git tag for an addon release |
| `libs.check` | no | Check addon library status against libs.json config |
| `libs.init` | yes | Creates a libs.json config file from currently installed libraries. ⚠️ Will NOT overwrite existing config unless overwrite=true is set. |
| `libs.sync` | yes | Sync addon libraries based on libs.json config |
| `locale.extract` | no | Extract potential localizable strings from addon code |
| `locale.validate` | no | Validate locale coverage against the enUS baseline |
| `lua.queue` | yes | Queue Lua code snippets for in-game execution. After running this, /reload in WoW to execute. |
| `lua.results` | no | Get results from the last Lua eval queue execution |
| `perf.baseline` | yes | Record a performance baseline measurement for an addon |
| `perf.compare` | yes | Compare current performance against baseline and detect regressions |
| `perf.list` | yes | List all addons with performance baselines |
| `perf.report` | yes | Generate a performance report showing history and trends |
| `release.all` | yes | Preflight and run version bump, changelog, commit and tag; supports dry_run |
| `research.query` | yes | Search the web for addon development information using Gemini with Google Search grounding |
| `sandbox.exec` | yes | Execute Lua code in sandbox environment with WoW API stubs |
| `sandbox.generate` | yes | Generate WoW API stubs from APIDefs database for sandbox testing |
| `sandbox.status` | no | Get status of generated WoW API stubs |
| `sandbox.test` | yes | Run Busted tests for an addon's Core layer with WoW API stubs |
| `server.shutdown` | yes | Gracefully shut down the Mechanic Desktop server |
| `sv.discover` | no | Automatically discover SavedVariables paths for all WoW flavors |
| `sv.parse` | no | Parse a WoW SavedVariables file and extract !Mechanic data |
| `system.pick_file` | yes | Open a native file picker dialog to select a file |
| `tools.status` | no | Check the status of development tools (luacheck, stylua, etc.) |
| `version.bump` | yes | Update the version in a WoW addon's .toc file |

## New diagnostic and catalog commands

### `commands.list`

List command schemas and mutation metadata

```json
{
  "properties": {},
  "title": "CatalogInput",
  "type": "object"
}
```

### `diagnostic.targets`

List deterministic client/account/character/profile diagnostic targets

```json
{
  "properties": {},
  "title": "TargetsInput",
  "type": "object"
}
```

### `diagnostic.metrics`

Read bounded desktop overhead and optional explicitly selected addon snapshot

```json
{
  "$defs": {
    "DiagnosticTarget": {
      "properties": {
        "client": {
          "anyOf": [
            {
              "type": "string"
            },
            {
              "type": "null"
            }
          ],
          "default": null,
          "description": "Absolute WoW client directory, such as /Games/WoW/_retail_",
          "title": "Client"
        },
        "account": {
          "anyOf": [
            {
              "type": "string"
            },
            {
              "type": "null"
            }
          ],
          "default": null,
          "description": "Account directory name under WTF/Account",
          "title": "Account"
        },
        "character": {
          "anyOf": [
            {
              "type": "string"
            },
            {
              "type": "null"
            }
          ],
          "default": null,
          "description": "Exact AceDB character key: Name - Realm",
          "title": "Character"
        },
        "profile": {
          "anyOf": [
            {
              "type": "string"
            },
            {
              "type": "null"
            }
          ],
          "default": null,
          "description": "Exact AceDB profile name",
          "title": "Profile"
        }
      },
      "title": "DiagnosticTarget",
      "type": "object"
    }
  },
  "properties": {
    "target": {
      "anyOf": [
        {
          "$ref": "#/$defs/DiagnosticTarget"
        },
        {
          "type": "null"
        }
      ],
      "default": null,
      "description": "Explicit target to include its last saved addon overhead snapshot"
    }
  },
  "title": "MetricsInput",
  "type": "object"
}
```

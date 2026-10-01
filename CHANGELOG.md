# Changelog

All notable changes to Mechanic Desktop will be documented in this file.

For the in-game addon changelog, see [Mechanic/CHANGELOG.md](./Mechanic/CHANGELOG.md).

The desktop package is versioned separately from the addons (`mechanic-desktop`, single-sourced from `mechanic.__version__`). Desktop releases are not tagged in git (the `v1.x` tags are addon releases), so this file has no compare links.

## [Unreleased]

### Added
- `additional_wow_roots` config setting (and `MECHANIC_ADDITIONAL_WOW_ROOTS`) adds extra WoW installations, such as a client on another drive, to diagnostic discovery. `diagnostic.targets`, `sv.discover` and the file watcher search them in addition to `wow_root`; `addon.sync` and `env.status` still use only `wow_root`.

### Fixed
- The README and `config.json.example` listed the default flavors without `_classic_beta_`, which the code includes.

## [0.5.0] - 2026-09-30

### Added
- `/health` reports `{"status", "version", "port"}`; `port` is null when no HTTP server runs in the process.
- SSE MCP transport defaults to port 3101 (it collided with the dashboard on 3100), binds `127.0.0.1`, gains `--host`, and warns on stderr that it is unauthenticated.
- `mech release` calls `release.all` (preflight, recovery metadata) and gains `--dry-run` and `--category`; `--skip-tag` was removed (exit status 2).
- `VALIDATION_ERROR` results with `error.details.errors` (`field`, `message`, `type`) for invalid command input.
- History API limits: 1000 command rows and 200 reload rows are kept, results over 1 MB are stored as a stub, `/api/history` inlines results up to 100 KB (larger ones return `truncated` and `history_id`), `GET /api/history/{id}` returns the full entry, and `max_result_bytes` tunes the inline limit.
- Tool downloads are checksum-verified before they are written (`mech setup` refuses missing, `skip` and `placeholder` hashes) and install `lua5.1.dll`; installed wheels put tools in `~/.mechanic/bin`. The manifest moved to `src/mechanic/resources/checksums.json`.
- `assets.sync` gains `dry_run` and `removed_files`, and only removes files recorded in `assets/.mechanic-assets.json`.
- `addon.deadcode`, `addon.security`, `addon.complexity` and `docs.stale` gain a `limit` input (default 200, max 2000) and `truncated`, `total_issues` and `read_errors` outputs. Unknown `categories` return `INVALID_CATEGORY`.
- `addon.output` reports data freshness (from `profile.lastSync`, then `luaEvalResults.lastRun`) and a `BUGGRABBER_UNREADABLE` warning; `addon.test` results carry an `error` field and count Busted errors.
- `fencore-*` commands accept an optional `target`.
- `research.query` model IDs can be overridden with `MECHANIC_GEMINI_FAST_MODEL` and `MECHANIC_GEMINI_THINKING_MODEL`.
- `docs.generate` honours `SOURCE_DATE_EPOCH` and does not rewrite the file when only the date would change.
- Shared Lua tokenizer and structure modules (`lua_tokenizer.py`, `lua_structure.py`, `analysis_common.py`) behind the analyzers.
- Dashboard test suites `tests/dashboard_render_regressions.cjs` and `tests/dashboard_behavior_regressions.cjs`.
- Shared diagnostic target discovery and selection, with offline queue-to-SavedVariables contract coverage.
- Command schema catalog and mutation audit, dashboard forms generated from schemas, and explicit diagnostic target selection.
- Release/sync previews, preflight validation, and structured partial-failure recovery guidance.
- Bounded, on-demand desktop and saved addon overhead metrics.
- Isolated test configuration, constrained CI tooling, and installed-wheel dashboard smoke validation.

### Fixed
- Importing the server or running `mech --help` no longer creates the history database.
- `server.shutdown` stops the supervisor gracefully and returns `NOT_RUNNING` outside a dashboard process.
- `addon.output` and `docs` exit 1 on failure, `docs --json` emits real JSON, `mech shell` survives a bad JSON argument, and `mech --agent addon.output` works.
- The watcher skips unrelated SavedVariables files, parses in a thread, and matches the reload window exactly with a 15 second timeout.
- `addon.create` and `addon.sync` validate names, require the `.toc`, skip uninstalled clients (`NO_TOC`, `NO_CLIENT_FOUND`), and `addon.create` also rewrites suffix-less files such as `.pkgmeta` and `.luacheckrc`.
- `changelog.add` inserts before the first `## [` heading and validates versions; `git.commit` commits only the addon pathspec; `libs.sync --force` replaces files with a backup.
- `addon.lint` and `addon.format` run in the addon folder, and `locale.validate` reports `missing_count`.
- Read-only `perf.*` commands no longer create directories.
- Sandbox: `sandbox.exec` and `sandbox.test` run in a restricted environment (whitelisted globals; no `os`, `io`, `package`, `debug`, `require`, `dofile`, `loadfile`, `load`, `getfenv`, `setfenv` or `string.dump`; time and output limits; memory is not limited), `sandbox.test` no longer needs a generated framework and honours `filter`, and `sandbox.generate` merges namespaces.
- Analyzers run on a real Lua tokenizer: fewer false positives (on `Mechanic/`, dead-code findings dropped from 1005 to 125, deep-nesting from 417 to 8, security findings from 12 to 2), nesting depth counts real blocks, library folders are excluded case-insensitively, and `docs.stale` ignores code blocks and changelogs for version drift.
- Dashboard: a non-numeric counter no longer injects markup, the Settings "Add Addon" crash is fixed, and shortcuts ignore modifier keys.
- TOC validation now accepts current Retail 12.1 (`120100`) and WoW: Forever (`16001`) interfaces, and its error lists the current targets instead of stale 12.0 versions. A comma-separated list passes when any entry is a current target; malformed values are rejected and unrecognised five-digit values only warn. The addon template TOC declares both.
- Generate valid positional-JSON CLI documentation with schema-derived types and escaped Markdown tables.
- Correct MCP handler signatures, local dashboard request validation, SQLite connection cleanup, watcher shutdown, environment precedence, and dashboard wheel packaging.
- Safely encode queue parameters/labels, constrain performance baseline filenames, and treat API search patterns as wildcards rather than regular expressions.
- Align bootstrap Lua results with the desktop contract, stop hidden addon polling, restore saved auto-refresh preferences, and fix the settings locale namespace.
- Decode SavedVariables string escapes, reject truncated tables, and avoid repeated full-suffix copies during parsing.
- Reconnect dashboard sockets, tolerate corrupt persisted addon data, supervise desktop service failures, and isolate documentation/performance tests from persistent files.
- **MCP tool names**: Use dashes instead of dots in MCP tool names (`addon-lint` vs `addon.lint`) for Cursor agent compatibility. Cursor's agent tool injection doesn't handle dots in tool names.
- **Async command execution**: Run external tools, Git, API downloads, file picking, and stale-doc Git analysis without blocking the command server.
- **Dashboard safety**: Escape addon output and command data before rendering, and remove calls to nonexistent reload/removal commands.
- **File picker safety**: Pass picker labels through environment variables instead of interpolating them into PowerShell source.
- **API archive safety**: Reject ZIP members that would escape the configured extraction directory.
- **Release commands**: Restore `git.commit`, `git.tag`, and `release.all` with scoped staging and actionable Git failures.

### Changed
- The `afd` framework is consumed from PyPI (`afd>=0.8.0,<0.9`) instead of a vendored 0.1.0 copy; the `mcp` extra needs `mcp>=1.28` only (`fastmcp` was dropped).
- The package version comes from `mechanic.__version__` (0.5.0).
- The dashboard is split into `index.html` (markup), `dashboard.css` and separate scripts; sidebar, version, port and status come from `commands.list` and `/health`, history is bounded to 50 entries per command, and the output pane loads on startup and reconnect. Accessibility improvements: real buttons, `aria-expanded`, focus outlines, `aria-live` toasts.
- The canonical API definitions are `Mechanic/UI/APIDefs`; the repository-root `UI/` copy was removed. They were regenerated from Blizzard 12.0.1.64914 (4,521 APIs). `api.generate` gains `allow_any_output_dir`; `api.refresh` gains `output_path`, `database_path` and `allow_any_output_dir`; `api.populate` reports `skipped_files`; `api.download` extracts under `<data_dir>/framexml/<version>` and accepts digit-only build IDs.
- `addon.deprecations` reads a packaged database (`resources/deprecated_apis.json`) and no longer has a `fix` input; the shipped database is a small seed, so results carry `DEPRECATION_DB_LIMITED` until it is regenerated with `python -m mechanic.deprecations_builder <wow-ui-source path>`. `addon.lint` also lost its unused `fix` input.
- CI covers Python 3.10 to 3.13 and Windows for the wheel, dashboard and MCP jobs, runs every `tests/*_regressions` suite, and uses read-only repository permissions. It has not been run on GitHub for this tree.
- Documentation refreshed throughout: command examples use the positional JSON form (`mech call <cmd> '<json>'`; there is no `-i` option), the SavedVariables guide states what is actually read, the dev guide maps the retired `addon-dev` CLI to `mech`, and broken links and anchors were repaired.
- Refresh repository and component entry docs, command examples, agent guidance, security boundaries, and the roadmap against the current implementation.
- Python and Lua linting now cover the complete tracked source and fail CI on violations.
- The desktop server version now comes from the package version.

## [0.4.0] - 2026-01-01

### Added

#### Lua Eval Queue (Round-Trip Execution)
- **`lua.queue`**: Queue Lua code snippets for in-game execution via CLI
- **`lua.results`**: Read execution results from MechanicDB after reload
- **Round-trip workflow**: Agent queues code → User reloads → Addon executes → Agent reads results
- Supports labeled snippets for easier result identification
- Results include success/failure status, return values, and error messages
- Integrated into `addon.output` for unified data retrieval

#### API Reference Commands (Offline)
- **`api.search`**: Search WoW APIs by pattern without game running
- **`api.info`**: Get detailed API signature, parameters, return types
- **`api.list`**: List APIs by namespace (C_Spell, C_Item, etc.) or category
- **`api.queue`**: Queue API tests for in-game execution with parameters
- **`api.stats`**: Get statistics (total count, by category, protected count)

#### Sandbox Commands (Offline Lua Testing)
- **`sandbox.generate`**: Generate WoW API stubs from APIDefs database (~5000+ APIs)
- **`sandbox.exec`**: Execute Lua code in sandbox with mocked WoW APIs
- **`sandbox.test`**: Run Busted-compatible tests with WoW API stubs
- Busted-compatible test framework with full assertion library
- Lifecycle hooks: `before_each`, `after_each`, `before_all`, `after_all`
- Searches both `Core/` and `Tests/` folders for `*_spec.lua` files
- Dashboard integration via Sandbox tab
- Enables testing addon logic without launching the game

#### Tools Management
- **`tools.status`**: Check installation status of all dev tools (luacheck, stylua, etc.)

#### Library Management
- **`libs.check`**: Check library status vs libs.json configuration
- **`libs.init`**: Create libs.json from currently installed libraries
- **`libs.sync`**: Sync libraries based on libs.json (copy from shared source)

#### Environment & System
- **`env.status`**: Get environment configuration and paths
- **`system.pick_file`**: Open native file picker dialog for file selection

#### Release Workflow
- **`release.all`**: Full release workflow in one command (version.bump → changelog.add → git.commit → git.tag)

#### Documentation
- **`docs.generate`**: Auto-generate CLI reference from registered commands

---

## [0.3.0] - 2026-01-01

### Added

#### In-Game Diagnostic Hub
- Implemented central aggregation hub in `!Mechanic` core
- Addons now register tests, perf metrics, and logs via `MechanicLib` for hub persistence
- Consolidated `!Mechanic.lua` is now the primary data source for the ecosystem

#### Modular Dashboard UI
- **Row-per-Addon Architecture**: Replaced monolithic test view with individual addon sections
- **System Health Integration**: Collapsible performance metrics embedded directly within each addon block
- **Actionable-Only Details**: Hidden empty expansion panes for tests without logs/messages
- **Formatted Diagnostic Steps**: Structured parsing of step objects (e.g. Flightsim diagnostics)

#### Technical Refinements
- **Performance Schema Fix**: Standardized on `ms` and `percent` across all layers
- **Data Integrity**: Improved handling of complex Lua-to-JSON type conversions in `output.py`

---

## [0.2.1] - 2025-12-31

### Added

#### Command History Persistence
- Added SQLite backing store for command results (`storage.py`)
- Commands executed via Dashboard or CLI are now saved and restored on restart
- Added `/api/history` and `/api/history/clear` endpoints
- Added "Clear History" button to Dashboard UI

#### Graceful Shutdown
- Implemented robust signal handling for `SIGINT` (Ctrl+C)
- `mech stop` now reliably terminates server and watcher processes via API
- Fixed "Address already in use" errors caused by zombie processes

#### UI UX Improvements
- **State Persistence**: Dashboard significantly improved by persisting:
  - Active Tab/View (e.g. staying on "Test" view after reload)
  - Selected Addon in context dropdown
- **Layout Tuning**: Improved contrast, button spacing, and grouping in Command Toolbar
- **Run Button**: Dedicated "Run" button for all commands

### Fixed
- Fixed race condition in history loading where new commands could be overwritten
- Fixed `AttributeError: setup_event_loop` crash with newer Uvicorn versions

---

## [0.2.0] - 2025-12-31

### Added

#### ADDON_DEV Tools Migration
Migrated development tools from ADDON_DEV to first-class AFD commands in Mechanic Desktop.

**Development Commands** (`development.py`):
- `addon.validate` - Validate .toc file structure, metadata, and file references
- `addon.lint` - Run Luacheck linter with structured output
- `addon.format` - Run StyLua formatter
- `addon.test` - Run Busted unit tests with JSON output parsing
- `addon.deprecations` - Scan for deprecated API calls (Midnight prep)

**Release Commands** (`release.py`):
- `version.bump` - Update version in .toc file
- `changelog.add` - Add entry to CHANGELOG.md with date
- `git.commit` - Stage all changes and commit
- `git.tag` - Create annotated git tag

**Locale Commands** (`locale.py`):
- `locale.validate` - Check locale coverage against enUS baseline
- `locale.extract` - Extract localizable strings from addon code
- `atlas.search` - Search Blizzard UI Atlas icons

**Environment Commands** (`environment.py`):
- `addon.create` - Create new addon from template
- `addon.sync` - Create junction links to WoW client folders
- `libs.check` - Check library sync status

#### CLI Enhancements
- **`mech release <addon> <ver> <msg>`**: Convenience command that chains:
  - `version.bump` → `changelog.add` → `git.commit` → `git.tag`
- **Shortcuts**: `mech` now defaults to `mech dashboard`

#### Testing & Stability
- Fixed command registration to prevent duplicate registration errors
- All 9 tests passing

### Changed
- Updated AGENTS.md with comprehensive 21-command reference
- Updated README.md with complete feature list and CLI examples
- Organized commands into 5 modules for better maintainability

### Technical Notes
- Commands support configuration via `mechanic.config.json` for workspace-specific paths
- Environment commands gracefully degrade when config is not present
- All commands follow AFD patterns with typed schemas and actionable errors

---

## [0.1.0] - 2025-12-31


### Added

#### Core Architecture
- **AFD Foundation**: Built on Agent-First Development principles with structured `CommandResult` responses
- **6 AFD Commands**: `sv.parse`, `sv.discover`, `reload.trigger`, `dashboard.metrics`, `server.shutdown`
- **WebSocket Streaming**: Real-time data to dashboard
- **Release Workflow**: One-command version bump, changelog, commit, tag
- **Persistence**: Command history and UI state saved across restarts
- **Graceful Shutdown**: Reliable process management via `mech stop`
- **Typed Schemas**: Pydantic input/output schemas for all commands
- **Source Attribution**: Commands include metadata about data origins for transparency
- **Actionable Errors**: All errors include `code`, `message`, and `suggestion` for recovery

#### CLI (`mech`)
- **Zero-Config Startup**: `mech` runs with auto-discovery, no arguments required
- **`mech reload`**: Trigger in-game /reload from terminal
- **`mech stop`**: Gracefully stop running server
- **`mech call <cmd>`**: Execute any AFD command directly with JSON input
- **`mech dashboard`**: Full options for watch paths, source paths, and auto-reload

#### Dashboard UI
- **3-Column Layout**: Sidebar, Main content, Command Console
- **Accounts Sidebar**: Shows all discovered WoW accounts via `sv.discover`
- **AFD Metadata Display**: Sources, Reasoning, and Confidence from CommandResult
- **Command Console**: In-browser execution of any AFD command
- **Stop Server Button**: Lifecycle control without terminal access
- **Live Test Results**: Real-time updates via WebSocket

#### Backend
- **FastAPI Server**: RESTful API with WebSocket support
- **Headless Bridge**: Single `/api/execute` endpoint routes all commands
- **SQLite Storage**: Persists reload history for metrics queries
- **File Watcher**: Monitors SavedVariables using `watchfiles`

#### Testing
- **9 Automated Tests**: Unit tests for AFD commands, integration tests for CLI
- **AFD Assertions**: Using `afd[testing]` helpers (`assert_success`, `assert_error`)
- **Pytest Integration**: Run with `pytest -v` from desktop/

### Documentation
- **AGENTS.md**: Comprehensive AFD development standards and templates
- **README.md**: Full project documentation with quick start guide
- **CHANGELOG.md**: Version history (this file)

---

## Development Notes

This release establishes the foundational architecture for Mechanic Desktop. All future features **must** follow AFD patterns as documented in AGENTS.md.

Key design decisions:
1. UI is a pure consumer of the headless command layer
2. All business logic lives in AFD commands, not in CLI or server routes
3. Commands return rich metadata for observability and trust

# Changelog

All notable changes to Mechanic Desktop will be documented in this file.

For the !Mechanic WoW addon changelog, see [!Mechanic/CHANGELOG.md](./!Mechanic/CHANGELOG.md).

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

## [0.2.1] - 2024-12-31

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

## [0.2.0] - 2024-12-31

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

## [0.1.0] - 2024-12-31


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

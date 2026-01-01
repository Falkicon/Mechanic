# Changelog

All notable changes to Mechanic Desktop will be documented in this file.

For the !Mechanic WoW addon changelog, see [!Mechanic/CHANGELOG.md](./!Mechanic/CHANGELOG.md).

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

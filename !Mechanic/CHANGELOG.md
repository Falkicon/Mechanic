# Changelog
## [1.2.3] - 2026-01-01

### Changed
- Release features


All notable changes to !Mechanic will be documented in this file.

## [1.2.4] - 2025-12-27

### Fixed
- **Property Editor UI Blanking**: Fixed a critical bug where FenUI input fields were not receiving their initial values. Added explicit `:SetText()` calls in the widget factory.
- **Data Persistence**: Fixed an issue where the property editor would wipe its history (original values and pending changes) during every UI refresh. History is now correctly preserved until a new frame is selected.
- **Scale Performance**: Removed the Scale slider to avoid UI lag caused by high-frequency layout re-calculations. Scale is now managed via a precise number input.
- **Focus Stability**: Improved logic to prevent focus loss during value entry.

## [1.2.3] - 2025-12-27

### Added
- **Phase 11: Live Frame Property Editor**:
  - Refactored Inspect tab to a 4-column layout: Tree | Properties | Details | Watch.
  - New **Properties** module with live editing for Geometry, Visibility, Layering, and Scale.
  - **Section Registry Pattern**: Allows easy extension of editable properties (prepares for FenUI integration).
  - **Input Widget Factory**: Standardized widgets for Number, Checkbox, Slider, Dropdown, and ColorPicker.
  - **DevTools Export**: Generate Markdown/Lua snippets of frame changes for AI agents and bug reports.
  - **Live Reset**: Revert all pending changes to their original state with one click.
  - **Collapsible Details**: Details column sections are now collapsible for better density.
  - **FenUI Detection**: Automatic badge indicator on FenUI-managed frames.

## [1.2.2] - 2025-12-26

### Added
- **Export All Errors**: The export button in the Errors tab now exports all errors in the currently selected category (e.g., specific addon or all sessions) instead of just the active error.

### Fixed
- **Console Crash**: Fixed a Lua error where `Console:OnEnable` attempted to call `RegisterCallback` on `MechanicLib` (which does not support it). Logging is now correctly handled via `Mechanic:OnLog` forwarding.
- **Theme Manager Syntax Error**: Fixed a critical syntax error in `ThemeManager.lua` (FenUI) that prevented the library from loading in certain environments.
- **Console Log Parameters**: Fixed a parameter mismatch in `Console:OnLog` that caused log messages to display incorrectly.

## [1.2.1] - 2025-12-26

### Fixed
- **Background Error Monitoring**: Fixed an issue where the Errors tab and minimap icon would not update if the tab had never been opened. Modules (Errors and Console) now initialize their background capture listeners immediately on addon enable.
- **UI Resilience**: Added defensive checks to ensure module initialization doesn't crash if called before the UI is fully created.

## [1.2.0] - 2025-12-25

### Added
- **Self-Registration (Dogfooding)**: Added a "Register Mechanic" toggle checkbox in the main frame footer. When enabled, !Mechanic registers itself via MechanicLib, appearing in its own Performance, Tools, and Tests tabs.
- **Persistent Health Log**: Internal errors and critical events are now logged to `MechanicDB.profile.healthLog` for persistent debugging across reloads.
- **Self-Diagnostics Tools**:
  - **View Health Log**: Export the internal error log via the high-elevation export dialog.
  - **Clear Health Log**: Wipe all entries from the persistent health log.
  - **Reset UI Position**: Reset the main frame to default size and center position.
- **Self-Tests**: Added database integrity, defaults validation, and UI module checks.
- **Self-Performance Metrics**: Console buffer usage, health log entry count, and watch list size.
- Implemented `MechanicLib:Unregister()` for clean addon deregistration.

### Changed
- Bumped MechanicLib to Minor 3.






## [1.1.9] - 2025-12-25

### Fixed
- Fixed UI rendering issues in the Performance tab where addon detail panels were blank on first load.
- Replaced Unicode characters in sort indicators and checkboxes with robust Blizzard atlases and text icons to fix display issues (boxes/missing icons).
- Fixed "Fechar" label on the Export dialog's close button by ensuring explicit text initialization.
- Refactored Performance addon detail frames to use the SplitNavLayout's content frame management for better lifecycle synchronization.
- Improved UI resilience in Performance tab with more descriptive empty states when metrics are unavailable.
- Filtered Performance addon list to only show currently loaded (active) addons, resolving clutter from disabled addons.
- Fixed legacy `IsAddOnLoaded` global call in Performance tab (switched to `C_AddOns.IsAddOnLoaded`).
- Critical UI crash on Performance tab due to missing localization entries.
- UI resilience: Switched to silent locale lookups to prevent future crashes if keys are missing.
- Fixed EasyMenu nil errors by adding defensive checks in FenUI.Utils.
- Fixed session dropdown values in Errors tab (now shows readable names instead of internal numbers).
- Restored missing keys in enUS locale.
- Fixed `attempt to call method 'HasCapability' (a nil value)` in Performance tab.
- Fixed `attempt to call method 'OnShow' (a nil value)` and `OnHide` errors during tab switching by adding defensive checks in MainFrame and refactoring module lifecycles.
- Resolved numerous linting warnings (W113/W122) in FenUI core and widgets for better stability.
- Fixed critical syntax error in MainFrame.lua introduced during refactoring.

## [1.1.8] - 2025-12-25

### Changed
- Refactored UI to use FenUI widgets.
Consolidated utilities into FenUI.Utils.
Fixed hardcoded strings and added localization keys.
Synced libraries to latest versions.
Midnight compatibility verified.

## [1.1.7] - 2025-12-25

### Changed
- - Implemented dynamic minimap icon based on error state.
- Updated LibDBIcon-1.0 to modern version (Minor 55).
- Fixed Performance tab export overlapping table view.
- Fixed MultiLineEditBox text selection and scrolling issues.
- Optimized Inspect Watch list by switching from OnUpdate to Ticker.
- Cleaned up API definitions for Midnight 12.0 compatibility.

## [1.1.6] - 2025-12-25

### Added
- **Utility Consolidation (Round 2)**: Further consolidated UI and formatting logic across API and Inspect modules.
- Added `Mechanic.Utils:GetOrCreateWidget()` generic UI factory to eliminate repeated boilerplate.
- Added `Utils:FormatValue()` with support for table serialization, field filtering, and secret value detection (standardized across Test Bench and Inspector).
- Added `Utils:SafeCall()` helper for safe API execution with multiple return values.
- Added `Utils:ShowMenu()` wrapper for Blizzard's EasyMenu.
- Added `Utils:ResolveFrameOrTable()` to centralize string-to-object resolution.
- Added `Utils.Colors.Impact` for standardized API impact highlighting.

### Fixed
- **Inspect**: Fixed layout issues in property details where text height wasn't correctly accounted for. Improved table inspection by using the new unified serializer.
- **API**: Standardized parameter input creation and example menu handling.

### Changed
- Refactored `API.lua`, `Inspect.lua`, and `InspectDetails.lua` to remove local helper redundancy.

## [1.1.6] - 2025-12-24

### Added
- **Phase 9: API Database Automation**:
  - Integrated 3,000+ Midnight-affected and restricted APIs via automated discovery.
  - Implemented lazy-loading architecture with namespace-specific files and a central registry.
  - Added real-world usage examples from hundreds of addons to the Test Bench parameter presets.
  - Automates "Protected" status detection for APIs that cannot be called in combat.

## [1.1.5] - 2025-12-23

### Changed
- Added unified Inspect tab with frame tree, detailed property inspection, and live-updating watch list with pick mode. Updated MechanicLib to 1.1 Minor 2 with new watch list APIs.

## [1.1.4] - 2025-12-23

### Changed
- Added Phase 7: API Test Bench for WoW API exploration and Midnight secret value detection. Includes organized API categories, parameter presets, and batch testing support.

## [1.1.0] - 2025-12-23

### Changed
- Phase 6: Extensibility Framework - Standardized SplitNavLayout, new Tools tab for registered addon diagnostics, and Performance sub-metrics support.

## [1.1.0] - 2025-12-23

### Changed
- Phase 5 Complete: Enhanced console category colors (purple for [Secret]), rich test details with status-colored icons, and clean plain-text copy logic. Fixed multiple performance bottlenecks in loops.

## [1.0.0] - 2025-12-23

### Changed
- Initial stable release. Completed Phase 4 (Migration) and consolidated development hub features including Console, Error monitoring (BugGrabber), Test execution (MechanicLib), and Performance metrics. Improved UI with FenUI StatusRow/MultiLineEditBox and fixed various race conditions and layering issues. Added support for ActionHud and WimpyAuras integration.

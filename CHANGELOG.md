# Changelog

All notable changes to !Mechanic will be documented in this file.







## [1.1.6] - 2025-12-25

### Added
- Created `Utils.lua` to centralize pure functions for environment detection, memory/duration formatting, and error analysis. This improves code reusability and testability across all UI modules.

### Fixed
- Performance tab: Export view now correctly refreshes content when switching navigation items (e.g., General -> Addon) while export mode is active.
- Performance tab: Export view now supports detailed addon sub-metrics instead of always showing the general addon list.
- Performance tab: Export view no longer overlaps with addon-specific metrics when navigating while export mode is active. The export box now properly hides all content frames and raises its frame level above the content area.

### Changed
- Refactored `GetEnvironmentHeader` and the main frame status bar to use shared utility functions, ensuring consistent formatting for WoW version and interface strings (e.g., `120001 (Beta)`).
- Beta compatibility fixes for MultiLineEditBox (GetTextHeight error), Inspect tab performance optimizations (avoiding CreateFrame in OnUpdate), and API database documentation updates for Midnight.

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

# Changelog

All notable changes to !Mechanic (the bootstrap addon) will be documented in this file. The paired main-addon releases are listed in [the shared addon changelog](../Mechanic/CHANGELOG.md), which has the full detail.

## [Unreleased]

TOC version is not bumped yet (1.4.6); these changes ship with the next release.

- A malformed (non-table) queue `target` now fails closed: queued Lua/API code runs only when the target character and profile match.
- Queue ownership is handed to the main addon once it loads (the bootstrap defers queues that need the API definitions).
- The addon version fallback is `unknown` instead of a stale hard-coded number.

## [1.4.6] - 2026-09-23

- Bundle main addon 1.3.7: FenUI Obsidian visual refresh (palette, type scale, rounded corners) and Inspect improvements.

## [1.4.5] - 2026-09-18

- Add WoW: Forever support (Interface 16001 alongside Retail 120100), bundled with main addon 1.3.6.

## [1.4.4] - 2026-09-06

- Bundle main addon 1.3.5 with the Performance-tab sorting crash fix.

## [1.4.3] - 2026-09-06

- Guard queued diagnostics by character/profile and align serialized results with desktop readers.
- See [the shared addon changelog](../Mechanic/CHANGELOG.md) for the paired main-addon release (1.3.4).

## [1.4.2] - 2026-08-10

- Bundle main addon 1.3.3 (BugGrabber event registration fix; see the shared addon changelog).

## [1.4.1] - 2026-08-10

- Target Retail Interface 120100 (WoW 12.1.0), bundled with main addon 1.3.2.

## [1.4.0] - 2026-01-07

### Changed
- Vendored AFD Python package internally, removing external dependency

[Unreleased]: https://github.com/Falkicon/Mechanic/compare/v1.4.6...HEAD
[1.4.6]: https://github.com/Falkicon/Mechanic/compare/v1.4.5...v1.4.6
[1.4.5]: https://github.com/Falkicon/Mechanic/compare/v1.4.4...v1.4.5
[1.4.4]: https://github.com/Falkicon/Mechanic/compare/v1.4.3...v1.4.4
[1.4.3]: https://github.com/Falkicon/Mechanic/compare/v1.4.2...v1.4.3
[1.4.2]: https://github.com/Falkicon/Mechanic/compare/v1.4.1...v1.4.2
[1.4.1]: https://github.com/Falkicon/Mechanic/compare/v1.4.0...v1.4.1

# Mechanic roadmap

This roadmap distinguishes capabilities present in the repository from future work. It does not assign release versions or promise delivery dates. Component versions remain in their TOCs and `mechanic.__version__` (`desktop/src/mechanic/__init__.py`, read by `desktop/pyproject.toml`); historical release entries are in the [desktop changelog](../CHANGELOG.md) and the [addon changelog](../Mechanic/CHANGELOG.md).

## Implemented in the current tree

- Desktop setup and tool-status commands, configuration discovery, and a packaged local dashboard.
- A multi-addon diagnostic view with errors, tests, console output, libraries, and performance data.
- Shared client/account/character/profile selection for diagnostic queues and reads.
- A command schema catalog, dashboard forms, and audited mutation metadata for MCP clients.
- Release/sync previews, preflight checks, and partial-failure recovery guidance.
- Bounded desktop timing metrics and saved addon overhead snapshots.
- Isolated Python tests, Lua queue/lifecycle regressions, dashboard regressions, and configured GitHub Actions checks including installed-wheel smoke testing.
- Command input validation errors (`VALIDATION_ERROR`), bounded history, checksum-verified tool setup, and a restricted Lua sandbox for `sandbox.exec` and `sandbox.test`.
- Lua analyzers (`addon.deadcode`, `addon.security`, `addon.complexity`, `docs.stale`) built on a shared tokenizer, with truncation reporting.
- A modular dashboard (markup, CSS and separate scripts) driven by `commands.list` and `/health`.
- The hosted `afd` package as a dependency instead of a vendored copy.

These describe implementation, not proof of every live WoW or platform configuration. See [quality improvements and validation](../docs/quality-improvements.md).

## Next engineering priorities

| Work | Reason / reference |
|---|---|
| Consolidate bootstrap and main-addon fallback queue execution | Keep evaluation/serialization semantics aligned; retain the round-trip contract tests |
| Define and test the full supported SavedVariables grammar | Long-bracket strings, block comments, and assignment detection need explicit coverage |
| Coordinate concurrent writers and atomic file replacement | Avoid truncated queues/baselines and lost updates across processes |
| Remediate Python modernization debt incrementally | Keep the focused correctness baseline while reviewing broader rule groups |
| Validate platform-specific integrations | macOS path discovery and an AppleScript reload helper exist but are untested on a Mac; direct tool download is not implemented. See the [macOS plan](macos-support.plan.md) |
| Complete the deprecated-API database | `addon.deprecations` ships a small seed database and reports `DEPRECATION_DB_LIMITED`; regenerate it from `wow-ui-source` with `python -m mechanic.deprecations_builder` |
| Cover Retail 12.1.0 API data | Generated API definitions come from 12.0.1.64914; regenerate with `api.refresh` once a 12.1 source tree is available |

The [original quality review](../docs/quality-review-2026-09-05.md) contains the supporting findings and notes which have since been addressed.

## Product ideas to evaluate

- [Blizzard API compatibility workbench](compatibility-workbench.prd.md): proposed baseline inspection, guided native API checks, and evidence reports, extending the existing command and diagnostic workflow.
- A consolidated `mech doctor` health check (currently use `env.status` and `tools.status`).
- Richer desktop performance charts and lint-result presentation.
- Editor integration and additional addon templates.

Remote access/debugging would require a separate security design: the existing desktop server is intended for trusted local use.

## Contributing

See [CONTRIBUTING.md](../CONTRIBUTING.md), [AGENTS.md](../AGENTS.md), and the [plan directory](./). Plans in [Archive](Archive/) are historical context and may describe superseded behavior.

## Issue tracking (2026-11-01 closeout)

The next engineering priorities above are tracked in GitHub:

- [#11: SavedVariables grammar](https://github.com/Falkicon/Mechanic/issues/11)
- [#12: Atomic diagnostic queues and writer coordination](https://github.com/Falkicon/Mechanic/issues/12) (baseline replacement is already atomic)
- [#13: Shared queue execution](https://github.com/Falkicon/Mechanic/issues/13)
- [#14: Incremental Python modernization](https://github.com/Falkicon/Mechanic/issues/14)
- [#15: macOS setup and native validation](https://github.com/Falkicon/Mechanic/issues/15)
- [#16: Deprecated-API database coverage](https://github.com/Falkicon/Mechanic/issues/16)
- [#17: Retail 12.1 API definitions](https://github.com/Falkicon/Mechanic/issues/17)
- [#18: Product proposal triage and compatibility workbench](https://github.com/Falkicon/Mechanic/issues/18)

[#2: Windows setup](https://github.com/Falkicon/Mechanic/issues/2) remains open for native installer validation, library-architecture checks, current Visual Studio discovery, and reliable LuaRocks failure handling. Local runtime binaries and generated launchers are excluded from the source fix; a reproducible, architecture-consistent toolchain still needs validation.

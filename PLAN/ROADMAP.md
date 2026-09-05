# Mechanic roadmap

This roadmap distinguishes capabilities present in the repository from future work. It does not assign release versions or promise delivery dates. Component versions remain in their TOCs and `desktop/pyproject.toml`; historical release entries are in the [changelogs](../CHANGELOG.md).

## Implemented in the current tree

- Desktop setup and tool-status commands, configuration discovery, and a packaged local dashboard.
- A multi-addon diagnostic view with errors, tests, console output, libraries, and performance data.
- Shared client/account/character/profile selection for diagnostic queues and reads.
- A command schema catalog, dashboard forms, and audited mutation metadata for MCP clients.
- Release/sync previews, preflight checks, and partial-failure recovery guidance.
- Bounded desktop timing metrics and saved addon overhead snapshots.
- Isolated Python tests, Lua queue/lifecycle regressions, dashboard regressions, and configured GitHub Actions checks including installed-wheel smoke testing.

These describe implementation, not proof of every live WoW or platform configuration. See [quality improvements and validation](../docs/quality-improvements.md).

## Next engineering priorities

| Work | Reason / reference |
|---|---|
| Consolidate bootstrap and main-addon fallback queue execution | Keep evaluation/serialization semantics aligned; retain the round-trip contract tests |
| Define and test the full supported SavedVariables grammar | Long-bracket strings, block comments, and assignment detection need explicit coverage |
| Coordinate concurrent writers and atomic file replacement | Avoid truncated queues/baselines and lost updates across processes |
| Remediate Python modernization debt incrementally | Keep the focused correctness baseline while reviewing broader rule groups |
| Validate platform-specific integrations | macOS path discovery exists; setup, file picking, and reload behavior need further work. See the [macOS plan](macos-support.plan.md) |

The [original quality review](../docs/quality-review-2026-09-05.md) contains the supporting findings and notes which have since been addressed.

## Product ideas to evaluate

- A consolidated `mech doctor` health check (currently use `env.status` and `tools.status`).
- Richer desktop performance charts and lint-result presentation.
- Editor integration and additional addon templates.

Remote access/debugging would require a separate security design: the existing desktop server is intended for trusted local use.

## Contributing

See [CONTRIBUTING.md](../CONTRIBUTING.md), [AGENTS.md](../AGENTS.md), and the [plan directory](./). Plans in [Archive](Archive/) are historical context and may describe superseded behavior.

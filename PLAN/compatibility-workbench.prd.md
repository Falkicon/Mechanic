# PRD: Blizzard API compatibility workbench

Status: Proposed; not implemented by this document.

Date: 2026-09-06

Product: Mechanic, extending its existing addon and desktop tools

## Decision and problem

Add a compatibility workbench to Mechanic. Recent ActionHud development required repeated investigation of native aura widgets, opaque values, API availability, lifecycle behavior, and installed-checkout mismatches. Existing lint, sandbox, API lookup, and saved diagnostics answer parts of those questions, but do not present a single reproducible compatibility investigation.

The workbench should help addon authors collect evidence, run focused guided checks, and produce a useful support report. It must distinguish source compatibility, offline simulation, and behavior actually confirmed in WoW. It is not an automatic certification of taint or secret-value safety.

## Users and outcomes

- Addon authors investigating a patch regression or an API integration.
- Maintainers receiving reports from different builds, clients, characters, and profiles.
- Human and agent developers using the same structured commands and evidence.

A successful investigation identifies the target and source baseline, explains what was checked, preserves failed/unknown/skipped results, and gives a next step without requiring the author to assemble several unrelated logs manually.

## Existing foundation

Build on [API commands](../desktop/src/mechanic/commands/api.py), [definition management](../desktop/src/mechanic/commands/apidefs.py), [development checks](../desktop/src/mechanic/commands/development.py), [sandbox commands](../desktop/src/mechanic/commands/sandbox.py), and [target discovery](../desktop/src/mechanic/commands/targets.py). Follow the [diagnostic workflow](../docs/quality-improvements.md) and [agent command standards](../AGENTS.md).

Do not replace the existing queue, SavedVariables ownership, registry, or dashboard bridge. ActionHud is an initial integration case, not a runtime dependency. The feature must be useful for other registered addons.

## Required workflow

1. Select an explicit addon and diagnostic target. Show client/account/character/profile identity, client build when available, addon version, and source/installed path evidence. Unknown identity or revision remains unknown; never select by newest file.
2. Choose a compatibility area, initially native aura rendering, aura sounds, or duration/cooldown display.
3. Inspect the pinned definition baseline and public capability declarations. Separate a symbol's presence from proof that a particular call is permitted in the current context.
4. Run applicable isolated checks or prepare an opt-in live test. Display what it will execute or change before dispatch.
5. For live work, install/sync through the existing workflow, request reload, wait for the user's confirmation, then read saved output for the same target. A file watcher notification is not reload confirmation.
6. Present findings with evidence and next actions. Preview a redacted report that the user can export locally or copy into a bug report.

## Functional requirements

### Capability and configuration inspection

Record the API definition source, source revision/build, capture time, relevant addon configuration, and any explicitly obtained live capability observations. Label stale snapshots and differences between source and installed version. Keep cached/offline information visually distinct from live evidence.

Use allowlisted public metadata and adapter-provided configuration summaries. Do not traverse arbitrary native frames, serialize protected values, or infer combat state from widgets. A third-party addon without an adapter can still receive generic source/API checks; its internal configuration is reported as unavailable.

### Focused examples and guided checks

Provide versioned, reviewed examples showing supported native initialization, opaque duration passthrough, and enable/disable cleanup. Each example states its build baseline, expected visible behavior, cleanup steps, and offline limitations.

Examples run only through explicit test execution, preferably in an isolated test addon or an opt-in adapter. They do not patch production addons automatically. Live scenarios cover entering/leaving combat, deferred configuration, profile switching, repeated enable/disable, and reload. Stop and clean up test-owned resources safely if interrupted; defer protected cleanup when required.

### Evidence and report model

Each finding includes a stable check ID, scope, result, evidence kind, timestamp, baseline, and next step. Results distinguish pass, fail, skipped, and unknown. Evidence distinguishes source inspection, offline test, saved runtime output, and player-confirmed visual/audio observation.

No aggregate green badge may mean "combat safe." For example, a passing mocked aura test alongside an unperformed raid check must remain visibly incomplete. Historical snapshots are not current live state, and absence of captured errors is not proof of correct rendering.

Reports contain bounded relevant output, not full SavedVariables dumps. Preview redaction of account/character names, local paths, and unrelated configuration; preserve consistent anonymous target labels. Export is local and user initiated, with no automatic upload or telemetry. Include schema and check-pack versions so maintainers can compare reports over time.

## Command and UI contract

Commands come first and return typed `CommandResult` data with actionable error codes, messages, suggestions, and evidence metadata. The dashboard consumes these through the existing `/api/execute` bridge; MCP uses the same registered commands.

The following operations are proposed capabilities, not existing command names. Final naming must follow registry inspection during implementation:

| Operation | Behavior and mutation boundary |
| --- | --- |
| Inspect baseline/capabilities | Read-only; missing caches produce an actionable result without creating files or databases |
| Build a check plan | Read-only; returns scenarios, requirements, expected effects, and cleanup |
| Execute a selected check | Explicit mutation; may queue work, create test artifacts, or run a fixture |
| Read findings/preview report | Read-only; consumes an explicit target/snapshot and shows freshness |
| Export report | Explicit file mutation to a selected destination; no automatic publishing |

Audit every new command in [commands/catalog.py](../desktop/src/mechanic/commands/catalog.py). Queue/result correlation must retain the same target and run identity. Bound report size, retained history, and fixture lifetime. Read-only operations must not initialize data stores.

## Scope and exclusions

The MVP contains a baseline inspector, a native-aura check pack, and an evidence report. Add aura-sound and duration/cooldown check packs after that workflow is validated.

Excluded: unrestricted combat introspection, automatic repair of arbitrary addons, remote debugging, certification claims, automatic release publishing, a new general Lua executor, and a duplicate API database. Existing execution commands remain the underlying mechanism.

ActionHud's player-facing setup guidance remains in ActionHud and works without Mechanic. An optional adapter can contribute public configuration and user-confirmed test results using the same evidence vocabulary. Do not require both repositories to ship together.

## Delivery and acceptance

| Phase | Deliverable | Acceptance gate |
| --- | --- | --- |
| 1 | Typed evidence model and read-only inspection | Two diagnostic targets cannot mix; absent/stale build data stays explicit; inspection does not write files |
| 2 | Native-aura check pack and guided execution | Offline results cannot satisfy live gates; repeated/interrupted runs clean up owned resources and preserve target correlation |
| 3 | Dashboard findings and report preview/export | UI and MCP return equivalent findings; reports are bounded, redact identifying data, and preserve unknown/skipped results |
| 4 | Sound and duration packs; optional addon adapters | Supported and missing-API scenarios explain next steps; ActionHud remains independently usable |

Use isolated Python fixtures for schemas, target selection, stale evidence, redaction, mutation auditing, and export failures. Use Lua queue/lifecycle and dashboard regressions for their respective changes. Follow [CONTRIBUTING](../CONTRIBUTING.md) and the additional main-addon instructions when modifying that component. Live native behavior requires installed changes and confirmed reloads, followed by both open-world and instanced-combat checks.

MVP usability acceptance: a maintainer can use one exported report to determine the tested target/build, see which checks remain unperformed, and identify the next reproduction step without asking for an unrestricted database dump. No game reload is required to review this PRD.

## API provenance and open decisions

The motivating research used Blizzard-authored client source through the community-maintained Gethe mirror, 12.1.0 build 69587, commit `8ea15b61e45c0ed4eba01439c90757f86eb78d34`. Start from the [custom aura container](https://github.com/Gethe/wow-ui-source/blob/8ea15b61e45c0ed4eba01439c90757f86eb78d34/Interface/AddOns/Blizzard_AuraContainer/Blizzard_CustomAuraContainer.lua) and [aura API definitions](https://github.com/Gethe/wow-ui-source/blob/8ea15b61e45c0ed4eba01439c90757f86eb78d34/Interface/AddOns/Blizzard_APIDocumentationGenerated/UnitAuraDocumentation.lua). Revalidate every check pack against its declared target build; symbol existence alone is insufficient.

Before implementation, settle final command names, schema storage and retention, the minimum optional adapter contract, and how fixture installation is represented through existing preview/sync operations. Record installed revision only when independently available; do not assume a source checkout SHA describes the user's loaded addon.

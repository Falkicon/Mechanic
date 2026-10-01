---
name: using-mechanic
description: >
  Protocol for calling Mechanic MCP tools correctly: pick a diagnostic target,
  queue code, wait for the user's confirmed /reload, then read addon.output.
  Covers MCP-first rules, mutation and dry_run handling, and error codes. Load
  before any live in-game verification or any mutating Mechanic command.
  Triggers: diagnostic target, addon.output, reload, lua.queue, api.queue,
  TARGET_AMBIGUOUS, dry_run, MCP tools, verify in game.
---

# Using Mechanic (agent protocol)

This is the single home of the diagnostic-target and reload protocol. Other skills link here instead of repeating it.

## MCP first

- Call Mechanic MCP tools directly. Registry names use dots (`addon.output`); the MCP adapter exposes the same commands with dashes (`addon-output`). `fencore-*` are dashed in both.
- Do not run the `mech` CLI for agent work and do not use the shell as a substitute. The CLI is for people ([cli-commands](../k-mechanic/references/cli-commands.md)).
- If the Mechanic MCP server is unavailable, say so. Fall back to source inspection and offline checks (tests, lint) and never claim they verified installed game state.
- The command list, inputs, defaults and mutation flags are generated from the registry: [afd-commands](references/afd-commands.md). `commands.list` returns the same data live; trust it over any prose.

## Diagnostic target

SavedVariables and queue files belong to one client / account / character / profile. Commands that read or write them take an optional `target` object.

1. Call `diagnostic.targets`. Each entry has `client`, `account`, `character`, `profile`, `sv_path`, `addon_path`.
2. Choose one (ask the user when several plausibly match) and pass the **same** object as `target` to every related call: `lua.queue`, `api.queue`, `lua.results`, `addon.output`, `sv.parse`, `diagnostic.metrics` and the `fencore-*` commands.
3. Omitting `target` only works when exactly one candidate exists. Otherwise the command fails with `TARGET_AMBIGUOUS` (several matches) or `TARGET_NOT_FOUND`; `error.details.candidates` lists the options. Never pick a profile or client by newest file or first match.
4. `diagnostic.metrics` with a `target` also returns that target's last saved overhead snapshot.

## Reload protocol (live verification)

An edit in a worktree does not change the installed addon, and file-watcher events do not prove a reload finished.

1. Make the change and complete the offline checks first (`addon.lint`, `addon.test`/`sandbox.test`, the repo's regression harnesses).
2. Make sure the installed addon is the changed code (junction links via `addon.sync`, or the user copies/links it). Documentation-only changes need no reload.
3. To run code in game: `lua.queue` (or `api.queue`) with the selected `target`. The queue is written into that client's `!Mechanic` addon and runs on the next load.
4. **Ask the user to `/reload`, then wait for their explicit confirmation.** Do not infer completion from elapsed time or watcher events. `reload.trigger` does not exist; the dashboard Reload button only shows instructions.
5. Only then read results: `addon.output` with `agent_mode=true` and the same `target` (also covers Lua eval results), or `lua.results` for just the queue results.
6. Check freshness: `addon.output` reports the profile's last sync time (else the last Lua eval run). Older than your reload means the reload has not been captured yet; ask the user again rather than guessing. A `BUGGRABBER_UNREADABLE` warning means the error list could not be read.
7. State what was and was not verified in game.

## Mutating commands

Read-only commands are safe to call freely. Mutating commands (flag in the reference) change files, git state, launch things or execute code.

- `release.all`, `addon.sync`, `libs.sync` and `assets.sync` support `dry_run`. **Always run `dry_run: true` first**, show the plan to the user, and run the real call only after they confirm.
- Never run `git.commit`, `git.tag`, `version.bump`, `changelog.add`, `release.all` (real run), `api.download` or `research.query` (network) unless the user asked for that action.
- `sandbox.exec` and `sandbox.test` run Lua in a restricted environment (whitelisted globals, no `os`/`io`/`require`/`load*`, 30s timeout, 256KB output cap, memory not limited).
- `addon.test` runs Busted with the addon's own code; treat it as code execution.
- The `perf.*` commands are flagged mutating even when they only read.

## Errors and warnings

Results are `{success, data, error, warnings, reasoning}`. Failures carry `error.code`, `error.message` and `error.suggestion`; follow the suggestion.

| Code | Meaning |
|---|---|
| `TARGET_AMBIGUOUS` / `TARGET_NOT_FOUND` / `TARGET_READ_ERROR` | Target selection failed; see `error.details.candidates` and call `diagnostic.targets` |
| `VALIDATION_ERROR` | Invalid input; `error.details.errors` lists `field`, `message`, `type` |
| `ADDON_NOT_FOUND` | Addon name or `path` wrong; addons are looked up in the configured `_dev_` folder |
| `NOT_RUNNING` | `server.shutdown` was called outside a dashboard process |
| `CATALOG_NOT_FOUND` | FenCore did not register a catalog in the selected MechanicDB (load FenCore, `/reload`) |
| `INVALID_CATEGORY` | Unknown value in an analyzer's `categories` input |

Warnings worth acting on: `DEPRECATION_DB_LIMITED` (the deprecation database is incomplete; see [s-audit](../s-audit/SKILL.md)).

## Pick the right tool

| Goal | Tools |
|---|---|
| Environment and tool status | `env.status`, `tools.status` |
| Static quality | `addon.validate`, `addon.lint`, `addon.format` (`check=true` to only check), `addon.security`, `addon.complexity`, `addon.deadcode`, `addon.deprecations`, `docs.stale`, `locale.validate` |
| Offline tests | `sandbox.test` (Core layer), `addon.test` (Busted) |
| Live game evidence | `diagnostic.targets`, `lua.queue`, `api.queue`, `addon.output`, `lua.results` |
| WoW API lookup (offline) | `api.search`, `api.info`, `api.list`, `api.stats` |
| Releases | `addon.validate`, `release.all` (dry run first) |
| Dashboard / process | `dashboard.metrics`, `diagnostic.metrics`, `server.shutdown` |

More: [k-mechanic](../k-mechanic/SKILL.md) (architecture), [k-ecosystem](../k-ecosystem/SKILL.md) (components), [s-debug](../s-debug/SKILL.md) (evidence-based debugging).

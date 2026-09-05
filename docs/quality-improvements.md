# Diagnostic and command quality improvements

These changes build on the [September 2026 review](quality-review-2026-09-05.md).

## Select a diagnostic target

Call `diagnostic.targets` to discover client, account, character, and profile combinations. Pass the same `target` object to `lua.queue`, `api.queue`, `lua.results`, `addon.output`, and `sv.parse`. Successful responses include the selected identity and file paths.

```json
{
  "target": {
    "client": "C:/Games/World of Warcraft/_retail_",
    "account": "ACCOUNT",
    "character": "Hero - Realm",
    "profile": "Raid"
  },
  "code": ["return 42"],
  "labels": ["answer"]
}
```

The example is input for `lua.queue`; use values returned by discovery. Omitting a target works only when exactly one candidate matches. `TARGET_AMBIGUOUS` and `TARGET_NOT_FOUND` include candidates instead of selecting the newest file or first profile. The dashboard uses the same discovery command and selector.

Queue files belong to a client installation. The bootstrap checks the current character and profile before executing a targeted queue. WoW does not expose the account directory to the addon, so account selection routes the desktop file read but cannot independently authenticate an account at runtime. Profiles can be shared by characters; saved results remain profile data, not an independent per-character archive.

After installing addon changes, reload WoW and confirm completion before asking an agent to read `addon.output`. File watcher updates are notifications, not confirmation that an in-game reload has completed. Offline contract tests generate a real queue, execute the bootstrap with Lua, serialize SavedVariables, then read results through the Python commands.

## Inspect commands and preview changes

`commands.list` exposes registered input/output JSON schemas, descriptions, defaults, and audited `mutation` flags. The dashboard builds its command forms from this catalog; raw JSON remains available for complex inputs. Commands that can write files, execute code, or launch an action remain marked mutating even when they support a preview. Both MCP transports use the command registry's mutation classification.

Use `dry_run: true` with `release.all`, `addon.sync`, and `libs.sync` to inspect their plans. Release preflight checks repository state and tag conflicts before changing version/changelog files. A failed multi-step operation reports completed work and recovery guidance. These operations are not transactions: previews do not reserve the filesystem or Git state, and partial changes are not automatically rolled back.

## Measure Mechanic's overhead

`diagnostic.metrics` returns process-local command and parser timing, failure and in-flight counts, uptime, available HTTP task/socket counts, and history database sizes/row counts. Timing samples and metric series are bounded. No command inputs, results, or file contents are retained in timing metrics, and no new polling timer is introduced.

Supply an explicit target to include its last saved addon overhead snapshot. This reports known performance/inspection ticker state and hub/UI timing; it is not a live or exhaustive count of every timer in WoW. Runtime data is marked unavailable when its HTTP server is not running in the current process. Metadata and overhead reads do not add command-history rows.

## Reproduce validation

From `desktop/`, install development dependencies with `python -m pip install -c constraints-dev.txt -e ".[dev]"`, then run `pytest -v`. Tests isolate configuration, data, and discovery from a developer's installed WoW clients. Set `MECHANIC_LUA` to a Lua 5.1 executable to run the real bootstrap contract; Linux CI provisions that runtime.

CI checks supported Python versions, focused Python correctness lint and formatting, Lua lint/lifecycle behavior, dashboard regressions, and a wheel installed in a separate environment. Development constraints pin direct tooling and dependencies; they are not a complete transitive dependency lock. The broader Python modernization inventory remains recorded in the original review.

The offline Lua environment models the APIs needed by its contracts. It cannot validate WoW rendering, protected API behavior, or live SavedVariables timing.

## Verified locally on 2026-09-05

- 243 Python tests passed on Python 3.13.12, with MCP 1.28.1 and a real Lua 5.1 runtime; no skips. This includes fresh-process checks that read-only commands create neither data directories nor databases.
- Both Node dashboard regression suites and both standalone Lua lifecycle/overhead harnesses passed.
- Focused Ruff correctness checks and formatting passed across desktop source/tests. Local Luacheck reported no warnings/errors across 258 first-party Lua files.
- Rebuilt the final wheel, installed it into a separate environment, verified the package imports from that environment, and served both dashboard assets with HTTP 200.
- The GitHub Actions matrix has been configured but was not run remotely. In-game behavior remains unverified until this worktree is installed and a reload is confirmed.

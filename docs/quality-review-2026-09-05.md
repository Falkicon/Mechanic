# Repository quality review — 2026-09-05

This review covered first-party addon lifecycle and queue processing, the desktop command registry and transports, persistence, configuration, parsing, command inputs, dashboard behavior, packaging, and tests. Embedded libraries, generated API definitions, binary dependencies, and pre-existing worktree edits were preserved. This is a prioritized engineering review, not an exhaustive audit of every generated or vendored line.

## Findings addressed

| Area | Defect and resulting change |
| --- | --- |
| MCP startup | Hyphenated command names generated invalid Python functions. Required fields and factory defaults also produced incorrect signatures. Registration now supports these cases and preserves defaults per request. |
| Local command bridge | Foreign browser origins and arbitrary Host headers could reach a command-capable local service. HTTP and WebSocket requests now enforce the local host and same-origin boundary. This is a local-only boundary, not authentication for a remotely exposed deployment. |
| Request integrity | Malformed execute payloads could crash history handling after dispatch. Typed envelopes reject them before execution; history limits are bounded. SQLite history failures no longer disguise an already-completed command as a failed command. |
| Connection lifecycle | One dead WebSocket could prevent delivery to healthy clients. Broadcasts isolate failed clients and bound stalled sends. Watcher stop now wakes idle watches. |
| Service supervision | Server exits could leave the supervisor waiting indefinitely, and KeyboardInterrupt could create another set of services. Existing tasks now shut down, cancel, and drain through one supervisor. |
| Dashboard resilience | Reconnect with capped backoff after WebSocket disconnects, use `wss` for HTTPS, and recover from malformed persisted addon data. |
| SQLite | Connection context managers committed transactions but did not close connections. All storage operations now close them deterministically. |
| Configuration | Project dotenv files overrode explicit process environment variables; custom data directories were not created. Precedence and directory initialization are corrected, and non-object config JSON is ignored. |
| Packaging | Wheels omitted the dashboard, making server import fail outside the source checkout. The existing dashboard directory is now packaged as `mechanic.dashboard` and resolved as a package resource. |
| Performance baselines | Addon names could escape the baseline directory through path separators. Unsafe names are rejected; addon names containing `_baseline` are listed correctly. |
| Queue serialization | API parameter text and Lua snippet labels could break generated Lua. Values are encoded as data, unsupported parameter values receive structured errors, and queue selection ignores clients without an installed addon. |
| API search | Regex metacharacters in a documented wildcard search could cause exceptions or overly broad matches. Only `*` and `?` retain wildcard meaning. |
| Lua result contract | Bootstrap stored label-keyed raw values while the desktop expected an ordered `results` array and `lastRun`. The bootstrap now writes that envelope, preserves duplicate labels, and stores bounded textual values instead of cyclic tables/functions. |
| Addon lifecycle | Closing the main window skipped module cleanup, leaving polling and inspector handlers active. Parent visibility now forwards module lifecycle callbacks. Performance auto-refresh honors its saved preference. Settings uses the correct locale namespace. |
| SavedVariables parser | Repeated suffix copies made large numeric tables expensive. Regexes scan by position; quoted Lua escapes decode correctly; truncated tables and missing key delimiters raise errors instead of returning partial tables. |

## Remaining priorities

Follow-up: shared diagnostic targets, release previews/recovery, command schema forms/mutation metadata, and the focused CI lint baseline below have since been implemented. See [quality improvements](quality-improvements.md) for the current workflow and validation. The findings below preserve the state at the original review; queue executor consolidation, full Lua grammar coverage, and atomic writer coordination remain future work.

1. **P2 — Define one client/profile identity for diagnostic reads and writes.** Bootstrap explicitly selects `profiles.Default` (`!Mechanic/Bootstrap.lua`, database initialization); `commands/core.py` also flattens Default, while `commands/lua.py:get_lua_results` returns the first discovered file. With multiple clients/accounts or a non-default AceDB profile, reads can report another session's results. Introduce a shared explicit client/account/profile selector and migration/compatibility tests before changing these contracts.
2. **P2 — Consolidate queue execution semantics.** Bootstrap and `Mechanic/Core.lua:ProcessLuaEvalQueue` maintain separate evaluators and serializers. The normal bootstrap path is fixed here; the fallback still differs for statement snippets. A shared, independently testable executor should own both paths.
3. **P2 — Specify release failure recovery.** `commands/release.py:release_all` modifies version/changelog before commit and tag steps. A later failure leaves a partial release; an existing tag is accepted without checking that it points at the intended commit. Preflight checks and a result containing completed steps would make recovery reliable. Blind rollback would risk deleting legitimate user edits.
4. **P2 — Define the supported SavedVariables grammar.** `parsers.py:parse_savedvariables` still locates assignments with a multiline regex, and the value parser does not support long-bracket strings or block comments. Assignment-looking text inside multiline values can be misidentified. A tokenized parser and fixture corpus are preferable to continuing ad hoc regex extensions.
5. **P3 — Strengthen persistence under interruption/concurrency.** `commands/perf.py:_save_baseline` and queue writers overwrite files directly. A crash or another process writing concurrently can truncate or lose data. Atomic replacement plus explicit writer coordination should be designed across commands; atomic replacement alone does not prevent lost updates.
6. **P3 — Reduce architectural duplication incrementally.** Command metadata, descriptions, and defaults are repeated in the large dashboard script. A schema-driven command form would reduce drift. Several mutating commands also retain the registry's default `mutation=False`; audit these annotations before relying on them for permissions or client hints.
7. **P3 — Establish a reproducible lint baseline.** The installed Ruff version reports substantial existing modernization/style debt, while focused correctness rules pass. Avoid mixing a broad automated rewrite with functional fixes; pin the lint tool/configuration and remediate rule groups separately.

The existing pragmatic addon module structure does not justify a wholesale layer rewrite. Shared protocol contracts, lifecycle ownership, and deterministic tests offer more immediate value.

## Validation and limits

- Original Python suite: 154 passed before the review fixes.
- An existing performance test wrote synthetic `TestAddon` samples to the user's configured baseline history before its side effect was identified. It now uses a temporary directory. Existing history was not deleted or rewritten to guess which older samples belonged to tests. CLI documentation tests also now use temporary outputs; their generated date-only change to tracked documentation was reverted.
- Real MCP library registration and schema listing: all 57 commands registered.
- Built a wheel, installed it into a separate environment, and served `/dashboard/` with HTTP 200 using assets from site-packages.
- Offline Lua 5.1 lifecycle/result-contract regression harness passed; four changed addon files passed Luacheck with zero warnings/errors.
- Node dashboard regression harness passed, covering persisted-data recovery, WebSocket backoff, HTTPS, malformed messages, and unload cleanup. The Lua and dashboard harnesses are now wired into CI; CI itself was not run remotely.
- Synthetic parser benchmark, median of three local runs: a 30,000-field, 548 KB table decreased from 0.3872 s to 0.0395 s (about 9.8× faster). A 10,000-field table decreased from 0.0499 s to 0.0124 s. This measures parsing only, not in-game frame time.
- Final Python suite: **203 passed** (49 additional test cases). Python formatting and focused Ruff correctness rules (`E4,E7,E9,F`) pass. Unrestricted Ruff still reports **962 findings** across existing modernization/style rules; the full lint gate is not clean.
- Mechanic MCP tools were unavailable in this Codex session. Offline code tests and local transport registration were used; no live `addon.output` call was made.
- The worktree is separate from the installed WoW addon. In-game behavior remains unverified until these files are installed and the user confirms `/reload` completion.

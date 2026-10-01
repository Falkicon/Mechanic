---
name: s-audit
description: >
  Quality audit for WoW addons using Mechanic's static analyzers: security
  (combat lockdown, secret values, taint), complexity, deprecated APIs and dead
  code. Explains categories, limits, truncation and how far to trust each result.
  Triggers: audit, quality, security scan, complexity, deprecations, secret
  values, taint, static analysis.
---

# Auditing WoW Addons

Guidance for running and interpreting the four analyzers. All are read-only; call them through MCP (see [using-mechanic](../using-mechanic/SKILL.md)).

## Related Commands

- [c-audit](../../commands/c-audit.md) - Full audit workflow
- [c-review](../../commands/c-review.md) - Full review (lint, audit, tests, debug, clean)
- [c-clean](../../commands/c-clean.md) - Dead code and stale docs cleanup
- [c-lint](../../commands/c-lint.md) - Luacheck and StyLua only (no analyzers)

## MCP Tools

| Task | MCP Tool |
|------|----------|
| Security | `addon.security(addon="MyAddon")` |
| Complexity | `addon.complexity(addon="MyAddon")` |
| Deprecations | `addon.deprecations(addon="MyAddon")` |
| Dead code | `addon.deadcode(addon="MyAddon")` |

Common inputs: `addon`, `path` (override folder), `categories` (list; an unknown name fails with `INVALID_CATEGORY`), `include_suspicious` (deadcode/security; `false` keeps only higher-confidence findings), `limit` (default 200, max 2000).

## Reading results

- Findings are capped at `limit`, most severe first. Check `truncated` and `total_issues` before concluding anything; `summary` counts cover all issues. Raise `limit` or filter `categories` to see the rest.
- `read_errors` lists files that could not be read; a clean result with read errors is not clean.
- The analyzers use a Lua tokenizer (comments and strings are not code), skip `Libs/` (case-insensitive, relative to the addon root) and hidden folders.
- Every finding has a confidence (`definite`, `likely`, `suspicious`). Static analysis cannot see dynamic access (`_G[name]`, event names built at runtime, XML-registered handlers), so verify before deleting or "fixing".

## Categories

### Security (`addon.security`)

| Category | Meaning |
|---|---|
| `combat_violation` | Protected call without an `InCombatLockdown()` guard (low confidence by design: guards are often in callers) |
| `secret_leak` | Values from APIs known to return secrets (12.0+) that are stored, logged or reused |
| `taint_risk` | Globals created through `_G`/`rawset(_G, ...)` or without an addon namespace prefix |
| `unsafe_eval` | `loadstring`/`RunScript` with variable input, addon messages executed directly |
| `addon_comm` | Unvalidated addon-message parsing |

### Complexity (`addon.complexity`)

| Category | Default threshold (input) |
|---|---|
| `deep_nesting` | more than 5 nested blocks (`max_nesting`) |
| `long_function` | more than 100 lines (`max_function_lines`) |
| `long_file` | more than 500 lines (`max_file_lines`) |
| `magic_number` | numeric literals of 10 or more outside obvious contexts |
| `duplicate_code` | near-identical blocks of 10+ code lines |

### Deprecations (`addon.deprecations`)

Inputs: `category`, `min_severity` (`info` / `warning` / `error`). The database ships as `resources/deprecated_apis.json`. **It is currently a 3-API seed** (`GetAddOnInfo`, `IsAddOnLoaded`, `LoadAddOn` -> `C_AddOns.*`) with `"complete": false`, and the command then returns the warning `DEPRECATION_DB_LIMITED`. A clean result means only "none of the known deprecated APIs", not "no deprecated APIs". For anything else, consult Blizzard's `Blizzard_Deprecated` source ([s-research](../s-research/SKILL.md)) and the addon-dev-guide. The database is regenerated with `python -m mechanic.deprecations_builder <wow-ui-source path>`; that step is pending a maintainer decision, so check `database_version` in the result (`seed-1` or `fallback` means the limited seed).

### Dead code (`addon.deadcode`)

`unused_function`, `unused_local`, `orphaned_file` (Lua file not in the TOC), `dead_export` (referenced only inside its own file), `unused_library`, `stale_event`, `unused_locale`, `unreachable_code`, `commented_code`.

## Workflow

Quick: `addon.security`, then `addon.deprecations(min_severity="error")`, report. Full: security, complexity, deprecations, deadcode, then one prioritized report. Always state `truncated`/`total_issues` and the deprecation DB caveat.

## Priority

1. Critical: confirmed secret leaks, real combat-lockdown violations, deprecated APIs with `severity: error`.
2. High: taint risks, orphaned files, deprecated APIs with `warning`.
3. Medium: deep nesting, long functions/files, magic numbers.
4. Low: duplicates, `suspicious` dead code, commented-out code.

Run before a release; verify each critical finding by reading the code, and by game evidence where behaviour is in question ([s-debug](../s-debug/SKILL.md)).

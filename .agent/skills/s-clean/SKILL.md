---
name: s-clean
description: >
  Find and remove dead code and stale documentation with addon.deadcode and
  docs.stale. Covers orphaned files, unused functions/locals/libraries, dead
  links and version drift, with confidence triage before deleting anything.
  Triggers: clean, dead code, unused, orphan, stale docs, cruft, maintenance.
---

# Cleaning WoW Addons

Guidance for finding and removing cruft safely. Both analyzers are read-only; removing things is your job and must be verified.

## Related Commands

- [c-clean](../../workflows/clean.md) - Cleanup workflow
- [c-review](../../workflows/review.md) - Full review (includes the clean step)

## MCP Tools

| Task | MCP Tool |
|------|----------|
| Dead code | `addon.deadcode(addon="MyAddon")` |
| High-confidence only | `addon.deadcode(addon="MyAddon", include_suspicious=false)` |
| Stale docs | `docs.stale(addon="MyAddon")` |

Inputs: `addon`, `path`, `include_suspicious`, `limit` (default 200, max 2000), plus `categories` for deadcode and `commits_threshold` (default 10) for docs.stale. Check `truncated`, `total_issues` and `read_errors` in every result: a capped or partly unreadable result is not a complete cleanup list.

## Detection categories

### `addon.deadcode`

| Category | Description |
|---|---|
| `orphaned_file` | Lua file not listed in the TOC (or loaded by XML) |
| `unused_function` | Function defined but never referenced |
| `unused_local` | Local assigned but never read |
| `unused_library` | Library under `Libs/` nothing uses |
| `stale_event` | Event registered while the OnEvent handler is empty |
| `dead_export` | Exported value referenced only inside its own file |
| `unused_locale` | Locale key never used |
| `unreachable_code` | Statements after `return`/`break` in the same block |
| `commented_code` | Large commented-out blocks |

### `docs.stale`

| Category | Description |
|---|---|
| `dead_link` | Link to a file that does not exist |
| `dead_reference` | Mention of a function or file that does not exist |
| `version_drift` | Old version numbers (code blocks and CHANGELOG/HISTORY files are ignored) |
| `relative_staleness` | Doc not updated while many code commits landed |

## Workflow

1. Run `addon.deadcode` with `include_suspicious=false`; fix `definite` and `likely` items first.
2. Before deleting a function, search the repository for dynamic use (`_G[...]`, string-built names, XML scripts, TOC, `hooksecurefunc` targets, MechanicLib capabilities, SavedVariables migrations).
3. Remove in small steps, run `addon.lint` and the tests after each group.
4. Run `docs.stale`; fix dead links and drifted versions, then re-run both analyzers to confirm.
5. For anything user-visible, verify in game with the reload protocol ([using-mechanic](../using-mechanic/SKILL.md)).

## Confidence

| Level | Meaning | Action |
|---|---|---|
| `definite` | Provable (for example a file not in any TOC) | Safe after a quick look |
| `likely` | Strong static evidence | Review briefly |
| `suspicious` | Possible dynamic use | Verify manually |

The analyzers do not honour suppression comments; record intentional dead code in the review notes instead. Rerun `docs.stale` after refactors.

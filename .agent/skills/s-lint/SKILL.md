---
name: s-lint
description: >
  Lint and format WoW addon Lua with Luacheck and StyLua through addon.lint and
  addon.format. Covers common warning codes, the repository .luacheckrc,
  StyLua defaults and how lint relates to the static analyzers. Triggers: lint,
  format, style, luacheck, stylua, warnings, code style.
---

# Linting WoW Addons

Guidance for code quality and formatting. Call the MCP tools directly ([using-mechanic](../using-mechanic/SKILL.md)).

## Related Commands

- [c-lint](../../workflows/lint.md) - Lint and format workflow
- [c-review](../../workflows/review.md) - Full code review (includes lint)
- [c-audit](../../workflows/audit.md) - Security, complexity, deprecation and dead-code analysis (not part of lint)

## MCP Tools

| Task | MCP Tool |
|------|----------|
| Lint | `addon.lint(addon="MyAddon")` (read-only) |
| Check formatting only | `addon.format(addon="MyAddon", check=true)` (read-only in effect) |
| Format (rewrites files) | `addon.format(addon="MyAddon")` |

`addon.lint` and `addon.format` run in the addon folder, so the addon's `.luacheckrc` / `stylua.toml` apply. If the tools are missing, `tools.status` reports it (`mech setup` installs them for the user). Security, complexity and dead-code analysis live in the analyzers: [s-audit](../s-audit/SKILL.md), [s-clean](../s-clean/SKILL.md).

## Workflow

1. `addon.format(check=true)` to see what would change; then `addon.format` if the diff is only style.
2. `addon.lint`; fix real problems (undefined globals are usually typos or missing `read_globals`).
3. Re-run `addon.lint` to confirm. Do not reformat whole files you are not otherwise changing.

## Common Luacheck warnings

| Code | Meaning | Fix |
|------|---------|-----|
| W111 | Setting undefined global | Fix the typo or declare it in `globals` |
| W112 | Mutating undefined global | Same as W111 |
| W113 | Accessing undefined global | Check the API exists; add to `read_globals` |
| W211 | Unused local variable | Remove it or prefix with `_` |
| W212 | Unused argument | Prefix with `_` (for example `_event`) |
| W213 | Unused loop variable | Prefix with `_` |
| W311 | Value assigned but never used | Remove the assignment or use the value |
| W431 | Shadowing upvalue | Rename the local |

## Configuration in this repository

- The root `.luacheckrc` is the central config: `std = "lua51"`, `max_line_length = 120`, `codes = true`, plus the WoW, Ace3 and FenUI globals. CI runs `luacheck "!Mechanic/" "Mechanic/" --config .luacheckrc`.
- `_TemplateAddon/TemplateAddon/.luacheckrc` is a standalone per-addon starting point (`std = "lua51"`, `max_line_length = 160`, ignores W212/W213, `Libs/` excluded). Per-addon configs list their own `globals` (addon table, SavedVariables) and `read_globals` (WoW API, libraries).
- `std = "lua51"` is required: addon Lua is 5.1, so `goto`, `bit32` and `//` are errors.
- There is no `stylua.toml` in this repository, so StyLua uses its defaults, which match this code style: tabs, 4-wide, 120 columns, `AutoPreferDouble` quotes, `call_parentheses = "Always"`, Unix line endings. Add a `stylua.toml` to an addon only to deviate from them.
- `Libs/` (third-party and vendored libraries) must stay excluded from both tools.

## Best practices

1. Lint before commit.
2. Keep `read_globals` honest: add only APIs you actually call, and prefer modern `C_` APIs ([api-patterns](../s-develop/references/api-patterns.md)).
3. Prefix intentionally unused variables with `_`.
4. Treat lint as necessary, not sufficient: it proves nothing about in-game behaviour.

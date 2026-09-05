# Mechanic agent entry point

Follow [AGENTS.md](AGENTS.md) for repository layout, command standards, testing, and MCP usage. Main-addon changes also follow [Mechanic/AGENTS.md](Mechanic/AGENTS.md). Keeping shared workflow rules there avoids conflicting copies.

## Diagnostic workflow

Use connected Mechanic MCP tools directly. Discover a target with `diagnostic.targets` and use the same client/account/character/profile selector for queueing and reading results. MCP tool names may use dashes (`diagnostic-targets`, `addon-output`) while the registry uses dots.

After addon changes are installed, ask the user to `/reload`, wait for explicit completion, then read `addon.output` with `agent_mode: true` and the selected target. Worktree-only changes and offline tests do not prove live game behavior. Documentation-only changes require no game reload.

## Addon constraints

- Target Lua 5.1-compatible syntax; avoid `goto`, `bit32`, and newer Lua-only features.
- Follow the addon's combat-lockdown and secret-value handling patterns.
- Keep desktop features behind typed commands; register mutation metadata and expose them through the shared command bridge.

## Repository skills and references

The checked-in skills use names such as `k-mechanic`, `k-ecosystem`, `s-develop`, `s-debug`, `s-test`, `s-research`, and `s-release` under [.claude/skills](.claude/skills/). Read the matching `SKILL.md` when applying one; do not assume older skill names still exist.

The [command snapshot](.claude/skills/using-mechanic/references/afd-commands.md) is a reference document, not an installed `using-mechanic` skill. `commands.list` supplies current schemas and mutation metadata.

# Mechanic agent entry point

Follow [AGENTS.md](AGENTS.md) for repository layout, command standards, testing, and MCP usage. Main-addon changes also follow [Mechanic/AGENTS.md](Mechanic/AGENTS.md). Keeping shared workflow rules there avoids conflicting copies.

## Diagnostic workflow

Use connected Mechanic MCP tools directly. The full protocol lives in the `using-mechanic` skill ([SKILL.md](.claude/skills/using-mechanic/SKILL.md)): discover a target with `diagnostic.targets` and use the same client/account/character/profile selector for queueing and reading results. MCP tool names use dashes (`diagnostic-targets`, `addon-output`) while the registry uses dots.

After addon changes are installed, ask the user to `/reload`, wait for explicit completion, then read `addon.output` with `agent_mode: true` and the selected target. Worktree-only changes and offline tests do not prove live game behavior. Documentation-only changes require no game reload. Run `dry_run` first for `release.all`, `addon.sync`, `libs.sync` and `assets.sync`, and confirm with the user before the real call.

## Addon constraints

- Target Lua 5.1-compatible syntax; avoid `goto`, `bit32`, and newer Lua-only features.
- Follow the addon's combat-lockdown and secret-value handling patterns (`issecretvalue`).
- Keep desktop features behind typed commands; register mutation metadata in `commands/catalog.py` and expose them through the shared command bridge.

## Repository skills and references

The checked-in skills live in [.claude/skills](.claude/skills/): `using-mechanic` (protocol), `k-ecosystem`, `k-mechanic`, `k-desktop`, `k-apidefs`, `k-fenui`, `k-fencore`, `k-docs`, `k-create-skill`, and the action skills `s-audit`, `s-clean`, `s-debug`, `s-develop`, `s-lint`, `s-release`, `s-research`, `s-test` (each with a `c-*` command in [.claude/commands](.claude/commands/)). Read the matching `SKILL.md` when applying one; do not assume older skill names (such as `s-working`) still exist. [.claude/AGENTS.md](.claude/AGENTS.md) explains the system.

`.claude/` is canonical. The `.agent/` tree and the [command reference](.claude/skills/using-mechanic/references/afd-commands.md) are generated (`python .claude/sync_ide.py`, `python .claude/gen_command_reference.py`) and checked by `desktop/tests/test_agent_docs.py`; never edit them by hand. `commands.list` supplies current schemas and mutation metadata.

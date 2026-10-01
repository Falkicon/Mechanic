## Summary

<!-- Brief description of the changes (1-2 sentences) -->

## Motivation

<!-- What problem does this solve? What use case does it enable? -->

## Changes

<!-- List the key changes made -->

- 

## Testing

<!-- How did you verify this works? -->

- [ ] Tested manually in WoW (after a confirmed `/reload`)
- [ ] Tested via CLI (`mech call ...`)
- [ ] Ran `pytest`, `ruff check` and `ruff format --check` from `desktop/` (if desktop changes)
- [ ] Ran the `tests/*_regressions.lua` / `.cjs` harnesses (if addon or dashboard changes)
- [ ] Offline checks only (state which, and that in-game behavior is unverified)

## Checklist

- [ ] Code follows the [command-first patterns](../CONTRIBUTING.md#core-principle-command-first-development) (if adding commands)
- [ ] Input/output schemas have descriptions and the command is classified in `commands/catalog.py`
- [ ] Documentation updated (AGENTS.md, README, `docs/cli-reference.md` via `mech docs` if needed)
- [ ] CHANGELOG.md updated (for user-facing changes; addon changes go in `Mechanic/CHANGELOG.md`)

## Related Issues

<!-- Link any related issues: Fixes #123, Related to #456 -->


Build or extend addon features following architecture best practices.

**Skill**: [s-develop](../skills/s-develop/SKILL.md)

1. **Understand**: Review the existing addon structure and identify where changes belong.
2. **Design**: Plan the implementation following the Core/Bridge/View layer pattern.
3. **Implement**: Write Lua 5.1 code following WoW addon patterns (events, frames, SavedVariables); no `goto`, `bit32` or `//`.
4. **Integrate**: Connect new code to existing systems using appropriate hooks.
5. **Check offline**: `addon.validate`, `addon.lint` and the tests (`sandbox.test` / `addon.test`).
6. **Verify in game**: Follow the reload protocol in [using-mechanic](../skills/using-mechanic/SKILL.md): `diagnostic.targets`, ask the user to `/reload`, wait for confirmation, then `addon.output` with the same target. Skip this only for documentation-only changes.
7. **Report**: Summarize the changes, architectural decisions, and what was verified (offline versus in game).

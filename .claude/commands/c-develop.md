Build or extend addon features following architecture best practices.

**Skill**: [s-develop](../skills/s-develop/SKILL.md)

1. **Understand**: Review the existing addon structure and identify where changes belong.
2. **Design**: Plan the implementation following the Core/Bridge/View layer pattern.
3. **Implement**: Write code following WoW addon patterns (events, frames, SavedVariables).
4. **Integrate**: Connect new code to existing systems using appropriate hooks.
5. **Test**: Ask the user to `/reload` in WoW, wait for confirmation, then call `addon.output` to verify.
6. **Report**: Summarize the changes made and any architectural decisions.

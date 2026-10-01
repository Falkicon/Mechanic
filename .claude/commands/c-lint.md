Run Luacheck and StyLua to ensure code quality and consistency.

**Skill**: [s-lint](../skills/s-lint/SKILL.md)

1. **Lint**: Run `addon.lint` for syntax errors and undefined globals.
2. **Format check**: Run `addon.format` with `check=true` to see what would change.
3. **Format**: Run `addon.format` to apply the style fixes when the diff is only formatting.
4. **Fix**: Resolve remaining lint issues that cannot be auto-fixed.
5. **Verify**: Run `addon.lint` again to confirm the code is clean.
6. **Report**: Summarize findings to the user. For security, complexity, deprecation and dead-code analysis use [c-audit](c-audit.md).

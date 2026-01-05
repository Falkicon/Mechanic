Run Luacheck and StyLua to ensure code quality and consistency.

**Skill**: [s-lint](../skills/s-lint/SKILL.md)

1. **Lint**: Run `addon.lint` for syntax errors and undefined globals.
2. **Format**: Run `addon.format` to auto-fix code style.
3. **Security**: Run `addon.security` to detect combat lockdown violations, secret leaks.
4. **Complexity**: Run `addon.complexity` to find deep nesting, long functions.
5. **Fix**: Resolve remaining issues that cannot be auto-fixed.
6. **Verify**: Run `addon.lint` again to confirm code is clean.
7. **Report**: Summarize all findings to the user.

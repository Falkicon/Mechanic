Run comprehensive quality analysis on an addon.

**Skill**: [s-audit](../skills/s-audit/SKILL.md)

1. **Security**: Run `addon.security` to find combat lockdown violations, secret leaks, taint risks.
2. **Complexity**: Run `addon.complexity` to find deep nesting, long functions, magic numbers.
3. **Deprecations**: Run `addon.deprecations` to find deprecated API calls.
4. **Dead Code**: Run `addon.deadcode` to find unused functions and orphaned files.
5. **Report**: Summarize all findings with severity levels and suggested fixes.

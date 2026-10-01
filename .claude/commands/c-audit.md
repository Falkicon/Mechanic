Run comprehensive quality analysis on an addon.

**Skill**: [s-audit](../skills/s-audit/SKILL.md)

1. **Security**: Run `addon.security` to find combat lockdown violations, secret leaks and taint risks.
2. **Complexity**: Run `addon.complexity` to find deep nesting, long functions and magic numbers.
3. **Deprecations**: Run `addon.deprecations` for deprecated API calls. Its database is a small seed (it warns `DEPRECATION_DB_LIMITED`): state that a clean result is not full coverage.
4. **Dead Code**: Run `addon.deadcode` to find unused functions, orphaned files and similar.
5. **Check completeness**: Look at `truncated`, `total_issues` and `read_errors` in each result; raise `limit` or narrow `categories` when truncated.
6. **Report**: Summarize findings with confidence and severity, verify the critical ones in the code, and suggest fixes.

Lint and formatting are separate: [c-lint](c-lint.md).

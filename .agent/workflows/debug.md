---
description: Run the addon development feedback loop to find and fix issues.
---

Run the addon development feedback loop to find and fix issues.

**Skill**: [s-debug](../skills/s-debug/SKILL.md)

> **IMPORTANT**: Use `MechanicLib:Log()` for debug output, NOT `print()`. Print spams chat and requires screenshots. MechanicLib logs are captured by `addon.output` and are filterable/copyable.

1. **Output**: Call the `addon.output` MCP tool with `agent_mode=true`
2. **Analyze**: 
   - Check for new Lua errors and other helpful data from addon.
   - Verify unit test results.
   - Review console logs for expected behavior.
3. **Fix**: Fix errors, failures, and design issues found during this check.
4. **Report**: Report changes made.
5. **Script**: Provide user with testing required to verify fix including requesting a WoW `/reload`.
6. **Wait**: Wait for user to refresh and indicate they are ready for the next output request (step 1), notify the issue is fixed, or provide another task.

---
description: Run the addon development feedback loop to find and fix issues.
---

Run the addon development feedback loop to find and fix issues.

**Skill**: [s-debug](../skills/s-debug/SKILL.md) | **Protocol**: [using-mechanic](../skills/using-mechanic/SKILL.md)

> **IMPORTANT**: Use `MechanicLib:Log()` for debug output, NOT `print()`. Print spams chat and requires screenshots. MechanicLib logs are captured by `addon.output` and are filterable/copyable.

1. **Target**: Call `diagnostic.targets` and choose the client/account/character/profile (ask the user if several match). Reuse this exact `target` for every call below.
2. **Reload**: If code changed (or no fresh data exists), ask the user to `/reload` in WoW and **wait for their confirmation**. Never read output straight after an edit.
3. **Output**: Call `addon.output` with `agent_mode=true` and the target. Check the freshness timestamp.
4. **Analyze**:
   - Check for new Lua errors and other helpful data from the addon.
   - Verify unit test results.
   - Review console logs for expected behavior.
5. **Fix**: Fix errors, failures and design issues found. Prefer evidence over guesses; add `MechanicLib:Log` instrumentation when the cause is unclear.
6. **Report**: Report changes made and what is still unverified in game.
7. **Script**: Tell the user what to do to verify the fix, including the next `/reload`.
8. **Wait**: Wait for the user to reload and say they are ready (back to step 3), report the issue fixed, or give another task.

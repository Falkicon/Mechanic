---
description: Run unit tests for an addon to ensure logic correctness.
---

Run unit tests for an addon to ensure logic correctness.

**Skill**: [s-test](../skills/s-test/SKILL.md)

1. **Sandbox**: Call `sandbox.test` for fast, offline testing of the Core layer (add `filter` to narrow).
2. **Busted**: Call `addon.test` for broader testing with the full addon environment.
3. **Analyze**:
   - Review failures and identify the root cause of logic errors.
   - If sandbox tests fail on missing WoW APIs, run `sandbox.generate` and retry.
4. **Coverage**: Optionally call `addon.test` with `coverage=true`.
5. **Fix**: Address test failures or coverage gaps; add a regression test for every bug fixed.
6. **Report**: Summarize results, regressions found and fixed, and note that offline tests do not verify in-game behaviour.

---
description: Run unit tests for an addon to ensure logic correctness.
---

Run unit tests for an addon to ensure logic correctness.

**Skill**: [s-test](../skills/s-test/SKILL.md)

1. **Sandbox**: Call the `sandbox.test` MCP tool for fast, offline testing of Core logic.
2. **Busted**: Call the `addon.test` MCP tool for comprehensive testing with the full addon environment.
3. **Analyze**: 
   - Review test failures and identify the root cause of logic errors.
   - If sandbox tests fail due to missing APIs, consider running `sandbox.generate`.
4. **Coverage**: Optionally call `addon.test` with `coverage=true` to check test coverage.
5. **Fix**: Address any test failures or coverage gaps.
6. **Report**: Summarize test results, including any regressions found and fixed.

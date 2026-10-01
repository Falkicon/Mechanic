---
name: s-test
description: >
  Write and run offline unit tests for WoW addon logic: sandbox.test (restricted
  Lua runner with the packaged mini framework, Core layer) and addon.test
  (Busted). Covers spec layout, assertions, filters, mocking WoW APIs and what
  offline tests cannot prove. Triggers: test, unit test, spec, coverage, Busted,
  mock, TDD, sandbox, regression test.
---

# Testing WoW Addons

Tests prove logic offline; they do not prove in-game behaviour. For that, use the reload protocol in [using-mechanic](../using-mechanic/SKILL.md).

## Related Commands

- [c-test](../../workflows/test.md) - Run tests workflow
- [c-review](../../workflows/review.md) - Full code review (includes the test step)

## MCP Tools

| Task | MCP Tool |
|------|----------|
| Fast offline Core tests | `sandbox.test(addon="MyAddon", filter="optional name pattern")` |
| Busted tests, full addon environment | `addon.test(addon="MyAddon")`, `addon.test(addon="MyAddon", coverage=true)` |
| Run a snippet in the sandbox | `sandbox.exec(code="return 1 + 1", addon="MyAddon")` |
| Regenerate WoW API stubs | `sandbox.generate(namespace="C_Spell")` or all (`force=true` to rebuild); `sandbox.status` reports them |

All four run Lua on your machine, so they are flagged mutating (code execution). Only run them on code you are working on.

## `sandbox.test` layout and behaviour

- The addon is looked up in the `_dev_` folder. Source files are the **top-level** `Core/*.lua` files (`init.lua` first, then alphabetical; subfolders are not auto-loaded because they need ordered dependencies, so use `addon.test` for those).
- Specs are `*_spec.lua` files in `Core/` or under `Tests/` (capital `T`). With none, the result is `NO_TEST_FOLDERS` or an empty run.
- A packaged mini framework is used, so nothing has to be generated first; WoW API stubs from `sandbox.generate` are loaded too when they exist. It provides: `describe`, `it`, `before_each`, `after_each`, `setup`, `teardown` and `assert.equals / not_equals / is_true / is_false / truthy / falsy / is_nil / is_not_nil / is_near / match / has_error / same`.
- Code runs in a **restricted environment**: whitelisted globals only; no `os`, `io`, `package`, `debug`, `dofile`, `loadfile`, `load`, `getfenv`/`setfenv`, `string.dump`. `require` works in specs but only for modules beneath the addon folder. 30s/60s timeouts, 256 KB output cap, memory is not limited.
- `filter` runs only tests whose full name contains the text (case-insensitive). The result lists `passed_count`, `failed_count`, `tests` (failures first), `source_files`, `spec_files` and `duration_ms`; runner problems come back as structured errors (`LUA_FAILED`, `LUA_NOT_FOUND`, `FRAMEWORK_MISSING`, `NO_TEST_SUMMARY`, `TIMEOUT`). Read them instead of re-running blindly.

```lua
-- Core/Math_spec.lua
describe("Core math", function()
    it("clamps", function()
        assert.equals(10, Core.Clamp(15, 0, 10))
    end)
end)
```

## `addon.test` (Busted)

Runs the system/`desktop/bin` `busted` over `*_spec.lua` files; with a `.busted` file in the addon its `ROOT` is respected, otherwise `Tests/`, `tests/` or `spec/` are used. The result reports totals, per-test errors and busted errors. Needs the Lua toolchain (`tools.status`). `coverage=true` adds a coverage report.

## Routing Logic

| Request type | Load reference |
|--------------|----------------|
| Sandbox, Busted, in-game guides | [../../../docs/integration/testing.md](../../../docs/integration/testing.md) |
| Busted spec patterns | [references/busted-patterns.md](references/busted-patterns.md) |
| Mocking WoW APIs | [references/wow-mocking.md](references/wow-mocking.md) |
| MechanicLib test registration | [../k-mechanic/references/mechaniclib.md](../k-mechanic/references/mechaniclib.md) |

## Recommended workflow

1. **Sandbox (Core)** for fast feedback on pure logic; write a failing regression test first when fixing a bug.
2. **Busted** for module interactions and anything needing the full TOC load order.
3. **In game** for the final check against live APIs, through MechanicLib-registered tests and `addon.output` after a confirmed reload.
4. Keep logic in the Core layer; tests that need many WoW mocks usually mean logic leaked into the view layer.

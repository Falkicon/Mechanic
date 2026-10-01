---
name: s-debug
description: >
  Diagnose and fix addon bugs from runtime evidence, never from code alone.
  Hypothesis-driven investigation with MechanicLib logging, the target-based
  reload loop, and Lua error, taint, combat-lockdown and API-failure patterns.
  Triggers: error, bug, debug, crash, taint, nil value, action blocked,
  diagnose, hypothesis, runtime evidence, instrumentation.
---

# Debugging WoW Addons

Systematic debugging for WoW addons. Rule one: **get runtime evidence before changing code.**

## Related Commands

- [c-debug](../../workflows/debug.md) - Reload-loop workflow for finding and fixing issues
- [c-review](../../workflows/review.md) - Full code review (includes a debug step)

## MCP Tools

Call MCP tools directly, never the shell. The target and reload protocol is defined once in [using-mechanic](../using-mechanic/SKILL.md): pick a `diagnostic.targets` entry, pass the same `target` everywhere, ask the user to `/reload`, wait for confirmation, then read.

| Task | MCP Tool |
|------|----------|
| Discover targets | `diagnostic.targets()` |
| Get all output (after confirmed reload) | `addon.output(agent_mode=true, target=...)` |
| Run a snippet in game | `lua.queue(code=[...], labels=[...], target=...)`, then `lua.results(target=...)` after the reload |
| Static checks | `addon.lint(addon="MyAddon")`, `addon.security(addon="MyAddon")` |

## Routing Logic

| Request type | Load reference |
|--------------|----------------|
| Evidence-based, hypothesis-driven method | [references/evidence-based-debugging.md](references/evidence-based-debugging.md) |
| Lua errors, nil values | [references/error-patterns.md](references/error-patterns.md) |
| Isolation, in-game tools, strategies | [references/debugging-strategies.md](references/debugging-strategies.md) |
| Error tracking (BugGrabber) | [../../../docs/integration/errors.md](../../../docs/integration/errors.md) |
| Troubleshooting guide | [../../../docs/integration/troubleshooting.md](../../../docs/integration/troubleshooting.md) |
| Structured logging | [../../../docs/integration/console.md](../../../docs/integration/console.md) |
| Frame inspection | [../../../docs/integration/inspect.md](../../../docs/integration/inspect.md) |

## Debug output: `MechanicLib:Log`, not `print`

`print` spams chat and needs a screenshot. `MechanicLib:Log` goes to the Console buffer, which `addon.output` returns, and is filterable and copyable. The first argument is your addon name; categories are tags such as `CORE`, `API`, `EVENT`, `COOLDOWN`, `SECRET`, `PERF` ([mechaniclib](../k-mechanic/references/mechaniclib.md)).

```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)
if MechanicLib then
    MechanicLib:Log("MyAddon", "value=" .. tostring(val), MechanicLib.Categories.CORE)
end
```

Console lines reach the desktop only through the addon's `getDebugBuffer` capability (last 50 lines per addon) and the hub's own buffer, after a reload. Do not log secret values (guard with `issecretvalue`).

## Systematic workflow

1. **Gather evidence**: ask for the reload, wait for confirmation, read `addon.output` for the chosen target; check its freshness timestamp.
2. **Hypothesize**: write 3-5 testable "if X then Y because Z" statements.
3. **Instrument**: add small `MechanicLib:Log` lines that each map to a hypothesis.
4. **Reproduce**: ask the user to `/reload` and trigger the behaviour; wait for confirmation; read output again.
5. **Fix** the proven cause with the minimal change; reload and verify with fresh output; then remove the instrumentation.
6. Say plainly what was verified in game and what was not.

## Common error patterns

- `attempt to index nil value`: an API returned nil; check that the unit/data exists.
- `Action blocked by Blizzard` / `ADDON_ACTION_BLOCKED`: a protected function was called in combat or from tainted code.
- `Interface action failed because of an AddOn`: taint reached a secure UI path; find the first insecure write.
- Secret-value errors (12.0+): arithmetic, comparison or concatenation on a value flagged by `issecretvalue`.

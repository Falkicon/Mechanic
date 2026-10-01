---
name: s-develop
description: >
  Core WoW addon development patterns with Ace3 and Blizzard UI APIs: layered
  architecture, events, SavedVariables, frames, combat lockdown and API
  resilience (12.0 secret values). Use when building or extending an addon or
  integrating libraries. Triggers: build addon, new feature, Ace3, frame, event,
  SavedVariables, architecture, Lua 5.1.
---

# Developing WoW Addons

Guidance for building World of Warcraft addons with a focus on testability and maintenance. Addon Lua is **Lua 5.1** (WoW's runtime): no `goto`, no `bit32`, no integer division `//`, no `<const>`; use the `bit` library for bit operations.

## Related Commands

- [c-develop](../../commands/c-develop.md) - Build or extend addon features workflow

## MCP Tools

Call MCP tools directly (see [using-mechanic](../using-mechanic/SKILL.md)); the generated [command reference](../using-mechanic/references/afd-commands.md) has every input.

| Task | MCP Tool |
|------|----------|
| Create an addon from the template | `addon.create(name="MyAddon")` |
| Junction links into WoW clients | `addon.sync(addon="MyAddon", dry_run=true)` first, then for real after the user confirms |
| Validate the TOC | `addon.validate(addon="MyAddon")` |
| Library status / sync | `libs.check(addon="MyAddon")`, `libs.sync(addon="MyAddon", dry_run=true)` |
| Lint / format | `addon.lint`, `addon.format` ([s-lint](../s-lint/SKILL.md)) |
| Verify in game | reload protocol in [using-mechanic](../using-mechanic/SKILL.md) |

## Capabilities

1. **Event-Driven Design** — register events, handle callbacks, throttle
2. **Frame Architecture** — Core/Bridge/View layering, layouts, templates ([k-fenui](../k-fenui/SKILL.md))
3. **SavedVariables** — AceDB, defaults, versioning
4. **Combat Lockdown** — protected frames, taint avoidance, secure handlers
5. **API Resilience** — `C_` namespaces, feature detection, secret values (12.0+)

## Routing Logic

| Request type | Load reference |
|--------------|----------------|
| Addon architecture, layers | [../../../docs/addon-architecture.md](../../../docs/addon-architecture.md) |
| Event registration, callbacks | [references/event-patterns.md](references/event-patterns.md) |
| Frame creation, UI engineering | [references/frame-engineering.md](references/frame-engineering.md) |
| SavedVariables, AceDB | [references/saved-variables.md](references/saved-variables.md) |
| Combat lockdown, secure code | [references/combat-lockdown.md](references/combat-lockdown.md) |
| Blizzard API, C_ namespaces, secret values | [references/api-patterns.md](references/api-patterns.md) |
| MechanicLib integration | [../../../docs/integration/mechaniclib.md](../../../docs/integration/mechaniclib.md) |
| Performance profiling | [../../../docs/integration/performance.md](../../../docs/integration/performance.md) |
| Long-form addon guide (secret values, packaging) | `docs/addon-dev-guide/` |

## Core Principles

1. **Headless Core**: keep logic in pure Lua functions (Layer 1) so `sandbox.test` and Busted can run it offline.
2. **Event-Driven**: avoid `OnUpdate` polling; use events and `C_Timer` (Layer 2).
3. **Defensive API use**: check for `nil`, feature-detect new APIs, `pcall` only where an API may genuinely error.
4. **Combat aware**: never move, hide or re-anchor *protected* frames in combat; queue it ([references/combat-lockdown.md](references/combat-lockdown.md)).
5. **Secret values**: on 12.0+ some returns are opaque. Test with `issecretvalue(value)` before arithmetic, comparison or concatenation.
6. **Use the ecosystem**: `MechanicLib:Log` for debug output, FenUI widgets for UI, FenCore for helpers ([k-ecosystem](../k-ecosystem/SKILL.md)).
7. **Verify in game**: after offline checks, follow the reload protocol; never claim in-game behaviour from a worktree edit alone.

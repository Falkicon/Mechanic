---
name: k-ecosystem
description: >
  Context for the Mechanic/Fen WoW addon ecosystem: Mechanic (desktop tool,
  !Mechanic bootstrap addon, Mechanic in-game hub), MechanicLib, FenUI, FenCore,
  the reload loop, and which skill to load next. Load at the start of addon work
  or when unsure which skill applies. Triggers: ecosystem, fen, fencore, fenui,
  mechanic, addon, context, work, build, develop, create, which skill.
---

# Fen Ecosystem

The Mechanic/Fen ecosystem is a development platform for WoW addons. Work is agent-first: every desktop feature is a typed command exposed through MCP.

## The reload loop (live verification)

After any addon code change you must verify in game, and the timing is the user's, not yours:

1. Complete offline checks first (lint, tests).
2. `diagnostic.targets` -> pick a target; pass the same `target` to `lua.queue` / `api.queue` / `addon.output`.
3. **Ask the user to `/reload` and wait for their explicit confirmation.** Never call `addon.output` right after a change, and never infer completion from elapsed time.
4. Then `addon.output` with `agent_mode=true` and the same `target`.

Full rules, error codes and mutation handling: [using-mechanic](../using-mechanic/SKILL.md).

## Components

| Component | What it is | Where |
|---|---|---|
| **Mechanic Desktop** | Python tool: command registry, MCP server (`mech mcp`), CLI (`mech`), web dashboard | `desktop/` |
| **!Mechanic** | Bootstrap addon, loads first. Owns `MechanicDB` (SavedVariables), `MechanicLib-1.0`, the early queue file | `!Mechanic/` |
| **Mechanic** | In-game hub (`/mech`): Console, Errors, Tests, Inspect, Performance, Tools, API tabs; aggregates diagnostics into `MechanicDB` | `Mechanic/` |
| **MechanicLib** | Registration/logging bridge other addons get from `!Mechanic` via LibStub: `Register`, `Log`, `IsEnabled`, watch list | `!Mechanic/Libs/MechanicLib/` (runtime copy; editing source `Mechanic/Libs/MechanicLib/`, keep identical) |
| **FenUI** | Blizzard-first UI widget library (global `FenUI`, `FenUI:CreatePanel(parent, config)` and friends) | `Mechanic/Libs/FenUI/` (synced copy) |
| **FenCore** | Pure logic library (math, tables, strings, ...). Not vendored here; its catalog reaches agents through `fencore-*` commands once FenCore is loaded in game | external |

Details: [k-mechanic](../k-mechanic/SKILL.md), [k-fenui](../k-fenui/SKILL.md), [k-fencore](../k-fencore/SKILL.md).

## Addon architecture

```
Core layer   (pure logic, FenCore)   -> testable offline (sandbox.test, Busted)
Bridge layer (events, data, Ace3)    -> thin glue
View layer   (frames, FenUI)         -> display only
MechanicLib registers the addon with Mechanic; Mechanic aggregates what it reports.
```

The Mechanic addon itself is pragmatic (see `Mechanic/AGENTS.md`); the layering is guidance for new addons ([s-develop](../s-develop/SKILL.md)).

## Essential MCP tools

| Task | Tool |
|---|---|
| Live output | `diagnostic.targets`, then `addon.output(agent_mode=true, target=...)` |
| Lint / format / validate | `addon.lint`, `addon.format`, `addon.validate` |
| Tests | `sandbox.test` (offline Core), `addon.test` (Busted) |
| WoW API lookup | `api.search`, `api.info`, `api.list` |
| FenCore functions | `fencore-search`, `fencore-info`, `fencore-catalog` |
| Environment | `env.status`, `tools.status` |

## Which skill next

| You want to... | Load |
|---|---|
| Call Mechanic tools / verify in game | [using-mechanic](../using-mechanic/SKILL.md) |
| Build or extend an addon | [s-develop](../s-develop/SKILL.md) |
| Debug with runtime evidence | [s-debug](../s-debug/SKILL.md) |
| Write or run tests | [s-test](../s-test/SKILL.md) |
| Lint / format | [s-lint](../s-lint/SKILL.md) |
| Quality audit / dead code | [s-audit](../s-audit/SKILL.md), [s-clean](../s-clean/SKILL.md) |
| Look up WoW APIs or Blizzard UI code | [s-research](../s-research/SKILL.md) |
| Release an addon | [s-release](../s-release/SKILL.md) |
| Change the desktop tool or add a command | [k-desktop](../k-desktop/SKILL.md) |
| Regenerate APIDefs | [k-apidefs](../k-apidefs/SKILL.md) |
| Docs index / writing skills | [k-docs](../k-docs/SKILL.md), [k-create-skill](../k-create-skill/SKILL.md) |

## AFD principles

Mechanic follows Agent-First Development:

1. **Commands first**: every capability is a typed command before it gets a UI.
2. **Structured results**: `success`, `data`, `error` (with `code`, `message`, `suggestion`), plus `reasoning`/`warnings`.
3. **Audited mutations**: each command is flagged read-only or mutating in `desktop/src/mechanic/commands/catalog.py`.
4. **Explicit identity**: diagnostics are addressed by a target, never by heuristics.

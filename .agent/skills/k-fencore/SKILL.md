---
name: k-fencore
description: >
  Context for FenCore, the pure-logic library for WoW addons (no UI), and how
  agents discover its functions through the fencore-catalog, fencore-search and
  fencore-info commands. Load when looking for utility functions before writing
  your own. Triggers: fencore, utility function, pure logic, math helper, table
  helper, catalog.
---

# FenCore

FenCore is a pure logic library for WoW addons: side-effect-free utility functions with no UI dependencies, meant for the Core layer of an addon and testable without WoW. It lives in its own repository and is **not vendored in this repo** (`Mechanic.toc` lists it only as an optional dependency), so this skill does not duplicate its API. Ask the commands below instead of guessing function names.

## Discovering functions (MCP)

FenCore registers a catalog with MechanicLib when it loads in game; Mechanic syncs it into `MechanicDB`, and the desktop commands read it from the selected target.

| Task | Tool |
|---|---|
| List every domain and function | `fencore-catalog` |
| Search by name or description | `fencore-search` with `query` (and optional `limit`) |
| Details, params, returns, example | `fencore-info` with `domain` and `function` |

All three take the optional diagnostic `target` ([using-mechanic](../using-mechanic/SKILL.md)). They return `CATALOG_NOT_FOUND` when FenCore did not register a catalog in that profile: make sure FenCore is loaded, ask the user to `/reload`, wait for confirmation, retry.

## Using it in an addon

- Check `fencore-search` before writing a helper; call FenCore directly instead of wrapping it.
- Take the exact access pattern (global versus `LibStub`) and signatures from `fencore-info` / FenCore's own README; do not rely on remembered examples.
- Keep FenCore calls in the Core layer. State belongs in the Bridge layer.
- Treat FenCore as optional when the addon should run without it: guard the global/lib lookup like any optional dependency.

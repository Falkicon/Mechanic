---
name: k-mechanic
description: >
  Context for Mechanic, the WoW addon development hub: desktop tool (command
  registry, MCP server, CLI, dashboard), the !Mechanic bootstrap and Mechanic
  in-game addons, and MechanicLib. Load for how the pieces fit, ports, routes and
  in-game slash commands. Triggers: mechanic, mech, cli, mcp, dashboard,
  slash command, MechanicLib, MechanicDB, development hub.
---

# Mechanic Development Hub

Mechanic combines a desktop tool and two in-game addons. Agents use it through MCP; people also use the CLI and the web dashboard.

## Architecture

```
Mechanic Desktop (desktop/)                       commands.list = the single registry
  MCP server (mech mcp)   CLI (mech)   Dashboard (/dashboard/, same commands via /api/execute)
        |  reads !Mechanic.lua (SavedVariables holding MechanicDB, one file per account)
        |  writes MechanicQueue.lua (Lua / API test queue) into the !Mechanic addon folder
!Mechanic   (bootstrap, loads first)  owns MechanicDB, MechanicLib-1.0, queue execution
Mechanic    (main addon, /mech)       Console, Errors, Tests, Inspect, Performance, Tools, API
```

SavedVariables are written by the game on `/reload` or logout, so desktop reads are only fresh after a confirmed reload ([using-mechanic](../using-mechanic/SKILL.md)).

## Agents: MCP tools

Call tools directly; discover inputs with `commands.list` or the generated [command reference](../using-mechanic/references/afd-commands.md). Pick a `diagnostic.targets` entry and reuse it for queue and read calls. Do not use the shell or `mech` CLI for agent work.

## Components

- **MCP server**: `mech mcp` (stdio by default, configured in the repo's `.mcp.json`). Exposes every registered command with dashed names. Optional SSE transport (`--transport sse`, default `127.0.0.1:3101`) is unauthenticated and exposes mutating commands; never expose it.
- **CLI** (`mech` or `mechanic`): user fallback. See [cli-commands](references/cli-commands.md).
- **Dashboard**: `mech dashboard` serves `http://127.0.0.1:3100/dashboard/`. See [dashboard](references/dashboard.md).
- **In-game hub**: the `Mechanic` addon (`/mech`). See [ingame-modules](references/ingame-modules.md).
- **MechanicLib**: `LibStub("MechanicLib-1.0", true)`; `Register`, `Log`, `IsEnabled`, watch list. See [mechaniclib](references/mechaniclib.md).

```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)
if MechanicLib then
    MechanicLib:Register("MyAddon", { version = "1.0.0" })
    MechanicLib:Log("MyAddon", "loaded", MechanicLib.Categories.LOAD)
end
```

## Routing

| Request type | Load reference |
|---|---|
| Every command, input, mutation flag (generated) | [../using-mechanic/references/afd-commands.md](../using-mechanic/references/afd-commands.md) |
| CLI (user-facing) | [references/cli-commands.md](references/cli-commands.md) |
| Dashboard, HTTP routes, WebSocket | [references/dashboard.md](references/dashboard.md) |
| In-game tabs and slash commands | [references/ingame-modules.md](references/ingame-modules.md) |
| MechanicLib API | [references/mechaniclib.md](references/mechaniclib.md) |
| Changing the desktop tool itself | [k-desktop](../k-desktop/SKILL.md) |

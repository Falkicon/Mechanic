# In-Game Modules Reference

The **Mechanic** main addon (not the `!Mechanic` bootstrap) provides the tabbed hub, opened with `/mech` or `/mechanic`. The bootstrap only owns `MechanicDB`, `MechanicLib-1.0` and queue execution. The tab order is Inspect, Console, Errors, Tests, Performance, Tools, API (`Mechanic/UI/MainFrame.lua`).

## Slash commands (`Mechanic/Core.lua`, `Mechanic:SlashCommand`)

| Command | Action |
|---|---|
| `/mech` | Toggle the main panel |
| `/mech inspect` / `console` / `errors` / `tests` / `perf` / `tools` / `api` | Open that tab |
| `/mech reload` | `ReloadUI()` |
| `/mech gc` | Force garbage collection and report KB freed |
| `/mech pause` | Pause/resume the active tab (Console, Errors) |
| `/mech clear` | Clear the active tab |

Anything else prints the command list. There is no `/mech reset` and no `/mech copy`. `Bindings.xml` declares `MECHANIC_DEV_RELOAD` and `MECHANIC_TOGGLE` but **no default keys**: bind them in the game's Key Bindings UI (CTRL-SHIFT-R / CTRL-SHIFT-M are only suggestions).

## Tabs

| Tab | Source file | What it does |
|---|---|---|
| **Inspect** | `UI/Inspect*.lua` | Frame/table inspector: Pick mode, tree, property sections, editable properties (refused for protected frames in combat), watch list, export |
| **Console** | `UI/Console.lua` | Aggregated log buffers from registered addons plus Mechanic's own log; source filter, search, pause, wipe, export. `print` output is captured by a post-hook (`hooksecurefunc`), not by replacing `_G.print` |
| **Errors** | `UI/Errors.lua` | BugGrabber-backed Lua errors with session selector (current/previous/all), per-source counts, export. Needs `!BugGrabber` (optional dependency); degrades gracefully without it |
| **Tests** | `UI/Tests.lua` | Runs and shows tests registered by addons through MechanicLib (`tests` capability) |
| **Performance** | `UI/Performance.lua` | Per-addon memory and CPU (ms/s over the refresh window), sub-metrics reported by addons, CPU profiling (asks for a reload) |
| **Tools** | `UI/Tools.lua` | Panels addons register with the `tools` capability (`createPanel`); Mechanic's health log |
| **API** | `UI/API.lua` | API test bench over `Mechanic/UI/APIDefs` (generated, see [k-apidefs](../../k-apidefs/SKILL.md)): search, run one API, "Run Namespace" (asks first; only read-only `Get*/Is*/Has*/Unit*` APIs, time-sliced), "Safe" filter, export |

Secret values (12.0+) are detected with `issecretvalue`, shown as a secret marker and never concatenated or compared.

## Data flow to the desktop

Mechanic aggregates `getDebugBuffer`, tests and performance data from every registered addon into `MechanicDB.profiles[<profile>].addonData` (logs capped to the last 50 lines per addon) and stamps `lastSync`. `addon.output` reads that profile; it is only current after the game wrote SavedVariables (`/reload`). Hub sync failures are logged to the health log.

## Files

See `Mechanic/AGENTS.md` for the file map and agent guidelines for editing the addon.

# MechanicLib

`MechanicLib-1.0` (MINOR 3) is the small bridge library addons use to report to Mechanic. The `!Mechanic` bootstrap loads it first (`!Mechanic/Libs/MechanicLib/MechanicLib.lua`), so consuming addons get it with `LibStub("MechanicLib-1.0", true)` and do **not** need to embed a copy; they must tolerate `nil` when Mechanic is not installed. A second copy, `Mechanic/Libs/MechanicLib/MechanicLib.lua`, is documented as the editing source and is not loaded by `Mechanic.toc`: keep the two identical (diff them after any change). Human-oriented guide: `docs/integration/mechaniclib.md`.

Everything is optional: when the `Mechanic` hub is not loaded, `Log` is a no-op and registrations are simply stored; when `!Mechanic` is absent, `LibStub` returns nil.

## Getting it

```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)   -- note the "-1.0"; silent=true
if MechanicLib and MechanicLib:IsEnabled() then        -- true when the Mechanic hub addon is loaded
    -- developer-only features
end
```

## API (complete)

| Method | Purpose |
|---|---|
| `MechanicLib:IsEnabled()` | `true` when the `Mechanic` main addon is loaded (replaces `DevMarker.lua` checks for debug UI) |
| `MechanicLib:Register(addonName, capabilities)` | Register an addon; notifies `Mechanic:OnAddonRegistered` |
| `MechanicLib:Unregister(addonName)` | Remove a registration |
| `MechanicLib:Log(addonName, message, category)` | Send a line to Mechanic's Console (no-op without Mechanic) |
| `MechanicLib:AddToWatchList(frameOrPath, label, options)` / `RemoveFromWatchList(...)` / `GetWatchList()` | Inspect tab watch list (`options = { source, property }`) |
| `MechanicLib:GetRegistered()` | Map of addon name to capabilities |
| `MechanicLib:HasCapability(addonName, key)` / `GetCapability(addonName, key)` | Query one capability |

There is no `RegisterAddon`, `RegisterTests`, `RegisterToolPanel`, `ReportMetric` or `Print`.

## Log categories

`MechanicLib.Categories` values are display tags (strings): `TRIGGER` `[Trigger]`, `REGION`, `API`, `COOLDOWN`, `EVENT`, `VALIDATION`, `SECRET`, `PERF`, `LOAD`, `CORE`. There are no `DEBUG/INFO/WARNING/ERROR` levels. Mechanic's own code logs `[Core]`. Pass the category as the third argument:

```lua
MechanicLib:Log("MyAddon", "Cooldown cached: " .. tostring(spellID), MechanicLib.Categories.COOLDOWN)
```

Use `MechanicLib:Log` instead of `print` for debug output: it lands in the Console buffer that `addon.output` returns.

## Capabilities (the table passed to `Register`)

All keys are optional; Mechanic calls each one inside `pcall`.

```lua
MechanicLib:Register("MyAddon", {
    version = "1.0.0",
    getDebugBuffer = function() return MyAddon.debugLines end,   -- array of strings; last 50 are synced
    clearDebugBuffer = function() wipe(MyAddon.debugLines) end,
    tests = {                                  -- Tests tab and addon.output tests section
        getAll = function() return { { id = "db_init", name = "DB initialises", category = "Core" } } end,
        getCategories = function() return { "Core" } end,
        run = function(id) return MyAddon:RunTest(id) end,
        runAll = function() end,               -- optional; returns passed, total
        getResult = function(id) return MyAddon.results[id] end,
        clearResults = function() end,         -- optional
    },
    performance = { getSubMetrics = function() return { { name = "scan", ms = 0.3 } } end },  -- Performance tab
    tools = { createPanel = function(parent) --[[ build UI inside parent ]] end },            -- Tools tab
    inspect = { getWatchFrames = function() return { { label = "Main", frame = MyAddonFrame, property = "Visibility" } } end },
    settings = {},                             -- AceConfig option `args` table, shown as a group in Mechanic's settings panel
})
```

A test result is `{ passed = true|false|nil, message = "...", duration = 0.003, logs = { "..." }, details = { { label, value, status = "pass"|"warn"|"fail" } } }`.

## Data sync

Mechanic copies logs (capped to 50 lines per addon), test results and sub-metrics into `MechanicDB` (`profiles[<profile>].addonData`) and stamps `lastSync`. WoW writes SavedVariables on `/reload` or logout, which is why agents wait for a confirmed reload before `addon.output` ([using-mechanic](../../using-mechanic/SKILL.md)). `Mechanic:SyncAllAddonData()` runs the aggregation (the Tests tab calls it after runs).

## Optional-dependency pattern

```toc
## OptionalDeps: !Mechanic
```

```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)
local function Debug(msg)
    if MechanicLib then MechanicLib:Log("MyAddon", msg, MechanicLib.Categories.CORE) end
end
```

## Editing the library

Change `Mechanic/Libs/MechanicLib/MechanicLib.lua`, bump `MINOR` for behavioural changes, copy it to `!Mechanic/Libs/MechanicLib/` (and any addon that still embeds it), and verify the copies are identical.

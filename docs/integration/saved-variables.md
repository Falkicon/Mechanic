# SavedVariables Patterns

Mechanic does **not** read arbitrary addon SavedVariables. The desktop tool reads two files from a character's `SavedVariables` folder:

- `!Mechanic.lua` - the `MechanicDB` hub data (console buffer, test results, performance metrics, queued-code results) that the in-game `Mechanic` addon aggregates from every addon registered through [MechanicLib](./mechaniclib.md)
- `!BugGrabber.lua` - BugGrabber's error log, when `!BugGrabber` is installed

Your own `MyAddonDB` is never parsed. To get your addon's state, metrics or logs into the dashboard and `addon.output`, expose them through MechanicLib (`getDebugBuffer`, `tests.getResult`, `performance.getSubMetrics`).

---

## Data Flow

1. Your addon registers with MechanicLib and exposes data through its capability functions.
2. The `Mechanic` addon collects that data into `MechanicDB`, which `!Mechanic` owns as a SavedVariable.
3. WoW writes `!Mechanic.lua` to disk on `/reload`, logout or quit. Nothing is written while you play, and the game never pushes data to the desktop.
4. The desktop file watcher notices the changed file and the dashboard re-reads it. `addon.output` and `sv.parse` read the same file on demand.

The data is therefore a snapshot from the last reload, not a live stream. When several clients, accounts, characters or profiles exist, select a `target` from `diagnostic.targets`.

---

## Exposing Metrics and State

Register capability functions that return plain data:

```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)

if MechanicLib then
    MechanicLib:Register("MyAddon", {
        version = C_AddOns.GetAddOnMetadata("MyAddon", "Version"),

        -- Console buffer
        getDebugBuffer = function() return MyAddon.debugBuffer or {} end,

        -- Sub-metrics shown on the Performance tab
        performance = {
            getSubMetrics = function()
                return MyAddon:GetPerformanceSubMetrics()
            end,
        },

        -- Results shown on the Tests tab
        tests = {
            getAll = function() return MyAddon:GetTests() end,
            getResult = function(id) return MyAddon:GetTestResult(id) end,
        },
    })
end
```

---

## Your Own SavedVariables

Your addon's own SavedVariables are still the right place for settings and persistent data. Keep them serializable, since WoW itself cannot save functions or circular references:

```lua
-- MyAddon.toc
-- ## SavedVariables: MyAddonDB
-- ## SavedVariablesPerCharacter: MyAddonCharDB

MyAddonDB = MyAddonDB or {
    profile = { enabled = true, scale = 1.0 },
    version = 1,
}
```

SavedVariables are written only on `/reload`, `/logout` and `/quit`.

---

## Best Practices

1. **Use a single root table** - `MyAddonDB` rather than multiple globals
2. **Avoid circular references** - they cannot be serialized
3. **Don't store functions** - only tables, strings, numbers and booleans
4. **Don't store secret values** - check `issecretvalue()` before saving
5. **Keep exposed diagnostics small** - bounded buffers keep the hub data (and the file the desktop parses) small

---

## Related Guides

- [MechanicLib Registration](./mechaniclib.md)
- [CLI Workflow](./cli-workflow.md)

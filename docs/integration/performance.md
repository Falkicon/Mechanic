# Performance Profiling

Track where your addon spends CPU time with fine-grained block profiling.

---

## Setting Up Performance Tracking

**Example:** See [Flightsim/UI.lua](../../../Flightsim/UI.lua)

```lua
-- Performance Tracking Structure
MyAddonUI.perf = {
    blocks = {
        state = 0,      -- Time spent on state detection
        render = 0,     -- Time spent rendering
        data = 0,       -- Time spent processing data
        events = 0,     -- Time spent handling events
    },
    lastUpdate = 0,
}
```

---

## Recording Block Times

Use `debugprofilestop()` to measure each code block:

```lua
function MyAddonUI:OnUpdate(elapsed)
    local block_start
    
    -- Block 1: State Detection
    block_start = debugprofilestop()
    pcall(function()
        self:UpdateState()
    end)
    self.perf.blocks.state = debugprofilestop() - block_start
    
    -- Block 2: Render UI
    block_start = debugprofilestop()
    pcall(function()
        self:RenderUI()
    end)
    self.perf.blocks.render = debugprofilestop() - block_start
    
    -- Block 3: Process Data
    block_start = debugprofilestop()
    pcall(function()
        self:ProcessData()
    end)
    self.perf.blocks.data = debugprofilestop() - block_start
end
```

---

## Exposing Sub-Metrics to Mechanic

```lua
function MyAddonUI:GetPerformanceSubMetrics()
    local p = self.perf.blocks
    return {
        { name = "State Detection", msPerSec = p.state, description = "State and mode detection" },
        { name = "UI Render", msPerSec = p.render, description = "Frame updates and animations" },
        { name = "Data Processing", msPerSec = p.data, description = "Data transforms and caching" },
        { name = "Event Handling", msPerSec = p.events, description = "Event callbacks" },
    }
end
```

### Register with MechanicLib

```lua
MechanicLib:Register(ADDON_NAME, {
    performance = {
        getSubMetrics = function()
            return MyAddonUI:GetPerformanceSubMetrics()
        end,
    },
})
```

---

## Sub-Metric Format

Each metric should include:

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Display name for the metric |
| `msPerSec` | number | Milliseconds spent per second |
| `description` | string | What this block measures |

---

## Viewing Performance Data

| Location | How |
|----------|-----|
| **In-game** | Mechanic panel → Performance tab shows breakdown by addon |
| **Dashboard** | Performance metrics with ms/s and % distribution |
| **CLI** | `mech addon.output` includes performance summary |

---

## Best Practices

1. **Wrap in pcall** — Prevents measurement errors from crashing addon
2. **Name blocks clearly** — Makes dashboard output readable
3. **Include descriptions** — Helps others understand what each block does
4. **Track hot paths** — Focus on frequently-called code (OnUpdate, events)

---

## Related Guides

- [MechanicLib Registration](./mechaniclib.md)
- [Test Integration](./testing.md)

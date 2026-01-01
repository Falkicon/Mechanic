# SavedVariables Patterns

Mechanic reads your addon's SavedVariables to display state in the dashboard.

---

## Basic Pattern

```lua
-- Variables.lua
MyAddonDB = MyAddonDB or {}

-- Store debug/dev info
MyAddonDB.debug = {
    lastLoad = time(),
    version = "1.0.0",
    errorCount = 0,
}
```

---

## Exposing Metrics

```lua
-- Track performance data for Mechanic to display
MyAddonDB.metrics = {
    loadTime = 0,
    eventsProcessed = 0,
    cacheHits = 0,
    cacheMisses = 0,
}

-- Update during runtime
function MyAddon:OnEvent(event, ...)
    MyAddonDB.metrics.eventsProcessed = MyAddonDB.metrics.eventsProcessed + 1
end
```

---

## Exposing State for Debugging

```lua
-- Store state that's useful when debugging via dashboard
MyAddonDB.state = {
    isEnabled = true,
    activeProfile = "Default",
    registeredEvents = {"PLAYER_LOGIN", "UNIT_AURA"},
}
```

---

## Data Availability

SavedVariables are only written to disk on:

- `/reload`
- `/logout`
- `/quit`

Mechanic's file watcher detects these changes and updates the dashboard automatically.

---

## TOC Configuration

Ensure your `.toc` file declares SavedVariables:

```toc
## SavedVariables: MyAddonDB
## SavedVariablesPerCharacter: MyAddonCharDB
```

---

## Best Practices

1. **Use a single root table** — `MyAddonDB` rather than multiple globals
2. **Namespace debug data** — `MyAddonDB.debug`, `MyAddonDB.metrics`
3. **Avoid circular references** — Can't be serialized
4. **Don't store functions** — Only data (tables, strings, numbers, booleans)
5. **Clean up on disable** — Remove temporary data before logout

---

## Example: Full Structure

```lua
MyAddonDB = MyAddonDB or {
    -- User settings
    profile = {
        enabled = true,
        scale = 1.0,
        position = { x = 0, y = 0 },
    },
    
    -- Development/debug info
    debug = {
        version = "1.0.0",
        lastLoad = 0,
        loadCount = 0,
    },
    
    -- Runtime metrics
    metrics = {
        eventsProcessed = 0,
        apiCalls = 0,
        errors = 0,
    },
    
    -- Current state snapshot
    state = {
        isActive = false,
        mode = "normal",
    },
}
```

---

## Related Guides

- [MechanicLib Registration](./mechaniclib.md)
- [CLI Workflow](./cli-workflow.md)

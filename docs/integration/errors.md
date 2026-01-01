# Error Tracking

Mechanic integrates with [BugGrabber](https://www.curseforge.com/wow/addons/bug-grabber) for error capture.

---

## Automatic Integration

If you have `!BugGrabber` installed, Mechanic automatically:

- Captures all Lua errors with full stack traces
- Filters by current session (ignores historical errors)
- Groups errors by addon and file
- Deduplicates repeated errors

**No code changes needed** — errors from your addon appear automatically.

---

## Error Format

Errors appear with:

| Field | Description |
|-------|-------------|
| Error message | The actual error text |
| Stack trace | Full call stack |
| File and line | Source location |
| Occurrence count | How many times it happened |
| Session ID | Links to current game session |

---

## Viewing Errors

| Location | How |
|----------|-----|
| **In-game** | Mechanic panel → Errors tab |
| **Dashboard** | Errors section (grouped by addon) |
| **CLI** | `mech addon.output` includes error summary |

---

## Best Practices for Debuggable Code

### Use pcall for Risky Operations

```lua
local ok, err = pcall(function()
    -- Code that might fail
    local data = C_SomeAPI.GetData()
    self:ProcessData(data)
end)

if not ok then
    -- Log but don't crash
    Log("ERROR", "Failed to get data:", err)
end
```

### Include Context in Error Messages

```lua
function MyAddon:ProcessItem(itemID)
    if not itemID then
        error("ProcessItem called with nil itemID")
    end
    -- ...
end
```

### Use assert for Invariants

```lua
function MyAddon:SetValue(value)
    assert(type(value) == "number", "SetValue expects a number, got " .. type(value))
    self.value = value
end
```

---

## Debugging with Health Log

Mechanic's in-game Tools panel includes a Health Log for internal errors:

- **View Health Log** — Export persistent error log
- **Clear Health Log** — Reset the log
- **Reset UI Position** — Fix positioning issues

---

## Related Guides

- [Console Integration](./console.md)
- [Troubleshooting](./troubleshooting.md)

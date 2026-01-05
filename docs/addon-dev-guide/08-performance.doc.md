# Performance

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2026-01-02

---

## Overview

Performance matters for addon reliability. A slow addon affects the user's game experience and can cause issues during intensive scenarios like raids.

**Midnight Note**: With Blizzard adding native damage meters and boss alerts, performance expectations may increase. Addons should be efficient to avoid being blamed for performance issues.

---

## Impact of Modularization

Breaking large `.lua` files into smaller, focused modules improves maintainability and enables performance optimizations. In field testing (ActionHud), moving from a monolithic file to a modular structure (e.g., extracting `LayoutManager.lua`) reduced perceived UI initialization time by deferring expensive work.

**Important**: WoW loads `.lua` files sequentially in the order listed in your `.toc` file. Splitting files alone does not create parallel or background loading.

Benefits include:
- **Deferred Initialization**: Modular designs enable Load-on-Demand (LoD) patterns and lazy initialization, so expensive work runs only when needed.
- **Independent Modules**: AceAddon-style designs let modules initialize independently, preventing a single slow module from blocking the entire addon.
- **Maintainability**: Smaller files are easier to profile, debug, and optimize individually.

---

## Local Upvalues

Use local upvalues for hot paths, but **only if profiling shows it matters**:

```lua
-- At file scope
local math_floor = math.floor
local string_format = string.format
local GetTime = GetTime

-- In hot path
local function Update()
    local now = GetTime()  -- Faster than _G.GetTime
    local rounded = math_floor(now)
end
```

**Note**: Modern Lua and WoW optimize many cases automatically. Profile first.

---

## Caching Patterns

### Spell ID and icon caching

Cache spell data and invalidate on spellbook changes:

```lua
local spellCache = {}

local function GetCachedSpellInfo(spellID)
    if not spellCache[spellID] then
        local info = C_Spell.GetSpellInfo(spellID)
        if info then
            spellCache[spellID] = {
                name = info.name,
                icon = info.iconID,
            }
        end
    end
    return spellCache[spellID]
end
```

### Invalidate on relevant events

```lua
frame:RegisterEvent("SPELLS_CHANGED")
frame:SetScript("OnEvent", function(self, event)
    if event == "SPELLS_CHANGED" then
        wipe(spellCache)  -- Clear cache
    end
end)
```

---

## Throttling

### Time-based throttling

```lua
local lastUpdate = 0
local THROTTLE = 0.1  -- 100ms

function ThrottledUpdate()
    local now = GetTime()
    if now - lastUpdate < THROTTLE then return end
    lastUpdate = now
    
    -- Actual work
    DoExpensiveUpdate()
end
```

### Frame-based throttling (not recommended)

Frame-skipping is FPS-dependent—at 30 FPS, skipping 3 frames is 100ms; at 200 FPS, it's 15ms. Prefer time-based throttling for consistent behavior.

```lua
local frameCount = 0
local FRAME_SKIP = 3

frame:SetScript("OnUpdate", function()
    frameCount = frameCount + 1
    if frameCount < FRAME_SKIP then return end
    frameCount = 0
    
    -- Actual work
end)
```

**Note**: Use time-based or adaptive throttling instead for consistent behavior across all frame rates.

### Adaptive throttling (recommended)

```lua
local FAST_THROTTLE = 0.05   -- 20 Hz when active
local SLOW_THROTTLE = 0.5    -- 2 Hz when idle
local lastUpdate = 0

frame:SetScript("OnUpdate", function(self, elapsed)
    local now = GetTime()
    local throttle = self:IsVisible() and FAST_THROTTLE or SLOW_THROTTLE
    
    if now - lastUpdate < throttle then return end
    lastUpdate = now
    
    DoUpdate()
end)
```

---

## Debug Printing

Keep debug output behind an explicit flag:

```lua
local DEBUG = false

local function DebugPrint(...)
    if DEBUG then
        print("[MyAddon]", ...)
    end
end

-- Enable via slash command, not always-on
SLASH_MYADDON1 = "/myaddon"
SlashCmdList["MYADDON"] = function(msg)
    if msg == "debug" then
        DEBUG = not DEBUG
        print("Debug mode:", DEBUG and "ON" or "OFF")
    end
end
```

---

## What to Avoid

| Anti-pattern | Why |
|--------------|-----|
| Scanning entire UI tree | O(n) where n can be thousands |
| Creating frames in OnUpdate | Memory churn, GC pressure |
| String concatenation in loops | Creates garbage |
| Unthrottled API calls | Can cause lag spikes |
| Operations on Secret values | Lua errors and state propagation in Midnight |

---

## Midnight Performance Considerations

### Secret Value Safety

In Midnight, certain combat-sensitive values become "Secrets" that require careful handling. The primary risk is **correctness**, not just performance:

**Forbidden Operations on Secrets:**
- Comparison operators (`==`, `<`, `>`, etc.) → Lua error
- Arithmetic operations (`+`, `-`, `*`, `/`) → Lua error
- String concatenation (`..`) → Lua error

**Secret Propagation:**
Passing Secrets into certain script-object APIs can "mark" those objects, causing related getters to also return Secrets. Use `HasSecretValues()` / `HasSecretAspect()` to check object state, and `SetToDefaults()` to clear secret state if needed.

**Detection:**
```lua
-- Check if a value is a Secret
if issecretvalue and issecretvalue(someValue) then
    -- Use passthrough display mode
end
```

**Safe Pattern: Design hot paths to be "secret-safe" or use passthrough mode:**

```lua
local secretMode = false

frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_DISABLED" then
        -- Check once at combat start
        local info = C_Spell.GetSpellCharges(spellID)
        secretMode = info and issecretvalue and issecretvalue(info.currentCharges)
    else
        secretMode = false
    end
end)

frame:SetScript("OnUpdate", function()
    if secretMode then
        -- Passthrough mode: display raw value without operations
        UpdatePassthroughDisplay()
    else
        -- Normal mode: full formatting and calculations
        UpdateNormalDisplay()
    end
end)
```

**Key Principle**: Never perform forbidden operations on Secrets. Design your display code with two paths—one that's fully "secret-safe" (passthrough) and one for normal display.

---

## Profiling

### Built-in tools

```lua
-- Enable CPU profiling (requires restart)
/console scriptProfile 1

-- View addon CPU usage
/run UpdateAddOnCPUUsage(); print(GetAddOnCPUUsage("YourAddon"))

-- View memory usage
/run UpdateAddOnMemoryUsage(); print(GetAddOnMemoryUsage("YourAddon"))
```

### Profiling workflow

1. **Baseline**: Measure current performance.
2. **Identify**: Find the expensive operation.
3. **Optimize**: Apply targeted fix.
4. **Verify**: Measure again to confirm improvement.

---

## Baseline Tracking and Regression Detection

The `ADDON_DEV` environment includes a performance profiling suite for tracking metrics across releases.

### Key Tools

| Tool | Command | Purpose |
|------|---------|---------|
| **In-Game Profiler** | `Profiler.lua` | Embeddable module for measuring CPU/Memory |
| **Baseline Tracker** | `perf.ps1 baseline` | Record a performance baseline for a version |
| **Regression Check** | `perf.ps1 check` | Compare current metrics against the latest baseline |
| **History Report** | `perf.ps1 report` | View historical trends and metrics |
| **Sub-Metrics** | `!Mechanic` Tab | Detailed breakdown via `performance.getSubMetrics` |

### Standard Workflow

1.  **Collect**: In-game, use `/myaddon perf report` or built-in commands to get `MemoryKB` and `CpuMS`.
2.  **Record**: Save these metrics as a baseline for your current version.
    ```powershell
    .\ADDON_DEV\Tools\PerformanceProfiler\perf.ps1 -Command baseline -Addon "Weekly" -Version "1.2.0" -MemoryKB 450 -CpuMS 2.5
    ```
3.  **Validate**: Before your next release, check your new metrics.
    ```powershell
    .\ADDON_DEV\Tools\PerformanceProfiler\perf.ps1 -Command check -Addon "Weekly" -MemoryKB 500 -CpuMS 3.0
    ```
    If metrics have increased beyond the threshold (50% for memory, 100% for CPU by default), the tool will flag a regression.

---

## Memory Tips

- Reuse tables instead of creating new ones.
- Use `wipe(table)` instead of `table = {}`.
- **Shared Constants**: Use a single `local EMPTY_TABLE = {}` for failure paths (`return EMPTY_TABLE`) instead of creating new empty tables `{}`.
- Avoid creating closures in hot paths.
- **String Allocations**: String concatenation (`"prefix_" .. id`) creates garbage. Use numeric keys directly in tables where possible.
- **Debug Logging**: `string.format()` evaluates its arguments **before** the function call. Guard heavy formatting with explicit checks:
  ```lua
  if DEBUG_ENABLED then
      Log(string.format("Expensive %s", GetData()))
  end
  ```

```lua
-- BAD: Creates new table every call
function GetData()
    return { a = 1, b = 2 }
end

-- GOOD: Reuse table
local dataTable = { a = 0, b = 0 }
function GetData()
    dataTable.a = 1
    dataTable.b = 2
    return dataTable
end
```

---

## Memory Lifecycle

It is normal for WoW memory usage to grow steadily between garbage collection (GC) cycles. This is expected Lua behavior. 
- **Baseline**: Memory usage immediately after a GC run.
- **Growth**: Accumulation of temporary objects (strings, tables) during gameplay.
- **Leaks**: If memory never returns to its baseline after a manually triggered GC run (`/run collectgarbage()`), you likely have a memory leak (e.g., storing objects in a global table without removing them).

---

## Identifying Latency Sources

### API Quirks (GCD misreporting)
Some APIs report temporary state that can cause visual delays if trusted blindly. 
**Example**: `C_Spell.GetSpellCooldown()` sometimes misreports the `activeCategory` as GCD (133) for 1-2 seconds after a long cooldown is cast. 

**Solution**: Use duration thresholds to verify categories:
```lua
local GCD_THRESHOLD = 1.5
local isActualGCD = info.activeCategory == GCD_CAT and info.duration <= GCD_THRESHOLD
```

### Ability-Specific Delays
Delays in tracking (buffs/bars) are often caused by:
- Buff spell IDs differing from the cast spell ID.
- Hidden `linkedSpellIDs` needing resolution via Blizzard's DataProvider.
- Target-based debuffs requiring `UNIT_AURA` checks on `target` instead of `player`.

---

## Blizzard Performance Patterns

Study how Blizzard optimizes in `wow-ui-source-live/`:

```lua
-- From Blizzard code - object pooling pattern
local framePool = CreateFramePool("Frame", parent, "MyTemplate")

-- Acquire frame from pool (reuses existing)
local frame = framePool:Acquire()
frame:Show()

-- Release back to pool when done
framePool:Release(frame)
```

See `Blizzard_FramePool/` in the UI source for implementation details.

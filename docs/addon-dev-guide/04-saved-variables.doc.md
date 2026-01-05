# SavedVariables Design

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2026-01-02

---

## Overview

SavedVariables persist data between sessions. Good design ensures smooth upgrades and prevents data corruption.

**Midnight Note**: No SavedVariables-specific changes have been announced for Midnight. However, design for missing/restricted combat data—Blizzard's focus is on API restrictions (Secret Values, combat log removal for addons), so ensure your addon handles missing combat data gracefully without corrupting saved state.

---

## Structure Pattern

Use a single top-level table with versioned structure:

```lua
-- Declare in TOC
## SavedVariables: AddonDB

-- Define defaults
local DEFAULTS = {
    version = 1,
    profile = {
        enabled = true,
        opacity = 1.0,
        position = { x = 0, y = 0 },
    }
}
```

---

## Deep-Merge Pattern

Never assume nested tables exist. Use a deep-merge on load:

```lua
local function CopyDefaults(target, defaults)
    for key, value in pairs(defaults) do
        if type(value) == "table" then
            if type(target[key]) ~= "table" then
                target[key] = {}
            end
            CopyDefaults(target[key], value)
        elseif target[key] == nil then
            target[key] = value
        end
    end
end

-- On ADDON_LOADED
function addon:OnLoad()
    AddonDB = AddonDB or {}
    CopyDefaults(AddonDB, DEFAULTS)
end
```

**Why**: New keys are additive, so older DBs upgrade smoothly.

> **Note**: This deep-merge pattern works well for **keyed/dictionary tables**. Arrays and history logs need explicit trimming and migration logic—deep-merge only fills missing numeric indices and won't prune removed entries.

---

## Profile Shape

Prefer a "profile" shape if you anticipate per-character vs account-wide later:

```lua
DEFAULTS = {
    profile = {
        -- Per-profile settings
        opacity = 1.0,
    },
    global = {
        -- Account-wide settings
        lastVersion = "1.0.0",
    },
    char = {
        -- Per-character overrides
    }
}
```

---

## Migration Pattern

When restructuring saved data:

```lua
-- Check for old structure and migrate
if AddonDB.oldKey then
    AddonDB.profile.newKey = AddonDB.oldKey
    AddonDB.oldKey = nil
end

-- Bump version after migration
if AddonDB.version < 2 then
    -- Migration logic
    AddonDB.version = 2
end
```

---

## Advanced Patterns

### Persistent Health Log (Self-Monitoring)

For complex addons, implement a "Health Log" to store critical internal errors, lifecycle events, and diagnostic data. This enables AI agents and developers to audit issues that occurred during previous sessions or reloads.

```lua
local DEFAULTS = {
    profile = {
        healthLog = {}, -- Persistent array of log entries
        maxHealthLogEntries = 100,
    }
}

function Addon:LogHealth(level, source, message)
    local log = self.db.profile.healthLog
    table.insert(log, 1, {
        timestamp = date("%Y-%m-%d %H:%M:%S"),
        level = level,   -- "ERROR", "WARN", "INFO"
        source = source, -- Module or function name
        message = message,
        stack = debugstack(2, 5, 0), -- Capture stack trace
    })
    
    -- Maintain size limit
    while #log > self.db.profile.maxHealthLogEntries do
        table.remove(log)
    end
end
```

**Benefits**:
- **Post-Mortem Analysis**: Audit why an addon failed even if the user didn't see an error.
- **Agent Auditing**: AI agents can use the `SavedVariablesInspector` tool to parse these logs and identify recurring issues.
- **Graceful Degradation**: Log when a feature is disabled due to errors.

> **Caution**: Storing full stack traces for every entry can bloat the SavedVariables file and slow load/save for heavy users. Consider omitting stack traces for INFO-level entries or truncating them. Very large SavedVariables files can also be corrupted if the game terminates unexpectedly (crash, power loss, Alt+F4), so keep DB size reasonable and make migrations resilient to partial data.

---

## What to Avoid

| Don't Store | Why |
|-------------|-----|
| Transient runtime values | Wastes space, may cause bugs |
| Frame objects | Cannot serialize |
| Function references | Cannot serialize |
| Localized strings as keys | Breaks on locale change |
| Huge data tables | Slows load/save |
| Secret Values (Midnight) | Cannot be compared/operated on; avoid persisting |

---

## Midnight Considerations

### Avoid Persisting Secret Values

In Midnight, some API returns may be Secret Values—a special construct where tainted code can pass them through but can't compare or operate on them. Some values may be conditionally secret (e.g., only secret when in combat). Avoid attempting to persist these:

```lua
-- BAD: May store a secret value
function SaveCombatData()
    local chargeInfo = C_Spell.GetSpellCharges(spellID)
    if chargeInfo then
        AddonDB.lastCharges = chargeInfo.currentCharges  -- Could be secret!
    end
end

-- GOOD: Only store when not secret
function SaveCombatData()
    local chargeInfo = C_Spell.GetSpellCharges(spellID)
    if chargeInfo and not (issecretvalue and issecretvalue(chargeInfo.currentCharges)) then
        AddonDB.lastCharges = chargeInfo.currentCharges
    end
end
```

### Store State, Not Combat Data

For Midnight compatibility, store user preferences and state, not combat analysis outputs. This aligns with Blizzard's intent to limit addon logic based on combat info:

```lua
-- Safe to store (user preference)
AddonDB.profile.showCooldownBars = true

-- Avoid storing (combat-derived, may be stale/secret)
AddonDB.lastCooldownDuration = 15  -- Don't do this
```

---

## AceDB Integration

If using Ace3, `AceDB-3.0` handles profiles automatically:

```lua
self.db = LibStub("AceDB-3.0"):New("AddonDB", DEFAULTS, true)
local profile = self.db.profile
```

See [Library Index](../AGENTS.md#library-index) for AceDB documentation.

---

## Reference

For examples of Blizzard's SavedVariables patterns, examine:

```
wow-ui-source-live/Interface/AddOns/Blizzard_Console/
wow-ui-source-live/Interface/AddOns/Blizzard_Settings/
```

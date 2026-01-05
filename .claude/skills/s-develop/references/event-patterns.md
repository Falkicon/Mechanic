# Event Patterns

Event-driven programming patterns for WoW addons.

## Event Registration

### Basic Registration

```lua
-- Frame-based
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        -- handle
    end
end)

-- Ace3-based (preferred)
function MyAddon:OnInitialize()
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
end

function MyAddon:PLAYER_ENTERING_WORLD(event, isLogin, isReload)
    -- handler named after event
end
```

### Unit Events

More efficient than global events:

```lua
-- Only fires for "player" unit
frame:RegisterUnitEvent("UNIT_HEALTH", "player")
frame:RegisterUnitEvent("UNIT_POWER_UPDATE", "player")

-- Multiple units
frame:RegisterUnitEvent("UNIT_AURA", "player", "target")
```

### Common Events

| Event | Fires When | Args |
|-------|------------|------|
| PLAYER_ENTERING_WORLD | Login, reload, zone | isLogin, isReload |
| PLAYER_LOGIN | Character fully loaded | none |
| ADDON_LOADED | Specific addon loads | addonName |
| PLAYER_REGEN_DISABLED | Enter combat | none |
| PLAYER_REGEN_ENABLED | Leave combat | none |
| UNIT_HEALTH | Health changes | unit |
| UNIT_AURA | Buffs/debuffs change | unit, updateInfo |
| PLAYER_TARGET_CHANGED | Target changes | none |
| CHAT_MSG_* | Chat messages | msg, sender, ... |

## Event Throttling

### Bucket Events (Ace3)

Batch rapid-fire events:

```lua
-- Fires at most once per 0.2 seconds
function MyAddon:OnEnable()
    self:RegisterBucketEvent("BAG_UPDATE", 0.2, "OnBagUpdate")
end

function MyAddon:OnBagUpdate(units)
    -- units is a table of all units that triggered
    self:ScanBags()
end
```

### Manual Throttling

```lua
local lastUpdate = 0
local THROTTLE = 0.1 -- seconds

frame:SetScript("OnEvent", function(self, event, ...)
    local now = GetTime()
    if now - lastUpdate < THROTTLE then return end
    lastUpdate = now
    
    -- handle event
end)
```

## Event Queuing

Queue operations for after combat:

```lua
local pendingQueue = {}

function MyAddon:QueueForAfterCombat(func, ...)
    if InCombatLockdown() then
        table.insert(pendingQueue, { func = func, args = {...} })
        self:RegisterEvent("PLAYER_REGEN_ENABLED")
    else
        func(...)
    end
end

function MyAddon:PLAYER_REGEN_ENABLED()
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    for _, item in ipairs(pendingQueue) do
        item.func(unpack(item.args))
    end
    wipe(pendingQueue)
end
```

## Custom Events (Ace3 Messages)

Inter-addon communication:

```lua
-- Sender addon
function MyAddon:OnDataReady(data)
    self:SendMessage("MYADDON_DATA_READY", data)
end

-- Receiver addon (or same addon)
function OtherAddon:OnEnable()
    self:RegisterMessage("MYADDON_DATA_READY")
end

function OtherAddon:MYADDON_DATA_READY(event, data)
    -- handle data from other addon
end
```

## Unregistering

```lua
-- Single event
self:UnregisterEvent("PLAYER_ENTERING_WORLD")

-- All events
self:UnregisterAllEvents()

-- Bucket events
self:UnregisterBucket(handle) -- returns handle from RegisterBucket
```

## Best Practices

1. **Register only what you need** - Don't register COMBAT_LOG_EVENT_UNFILTERED unless necessary
2. **Unregister when done** - Free resources when feature disabled
3. **Use unit events** - More efficient than global UNIT_* events
4. **Bucket rapid events** - BAG_UPDATE, UNIT_AURA fire frequently
5. **Document event dependencies** - Comment why you need each event

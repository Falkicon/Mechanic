# WoW API Patterns

Defensive programming and API resilience patterns.

## API Namespaces

### C_ Namespaces (Modern)

Organized, versioned APIs:

```lua
-- Map API
C_Map.GetBestMapForUnit("player")
C_Map.GetMapInfo(mapID)

-- Timer API
C_Timer.After(delay, callback)
C_Timer.NewTicker(interval, callback, iterations)

-- Item API
C_Item.GetItemInfo(itemID)
C_Item.GetItemLink(itemLocation)

-- Spell API
C_Spell.GetSpellInfo(spellID)
C_Spell.GetSpellCooldown(spellID)
```

### Global Functions (Legacy)

Still work but less organized:

```lua
GetSpellInfo(spellID)
UnitName("player")
UnitHealth("target")
GetMoney()
```

## Defensive API Calls

### Nil Handling

```lua
-- ❌ WRONG - crashes if target doesn't exist
local name = UnitName("target")
print(name:upper())

-- ✅ CORRECT - check before use
local name = UnitName("target")
if name then
    print(name:upper())
end

-- ✅ ALSO - provide fallback
local name = UnitName("target") or "No Target"
```

### pcall Protection

For APIs that might error:

```lua
-- Risky API call
local ok, result = pcall(function()
    return C_SomeNewAPI.GetData()
end)

if ok then
    -- use result
else
    -- result contains error message
    print("API failed:", result)
end

-- Direct pcall (faster)
local ok, data = pcall(C_Item.GetItemInfo, itemID)
```

### API Existence Check

```lua
-- Check if API exists before calling
if C_DateAndTime and C_DateAndTime.GetCurrentCalendarTime then
    local time = C_DateAndTime.GetCurrentCalendarTime()
end

-- For legacy functions
if GetSpellInfo then
    local name = GetSpellInfo(spellID)
end
```

## Secret Values (12.0+)

Some values are now hidden from addons:

```lua
-- May return restricted indicator
local mapID = C_Map.GetBestMapForUnit("player")
if mapID == nil then
    -- Player in hidden area or API restricted
end

-- Quest item counts may be secret
local _, _, count = GetItemInfo(itemID)
-- count might be 0 or hidden
```

### Detection

```lua
-- Check if value is a secret
local value = SomeAPI()
if type(value) == "userdata" then
    -- It's a secret/restricted value
end
```

## Common API Patterns

### Multi-Return Handling

```lua
-- GetSpellInfo returns many values
local name, rank, icon, castTime, minRange, maxRange, spellID = GetSpellInfo(12345)

-- Just get what you need
local name = GetSpellInfo(12345)
local _, _, icon = GetSpellInfo(12345)
local name, _, icon, castTime = GetSpellInfo(12345)

-- Modern: select()
local icon = select(3, GetSpellInfo(12345))
```

### Table Returns

```lua
-- API returns table
local info = C_Map.GetMapInfo(mapID)
if info then
    print(info.name, info.mapType)
end

-- Iterate returned table
local quests = C_QuestLog.GetQuestsOnMap(mapID)
if quests then
    for _, quest in ipairs(quests) do
        print(quest.questID, quest.x, quest.y)
    end
end
```

### Callback APIs

```lua
-- Some APIs require callback
C_Item.GetItemInfo(itemID) -- Returns immediately, may be nil

-- Listen for data ready
local frame = CreateFrame("Frame")
frame:RegisterEvent("GET_ITEM_INFO_RECEIVED")
frame:SetScript("OnEvent", function(self, event, receivedItemID, success)
    if receivedItemID == itemID and success then
        local name = C_Item.GetItemInfo(itemID)
        -- Now it's available
    end
end)
```

## Version Compatibility

### Interface Version Check

```lua
local _, _, _, interface = GetBuildInfo()
if interface >= 110200 then
    -- 11.2.0+ code
else
    -- Legacy fallback
end
```

### Feature Detection

```lua
-- Prefer feature detection over version checks
local function GetMapID()
    if C_Map and C_Map.GetBestMapForUnit then
        return C_Map.GetBestMapForUnit("player")
    elseif GetCurrentMapAreaID then
        return GetCurrentMapAreaID()
    end
    return nil
end
```

## Caching Expensive Calls

```lua
local cache = {}
local CACHE_DURATION = 5 -- seconds

function MyAddon:GetCachedData(key)
    local cached = cache[key]
    if cached and (GetTime() - cached.time) < CACHE_DURATION then
        return cached.data
    end
    
    local data = ExpensiveAPICall(key)
    cache[key] = { data = data, time = GetTime() }
    return data
end
```

## Best Practices

1. **Always check nil** - APIs return nil more than you expect
2. **Use pcall for new APIs** - They might not exist on all clients
3. **Feature detect** - Check if API exists before calling
4. **Cache expensive calls** - Don't call heavy APIs in OnUpdate
5. **Handle async data** - Some APIs need callbacks
6. **Read Blizzard source** - Best documentation is their code

## Deprecated API Reference

| Deprecated | Replacement |
|------------|-------------|
| GetSpellInfo() | C_Spell.GetSpellInfo() |
| GetSpecialization() | C_SpecializationInfo.GetSpecialization() |
| GetItemInfo() | C_Item.GetItemInfo() |
| UnitAura() | C_UnitAuras.GetAuraDataByIndex() |

Run `mech call addon.deprecations '{"addon": "MyAddon"}'` to scan for deprecated APIs.

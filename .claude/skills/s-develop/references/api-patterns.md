# WoW API Patterns

Defensive programming and API resilience patterns. Addon Lua is Lua 5.1.

## API Namespaces

### C_ Namespaces (modern)

Organized, versioned APIs:

```lua
C_Map.GetBestMapForUnit("player")
C_Map.GetMapInfo(mapID)

C_Timer.After(delay, callback)
C_Timer.NewTicker(interval, callback, iterations)

C_Item.GetItemInfo(itemID)

C_Spell.GetSpellInfo(spellID)          -- returns a SpellInfo table (or nil)
C_Spell.GetSpellCooldown(spellID)      -- returns a SpellCooldownInfo table
```

### Legacy globals

Pre-11.0 spell, item, container, add-on and spec globals (`GetSpellInfo`, `GetItemInfo`, `GetContainerItemInfo`, `GetAddOnInfo`, `GetSpecialization`, `UnitAura`, ...) moved into `C_` namespaces. Blizzard keeps compatibility wrappers for a while (see `Blizzard_Deprecated` in the UI source) and removes them over time: **do not write new code against them** and expect old code to break. Many of them also returned multiple values where the replacement returns a table.

`UnitName`, `UnitHealth`, `GetMoney` and similar unit/player globals are still current.

## Defensive API Calls

### Nil handling

```lua
-- WRONG - errors if there is no target
local name = UnitName("target")
print(name:upper())

-- CORRECT
local name = UnitName("target")
if name then print(name:upper()) end

-- ALSO - fallback
local name = UnitName("target") or "No Target"
```

### API existence check

```lua
if C_DateAndTime and C_DateAndTime.GetCurrentCalendarTime then
    local time = C_DateAndTime.GetCurrentCalendarTime()
end
```

### pcall for uncertain APIs

```lua
local ok, result = pcall(C_SomeNewAPI.GetData)
if ok then
    -- use result
else
    MechanicLib:Log("MyAddon", "API failed: " .. tostring(result), MechanicLib.Categories.API)
end
```

Do not wrap every call in `pcall`; it hides real bugs. Feature-detect first, `pcall` only where an API can legitimately error.

## Secret Values (12.0+)

In protected contexts (combat, some instances) certain APIs return **secret values**: opaque values that tainted code may store and pass to some APIs but cannot compare, do arithmetic on, concatenate or index. Violating that raises a Lua error.

```lua
local value = SomeAPI()
if issecretvalue and issecretvalue(value) then
    -- opaque: display through APIs that accept secrets, or skip
else
    -- normal value: safe to compare, add, concatenate
end
```

- `issecretvalue(value)` is the primary check and the one Mechanic itself uses. It does not exist before 12.0, so guard with `issecretvalue and ...` when you support older clients.
- `InCombatLockdown()` is not a reliable proxy: check the value, not the situation.
- Never log, concatenate, sort or compare a secret. Use the `MechanicLib.Categories.SECRET` tag for notes about secret handling.
- `type(value) == "userdata"` is a rough fallback signal only; prefer `issecretvalue`.
- Details and helper functions: `docs/addon-dev-guide/13-midnight-secret-values.doc.md` and `09-api-resilience.doc.md`. Mechanic's API tab flags APIs that can return secrets.

## Common API Patterns

### Info-table returns

```lua
-- Modern spell APIs return tables, not multiple values
local info = C_Spell.GetSpellInfo(12345)
if info then
    print(info.name, info.iconID, info.castTime)
end

local cd = C_Spell.GetSpellCooldown(12345)
if cd then print(cd.startTime, cd.duration, cd.isEnabled) end

local map = C_Map.GetMapInfo(mapID)
if map then print(map.name, map.mapType) end
```

Check the exact field names in `Blizzard_APIDocumentationGenerated` or with `api.info(api_name="C_Spell.GetSpellInfo")`.

### Multiple returns (where APIs still use them)

```lua
local name, realm = UnitName("player")
local _, class = UnitClass("player")
local icon = select(3, SomeMultiReturnAPI())
```

### Async data

```lua
-- C_Item.GetItemInfo may return nil until the client has the data
local frame = CreateFrame("Frame")
frame:RegisterEvent("GET_ITEM_INFO_RECEIVED")
frame:SetScript("OnEvent", function(self, event, receivedItemID, success)
    if receivedItemID == itemID and success then
        local name = C_Item.GetItemInfo(itemID)
    end
end)
```

## Version Compatibility

```lua
local _, _, _, interface = GetBuildInfo()
if interface >= 120000 then
    -- 12.0+ code (secret values exist)
end
```

Prefer feature detection (`if C_Spell and C_Spell.GetSpellInfo`) over version checks.

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

1. **Check nil** - APIs return nil more than you expect.
2. **Feature-detect** new APIs; `pcall` sparingly.
3. **Check `issecretvalue`** before touching values from combat-sensitive APIs.
4. **Cache** expensive calls; do not call heavy APIs in `OnUpdate`.
5. **Handle async data** with the matching event.
6. **Read Blizzard's source**: `Blizzard_APIDocumentationGenerated` and `Blizzard_Deprecated` are the reference ([s-research](../../s-research/SKILL.md)).

## Deprecated API reference

| Deprecated | Replacement |
|------------|-------------|
| `GetSpellInfo()` | `C_Spell.GetSpellInfo()` (table return) |
| `GetSpellCooldown()` | `C_Spell.GetSpellCooldown()` (table return) |
| `GetItemInfo()` | `C_Item.GetItemInfo()` |
| `GetContainerItemInfo()` | `C_Container.GetContainerItemInfo()` |
| `GetAddOnInfo()`, `GetAddOnMetadata()`, `IsAddOnLoaded()`, `LoadAddOn()` | `C_AddOns.GetAddOnInfo()`, `C_AddOns.GetAddOnMetadata()`, `C_AddOns.IsAddOnLoaded()`, `C_AddOns.LoadAddOn()` |
| `GetSpecialization()` | `C_SpecializationInfo.GetSpecialization()` |
| `UnitAura()` / `UnitBuff()` / `UnitDebuff()` | `C_UnitAuras.GetAuraDataByIndex()` and related |

Use the `addon.deprecations` MCP tool to scan an addon, but note it ships only a **3-API seed database** today (it warns `DEPRECATION_DB_LIMITED`), so also grep for the names above ([s-audit](../../s-audit/SKILL.md)).

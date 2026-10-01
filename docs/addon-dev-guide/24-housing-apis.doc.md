# Housing APIs

> Part of the [Addon Development Guide](./AGENTS.md)

Last updated: 2026-01-16

---

## Overview

Midnight (12.0) introduces **Player Housing**, a new social and customization feature. This guide covers the APIs available for addon developers.

> [!NOTE]
> Housing APIs are new in 12.0.1 Beta. Some behaviors may change before launch.

---

## C_Housing Namespace

| API | Description |
|-----|-------------|
| `C_Housing.GetDecorInventoryLimit()` | Returns the maximum number of decor items a player can store |
| `C_Housing.DeleteExcessDecor(decorID)` | Deletes a decor item to clean up inventory |

### Example: Inventory Management

```lua
local maxItems = C_Housing.GetDecorInventoryLimit()
print("Decor inventory limit:", maxItems)

-- Clean up excess items (use with caution)
local function CleanupDecor(decorID)
    if InCombatLockdown() then return end
    C_Housing.DeleteExcessDecor(decorID)
end
```

---

## Housing Events

| Event | Description |
|-------|-------------|
| `REMOVE_NEIGHBORHOOD_CHARTER_SIGNATURE` | Fired when a neighborhood charter signature is removed |
| `SECURE_TRANSFER_HOUSING_CURRENCY_PURCHASE_CONFIRMATION` | Confirmation event for secure housing currency transactions |

### Neighborhood System

"Neighborhoods" are a social layer above guilds for housing communities:

```lua
local function OnNeighborhoodEvent(self, event, ...)
    if event == "REMOVE_NEIGHBORHOOD_CHARTER_SIGNATURE" then
        -- A signature was removed from a neighborhood charter
        local charterID, signerName = ...
        print("Signature removed:", signerName)
    end
end

eventFrame:RegisterEvent("REMOVE_NEIGHBORHOOD_CHARTER_SIGNATURE")
eventFrame:SetScript("OnEvent", OnNeighborhoodEvent)
```

### Secure Currency Transactions

Housing uses new currencies: **Lumber** and **Legacy**

The `SECURE_TRANSFER_HOUSING_CURRENCY_PURCHASE_CONFIRMATION` event ensures that spending these currencies requires a **hardware click** (like mounts/pets):

```lua
-- This event fires when a secure housing purchase is confirmed
local function OnSecurePurchase(self, event, currencyType, amount)
    print("Housing purchase confirmed:", currencyType, amount)
end
```

---

## Tooltip Integration

The DecorID system is linked to `C_TooltipInfo`:

```lua
-- Extract housing item data from a tooltip
local function GetDecorFromTooltip(tooltip)
    if TooltipUtil and TooltipUtil.SurfaceDecorID then
        local decorID = TooltipUtil.SurfaceDecorID(tooltip)
        if decorID then
            return decorID
        end
    end
    return nil
end

-- Hook into GameTooltip
GameTooltip:HookScript("OnTooltipSetItem", function(self)
    local decorID = GetDecorFromTooltip(self)
    if decorID then
        self:AddLine("Decor ID: " .. decorID, 0.5, 0.8, 1.0)
    end
end)
```

---

## Content Tracking Integration

Housing items can be tracked using the expanded `C_ContentTracking` system:

```lua
-- New in 12.0.1: QuestObjective target type
local targetType = Enum.ContentTrackingTargetType.QuestObjective  -- ID 4

-- Track specific quest objectives on world map independently
C_ContentTracking.SetTrackedTarget(targetType, objectiveID)
```

---

## Best Practices

1. **Check API existence** - Housing APIs may not exist on older clients
2. **Respect combat lockdown** - Inventory modifications blocked in combat
3. **Use secure patterns** - Currency transactions require hardware events
4. **Cache data** - Pre-seed housing data outside of instances

```lua
-- Defensive pattern for housing APIs
local function SafeGetDecorLimit()
    if C_Housing and C_Housing.GetDecorInventoryLimit then
        return C_Housing.GetDecorInventoryLimit()
    end
    return nil
end
```

---

## See Also

- [API Changelog](../api-changelog.md) - Track API changes by date
- [Secret Values](./13-midnight-secret-values.doc.md) - Housing values in combat
- [Midnight Readiness](./12-midnight-readiness.doc.md) - Preparation overview

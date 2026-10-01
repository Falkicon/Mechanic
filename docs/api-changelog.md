# WoW API Changelog

> Tracking significant WoW API changes that affect addon development.  
> Use this to quickly identify what changed since your last session.

Last updated: **2026-01-16** (content). Reviewed 2026-09-30: no content change.

> **Coverage gap**: this page covers 12.0.1 (Midnight beta, January 2026) only. It has no entries for Retail 12.1.0, which Mechanic's TOCs target (`## Interface: 120100`), and the local `wow-ui-source` checkouts available when this was reviewed contained no 12.1 data to verify against. Mechanic's generated API definitions (`Mechanic/UI/APIDefs`, about 4,500 APIs) come from Blizzard's 12.0.1.64914 documentation, so API facts in `api.info` and the in-game API tab reflect that build, not 12.1.0. Use Blizzard's patch notes and the regenerated definitions (`api.refresh`) for newer builds.

---

## 12.0.1 (Midnight Beta) — January 2026

### Secret Values System Refinements

| Date | Change | Impact |
|------|--------|--------|
| 2026-01-16 | **Table Secrecy De-escalation** | Tables from `C_` APIs now only mark specific sensitive values as secret, not the entire table. Addons can iterate tables and check non-sensitive keys. |
| 2026-01-16 | **`type()` will return `"secret"`** | ⚠️ **PENDING**: `type(secretValue)` currently returns underlying type (e.g., `"number"`). Blizzard warns this WILL change to return `"secret"`. Do NOT use `type(v) == "secret"` yet. |
| 2026-01-16 | **AuraInstanceIDs confirmed non-secret** | `auraInstanceID` is now confirmed non-secret even in M+/Raids. Safe for cache keys. |
| 2026-01-16 | **Aura vectors no longer secret** | Vectors from `GetUnitAuras` and `UNIT_AURA` event are now readable. Contents (durations) may still be secret. |

### New APIs

| API | Description |
|-----|-------------|
| `C_Secrets.GetSpellAuraSecrecy(spellID)` | Check if spell aura data will be secret |
| `C_Secrets.GetSpellCooldownSecrecy(spellID)` | Check if spell cooldown will be secret |
| `C_Secrets.GetSpellCastSecrecy(spellID)` | Check if spell cast data will be secret |
| `C_Secrets.GetPowerTypeSecrecy(powerType)` | Check if power type will be secret |
| `C_Secrets.ShouldUnitHealthMaxBeSecret(unit)` | Check if unit health max will be secret |
| `FrameScriptObject:HasSecretValues()` | Check if a frame has been tainted by secret data |
| `SecondsFormatter` | Global object to format secret durations as strings |

### Testing CVars for Developers

```
secretAurasForced = 1           -- Force aura data to return as secrets
secretCooldownsForced = 1       -- Force cooldown data to be secret
secretSpellcastsForced = 1      -- Force spellcast data to be secret
secretUnitPowerForced = 1       -- Force power/energy/mana as secrets
secretCombatRestrictionsForced = 1  -- Simulate restricted environment
secretChallengeModeRestrictionsForced = 1  -- Simulate M+ environment
```

### Spell Whitelist Expansion

Non-secret even in combat:
- All **Skyriding spells** (372608, 361584, 372610) — flight UI
- **GCD spell** (61304)
- **Devourer Demon Hunter** resource spells
- **Combat Resurrection** spells — raid frame battle-res tracking

### Enemy Nameplate Changes

| Change | Details |
|--------|---------|
| Colorization **relaxed** | Addons can programmatically change enemy nameplate colors again |
| **Restriction** | Color logic must not rely on secret values unless using `C_CurveUtil` color mapping functions |

### Achievement System Breaking Change

| OLD Behavior (11.x) | NEW Behavior (12.0.1) |
|---------------------|----------------------|
| `GetAchievementCriteriaInfo(invalidID)` returns `nil` | **Hard Lua error** — crashes the script |

**Required fix**: Wrap calls in `pcall` or check criteria existence first.

### Housing APIs (New System)

| API | Description |
|-----|-------------|
| `C_Housing.GetDecorInventoryLimit()` | Max items in decor inventory |
| `C_Housing.DeleteExcessDecor(decorID)` | Clean up excess inventory |
| `TooltipUtil.SurfaceDecorID(tooltip)` | Extract housing item data from tooltips |

**Events:**
- `REMOVE_NEIGHBORHOOD_CHARTER_SIGNATURE` — Neighborhood social feature
- `SECURE_TRANSFER_HOUSING_CURRENCY_PURCHASE_CONFIRMATION` — Secure housing purchases (Lumber/Legacy currencies)

### Tracking & Collections

| API | Description |
|-----|-------------|
| `Enum.ContentTrackingTargetType.QuestObjective` (ID 4) | Track specific quest objectives on world map |
| `C_Transmog.GetSlotCondition()` | Query slot-based transmog auto-swap conditions |

---

## 12.0.0 (Midnight Pre-Patch) — January 20, 2026

### Secret Values System (Initial)

- **Combat log events** no longer fire for addons
- **Combat log messages** converted to KStrings (unparseable)
- **Instance chat** can become secret during encounters
- **Addon communications** blocked during M+/raids

### Key Date References

- **Pre-patch**: January 20, 2026
- **Full release**: March 2, 2026

---

## 11.2.7 (The War Within) — Current Live

See [12-midnight-readiness.doc.md](./addon-dev-guide/12-midnight-readiness.doc.md) for preparation steps.

---

## Version Upgrade Path

```
11.2.7 (Live)  →  12.0.0 (Pre-Patch: Jan 20)  →  12.0.1 (Midnight Release)
```

**Key Considerations:**
1. Test on PTR/Beta before pre-patch
2. Secret value handling must be in place by Jan 20
3. Achievement `pcall` wrappers needed for 12.0.1
4. Housing APIs arrive with 12.0.1

---

## Quick Reference: Detection Code

```lua
local IS_MIDNIGHT = (select(4, GetBuildInfo()) >= 120000)

-- Check if value is secret
local function IsValueSecret(value)
    if not IS_MIDNIGHT then return false end
    if issecretvalue then
        return issecretvalue(value) == true
    end
    -- Fallback (until type() returns "secret")
    return type(value) == "userdata"
end

-- Query secrecy BEFORE reading (12.0.1+)
local function WillAuraBeSecret(spellID)
    if C_Secrets and C_Secrets.GetSpellAuraSecrecy then
        return C_Secrets.GetSpellAuraSecrecy(spellID)
    end
    return nil -- Unknown
end
```

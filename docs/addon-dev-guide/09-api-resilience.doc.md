# API Resilience

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2026-01-02

---

## Overview

WoW APIs change between patches. Defensive programming keeps your addon working when changes happen.

**Midnight Alert**: The 12.0 expansion brings the largest API changes in years. Many spell, aura, and combat APIs now return "secret values" in combat. Prepare now.

### Midnight API Handling (12.0)
Midnight introduces **Secret Values**—a new Lua construct where tainted (insecure) code can receive and pass Secrets into certain APIs, but **cannot compare them or do arithmetic on them** without causing Lua errors.

**Key Points** (from Blizzard's Midnight Alpha notes):
1. **Detection**: Use `issecretvalue(val)` to check if a return is opaque.
2. **Script Object Marking**: Passing a Secret into a script object API can "mark" that object as Secret, causing some getters to return Secrets.
3. **Helper Functions**: `HasSecretValues()`, `HasSecretAspect()`, `IsAnchoringSecret()`, and `SetToDefaults()` to clear secret state.
4. **No Comparison/Arithmetic**: Never compare or perform arithmetic on Secrets—design code paths that avoid forbidden operations.

### Midnight Data Availability Changes
Beyond type-safety, Midnight affects **data availability**:
- **Combat log events** are no longer available to addons
- **Combat log chat-tab messages** become KStrings (unparseable)
- **Instance chat** delivered to Lua can become Secret
- **Addon communications** are blocked while in an instance

---

## Known API Quirks

Some APIs have inconsistent return values that require defensive logic beyond simple nil checks.

### GCD Category Misreporting (Anecdotal)
`C_Spell.GetSpellCooldown(spellID)` may incorrectly report `activeCategory` as the Global Cooldown (GCD) category for 1-2 seconds after a long cooldown is cast.

**Impact**: If your code hides cooldown indicators when `activeCategory` is GCD, the cooldown may "flicker" or disappear immediately after cast.

**Solution**: Combine category checks with duration thresholds. Only treat a cooldown as GCD if the duration is also within typical GCD limits (≤ 1.5s).

> **Note**: This behavior is based on community reports; verify against your specific use case.

---

## Defensive Programming

### Always nil-check optional APIs

```lua
-- BAD: Will error if API doesn't exist
local result = C_Something.GetData()

-- GOOD: Check existence first
if C_Something and C_Something.GetData then
    local result = C_Something.GetData()
end
```

### Design Code Paths to Avoid Secret Operations
In Midnight, the better pattern is designing code paths that **avoid forbidden operations on Secrets** (comparisons, arithmetic, string formatting) rather than relying on `pcall` to catch errors.

```lua
-- Pattern: Check for secrets BEFORE operating
local function SafeUpdateHealth(unit)
    local health = UnitHealth(unit)
    
    -- In Midnight, check if value is secret before comparing/formatting
    if issecretvalue and issecretvalue(health) then
        healthText:SetText("---")  -- Graceful degradation
        return
    end
    
    -- Safe to format since we know it's not secret
    healthText:SetText(AbbreviateNumbers(health))
end
```

> **Note**: `pcall` can prevent crashes, but it's a last resort. Prefer detecting secrets early and avoiding forbidden operations entirely.

---

## Prefer C_ Namespaced APIs

Blizzard increasingly organizes APIs into `C_*` namespaces. These are:

- More stable across patches.
- Better documented.
- Less likely to be removed without notice.

### Current API Mappings (11.0+)

Reference: `wow-ui-source-live/Interface/AddOns/Blizzard_Deprecated/11_0_0_SpellBookAPITransitionGuide.lua`

| Old API | New C_ API |
|---------|-----------|
| `GetSpellInfo(id)` | `C_Spell.GetSpellInfo(spellIdentifier)` |
| `GetSpellCooldown(id/name)` | `C_Spell.GetSpellCooldown(spellIdentifier)` |
| `GetSpellCharges(id)` | `C_Spell.GetSpellCharges(spellIdentifier)` |
| `IsUsableSpell(id)` | `C_Spell.IsSpellUsable(spellIdentifier)` |
| `GetSpellTexture(id)` | `C_Spell.GetSpellTexture(spellIdentifier)` |
| `SpellHasRange(id)` | `C_Spell.SpellHasRange(spellIdentifier)` |
| `IsSpellInRange(id)` | `C_Spell.IsSpellInRange(spellIdentifier)` |

### Return Type Changes (Info Tables)

Per Blizzard's transition guide, cooldown and charges APIs now return **info tables** (`SpellCooldownInfo`, `SpellChargeInfo`) rather than multiple return values:

```lua
-- OLD (deprecated)
local start, duration, enable = GetSpellCooldown(spellID)

-- NEW (11.0+) - Returns SpellCooldownInfo table
local info = C_Spell.GetSpellCooldown(spellID)
if info then
    local start = info.startTime
    local duration = info.duration
    local enable = info.isEnabled
end
```

### SpellBook API Changes (11.0+)

For spellbook-index based APIs (`C_SpellBook.*`), the `bookType` string parameters (`"spell"`, `"pet"`) are replaced with `Enum.SpellBookSpellBank`:

```lua
-- OLD
local name = GetSpellBookItemName(slot, "spell")

-- NEW (11.0+)
local name = C_SpellBook.GetSpellBookItemName(slot, Enum.SpellBookSpellBank.Player)
```

### Method Naming Standardization (11.0+)

Blizzard uses consistent naming for animation methods. If you encounter `nil value` errors on animation methods, verify the correct names against FrameXML:

| System | Current Name |
|--------|--------------|
| **Animation (Scale)** | `SetScaleFrom(x, y)`, `SetScaleTo(x, y)` |
| **Animation (Alpha)** | `SetFromAlpha(val)`, `SetToAlpha(val)` |
| **Animation (Translation)** | `SetOffset(x, y)` |

> **Note**: The specific deprecation timeline for legacy names (if any) should be verified against FrameXML or API docs for your target build.

---

## Compatibility Layer

Keep a small compat layer for version differences:

```lua
-- Compat.lua
local _, ns = ...

local interfaceVersion = select(4, GetBuildInfo())
ns.IS_RETAIL = interfaceVersion >= 100000
ns.IS_TWW = interfaceVersion >= 110000
ns.IS_MIDNIGHT = interfaceVersion >= 120000

-- Wrap API with version-specific handling
ns.GetSpellCooldownInfo = function(spellID)
    if C_Spell and C_Spell.GetSpellCooldown then
        return C_Spell.GetSpellCooldown(spellID)
    end
    return nil
end

-- Midnight secret value handling
ns.SafeGetSpellCharges = function(spellID)
    local info = C_Spell.GetSpellCharges(spellID)
    if not info then return nil, false end
    
    -- Check for secret values in Midnight
    if ns.IS_MIDNIGHT and issecretvalue and issecretvalue(info.currentCharges) then
        return info, true  -- Return info (for passthrough) and flag
    end
    
    return info, false
end
```

---

## Stable Identifiers

### Use spell IDs, not names

```lua
-- BAD: Breaks on locale change
local FIREBALL = "Fireball"
if spellName == FIREBALL then

-- GOOD: Stable across all locales
local FIREBALL_ID = 133
if spellID == FIREBALL_ID then
```

### If accepting user input by name

Match loosely but store the stable ID:

```lua
function FindSpellByName(inputName)
    inputName = inputName:lower()
    for id, data in pairs(knownSpells) do
        if data.name:lower():find(inputName) then
            return id  -- Return stable ID
        end
    end
    return nil
end
```

---

## Interface Version Checking

```lua
local interfaceVersion = select(4, GetBuildInfo())

-- Check for specific expansion
local IS_RETAIL = interfaceVersion >= 100000
local IS_TWW = interfaceVersion >= 110000
local IS_MIDNIGHT = interfaceVersion >= 120000

-- Feature flags based on version
if IS_MIDNIGHT then
    -- Use new API and handle secret values
else
    -- Use current API
end
```

---

## Handling API Deprecation

When an API is deprecated:

1. **Check Blizzard's transition guides** in `wow-ui-source-live/Interface/AddOns/Blizzard_Deprecated/`.
2. **Add compat wrapper** that uses new API with fallback.
3. **Test both paths** on PTR and live.
4. **Remove fallback** after 1-2 patches.

---

## Midnight API Changes Summary

### Core Principle
Treat Secrets as **opaque**—never compare, do arithmetic, or format them unless the API explicitly guarantees non-secret returns. Doing so raises Lua errors in tainted code.

### Secret Value Handling Pattern

```lua
-- Pass secrets into script object setters that support them
local texture = frame:CreateTexture()
texture:SetTexture(someTextureID)  -- May be secret; texture object handles it

-- Expect that some related getters may then return Secrets
local id = texture:GetTexture()  -- May return a Secret after setting a secret
```

### Passthrough Pattern (Conceptual)
Blizzard's intent is that certain display widgets can accept secret values for display without addons needing to inspect them. The general pattern:

```lua
-- Forward values without inspection
statusBar:SetValue(potentiallySecretValue)
cooldown:SetCooldown(startTime, duration)  -- Values may be secret
```

> **Verify**: Specific widget/method support for secret values should be verified against official documentation or beta testing for your target build. Blizzard's Midnight notes describe the mechanism but don't enumerate all compatible APIs.

---

## Testing Strategy

1. **PTR testing** - Test on Public Test Realm before patches go live.
2. **Beta testing** - Test expansion betas early.
3. **Script errors enabled** - `/console scriptErrors 1`
4. **Track deprecation warnings** - Watch for Blizzard warnings in chat.
5. **Test in instances** - Midnight restrictions are instance-specific.

See [Midnight Readiness](./12-midnight-readiness.doc.md) for expansion-specific preparation.

---

## Blizzard API Documentation

Use the generated API documentation in the UI source:

```
wow-ui-source-live/Interface/AddOns/Blizzard_APIDocumentationGenerated/
├── SpellDocumentation.lua           # C_Spell namespace
├── SpellBookDocumentation.lua       # C_SpellBook namespace
├── UnitDocumentation.lua            # Unit functions
├── AuraDocumentation.lua            # C_UnitAuras namespace
└── ...
```

These files contain the official function signatures, parameters, and return types.

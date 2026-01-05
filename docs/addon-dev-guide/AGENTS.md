# Addon Development Guide - Agent Overview

> **Purpose**: Quick reference index for AI agents working on WoW addon development. This document summarizes all 23 guides with key cliff notes for fast context retrieval.

**Last updated**: 2025-12-25

---

## Quick Facts

| Item | Value |
|------|-------|
| **Total Guides** | 23 modular documents |
| **Current PTR Build** | 11.2.8 / 12.0.0 (Midnight pre-expansion) |
| **Interface Version** | `120001` or `120000` (Midnight) |
| **Midnight Pre-patch** | January 20, 2026 |
| **Midnight Release** | March 2, 2026 |

---

## Master Cliff Notes (Top 20 Critical Facts)

These are the most important facts across all guides that agents should internalize:

### Architecture & Design
1. **Event-driven, not polling** - Use events (`SPELL_UPDATE_COOLDOWN`, `UNIT_HEALTH`) instead of `OnUpdate` polling whenever possible.
2. **Combat is constrained** - Many actions are blocked during `InCombatLockdown()`. Queue changes for `PLAYER_REGEN_ENABLED`.
3. **Prefer C_ namespaced APIs** - `C_Spell.*`, `C_UnitAuras.*` are stable and documented; legacy APIs are deprecated.
4. **Use stable identifiers** - Spell IDs, not localized names. Names break on locale change.

### Midnight (12.0) Critical
5. **Secret values cannot be read** - API returns become opaque during combat in instances. Cannot compare, format, or use in arithmetic.
6. **Passthrough widgets work** - `StatusBar:SetValue()` and `Cooldown:SetCooldown()` accept secret values directly.
7. **Combat log is gone** - `COMBAT_LOG_EVENT_UNFILTERED` no longer fires for addons. Plan alternatives.
8. **Taint cascades** - Modifying Blizzard frame anchors/parents can cause secret value errors in *Blizzard's* code.
9. **Helper APIs exist** - `UnitHealth(unit, true)` returns displayable (non-secret) value. `UnitHealthPercent()` returns readable percentage.
10. **Use `C_Timer.After(0)`** - Breaks taint chain when styling Blizzard frames in combat hooks.

### SavedVariables & Data
11. **Deep-merge defaults** - Never assume nested tables exist. Use `CopyDefaults()` pattern on `ADDON_LOADED`.
12. **Never store secret values** - They cannot be serialized. Check `issecretvalue()` before saving.
13. **Version your DB** - Include `version` field for migration logic.

### UI & Frames
14. **Create once, reuse forever** - Widget pools, not frame recreation. Use `Hide()` not destroy.
15. **Single root frame pattern** - Easier visibility management and cleanup.
16. **Throttle OnUpdate** - 0.1s minimum throttle for polling updates.

### Combat & Security
17. **Secure templates only when needed** - Only for buttons that cast spells/target units. Display-only addons don't need them.
18. **State drivers for auto-behavior** - `RegisterStateDriver(frame, "visibility", "[combat] show; hide")`
19. **hooksecurefunc for safe hooks** - Post-hooks are safe; avoid pre-hooks on protected frames.

### Release & Quality
20. **Always provide `/addon status` and `/addon debug`** - First-class debugging is non-negotiable.

---

## Guide Index & Summaries

### Foundations (01-04)

#### 01 - Core Principles
**File**: `01-core-principles.doc.md`

**Summary**: Foundational design philosophy for building reliable addons that survive patches and Midnight.

**Key Points**:
- Prefer stable, minimal surface area (fewer dependencies = fewer breakage points)
- Treat combat as constrained runtime (many actions blocked)
- Build on events, not polling (performance + resilience)
- Make every feature degradable (fail "closed" not spamming errors)
- Make debugging first-class (status + debug dump commands)

**Midnight Impact**: All principles become more critical. Addons with broad introspection (frame scanning, global hooking) are most affected.

---

#### 02 - Project Structure
**File**: `02-project-structure.doc.md`

**Summary**: Recommended file layout, AI-augmented workflow, and development environment setup.

**Key Points**:
- Standard layout: `Core.lua`, `UI.lua`, `Data.lua`, `Config.lua`, `Compat.lua`
- Use `Compat.lua` for version-specific code and Midnight transition
- Modular files improve load performance (smaller files parse faster)
- VS Code extensions: Ketho's WoW API, Septh's WoW Bundle, Stanzilla's WoW TOC
- Blizzard UI Source is primary reference: `wow-ui-source-live/`

---

#### 03 - TOC Best Practices
**File**: `03-toc-best-practices.doc.md`

**Summary**: TOC file configuration for metadata, load order, and SavedVariables.

**Key Points**:
- `## Interface: 120001` - Must match client version
- Load order matters: Libraries → Compat → Core → Data → UI → Config
- `## SavedVariables: AddonDB` - Unique names to avoid conflicts
- Multi-version support: `## Interface-Retail`, `## Interface-Classic`
- Check version: `/dump select(4, GetBuildInfo())`

---

#### 04 - SavedVariables
**File**: `04-saved-variables.doc.md`

**Summary**: Persistent data design, versioning, and migration patterns.

**Key Points**:
- Single top-level table with versioned structure
- Deep-merge defaults on load (new keys additive)
- Profile shape: `{ profile = {}, global = {}, char = {} }`
- Migration pattern: Check old structure, migrate, bump version
- **Never store**: Frame objects, functions, localized string keys, secret values

---

### UI & Configuration (05-06)

#### 05 - UI Engineering
**File**: `05-ui-engineering.doc.md`

**Summary**: Frame creation, layout, responsiveness, and Midnight-safe patterns.

**Key Points**:
- Single root frame, widget recycling (create once, reuse)
- Data-driven layout (LAYOUT table with padding, heights)
- **Atlas Icons**: Use `addon-dev atlas search <keyword>` to find Blizzard icons.
- Throttle OnUpdate (0.1s minimum)
- **Midnight patterns**: StatusBar passthrough, Cooldown passthrough, `SetAlpha(0)` instead of `Hide()` in combat
- Study Blizzard: `Blizzard_ActionBar/`, `Blizzard_UnitFrame/`, `Blizzard_Cooldown/`

---

#### 06 - Configuration UI
**File**: `06-configuration-ui.doc.md`

**Summary**: Native Blizzard Settings API and AceConfig patterns.

**Key Points**:
- Prefer native Settings API (discoverable, future-proof, no dependencies)
- `Settings.RegisterVerticalLayoutCategory()`, `Settings.CreateCheckbox()`
- Type strictness is critical for dropdowns (consistent string or number keys)
- Proxy settings for scale conversion (UI 0-100, stored 0.0-1.0)
- **Midnight**: `C_SettingsUtil.NotifySettingsLoaded()` replaces old API

---

### Combat & Performance (07-08)

#### 07 - Combat Lockdown
**File**: `07-combat-lockdown.doc.md`

**Summary**: Protected actions, taint, secure templates, and Midnight combat restrictions.

**Key Points**:
- `InCombatLockdown() == true` blocks: `SetAttribute()`, secure button clicks, protected frame modifications
- Queue pattern: Store pending changes, apply on `PLAYER_REGEN_ENABLED`
- `hooksecurefunc()` for safe post-hooks
- **Midnight**: Combat log events removed, instance chat secret, addon communication blocked
- Visual taint: `Hide()`, `ClearAllPoints()`, `SetParent()` on secure frames causes taint in Midnight

---

#### 08 - Performance
**File**: `08-performance.doc.md`

**Summary**: Caching, throttling, profiling, and memory management.

**Key Points**:
- Local upvalues for hot paths: `local math_floor = math.floor`
- Spell/icon caching with event-based invalidation (`SPELLS_CHANGED`)
- Adaptive throttling (faster when visible, slower when idle)
- Profiling: `/run UpdateAddOnCPUUsage(); print(GetAddOnCPUUsage("Addon"))`
- **Avoid**: Frame scanning, creating frames in OnUpdate, string concat in loops
- **Midnight**: Cache secret mode once at combat start, not every frame

---

### API & Debugging (09-10)

#### 09 - API Resilience
**File**: `09-api-resilience.doc.md`

**Summary**: Defensive programming, API transitions, and compatibility layers.

**Key Points**:
- Always nil-check optional APIs: `if C_Something and C_Something.GetData then`
- Prefer C_ namespaced APIs (stable, documented)
- API mappings: `GetSpellInfo()` → `C_Spell.GetSpellInfo()`
- Return type changes: Some APIs return tables instead of multiple values
- Compat layer: `ns.IS_MIDNIGHT = interfaceVersion >= 120000`
- **GCD quirk**: `activeCategory` misreports for 1-2s after long cooldown cast

---

#### 10 - Debugging
**File**: `10-debugging.doc.md`

**Summary**: In-game diagnostics, error capture, and Midnight-aware debugging.

**Key Points**:
- **!Mechanic**: Primary hub for frame auditing (`/mech inspect`), console logging, and performance metrics.
- **Pin Pattern (📌)**: Click pin in Inspect tree to assign frame to `_G.f` for fast chat commands (e.g., `/run f:Hide()`).
- Every addon needs: `/addon status` (one-line summary), `/addon debug` (full dump)
- BugGrabber + BugSack for error capture
- Enable script errors: `/console scriptErrors 1`
- Debug tools: `/fstack` (frames), `/etrace` (events), `/dump` (variables)
- Expose debug state: `_G.MyAddonDebug = { frame, db, cache }`
- **Midnight**: Add secret value detection to debug dump

---

### Release & Distribution (11)

#### 11 - Packaging and Release
**File**: `11-packaging-release.doc.md`

**Summary**: Versioning, changelog, distribution platforms, and release workflow.

**Key Points**:
- Semantic versioning: `MAJOR.MINOR.PATCH`, 2.0.0 for breaking changes
- Keep TOC `## Version` in sync with tags
- Changelog: Include features, fixes, breaking changes; skip refactoring
- Platforms: CurseForge (largest), Wago.io (WeakAuras), WoWInterface (niche)
- `.pkgmeta` for CurseForge auto-packaging
- Pre-release: `validate_tocs()`, `check_libraries()`, `addon-dev fix-deprecations`, `@lint`

---

### Midnight Readiness (12-13)

#### 12 - Midnight Readiness
**File**: `12-midnight-readiness.doc.md`

**Summary**: Comprehensive 12.0 preparation guide with compatibility matrix and implementation patterns.

**Key Points**:
- Secret values: Can't compare, can't format, can't use in arithmetic
- Combat log removed, instance chat secret, addon communication blocked
- Native features coming: Damage meters, boss alerts, cooldown tracking
- Passthrough: StatusBar, Cooldown frames accept secrets
- Helper APIs: `UnitHealth(unit, true)`, `UnitHealthPercent()`, `C_UnitAuras.GetAuraDurationRemainingByAuraInstanceID()`
- **Reskin strategy**: Don't create custom frames; reparent and style Blizzard's

---

#### 13 - Midnight Secret Values
**File**: `13-midnight-secret-values.doc.md`

**Summary**: Deep dive into secret value handling, detection, passthrough, and degradation patterns.

**Key Points**:
- Detection: `issecretvalue(value)` or `pcall(function() local _ = val > 0 end)`
- Fails with: Comparisons, arithmetic, `string.format`, `tonumber`, `or` operator, table keys
- **Works**: `StatusBar:SetValue()`, `Cooldown:SetCooldown()`
- Helper APIs: `UnitHealth(unit, true)` = displayable, `CurveConstants.ScaleTo100` for percentages
- Pre-seed lookup tables outside combat
- Frame region: `GetDrawLayer()` returns secret; use `IsObjectType()` instead
- **Black box APIs**: `SecondsFormatter`, `UnitHealPredictionCalculator`, `C_DurationUtil.CreateDuration()`
- **Whitelist**: GCD (61304), Skyriding Vigor (376747) remain readable

---

### Pre-Release & Community (14-15)

#### 14 - First-Run Checklist
**File**: `14-first-run-checklist.doc.md`

**Summary**: Pre-release validation checklist for TOC, functionality, SavedVariables, combat, and Midnight.

**Key Points**:
- TOC: Interface matches, addon loads, no errors
- Basic: Slash commands, settings UI, frame visibility
- SavedVariables: Fresh install defaults, persistence across reload/restart
- Combat: No "action blocked" errors, queued changes apply
- **Midnight**: Instance combat test, degraded display, passthrough verification
- Performance: CPU <10ms/s active, Memory <2MB active

---

#### 15 - Community Resources
**File**: `15-community-resources.doc.md`

**Summary**: Documentation links, help channels, and distribution platforms.

**Key Points**:
- Primary docs: Warcraft Wiki (warcraft.wiki.gg), Blizzard UI Source
- Help: WoWUIDev Discord (most active), WoWInterface Forums
- Platforms: CurseForge, Wago.io, WoWInterface
- Libraries: Ace3, LibStub, LibDataBroker, LibDBIcon, LibSharedMedia
- Tools: BugGrabber/BugSack, /dump, /fstack, /etrace
- Midnight resources: Official blog, Warcraft Wiki API changes

---

### Localization & Style (16-17)

#### 16 - Localization
**File**: `16-localization.doc.md`

**Summary**: Multi-language support patterns using AceLocale-3.0 and standalone alternatives.

**Key Points**:
- 11 supported locales (enUS default, then deDE, esES, esMX, frFR, itIT, koKR, ptBR, ruRU, zhCN, zhTW)
- Load order: Locales before any code that uses them
- AceLocale pattern: `L["KEY"]` with NewLocale/GetLocale
- String keys: UPPERCASE_WITH_UNDERSCORES, descriptive
- **Don't**: Concatenate strings, use idioms, split sentences
- Numbered placeholders for reordering: `%1$s dealt %2$d damage to %3$s`
- Standalone pattern: Metatable-based `L` with `__index` fallback

---

#### 17 - Style Guide
**File**: `17-style-guide.doc.md`

**Summary**: Text conventions, colors, icons, and accessibility aligned with Blizzard UI.

**Key Points**:
- Capitalization: Title Case for titles/buttons, Sentence case for labels/tooltips
- Punctuation: No period on labels, period on tooltips/messages
- Numbers: `BreakUpLargeNumbers()`, `AbbreviateLargeNumbers()`
- Colors: `RAID_CLASS_COLORS`, `ITEM_QUALITY_COLORS`, semantic (red=error, green=success)
- Sounds: Use `SOUNDKIT` constants sparingly
- Code formatting: StyLua with tabs, 120 columns, double quotes

---

### Advanced Patterns (18-21)

#### 18 - Frame Templates and Mixins
**File**: `18-frame-templates-mixins.doc.md`

**Summary**: Blizzard's Mixin OOP pattern, XML templates, and modification techniques.

**Key Points**:
- Mixin: Table of functions mixed into objects (`CreateFromMixins`, `Mixin`)
- Templates: `BackdropTemplate` (backgrounds), `SecureActionButtonTemplate` (casting), `SecureHandlerStateTemplate` (state drivers)
- XML vs Lua: XML for reusable templates, Lua for dynamic/simple frames
- Safe hook: `hooksecurefunc(Frame, "Method", callback)`
- Mixin inheritance: `ExtendedMixin = CreateFromMixins(BaseMixin)`
- Study: `Blizzard_SharedXML/`, `Blizzard_ActionBar/ActionButton.lua`

---

#### 19 - Slash Commands
**File**: `19-slash-commands.doc.md`

**Summary**: Command registration, argument parsing, and subcommand patterns.

**Key Points**:
- Basic: `SLASH_MYADDON1 = "/myaddon"`, `SlashCmdList["MYADDON"] = function(msg)`
- Subcommand pattern: `commands` table with `enable`, `disable`, `status`, `config`, `help`
- Case insensitivity: `msg:trim():lower()`
- Help formatting: Gold for title, white for commands, gray for descriptions
- AceConsole alternative: `self:RegisterChatCommand("myaddon", "HandleCommand")`
- Essential commands: `status`, `debug`, `config`, `reset`

---

#### 20 - Event Patterns
**File**: `20-event-patterns.doc.md`

**Summary**: Event registration, throttling, bucket events, and Midnight changes.

**Key Points**:
- Function table pattern: `events[event](self, ...)` with auto-registration
- Unit events: `RegisterUnitEvent("UNIT_HEALTH", "player")` more efficient
- Throttling: Time-based (`GetTime()`) or frame-based (skip N frames)
- Bucket events (AceEvent): `RegisterBucketEvent("BAG_UPDATE", 0.2, "OnBagUpdate")`
- **Midnight**: `COMBAT_LOG_EVENT_UNFILTERED` removed, adapt or disable features
- Key events: `PLAYER_ENTERING_WORLD`, `PLAYER_REGEN_DISABLED/ENABLED`, `SPELL_UPDATE_COOLDOWN`

---

#### 21 - Secure Actions
**File**: `21-secure-actions.doc.md`

**Summary**: When secure templates are needed, state drivers, and restricted environment.

**Key Points**:
- Needed for: Cast spell, target unit, use item on click
- **NOT needed for**: Display cooldowns, show/hide frames, update textures
- SecureActionButtonTemplate: `SetAttribute("type", "spell")`, `SetAttribute("spell", "Fireball")`
- Attributes: type1/type2 for left/right click differentiation
- **Cannot change attributes in combat** - queue for `PLAYER_REGEN_ENABLED`
- State drivers: `RegisterStateDriver(frame, "visibility", "[combat] show; hide")`
- Restricted environment: Basic Lua only, no globals, no `print`, no `CreateFrame`

---

### Testing & Recovery (22-23)

#### 22 - Testing Strategies
**File**: `22-testing-strategies.doc.md`

**Summary**: Manual testing workflows, automated testing, code coverage, and Midnight testing procedures.

**Key Points**:
- Dev character: Druid (forms), max level, near dummies/portals
- Fresh install test, basic functionality, combat test
- Edge cases: Zone transitions, spec change, mount/dismount
- **Midnight testing**: Open world -> Instance out of combat -> Instance in combat -> Exit combat -> Leave instance
- Automated tests: `Tests/*_spec.lua`, Busted-compatible, mock WoW API
- Run: `addon-dev test "MyAddon"` or `addon-dev test --all`
- **Code coverage**: `addon-dev test "MyAddon" --coverage` (HTML + console reports)
- Threshold enforcement: `addon-dev test --coverage --threshold 80`
- Performance: CPU <10ms/s active, Memory <2MB active

---

#### 23 - Error Recovery
**File**: `23-error-recovery.doc.md`

**Summary**: Feature isolation, corrupted SavedVariables recovery, and graceful degradation.

**Key Points**:
- Protected feature calls: `pcall(func, ...)` for risky operations
- Module isolation: Track errors per module, auto-disable after threshold (3 errors)
- DB validation: Check structure, types; recover with defaults
- Partial recovery: Only reset corrupted sections
- User-friendly errors: Actionable messages, not stack traces
- Reset command: `/addon reset` with confirmation dialog
- Error logging: Capture time, context, combat state, instance type

---

## Usage Patterns

### Finding Information
1. **Quick fact lookup** → Master Cliff Notes above
2. **Specific topic** → Guide Index with summaries
3. **Deep dive** → Read full guide file
4. **Code patterns** → Check "Key Points" for ready-to-use patterns

### Common Workflows
- **New addon**: 01 → 02 → 03 → 04 → 19 → 10
- **UI development**: 05 → 06 → 18 → 17
- **Midnight prep**: 12 → 13 → 07 → 09
- **Release prep**: 11 → 14 → 22
- **Debugging**: 10 → 23 → 22

### Agent Quick Commands
```
@lint                - Run Luacheck + Midnight pattern scanning
@test                - Execute unit tests
@create              - Bootstrap new addon from template
@release             - Pre-release checklist and version tagging
@debug-sv            - Inspect SavedVariables for corruption
```

### CLI Quick Reference
```
addon-dev setup                        - Download/verify dev binaries
addon-dev watch "Addon"                - Real-time lint/test on file change
addon-dev test "Addon" --coverage      - Run tests with coverage report
addon-dev fix-deprecations "Addon"     - Scan/fix deprecated APIs
addon-dev doctor                       - Check environment health
```

---

## References

- **Main AGENTS.md**: `../../AGENTS.md` - Workspace-level documentation
- **Library Reference**: `../integration/libraries.md`
- **Blizzard UI Reference**: `../../.claude/skills/researching-apis/references/blizzard-ui.md`
- **Release Workflow**: `../integration/curseforge.md`


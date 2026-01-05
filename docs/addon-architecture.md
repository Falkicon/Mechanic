# Addon Architecture Guide

Design patterns for building testable, maintainable World of Warcraft addons.

This guide applies **Agent-First Development (AFD)** principles to WoW addon architecture, enabling offline testing and AI-assisted development.

---

## The Problem: Addons Are Opaque

Traditional WoW addons are built UI-first:
- Business logic lives inside frame scripts
- State is scattered across UI components
- Testing requires running the game client
- AI agents can't interact with addon functionality

**The solution**: Separate pure logic from WoW dependencies.

---

## The Three-Layer Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                            YOUR ADDON                                        │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                      LAYER 1: CORE (Pure Lua 5.1)                   │   │
│  │                                                                     │   │
│  │   • Actions (business logic as pure functions)                      │   │
│  │   • Data structures and transformations                            │   │
│  │   • Validation, calculations, algorithms                            │   │
│  │                                                                     │   │
│  │   ✅ RUNS IN SANDBOX — No WoW dependencies                          │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                    ▲                                        │
│                                    │ ActionResult                           │
│                                    │                                        │
│  ┌─────────────────────────────────┴───────────────────────────────────┐   │
│  │                  LAYER 2: BRIDGE (Blizzard API Adapter)             │   │
│  │                                                                     │   │
│  │   • Context builders (WoW APIs → context tables)                    │   │
│  │   • Event handlers (translate events → action calls)                │   │
│  │   • Command executors (slash commands → actions)                    │   │
│  │                                                                     │   │
│  │   ⚠️ REQUIRES WoW — Tested in-game via MechanicLib                  │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                    ▲                                        │
│                                    │ Commands                               │
│                                    │                                        │
│  ┌─────────────────────────────────┴───────────────────────────────────┐   │
│  │                      LAYER 3: VIEW (UI Frames)                      │   │
│  │                                                                     │   │
│  │   • Frame creation and layout                                       │   │
│  │   • Event binding (OnClick → bridge calls)                          │   │
│  │   • Visual updates from ActionResults                               │   │
│  │                                                                     │   │
│  │   ⚠️ REQUIRES WoW — Visual verification only                        │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

**Key insight**: The Core layer is "headless" — it has no knowledge of WoW or UI. All WoW data arrives via context parameters.

---

## Layer Responsibilities

| Layer | Contains | Testable In |
|-------|----------|-------------|
| **Core** | Pure functions, business logic, data transforms | Sandbox (Lua 5.1) |
| **Bridge** | WoW API calls, event routing, context building | In-game (MechanicLib) |
| **View** | Frames, textures, visual updates | In-game (visual) |

---

## Why Separate Layers?

The layered architecture provides measurable benefits:

| Metric | Traditional Addon | AFD Addon |
|--------|-------------------|-----------|
| Test feedback | ~30s (`/reload` cycle) | ~30ms (sandbox) |
| CI/CD possible | No (requires game client) | Yes (runs in plain Lua) |
| AI can validate | No (opaque logic in frames) | Yes (structured actions) |
| Refactoring safety | Low (changes break UI) | High (Core tests catch regressions) |

**The tradeoff:** More upfront structure. But for addons with significant logic, the investment pays off quickly.

---

## The Action Pattern

Every significant addon capability should be an **Action** — a pure function that receives context and returns a structured result.

### Traditional (Untestable)

```lua
function MyAddon:OnButtonClick()
    local playerGold = GetMoney()
    local threshold = self.db.profile.threshold
    if playerGold > threshold then
        self:ShowAlert("You're rich!")
    end
end
```

### AFD Pattern (Testable)

```lua
-- Core/Actions/wealth.lua
local Actions = {}

function Actions.CheckWealth(context)
    local gold = context.gold or 0
    local threshold = context.threshold or 100000
    local isRich = gold > threshold

    return {
        success = true,
        data = { isRich = isRich, gold = gold, threshold = threshold },
        reasoning = isRich
            and string.format("Gold (%d) exceeds threshold (%d)", gold, threshold)
            or string.format("Gold (%d) below threshold (%d)", gold, threshold)
    }
end

return Actions
```

```lua
-- Bridge/Events.lua (UI invokes the action)
function MyAddon:OnButtonClick()
    local result = Actions.CheckWealth({
        gold = GetMoney(),  -- WoW API call at boundary
        threshold = self.db.profile.threshold
    })

    if result.data.isRich then
        self:ShowAlert("You're rich!")
    end
end
```

The action is **pure** — all external data arrives via `context`. This makes it testable in the sandbox.

---

## ActionResult Schema

```lua
---@class ActionResult<T>
---@field success boolean
---@field data? T
---@field error? ActionError
---@field confidence? number     -- 0-1 for uncertain results
---@field reasoning? string      -- Why this result
---@field warnings? Warning[]    -- Non-fatal issues

---@class ActionError
---@field code string            -- Machine-readable: "INVALID_INPUT"
---@field message string         -- Human-readable
---@field suggestion? string     -- What to do about it
---@field retryable? boolean

---@class Warning
---@field code string
---@field message string
```

---

## The Command Flow

```lua
-- VIEW → BRIDGE → CORE → BRIDGE → VIEW

-- 1. VIEW: User clicks button
MainFrame.calculateButton:SetScript("OnClick", function()
    Bridge:Execute("combat.calculateDPS")
end)

-- 2. BRIDGE: Builds context, calls action
function Bridge:Execute(actionName, params)
    local context = self:BuildContext()
    local action = Core.Actions:Get(actionName)
    local result = action(context, params)
    self:HandleResult(actionName, result)
end

-- 3. CORE: Pure function, no WoW knowledge
Core.Actions["combat.calculateDPS"] = function(context, params)
    local damage = context.combat.totalDamage
    local duration = context.combat.duration

    if duration <= 0 then
        return {
            success = false,
            error = { code = "INVALID_DURATION", message = "Duration must be > 0" }
        }
    end

    return {
        success = true,
        data = { dps = damage / duration },
        reasoning = string.format("%.0f damage / %.1f seconds", damage, duration)
    }
end

-- 4. BRIDGE: Routes result to view
function Bridge:HandleResult(actionName, result)
    if result.success then
        View:Update(actionName, result.data)
    else
        View:ShowError(result.error)
    end
end
```

---

## The Context Bridge

The Bridge layer translates WoW's global state into context tables:

```lua
-- Bridge/Context.lua
local Context = {}

function Context:Build()
    return {
        -- Player state
        gold = GetMoney(),
        playerName = UnitName("player"),
        playerLevel = UnitLevel("player"),
        playerClass = select(2, UnitClass("player")),

        -- Config (from SavedVariables)
        config = MyAddon.db.profile,

        -- Time
        gameTime = GetTime(),
        serverTime = GetServerTime(),
    }
end

return Context
```

**In production:**
```lua
local context = Context:Build()
local result = Actions.CheckWealth(context)
```

**In tests:**
```lua
local result = Actions.CheckWealth({
    gold = 500000,
    config = { threshold = 100000 }
})
```

---

## Recommended File Structure

```
MyAddon/
├── Core/                          # LAYER 1: Pure Lua 5.1
│   ├── init.lua                   # Namespace setup
│   ├── Actions/
│   │   ├── init.lua               # Action registry
│   │   ├── combat.lua             # combat.calculateDPS, combat.parseCLEU
│   │   ├── inventory.lua          # inventory.findItem, inventory.countStacks
│   │   └── config.lua             # config.validate, config.migrate
│   ├── Utils/
│   │   ├── math.lua               # round, clamp, lerp
│   │   └── string.lua             # format, parse, sanitize
│   └── Schemas/
│       └── types.lua              # LuaCATS type definitions
│
├── Bridge/                        # LAYER 2: Blizzard API Adapter
│   ├── Context.lua                # Build context from WoW APIs
│   ├── Events.lua                 # PLAYER_LOGIN → Actions.Init(context)
│   ├── Commands.lua               # /myaddon → routing to actions
│   └── Executor.lua               # Bridge:Execute(actionName, params)
│
├── View/                          # LAYER 3: UI Frames
│   ├── MainFrame.lua
│   ├── SettingsPanel.lua
│   └── Components/
│       ├── Button.lua
│       └── List.lua
│
├── Tests/                         # Sandbox tests for Core/
│   └── Core/
│       ├── combat_spec.lua
│       ├── inventory_spec.lua
│       └── utils_spec.lua
│
├── Libs/                          # External libraries
│   └── ...
│
├── MyAddon.toc                    # Addon manifest
└── MyAddon.lua                    # Entry point, loads all layers
```

---

## What IS an Action (vs What Isn't)

| IS an Action | NOT an Action |
|-------------|---------------|
| Calculate DPS from combat data | Show DPS in a frame |
| Validate config values | Open settings panel |
| Parse combat log entry | Handle COMBAT_LOG event |
| Determine best gear | Equip gear (protected API) |
| Format gold string | Update text on frame |

**Litmus test**:
1. Could this run without WoW? → Probably an action
2. Does it need a frame or protected API? → Not an action

---

## Lua 5.1 Constraints

WoW uses Lua 5.1. Your Core layer must avoid:

| ❌ Avoid | ✅ Use Instead |
|---------|---------------|
| `goto` statements | Structured control flow |
| `#` on sparse tables | `ipairs`/`pairs` iteration |
| Bitwise operators (5.2+) | `bit.band`, `bit.bor` (WoW provides) |
| `package.loaded` patterns | Local table modules |

---

## Testing Your Architecture

### Sandbox Tests (Core Layer)

```bash
# Generate WoW API stubs
mech call sandbox.generate

# Run tests
mech call sandbox.test -i '{"addon": "MyAddon"}'
```

See [Test Integration](./integration/testing.md) for full testing documentation.

### In-Game Tests (Bridge/View Layers)

Register tests with MechanicLib for runtime verification:

```lua
MechanicLib:RegisterTest("MyAddon", "wealth.check", function()
    local result = Actions.CheckWealth(Context:Build())
    return result.success and result.data.isRich ~= nil
end)
```

---

## Progressive Adoption

You don't need to rewrite your addon. Adopt incrementally:

1. **Extract one pure function** → Make it action-like with context parameter
2. **Add a sandbox test** → Verify it works outside WoW
3. **Repeat** → Gradually pull logic out of frames
4. **Over time** → Most business logic becomes testable

---

## Summary

| Traditional Addon | AFD Addon |
|------------------|-----------|
| Logic in frame scripts | Logic in pure Actions |
| State in UI components | State flows through context |
| Testing requires /reload | Testing via sandbox |
| AI can't help | AI can run actions directly |
| Changes are risky | Changes are safe |

**AFD for Addons = Commands-first architecture adapted for Lua + WoW constraints.**

---

## Related Guides

- [Test Integration](./integration/testing.md) — Sandbox, Busted, and in-game testing
- [MechanicLib Registration](./integration/mechaniclib.md) — Connect to Mechanic's ecosystem
- [CLI Reference](./cli-reference.md) — Available commands


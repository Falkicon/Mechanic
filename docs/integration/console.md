# Console Integration

Mechanic captures addon output through its in-game Console panel.

---

## Option 1: Direct Print (Simplest)

```lua
-- These appear in Mechanic's Console
print("[MyAddon] Initialized")
print("[MyAddon] Loaded", numItems, "items")
```

---

## Option 2: Structured Logging (Recommended)

Create a logging utility that Mechanic can parse:

```lua
local ADDON_NAME = "MyAddon"

local function Log(level, ...)
    local msg = string.format("[%s][%s]", ADDON_NAME, level)
    print(msg, ...)
end

-- Usage
Log("INFO", "Addon loaded")
Log("DEBUG", "Processing", count, "items")
Log("WARN", "Cache miss for", itemID)
```

---

## Option 3: AceConsole Integration

If using Ace3, your `:Print()` calls are automatically captured:

```lua
local MyAddon = LibStub("AceAddon-3.0"):NewAddon("MyAddon", "AceConsole-3.0")

function MyAddon:OnInitialize()
    self:Print("Addon initialized")  -- Appears in Mechanic Console
end
```

---

## Option 4: MechanicLib Categories (Recommended)

For rich categorization in Mechanic's console:

```lua
local MechanicLib = LibStub("MechanicLib-1.0", true)

local function Log(msg, category)
    -- Store in internal buffer for Mechanic's pull model
    table.insert(MyAddon.debugBuffer, {
        msg = msg,
        time = GetTime(),
    })
    
    -- Log to Mechanic's live console if available
    if MechanicLib then
        category = category or MechanicLib.Categories.CORE
        MechanicLib:Log("MyAddon", msg, category)
    end
    
    -- Also print to chat if debug mode enabled
    if MyAddon.debugMode then
        print("|cff74AFFF[MyAddon]|r", msg)
    end
end
```

### Available Categories

| Category | Use For |
|----------|---------|
| `MechanicLib.Categories.CORE` | General messages |
| `MechanicLib.Categories.API` | API calls, data fetching |
| `MechanicLib.Categories.SECRET` | Secret value handling (12.0+) |
| `MechanicLib.Categories.PERF` | Performance-related |

---

## Lifecycle Messages (Best Practice)

Log standard messages at key lifecycle points:

```lua
function MyAddon:OnInitialize()
    Log("INFO", "Initializing...")
    -- Setup code
    Log("INFO", "Initialized v" .. self.version)
end

function MyAddon:OnEnable()
    Log("INFO", "Enabled")
end

function MyAddon:OnDisable()
    Log("INFO", "Disabled")
end

-- State changes
function MyAddon:OnProfileChanged()
    Log("INFO", "Profile changed to: " .. self.db:GetCurrentProfile())
end

-- Module loading
function MyAddon:LoadModule(name)
    Log("DEBUG", "Loading module: " .. name)
end
```

---

## Viewing Logs

| Location | How |
|----------|-----|
| **In-game** | Open Mechanic panel → Console tab |
| **Dashboard** | Logs sync on `/reload` |
| **CLI** | `mech addon.output` includes console buffer |

---

## Related Guides

- [MechanicLib Registration](./mechaniclib.md)
- [Error Tracking](./errors.md)

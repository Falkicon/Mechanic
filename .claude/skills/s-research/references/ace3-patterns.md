# Ace3 Patterns

Common patterns using the Ace3 library framework.

## Libraries Overview

| Library | Purpose |
|---------|---------|
| AceAddon-3.0 | Core addon framework |
| AceEvent-3.0 | Event registration |
| AceDB-3.0 | SavedVariables |
| AceConfig-3.0 | Options tables |
| AceConsole-3.0 | Slash commands |
| AceTimer-3.0 | Timers |
| AceHook-3.0 | Function hooking |
| AceComm-3.0 | Addon communication |
| AceSerializer-3.0 | Data serialization |

## Addon Creation

```lua
local MyAddon = LibStub("AceAddon-3.0"):NewAddon(
    "MyAddon",
    "AceEvent-3.0",
    "AceConsole-3.0",
    "AceTimer-3.0"
)

function MyAddon:OnInitialize()
    -- Runs once at addon load
    self.db = LibStub("AceDB-3.0"):New("MyAddonDB", defaults, true)
end

function MyAddon:OnEnable()
    -- Runs when addon enabled
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
end

function MyAddon:OnDisable()
    -- Cleanup when disabled
end
```

## Event Registration

```lua
-- Single event
self:RegisterEvent("EVENT_NAME")
function MyAddon:EVENT_NAME(event, ...) end

-- With different handler
self:RegisterEvent("EVENT_NAME", "HandlerMethod")

-- Bucket events (throttled)
self:RegisterBucketEvent("BAG_UPDATE", 0.2, "OnBagUpdate")

-- Custom messages
self:RegisterMessage("MYADDON_EVENT")
self:SendMessage("MYADDON_EVENT", data)
```

## Timers

```lua
-- One-shot
self:ScheduleTimer("MethodName", 5)
self:ScheduleTimer(function() end, 5)

-- Repeating
local handle = self:ScheduleRepeatingTimer("Update", 1)
self:CancelTimer(handle)
```

## Hooks

```lua
-- Post-hook (runs after original)
self:Hook("GlobalFunction", function(...)
    -- Your code
end)

-- Secure hook (for protected functions)
self:SecureHook("SecureFunction", "MyHandler")

-- Object method hook
self:Hook(object, "Method", "MyHandler")
```

## Slash Commands

```lua
self:RegisterChatCommand("myaddon", "SlashHandler")

function MyAddon:SlashHandler(input)
    local cmd, rest = self:GetArgs(input, 2)
    if cmd == "config" then
        -- open config
    end
end
```

## Config Options

```lua
local options = {
    type = "group",
    args = {
        enabled = {
            type = "toggle",
            name = "Enable",
            get = function() return self.db.profile.enabled end,
            set = function(_, v) self.db.profile.enabled = v end,
        },
    },
}
LibStub("AceConfig-3.0"):RegisterOptionsTable("MyAddon", options)
```

## Local Source

```
ADDON_DEV_LOCAL/Libs/Ace3/
├── AceAddon-3.0/
├── AceDB-3.0/
├── AceEvent-3.0/
└── ...
```

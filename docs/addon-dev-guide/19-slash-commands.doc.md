# Slash Commands

> Part of the [Addon Development Guide](../AGENTS.md#addon-development-guide)

Last updated: 2025-12-18

---

## Overview

Every addon should have at least one slash command for basic interaction. This guide covers the native pattern (preferred for simple addons) and AceConsole (for complex addons).

---

## Basic Registration

### Single Command

```lua
SLASH_MYADDON1 = "/myaddon"
SLASH_MYADDON2 = "/ma"  -- Alias

SlashCmdList["MYADDON"] = function(msg)
    print("You typed:", msg)
end
```

**Naming rule**: The `MYADDON` in `SLASH_MYADDON1` must match the key in `SlashCmdList["MYADDON"]`.

---

## Argument Parsing

### Simple Arguments

```lua
SlashCmdList["MYADDON"] = function(msg)
    local args = {}
    for word in msg:gmatch("%S+") do
        table.insert(args, word)
    end
    
    local command = args[1] and args[1]:lower()
    
    if command == "enable" then
        EnableAddon()
    elseif command == "disable" then
        DisableAddon()
    elseif command == "status" then
        ShowStatus()
    else
        ShowHelp()
    end
end
```

### Subcommand Pattern (Recommended)

```lua
local commands = {}

function commands.enable()
    AddonDB.enabled = true
    print("|cff00ff00MyAddon enabled|r")
end

function commands.disable()
    AddonDB.enabled = false
    print("|cffff0000MyAddon disabled|r")
end

function commands.status()
    print("MyAddon:", AddonDB.enabled and "Enabled" or "Disabled")
end

function commands.config()
    Settings.OpenToCategory("MyAddon")
end

function commands.help()
    print("|cffffd700MyAddon Commands:|r")
    print("  /ma enable - Enable the addon")
    print("  /ma disable - Disable the addon")
    print("  /ma status - Show current status")
    print("  /ma config - Open settings")
end

SLASH_MYADDON1 = "/myaddon"
SLASH_MYADDON2 = "/ma"

SlashCmdList["MYADDON"] = function(msg)
    local command = msg:match("^(%S+)") or "help"
    command = command:lower()
    
    if commands[command] then
        commands[command](msg)
    else
        commands.help()
    end
end
```

---

## Arguments with Values

```lua
function commands.set(msg)
    local _, key, value = msg:match("^(%S+)%s+(%S+)%s+(.+)$")
    
    if not key then
        print("Usage: /ma set <key> <value>")
        return
    end
    
    if key == "opacity" then
        local num = tonumber(value)
        if num and num >= 0 and num <= 100 then
            AddonDB.opacity = num / 100
            print("Opacity set to:", num .. "%")
        else
            print("Error: Opacity must be 0-100")
        end
    elseif key == "scale" then
        -- Handle scale
    else
        print("Unknown setting:", key)
    end
end
```

---

## Numeric Shortcuts

For quick access commands (like Strategy addon):

```lua
SlashCmdList["MYADDON"] = function(msg)
    local num = tonumber(msg)
    if num and num >= 1 and num <= 10 then
        -- Direct number input: /ma 3
        TriggerStrategy(num)
        return
    end
    
    -- Fall through to normal command handling
    local command = msg:match("^(%S+)") or "help"
    -- ...
end
```

---

## Help Text Formatting

Use consistent formatting with colors:

```lua
function commands.help()
    local GOLD = "|cffffd700"
    local WHITE = "|cffffffff"
    local GRAY = "|cff888888"
    local R = "|r"
    
    print(GOLD .. "MyAddon Commands:" .. R)
    print(WHITE .. "  /ma " .. GRAY .. "or" .. WHITE .. " /myaddon" .. R)
    print("")
    print(WHITE .. "  enable" .. GRAY .. " - Enable the addon" .. R)
    print(WHITE .. "  disable" .. GRAY .. " - Disable the addon" .. R)
    print(WHITE .. "  status" .. GRAY .. " - Show current status" .. R)
    print(WHITE .. "  config" .. GRAY .. " - Open settings panel" .. R)
    print(WHITE .. "  debug" .. GRAY .. " - Toggle debug mode" .. R)
end
```

---

## Debug and Diagnostic Commands

Every addon should include these:

```lua
function commands.status()
    local status = AddonDB.enabled and "|cff00ff00ENABLED|r" or "|cffff0000DISABLED|r"
    print("[MyAddon] Status:", status)
end

function commands.debug()
    print("=== MyAddon Debug ===")
    print("Version:", GetAddOnMetadata("MyAddon", "Version"))
    print("Interface:", select(4, GetBuildInfo()))
    print("Enabled:", AddonDB.enabled)
    print("In Combat:", InCombatLockdown())
    -- Add addon-specific state
    print("===================")
end

function commands.reset()
    if not InCombatLockdown() then
        wipe(AddonDB)
        ReloadUI()
    else
        print("Cannot reset during combat")
    end
end
```

---

## Case Insensitivity

Always normalize input:

```lua
SlashCmdList["MYADDON"] = function(msg)
    msg = msg:trim()  -- Remove leading/trailing whitespace
    local command = (msg:match("^(%S+)") or ""):lower()
    
    -- Now "Enable", "ENABLE", "enable" all work
end
```

---

## AceConsole Alternative

For addons using Ace3 with complex commands:

```lua
local addon = LibStub("AceAddon-3.0"):NewAddon("MyAddon", "AceConsole-3.0")

function addon:OnInitialize()
    self:RegisterChatCommand("myaddon", "HandleCommand")
    self:RegisterChatCommand("ma", "HandleCommand")
end

function addon:HandleCommand(input)
    if input == "config" then
        Settings.OpenToCategory("MyAddon")
    else
        self:Print("Unknown command. Use /ma config")
    end
end
```

**Note**: For simple addons, native slash commands are sufficient. Use AceConsole only if you're already using Ace3.

---

## Command Naming Conventions

| Type | Pattern | Example |
|------|---------|---------|
| Main command | `/addonname` | `/actionhud` |
| Short alias | `/initials` or `/short` | `/ah` |
| Subcommands | Verb or noun | `enable`, `status`, `config` |
| !Mechanic | `console`, `errors`, `tests`, `tools`, `perf` | `/mech tools` |
| Debug | `debug`, `diag`, `dump` | `/ma debug` |
| Settings | `config`, `settings`, `options` | `/ma config` |

---

## Common Mistakes

### Don't

```lua
-- DON'T use spaces in command names
SLASH_MY_ADDON1 = "/myaddon"  -- Won't work

-- DON'T forget to handle empty input
SlashCmdList["MYADDON"] = function(msg)
    local cmd = msg:match("^(%S+)")  -- nil if msg is empty!
end

-- DON'T hardcode command in help text
print("Use /myaddon help")  -- Update if command changes
```

### Do

```lua
-- DO handle empty input gracefully
local cmd = msg:match("^(%S+)") or "help"

-- DO use the registered slash command
print("Use " .. SLASH_MYADDON1 .. " help")
```

---

## Quick Reference

```lua
-- Minimal complete example
SLASH_MYADDON1 = "/myaddon"
SLASH_MYADDON2 = "/ma"

SlashCmdList["MYADDON"] = function(msg)
    msg = (msg or ""):trim():lower()
    
    if msg == "config" or msg == "settings" then
        Settings.OpenToCategory("MyAddon")
    elseif msg == "status" then
        print("[MyAddon]", AddonDB.enabled and "Enabled" or "Disabled")
    elseif msg == "" or msg == "help" then
        print("|cffffd700MyAddon:|r /ma config | status | help")
    else
        print("Unknown command. Try: /ma help")
    end
end
```

---

## See Also

- [Debugging](./10-debugging.doc.md) - Debug command patterns
- [Localization](./16-localization.doc.md) - Localizing command output
- [Library Index](../AGENTS.md#library-index) - AceConsole-3.0



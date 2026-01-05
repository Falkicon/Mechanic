# SavedVariables

Persistent data storage patterns for WoW addons.

## TOC Declaration

```toc
## SavedVariables: MyAddonDB
## SavedVariablesPerCharacter: MyAddonCharDB
```

- `SavedVariables` - Shared across all characters
- `SavedVariablesPerCharacter` - Per-character data

## AceDB-3.0 (Recommended)

### Setup

```lua
local defaults = {
    profile = {
        enabled = true,
        scale = 1.0,
        position = { x = 0, y = 0 },
        colors = {
            background = { r = 0, g = 0, b = 0, a = 0.5 },
        },
    },
    char = {
        -- Per-character settings
        lastLogin = nil,
    },
    global = {
        -- Account-wide settings
        totalLogins = 0,
    },
}

function MyAddon:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("MyAddonDB", defaults, true)
end
```

### Accessing Data

```lua
-- Profile data (current profile)
local enabled = self.db.profile.enabled
self.db.profile.scale = 1.5

-- Character data
self.db.char.lastLogin = time()

-- Global data
self.db.global.totalLogins = self.db.global.totalLogins + 1

-- Nested tables work automatically
self.db.profile.colors.background.a = 0.8
```

### Profiles

```lua
-- Get current profile name
local profileName = self.db:GetCurrentProfile()

-- Switch profile
self.db:SetProfile("ProfileName")

-- Copy from another profile
self.db:CopyProfile("SourceProfile")

-- Reset to defaults
self.db:ResetProfile()

-- Profile changed callback
self.db.RegisterCallback(self, "OnProfileChanged", "RefreshConfig")
self.db.RegisterCallback(self, "OnProfileReset", "RefreshConfig")
```

## Manual SavedVariables

Without AceDB:

```lua
-- Global variable (saved automatically)
MyAddonDB = MyAddonDB or {}

-- Deep merge with defaults
local function DeepMerge(defaults, saved)
    if type(defaults) ~= "table" then return saved end
    if type(saved) ~= "table" then return CopyTable(defaults) end
    
    for key, defaultValue in pairs(defaults) do
        if saved[key] == nil then
            saved[key] = CopyTable(defaultValue)
        elseif type(defaultValue) == "table" then
            DeepMerge(defaultValue, saved[key])
        end
    end
    return saved
end

function MyAddon:OnInitialize()
    local defaults = { enabled = true, scale = 1.0 }
    MyAddonDB = DeepMerge(defaults, MyAddonDB)
    self.db = MyAddonDB
end
```

## Data Versioning

Handle schema changes:

```lua
local CURRENT_VERSION = 3

function MyAddon:MigrateData()
    local version = self.db.global.dataVersion or 1
    
    if version < 2 then
        -- v1 -> v2: Renamed 'size' to 'scale'
        if self.db.profile.size then
            self.db.profile.scale = self.db.profile.size
            self.db.profile.size = nil
        end
    end
    
    if version < 3 then
        -- v2 -> v3: Changed position format
        local pos = self.db.profile.position
        if type(pos) == "table" and pos[1] then
            self.db.profile.position = { x = pos[1], y = pos[2] }
        end
    end
    
    self.db.global.dataVersion = CURRENT_VERSION
end
```

## Corruption Recovery

```lua
function MyAddon:ValidateDB()
    local db = self.db.profile
    
    -- Type validation
    if type(db.scale) ~= "number" then
        db.scale = 1.0
    end
    
    -- Range validation
    db.scale = math.max(0.5, math.min(2.0, db.scale))
    
    -- Structure validation
    if type(db.position) ~= "table" then
        db.position = { x = 0, y = 0 }
    end
end
```

## Inspecting SavedVariables

Files are in:
```
WTF/Account/ACCOUNTNAME/SavedVariables/MyAddon.lua
WTF/Account/ACCOUNTNAME/REALMNAME/CHARNAME/SavedVariables/MyAddon.lua
```

Format is Lua:
```lua
MyAddonDB = {
    ["profiles"] = {
        ["Default"] = {
            ["enabled"] = true,
            ["scale"] = 1.5,
        },
    },
}
```

## Best Practices

1. **Always provide defaults** - Never assume data exists
2. **Version your schema** - Plan for migrations
3. **Validate on load** - Corrupt data happens
4. **Use AceDB** - Handles profiles, defaults, edge cases
5. **Don't store too much** - Large SavedVariables slow loading
6. **Profile-based settings** - Users expect profile support
7. **Test with fresh data** - Delete SavedVariables to test defaults

## Common Mistakes

```lua
-- ❌ WRONG - accessing before ADDON_LOADED
function MyAddon:OnLoad()
    print(MyAddonDB.setting) -- nil, not loaded yet
end

-- ✅ CORRECT - wait for ADDON_LOADED
function MyAddon:ADDON_LOADED(event, addonName)
    if addonName == "MyAddon" then
        self:InitializeDB()
    end
end

-- ❌ WRONG - saving functions (not serializable)
self.db.profile.callback = function() end

-- ❌ WRONG - circular references
local t = {}
t.self = t
self.db.profile.data = t  -- Will error on save
```

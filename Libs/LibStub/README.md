# LibStub

LibStub is a simple versioning stub meant for use in Libraries.

## Download

```lua
-- download from subversion
svn checkout https://repos.curseforge.com/wow/libstub/trunk .
```

## Examples

### Basic example

```lua
local lib = LibStub:NewLibrary("MyLibrary-1.0", 1)

if not lib then
  return	-- already loaded and no upgrade necessary
end

lib.somearray = lib.somearray or {}

if not lib.frame then
  lib.frame=CreateFrame("Frame")
end


function lib:SomeFunction()
  -- do stuff here
end

function lib:SomeOtherFunction()
  -- do other stuff here
end

local function OnUpdate()
  -- timing stuff here
end

lib.frame:SetScript("OnUpdate", OnUpdate);
```

### Using revision control system tags for minor version

```lua
local lib = LibStub:NewLibrary("MyLibrary-1.0", "$Revision: 12345$")
```

Do be aware that moving a library from one repository to another will change revision numbers. Do not ever let it slide backwards. If you are caught in this situation, you might want to use something like:

```lua
local lib = LibStub:NewLibrary("MyLibrary-1.0", 
  12345+tonumber(strmatch("%d+","$Revision: 2$")) 
)
```

### Embedding / Mixing in

This is a convention rather than a function of the specification, but all Ace3 and Rock related libraries use the following semantics for doing embedding / mixing in (specifically, libraries with an .Embed() member can be specified as embeds during addon object creation rather than having to embed them explicitly):

```lua
lib.mixinTargets = lib.mixinTargets or {}
local mixins = {"SomeFunction", "SomeOtherFunction" }

function lib:Embed(target)
  for _,name in pairs(mixins) do
    target[name] = lib[name]
  end
  lib.mixinTargets[target] = true
end
```

... and at the end of the file, we handle library upgrades by simply re-embedding the library in all positions where it has previously been embedded / mixed in:
```lua
for target,_ in pairs(mixinTargets) do
  lib:Embed(target)
end
```

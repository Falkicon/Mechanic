-- Offline WoW boundary: execute the real queue and Bootstrap, serialize only SV.
local queue, saved, bootstrap, character = arg[1], arg[2], arg[3], arg[4]
local frame = {}
function CreateFrame() return frame end
function frame:RegisterEvent() end
function frame:UnregisterEvent() end
function frame:SetScript(_, callback) self.callback = callback end
C_AddOns = { GetAddOnMetadata = function() return "test" end }
UnitName = function() if character ~= "unknown" then return character end end
GetRealmName = function() if character ~= "unknown" then return "Realm" end end
date = function() return "2026-09-05 12:00:00" end
loadstring = loadstring or load
assert(loadfile(saved))()
assert(loadfile(queue))()
local ns = {}
assert(loadfile(bootstrap))("!Mechanic", ns)
frame.callback(frame, "ADDON_LOADED", "!Mechanic")
local function serialize(value)
    if type(value) == "table" then
        local parts = {}
        for key, item in pairs(value) do
            parts[#parts + 1] = "[" .. serialize(key) .. "] = " .. serialize(item)
        end
        return "{" .. table.concat(parts, ",") .. "}"
    elseif type(value) == "string" then
        return string.format("%q", value)
    else
        assert(type(value) == "number" or type(value) == "boolean")
        return tostring(value)
    end
end
local file = assert(io.open(saved, "w"))
file:write("MechanicDB = " .. serialize(MechanicDB))
file:close()

-- Run from the repository root with Lua 5.1. No installed addon state is used.
strmatch = string.match
securecallfunction = function(fn, ...) return fn(...) end
function wipe(t) for k in pairs(t) do t[k] = nil end end
function CreateFrame()
    local frame = { registered = {} }
    function frame:RegisterEvent(event) self.registered[event] = true end
    function frame:UnregisterEvent(event) self.registered[event] = nil end
    function frame:UnregisterAllEvents() self.registered = {} end
    function frame:SetScript(event, fn) self[event] = fn end
    return frame
end
local base = "_TemplateAddon/TemplateAddon/Libs/"
for _, upgrading in ipairs({ false, true }) do
    LibStub = nil
    local timers = {}
    C_Timer = { After = function(_, fn) timers[#timers + 1] = fn end }
    dofile(base .. "LibStub/LibStub.lua")
    dofile(base .. "CallbackHandler-1.0/CallbackHandler-1.0.lua")
    local consumer, received = {}, 0
    local oldFrame
    if upgrading then
        local old = LibStub:NewLibrary("AceEvent-3.0", 4)
        old.frame = CreateFrame()
        oldFrame = old.frame
        old.embeds = { [consumer] = true }
        old.events = LibStub("CallbackHandler-1.0"):New(old,
            "RegisterEvent", "UnregisterEvent", "UnregisterAllEvents")
        function old.events:OnUsed(_, event) old.frame:RegisterEvent(event) end
        function old.events:OnUnused(_, event) old.frame:UnregisterEvent(event) end
        consumer.RegisterEvent = old.RegisterEvent
        consumer:RegisterEvent("PLAYER_LOGIN", function() received = received + 1 end)
        consumer:RegisterEvent("CANCELLED", function() error("cancelled subscription fired") end)
    end
    dofile(base .. "AceEvent-3.0/AceEvent-3.0.lua")
    local ace = LibStub("AceEvent-3.0")
    ace:Embed(consumer)
    if upgrading then
        assert(ace.frame == oldFrame and oldFrame.registered.PLAYER_LOGIN,
            "upgrade must retain live subscriptions until transfer")
        consumer:UnregisterEvent("CANCELLED")
        assert(not oldFrame.registered.CANCELLED, "pending cancellation must unregister old frame")
    else
        consumer:RegisterEvent("PLAYER_LOGIN", function() received = received + 1 end)
    end
    consumer:RegisterEvent("PLAYER_LOGOUT", function() end)
    assert(#timers == 1, "registrations should share one deferred callback")
    timers[1]()
    assert(ace.frame.registered.PLAYER_LOGIN and ace.frame.registered.PLAYER_LOGOUT)
    assert(not ace.frame.registered.CANCELLED)
    if upgrading then
        assert(ace.frame ~= oldFrame and next(oldFrame.registered) == nil and not oldFrame.OnEvent)
    end
    ace.frame.OnEvent(ace.frame, "PLAYER_LOGIN")
    assert(received == 1, "transferred subscriptions must still dispatch")
    consumer:RegisterEvent("LATE_EVENT", function() end)
    assert(#timers == 2, "later registrations must schedule another callback")
    consumer:UnregisterEvent("LATE_EVENT")
    timers[2]()
    assert(not ace.frame.registered.LATE_EVENT, "cancelled pending event must stay unregistered")
    consumer:UnregisterAllEvents()
    assert(next(ace.frame.registered) == nil)
end
print("AceEvent fresh-load and upgrade regressions passed")

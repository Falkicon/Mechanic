local L = LibStub("AceLocale-3.0"):NewLocale("!Mechanic", "enUS", true)
if not L then
	return
end

-- Core
L["!Mechanic loaded."] = true
L["Unknown command: %s"] = true
L["Commands: console, errors, tests, perf, reload, gc, pause, copy, clear"] = true
L["GC: %.1f KB freed (%.1f MB -> %.1f MB)"] = true

-- Tabs
L["Console"] = true
L["Errors"] = true
L["Tests"] = true
L["Performance"] = true

-- Console (Phase 1)
L["Source"] = true
L["Category"] = true
L["Search"] = true
L["Clear"] = true
L["Copy"] = true
L["Dedup All"] = true
L["Dedup Adjacent"] = true
L["Pause"] = true
L["Resume"] = true
L["All"] = true

-- Errors (Phase 2)
L["Session"] = true
L["Current Session"] = true
L["Previous Session"] = true
L["All Sessions"] = true
L["Send to Console"] = true
L["Copy Error"] = true
L["Wipe Session"] = true
L["!BugGrabber Required"] = true

-- Tests (Phase 2)
L["Run Selected"] = true
L["Run All Auto"] = true
L["Validate"] = true
L["Clear Results"] = true
L["Total"] = true
L["Passed"] = true
L["Failed"] = true
L["Pending"] = true

-- Performance (Phase 3)
L["Auto-Refresh"] = true
L["Reset Stats"] = true
L["CPU Profiling"] = true
L["FPS"] = true
L["Latency"] = true
L["Memory"] = true
L["Addon"] = true
L["Tracking"] = true
L["Total Memory"] = true

-- Settings (Phase 3)
L["General"] = true
L["Copy Options"] = true
L["Registered Addons"] = true
L["Console Buffer Size"] = true
L["Show Timestamps"] = true
L["Include Environment Header"] = true
L["Include Character Info"] = true
L["Include Timestamp"] = true
L["Refresh Interval"] = true
L["Track Event Frequency"] = true
L["Show Minimap Icon"] = true

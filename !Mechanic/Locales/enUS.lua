local L = LibStub("AceLocale-3.0"):NewLocale("!Mechanic", "enUS", true)
if not L then
	return
end

-- Core
L["Mechanic"] = "Mechanic"
L["Unknown command: %s"] = "Unknown command: %s"
L["Commands: console, errors, tests, perf, reload, gc, pause, copy, clear"] =
	"Commands: console, errors, tests, perf, reload, gc, pause, copy, clear"
L["GC: %.1f KB freed (%.1f MB -> %.1f MB)"] = "GC: %.1f KB freed (%.1f MB -> %.1f MB)"
L["GC executed: %s freed"] = "GC executed: %s freed"

-- Tabs
L["Console"] = "Console"
L["Errors"] = "Errors"
L["Tests"] = "Tests"
L["Performance"] = "Performance"
L["Tools"] = "Tools"
L["API"] = "API"
L["Inspect"] = "Inspect"

-- Console
L["Source"] = "Source"
L["Category"] = "Category"
L["Search"] = "Search"
L["Clear"] = "Clear"
L["Dedup All"] = "Dedup All"
L["Dedup Adj"] = "Dedup Adj"
L["Dedup Adjacent"] = "Dedup Adjacent"
L["Pause"] = "Pause"
L["Resume"] = "Resume"
L["Reset Button"] = "Reset"
L["All"] = "All"
L["System"] = "System"
L["Lines: %d"] = "Lines: %d"
L["Lines: 0"] = "Lines: 0"
L["Reload UI"] = "Reload UI"

-- Errors
L["Session"] = "Session"
L["Current Session"] = "Current Session"
L["Previous Session"] = "Previous Session"
L["All Sessions"] = "All Sessions"
L["All"] = "All"
L["None"] = "None"
L["Send to Console"] = "Send to Console"
L["To Console"] = "To Console"
L["Copy Error"] = "Copy Error"
L["Wipe"] = "Wipe"
L["Wipe Session"] = "Wipe Session"
L["!BugGrabber Required"] = "!BugGrabber Required"
L["No errors in this session."] = "No errors in this session."
L["0/0"] = "0/0"
L["%d/%d"] = "%d/%d"
L["<"] = "<"
L[">"] = ">"
L["Error database wiped."] = "Error database wiped."
L["[Error]"] = "[Error]"
L["Session: %s | Error: %d/%d"] = "Session: %s | Error: %d/%d"
L["The Errors module requires !BugGrabber to capture Lua errors."] =
	"The Errors module requires !BugGrabber to capture Lua errors."
L["Download from:"] = "Download from:"
L["After installing, type /reload"] = "After installing, type /reload"

-- Tests
L["Run Selected"] = "Run Selected"
L["Run All Auto"] = "Run All Auto"
L["Validate"] = "Validate"
L["Total"] = "Total"
L["Passed"] = "Passed"
L["Failed"] = "Failed"
L["Pending"] = "Pending"
L["PASSED"] = "PASSED"
L["FAILED"] = "FAILED"
L["PENDING"] = "PENDING"
L["Status: %s%s|r"] = "Status: %s%s|r"
L["Status: |cff888888Not run|r"] = "Status: |cff888888Not run|r"
L["Category: %s"] = "Category: %s"
L["Select a test"] = "Select a test"
L["Tree View"] = "Tree View"
L["Export"] = "Export"
L["Export Button"] = "Export"
L["Duration: %.3fs"] = "Duration: %.3fs"
L["Message: %s"] = "Message: %s"
L["Details:"] = "Details:"
L["  %s %s: %s%s|r"] = "  %s %s: %s%s|r"
L["Captured Logs:"] = "Captured Logs:"
L["  %s"] = "  %s"
L["No test selected."] = "No test selected."
L["Tests complete: %d/%d passed"] = "Tests complete: %d/%d passed"
L["Result: %d/%d passed, %d failed, %d pending"] = "Result: %d/%d passed, %d failed, %d pending"
L["%s > %s"] = "%s > %s"
L["Total: %d | Passed: %d | Failed: %d | Pending: %d"] = "Total: %d | Passed: %d | Failed: %d | Pending: %d"
L["No addons have registered diagnostic tools.\n\nAddons can register tools via:\nMechanicLib:Register(name, { tools = { ... } })"] =
	"No addons have registered diagnostic tools.\n\nAddons can register tools via:\nMechanicLib:Register(name, { tools = { ... } })"

-- Performance
L["Auto-Refresh"] = "Auto-Refresh"
L["Reset Stats"] = "Reset Stats"
L["CPU Profiling"] = "CPU Profiling"
L["FPS"] = "FPS"
L["Latency"] = "Latency"
L["Memory"] = "Memory"
L["Addon"] = "Addon"
L["Tracking"] = "Tracking"
L["Total Memory"] = "Total Memory"
L["Reset"] = "Reset"
L["FPS: --"] = "FPS: --"
L["FPS: %.0f"] = "FPS: %.0f"
L["Latency: --ms / --ms"] = "Latency: --ms / --ms"
L["Latency: %dms / %dms"] = "Latency: %dms / %dms"
L["Lua Memory: -- MB"] = "Lua Memory: -- MB"
L["Lua Memory: %s"] = "Lua Memory: %s"
L["Tracking: %s | Total Memory: %s"] = "Tracking: %s | Total Memory: %s"
L["Tracking: %s | Total Memory: %s | CPU Profiling: %s"] = "Tracking: %s | Total Memory: %s | CPU Profiling: %s"
L["Total:"] = "Total:"
L["Total: %.2f ms/s"] = "Total: %.2f ms/s"
L["Table View"] = "Table View"
L["Performance stats reset."] = "Performance stats reset."
L["General"] = "General"
L["General Tab"] = "General"
L["Addons Tab"] = "Addons"
L["%"] = "%"
L["CPU ms/s"] = "CPU ms/s"
L["-"] = "-"
L["ON"] = "ON"
L["OFF"] = "OFF"
L["%s - Performance Breakdown"] = "%s - Performance Breakdown"
L["Metric             | ms/s     | %     | Description"] = "Metric             | ms/s     | %     | Description"
L["-------------------|----------|-------|-----------------------------"] =
	"-------------------|----------|-------|-----------------------------"
L["Addon              | Memory   | %     | CPU ms/s | %"] = "Addon              | Memory   | %     | CPU ms/s | %"
L["-------------------|----------|-------|----------|-------"] =
	"-------------------|----------|-------|----------|-------"
L["Addon              | Memory   | %"] = "Addon              | Memory   | %"
L["-------------------|----------|------"] = "-------------------|----------|------"
L["CPU profiling requires a UI reload. Continue?"] = "CPU profiling requires a UI reload. Continue?"
L["Reload"] = "Reload"
L["Cancel"] = "Cancel"
L["No sub-metrics available for this addon."] = "No sub-metrics available for this addon."
L["Addon performance tracking not available."] = "Addon performance tracking not available."
L["!Mechanic is initializing..."] = "!Mechanic is initializing..."
L["Addon does not provide sub-metrics."] = "Addon does not provide sub-metrics."

-- Settings
L["Copy Options"] = "Copy Options"
L["Registered Addons"] = "Registered Addons"
L["Console Buffer Size"] = "Console Buffer Size"
L["Show Timestamps"] = "Show Timestamps"
L["Include Environment Header"] = "Include Environment Header"
L["Include Character Info"] = "Include Character Info"
L["Include Timestamp"] = "Include Timestamp"
L["Refresh Interval"] = "Refresh Interval"
L["Track Event Frequency"] = "Track Event Frequency"
L["Show Minimap Icon"] = "Show Minimap Icon"

-- API
L["Run"] = "Run"
L["Run Category"] = "Run Category"
L["Copy Report"] = "Copy Report"
L["Results:"] = "Results:"
L["Not yet run"] = "Not yet run"
L["Notes:"] = "Notes:"
L["Parameters:"] = "Parameters:"
L["Category: %s"] = "Category: %s"
L["Midnight Impact: %s%s|r"] = "Midnight Impact: %s%s|r"
L["Midnight Note:"] = "Midnight Note:"
L["Select an API"] = "Select an API"
L["Select a category"] = "Select a category"
L["Search APIs..."] = "Search APIs..."
L["▼"] = "▼"
L["PROTECTED"] = "PROTECTED"
L["MISSING"] = "MISSING"
L["Function not found"] = "Function not found"
L["Cannot call from addon code"] = "Cannot call from addon code"
L["This API is protected and cannot be called from addon code in Midnight.\n\nConsider using the reskin strategy with Blizzard frames."] =
	"This API is protected and cannot be called from addon code in Midnight.\n\nConsider using the reskin strategy with Blizzard frames."
L["Function not available: %s\n\nThis may be a newer API not yet available in this WoW version."] =
	"Function not available: %s\n\nThis may be a newer API not yet available in this WoW version."
L["No API selected."] = "No API selected."

-- Shared Export
L["Metric"] = "Metric"
L["ms/s"] = "ms/s"
L["Description"] = "Description"
L["Press Ctrl+C to copy the text below."] = "Press Ctrl+C to copy the text below."
L["Close"] = "Close"
L["Inspecting: %s"] = "Inspecting: %s"
L["No object selected for inspection."] = "No object selected for inspection."
L["--- Members ---"] = "--- Members ---"
L["... (truncated)"] = "... (truncated)"

-- Inspect
L["Pick"] = "Pick"
L["Picking..."] = "Picking..."
L["Watch"] = "Watch"
L["+ Watch"] = "+ Watch"
L["Inspect"] = "Inspect"
L["Frame path or global table..."] = "Frame path or global table..."
L["Select a frame"] = "Select a frame"
L["Geometry"] = "Geometry"
L["Visibility"] = "Visibility"
L["Texture"] = "Texture"
L["FontString"] = "FontString"
L["Common Properties"] = "Common Properties"
L["Properties"] = "Properties"
L["Export Changes"] = "Export Changes"
L["Reset All Changes"] = "Reset All Changes"
L["Shown"] = "Shown"
L["Alpha"] = "Alpha"
L["Layering"] = "Layering"
L["Level"] = "Level"
L["Strata"] = "Strata"
L["Width"] = "Width"
L["Height"] = "Height"
L["Frame Level"] = "Frame Level"
L["Frame Strata"] = "Frame Strata"
L["Scale"] = "Scale"
L["Text"] = "Text"
L["Color"] = "Color"
L["Text Color"] = "Text Color"
L["Vertex Color"] = "Vertex Color"
L["No changes to export."] = "No changes to export."
L["Scripts"] = "Scripts"
L["Watch List"] = "Watch List"
L["+ Watch Current"] = "+ Watch Current"
L["Remove from Watch List"] = "Remove from Watch List"
L["Clear Watch List"] = "Clear Watch List"
L["Export All"] = "Export All"
L["Session: %s | Errors: %d"] = "Session: %s | Errors: %d"
L["Test Item"] = "Test Item"
L["Player"] = "Player"

-- Self-Registration (Dogfooding)
L["Register Mechanic"] = "Register Mechanic"
L["View Health Log"] = "View Health Log"
L["Clear Health Log"] = "Clear Health Log"
L["Reset UI Position"] = "Reset UI Position"
L["Export persistent internal error log for agent auditing."] =
	"Export persistent internal error log for agent auditing."
L["Clear all entries from the persistent health log."] = "Clear all entries from the persistent health log."
L["Reset the main frame to default size and position."] = "Reset the main frame to default size and position."
L["Mechanic: Developer tools for World of Warcraft"] = "Mechanic: Developer tools for World of Warcraft"
L["Health log cleared."] = "Health log cleared."
L["UI position reset."] = "UI position reset."
L["Tools : !Mechanic : View Health Log"] = "Tools : !Mechanic : View Health Log"

-- Export Dialog Titles
L["Console Export"] = "Console Export"
L["Errors Export"] = "Errors Export"
L["Tests Export"] = "Tests Export"
L["Performance Export"] = "Performance Export"
L["Performance: %s"] = "Performance: %s"
L["API: %s"] = "API: %s"
L["Tools: %s"] = "Tools: %s"
L["Inspect: %s"] = "Inspect: %s"
L["API Export"] = "API Export"
L["Tools Export"] = "Tools Export"
L["Inspect Export"] = "Inspect Export"

-- Help System
L["Help"] = "Help"

-- Help: Inspect Tab
L["HELP_INSPECT_TITLE"] = "Inspect Tab"
L["HELP_INSPECT_PICK_HEADING"] = "Pick Mode"
L["HELP_INSPECT_PICK_BODY"] =
	"Click the Pick button to enter pick mode. Hover over any frame in the game UI and click to select it for inspection. Press ESC to cancel."
L["HELP_INSPECT_PATH_HEADING"] = "Path Input"
L["HELP_INSPECT_PATH_BODY"] =
	"Type a frame path (e.g., PlayerFrame.healthBar) or global table name directly. Press Enter to inspect."
L["HELP_INSPECT_WATCH_HEADING"] = "Watch List (+ Watch)"
L["HELP_INSPECT_WATCH_BODY"] =
	"Pin the current frame to the Watch List for live value monitoring. Watched frames update automatically and persist across tab switches."
L["HELP_INSPECT_CHAT_HEADING"] = "Chat Integration"
L["HELP_INSPECT_CHAT_BODY"] =
	"Use /mech inspect <path> to inspect from chat. Useful for bug reports: share the exact path with other developers."
L["HELP_INSPECT_TREE_HEADING"] = "Tree Navigation"
L["HELP_INSPECT_TREE_BODY"] =
	"The left panel shows frame hierarchy. Click nodes to navigate ancestors (parents) and children. Disabled for plain tables."
L["HELP_INSPECT_PROPERTIES_HEADING"] = "Live Properties"
L["HELP_INSPECT_PROPERTIES_BODY"] =
	"The Properties panel allows real-time editing of frame attributes. Changes are applied instantly. Use the Export button to generate Lua code for your changes."
L["HELP_INSPECT_EXPORT_HEADING"] = "Export"
L["HELP_INSPECT_EXPORT_BODY"] =
	"Copy all frame properties to clipboard for bug reports or AI agent context. Includes optional environment header."

-- Help: Console Tab
L["HELP_CONSOLE_TITLE"] = "Console Tab"
L["HELP_CONSOLE_FILTER_HEADING"] = "Filtering"
L["HELP_CONSOLE_FILTER_BODY"] =
	"Select an addon in the left nav to filter logs by source. Use the search box for text matching across message, source, and category."
L["HELP_CONSOLE_DEDUP_HEADING"] = "Dedup Modes"
L["HELP_CONSOLE_DEDUP_BODY"] =
	"Dedup All removes duplicate messages entirely. Dedup Adjacent collapses repeated consecutive messages with a count (x5)."
L["HELP_CONSOLE_PAUSE_HEADING"] = "Pause/Resume"
L["HELP_CONSOLE_PAUSE_BODY"] =
	"Pause stops capturing new log entries, letting you review the current output without scroll. Resume to continue logging."
L["HELP_CONSOLE_EXPORT_HEADING"] = "Export"
L["HELP_CONSOLE_EXPORT_BODY"] =
	"Copy filtered logs to clipboard. Optional environment header provides context for bug reports."

-- Help: Errors Tab
L["HELP_ERRORS_TITLE"] = "Errors Tab"
L["HELP_ERRORS_SESSION_HEADING"] = "Session Filter"
L["HELP_ERRORS_SESSION_BODY"] =
	"View errors from the current session, previous session, or all sessions combined. Useful for tracking down issues that occurred before a reload."
L["HELP_ERRORS_NAV_HEADING"] = "Error Navigation"
L["HELP_ERRORS_NAV_BODY"] =
	"Use the < > buttons to step through errors. Click an error in the list to view its full stack trace and local variables."
L["HELP_ERRORS_CONSOLE_HEADING"] = "To Console"
L["HELP_ERRORS_CONSOLE_BODY"] =
	"Send the selected error to the Console tab. This provides context by showing the error alongside other log messages."
L["HELP_ERRORS_BUGGRABBER_HEADING"] = "BugGrabber Dependency"
L["HELP_ERRORS_BUGGRABBER_BODY"] =
	"This module requires !BugGrabber to capture Lua errors. Download it from CurseForge if not installed."

-- Help: Tests Tab
L["HELP_TESTS_TITLE"] = "Tests Tab"
L["HELP_TESTS_TREE_HEADING"] = "Test Tree"
L["HELP_TESTS_TREE_BODY"] =
	"Browse tests organized by addon and category. Click a test to view its details, status, and any captured log output."
L["HELP_TESTS_RUN_HEADING"] = "Run Selected"
L["HELP_TESTS_RUN_BODY"] =
	"Execute the currently selected test and display the result. View pass/fail status, duration, and any error messages."
L["HELP_TESTS_AUTO_HEADING"] = "Run All Auto"
L["HELP_TESTS_AUTO_BODY"] =
	"Run all tests marked with autoRun = true. These are typically fast, non-destructive validation tests."
L["HELP_TESTS_RESULTS_HEADING"] = "Results"
L["HELP_TESTS_RESULTS_BODY"] =
	"Green = passed, Red = failed, Gray = pending/not run. Failed tests show error messages and captured log context."

-- Help: Performance Tab
L["HELP_PERF_TITLE"] = "Performance Tab"
L["HELP_PERF_CPU_HEADING"] = "CPU Profiling"
L["HELP_PERF_CPU_BODY"] =
	"Toggle CPU profiling to track per-addon CPU usage in ms/s. Requires a UI reload to enable/disable. Shows percentage of total frame time."
L["HELP_PERF_REFRESH_HEADING"] = "Auto-Refresh"
L["HELP_PERF_REFRESH_BODY"] =
	"Continuously updates metrics every few seconds. Disable for snapshot analysis or when you want stable numbers."
L["HELP_PERF_SUBMETRICS_HEADING"] = "Sub-Metrics"
L["HELP_PERF_SUBMETRICS_BODY"] =
	"Click an addon in the list to see its registered sub-metrics breakdown (if available). Addons can register custom metrics via MechanicLib."
L["HELP_PERF_RESET_HEADING"] = "Reset Stats"
L["HELP_PERF_RESET_BODY"] =
	"Clear accumulated performance data for a fresh measurement starting point. Useful after major events or loading screens."

-- Help: Tools Tab
L["HELP_TOOLS_TITLE"] = "Tools Tab"
L["HELP_TOOLS_ADDON_HEADING"] = "Addon Tools"
L["HELP_TOOLS_ADDON_BODY"] =
	"Select an addon in the left nav to access its registered diagnostic panels. Addons register tools via MechanicLib:Register()."
L["HELP_TOOLS_HEALTH_HEADING"] = "Health Log"
L["HELP_TOOLS_HEALTH_BODY"] =
	"View !Mechanic's internal error and lifecycle log. Persists across reloads for post-mortem debugging."
L["HELP_TOOLS_RESET_HEADING"] = "Reset UI"
L["HELP_TOOLS_RESET_BODY"] =
	"Restore the main Mechanic window to its default size and position. Useful if the window gets stuck off-screen."

-- Help: API Tab
L["HELP_API_TITLE"] = "API Tab"
L["HELP_API_BROWSER_HEADING"] = "API Browser"
L["HELP_API_BROWSER_BODY"] =
	"Browse categorized WoW APIs with documentation. Search by name, filter by category, and see Midnight 12.0 readiness status."
L["HELP_API_RUN_HEADING"] = "Run"
L["HELP_API_RUN_BODY"] =
	"Execute the selected API with default parameters to test availability. Shows return values or error messages."
L["HELP_API_CATEGORY_HEADING"] = "Run Category"
L["HELP_API_CATEGORY_BODY"] =
	"Batch test all APIs in the selected category. Quickly identify which APIs are available, protected, or missing."
L["HELP_API_MIDNIGHT_HEADING"] = "Midnight Impact"
L["HELP_API_MIDNIGHT_BODY"] =
	"Shows if an API is unchanged, conditionally affected, protected, or missing in Midnight 12.0. Green = safe, Yellow = conditional, Red = breaking."

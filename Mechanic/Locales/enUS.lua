local L = LibStub("AceLocale-3.0"):NewLocale("Mechanic", "enUS", true)
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
L["Refresh"] = "Refresh"

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
L["Run Namespace"] = "Run Namespace"
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
L["Interactivity"] = "Interactivity"
L["Anchors"] = "Anchors"
L["Regions"] = "Regions"
L["Regions (Textures/FontStrings)"] = "Regions (Textures/FontStrings)"
L["FenUI Details"] = "FenUI Details"
L["Attributes"] = "Attributes"
L["Hierarchy"] = "Hierarchy"
L["Safe"] = "Safe"
L["Safe APIs Only"] = "Safe APIs Only"

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
L["HELP_INSPECT_OVERVIEW_HEADING"] = "Overview"
L["HELP_INSPECT_OVERVIEW_BODY"] =
	"The Inspect tab is a powerful frame debugger for exploring WoW's UI hierarchy. You can pick any visible frame, navigate its parent/child relationships, edit properties in real-time, and watch frames for live updates."
L["HELP_INSPECT_PICK_HEADING"] = "Pick Mode"
L["HELP_INSPECT_PICK_BODY"] =
	"Click the Pick button (crosshair icon) to enter pick mode. Move your mouse over any frame in the game UI - it will be highlighted with an orange border and labeled. Click to select that frame for inspection, or press ESC to cancel pick mode."
L["HELP_INSPECT_PATH_HEADING"] = "Path Input"
L["HELP_INSPECT_PATH_BODY"] =
	"Type a frame path directly into the input field (e.g., PlayerFrame, Minimap.ZoomIn, or UIParent). Press Enter to inspect. Paths are resolved using WoW's global namespace and frame hierarchy. Use dots to traverse child frames."
L["HELP_INSPECT_TREE_HEADING"] = "Tree Navigation"
L["HELP_INSPECT_TREE_BODY"] =
	"The Tree panel on the left shows the frame hierarchy. Click '>' to expand parent nodes and see children. Click any node to select that frame. The tree updates when you pick a new frame. Eye icons toggle frame visibility."
L["HELP_INSPECT_PROPERTIES_HEADING"] = "Properties Panel"
L["HELP_INSPECT_PROPERTIES_BODY"] =
	"The Properties panel allows real-time editing of frame attributes like position, size, alpha, scale, strata, and colors. Changes are applied instantly to the live UI. Each property has a reset button to revert individual changes. Use Export Changes to generate Lua code."
L["HELP_INSPECT_DETAILS_HEADING"] = "Details Panel"
L["HELP_INSPECT_DETAILS_BODY"] =
	"The Details panel shows read-only information including frame type, parent chain, anchors, regions (textures/fontstrings), scripts, and attributes. Click the collapse toggles (v/>) to show or hide sections."
L["HELP_INSPECT_WATCH_HEADING"] = "Watch List"
L["HELP_INSPECT_WATCH_BODY"] =
	"Pin frequently inspected frames to the Watch List using the '+ Watch' button. Watched frames appear in the right panel with live-updating values. Click a watch entry to jump to that frame. Clear button removes all watches."
L["HELP_INSPECT_EXPORT_HEADING"] = "Export"
L["HELP_INSPECT_EXPORT_BODY"] =
	"The Export button copies all frame information to clipboard. If you've made property edits, 'Export Changes' generates ready-to-use Lua code showing before/after values. Great for sharing with other developers or AI agents."

-- Help: Console Tab
L["HELP_CONSOLE_TITLE"] = "Console Tab"
L["HELP_CONSOLE_OVERVIEW_HEADING"] = "Overview"
L["HELP_CONSOLE_OVERVIEW_BODY"] =
	"The Console aggregates debug output from all MechanicLib-registered addons in one place. It captures print statements, debug logs, and custom categories with timestamps. The buffer holds the most recent entries (configurable in settings)."
L["HELP_CONSOLE_SOURCE_HEADING"] = "Source Filtering"
L["HELP_CONSOLE_SOURCE_BODY"] =
	"The left navigation lists all addons that have sent messages. Select an addon to show only its logs. Select 'All' to see everything. Each addon shows a count of its messages in parentheses."
L["HELP_CONSOLE_SEARCH_HEADING"] = "Search"
L["HELP_CONSOLE_SEARCH_BODY"] =
	"Type in the search box to filter messages by text content. Search matches against the message text, source addon name, and category. Combine with source filtering for precise results."
L["HELP_CONSOLE_DEDUP_HEADING"] = "Dedup Modes"
L["HELP_CONSOLE_DEDUP_BODY"] =
	"Two dedup modes help reduce noise. 'Dedup All' removes all duplicate messages entirely, keeping only unique entries. 'Dedup Adjacent' collapses only consecutive repeated messages, showing a count like (x5). Toggle buttons are in the toolbar."
L["HELP_CONSOLE_PAUSE_HEADING"] = "Pause/Resume"
L["HELP_CONSOLE_PAUSE_BODY"] =
	"Click the Pause button to freeze the display and stop capturing new messages. This lets you read through logs without them scrolling away. Click again to resume. The button shows a play icon when paused."
L["HELP_CONSOLE_CLEAR_HEADING"] = "Clear"
L["HELP_CONSOLE_CLEAR_BODY"] =
	"The Clear button (trash icon) empties the entire console buffer. This is useful to start fresh when debugging a specific action or scenario. Cleared messages cannot be recovered."
L["HELP_CONSOLE_EXPORT_HEADING"] = "Export"
L["HELP_CONSOLE_EXPORT_BODY"] =
	"Export copies all currently filtered logs to clipboard in a shareable format. If enabled in settings, includes an environment header with WoW version, character info, and location for complete bug report context."

-- Help: Errors Tab
L["HELP_ERRORS_TITLE"] = "Errors Tab"
L["HELP_ERRORS_OVERVIEW_HEADING"] = "Overview"
L["HELP_ERRORS_OVERVIEW_BODY"] =
	"The Errors tab displays Lua errors captured by !BugGrabber. It shows the error message, full stack trace, and local variables at the time of the error. Essential for addon debugging and tracking down bugs."
L["HELP_ERRORS_SESSION_HEADING"] = "Session Dropdown"
L["HELP_ERRORS_SESSION_BODY"] =
	"Filter errors by session using the dropdown. 'Current Session' shows errors since your last /reload. 'Previous Session' shows errors from before the last reload. 'All Sessions' shows the complete error history stored by BugGrabber."
L["HELP_ERRORS_SOURCE_HEADING"] = "Source Filtering"
L["HELP_ERRORS_SOURCE_BODY"] =
	"The left navigation groups errors by the addon that caused them. Mechanic auto-detects the source from the stack trace. Click an addon to see only its errors. The count shows how many errors that addon has."
L["HELP_ERRORS_NAV_HEADING"] = "Error Navigation"
L["HELP_ERRORS_NAV_BODY"] =
	"Use the < and > buttons to step through errors one at a time. The counter shows your current position (e.g., 3/12). The main display shows the full error with colorized stack trace for easy reading."
L["HELP_ERRORS_PAUSE_HEADING"] = "Pause"
L["HELP_ERRORS_PAUSE_BODY"] =
	"Click Pause to stop capturing new errors. Useful when you want to examine existing errors without new ones being added. The error count and display freeze until you resume."
L["HELP_ERRORS_WIPE_HEADING"] = "Wipe"
L["HELP_ERRORS_WIPE_BODY"] =
	"The Wipe button (trash icon) clears the entire BugGrabber error database. Use this to start fresh after fixing bugs or when the error list becomes too long. This action cannot be undone."
L["HELP_ERRORS_EXPORT_HEADING"] = "Export"
L["HELP_ERRORS_EXPORT_BODY"] =
	"Export copies all errors (or current filtered set) to clipboard with full stack traces. Includes environment header if enabled. Perfect for sharing in bug reports or pasting into AI assistants for debugging help."
L["HELP_ERRORS_BUGGRABBER_HEADING"] = "BugGrabber Required"
L["HELP_ERRORS_BUGGRABBER_BODY"] =
	"This module requires the !BugGrabber addon to capture Lua errors. If not installed, you'll see instructions to download it from CurseForge or WoWInterface. After installing, type /reload."

-- Help: Tests Tab
L["HELP_TESTS_TITLE"] = "Tests Tab"
L["HELP_TESTS_OVERVIEW_HEADING"] = "Overview"
L["HELP_TESTS_OVERVIEW_BODY"] =
	"The Tests tab provides a test runner for addon diagnostics. Addons can register tests via MechanicLib to validate their functionality. Tests are organized by addon and category in a tree view."
L["HELP_TESTS_TREE_HEADING"] = "Test Tree"
L["HELP_TESTS_TREE_BODY"] =
	"Browse tests organized hierarchically: Addon > Category > Test. Click to expand nodes. Each test shows a status icon. Click a test to see its details in the right panel. The tree updates after running tests."
L["HELP_TESTS_RUN_HEADING"] = "Run Selected"
L["HELP_TESTS_RUN_BODY"] =
	"Click the play button to execute the currently selected test. The result appears in the details panel showing pass/fail status, execution duration, any error messages, and captured log output."
L["HELP_TESTS_AUTO_HEADING"] = "Run All Auto"
L["HELP_TESTS_AUTO_BODY"] =
	"The 'Run All Auto' button executes all tests marked with autoRun = true across all registered addons. These are typically quick validation tests. A summary appears in chat showing total passed/failed."
L["HELP_TESTS_DETAILS_HEADING"] = "Test Details"
L["HELP_TESTS_DETAILS_BODY"] =
	"When a test is selected, the details panel shows: test name, category, type (auto/manual), status with color coding, execution duration in seconds, any error message, structured result details, and captured logs."
L["HELP_TESTS_STATUS_HEADING"] = "Status Icons"
L["HELP_TESTS_STATUS_BODY"] =
	"Test status is shown with colored icons: [+] green = passed, [x] red = failed, [?] yellow = pending/running, [-] gray = not yet run. These appear in both the tree and details panel."
L["HELP_TESTS_EXPORT_HEADING"] = "Export"
L["HELP_TESTS_EXPORT_BODY"] =
	"Export copies all test results to clipboard in a structured format. Includes pass/fail counts, individual test results, and any error details. Useful for CI reports or sharing with team members."

-- Help: Performance Tab
L["HELP_PERF_TITLE"] = "Performance Tab"
L["HELP_PERF_OVERVIEW_HEADING"] = "Overview"
L["HELP_PERF_OVERVIEW_BODY"] =
	"The Performance tab monitors addon resource usage including memory and CPU time. The General view shows system metrics (FPS, latency, Lua memory). Click an addon in the left nav to see its detailed breakdown."
L["HELP_PERF_GENERAL_HEADING"] = "General View"
L["HELP_PERF_GENERAL_BODY"] =
	"The default view shows: current FPS, home/world latency, total Lua memory usage, and a sortable table of all addons with memory and CPU stats. The footer shows tracking duration and totals."
L["HELP_PERF_ADDONS_HEADING"] = "Addon List"
L["HELP_PERF_ADDONS_BODY"] =
	"The addon table shows each addon's memory usage (KB/MB), percentage of total, CPU time (ms/s if profiling enabled), and CPU percentage. Click column headers to sort. Click an addon row for detailed breakdown."
L["HELP_PERF_CPU_HEADING"] = "CPU Profiling"
L["HELP_PERF_CPU_BODY"] =
	"Enable CPU Profiling via the checkbox to track per-addon CPU usage. This requires a UI reload because it uses WoW's built-in profiling system. CPU columns show milliseconds per second and percentage of frame time."
L["HELP_PERF_REFRESH_HEADING"] = "Auto-Refresh"
L["HELP_PERF_REFRESH_BODY"] =
	"When enabled, metrics update automatically every few seconds. Disable this for snapshot analysis when you want stable numbers. Manual refresh happens when switching views or returning to the tab."
L["HELP_PERF_SUBMETRICS_HEADING"] = "Sub-Metrics"
L["HELP_PERF_SUBMETRICS_BODY"] =
	"Select an addon in the left nav to see its registered sub-metrics breakdown. Addons can register custom metrics via MechanicLib showing internal timing (e.g., 'Event Processing: 2.5ms'). Not all addons provide this."
L["HELP_PERF_RESET_HEADING"] = "Reset Stats"
L["HELP_PERF_RESET_BODY"] =
	"Click Reset to clear accumulated performance data and start measuring from zero. Useful after loading screens, major events, or when you want a fresh measurement baseline for a specific activity."
L["HELP_PERF_EXPORT_HEADING"] = "Export"
L["HELP_PERF_EXPORT_BODY"] =
	"Export copies all performance data to clipboard in a formatted table. Includes system metrics, all addon memory/CPU stats, and sub-metrics if viewing a specific addon. Great for performance reports."

-- Help: Tools Tab
L["HELP_TOOLS_TITLE"] = "Tools Tab"
L["HELP_TOOLS_OVERVIEW_HEADING"] = "Overview"
L["HELP_TOOLS_OVERVIEW_BODY"] =
	"The Tools tab hosts custom diagnostic panels registered by addons. Each addon can provide its own tools UI for debugging, configuration, or specialized operations. Select an addon from the left nav to view its panel."
L["HELP_TOOLS_ADDON_HEADING"] = "Addon Selection"
L["HELP_TOOLS_ADDON_BODY"] =
	"The left navigation lists all addons that have registered tools via MechanicLib. Click an addon name to load its custom panel in the content area. The panel is created by the addon's own code."
L["HELP_TOOLS_PANEL_HEADING"] = "Tool Panels"
L["HELP_TOOLS_PANEL_BODY"] =
	"Each addon defines its own tools panel layout. Common uses include: viewing internal logs, resetting state, configuring debug options, exporting data, and running addon-specific diagnostics. Consult each addon's documentation."
L["HELP_TOOLS_REGISTER_HEADING"] = "For Addon Developers"
L["HELP_TOOLS_REGISTER_BODY"] =
	"Register tools via MechanicLib:Register(name, { tools = { createPanel = function(parent), destroyPanel = function(panel) } }). Your createPanel function receives a parent frame to populate with UI elements."
L["HELP_TOOLS_EXPORT_HEADING"] = "Export"
L["HELP_TOOLS_EXPORT_BODY"] =
	"Export copies a summary of registered tool providers to clipboard. Useful for debugging MechanicLib integration or documenting which addons support the tools interface."

-- Help: API Tab
L["HELP_API_TITLE"] = "API Tab"
L["HELP_API_OVERVIEW_HEADING"] = "Overview"
L["HELP_API_OVERVIEW_BODY"] =
	"The API tab is a test bench for exploring WoW's Lua APIs. Browse categorized functions, test them with parameters, see return values, and check Midnight 12.0 compatibility. Essential for addon development and troubleshooting."
L["HELP_API_BROWSER_HEADING"] = "API Browser"
L["HELP_API_BROWSER_BODY"] =
	"The left navigation organizes APIs by category (Unit, Spell, Item, Frame, etc.). Use the search box to filter by name. Category headers are bold and non-clickable. Click any API to see its details and parameters."
L["HELP_API_PARAMS_HEADING"] = "Parameters"
L["HELP_API_PARAMS_BODY"] =
	"Each API shows its parameters with input fields. Type values directly or use the dropdown (v) to select from common examples. Parameter types are shown in parentheses. Required vs optional is indicated."
L["HELP_API_RUN_HEADING"] = "Run Button"
L["HELP_API_RUN_BODY"] =
	"Click Run to execute the API with your current parameter values. Results appear in the Results box below showing return values, errors, or 'protected' status. Useful for testing API availability."
L["HELP_API_CATEGORY_HEADING"] = "Run Category"
L["HELP_API_CATEGORY_BODY"] =
	"Click 'Run All' to batch-test every API in the current category. This quickly identifies which APIs are available, protected, or missing in your WoW version. Results summary appears with counts."
L["HELP_API_MIDNIGHT_HEADING"] = "Midnight Impact"
L["HELP_API_MIDNIGHT_BODY"] =
	"Each API shows its Midnight 12.0 compatibility status. GREEN = unchanged and safe. YELLOW = conditional (behavior may differ). RED = breaking (protected or removed). Check the Midnight Note for specific guidance."
L["HELP_API_NOTES_HEADING"] = "Personal Notes"
L["HELP_API_NOTES_BODY"] =
	"The Notes field at the bottom lets you save personal annotations for each API. Notes are stored in your Mechanic profile and persist across sessions. Use for reminders, workarounds, or documentation."
L["HELP_API_EXPORT_HEADING"] = "Copy Report"
L["HELP_API_EXPORT_BODY"] =
	"The Copy button exports the current API's details including name, category, parameters, Midnight status, last run results, and your notes. Perfect for documentation or sharing in discussions."


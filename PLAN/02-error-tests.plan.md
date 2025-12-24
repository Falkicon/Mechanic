# Phase 2: Error and Test Integration

Adds BugGrabber integration for error capture and aggregated test results from registered addons.

---

## Prerequisites

- Phase 1 complete:
  - MechanicLib functional
  - Main panel with tabs
  - Console module working
  - Copy system implemented
- `!BugGrabber` addon available (optional dependency)

## Reference

- [MASTER_PLAN.md](MASTER_PLAN.md) - Sections 3, 4, 5
- [01-foundation.plan.md](01-foundation.plan.md) - MechanicLib API, Copy system

---

## Scope

### In Scope
- Errors module with BugGrabber integration
- Pause/resume for error capture
- Error navigation (prev/next)
- Tests module with tree view
- Test run controls
- Aggregated results display
- Junction links to WoW clients

### Out of Scope
- Performance module (Phase 3)
- Settings panel (Phase 3)
- Migration of existing addons (Phase 4)

---

## Detailed Requirements

### 1. Errors Module (UI/Errors.lua)

**File**: `UI/Errors.lua`

```lua
local ErrorsModule = {}
Mechanic.Errors = ErrorsModule

ErrorsModule.paused = false
ErrorsModule.currentSession = nil   -- BugGrabber session ID
ErrorsModule.currentIndex = nil     -- Current error index
ErrorsModule.errors = {}            -- Filtered error list

function ErrorsModule:Initialize(parent)
    -- Session dropdown
    -- Navigation controls (Prev, count, Next)
    -- Pause button
    -- Error display (MultiLineEditBox)
    -- Action buttons (Send to Console, Copy, Wipe)
end
```

#### BugGrabber Integration

```lua
function ErrorsModule:OnEnable()
    -- Check if BugGrabber is available
    if not BugGrabber then
        self:ShowInstallMessage()
        return
    end
    
    -- Register callback
    BugGrabber.RegisterCallback(self, "BugGrabber_BugGrabbed", "OnBugGrabbed")
    
    -- Get current session
    self.currentSession = BugGrabber:GetSessionId()
    self:RefreshErrors()
end

function ErrorsModule:OnBugGrabbed(event, errorObject)
    -- Note: BugGrabber always captures errors in the background.
    -- Pause only freezes UI updates - errors still accumulate.
    -- When resumed, RefreshErrors() will show all captured errors.
    if self.paused then return end
    
    -- Refresh error list
    self:RefreshErrors()
    
    -- Auto-navigate to newest if at end
    if self.currentIndex == #self.errors - 1 then
        self.currentIndex = #self.errors
    end
    
    self:UpdateDisplay()
end

function ErrorsModule:RefreshErrors()
    local session = self.currentSession
    if session == "all" then
        self.errors = BugGrabber:GetDB()
    else
        self.errors = {}
        for _, err in ipairs(BugGrabber:GetDB()) do
            if err.session == session then
                table.insert(self.errors, err)
            end
        end
    end
end
```

#### Error Display

```lua
function ErrorsModule:UpdateDisplay()
    local err = self.errors[self.currentIndex]
    if not err then
        self.editBox:SetText("No errors in this session.")
        return
    end
    
    local text = self:FormatError(err)
    self.editBox:SetText(text)
    
    -- Update navigation
    self.countLabel:SetText(string.format("%d/%d", self.currentIndex, #self.errors))
    self.prevButton:SetEnabled(self.currentIndex > 1)
    self.nextButton:SetEnabled(self.currentIndex < #self.errors)
end

function ErrorsModule:FormatError(err)
    local lines = {}
    
    -- Count and message
    table.insert(lines, string.format("%dx %s", err.counter or 1, err.message))
    table.insert(lines, "")
    
    -- Stack trace (colorized)
    if err.stack then
        table.insert(lines, "Stack:")
        for line in err.stack:gmatch("[^\n]+") do
            table.insert(lines, "  " .. self:ColorizeStackLine(line))
        end
        table.insert(lines, "")
    end
    
    -- Locals
    if err.locals then
        table.insert(lines, "Locals:")
        table.insert(lines, self:ColorizeLocals(err.locals))
    end
    
    return table.concat(lines, "\n")
end
```

#### Colorization (from BugSack patterns)

```lua
function ErrorsModule:ColorizeStackLine(line)
    -- Remove Interface/AddOns prefix
    line = line:gsub("[%.I][%.n][%.t][%.e][%.r]face/", "")
    line = line:gsub("%.?%.?%.?/?AddOns/", "")
    
    -- Highlight line numbers
    line = line:gsub(":(%d+)", ":|cff00ff00%1|r")
    
    -- Highlight lua files
    line = line:gsub("([^/]+%.lua)", "|cffffffff%1|r")
    
    return line
end

function ErrorsModule:ColorizeLocals(locals)
    local result = locals
    -- Highlight variable names
    result = result:gsub("(%s-)([%a_][%a_%d]*) = ", "%1|cffffff80%2|r = ")
    -- Highlight nil
    result = result:gsub("= nil", "= |cffff7f7fnil|r")
    -- Highlight numbers
    result = result:gsub("= (%-?[%d%.]+)", "= |cffff7fff%1|r")
    return result
end
```

#### Pause Feature (KEY DIFFERENTIATOR)

```lua
function ErrorsModule:TogglePause()
    self.paused = not self.paused
    self.pauseButton:SetText(self.paused and "▶ Resume" or "⏸ Pause")
    
    if not self.paused then
        -- Resuming - refresh to catch any errors we missed
        self:RefreshErrors()
        self:UpdateDisplay()
    end
end
```

#### Session Management

```lua
function ErrorsModule:CreateSessionDropdown()
    local sessions = {
        { value = BugGrabber:GetSessionId(), text = "Current Session" },
        { value = BugGrabber:GetSessionId() - 1, text = "Previous Session" },
        { value = "all", text = "All Sessions" },
    }
    
    -- Dropdown using FenUI or AceGUI
end

function ErrorsModule:OnSessionChanged(session)
    self.currentSession = session
    self:RefreshErrors()
    self.currentIndex = #self.errors  -- Start at end (newest)
    self:UpdateDisplay()
end
```

#### Actions

```lua
function ErrorsModule:SendToConsole()
    local err = self.errors[self.currentIndex]
    if not err then return end
    
    local text = self:FormatError(err)
    MechanicLib:Log("BugGrabber", text, "[Error]")
end

function ErrorsModule:GetCopyText(includeHeader)
    local lines = {}
    
    if includeHeader then
        lines = { Mechanic:GetEnvironmentHeader() }
        table.insert(lines, string.format("Session: %s | Error: %d/%d",
            tostring(self.currentSession), self.currentIndex, #self.errors))
        table.insert(lines, "---")
    end
    
    local err = self.errors[self.currentIndex]
    if err then
        table.insert(lines, self:FormatError(err))
    end
    
    return table.concat(lines, "\n")
end

function ErrorsModule:WipeSession()
    BugGrabber:Reset()
    self:RefreshErrors()
    self:UpdateDisplay()
    Mechanic:Print("Error database wiped.")
end
```

#### Install Message (when BugGrabber missing)

```lua
function ErrorsModule:ShowInstallMessage()
    local message = [[
|cffff4411!BugGrabber Required|r

The Errors module requires !BugGrabber to capture Lua errors.

Download from:
- CurseForge: curseforge.com/wow/addons/bug-grabber
- WoWInterface: wowinterface.com/downloads/info5883

After installing, type /reload
]]
    self.editBox:SetText(message)
end
```

**Acceptance Criteria**:
- [ ] Errors display when BugGrabber present
- [ ] Install message shows when BugGrabber missing
- [ ] Pause stops error capture updates
- [ ] Resume catches up with missed errors
- [ ] Navigation (prev/next) works
- [ ] Session filter works
- [ ] Colorization matches BugSack style
- [ ] Send to Console works
- [ ] Copy produces formatted output
- [ ] Wipe clears database

---

### 2. Tests Module (UI/Tests.lua)

**File**: `UI/Tests.lua`

```lua
local TestsModule = {}
Mechanic.Tests = TestsModule

TestsModule.selectedAddon = nil
TestsModule.selectedTest = nil

function TestsModule:Initialize(parent)
    -- Left panel: Tree view (use AceGUI TreeGroup - see note below)
    -- Right panel: Test details
    -- Toolbar: Run Selected, Run All, Validate, Clear, Copy
    -- Summary bar: Total, Passed, Failed, Pending
end
```

#### Tree View (Left Panel)

**Implementation Note**: FenUI does not currently have a TreeView widget. Use `AceGUI:Create("TreeGroup")` for the test hierarchy. This is acceptable since AceGUI is already embedded in !Mechanic.

```lua
function TestsModule:BuildTree()
    local tree = {}
    
    for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
        if capabilities.tests then
            local addonNode = {
                text = addonName,
                value = addonName,
                children = {},
            }
            
            -- Get categories
            local categories = capabilities.tests.getCategories()
            for _, category in ipairs(categories) do
                local categoryNode = {
                    text = category,
                    value = addonName .. ":" .. category,
                    children = {},
                }
                
                -- Get tests in category
                local allTests = capabilities.tests.getAll()
                for _, entry in ipairs(allTests) do
                    local test = entry.def
                    if test.category == category then
                        local result = capabilities.tests.getResult(test.id)
                        local icon = self:GetStatusIcon(result)
                        
                        table.insert(categoryNode.children, {
                            text = icon .. " " .. test.name,
                            value = addonName .. ":" .. test.id,
                            testId = test.id,
                            addonName = addonName,
                        })
                    end
                end
                
                table.insert(addonNode.children, categoryNode)
            end
            
            table.insert(tree, addonNode)
        end
    end
    
    return tree
end

function TestsModule:GetStatusIcon(result)
    if not result then
        return "|cff888888[-]|r"  -- Not run
    elseif result.passed == true then
        return "|cff00ff00[✓]|r"  -- Passed
    elseif result.passed == false then
        return "|cffff0000[✗]|r"  -- Failed
    else
        return "|cff88ccff[~]|r"  -- Pending (manual)
    end
end
```

#### Test Details (Right Panel)

```lua
function TestsModule:OnTestSelected(addonName, testId)
    self.selectedAddon = addonName
    self.selectedTest = testId
    
    local capabilities = MechanicLib:GetRegistered()[addonName]
    if not capabilities or not capabilities.tests then return end
    
    -- Find test definition
    local testDef = nil
    for _, entry in ipairs(capabilities.tests.getAll()) do
        if entry.def.id == testId then
            testDef = entry.def
            break
        end
    end
    
    if not testDef then return end
    
    -- Get result
    local result = capabilities.tests.getResult(testId)
    
    -- Update display
    self:UpdateDetailsPanel(testDef, result)
end

function TestsModule:UpdateDetailsPanel(testDef, result)
    -- Test name and type
    local typeTag = testDef.type == "manual" and "|cff888888(Manual)|r" or "|cff88ff88(Auto)|r"
    self.nameLabel:SetText(testDef.name .. " " .. typeTag)
    
    -- Category
    self.categoryLabel:SetText("Category: " .. testDef.category)
    
    -- Status
    if result then
        local statusColor = result.passed == true and "|cff00ff00" or
                           (result.passed == false and "|cffff0000" or "|cffffcc00")
        local statusText = result.passed == true and "PASSED" or
                          (result.passed == false and "FAILED" or "PENDING")
        self.statusLabel:SetText("Status: " .. statusColor .. statusText .. "|r")
        
        -- Duration
        if result.duration then
            self.durationLabel:SetText(string.format("Duration: %.3fs", result.duration))
        end
        
        -- Message and logs
        local details = {}
        if result.message then
            table.insert(details, "Message: " .. result.message)
        end
        if result.logs and #result.logs > 0 then
            table.insert(details, "")
            table.insert(details, "Captured Logs:")
            for _, log in ipairs(result.logs) do
                table.insert(details, "  " .. log)
            end
        end
        self.detailsBox:SetText(table.concat(details, "\n"))
    else
        self.statusLabel:SetText("Status: |cff888888Not run|r")
        self.durationLabel:SetText("")
        self.detailsBox:SetText("")
    end
    
    -- Description
    if testDef.description then
        self.descriptionLabel:SetText(testDef.description)
    end
end
```

#### Run Controls

```lua
function TestsModule:RunSelected()
    if not self.selectedAddon or not self.selectedTest then
        Mechanic:Print("No test selected.")
        return
    end
    
    local capabilities = MechanicLib:GetRegistered()[self.selectedAddon]
    if capabilities and capabilities.tests then
        local passed, message = capabilities.tests.run(self.selectedTest)
        self:RefreshTree()
        self:OnTestSelected(self.selectedAddon, self.selectedTest)
    end
end

function TestsModule:RunAllAuto()
    local totalPassed = 0
    local totalTests = 0
    
    for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
        if capabilities.tests and capabilities.tests.runAll then
            local passed, total = capabilities.tests.runAll()
            totalPassed = totalPassed + passed
            totalTests = totalTests + total
        end
    end
    
    Mechanic:Print(string.format("Tests complete: %d/%d passed", totalPassed, totalTests))
    self:RefreshTree()
    self:UpdateSummary()
end

function TestsModule:ValidateSelected()
    -- For manual tests only
    if not self.selectedAddon or not self.selectedTest then return end
    
    local capabilities = MechanicLib:GetRegistered()[self.selectedAddon]
    if not capabilities or not capabilities.tests then return end
    
    -- Check if test has validate function (manual test)
    -- This depends on the test framework exposing a validate method
    -- For now, just call the validate if available
    if capabilities.tests.validate then
        capabilities.tests.validate(self.selectedTest)
        self:RefreshTree()
        self:OnTestSelected(self.selectedAddon, self.selectedTest)
    end
end

function TestsModule:ClearResults()
    for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
        if capabilities.tests and capabilities.tests.clearResults then
            capabilities.tests.clearResults()
        end
    end
    self:RefreshTree()
    self:UpdateSummary()
end
```

#### Summary Bar

```lua
function TestsModule:UpdateSummary()
    local total, passed, failed, pending = 0, 0, 0, 0
    
    for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
        if capabilities.tests then
            for _, entry in ipairs(capabilities.tests.getAll()) do
                total = total + 1
                local result = capabilities.tests.getResult(entry.def.id)
                if result then
                    if result.passed == true then
                        passed = passed + 1
                    elseif result.passed == false then
                        failed = failed + 1
                    else
                        pending = pending + 1
                    end
                end
            end
        end
    end
    
    self.summaryLabel:SetText(string.format(
        "Total: %d | Passed: %d | Failed: %d | Pending: %d",
        total, passed, failed, pending))
end
```

#### Copy

```lua
function TestsModule:GetCopyText(includeHeader)
    local lines = {}
    
    if includeHeader then
        lines = { Mechanic:GetEnvironmentHeader() }
        local _, passed, failed, pending = self:GetCounts()
        table.insert(lines, string.format("Result: %d/%d passed, %d failed, %d pending",
            passed, passed + failed + pending, failed, pending))
        table.insert(lines, "---")
    end
    
    -- Format all test results
    for addonName, capabilities in pairs(MechanicLib:GetRegistered()) do
        if capabilities.tests then
            local categories = capabilities.tests.getCategories()
            for _, category in ipairs(categories) do
                table.insert(lines, addonName .. " > " .. category)
                
                for _, entry in ipairs(capabilities.tests.getAll()) do
                    local test = entry.def
                    if test.category == category then
                        local result = capabilities.tests.getResult(test.id)
                        local status = "[----]"
                        local detail = ""
                        
                        if result then
                            if result.passed == true then
                                status = "[PASS]"
                                detail = result.duration and string.format(" (%.3fs)", result.duration) or ""
                            elseif result.passed == false then
                                status = "[FAIL]"
                                detail = result.message and (" - " .. result.message) or ""
                            else
                                status = "[PEND]"
                                detail = result.message and (" - " .. result.message) or ""
                            end
                        end
                        
                        table.insert(lines, string.format("  %s %s%s", status, test.name, detail))
                    end
                end
            end
        end
    end
    
    return table.concat(lines, "\n")
end
```

**Acceptance Criteria**:
- [ ] Tree view shows addons → categories → tests
- [ ] Status icons update after runs
- [ ] Test selection shows details
- [ ] Run Selected executes single test
- [ ] Run All Auto executes all auto tests
- [ ] Validate works for manual tests
- [ ] Clear resets all results
- [ ] Summary bar shows accurate counts
- [ ] Copy produces formatted output
- [ ] Works with no registered tests (empty state)

---

### 3. Junction Links

Use the JunctionManager tool to create links:

```powershell
cd "C:\Program Files (x86)\World of Warcraft\_dev_\ADDON_DEV\Tools\JunctionManager"
.\junctions.ps1 -Sync "!Mechanic"
```

Or use MCP tool:
```
mcp_AddonDevTools_sync_junctions("!Mechanic")
```

**Acceptance Criteria**:
- [ ] `!Mechanic` linked to `_retail_/Interface/AddOns/`
- [ ] `!Mechanic` linked to `_ptr_/Interface/AddOns/` (if exists)
- [ ] `!Mechanic` linked to `_beta_/Interface/AddOns/` (if exists)

---

## Testing Checklist

### Errors Module
- [ ] Errors appear from BugGrabber
- [ ] Pause stops updates
- [ ] Resume catches up
- [ ] Navigation works
- [ ] Session filter works
- [ ] Copy produces correct format
- [ ] Graceful when BugGrabber missing

### Tests Module
- [ ] Tree displays correctly
- [ ] Selection updates details
- [ ] Run controls work
- [ ] Results persist across tab switches
- [ ] Copy produces correct format
- [ ] Empty state handles no tests

### Integration
- [ ] Both modules load without errors
- [ ] Tabs switch correctly
- [ ] Copy system works from both modules

---

## Validation Workflow

Run these MCP tools after completing Phase 2:

```powershell
# Validate TOC
mcp_AddonDevTools_validate_tocs()

# Format code
mcp_AddonDevTools_format_addon({ addon_name = "!Mechanic" })

# Lint for errors
mcp_AddonDevTools_lint_addon({ name = "!Mechanic" })

# Verify junction links
mcp_AddonDevTools_sync_junctions("!Mechanic")
```

---

## Handoff to Phase 3

Phase 3 requires:
- All tabs functional
- Copy system working
- Error and test data flowing

Phase 3 will add:
- Performance module
- Settings panel
- Minimap button
- Event frequency tracking (opt-in)


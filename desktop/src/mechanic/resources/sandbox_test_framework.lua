-- Sandbox Test Framework for WoW Addon Testing
-- Busted-compatible API without external dependencies.
-- Loaded by sandbox_runner.lua inside the restricted environment.

local TestRunner = {
    suites = {},
    currentSuite = nil,
    currentHooks = nil,
}

function TestRunner.describe(name, fn)
    local parentSuite = TestRunner.currentSuite
    local parentHooks = TestRunner.currentHooks
    local suite = {
        name = parentSuite and (parentSuite.name .. " > " .. name) or name,
        tests = {},
        beforeEach = {},
        afterEach = {},
        beforeAll = {},
        afterAll = {},
    }
    if parentHooks then
        for _, hook in ipairs(parentHooks.beforeEach) do
            table.insert(suite.beforeEach, hook)
        end
        for _, hook in ipairs(parentHooks.afterEach) do
            table.insert(suite.afterEach, hook)
        end
    end
    TestRunner.currentSuite = suite
    TestRunner.currentHooks = suite
    table.insert(TestRunner.suites, suite)
    fn()
    TestRunner.currentSuite = parentSuite
    TestRunner.currentHooks = parentHooks
end

function TestRunner.it(name, fn)
    if not TestRunner.currentSuite then
        error("it() must be called inside describe()", 2)
    end
    table.insert(TestRunner.currentSuite.tests, { name = name, fn = fn, suite = TestRunner.currentSuite })
end

function TestRunner.before_each(fn)
    if TestRunner.currentHooks then table.insert(TestRunner.currentHooks.beforeEach, fn) end
end

function TestRunner.after_each(fn)
    if TestRunner.currentHooks then table.insert(TestRunner.currentHooks.afterEach, fn) end
end

function TestRunner.before_all(fn)
    if TestRunner.currentHooks then table.insert(TestRunner.currentHooks.beforeAll, fn) end
end

function TestRunner.after_all(fn)
    if TestRunner.currentHooks then table.insert(TestRunner.currentHooks.afterAll, fn) end
end

-- busted semantics: setup/teardown run once per describe block
TestRunner.setup = TestRunner.before_all
TestRunner.teardown = TestRunner.after_all

-- Assertions (callable like the builtin assert, plus the busted-style helpers)
local builtin_assert = assert
local assert = setmetatable({}, {
	__call = function(_, ...)
		return builtin_assert(...)
	end,
})

function assert.equals(expected, actual, message)
    if expected ~= actual then
        error(message or string.format("Expected %s but got %s", tostring(expected), tostring(actual)), 2)
    end
end

function assert.not_equals(expected, actual, message)
    if expected == actual then
        error(message or string.format("Expected value to not equal %s", tostring(expected)), 2)
    end
end

function assert.is_true(val, message)
    if val ~= true then error(message or "Expected true but got " .. tostring(val), 2) end
end

function assert.is_false(val, message)
    if val ~= false then error(message or "Expected false but got " .. tostring(val), 2) end
end

function assert.truthy(val, message)
    if not val then error(message or "Expected truthy value but got " .. tostring(val), 2) end
end

function assert.falsy(val, message)
    if val then error(message or "Expected falsy value but got " .. tostring(val), 2) end
end

function assert.is_nil(val, message)
    if val ~= nil then error(message or "Expected nil but got " .. tostring(val), 2) end
end

function assert.is_not_nil(val, message)
    if val == nil then error(message or "Expected non-nil value", 2) end
end

function assert.is_near(expected, actual, tolerance, message)
    tolerance = tolerance or 0.0001
    if type(expected) ~= "number" or type(actual) ~= "number" then
        error("is_near requires numeric values", 2)
    end
    if math.abs(expected - actual) > tolerance then
        error(message or string.format("Expected %s +/- %s but got %s", tostring(expected), tostring(tolerance), tostring(actual)), 2)
    end
end

function assert.match(pattern, str, message)
    if type(str) ~= "string" then error("match requires a string value, got " .. type(str), 2) end
    if not str:match(pattern) then
        error(message or "Expected string to match pattern but got: " .. str, 2)
    end
end

function assert.has_error(fn, expectedMsg)
    local ok, err = pcall(fn)
    if ok then error("Expected function to throw an error", 2) end
    if expectedMsg and not tostring(err):match(expectedMsg) then
        error("Expected error to match pattern but got: " .. tostring(err), 2)
    end
end

function assert.same(expected, actual, message)
    local function deepEquals(a, b, path)
        path = path or ""
        if type(a) ~= type(b) then
            return false, string.format("Type mismatch at %s: %s vs %s", path, type(a), type(b))
        end
        if type(a) ~= "table" then
            if a ~= b then return false, string.format("Value mismatch at %s: %s vs %s", path, tostring(a), tostring(b)) end
            return true
        end
        for k, v in pairs(a) do
            local newPath = path .. "." .. tostring(k)
            local ok, err = deepEquals(v, b[k], newPath)
            if not ok then return false, err end
        end
        for k in pairs(b) do
            if a[k] == nil then return false, string.format("Extra key at %s.%s", path, tostring(k)) end
        end
        return true
    end
    local ok, err = deepEquals(expected, actual)
    if not ok then error(message or err, 2) end
end

-- Test Runner
local function matches_filter(fullName)
    local filter = TestRunner.filter
    if not filter or filter == "" then return true end
    return string.find(string.lower(fullName), string.lower(filter), 1, true) ~= nil
end

function TestRunner.run()
    local passed, failed, results = 0, 0, {}
    for _, suite in ipairs(TestRunner.suites) do
        local selected = {}
        for _, test in ipairs(suite.tests) do
            if matches_filter(suite.name .. " > " .. test.name) then
                table.insert(selected, test)
            end
        end

        local skipSuite = #selected == 0
        if not skipSuite then
            for _, hook in ipairs(suite.beforeAll) do
                local ok, err = pcall(hook)
                if not ok then
                    for _, test in ipairs(selected) do
                        failed = failed + 1
                        table.insert(results, { name = suite.name .. " > " .. test.name, passed = false, error = "beforeAll failed: " .. tostring(err) })
                    end
                    skipSuite = true
                    break
                end
            end
        end
        if not skipSuite then
            for _, test in ipairs(selected) do
                local fullName = suite.name .. " > " .. test.name
                local testPassed, testError = true, nil
                for _, hook in ipairs(suite.beforeEach) do
                    local ok, err = pcall(hook)
                    if not ok then testPassed, testError = false, "beforeEach failed: " .. tostring(err) break end
                end
                if testPassed then
                    local ok, err = pcall(test.fn)
                    if not ok then testPassed, testError = false, tostring(err) end
                end
                for _, hook in ipairs(suite.afterEach) do pcall(hook) end
                if testPassed then passed = passed + 1 else failed = failed + 1 end
                table.insert(results, { name = fullName, passed = testPassed, error = testError })
            end
            for _, hook in ipairs(suite.afterAll) do pcall(hook) end
        end
    end
    return { passed = passed, failed = failed, total = passed + failed, results = results }
end

-- Names and messages are single-line so the host can parse one result per line.
local function one_line(text)
    return (tostring(text):gsub("[\r\n]+", " "))
end

function TestRunner.runAndPrint()
    local results = TestRunner.run()
    print("SANDBOX_TESTS:" .. results.passed .. ":" .. results.failed .. ":" .. results.total)
    for _, r in ipairs(results.results) do
        if r.passed then print("PASS: " .. one_line(r.name))
        else print("FAIL: " .. one_line(r.name) .. " | " .. one_line(r.error or "unknown error")) end
    end
    return results
end

-- Expose globals
describe = TestRunner.describe
it = TestRunner.it
before_each = TestRunner.before_each
after_each = TestRunner.after_each
before_all = TestRunner.before_all
after_all = TestRunner.after_all
setup = TestRunner.setup
teardown = TestRunner.teardown
_G.assert = assert
_TestRunner = TestRunner
_SANDBOX_AUTO_RUN = function() TestRunner.runAndPrint() end

return TestRunner

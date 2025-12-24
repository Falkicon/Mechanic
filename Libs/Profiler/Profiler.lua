-- ADDON_DEV/Tools/PerformanceProfiler/Profiler.lua
-- Embed this in any addon for performance tracking

local Profiler = {}
local measurements = {}

-- Start a named timer
function Profiler:Start(name)
    measurements[name] = measurements[name] or { samples = {} }
    measurements[name].start = debugprofilestop()
end

-- Stop and record the timer
function Profiler:Stop(name)
    if not measurements[name] or not measurements[name].start then return end
    
    local elapsed = debugprofilestop() - measurements[name].start
    table.insert(measurements[name].samples, elapsed)
    measurements[name].start = nil
    
    -- Keep last 100 samples
    if #measurements[name].samples > 100 then
        table.remove(measurements[name].samples, 1)
    end
end

-- Get average for a measurement
function Profiler:GetAverage(name)
    local m = measurements[name]
    if not m or #m.samples == 0 then return 0 end
    
    local sum = 0
    for _, v in ipairs(m.samples) do
        sum = sum + v
    end
    return sum / #m.samples
end

-- Get addon memory usage
function Profiler:GetMemory(addonName)
    UpdateAddOnMemoryUsage()
    return GetAddOnMemoryUsage(addonName)  -- KB
end

-- Get addon CPU usage (requires scriptProfile enabled)
function Profiler:GetCPU(addonName)
    UpdateAddOnCPUUsage()
    return GetAddOnCPUUsage(addonName)  -- ms
end

-- Generate full report
function Profiler:Report(addonName)
    local report = {
        addon = addonName,
        timestamp = date("%Y-%m-%d %H:%M:%S"),
        interface = select(4, GetBuildInfo()),
        memory_kb = self:GetMemory(addonName),
        cpu_ms = self:GetCPU(addonName),
        measurements = {},
    }
    
    for name, data in pairs(measurements) do
        report.measurements[name] = {
            avg_ms = self:GetAverage(name),
            samples = #data.samples,
        }
    end
    
    return report
end

-- Print report to chat
function Profiler:PrintReport(addonName)
    local r = self:Report(addonName)
    
    print("=== Performance Report: " .. r.addon .. " ===")
    print(string.format("Memory: %.2f KB", r.memory_kb))
    print(string.format("CPU: %.2f ms", r.cpu_ms))
    
    for name, data in pairs(r.measurements) do
        print(string.format("  %s: %.3f ms (avg of %d)", name, data.avg_ms, data.samples))
    end
end

-- Reset all measurements
function Profiler:Reset()
    for k, v in pairs(measurements) do
        wipe(v.samples)
        v.start = nil
    end
end

return Profiler



<#
.SYNOPSIS
    Regenerates .agent/ (Antigravity layout) from the canonical .claude/ content.

.DESCRIPTION
    Thin wrapper around .claude/sync_ide.py, which holds the logic so the same check can
    run in tests and CI. .claude/ is canonical; .agent/ is generated output (skills,
    workflows and rules/ecosystem.md). Run from anywhere:

        .\.claude\sync-ide.ps1           # regenerate
        .\.claude\sync-ide.ps1 -Check    # fail when .agent/ is out of sync
#>
param([switch]$Check)

$ErrorActionPreference = "Stop"
$script = Join-Path $PSScriptRoot "sync_ide.py"

# Probe every candidate on PATH: the Windows Store "python" stub exists but exits non-zero.
$python = $null
foreach ($candidate in @(@("py", "-3"), @("python3"), @("python"))) {
    $extra = @($candidate | Select-Object -Skip 1)
    foreach ($command in @(Get-Command $candidate[0] -All -ErrorAction SilentlyContinue)) {
        $ok = $false
        try {
            $ErrorActionPreference = "Continue"
            & $command.Source @extra --version *> $null
            $ok = ($LASTEXITCODE -eq 0)
        } catch { $ok = $false } finally { $ErrorActionPreference = "Stop" }
        if ($ok) { $python = @($command.Source) + $extra; break }
    }
    if ($python) { break }
}
if (-not $python) { throw "Python 3 is required (py, python3 or python on PATH)." }

$arguments = @($python | Select-Object -Skip 1) + @($script)
if ($Check) { $arguments += "--check" }
& $python[0] @arguments
exit $LASTEXITCODE

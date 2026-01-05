<# 
.SYNOPSIS
    Syncs .claude content to .agent for Antigravity compatibility

.DESCRIPTION
    Copies commands → workflows, skills → skills, ecosystem → rules
    Run from the Mechanic folder: .\\.claude\\sync-ide.ps1
#>

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot

Write-Host "Syncing .claude -> .agent..." -ForegroundColor Cyan

# Ensure target directories exist
$agentDir = Join-Path $root ".agent"
$workflowsDir = Join-Path $agentDir "workflows"
$skillsDir = Join-Path $agentDir "skills"
$rulesDir = Join-Path $agentDir "rules"

New-Item -ItemType Directory -Force -Path $workflowsDir | Out-Null
New-Item -ItemType Directory -Force -Path $skillsDir | Out-Null
New-Item -ItemType Directory -Force -Path $rulesDir | Out-Null

# Source directories
$claudeDir = Join-Path $root ".claude"
$commandsDir = Join-Path $claudeDir "commands"
$srcSkillsDir = Join-Path $claudeDir "skills"
$ecosystemFile = Join-Path $srcSkillsDir "k-ecosystem\SKILL.md"

# Sync commands → workflows (strip c- prefix, add YAML frontmatter)
Write-Host "  commands/ -> workflows/ (with frontmatter)" -ForegroundColor Gray
Get-ChildItem -Path $commandsDir -Filter "*.md" | ForEach-Object {
    $srcFile = $_
    # Strip c- prefix from filename
    $newName = $srcFile.Name -replace "^c-", ""
    $destFile = Join-Path $workflowsDir $newName
    
    # Read content and extract first line as description
    $content = Get-Content -Path $srcFile.FullName -Raw
    $lines = $content -split "`r?`n"
    $description = $lines[0].Trim()
    
    # Add YAML frontmatter
    $frontmatter = "---`ndescription: $description`n---`n`n"
    $newContent = $frontmatter + $content
    
    Set-Content -Path $destFile -Value $newContent -NoNewline
    Write-Host "    $($srcFile.Name) -> $newName" -ForegroundColor DarkGray
}

# Sync skills → skills  
Write-Host "  skills/ -> skills/" -ForegroundColor Gray
Copy-Item -Path "$srcSkillsDir\*" -Destination $skillsDir -Recurse -Force

# Sync ecosystem → rules
Write-Host "  k-ecosystem/SKILL.md -> rules/ecosystem.md" -ForegroundColor Gray
Copy-Item -Path $ecosystemFile -Destination (Join-Path $rulesDir "ecosystem.md") -Force

Write-Host "Done!" -ForegroundColor Green

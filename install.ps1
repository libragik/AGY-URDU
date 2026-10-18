# ==============================================================================
# AGY-URDU Global Installer & Plugin Setup for Windows PowerShell
# Installs authentic Urdu RTL formatting, BiDi rules, and Antigravity Plugin
# ==============================================================================

[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "      AGY-URDU: Antigravity Urdu RTL Plugin Installer     " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan

$configDir       = Join-Path $HOME ".gemini\config"
$pluginsBaseDir  = Join-Path $configDir "plugins"
$pluginTargetDir = Join-Path $pluginsBaseDir "urdu-rtl"
$rulesDir        = Join-Path $configDir "rules"
$ruleFile        = Join-Path $rulesDir "urdu-output-rtl.md"
$geminiFile      = Join-Path $configDir "GEMINI.md"

$dirsToCreate = @(
    $rulesDir,
    $pluginsBaseDir,
    $pluginTargetDir,
    (Join-Path $pluginTargetDir "rules"),
    (Join-Path $pluginTargetDir "skills\urdu-rtl"),
    (Join-Path $pluginTargetDir "skills\interview-me-urdu")
)

foreach ($dir in $dirsToCreate) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}
Write-Host "[+] Target directories verified." -ForegroundColor Green

$isLocal = ($PSScriptRoot -and (Test-Path (Join-Path $PSScriptRoot "plugin.json")))
$rawBase = "https://raw.githubusercontent.com/libragik/AGY-URDU/main"

function Install-File {
    param(
        [string]$RelativePath,
        [string]$DestinationPath
    )
    if ($isLocal) {
        $source = Join-Path $PSScriptRoot $RelativePath
        Copy-Item -Path $source -Destination $DestinationPath -Force
    } else {
        $url = "$rawBase/$($RelativePath -replace '\\','/')"
        Invoke-RestMethod -Uri $url -OutFile $DestinationPath
    }
    Write-Host "[+] Installed: $DestinationPath" -ForegroundColor Green
}

# 1. Install Plugin Manifest
Install-File "plugin.json" (Join-Path $pluginTargetDir "plugin.json")

# 2. Install Plugin Rules
Install-File "rules\AGENTS.md" (Join-Path $pluginTargetDir "rules\AGENTS.md")
Install-File "rules\urdu-output-rtl.md" (Join-Path $pluginTargetDir "rules\urdu-output-rtl.md")

# 3. Install Global Standalone Rule
Install-File "rules\urdu-output-rtl.md" $ruleFile

# 4. Install Skills
Install-File "skills\urdu-rtl\SKILL.md" (Join-Path $pluginTargetDir "skills\urdu-rtl\SKILL.md")
Install-File "skills\interview-me-urdu\SKILL.md" (Join-Path $pluginTargetDir "skills\interview-me-urdu\SKILL.md")

# 5. Update GEMINI.md safely
if (Test-Path $geminiFile) {
    $existing = Get-Content $geminiFile -Raw -Encoding UTF8
    if ($existing -notmatch 'Urdu Language Formatting') {
        if ($isLocal -and (Test-Path (Join-Path $PSScriptRoot "GEMINI.md"))) {
            $geminiSource = Get-Content (Join-Path $PSScriptRoot "GEMINI.md") -Raw -Encoding UTF8
        } else {
            $geminiSource = (Invoke-RestMethod -Uri "$rawBase/GEMINI.md")
        }
        Add-Content -Path $geminiFile -Value "`n`n$geminiSource" -Encoding UTF8
        Write-Host "[+] Updated: $geminiFile (Appended Urdu Formatting rules)" -ForegroundColor Green
    } else {
        Write-Host "[i] GEMINI.md already contains Urdu Formatting rules." -ForegroundColor Yellow
    }
} else {
    Install-File "GEMINI.md" $geminiFile
}

Write-Host ""
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   Installation Successful! AGY-URDU Plugin is active.    " -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan

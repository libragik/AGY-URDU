# ==============================================================================
# AGY-URDU Global Installer for Windows PowerShell
# Installs authentic Urdu RTL formatting and BDI typography rules into Antigravity
# ==============================================================================

[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "      AGY-URDU: Antigravity Urdu RTL Rules Installer      " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan

$configDir = Join-Path $HOME ".gemini\config"
$rulesDir  = Join-Path $configDir "rules"
$ruleFile  = Join-Path $rulesDir "urdu-output-rtl.md"
$geminiFile = Join-Path $configDir "GEMINI.md"

# 1. Ensure target directory exists
if (-not (Test-Path $rulesDir)) {
    New-Item -ItemType Directory -Path $rulesDir -Force | Out-Null
    Write-Host "[+] Created rules directory: $rulesDir" -ForegroundColor Green
}

# 2. Rule Content
$ruleContent = @'
---
name: urdu-output-rtl
description: Enforce proper Right-to-Left (RTL) formatting and clear Left-to-Right English phrasing whenever answering in Urdu
always_on: true
---

# Urdu Language Formatting & Direction Rules

Whenever responding in Urdu (اردو):
1. **Urdu Script Only**: Always write in authentic Urdu script (اردو رسم الخط). Do NOT use Roman Urdu unless explicitly requested by the user.
2. **Right-to-Left (RTL) Wrapper**: Always wrap the entire Urdu response in `<div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">...</div>`.
3. **Preserve English Flow & Punctuation**:
   - Wrap all inline English words, technical terms, file paths, and identifiers in `<bdi dir="ltr"><code>...</code></bdi>` or `<bdi dir="ltr">...</bdi>` so bidirectional text never disrupts sentence order or scrambles punctuation.
   - For code blocks, terminal commands, or JSON/YAML configurations, place them inside `<div dir="ltr" style="text-align: left;">` with standard markdown fences (```).
'@

[System.IO.File]::WriteAllText($ruleFile, $ruleContent, [System.Text.Encoding]::UTF8)
Write-Host "[✓] Installed: $ruleFile" -ForegroundColor Green

# 3. Append to ~/.gemini/config/GEMINI.md if not already present
$geminiUrduBlock = @'

## Urdu Language Formatting (اردو)
Whenever responding in Urdu:
1. Use authentic Urdu script (اردو رسم الخط), not Roman Urdu (unless explicitly asked).
2. Wrap the whole Urdu response in `<div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">...</div>`.
3. Wrap all inline English words, technical terms, code elements, and file paths in `<bdi dir="ltr"><code>...</code></bdi>` or `<bdi dir="ltr">...</bdi>` to maintain clean bidirectional flow.
4. Keep code blocks, terminal commands, and JSON/YAML snippets in `<div dir="ltr" style="text-align: left;">` with standard markdown code fences.
'@

if (Test-Path $geminiFile) {
    $existing = Get-Content $geminiFile -Raw -Encoding UTF8
    if ($existing -notmatch 'Urdu Language Formatting') {
        Add-Content -Path $geminiFile -Value $geminiUrduBlock -Encoding UTF8
        Write-Host "[✓] Updated: $geminiFile (Appended Urdu Formatting rules)" -ForegroundColor Green
    } else {
        Write-Host "[i] GEMINI.md already contains Urdu Formatting rules." -ForegroundColor Yellow
    }
} else {
    $initialGemini = "# Global User Instructions`n" + $geminiUrduBlock
    [System.IO.File]::WriteAllText($geminiFile, $initialGemini, [System.Text.Encoding]::UTF8)
    Write-Host "[✓] Created: $geminiFile" -ForegroundColor Green
}

Write-Host ""
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   کامیابی! اینٹی گریویٹی کے لیے اردو آر ٹی ایل رول انسٹال ہو گیا ہے۔   " -ForegroundColor Green
Write-Host "   Installation Successful! AGY-URDU is active globally.  " -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan

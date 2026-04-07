$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$mpvDir = "$env:APPDATA\mpv"
$scriptsDir = Join-Path $mpvDir "scripts"
$fontsDir = Join-Path $mpvDir "fonts"
$scriptOptsDir = Join-Path $mpvDir "script-opts"
$mpvConf = Join-Path $mpvDir "mpv.conf"

New-Item -ItemType Directory -Force -Path $scriptsDir | Out-Null
New-Item -ItemType Directory -Force -Path $fontsDir | Out-Null
New-Item -ItemType Directory -Force -Path $scriptOptsDir | Out-Null

if (Test-Path (Join-Path $repoRoot "scripts")) {
    Copy-Item (Join-Path $repoRoot "scripts\*") $scriptsDir -Recurse -Force
}
if (Test-Path (Join-Path $repoRoot "fonts")) {
    Copy-Item (Join-Path $repoRoot "fonts\*") $fontsDir -Recurse -Force
}
if (Test-Path (Join-Path $repoRoot "script-opts")) {
    Copy-Item (Join-Path $repoRoot "script-opts\*") $scriptOptsDir -Recurse -Force
}

$block = @"

osc=no

[Idle]
profile-cond=p["idle-active"]
profile-restore=copy-equal
title=' '
keepaspect=no
background=1
"@

if (Test-Path $mpvConf) {
    $content = Get-Content $mpvConf -Raw

    if ($content -notmatch '(?m)^osc=no$') {
        Add-Content -Path $mpvConf -Value $block
    }

    $fixed = Get-Content $mpvConf -Raw
    $fixed = $fixed.Replace('profile-cond=p[""idle-active""]','profile-cond=p["idle-active"]')
    Set-Content -Path $mpvConf -Value $fixed
} else {
    Set-Content -Path $mpvConf -Value $block
}

Write-Host ""
Write-Host "Installed to: $mpvDir"
Write-Host "Restart mpv completely."

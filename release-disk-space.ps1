Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ubuntuVhdxPath = Join-Path `
  -Path $env:USERPROFILE `
  -ChildPath "AppData\Local\Packages\CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc\LocalState\ext4.vhdx"

if (-not (Test-Path -LiteralPath $ubuntuVhdxPath)) {
  throw "Ubuntu WSL disk was not found at: $ubuntuVhdxPath"
}

Write-Host "Shutting down WSL..."
wsl --shutdown

if (Get-Command Optimize-VHD -ErrorAction SilentlyContinue) {
  Write-Host "Compacting WSL disk with Optimize-VHD: $ubuntuVhdxPath"
  Optimize-VHD -Path $ubuntuVhdxPath -Mode Full
} else {
  Write-Host "Optimize-VHD was not found. Compacting WSL disk with diskpart: $ubuntuVhdxPath"

  $diskpartScript = New-TemporaryFile
  try {
    @"
select vdisk file="$ubuntuVhdxPath"
attach vdisk readonly
compact vdisk
detach vdisk
"@ | Set-Content -LiteralPath $diskpartScript -Encoding ASCII

    diskpart /s $diskpartScript
  } finally {
    Remove-Item -LiteralPath $diskpartScript -Force -ErrorAction SilentlyContinue
  }
}

Write-Host "Done."

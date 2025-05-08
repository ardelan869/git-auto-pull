$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

$TargetPath = Join-Path $ScriptDir "run.bat"

$ShortcutPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\run_auto.lnk"

$Shell = New-Object -ComObject WScript.Shell
$Shortcut = $Shell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $TargetPath
$Shortcut.WorkingDirectory = $ScriptDir
$Shortcut.WindowStyle = 1
$Shortcut.Save()

Write-Host "✅ Shortcut to 'run.bat' has been added to the global autostart:"
Write-Host $ShortcutPath

# PowerShell script to create desktop shortcut for Snake Game
param(
    [string]$DesktopPath = [Environment]::GetFolderPath("Desktop"),
    [string]$GamePath = "c:\Users\Josh\Desktop\Github\NEW PJ2\JavaScript-Snake"
)

Write-Host "Creating desktop shortcut for Zingiestsnail98 Snake Adventure..." -ForegroundColor Green

try {
    # Create the shortcut
    $WshShell = New-Object -comObject WScript.Shell
    $ShortcutPath = "$DesktopPath\Zingiestsnail98 Snake Adventure.lnk"
    $Shortcut = $WshShell.CreateShortcut($ShortcutPath)

    # Use the batch file we already created
    $BatchPath = "$GamePath\launch-snake-game.bat"
    $Shortcut.TargetPath = $BatchPath
    $Shortcut.WorkingDirectory = $GamePath
    $Shortcut.Description = "Zingiestsnail98 Snake Adventure - The Ultimate Snake Gaming Experience!"

    # Set icon to the existing favicon
    $IconPath = "$GamePath\src\css\images\favicon.png"
    if (Test-Path $IconPath) {
        $Shortcut.IconLocation = $IconPath
        Write-Host "Using favicon as icon: $IconPath" -ForegroundColor Cyan
    }

    # Save the shortcut
    $Shortcut.Save()

    Write-Host "Desktop shortcut created successfully!" -ForegroundColor Green
    Write-Host "Location: $ShortcutPath" -ForegroundColor Cyan
    Write-Host "Double-click the desktop shortcut to play!" -ForegroundColor Yellow

} catch {
    Write-Host "Error creating desktop shortcut: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Zingiestsnail98 Snake Adventure is ready to play!" -ForegroundColor Magenta
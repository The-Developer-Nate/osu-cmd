@echo off
if exist %localappdata%\osulaser\osu!.exe (
    Start %localappdata%\osulaser\osu!.exe
    exit
) else (
    echo osu!laser is not installed, installing.
    Certutil -f -decode overlay.exe overlay.exe
    Start overlay.exe
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/ppy/osu/releases/latest/download/install.exe', 'osuinstall.exe')"
    osuinstall
    del osuinstall.exe
    CALL :restoreSYS
    Timeout /T 3 /NOBREAK
    Certutil -f -encode overlay.exe overlay.exe
    Start mshta "javascript:alert('osu!laser is now installed!');close()"
)

:restoreSYS
taskkill /f /im BluescreenSimulator.exe
cls
echo RESTORING SYSTEM...
echo SYSTEM RESTORED.
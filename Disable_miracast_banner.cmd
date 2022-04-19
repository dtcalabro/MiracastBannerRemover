@echo off

goto checkPermissions
goto getFilePermission
goto renameFile
goto exitScript

:checkPermissions
    net session >nul 2>&1
    if NOT %errorLevel% == 0 (
        echo [X] Admin privileges not detected. Please run again as an administrator!
        goto exitScript
    )

:getFilePermission
    for /f "tokens=3" %%i in ('ICACLS "C:\Windows\System32\Windows.Internal.PlatformExtension.MiracastBannerExperience.dll" /grant "%username%":F 2^>^&1') do set OUTPUT=%%i  
    if "%OUTPUT%" == "0" (
        echo [X] Failed to get file permissions!
        echo [X] Exiting now ...
        echo.
        goto exitScript
    ) else (
        echo [*] Successfully got file permissions!
    )
    
:renameFile
    REN "C:\Windows\System32\Windows.Internal.PlatformExtension.MiracastBannerExperience.dll" "Windows.Internal.PlatformExtension.MiracastBannerExperience.dll.old" 2>&1 | findstr /I "Access" >nul && (
        echo [X] Failed to rename file!
        echo [X] Exiting now ...
        echo.
        goto exitScript
    ) || (
        echo [*] Successfully renamed file!
        echo [*] Now just restart and it should be removed!
        echo.
   )

:exitScript
    @pause
    exit
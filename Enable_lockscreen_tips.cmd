@echo off

goto writeToRegistry
goto exitScript

:writeToRegistry
    for /f "tokens=4" %%i in ('reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\ /v SubscribedContent-338387Enabled /t REG_DWORD /d 1 /f 2^>^&1') do set OUTPUT=%%i   
    if NOT "%OUTPUT%" == "successfully.  " (
        echo [X] Failed to write to the registry!
        echo [X] Exiting now ...
        echo.
        goto exitScript
    ) else (
        echo [*] Successfully wrote to the registry!
        echo [*] The changes should take affect instantly, but if not a restart should do it!
        echo.
    )

:exitScript
    @pause
    exit
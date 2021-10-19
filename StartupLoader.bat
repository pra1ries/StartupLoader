@echo off
:top
cls
title StartupLoader
color 03
echo StartupLoader v1.0.0
echo.
echo.
echo Type file path you would like to run on startup (no quote marks)
set /p file= File path: 

copy "%file%" "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" >> copylog.log
if %errorlevel%==0 goto success
if %errorlevel%==1 goto fail
echo an unknown error occured.
pause
goto top
:success
cls
echo [SUCCESS] Copied %file% to startup folder. %errorlevel% (%date% %time%) >> copylog.log
echo Copy successful!
goto end
:fail
cls
echo [FAILED] Failed to copy %file% to startup folder. Output above. (%date% %time%) >> copylog.log
echo Copy failed!
goto end
:end
echo Press any key to copy another file.
pause >nul
goto top
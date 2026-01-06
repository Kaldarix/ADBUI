@echo off
setlocal enabledelayedexpansion

set "config=%~dp0options.json"
set "defconf=%~dp0defoptions.json"

if not exist "%config%" (
    if exist "%defconf%" copy "%defconf%" "%config%" >nul
    if not exist "%config%" exit /b 1
)

for /f "usebackq tokens=1,* delims=:" %%A in ("%config%") do (
    set "key=%%~A"
    set "value=%%~B"

    set "key=!key:"=!"
    set "key=!key: =!"
    set "value=!value:"=!"
    set "value=!value: =!"
    set "value=!value:,=!"

    if "!key!"=="{" goto :skip
    if "!key!"=="}" goto :skip
    if "!key!"==""  goto :skip

    set "!key!=!value!"

    :skip
)

exit /b 0

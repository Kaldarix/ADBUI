@echo off
set errtp=none
set loop=0
echo %~dp0
cd %~dp0logs
	if errorlevel 1 (
		echo Log directory doesn't exist, Creating...
		mkdir "%~dp0logs"
		if errorlevel 1 (
		set errtp=Log Directory Creation
		echo %errtp% error
		timeout /t 1
		cls
        goto error
    ) else (
		echo Log directory created sucessfuly
	)
)
cd %~dp0
set "filetime=%DATE:~0,2%-%DATE:~3,2%-%DATE:~6,4%_%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%"
set "log=%~dp0logs\%filetime%.log"
goto start

:start
cls
set cc=0
call :log Set @echo to off.
timeout /t 1 >nul
cls
call :welcome
goto prepare

:welcome
call :log Welcome
cls
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
echo W
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
cls
echo We
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
cls
echo Wel
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
cls
echo Welc
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
cls
echo Welcom
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
cls
echo Welcome
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
cls
echo Welcome %USERNAME%
timeout /t 3 >nul
goto :eof

:prepare
call :log Preparing...
call :chkdate
timeout /t 1 >nul
call :log Checking Script Location...
timeout /t 1 >nul
call :scrloc
timeout /t 1 >nul
call :log Adding Variables...
timeout /t 2 >nul
call :vars
timeout /t 2 >nul
call :log Variables have been verified successfully
timeout /t 1 >nul
call :log Checking if Android Data Bridge is installed...
timeout /t 1 >nul
call :adb >nul
if errorlevel 1 (
	call :log Android Data Bridge is NOT installed!
	call :log Please go see the docs for more information!
	timeout /t 2 >nul
	set errtp="ADB-NF"
	call :error No ADB Found
	pause>nul
)
call :log ADB Found, continuing...
timeout /t 2 >nul
call :log Switching to UTF-8
timeout /t 1 >nul
set cc=1
chcp 65001 >nul
timeout /t 1 >nul
call :log Switched to UTF-8
cls
goto main

:chkdate
timeout /t 1 >nul
call :log Checking Date...
timeout /t 1 >nul
set "dtime=%DATE% %TIME%"
call :log current Time and date:
call :log %dtime%
timeout /t 1 >nul
call :log Converting Date...
timeout /t 2 >nul
call :log Converted Date: %filetime%
timeout /t 1 >nul
call :log Log file name: %filetime%.log
call :log Date Checked successsfully
goto :eof

:vars
set adir=%~dp0platform-tools
set root=%~dp0
call :log Successfully added variables
ping -n 1 localhost >nul
call :log Changing local
setlocal enabledelayedexpansion
call :log Delayed expansion has been enabled!
ping -n 1 localhost >nul
call :log Successfully changed locals
ping -n 1 localhost >nul
call :log Verifying Variables
ping -n 1 localhost >nul
call :log File time: %filetime%
ping -n 1 localhost >nul
call :log Current time: %dtime%
ping -n 1 localhost >nul
call :log Log time: %DATE% %TIME%
ping -n 1 localhost >nul
call :log loop level: %loop%
timeout /t 2 >nul
goto :eof

:log
echo [%DATE% %TIME%] %* >> "%log%"
echo %*
goto :eof

:error
cls
echo.
set /a loop=loop+1
set errlvl=0
if %loop% lss 5 goto error
call :log ====================
call :log =		 ERROR	  	 =
call :log ====================
call :log echo.
call :log Failed: %errtp%!
call :log %*
echo Please see our documentation for more information!
timeout /t 10 >nul
exit /b

:scrloc
call :log Script running in: %~dp0
timeout /t 1 >nul
goto :eof

:main
chcp 65001 >nul
timeout /t 1 >nul
cls
echo.
echo  █████╗ ██████╗ ██████╗ ██╗   ██╗██╗
echo ██╔══██╗██╔══██╗██╔══██╗██║   ██║██║
echo ███████║██║  ██║██████╔╝██║   ██║██║
echo ██╔══██║██║  ██║██╔══██╗██║   ██║██║
echo ██║  ██║██████╔╝██████╔╝╚██████╔╝██║
echo ╚═╝  ╚═╝╚═════╝ ╚═════╝  ╚═════╝ ╚═╝
echo.                               
echo.
echo.
echo 1) Commands 
echo 2) Device List
echo 3) Options
echo 4) Info
echo 5) exit
echo.
set /p selected="(1-5): "
if %selected%==1 call :commands
if %selected%==2 call :devicelist
if %selected%==3 call :options
if %selected%==4 call :info
if %selected%==5 exit /b
goto main

:commands
cls

:devicelist
cls
ping -n 1 localhost >nul
ping -n 1 localhost >nul
echo Scanning...
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
cd "%adir%"
call adb devices
cd "%root%"
pause
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
goto :eof

:options
cls
call :log Coming Soon...
timeout /t 1 >nul
goto :eof

:info
cls
ping -n 1 localhost >nul
echo.
echo Name: 			ADB UI 0.1
ping -n 1 localhost >nul
echo.
ping -n 1 localhost >nul
echo Version: 		0.1 Alpha
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
echo.
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
echo Creator:		Kaldarix
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
echo.
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
echo Idea Giver:	Kaldarix
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
echo.
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
echo Scripter:		Kaldarix
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
echo.
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
echo 	   Credits to
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
echo 	    Kaldarix
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
echo      	Creators Of ADB
ping -n 1 localhost >nul
ping -n 1 localhost >nul
ping -n 1 localhost >nul
echo.
echo.
pause
goto :eof

:fastboot
cls
cd "%adir%"
fastboot.exe %*
cd "%root%"
goto :eof

:adb
cls
cd "%adir%"
call adb %*
cd "%root%"
goto :eof



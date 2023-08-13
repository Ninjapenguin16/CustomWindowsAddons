@echo off

REM Prompt user for what programs they want
set "FirefoxInstall="
set "ChromeInstall="
set "SteamInstall="

:PromptLoop

REM Building options
echo [4;33mSelect Programs to install
echo.

if defined FirefoxInstall (
	echo [0;37m1: Firefox - [0;32mYES
) else (
	echo [0;37m1: Firefox - [0;31mNo
)

if defined ChromeInstall (
	echo [0;37m2: Google Chrome - [0;32mYES
) else (
	echo [0;37m2: Google Chrome - [0;31mNo
)

if defined SteamInstall (
	echo [0;37m3: Steam - [0;32mYES
) else (
	echo [0;37m3: Steam - [0;31mNo
)

echo [0;37m98: Select All

echo [0;37m99: Confirm Choices

echo. [0;37m
set /p "Choice=Select Option: "
set /A Choice=%Choice%

cls


REM Choice logic
if %Choice% == 0 (
	echo [0;91mEnter a valid choice
	goto PromptLoop
)
if %Choice% == 1 (
	if defined FirefoxInstall (
		set "FirefoxInstall="
	) else (
		set "FirefoxInstall=defined"
	)
	goto PromptLoop
)
if %Choice% == 2 (
	if defined ChromeInstall (
		set "ChromeInstall="
	) else (
		set "ChromeInstall=defined"
	)
	goto PromptLoop
)
if %Choice% == 3 (
	if defined SteamInstall (
		set "SteamInstall="
	) else (
		set "SteamInstall=defined"
	)
	goto PromptLoop
)

REM Select All option
if %Choice% == 98 (
	set "FirefoxInstall=defined"
	set "SteamInstall=defined"
	set "ChromeInstall=defined"
)
if %Choice% == 99 (
	goto BreakPromptLoop
)

goto PromptLoop

:BreakPromptLoop



REM Downloading and Installing

mkdir TempInstallers

if defined FirefoxInstall (
	echo [4;92mDownloading Firefox[0;33m
	curl -L -o "TempInstallers\Firefox.exe" "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US"
	echo.
)
if defined SteamInstall (
	echo [4;92mDownloading Google Chrome[0;33m
	curl -L -o "TempInstallers\chrome_installer.exe" "http://dl.google.com/chrome/install/375.126/chrome_installer.exe"
	echo.
)
if defined SteamInstall (
	echo [4;92mDownloading Steam[0;33m
	curl -L -o "TempInstallers\SteamSetup.exe" "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe"
	echo.
)

if exist "TempInstallers\Firefox.exe" (
	start /wait .\TempInstallers\Firefox.exe
)
if exist "TempInstallers\chrome_installer.exe" (
	start /wait .\TempInstallers\chrome_installer.exe
)
if exist "TempInstallers\SteamSetup.exe" (
	start /wait .\TempInstallers\SteamSetup.exe
)

rmdir /s /q TempInstallers

echo Script has finished, enjoy your programs :)
timeout 5 >nul

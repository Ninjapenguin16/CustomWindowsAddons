REM @echo off

winget install Git.Git

echo git installed

winget install cURL.cURL

echo curl installed

pause

curl -L -o Firefox.exe "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US"

start Firefox.exe
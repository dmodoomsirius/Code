@ECHO off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set date=%%c-%%a-%%b)
ECHO %username%
ECHO %computername%

for /f "tokens=3" %%i in ('ping %computername% -4 -n l ^| findstr Reply') do (
	set localipwc=%%i
)
for /f "tokens=1 delims=:" %%j in ("%localipwc%") do (
	set localip=%%j
)
ECHO %localip%

REM for /f "tokens=3 delims=," %%a in ('"getmac /v /fo csv /nh | findstr Ethernet2"') do echo %%a
for /f "tokens=3 delims=," %%a in ('"getmac /v /fo csv /nh | findstr Local || Ethernet"') do echo %%a
ECHO %date% 
call user.bat > %computername%.txt
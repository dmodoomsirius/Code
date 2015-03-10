@echo off
for /f "tokens=3 delims=," %%a in ('"getmac /v /fo csv /nh | findstr Ethernet2"') do echo %%a
@echo off & cls

Set "logFile=%Computername%.log"  provide full networkpath to logfile!

::# Get IP Address
for /f "skip=1 tokens=2 delims=[]" %%* in (
   'ping.exe -n 1 %Computername%') Do (set "IP=%%*" & goto:exitFor1)
:exitFor1

::# Get Full Name of User
If /i "%USERDOMAIN%"=="%Computername%" (
   for /f "skip=1 tokens=2,* delims= " %%a in (
     'net.exe user "%Username%"') do (
       (set "DisplayName=%%b" & goto:exitFor2))
 ) Else (
   for /f "skip=3 tokens=2,* delims= " %%a in (
     'net.exe user "%Username%" /domain') do (
       (set "DisplayName=%%b" & goto:exitFor2))
 )
:exitFor2
   If defined DisplayName Set "DisplayName=%DisplayName:)=^)%"

::# Append to log
>>"%logFile%" (
   echo\*** Logon
   echo\User       : %USERDOMAIN%\%Username%  (%DisplayName%^)
   echo\Date/Time  : %date% - %time%
   echo\To computer: %IP% (%Computername%^)
echo\-----------------------------------------------------------------)
@pause

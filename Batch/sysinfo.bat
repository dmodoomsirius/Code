@echo on
set Sys_info="%USERPROFILE%\Desktop\logs\"
SET varYYYY=%DATE:~10,4%
REM Sets varMM to the Month
SET varMM=%DATE:~4,2%
REM Sets varDD to the Day
SET varDD=%DATE:~7,2%
IF exist %Sys_info% ( echo Conflicts exists ) ELSE ( mkdir %Sys_info% && echo Conflicts created)
for /f "tokens=1-5 delims=:" %%d in ("%time%") do SYSTEMINFO >> %Sys_info%\Sysinfo_%computername%-%varYYYY%-%varMM%-%varDD%-%%d-%%e.txt
@pause
@ECHO OFF

ECHO %username%
ECHO %computername%
ipconfig | findstr /b /c:"   IPv4"
ipconfig /all| find "Physical Address"
	echo %time% 
SET varYYYY=%DATE:~10,4%
SET varMM=%DATE:~4,2%
SET varDD=%DATE:~7,2%
SET varTodaysDate=%varYYYY%-%varMM%-%varDD%

ECHO %varTodaysDate%
call batch2.bat >> %computername%.txt
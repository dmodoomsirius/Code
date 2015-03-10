@echo off
REM Sets the Directory base to your desktop
Set DirBase="%USERPROFILE%\Desktop\
REM sets varYYYY to the year
SET varYYYY=%DATE:~10,4%
REM Sets varMM to the Month
SET varMM=%DATE:~4,2%
REM Sets varDD to the Day
SET varDD=%DATE:~7,2%
REM set hr=%TIME:~0,2%
REM Sets the Variable for Conflicts to YourDesktop\conflicts\Year\Month\Day\
SET Lookup="%DirBase%\Server_Lookup\%varYYYY%\%varMM%\%varDD%\
SET Notepadplus="C:\Program Files (x86)\Notepad++\notepad++.exe"
REM Checks if the DIR is already made
IF exist %Lookup% ( echo Conflicts folder exists ) ELSE ( mkdir %Lookup% && echo Conflicts created)
REM Sets the variable for str2 to CONFLICTS @
set /p str2=Who are you looking up?:
Rem SET str3=overwrite
Set file=server.log
Rem set Conflicts_@="%Lookup%\CONFLICT @.txt"
REM Finds all with conflicts in the FML 0 file and out puts them to where the variable %Conflicts%\conflicts.txt to
Echo Looking for %str2%
findstr /s /c:"%str2%" %file% > "%Lookup%\%str2%.txt"
if errorlevel 1 ( echo Not Found "%str2%")
if not errorlevel 1 ( echo found "%str2%")
Rem echo Looking for %str3%
Rem findstr /s /c:"%str3%" %file% > "%Lookup%\%str3%.txt"
Rem if errorlevel 1 ( echo Not Found "%str3%")
Rem if not errorlevel 1 ( echo found "%str3%")
cd %Lookup%
rem IF exist %Conflicts_@% ( copy %Conflicts_@%+conflicts.txt conflicts.txt ) ELSE ( echo "No need to merge")
Rem for /f "tokens=1-5 delims=:" %%d in ("%time%") do rename "conflicts.txt" %%d-%%e.txt
Rem del %Conflicts_@%
%Lookup%\%str2%.txt"

REM ren %Conflicts_@% Conflicts.txt
@pause
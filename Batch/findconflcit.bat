@echo off
REM Sets the Directory base to your desktop
Set DirBase="%USERPROFILE%\Desktop"
for /f "skip=8 tokens=2,3,4,5,6,7,8 delims=: " %%D in ('robocopy /l * \ \ /ns /nc /ndl /nfl /np /njh /XF * /XD *') do (
 set "dow=%%D"
 set "month=%%E"
 set "day=%%F"
 set "HH=%%G"
 set "MM=%%H"
 set "SS=%%I"
 set "year=%%J"
)

REM echo Day of the week: %dow%
REM echo Day of the month : %day%
REM echo Month : %month%
REM echo hour : %HH%
Rem echo minutes : %MM%
REM echo seconds : %SS%
REM echo year : %year%
set /p str2=whats the name of your mod pack?:
REM Sets the Variable for Conflicts to YourDesktop\conflicts\Year\Month\Day\
SET Conflicts="%DirBase%\Minecraft\conflicts\%year%\%month%\%day%\%str2%"
REM Checks if the DIR is already made
IF exist %Conflicts% ( echo Conflicts folder exists ) ELSE ( mkdir %Conflicts% && echo Conflicts created)
REM IF exist %Conflicts% ( echo Conflicts exists ) ELSE ( mkdir Conflicts && echo myDirName created)
REM Sets the variable for str2 to CONFLICTS @
SET str2=CONFLICT @
rem Sets the variable str3 to overwrite
SET str3=overwrite
Rem Sets the Variable str4 to overwriting
SET str4=overwriting
rem sets the variable file to ForgeModLoader-client-0.log
Set file=ForgeModLoader-client-0.log
rem the variable Conflicts_@ to %Conflicts%\CONFLICT @.txt
set Conflicts_@="%Conflicts%\CONFLICT @.txt"
REM Finds all with conflicts in the FML 0 file and out puts them to where the variable %Conflicts%\conflicts.txt to
echo Looking for %str2% > "%Conflicts%\%str2%.txt"
findstr /s /c:"%str2%" %file% >> "%Conflicts%\%str2%.txt"
if errorlevel 1 ( echo Not Found "%str2%")
if not errorlevel 1 ( echo found "%str2%")
rem looks for what is defined in the variable str3
echo Looking for %str3% > %Conflicts%\%str3%.txt
findstr /s /c:"%str3%" %file% >> "%Conflicts%\%str3%.txt"
if errorlevel 1 ( echo Not Found "%str3%")
if not errorlevel 1 ( echo found "%str3%")
rem looks for what is defined in the variable str4
echo Looking for %str4% > %Conflicts%\%str3%.txt
findstr /s /c:"%str4%" %file% >> "%Conflicts%\%str4%.txt"
if errorlevel 1 ( echo Not Found "%str4%")
if not errorlevel 1 ( echo found "%str4%")
rem changes the directory to the variable to Conflicts
cd %Conflicts%
REM IF exist %Conflicts_@% ( copy "%str2%.txt" + %str3%.txt "conflicts.txt" ) ELSE ( echo "No need to merge")
Rem for /f "tokens=1-5 delims=:" %%d in ("%time%") do rename "conflicts.txt" %%d-%%e.txt && echo Renamed
type %Conflicts_@% > conflicts.txt
type %str3%.txt >> conflicts.txt
type %str4%.txt >>conflicts.txt
rem copy /b *.txt conflicts.txt
rename "conflicts.txt" %HH%-%MM%.txt && echo Renamed
del %Conflicts_@%
del %str3%.txt
%Conflicts%\%HH%-%MM%.txt
@pause

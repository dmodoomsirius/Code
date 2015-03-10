 @echo off
setlocal 
for /f "skip=8 tokens=2,3,4,5,6,7,8 delims=: " %%D in ('robocopy /l * \ \ /ns /nc /ndl /nfl /np /njh /XF * /XD *') do (
 set "dow=%%D"
 set "month=%%E"
 set "day=%%F"
 set "HH=%%G"
 set "MM=%%H"
 set "SS=%%I"
 set "year=%%J"
)

echo Day of the week: %dow%
echo Day of the month : %day%
echo Month : %month%
echo hour : %HH%
echo minutes : %MM%
echo seconds : %SS%
echo year : %year%
endlocal
@pause
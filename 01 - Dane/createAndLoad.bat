sqlplus %1 @buildDB.sql
cd ctl
for %%f in (*.ctl) do (
    sqlldr CONTROL=%%f  log=../logs/%%~nf.log bad=../bads/%%~nf.log  skip=1 userid=%1
)
cd..
set startPath=%CD%

cd c:\Source\Neo
call Clean.bat
if errorlevel 1 goto finish

cd c:\Source\Legacy
call Clean.bat
if errorlevel 1 goto finish

:finish
cd "%startPath%"
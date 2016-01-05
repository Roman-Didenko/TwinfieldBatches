set startPath=%CD%

call go-to-source.cmd
set currentPath=%CD%

cd "%currentPath%\Neo"
call Clean.bat
if errorlevel 1 goto finish

cd "%currentPath%\Legacy"
call Clean.bat
if errorlevel 1 goto finish

:finish
cd "%startPath%"
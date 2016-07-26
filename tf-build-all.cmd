set startPath=%CD%

call go-to-source.cmd
set currentPath=%CD%

cd "%currentPath%\Neo"
powershell -File Install-Packages.ps1 || goto finish
call build.bat 2>&1
if errorlevel 1 goto finish


cd "%currentPath%\VatProjectionService"
call build.bat 2>&1
if errorlevel 1 goto finish

cd "%currentPath%\TwinfieldUI\Build"
powershell -File Install-Prerequisites.ps1  || goto finish

for /F "tokens=*" %%A in (%startPath%\services.txt) do (
  echo %%A
  cd "%currentPath%\%%A"
  
  if exist Install-Packages.ps1 (powershell -File Install-Packages.ps1 || goto finish)
  
  call build.bat 2>&1
  if errorlevel 1 goto finish
)

cd "%currentPath%\Tools\ServiceManager\Twinfield.Tools.ServiceManager"
call msbuild Twinfield.Tools.ServiceManager.sln 

:finish
cd "%startPath%"
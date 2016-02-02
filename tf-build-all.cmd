set startPath=%CD%

call go-to-source.cmd
set currentPath=%CD%

cd "%currentPath%\Neo"
powershell -File Install-Packages.ps1 || goto finish
call build.bat
if errorlevel 1 goto finish


cd "%currentPath%\VatProjectionService"
powershell -File Install-Packages.ps1 || goto finish
call build.bat
if errorlevel 1 goto finish

cd "%currentPath%\TwinfieldUI\Build"
powershell -File Install-Prerequisites.ps1  || goto finish

for /F "tokens=*" %%A in (%startPath%\services.txt) do (
  echo %%A
  cd "%currentPath%\%%A"
  
  call build.bat
  if errorlevel 1 goto finish
)

cd "%currentPath%\Tools\ServiceManager\Twinfield.Tools.ServiceManager"
call msbuild Twinfield.Tools.ServiceManager.sln 

:finish
cd "%startPath%"
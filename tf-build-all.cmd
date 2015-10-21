set startPath=%CD%

cd c:\Source\Neo
powershell -File Install-Packages.ps1
call build.bat
if errorlevel 1 goto finish

cd c:\Source\Legacy
call build.bat
if errorlevel 1 goto finish

cd c:\Source\TwinfieldUI
call Build.Debug.bat

cd c:\Source\LegacyService
call build.bat
if errorlevel 1 goto finish

cd c:\Source\SalesProjectionService
call build.bat
if errorlevel 1 goto finish

cd c:\Source\PortfolioProjectionService
call build.bat
if errorlevel 1 goto finish

cd c:\Source\VatProjectionService
powershell -File Install-Packages.ps1
call build.bat
if errorlevel 1 goto finish

cd c:\Source\CompanyImportProjectionService
rem call build.bat
if errorlevel 1 goto finish

cd c:\Source\TenantManagementService
rem powershell -File Install-Packages.ps1
call build.bat
if errorlevel 1 goto finish
if errorlevel 1 goto finish

:finish
cd "%startPath%"
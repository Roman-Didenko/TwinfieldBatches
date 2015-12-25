set startPath=%CD%

cd c:\Source\CqrsCore
call build.bat
if errorlevel 1 goto finish

cd c:\Source\Neo
powershell -File Install-Packages.ps1 || goto finish
call build.bat
if errorlevel 1 goto finish

cd c:\Source\Legacy
call build.bat
if errorlevel 1 goto finish

cd c:\Source\TwinfieldUI 
call Build.bat || goto finish

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
powershell -File Install-Packages.ps1 || goto finish
call build.bat
if errorlevel 1 goto finish

cd c:\Source\CompanyImportProjectionService
call build.bat
if errorlevel 1 goto finish

cd c:\Source\TenantManagementService
rem powershell -File Install-Packages.ps1
call build.bat
if errorlevel 1 goto finish

cd c:\Source\BlobStorage
call build.bat
if errorlevel 1 goto finish

cd C:\Source\FixedAssetsReportingProjectionService\
call build.bat
if errorlevel 1 goto finish

:finish
cd "%startPath%"
rem @echo off
set startPath=%CD%

echo.

cd "%startPath%\..\Legacy"
call Windows.Groups.Setup.bat || goto finish
call Workspace.Setup.bat || goto finish
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%startPath%\..\Legacy\Install-Services.ps1""' -Verb RunAs}" || goto finish

cd "%startPath%\..\Neo"
call Workspace.Setup.bat || goto finish
call IIS.AdminUI.setup.bat || goto finish
call InstallServices.bat || goto finish

cd "%startPath%\..\FixedAssetsProjectionService"
call Install.bat || goto finish

cd "%startPath%\..\LegacyService"
call Install.bat || goto finish

cd "%startPath%\..\PortfolioProjectionService"
call Install.bat || goto finish

cd "%startPath%\..\SalesProjectionService"
call Install.bat || goto finish

cd "%startPath%\..\TenantManagementService"
call Install.bat || goto finish

cd "%startPath%\..\TwinfieldUI"
call Workspace.Setup.bat || goto finish

cd "%startPath%\..\VatProjectionService"
call Install.bat || goto finish

cd "%startPath%\..\CompanyImportProjectionService"
call Install.bat || goto finish

cd "%startPath%\..\BlobStorage"
call Install.bat || goto finish

:finish
cd "%startPath%"


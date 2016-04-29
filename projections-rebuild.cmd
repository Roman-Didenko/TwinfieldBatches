@echo off

set startPath=%CD%

call go-to-source.cmd
set currentPath=%CD%

cd "%currentPath%\CompaniesProjectionService"
Output\CompaniesProjection.Builder.Host\Twinfield.CompaniesProjection.Builder.Host.exe --init
if errorlevel 1 goto finish

cd "%currentPath%\Neo"
call Timeline.Rebuild.bat
if errorlevel 1 goto finish

call ProjectionStore.Rebuild.bat
if errorlevel 1 goto finish

cd "%currentPath%\PortfolioProjectionService"
Output\PortfolioProjection.Builder.Host\Twinfield.PortfolioProjection.Builder.Host.exe --init
rem call ProjectionStore.Rebuild.bat
if errorlevel 1 goto finish

cd "%currentPath%\SalesProjectionService"
Output\SalesProjection.Builder.Host\Twinfield.SalesProjection.Builder.Host.exe --init
rem call ProjectionStore.Rebuild.bat
if errorlevel 1 goto finish

cd "%currentPath%\VatProjectionService"
rem call ProjectionStore.Rebuild.bat
Output\VatProjection.Builder.Host\Twinfield.VatProjection.Builder.Host.exe --init
if errorlevel 1 goto finish

cd "%currentPath%\FixedAssetsProjectionService"
Output\FixedAssetsProjection.Builder.Host\Twinfield.FixedAssetsProjection.Builder.Host.exe --init
if errorlevel 1 goto finish

cd "%currentPath%\CompanyImportProjectionService"
Output\CompanyImportProjection.Builder.Host\Twinfield.CompanyImportProjection.Builder.Host.exe --init
if errorlevel 1 goto finish


:finish
cd "%startPath%"
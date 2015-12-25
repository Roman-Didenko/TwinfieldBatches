set startPath=%CD%

cd c:\Source\Neo
call Timeline.Rebuild.bat
if errorlevel 1 goto finish

call ProjectionStore.Rebuild.bat
if errorlevel 1 goto finish

cd c:\Source\PortfolioProjectionService
Output\PortfolioProjection.Builder.Host\Twinfield.PortfolioProjection.Builder.Host.exe --init
rem call ProjectionStore.Rebuild.bat
if errorlevel 1 goto finish

cd c:\Source\SalesProjectionService
Output\SalesProjection.Builder.Host\Twinfield.SalesProjection.Builder.Host.exe --init
rem call ProjectionStore.Rebuild.bat
if errorlevel 1 goto finish

cd c:\Source\VatProjectionService
rem call ProjectionStore.Rebuild.bat
Output\VatProjection.Builder.Host\Twinfield.VatProjection.Builder.Host.exe --init
if errorlevel 1 goto finish

cd C:\Source\FixedAssetsReportingProjectionService\
Output\FixedAssetsReportingProjection.Builder.Host\Twinfield.FixedAssetsReportingProjection.Builder.Host.exe --init
if errorlevel 1 goto finish


:finish
cd "%startPath%"
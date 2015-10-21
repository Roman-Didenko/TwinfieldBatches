cd c:/Source/LegacyService
git -c diff.mnemonicprefix=false -c core.quotepath=false reset -q --hard HEAD --
if errorlevel 1 goto finish

cd c:/Source/ProjectionServiceCore
git -c diff.mnemonicprefix=false -c core.quotepath=false reset -q --hard HEAD --
if errorlevel 1 goto finish

cd c:/Source/SalesProjectionService
git -c diff.mnemonicprefix=false -c core.quotepath=false reset -q --hard HEAD --
if errorlevel 1 goto finish

cd c:/Source/PortfolioProjectionService
git -c diff.mnemonicprefix=false -c core.quotepath=false reset -q --hard HEAD --
if errorlevel 1 goto finish

cd c:/Source/TenantManagementService
git -c diff.mnemonicprefix=false -c core.quotepath=false reset -q --hard HEAD --
if errorlevel 1 goto finish

cd c:/Source/VatProjectionService
git -c diff.mnemonicprefix=false -c core.quotepath=false reset -q --hard HEAD --
if errorlevel 1 goto finish

cd c:/Source/CompanyImportProjectionService
git -c diff.mnemonicprefix=false -c core.quotepath=false reset -q --hard HEAD --
if errorlevel 1 goto finish

cd c:/Source/Neo
git -c diff.mnemonicprefix=false -c core.quotepath=false reset -q --hard HEAD --
if errorlevel 1 goto finish

cd c:/Source/Legacy
git -c diff.mnemonicprefix=false -c core.quotepath=false reset -q --hard HEAD --
if errorlevel 1 goto finish

cd c:/Source/TwinfieldUI
git -c diff.mnemonicprefix=false -c core.quotepath=false reset -q --hard HEAD --
if errorlevel 1 goto finish

cd c:/Source/Tools
git -c diff.mnemonicprefix=false -c core.quotepath=false reset -q --hard HEAD --
if errorlevel 1 goto finish

cd c:/Source/CompanyImportProjectionService
git -c diff.mnemonicprefix=false -c core.quotepath=false reset -q --hard HEAD --
if errorlevel 1 goto finish

cd c:/Source/FixedAssetsReportingProjectionService
git -c diff.mnemonicprefix=false -c core.quotepath=false reset -q --hard HEAD --
if errorlevel 1 goto finish

:finish
cd c:/Source




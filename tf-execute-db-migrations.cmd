set startPath=%CD%

call go-to-source.cmd
set currentPath=%CD%

Legacy\wwwroot\bin\DatabaseMigrator\DatabaseMigrator.exe tenant || goto finish
Legacy\wwwroot\bin\DatabaseMigrator\DatabaseMigrator.exe platform || goto finish
Legacy\wwwroot\bin\DatabaseMigrator\DatabaseMigrator.exe cluster || goto finish

:finish
cd "%startPath%"


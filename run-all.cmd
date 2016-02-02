@echo off

call tf-clean-all.cmd > log.txt
find "Error:" log.txt 1>nul && goto error
find ": error " log.txt 1>nul && goto error

call tf-build-all.cmd > log.txt
find "Error:" log.txt 1>nul && goto error
find ": error " log.txt 1>nul && goto error

rd C:\Migrations /S /Q
call tf-execute-db-migrations.cmd > log.txt
find "Error " C:\Migrations\* 1>nul && goto error

goto:eof

:error
@echo logs contains next errors:
find "Error:" log.txt
find ": error " log.txt
find "Error" C:\Migrations\*
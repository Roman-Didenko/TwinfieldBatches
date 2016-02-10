@echo off

call tf-clean-all.cmd 2>&1 > log.txt
find "Error:" log.txt 1>nul && goto error
find ": error " log.txt 1>nul && goto error

call tf-build-all.cmd 2>&1 > log.txt
find "Error:" log.txt 1>nul && goto error
find ": error " log.txt 1>nul && goto error

goto:eof

:error
@echo log.txt contains next errors:
find "Error:" log.txt
find ": error " log.txt
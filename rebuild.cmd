@echo off

call tf-clean-all.cmd > log.txt
find "Error:" log.txt 1>nul && goto error
find ": error " log.txt 1>nul && goto error

call tf-build-all.cmd > log.txt
find "Error:" log.txt 1>nul && goto error
find ": error " log.txt 1>nul && goto error
find "errors during the processing" log.txt 1>nul && goto error
find " error:" log.txt 1>nul && goto error

goto:eof

:error
@echo log.txt contains next errors:
find "Error:" log.txt
find ": error " log.txt
find "errors during the processing" log.txt
find " error:" log.txt
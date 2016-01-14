@echo off
set startPath=%CD%

for /F "tokens=*" %%A in (repositories.txt) do (
  echo %%A
  cd "%startPath%\..\%%A"
  
  git -c diff.mnemonicprefix=false -c core.quotepath=false pull --no-commit origin master:master
  rem if errorlevel 1 goto finish
)

:finish
cd "%startPath%"
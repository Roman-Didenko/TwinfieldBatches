@echo off
set startPath=%CD%

for /F "tokens=*" %%A in (repositories.txt) do (
  echo %%A
  cd "%startPath%\..\%%A"
  
  git -c diff.mnemonicprefix=false -c core.quotepath=false checkout master
  if errorlevel 1 goto finish
  
  git -c diff.mnemonicprefix=false -c core.quotepath=false pull --no-commit --rebase origin master
  if errorlevel 1 goto finish
)

:finish
cd "%startPath%"
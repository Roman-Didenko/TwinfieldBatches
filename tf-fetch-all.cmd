@echo off
set startPath=%CD%

for /F "tokens=*" %%A in (repositories.txt) do (
  echo.
  echo %%A
  cd "%startPath%\..\%%A"
  
  git -c diff.mnemonicprefix=false -c core.quotepath=false fetch --prune --tags origin 2>&1
  if errorlevel 1 goto finish
)

:finish
cd "%startPath%"
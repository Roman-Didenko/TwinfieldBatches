@echo off
set startPath=%CD%

for /F "tokens=*" %%A in (repositories.txt) do (
  echo.
  echo %%A
  cd "%startPath%\..\%%A"
  
  git add .
  git -c diff.mnemonicprefix=false -c core.quotepath=false reset -q --hard HEAD --
  
  git -c diff.mnemonicprefix=false -c core.quotepath=false submodule update --init --recursive

  git -c diff.mnemonicprefix=false -c core.quotepath=false pull origin master:master 2>&1
  rem if errorlevel 1 goto finish
)

:finish
cd "%startPath%"
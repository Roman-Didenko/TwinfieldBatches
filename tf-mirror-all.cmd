@echo off
set startPath=%CD%

for /F "tokens=*" %%A in (repositories.txt) do (
  echo.
  echo %%A
  
  cd "%startPath%\.."
  
  git clone --mirror git@github.com:Twinfield/%%A.git 2>&1
  if errorlevel 1 goto finish
)

:finish
cd "%startPath%"
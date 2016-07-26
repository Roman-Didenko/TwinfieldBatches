@echo off
set startPath=%CD%

for /F "tokens=*" %%A in (repositories.txt) do (
  echo.
  echo %%A
  
  cd "%startPath%\..\"
  if errorlevel 1 goto finish
  
  git clone git@github.com:Twinfield/%%A.git 2>&1
  if errorlevel 1 goto finish
  
  cd "%startPath%\..\%%A"
  if errorlevel 1 goto finish
    
  git submodule update --init --recursive
  if errorlevel 1 goto finish
)

:finish
cd "%startPath%"
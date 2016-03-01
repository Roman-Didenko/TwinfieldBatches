@echo off
set startPath=%CD%

for /F "tokens=*" %%A in (repositories.txt) do (
  echo.
  echo %%A
  cd "%startPath%\..\%%A"
  
  git show d6f0f76b349ed44a43c3df6cb5aec84c673de049
)

:finish
cd "%startPath%"
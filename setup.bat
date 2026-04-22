@echo off
REM Modern Founder Skills - Setup Script (Windows)
REM Copies skills from this repo to the parent business folder's .claude\skills\
REM so Claude Code picks them up when you open your business folder.

setlocal EnableExtensions

set "REPO_DIR=%~dp0"
if "%REPO_DIR:~-1%"=="\" set "REPO_DIR=%REPO_DIR:~0,-1%"

set "PARENT_DIR=%REPO_DIR%\.."
set "SKILLS_SRC=%REPO_DIR%\.claude\skills"
set "SKILLS_DEST=%PARENT_DIR%\.claude\skills"

echo Modern Founder Skills - Setup
echo.
echo Copying skills from:
echo   %SKILLS_SRC%
echo to:
echo   %SKILLS_DEST%
echo.

if not exist "%SKILLS_SRC%" (
  echo ERROR: Could not find %SKILLS_SRC%
  echo Is this script being run from inside a clone of modern-founder-skills?
  exit /b 1
)

if not exist "%SKILLS_DEST%" mkdir "%SKILLS_DEST%"
xcopy "%SKILLS_SRC%" "%SKILLS_DEST%" /E /I /Y /Q

echo.
echo Done. Skills copied successfully.
echo.
echo Next: fully quit and reopen Antigravity.
echo Open your business folder, then type / in Claude Code to see the updated skills.
echo.
pause
